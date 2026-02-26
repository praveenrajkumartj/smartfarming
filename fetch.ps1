$req = [System.Net.WebRequest]::Create('https://lite.duckduckgo.com/lite/')
$req.Method = 'POST'
$req.ContentType = 'application/x-www-form-urlencoded'
$req.UserAgent = 'Mozilla/5.0'
$bytes = [System.Text.Encoding]::ASCII.GetBytes('q=site:youtube.com+"organic farming"')
$req.ContentLength = $bytes.Length
$stream = $req.GetRequestStream()
$stream.Write($bytes, 0, $bytes.Length)
$stream.Close()
$resp = $req.GetResponse()
$reader = New-Object System.IO.StreamReader($resp.GetResponseStream())
$html = $reader.ReadToEnd()
[regex]::Matches($html, 'v=([a-zA-Z0-9_-]{11,})') | ForEach-Object { $_.Groups[1].Value } | Select-Object -Unique | Select-Object -First 4
