	/**
	 * Weapons, scopes, silencers, ammo
	 */
	class Exile_Trader_Armory
	{
		name = "ARMORY";
		showWeaponFilter = 1;
		categories[] =
		{
			"AssaultRifles",
			"Pistols",
			"Shotguns",
			"SubMachineGuns",
			"LightMachineGuns",
			"SniperRifles",
			"BipodAttachments",
			"MuzzleAttachments",
			"OpticAttachments",
			"PointerAttachments",
			"Ammunition",
			"CUPAmmunition",
			"CUPAssaultRifles",
			"CUPLightMachineGuns",
			"CUPAttachments",
			"CUPBipodAttachments",
			"CUPMuzzleAttachments",
			"CUPOpticAttachments",
			"CUPPistols",
			"CUPPointerAttachments",
			"CUPSniperRifles",
			"CUPSubMachineGuns",
			"CUPRangefinders",
			"NIAAssaultRifles",
			"NIALightMachineGuns",
			"NIASniperRifles",
			"NIAAttachments",
			"NIAMuzzleAttachments",
			"NIAOpticAttachments",
			"NIAAmmunition",
			"RHSAssaultRifles",
			"RHSPistols",
			"RHSSubMachineGuns",
			"RHSLightMachineGuns",
			"RHSSniperRifles",
			"RHSBipodAttachments",
			"RHSForegripAttachments",
			"RHSMuzzleAttachments",
			"RHSOpticAttachments",
			"RHSPointerAttachments",
			"RHSAmmunition"
		};
	};

	/**
	 * Satchels, nades, UAVs, static MGs
	 */
	class Exile_Trader_SpecialOperations
	{
		name = "SPECIAL OPERATIONS";
		showWeaponFilter = 1; // for noob tubes
		categories[] =
		{
			"A3LauncherAmmo",
			"A3Launchers",
			"CUPLauncherAmmo",
			"CUPLaunchers",
			"CUPNVGs",
			"ExplosiveWeapons",
			"Explosives",
			"Flares",
			//"Navigation",
			"RHSExplosives",
			"RHSLauncherAmmunition",
			"RHSLaunchers",
			//"RHSStaticMG",		//not recommended except for militarised servers due to rockets/mortar etc
			"Smokes",
			"StaticMGs",
			"UAVs"
		};
	};

	/**
	 * Uniforms, vests, helmets, backpacks
	 */
	class Exile_Trader_Equipment
	{
		name = "EQUIPMENT";
		showWeaponFilter = 0;
		categories[] =
		{
			"Backpacks",
			"FirstAid",
			"Headgear",
			"RHSAccessories",
			"RHSBinoculars",
			"RHSBackpacks",
			"RHSHeadgear",
			"RHSNightVisonGoggles",
			"RHSUniforms",
			"RHSVests",
			"Tools",
			"Uniforms",
			"ADKUniforms",
			"Vests"
		};
	};

	/**
	 * Cans, cans, cans
	 */
	class Exile_Trader_Food
	{
		name = "FAST FOOD";
		showWeaponFilter = 0;
		categories[] =
		{
			"Drinks",
			"Food",
			"NonVeganFood"
		};
	};

	/**
	 * Light bulbs, metal, etc.
	 */
	class Exile_Trader_Hardware
	{
		name = "HARDWARE";
		showWeaponFilter = 0;
		categories[] =
		{
			"Hardware",
			"ExtendedBaseMod"
		};
	};

	/**
	 * Sells cars and general vehicles
	 */
	class Exile_Trader_Vehicle
	{
		name = "VEHICLE";
		showWeaponFilter = 0;
		categories[] =
		{
			"A3Armed",
			"A3Cars",
			"A3Trucks",
			"A3Tanks",
			"Bikes",
			"Cars",
			"ADKCars",
			"RHSVehicles",
			"Trucks"
			// Whatever your last line is make sure it doesn't have a comma! <<<<<<<<<<<<<<<< <<<<<<<<<<<<<<<< <<<<<<<<<<<<<<<<
		};
	};

	/**
	 * Sells choppers and planes
	 */
	class Exile_Trader_Aircraft
	{
		name = "AIRCRAFT";
		showWeaponFilter = 0;
		categories[] =
		{
			"A3Planes",
			"A3armedChoppers",
			"A3unarmedChoppers",
			"CChoppers",
			"Choppers",
			"Planes",
			"JetPlanes",
			"ADKHelicopters",
			"RHSChoppers",
			"RHSPlanes",
			"A3UAVs"
			// Whatever your last line is make sure it doesn't have a comma! <<<<<<<<<<<<<<<< <<<<<<<<<<<<<<<< <<<<<<<<<<<<<<<<
		};
	};

	/**
	 * Sells ships and boats
	 */
	class Exile_Trader_Boat
	{
		name = "BOAT";
		showWeaponFilter = 0;
		categories[] =
		{
			"A3Boats",
			"Boats",
			"RHSBoats"
			// Whatever your last line is make sure it doesn't have a comma! <<<<<<<<<<<<<<<< <<<<<<<<<<<<<<<< <<<<<<<<<<<<<<<<
		};
	};

	class Exile_Trader_Diving
	{
		name = "DIVERS";
		showWeaponFilter = 0;
		categories[] =
		{
			"Diving"
		};
	};