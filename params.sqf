if (isMultiplayer) then 
{
	//mulitplayer

	//Respawn time
	TOUR_respawnTime = (paramsArray select 0);
	
	//Lives
	TOUR_respawnTickets = [(paramsArray select 1),(paramsArray select 1),(paramsArray select 1),(paramsArray select 1)];

	//Time of Day
	TOUR_TOD = (paramsArray select 2);
	
}else
{
	//singleplayer
	
	//Respawn time
	TOUR_respawnTime = 30;
	
	//lives
	TOUR_respawnTickets = [1,1,1,1];

	//Time of Day
	TOUR_TOD = 1;	
};

if (isServer) then
{
	_timeAdd = switch (TOUR_TOD) do
	{
		case 0: {-8};	//sunrise
		case 1: {0};	//noon
		case 2: {7};	//sunset
		case 3: {11};	//night
		case 4: {[0, -8, 7, 11] call BIS_fnc_selectRandom};	//random
	};
	skipTime _timeAdd;
	if (_timeadd == 11) then
	{
		[0, {0 setFog 0; setViewDistance 300;}]call remoteExec ["BIS_fnc_Spawn", 0, true];
	};
};

_rc = [TOUR_respawnTickets, TOUR_respawnTime]execVM "scripts\TOUR_RC\init.sqf";
waitUntil {scriptDone _rc};