# User Configurable
$config_departure = "EKCH"
$config_arrival = "EKCH"
$config_invallid_squak
$departureslist = @()
$arrivalslist = @()

$request = "https://data.vatsim.net/v3/vatsim-data.json"

for(;;) 
{

$flight_plan = (Invoke-WebRequest $request | ConvertFrom-Json).pilots | Select-Object flight_plan, callsign, altitude
foreach ($plan in $flight_plan) {
    $callsign = $plan.callsign 
    $altitude = $plan.altitude
    $flight_plan = ($plan.flight_plan)
    $departure = ($plan.flight_plan).departure
    $departure_time = ($plan.flight_plan).deptime
    $enroute_time = ($plan.flight_plan).enroute_time
    $arrival = ($plan.flight_plan).arrival
    $model = ($plan.flight_plan).aircraft_short

    if ($departure -eq $config_departure) {
        # Departure Time(est) departure Airframe Departure-Airport Arrival-Airport
        $departureslist += $departures 
    }

    if ($arrival -eq $config_arrival) {
        # Arrival Time(est) Callsign Airframe Departure-Airport Arrival-Airport
        $arrivalslist += $arrival
    }
    
}

cls
Write-Host "Depatures: "$departureslist.Count
Write-Host "Arrivals: "$arrivalslist.Count
sleep 5
$departureslist = @()
$arrivalslist = @()
}

