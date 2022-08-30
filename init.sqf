/* 
###MISSION_VERSION 2.1
*/

_d = execVM "scripts\general\debugRPT.sqf";
waitUntil {scriptDone _d};

_p = execVM "params.sqf";
waitUntil {scriptDone _p};

_a = TOUR_Core execVM "a2s_multitask.sqf";
waitUntil {scriptDone _a};

enableRadio false;
{
	_x setVariable ["BIS_noCoreConversations",true];
} forEach allUnits;

TOUR_HQ = [WEST, "HQ"];

_fn = execVM "scripts\functions\functions_init.sqf";
waitUntil {scriptDone _fn};

setViewDistance 500;

execVM "scripts\general\repairLoop.sqf";

if (isServer) then
{	
	_g = execVM "scripts\control\garbageLoop.sqf";
	waitUntil {!isNil "TOUR_mission_Units"};
	_o = execVM "scripts\control\setupObjectives.sqf";

	_cp = ["TOUR_mkrAO"] execVM "scripts\ambientLife\createPedestrians.sqf";
	waitUntil {scriptDone _cp};
	
	//_cd = 5 execVM "scripts\ambientLife\createVehicles.sqf";
	
	_e =  execVM "scripts\control\setupEnemy.sqf";
	
	[group TOUR_SV_man_1, getMarkerPos "TOUR_mkrHeliService", "air", 10] execFSM"scripts\TOUR_service\service.fsm";
	
	execVM "scripts\control\endingDead.sqf";
	
	["TOUR_mkrAO", 3, 5, TOUR_Core, WEST] execVM "scripts\TOUR_IED\bombsCreateArea.sqf";
	
};

execVM "scripts\general\intro.sqf";

execVM "scripts\general\table.sqf";

if (!isDedicated) then
{
	[] call A2S_tasksSync;

	player playaction "stand";

	[] execVM "scripts\TOUR_IED\init.sqf";

	_l = player execVM "scripts\loadouts\init.sqf";
	waitUntil {scriptDone _l};

	execVM "scripts\general\dust.sqf";

	TOUR_mission_color = ppEffectCreate ["Colorcorrections", 1200];  
	TOUR_mission_color ppEffectAdjust [1, 0.8, -0.001, [0.0, 0.0, 0.0, 0.0], [0.9, 0.9, 0.6, 0.65], [0.8, 0.8, 0.6, 0.4]];  
	TOUR_mission_color ppEffectCommit 0;  
	TOUR_mission_color ppEffectEnable true; 

	TOUR_officer addAction ["Report In", "scripts\control\endingPlayer.sqf", 0, 10, true, false, "", "(isNil {TOUR_core getVariable 'TOUR_task_reportIn'}) && (player==leader group player) && ({(alive _x)&&((vehicle _x) distance (getMarkerPos ""TOUR_mkrFOB"") > 250)}count (playableUnits + switchableUnits) == 0) && (cursorTarget == _target) && (player distance _target < 2)"];

	waitUntil {!isNil "TOUR_warLocNum"};
	#include "briefing.hpp";
	
	execVM "scripts\general\medicTent.sqf";
	
};


