_this addEventHandler ["KILLED", {_this spawn TOUR_fnc_garbage;}];
if (side _this == CIVILIAN) then
{
	_this addEventHandler ["KILLED", 
	{
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		if ((("TOUR_objCiv" call BIS_fnc_taskState) != "failed") && (side _instigator == WEST)) then 
		{
			[] spawn
			{
				sleep 4;
				["TOUR_objCiv", "failed", true] call BIS_fnc_taskState;
			};
		};
	}];
};
