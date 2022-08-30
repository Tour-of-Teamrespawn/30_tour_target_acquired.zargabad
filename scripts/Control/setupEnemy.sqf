TOUR_warLocNum = ceil random 9;
publicVariable "TOUR_warLocNum";

TOUR_warLordCentre = format ["TOUR_mkrLocation_%1", TOUR_warLocNum];
TOUR_warlordFake setposATL getMarkerPos TOUR_WarLordCentre;

_wh = [TOUR_warLordCentre, 50] execVM "scripts\control\setupWarlordHouse.sqf";
waitUntil {scriptDone _wh};

_eh = ["TOUR_mkrAO", EAST, 20, 25] execVM "scripts\control\setupEnemyHouse.sqf";

_v = execVM "scripts\control\setupEnemyVehicle.sqf";

private ["_faction", "_marker", "_types_array", "_class_type", "_group_type", "_type", "_number", "_rndpos", "_safepos", "_grp", "_pat_distance", "_initdone", "_guardpos"];

_faction = "UK3CB_TKM_O";
_safepos = [0,0,0];
TOUR_mission_groups = [];
TOUR_mission_units = [];

_group_type = 				
[
	["infantry", "UK3CB_TKM_O_RIF_Sentry"],
	["infantry", "UK3CB_TKM_O_IED_Sentry"],
	["infantry", "UK3CB_TKM_O_AT_Sentry"],
	["infantry", "UK3CB_TKM_O_AR_Sentry"],
	["infantry", "UK3CB_TKM_O_MG_Sentry"],
	["infantry", "UK3CB_TKM_O_UGL_Sentry"],
	["infantry", "UK3CB_TKM_O_AT_FireTeam"],
	["infantry", "UK3CB_TKM_O_UGL_FireTeam"],
	["infantry", "UK3CB_TKM_O_MG_FireTeam"],
	["infantry", "UK3CB_TKM_O_RIF_FireTeam"],
	["infantry", "UK3CB_TKM_O_MK_FireTeam"],
	["infantry", "UK3CB_TKM_O_AR_FireTeam"]
];

_patPoints = [];
for "_p" from 1 to 8 do
{
	_patPoints set [count _patPoints, getMarkerPos format ["TOUR_mkrLocation_%1", _p]];
};

for "_i" from 1 to 5 do
{
	_spawn = _patPoints call BIS_fnc_selectRandom;
	_patPoints = _patPoints - [_spawn];
	_type = _group_type call BIS_fnc_selectRandom;
	_grp = [_spawn, EAST, (configFile >> "CfgGroups" >> "EAST" >> _faction >> (_type select 0) >> (_type select 1))] call BIS_fnc_spawnGroup;
	waitUntil {(count units _grp > 0)};
	{
		//sort out accuracy and skill and loadouts if needed
		_x call Tour_fnc_garbageEH;
		_x call TOUR_fnc_loadouts;
	}forEach units _grp;
	[_grp, _spawn, 120]spawn TOUR_fnc_rndpatrol;
	sleep 2;
};

TOUR_alert_trigger = createTrigger["EmptyDetector", getMarkerPos "TOUR_mkrWarlord"]; 
TOUR_alert_trigger setTriggerArea[150,150,0,false];
TOUR_alert_trigger setTriggerActivation["WEST","PRESENT",false];
TOUR_alert_trigger setTriggerStatements["this", "_v = [] execVM 'scripts\control\setupEnemyVehicleAlert.sqf'; _a = [] execVM 'scripts\control\setupEnemyAlert.sqf';", ""];


