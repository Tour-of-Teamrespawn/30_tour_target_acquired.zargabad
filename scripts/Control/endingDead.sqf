sleep 2;
while {!TOUR_RC_WEST_dead} do
{
	// if and everyone is incapacitated then Number of tickets left are equal to 0 
	sleep 2;
};

if ("TOUR_objCiv" call A2S_taskState != "failed") then
{
	["TOUR_objCiv", "SUCCEEDED"] call A2S_setTaskState;
	"TOUR_objCiv" call A2S_taskCommit;
	sleep 2;
	"TOUR_objCiv" call A2S_taskHint;
	sleep 3;
};

if ("TOUR_objHVT" call A2S_taskState != "SUCCEEDED") then
{
	["TOUR_objHVT", "failed"] call A2S_setTaskState;
	"TOUR_objHVT" call A2S_taskCommit;
	sleep 2;
	"TOUR_objHVT" call A2S_taskHint;
	sleep 3;
};

if (TOUR_RC_WEST_dead) then
{
	"kia" remoteExecCall ["BIS_fnc_endMissionServer", 0, true];	
}else
{
	if ("TOUR_objHVT" call A2S_taskState == "SUCCEEDED") then
	{
		if ("TOUR_objCiv" call A2S_taskState == "SUCCEEDED") then
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