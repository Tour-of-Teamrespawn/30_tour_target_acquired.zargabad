sleep 2;
while {!TOUR_RC_WEST_dead} do
{
	// if and everyone is incapacitated then Number of tickets left are equal to 0 
	sleep 2;
};

if ("TOUR_objCiv" call BIS_fnc_taskState != "failed") then
{
	sleep 2;
	["TOUR_objCiv", "SUCCEEDED", true] call BIS_fnc_taskSetState;
};

if ("TOUR_objHVT" call BIS_fnc_taskState != "SUCCEEDED") then
{
	sleep 2;
	["TOUR_objHVT", "failed", true] call BIS_fnc_taskSetState;
};
sleep 2;
if (TOUR_RC_WEST_dead) then
{
	"kia" remoteExecCall ["BIS_fnc_endMissionServer", 0, true];	
}else
{
	if ("TOUR_objHVT" call BIS_fnc_taskState == "SUCCEEDED") then
	{
		if ("TOUR_objCiv" call BIS_fnc_taskState == "SUCCEEDED") then
		{
			"complete" remoteExecCall ["BIS_fnc_endMissionServer", 0, true];
		}else
		{
			"PARTIAL" remoteExecCall ["BIS_fnc_endMissionServer", 0, true];
		};
	}else
	{
		"failed" remoteExecCall ["BIS_fnc_endMissionServer", 0, true];
	};
};