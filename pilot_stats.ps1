# User Configurable
$config_callsign = "QFA10"

$request = "https://data.vatsim.net/v3/vatsim-data.json"
$data = (Invoke-WebRequest $request | ConvertFrom-Json).pilots | Where-Object callsign -eq $config_callsign | Select-Object *
$altitude = $data.altitude
$groundspeed = $data.groundspeed
$squak = $data.transponder
$hdg = $data.heading
$qnh = $data.qnh_mb
$flight_plan = $data.flight_plan

Write-Host $flight_plan