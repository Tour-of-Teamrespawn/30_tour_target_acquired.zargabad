private ["_faction", "_marker", "_types_array", "_class_type", "_group_type", "_type", "_number", "_rndpos", "_safepos", "_grp", "_pat_distance", "_initdone", "_guardpos", "_wp1", "_wp2"];

_faction = "UK3CB_TKM_O";
_initdone = false;
_count =  0;
_safepos = [0,0,0];
TOUR_mission_groups = [];
TOUR_mission_units = [];

_guardpos = getMarkerPos TOUR_warLordCentre;

_patPoints = [];
for "_m" from 1 to 9 do
{
	_patPoints set [count _patPoints, getMarkerPos format ["TOUR_mkrMSpawn_%1", _m]];
};

_array_type = 
[
	"UK3CB_TKM_O_SL",
	"UK3CB_TKM_O_TL",
	"UK3CB_TKM_O_MD",
	"UK3CB_TKM_O_MG",
	"UK3CB_TKM_O_AR",
	"UK3CB_TKM_O_AT",
	"UK3CB_TKM_O_AA",
	"UK3CB_TKM_O_AT",
	"UK3CB_TKM_O_AT",
	"UK3CB_TKM_O_AT",
	"UK3CB_TKM_O_AT",
	"UK3CB_TKM_O_AT",
	"UK3CB_TKM_O_AT",
	"UK3CB_TKM_O_MK",
	"UK3CB_TKM_O_SNI",
	"UK3CB_TKM_O_SPOT",
	"UK3CB_TKM_O_ENG",
	"UK3CB_TKM_O_DEM",
	"UK3CB_TKM_O_IED",
	"UK3CB_TKM_O_RIF_1",
	"UK3CB_TKM_O_RIF_2",
	"UK3CB_TKM_O_GL"
];

TOUR_firstAlert = false;


while {true} do
{
	waitUntil {count TOUR_mission_units < 30};

	_safepos = [0,0,0];
	while {str _safepos == "[0,0,0]"} do
	{
		_pos = _patPoints call BIS_fnc_selectRandom;
		if (({(alive _x) && (_x distance _pos < 300)}count playableUnits + switchableUnits == 0) && ({alive _x}count (nearestObjects [_pos, ["man"], 2]) == 0)) exitWith
		{
			_safePos = _pos;
		};
	};
	_grp = createGroup EAST;
	_type = _array_type call BIS_fnc_selectRandom;

	for "_e" from 1 to 4 do
	{
		_spawnPos = getMarkerPos "TOUR_mkrDefaultSpawn";
		{
			_house = _x;
			{
				if (((str (_house buildingPos _x)) != "[0,0,0]")&&((count (nearestObjects [(_house buildingPos _x),["man"], 1.5])) == 0)) exitWith {_spawnPos = (_house buildingPos _x)};
			}forEach [1,2,3,4];
		}forEach (nearestObjects [_safePos, ["house"], 60]);
		_unit = _grp createUnit [_type, _spawnPos, [], 0, "NONE"];
	};
	TOUR_mission_groups set [count TOUR_mission_groups, _grp];

	waitUntil {(count units _grp > 0)};

	{
		//sort out accuracy and skill and loadouts if needed
		_x call Tour_fnc_garbageEH;
		_x call TOUR_fnc_loadouts;
		Tour_mission_units set [count Tour_mission_units, _x];
	}forEach units _grp;

	if ((vehicle TOUR_warlord distance (TOUR_wlPosArray select 1)) < 400) then
	{
		_wp1 = _grp addWaypoint [[getPosATL TOUR_warlord select 0, getPosATL TOUR_warLord select 1], 50];
	}else
	{
		_wp1 = _grp addWaypoint [(TOUR_wlPosArray select 1), 50];
	};
	_wp1 setWaypointType "MOVE";
	_wp1 setWaypointBehaviour "AWARE";
	_wp1 setWaypointCombatMode "RED";
	_wp1 setWaypointSpeed "FULL";
	
	_wp2 = _grp addWaypoint [getPosATL TOUR_warlord, 50];
	_wp2 setWaypointType "GUARD";
	_wp2 setWaypointBehaviour "AWARE";
	_wp2 setWaypointCombatMode "RED";
	_wp2 setWaypointSpeed "FULL";
	
	TOUR_firstAlert = true;
};