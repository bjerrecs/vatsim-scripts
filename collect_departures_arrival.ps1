# User Configurable
$config_departure = "EGLL"
$config_arrival = "EGLL"
$config_invallid_squak

# Clear txt files
Remove-Item .\atc_departures.txt
Remove-Item .\atc_arrivals.txt

$request = "https://data.vatsim.net/v3/vatsim-data.json"
$flight_plan = (Invoke-WebRequest $request | ConvertFrom-Json).pilots | Select-Object flight_plan, callsign, altitude
foreach ($plan in $flight_plan) {
    $callsign = $plan.callsign 
    $altitude = $plan.altitude
    $flight_plan = ($plan.flight_plan)
    $departure = ($plan.flight_plan).departure
    $arrival = ($plan.flight_plan).arrival
    $model = ($plan.flight_plan).aircraft_short

    if (($departure -eq $config_departure) -and ($altitude -le "1500")) {
        $departures = "$callsign $model $departure/$arrival"
        Add-Content .\atc_departures.txt $departures
        Write-Host $departures
    }

    if (($arrival -eq $config_arrival) -and ($altitude -ge "1500")) {
        $arrivals = "$callsign $model $departure/$arrival"
        Add-Content .\atc_arrivals.txt $arrivals
        Write-Host $arrivals
    }
    
}