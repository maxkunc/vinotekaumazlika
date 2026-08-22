param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot),
    [int]$Port = 8791
)

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$Port/")
$listener.Start()
Write-Host "Serving $Root on http://localhost:$Port/"

$mime = @{
    ".html" = "text/html; charset=utf-8"
    ".css"  = "text/css"
    ".js"   = "application/javascript"
    ".json" = "application/json"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
    ".jpeg" = "image/jpeg"
    ".webp" = "image/webp"
    ".svg"  = "image/svg+xml"
    ".ttf"  = "font/ttf"
    ".otf"  = "font/otf"
    ".txt"  = "text/plain"
}

while ($listener.IsListening) {
    $context = $listener.GetContext()
    $request = $context.Request
    $response = $context.Response
    try {
        $path = [System.Uri]::UnescapeDataString($request.Url.AbsolutePath)
        $filePath = Join-Path $Root ($path.TrimStart("/"))
        $filePath = [System.IO.Path]::GetFullPath($filePath)
        if (-not $filePath.StartsWith([System.IO.Path]::GetFullPath($Root))) {
            $response.StatusCode = 403
            $response.Close()
            continue
        }
        if (Test-Path $filePath -PathType Container) {
            $filePath = Join-Path $filePath "index.html"
        } elseif (-not (Test-Path $filePath -PathType Leaf)) {
            $candidate = Join-Path $filePath "index.html"
            if (Test-Path $candidate -PathType Leaf) { $filePath = $candidate }
        }
        if (Test-Path $filePath -PathType Leaf) {
            $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
            $contentType = $mime[$ext]
            if (-not $contentType) { $contentType = "application/octet-stream" }
            $response.ContentType = $contentType
            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            $response.ContentLength64 = $bytes.Length
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            $response.StatusCode = 404
            $notFound = [System.Text.Encoding]::UTF8.GetBytes("Not found: $path")
            $response.OutputStream.Write($notFound, 0, $notFound.Length)
        }
    } catch {
        $response.StatusCode = 500
    } finally {
        $response.Close()
    }
}
