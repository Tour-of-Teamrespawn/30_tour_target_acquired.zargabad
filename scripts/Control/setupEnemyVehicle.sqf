private ["_positions", "_pos", "_type_array", "_number", "_grp"];

_positions = [[4280.79,4215.08,0],[4199.72,4215.39,0],[4199.32,4102.55,0],[4276.85,4106.28,0],[4263.34,4030.45,0],[4529.4,4233,0],[4296.64,4407.5,0],[4173,4289.13,0],[3884.36,4335.38,0],[4155.56,4034.06,0],[4171.43,3868.14,0],[3870.46,4010.44,0],[4507.11,3948.6,0]];
_type_array = 				
[
	"UK3CB_TKM_O_UAZ_Dshkm",
	"UK3CB_TKM_O_UAZ_SPG9"
];

for "_v" from 1 to (1 + (floor (random 3))) do
{
	_pos = _positions call BIS_fnc_selectRandom;
	_positions = _positions - [_pos];
	_veh = createVehicle [_type_array call BIS_fnc_selectRandom, _pos, [], random 360, "NONE"];
	_grp = createVehicleCrew _veh;
	
	waitUntil {(count units _grp > 0)};
	{
		//sort out accuracy and skill and loadouts if needed
		_x call Tour_fnc_garbageEH;
		_x call TOUR_fnc_loadouts;
	}forEach units _grp;
	sleep 1;
};