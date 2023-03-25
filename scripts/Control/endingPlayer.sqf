_player = _this select 0;
_officer = _this select 1;
_action = _this select 2;

if (!isDedicated) then
{
	TOUR_officer removeAction _action;
};

_player directSay "TOUR_reportingback";
sleep 5;
_officer directSay "TOUR_welcomeback";
sleep 5;

if ("TOUR_objHVT" call BIS_fnc_taskState != "SUCCEEDED") then
{
	if (isServer) then
	{
		sleep 2;
		["TOUR_objHVT", "failed", true] call BIS_fnc_taskSetState;	
	};
	_player directSay "TOUR_playernotgood";
	sleep 5;
	_officer directSay "TOUR_officernotgood";
}else
{
	_player directSay "TOUR_playergood";
	sleep 5;
	_officer directSay "TOUR_officergood";
};

sleep 3;

if ("TOUR_objCiv" call BIS_fnc_taskState != "failed") then
{
	sleep 2;
	["TOUR_objCiv", "SUCCEEDED", true] call BIS_fnc_taskSetState;
};

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
