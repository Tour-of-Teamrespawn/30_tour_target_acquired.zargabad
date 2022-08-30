if (isServer) then
{
	TOUR_tv2 setVariable ["TOUR_pipEffect", 0, true];
	waitUntil {{(side _x != sideLogic)} count (playableUnits + switchableUnits) > 0};
	_units = [];
	{
		if (side _x != sideLogic) then
		{
			_units = _units + [_x];
		};
	}forEach (playableUnits + switchableUnits);
	TOUR_camPlayer = _units select 0;
	[TOUR_camPlayer, {TOUR_camPlayer = _this}] remoteExec ["BIS_fnc_Spawn", 0, true];
};

if (!isDedicated) then
{
	waitUntil {!isNil "TOUR_camPlayer"};
	TOUR_tv2 setObjectTexture [0, "#(argb,512,512,1)r2t(headcam,1)"];
	TOUR_cam_2 = "camera" camCreate [0,0,0];
	TOUR_cam_2 cameraEffect ["Internal", "Back", "headcam"];
	TOUR_cam_2 attachTo [TOUR_camPlayer, [0,0,0], "head", true];
	TOUR_cam_2 camSetFov 1;
	"headcam" setPiPEffect [0];
	
	TOUR_fnc_camSwitchUnit = 
	{
		private ["_control", "_key", "_shift", "_ctrl", "_alt"];
		_control = _this select 0;
		_key = _this select 1;
		_shift = _this select 2;
		_ctrl = _this select 3;
		_alt = _this select 4;
		if (
				((_key == 200)or(_key == 208))
				&& !(_shift)&& !(_ctrl)&& !(_alt)
				&& (cursorTarget == TOUR_tv2)
				&& (player distance TOUR_tv2 < 2)
		) then
		{
			_oldUnit = false;
			_units = [];
			{
				if (side _x != sideLogic) then
				{
					_units = _units + [_x];
				};
			}forEach (playableUnits + switchableUnits);
			_total = count _units;
			
			{
				if (_x == TOUR_camPlayer) then
				{
					_oldUnit = true;
				};

				if ((_key == 208) && _oldUnit) exitWith
				{
					// pressing down
					if ((_forEachIndex + 1) == _total) then
					{
						TOUR_camPlayer = _units select 0;
					}else
					{
						TOUR_camPlayer = _units select (_forEachIndex + 1);
					};
				};
				
				if ((_key == 200) && _oldUnit) exitWith
				{
					// pressing up
					if ((_forEachIndex - 1) == -1) then
					{
						TOUR_camPlayer = _units select (_total -1);
					}else
					{
						TOUR_camPlayer = _units select (_forEachIndex - 1);
					};
				};
			}forEach _units;
			
			[TOUR_camPlayer, {if (!isDedicated) then {TOUR_camPlayer = _this; TOUR_cam_2 attachTo [TOUR_camPlayer, [0.1,-0.05,0.125], "head", true];TOUR_cam_2 cameraEffect ["Internal", "Back", "headcam"];};}] remoteExec ["BIS_fnc_Spawn", 0, false];
			
			_textHint = parseText format
			["
				<t size='1.25' font='puristaMedium' color='#0080ff' align='center' valign='top'>HEAD CAMERA:</t>
				<br/>
				<br/>
				<t size='1.25' font='puristaMedium' align='center' color='#3cb371' valign='top'>INFO!</t>
				<br/>
				<br/>
				<t size='0.85' font='TahomaB' color='#D0D0D0' align='center' valign='top'>Viewing:<br/><br/>%1<br/>%2</t>
			",name TOUR_camPlayer, groupID group TOUR_camPlayer];
			hint _textHint;
		};
		
		if (
				((_key == 203)or(_key == 205))
				&& !(_shift)&& !(_ctrl)&& !(_alt)
				&& (cursorTarget == TOUR_tv2)
				&& (player distance TOUR_tv2 < 2)
		) then
		{
			_effect = TOUR_tv2 getVariable "TOUR_pipEffect";
			
			if (_key == 205) then
			{
				_effect = _effect + 1;
			};
			if (_key == 203) then
			{
				_effect = _effect - 1;
			};		
			if (_effect < 0) then
			{
				_effect = 1;
			};
			if (_effect > 1) then
			{
				_effect = 0;
			};	
			TOUR_tv2 setVariable ["TOUR_pipEffect", _effect, true];
			[_effect, {if (!isDedicated) then {"headcam" setPiPEffect [_this];};}] remoteExec ["BIS_fnc_Spawn", 0, false];
		};
	};

	waitUntil {!isNull (findDisplay 46)};	
	(findDisplay 46) displayAddEventHandler ["keyDown", "_this CALL TOUR_fnc_camSwitchUnit"];
	
	_vehicle = vehicle TOUR_camPlayer;
	while {true} do
	{
		if (vehicle TOUR_camPlayer != _vehicle) then
		{
			TOUR_cam_2 attachTo [TOUR_camPlayer, [0.1,-0.05,0.125], "head", true];
			_vehicle = vehicle TOUR_camplayer;
		};
		sleep 0.1;
	};
};