["TOUR_objHVT", {"Capture HVT"}] call A2S_createSimpleTask;
["TOUR_objHVT", {"Capture the HVT located somewhere in <marker name=""TOUR_mkrWarlord"">these buildings</marker> and return to the <marker name=""TOUR_mkrFOB"">FOB</marker>."}, {"Capture HVT"}, {"Capture HVT"}] call A2S_setSimpleTaskDescription;
"TOUR_objHVT" call A2S_taskCommit;

["TOUR_objCiv", {"Protect Civilians"}] call A2S_createSimpleTask;
["TOUR_objCiv", {"Ensure there are no civilian casulaties."}, {"Protect Civilians"}, {"Protect Civilians"}] call A2S_setSimpleTaskDescription;
"TOUR_objCiv" call A2S_taskCommit;

while {(TOUR_Warlord distance (getMarkerPos "TOUR_mkrFOB") > 100) && (alive TOUR_Warlord)} do
{
	sleep 1;
};

sleep 2;

if (alive TOUR_Warlord) then
{
	["TOUR_objHVT", "SUCCEEDED"] call A2S_setTaskState;
	"TOUR_objHVT" call A2S_taskCommit;
	sleep 2;
	"TOUR_objHVT" call A2S_taskHint;
}else
{
	["TOUR_objHVT", "FAILED"] call A2S_setTaskState;
	"TOUR_objHVT" call A2S_taskCommit;
	sleep 2;
	"TOUR_objHVT" call A2S_taskHint;
};