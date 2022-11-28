# User Configurable
$config_airport = "EGLL"

$request = "https://metar.vatsim.net/metar.php?id="+$config_airport
$flight_plan = (Invoke-WebRequest $request)
Write-Host $flight_plan