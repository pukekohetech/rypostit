$ErrorActionPreference = 'Stop'
$Port = 8765
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$Address = [System.Net.IPAddress]::Loopback
$Listener = [System.Net.Sockets.TcpListener]::new($Address, $Port)

function Get-ContentType([string]$Path) {
    switch ([System.IO.Path]::GetExtension($Path).ToLowerInvariant()) {
        '.html' { 'text/html; charset=utf-8' }
        '.js' { 'text/javascript; charset=utf-8' }
        '.json' { 'application/json; charset=utf-8' }
        '.webmanifest' { 'application/manifest+json; charset=utf-8' }
        '.png' { 'image/png' }
        '.svg' { 'image/svg+xml; charset=utf-8' }
        '.ico' { 'image/x-icon' }
        default { 'application/octet-stream' }
    }
}

function Write-Response($Stream, [int]$Status, [string]$Reason, [byte[]]$Body, [string]$ContentType, [bool]$SendBody = $true) {
    $Header = "HTTP/1.1 $Status $Reason`r`nContent-Type: $ContentType`r`nContent-Length: $($Body.Length)`r`nCache-Control: no-cache`r`nConnection: close`r`n`r`n"
    $HeaderBytes = [System.Text.Encoding]::ASCII.GetBytes($Header)
    $Stream.Write($HeaderBytes, 0, $HeaderBytes.Length)
    if ($SendBody -and $Body.Length -gt 0) { $Stream.Write($Body, 0, $Body.Length) }
    $Stream.Flush()
}

try {
    try {
        $Listener.Start()
    } catch {
        Write-Host "Could not start the local server on port $Port." -ForegroundColor Red
        Write-Host 'Another program may already be using that port. Close it and try again.'
        Read-Host 'Press Enter to close'
        exit 1
    }

    $Url = "http://127.0.0.1:$Port/"
    Write-Host ''
    Write-Host 'Post-it Reminder PWA test server is running.' -ForegroundColor Green
    Write-Host "Address: $Url"
    Write-Host 'Leave this window open while testing updates. Press Ctrl+C to stop.'
    Write-Host ''

    try { Start-Process 'msedge.exe' $Url } catch { Start-Process $Url }

    while ($true) {
        $Client = $Listener.AcceptTcpClient()
        try {
            $Stream = $Client.GetStream()
            $Reader = [System.IO.StreamReader]::new($Stream, [System.Text.Encoding]::ASCII, $false, 1024, $true)
            $RequestLine = $Reader.ReadLine()
            if ([string]::IsNullOrWhiteSpace($RequestLine)) { continue }
            while ($true) {
                $Line = $Reader.ReadLine()
                if ($null -eq $Line -or $Line.Length -eq 0) { break }
            }

            $Parts = $RequestLine.Split(' ')
            $Method = if ($Parts.Length -gt 0) { $Parts[0] } else { '' }
            if ($Parts.Length -lt 2 -or ($Method -ne 'GET' -and $Method -ne 'HEAD')) {
                $Body = [System.Text.Encoding]::UTF8.GetBytes('Method not allowed')
                Write-Response $Stream 405 'Method Not Allowed' $Body 'text/plain; charset=utf-8' ($Method -ne 'HEAD')
                continue
            }

            $RawPath = $Parts[1].Split('?')[0]
            $DecodedPath = [System.Uri]::UnescapeDataString($RawPath)
            if ($DecodedPath -eq '/') { $DecodedPath = '/index.html' }
            $RelativePath = $DecodedPath.TrimStart('/').Replace('/', [System.IO.Path]::DirectorySeparatorChar)
            $Candidate = [System.IO.Path]::GetFullPath((Join-Path $Root $RelativePath))
            $RootFull = [System.IO.Path]::GetFullPath($Root + [System.IO.Path]::DirectorySeparatorChar)

            if (-not $Candidate.StartsWith($RootFull, [System.StringComparison]::OrdinalIgnoreCase) -or -not (Test-Path -LiteralPath $Candidate -PathType Leaf)) {
                $Body = [System.Text.Encoding]::UTF8.GetBytes('Not found')
                Write-Response $Stream 404 'Not Found' $Body 'text/plain; charset=utf-8' ($Method -ne 'HEAD')
                continue
            }

            $Bytes = [System.IO.File]::ReadAllBytes($Candidate)
            Write-Response $Stream 200 'OK' $Bytes (Get-ContentType $Candidate) ($Method -ne 'HEAD')
        } catch {
            try {
                $Body = [System.Text.Encoding]::UTF8.GetBytes('Server error')
                Write-Response $Stream 500 'Internal Server Error' $Body 'text/plain; charset=utf-8'
            } catch {}
        } finally {
            if ($null -ne $Client) { $Client.Close() }
        }
    }
} finally {
    if ($null -ne $Listener) { $Listener.Stop() }
}
