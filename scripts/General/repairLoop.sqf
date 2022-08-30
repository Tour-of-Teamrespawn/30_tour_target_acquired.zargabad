if (isServer) then
{
	removeallweapons TOUR_repairman;
};

while {true} do
{
	if (animationState TOUR_repairman != "InBaseMoves_assemblingVehicleErc") then
	{
		TOUR_repairman disableAI "ANIM";
		TOUR_repairman disableAI "MOVE";
		TOUR_repairman switchMove "InBaseMoves_assemblingVehicleErc";
	};
};