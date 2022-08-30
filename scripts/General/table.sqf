sleep 10;

"TOUR_mkrObj" setMarkerPosLocal getPosATL TOUR_warlordFake;

if (!isNil "sebs_briefing_table_fnc_createTable") then
{
	if (!isDedicated) then
	{
		[TOUR_table, "TOUR_mkrObj", 40, 4, true, true, 0] call sebs_briefing_table_fnc_createTable;
	};
}else
{
	if (isServer) then
	{
		{
			deleteVehicle _x;
		}forEach (nearestObjects [TOUR_table, ["Land_CampingTable_small_F"], 10]);
	};
};