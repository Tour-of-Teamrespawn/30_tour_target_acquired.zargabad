[WEST, "TOUR_objHVT", [format ["Capture the HVT located somewhere in <marker name=""TOUR_mkrWarlord"">these buildings</marker> and return to the <marker name=""TOUR_mkrFOB"">FOB</marker>.", "asdf"], "Capture HVT", "TOUR_mkrWarlord"], getMarkerPos "TOUR_mkrWarlord", "CREATED", -1, false, "target"] call BIS_fnc_taskCreate;

[WEST, "TOUR_objCiv", [format ["Ensure there are no civilian casulaties.", "asdf"], "Protect Civilians", "asdf"], objnull, "CREATED", -1, false, "meet"] call BIS_fnc_taskCreate;

while {(TOUR_Warlord distance (getMarkerPos "TOUR_mkrFOB") > 100) or (isNil {TOUR_warlord getVariable "TOUR_HVTChecked"})} do
{
	sleep 1;
};

sleep 2;

if (alive TOUR_Warlord) then
{
	sleep 2;
	["TOUR_objHVT", "SUCCEEDED", true] call BIS_fnc_taskSetState;
};