# User Configurable
$config_callsign = "SAS29A"

$request = "https://data.vatsim.net/v3/vatsim-data.json"
$data = (Invoke-WebRequest $request | ConvertFrom-Json).pilots | Where-Object callsign -eq "AAL407" | Select-Object callsign, altitude, groundspeed, transponder, heading
$flight_plan = $data.flight_plan
Write-Host $flight_plan