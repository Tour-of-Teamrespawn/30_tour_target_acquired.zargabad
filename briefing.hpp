player createDiarySubject ["About", "About"];

player createDiaryRecord 
["Diary", ["About", 
	"
		Tour of Teamrespawn
		<br />
		<br />
		Mission Design: Mr.Ben 2021
		<br />
		<br />
		Thanks to all Tour members for testing and feedback.
		<br /><br />
		meow
	"
]];

player createDiaryRecord 
["Diary", ["Mission", 
	"
		You can end the mission at any point, by returning to the <marker name=""TOUR_mkrFOB"">base</marker> and reporting into the mission officer.
		<br />
		<br />
		Use the cable ties to bind the HVT and from there you will have the interaction option to escort him, and load into vehicles.
	"
]];

player createDiaryRecord 
["Diary", ["Assets", 
	"
		<font size='20' align='center' color='#0080ff'>Vehicles</font>
		<br />
		<br />
		 The delta teams are supported by Blackhawk and littlebird's (both attack and transport). You also have use of a number of Humvee's for ground assault options.
		<br />
		<br />
		 MH-6M x3
		<br />
		 AH-6M x3
		<br />
		 UH-60M x2
		<br />
		<br />
		<font size='20' align='center' color='#0080ff'>Technology</font>
		<br />
		<br />
		You can access live missions feed from the TV's at the briefing area. Stand close looking at them, and use the up and down arrows to change unit, and left and right arrows to change vision mode. The right hand screen is for the helmet camera's and left screen for the UAV feed.
		<br />
		<br />
		<font size='20' align='center' color='#0080ff'>Medical</font>
		<br />
		<br />
		 There is a fully operational medical facility at the FOB. Simply move the yourself or the wounded next to the stretcher, and use the action in to initiate medical treatment. This will fully heal the unit. The unit selected for treatment will be the closest unit to the stretcher.
	"
]];

player createDiaryRecord 
["Diary", ["Radio Channels", 
	"
		<font size='20' align='center' color='#0080ff'>Default Radio Channels</font>
		<br />
		<br />	
		<font size='16' color='#ffa500'>Lead:</font> PRC343 - Channel 9
		<br />
		<br />	
		<font size='16' color='#ffa500'>Fist Alpha:</font> PRC343 - Channel 1
		<br />
		<br />
		<font size='16' color='#ffa500'>Fist Bravo:</font> PRC343 - Channel 2
		<br />
		<br />	
		<font size='16' color='#ffa500'>Fist Charlie:</font> PRC343 - Channel 3
		<br />
		<br />	
		<font size='16' color='#ffa500'>Fist Delta:</font> PRC343 - Channel 4
		<br />
		<br />	
		<font size='16' color='#ffa500'>Fist Echo:</font> PRC343 - Channel 5
		<br />
		<br />	
		<font size='16' color='#ffa500'>Eagle One:</font>  PRC343 - Channel 6
		<br />
		<br />	
		<font size='16' color='#ffa500'>Eagle Two:</font>  PRC343 - Channel 6
		<br />
		<br />	
		<font size='16' color='#ffa500'>Eagle Three:</font>  PRC343 - Channel 6
		<br />
		<br />	
		<font size='16' color='#ffa500'>Talon One:</font>  PRC343 - Channel 7
		<br />
		<br />	
		<font size='16' color='#ffa500'>Talon Two:</font>  PRC343 - Channel 8
		<br />
		<br />	
		Long range intersquad communications PRC148 set to channel 1
	"
]];

player createDiaryRecord 
["Diary", ["Callsigns", 
	"
		<font size='20' align='center' color='#0080ff'>Overview</font>
		<br />
		<br />	
		<font size='16' color='#ffa500'>Lead:</font> Mission Lead
		<br />
		<br />	
		<font size='16' color='#ffa500'>Fist Alpha:</font> Delta Team
		<br />
		<br />
		<font size='16' color='#ffa500'>Fist Bravo:</font> Delta Team
		<br />
		<br />	
		<font size='16' color='#ffa500'>Fist Charlie:</font> Delta Team
		<br />
		<br />	
		<font size='16' color='#ffa500'>Fist Delta:</font> Delta Team
		<br />
		<br />	
		<font size='16' color='#ffa500'>Fist Echo:</font> Delta Team
		<br />
		<br />	
		<font size='16' color='#ffa500'>Eagle One:</font> Little Bird
		<br />
		<br />	
		<font size='16' color='#ffa500'>Eagle Two:</font> Little Bird
		<br />
		<br />	
		<font size='16' color='#ffa500'>Eagle Three:</font> Little Bird
		<br />
		<br />	
		<font size='16' color='#ffa500'>Talon One:</font> Blackhawk
		<br />
		<br />	
		<font size='16' color='#ffa500'>Talon Two:</font> Blackhawk
	"
]];

player createDiaryRecord 
["Diary", ["Photos", format [
	"
		<font size='20' align='center' color='#0080ff'>Target</font>
		<br />
		<br />
		<img image='img\aziz.jpg' width='350' height='421'/>
		<br />
		<br />
		<font size='20' align='center' color='#0080ff'>Location</font>
		<br />
		<br />
		<img image='img\Loc_%1.jpg' width='350' height='284'/>
		<br />
		<br />
	", TOUR_warLocNum]
]];

player createDiaryRecord 
["Diary", ["Briefing", 
	"
		<font size='20' align='center' color='#0080ff'>Overview</font>
		<br />
		<br />
		 The war in Takistan is closing to an end. With the enemy in full retreat, some of it's high ranking officers are on the run, through fear of capture and imprisonment for warcrimes carried out against their own people. With the full might of NATO forces, we can bring these tyrants to justice.
		<br />
		<br />
		 One such tyrant is General Aziz Ibraham. Your mission is to move in and extract the high value target (HVT), for questioning before being handed over to the Takistani judicial system.
		<br />
		<br />
		<br />
		<font size='20' align='center' color='#0080ff'>Intel</font>
		<br />
		<br />
		 Intelligence has been gathered information on the where abouts of General Aziz Ibraham, and is currently believed to be in hiding in the city of <marker name=""TOUR_mkrAO"">Zargabad</marker>, aided by the local malitia forces.
		<br />
		<br />
		 Local informants have sightings confirmed around the city. UAV recon has indicated an increase in militia activity within and around <marker name=""TOUR_mkrWarlord"">these buildings</marker>. We have an opportunity to strike fast and capture the target. 
		<br />
		<br />
		 Zargabad is a stronghold for Takistani militia and though the civilian population remain freiendly to their NATO liberators, the militia are still fiercely loyal to the toppled Takistani Armed Forces. Expect a heavy infantry, with presence of technicals.
		<br />
		<br />
		 Be on the lookout for IED's and do not be suprised if the enemy flock to the cause of the General as you stir up the hornets nest!
		<br />
		<br />
		<font size='20' align='center' color='#0080ff'>Support</font>
		<br />
		<br />
		 Helicopter repair and rearm for the is available at the <marker name=""TOUR_mkrheliService"">service centre</marker>.
		<br />
	"
]];