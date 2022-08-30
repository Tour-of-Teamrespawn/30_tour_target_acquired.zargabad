if (isDedicated) then
{
	[]spawn
	{
		sleep 45;
		execVM "scripts\general\uavTV.sqf";
		execVM "scripts\general\headcam.sqf";
	};
};

if (!isdedicated) then
{
	if (time > 5) exitWith
	{
		sleep 1;
		player playAction "stand";
		execVM "scripts\general\uavTV.sqf";
		execVM "scripts\general\headcam.sqf";
	};
	
	cutText ["Loading Intro","BLACK FADED", 0];
	0 fadeSound 0;
	waituntil {player == player};
	sleep 1;
	_pos1  = [4241.972,4145.130,11];
	_pos2  = [3821.287,4002.51,200];
	_pos3  = [4241.972,4145.130,300];
	_pos4  = [4240.972,4144.8,11];
	playSound "TOUR_introMusic";
	_cam1 = "camera" camCreate _pos1;
	_cam1 camprepareTarget _pos2; 
	_cam1 camCommitprepared 0;
	_cam1 cameraEffect ["internal", "back"];
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [5];
	"dynamicBlur" ppEffectCommit 0;
	sleep 1;
	cutText ["","BLACK FADED", 0];		
	sleep 1;	
	doStop player;
	if (getplayerUID player == "76561198062808142") then
	{
		cutText ["Cocks!","BLACK IN", 5];
	}else
	{
		cutText [" ","BLACK IN", 5];
	};
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 8;
	5 fadeSound 1;
	sleep 6;
	[]spawn 
	{
		sleep 5;
		_text = ["Z","a","r","g","a","b","a","d","\n","T","a","k","i","s","t","a","n"];
		_display = "";
		_pointer = 0;
		_sleepTime = 0.1;
		while {_pointer < count _text} do
		{
			_sleepTime = 0.1 + (random 0.05);
			_display = _display + (_text select _pointer);
			titleText [_display,"PLAIN down",_sleepTime];
			_pointer = _pointer + 1;
			if (_pointer == count _text) then
			{
				cutText [_display,"PLAIN down",1];
			}
			else
			{
				playSound "TOUR_key_noise";
			};
			sleep _sleepTime;
		};		

	};
	sleep 4;		
	_cam1 camSetPos _pos3;
	_cam1 camCommit 50;
	_cam1 camprepareTarget TOUR_warlordFake; 
	_cam1 camCommitprepared 8;
	sleep 10;
	cutText [" ","BLACK OUT", 2];
	sleep 2;
	_pos5 = (player getPos [130, (getDir player) + 180]);
	_cam1 camSetPos [_pos5 select 0, _pos5 select 1, 25];
	_cam1 camCommit 0;
	_cam1 camprepareTarget player; 
	_cam1 camCommitprepared 0;
	sleep 2;
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 3;
	sleep 0.1;
	cutText ["", "BLACK IN", 2];
	sleep 5; 
	[]spawn 
	{
		_text = ["U","S"," ","A","r","m","e","d"," ","F","o","r","c","e","s","\n","N","o","r","t","h"," ","o","f"," ","Z","a","r","g","a","b","a","d"];
		_display = "";
		_pointer = 0;
		_sleepTime = 0.1;
		while {_pointer < count _text} do
		{
			_sleepTime = 0.1 + (random 0.05);
			_display = _display + (_text select _pointer);
			titleText [_display,"PLAIN down",_sleepTime];
			_pointer = _pointer + 1;
			if (_pointer == count _text) then
			{
				cutText [_display,"PLAIN down",1];
			}
			else
			{
				playSound "TOUR_key_noise";
			};
			sleep _sleepTime;
		};		
	};	
	sleep 3;
	_cam1 camSetPos [getPosATL player select 0, getPosATL player select 1, 1.85];
	_cam1 camCommit 10;	
	sleep 7.5;
	cutText [" ","BLACK OUT", 2];
	sleep 1;
	"dynamicBlur" ppEffectAdjust [3];
	"dynamicBlur" ppEffectCommit 1;
	sleep 7;
	_cam1 cameraEffect ["TERMINATE", "back"];
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 3;
	cutText [" ","BLACK IN", 2];
	execVM "scripts\general\uavTV.sqf";
	execVM "scripts\general\headcam.sqf";
	sleep 5;
	_date = date;
	_year = _date select 0;
	_month = _date select 1;
	_day = _date select 2;
	_hour = _date select 3;
	_min = _date select 4;
	_text_date = [];

	if (_min < 10) then 
	{ 
		_text_date = format ["%1-%2-%3  %4h0%5m", _month, _day, _year, _hour, _min]; 
	} 
	else 
	{  
		if (_min == 60) then
		{
			_hour = _hour + 1;
			_min = 0;
			_text_date = format ["%1-%2-%3  %4h0%5m", _month, _day, _year, _hour, _min];
		}
		else
		{
			_text_date = format ["%1-%2-%3  %4h%5m", _month, _day, _year, _hour, _min]; 
		};
	};
	_text_1 = "FOB Delaram";
	_text_2 = "[Tour] Target Acquired";
	sleep 2;
	[_text_1, _text_date, _text_2] execVM "scripts\general\fn_infoText.sqf";	
	camdestroy _cam1;
};