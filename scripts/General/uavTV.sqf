if (isServer) then 
{
	TOUR_tv1 setVariable ["TOUR_pipEffect", 0, true];
};

if (!isDedicated) then
{
	_uav = TOUR_darter;
	_wp1 = (group _uav) addwaypoint [(TOUR_warlordFake getPos [200, 0]), 0];
	_uav flyInHeight 100;
	TOUR_tv1 setObjectTexture [0, "#(argb,512,512,1)r2t(uavrtt,1)"];
	_uav lockCameraTo [TOUR_warlordFake, [0]];

	TOUR_cam_1 = "camera" camCreate [0,0,0];
	TOUR_cam_1 cameraEffect ["Internal", "Back", "uavrtt"];
	TOUR_cam_1 attachTo [_uav, [0,0,0], "PiP0_pos"];
	TOUR_cam_1 camSetFov 0.7;

	"uavrtt" setPiPEffect [0];

	addMissionEventHandler ["Draw3D", {
		_dir = 
			(TOUR_darter selectionPosition "PiP0_pos") 
				vectorFromTo 
			(TOUR_darter selectionPosition "PiP0_dir");
		TOUR_cam_1 setVectorDirAndUp [
			_dir, 
			_dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]
		];
	}];

	TOUR_fnc_camSwitchMode = 
	{
		private ["_control", "_key", "_shift", "_ctrl", "_alt"];
		_control = _this select 0;
		_key = _this select 1;
		_shift = _this select 2;
		_ctrl = _this select 3;
		_alt = _this select 4;
		if (
				((_key == 203)or(_key == 205))
				&& !(_shift)&& !(_ctrl)&& !(_alt)
				&& (cursorTarget == TOUR_tv1)
				&& (player distance TOUR_tv1 < 2)
		) then
		{
			_effect = TOUR_tv1 getVariable "TOUR_pipEffect";
			
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
				_effect = 2;
			};
			if (_effect > 2) then
			{
				_effect = 0;
			};	
			TOUR_tv1 setVariable ["TOUR_pipEffect", _effect, true];
			[_effect, {"uavrtt" setPiPEffect [_this];TOUR_cam_1 cameraEffect ["Internal", "Back", "uavrtt"];}] remoteExec ["BIS_fnc_Spawn", 0, false];
		};
	};

	waitUntil {!isNull (findDisplay 46)};	
	(findDisplay 46) displayAddEventHandler ["keyDown", "_this CALL TOUR_fnc_camSwitchMode"];
};