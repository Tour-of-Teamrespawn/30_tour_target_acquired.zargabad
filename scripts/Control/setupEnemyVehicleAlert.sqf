private ["_markers", "_marker", "_type_array", "_number", "_grp"];

_markers = [];
for "_i" from 1 to 4 do
{
	_markers set [count _markers, format ["TOUR_mkrEVeh_%1", _i]];
};
_skill = 1;
_count =  0;
_type_array = 				
[
	"UK3CB_TKM_O_UAZ_Dshkm",
	"UK3CB_TKM_O_UAZ_SPG9"
];

_guardpos = getMarkerPos TOUR_warLordCentre;

for "_v" from 1 to (2 + (floor (random 2))) do
{
	_marker = _markers call BIS_fnc_selectRandom;
	_markers = _markers - [_marker];
	_veh = createVehicle [_type_array call BIS_fnc_selectRandom, getMarkerPos _marker, [], markerDir _marker, "NONE"];
	_grp = createVehicleCrew _veh;
	
	waitUntil {(count units _grp > 0)};
	{
		//sort out accuracy and skill and loadouts if needed
		_x call Tour_fnc_garbageEH;
		_x call TOUR_fnc_loadouts;
	}forEach units _grp;
	sleep 3;
	_wp = _grp addWaypoint [_guardpos, 0];
	_wp setWaypointCompletionRadius 50;
	_wp setWaypointType "GUARD";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointCombatMode "RED";
	_wp setWaypointSpeed "FULL";
	
	sleep 1;
};