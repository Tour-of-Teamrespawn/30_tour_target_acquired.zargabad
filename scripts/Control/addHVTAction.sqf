
[
	player,
	"Confirm Identity",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
	"(cursorTarget isKindof ""man"") && (isNil {cursorTarget getVariable ""TOUR_HVTChecked""}) && !(isPlayer cursorTarget) && (player distance cursorTarget < 2)",
	"(cursorTarget isKindof ""man"") && (isNil {cursorTarget getVariable ""TOUR_HVTChecked""}) && !(isPlayer cursorTarget) && (player distance cursorTarget < 2)",
	{},
	{},
	{
		cursorTarget setVariable ["TOUR_HVTChecked", true, true];
		[
			[cursorTarget, player],
			{
				if (_this select 0 == TOUR_warlord) then 
				{
					if (!alive TOUR_warlord) then 
					{
						(_this select 1) directSay "TOUR_HVTConfirmedKIA";
					}else 
					{
						(_this select 1) directSay "TOUR_HVTConfirmed";
					};
				}else 
				{
					(_this select 1) directSay "TOUR_HVTNotConfirmed";
				};
				if (isServer) then
				{
					null = [] spawn 
					{
						sleep 3;
						if !(alive TOUR_Warlord) then 
						{
							["TOUR_objHVT", "FAILED", true] call BIS_fnc_taskSetState;	
						};
					};
				};
			}
		] remoteExecCall
		[
			"BIS_fnc_Spawn",
			0,
			true
		];
	},
	{},
	[],
	3,
	6,
	false,
	false
] call BIS_fnc_holdActionAdd;