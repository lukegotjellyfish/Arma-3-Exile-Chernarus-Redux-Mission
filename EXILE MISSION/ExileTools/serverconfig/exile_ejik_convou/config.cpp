class CfgPatches
{
	class exile_ejik_convou
	{
		requiredVersion=1.0;
		requiredAddons[]=
		{
			"exile_server"
		};
		units[]={};
		weapons[]={};
		magazines[]={};
		ammo[]={};
	};
};


class CfgFunctions
{
    class exile_ejik_convou
    {
        class Bootstrap
        {
            file = "\exile_ejik_convou\bootstrap";
            class preInit
            {
                preInit = 1;
            };
            class postInit
            {
                postInit = 1;
            };
        };
    };
};

class ejikConvou
{
	class ejikConvouConfig
	{
		classBoats = "i_survivor_F"; // Класс самого бота
		rankBoats[] = {"CORPORAL","SERGEANT","LIEUTENANT","CAPTAIN","MAJOR","COLONEL"}; // Список рангов ботов
		abilityBots[] = {0.5,0.6,0.7,0.8,0.9}; // Рандомный список жесткости ботов. Формируется от 0 до 1, к примеру 50% это 0.5
		countItemBots[] = {2,1,3}; /* Количество произвольного лута в ботах пишется через запятую в массиве. Береться рандомно */
        radiusNonPlayer = 1000; /* Радиус в метрах, проверка на наличие игроков, если игроков не будет, то после завершающей точки, конвой пропадет */
		radiusFiredNonPlayer = 200; /* Радиус в метрах, если при перестрелки игрок спрятался в каком радиусе конвой будет его искать и не уедет, пока игрок не убежит либо пока его не убьют :) */
        betweenTime = 5; /* Задержка работы скрипта. */
        betweenStartTimeConvoy = 20; /* Время задержки начала работы скрипта после старта сервера. В секундах */
        betweenTimeConvoy = 60; /* Время задержки между конвоями */
		betweenTimeConvoyScript = 5; /* Время проверки скрипта конвоя */
        maxCount = 2; /* Максимальное количество конвоев на карте */
        maxTimeConvoy = 60; /* Максимальное количество секунд конвоя. Если он бездействует на карте, то просто убирается. */
        countPlayerOnline = 0; /* Максимальное количество игроков онлайн для спавна конвоя. */
        maxTimeStopConvoy = 80; /* Если конвой стоит на месте с начала появления, то делаем проверку передвинулся он или нет. Бывает на карте острова и точка конечного пути может стать на острове и чтоб они не стояли попусту мы их будем убирать. */
        countWeaponVehicle[] = {2,1}; /* Количество произвольного оружия в технике пишется через запятую в массиве. Береться рандомно */
	    countItemVehicle[] = {2,1,3}; /* Количество произвольного лута в технике пишется через запятую в массиве. Береться рандомно */
        countBackpackVehicle[] = {1}; /* Количество произвольных рюкзаков в технике пишется через запятую в массиве. Береться рандомно */
		radiusSpawnListConvoy = 100; /* Радиус поиска дорожного покрытия в заданной рандомной области. Значение в метрах. При уменьшении значения, может взникать взрыв техники */
		minrespectKilledBoat = 50; /* Минимальное значение респекта начисления за убийства бота */
		maxrespectKilledBoat = 100; /* Максимальное значение респекта начисления за убийства бота */
	};
	
	class ejikConvouVehicle
	{
		class ejikConvouVehicleOne
		{
			playerInVehicle = 1; /* 1 - Разрешать игрокам садится в транспорт. 0 - запрещать. Игроки не смогут сесть в эту технику. */
			convoyMarkerVehicle = 1; /* 1 - Отображать конвой на карте. 0 - не отображать на карте. */
			vehicleMarkerColor = "ColorBlack"; // Цвет маркера на карте. Доступные цвета ColorGrey, ColorBlack, ColorRed, ColorBrown, ColorOrange, ColorYellow, ColorKhaki, ColorGreen, ColorBlue, ColorPink, ColorWhite
			vehicleMarkerName = "Bandit Car"; // Название маркера. Можно оставить просто пустым
			convoyAlertVehicle = 1; /* 1 - Отображать сообщение о том что появился конвой. 0 - не отображать. */
			vehicleAlertTitle = "ATTENTION"; // Заголовок оповещения
			vehicleAlertContent = "A convoy of bandits are moving through Chernarus."; // Текст опопвещения
			speedLimitedVehicle = 20; /* Ограничение скорости техники. Если у вас будет разная техника, то чтоб она ехала с одинаковой скоростью */
			exileMoneyMin = 50; /* Ставим минимальное значение игровых денег в машине. */
			exileMoneyMax = 100; /* Ставим максимальное значение игровых денег в машине. */
			exileBotMoneyMin = 0; /* Ставим минимальное значение игровых денег для ботов. */
			exileBotMoneyMax = 10; /* Ставим максимальное значение игровых денег для ботов. */
			dynamicLootOn = 1; /* Добавлять динамический лут из class ejikConvouBotLoot. 0 - не добавлять, 1 - добавлять */
			vehicleList[] =
		    {
				{			
					"B_MRAP_01_gmg_F", // Класс техники		
					4, // Количество ботов в машине
					{
						{"srifle_DMR_03_F",1,1},
						{"20Rnd_762x51_Mag",3,2}					
					}, // Первый парамметр это класс, второй парамметр это количество. Третий парамметр это тип. Если это оружие то пишем 1, если это патроны то пишем 2, если это рюкзак то пишем 3, если это любой другой лут то пишем 4.
					0 // высота объекта. Если это будет вертолет то он появится в воздухе на высоте указаной в этом парамметре. Пишите в метрах.
				},
				{			
					"B_MRAP_01_gmg_F", // Класс техники		
					4, // Количество ботов в машине
					{}, // Первый парамметр это класс, второй парамметр это количество. Третий парамметр это тип. Если это оружие то пишем 1, если это патроны то пишем 2, если это рюкзак то пишем 3, если это любой другой лут то пишем 4.
					0 // высота объекта. Если это будет вертолет то он появится в воздухе на высоте указаной в этом парамметре. Пишите в метрах.
				},
				{			
					"O_Truck_03_transport_F", // Класс техники		
					10, // Количество ботов в машине
					{}, // Первый парамметр это класс, второй парамметр это количество. Третий парамметр это тип. Если это оружие то пишем 1, если это патроны то пишем 2, если это рюкзак то пишем 3, если это любой другой лут то пишем 4.
					0 // высота объекта. Если это будет вертолет то он появится в воздухе на высоте указаной в этом парамметре. Пишите в метрах.
				}
	        };
		};
		
		class ejikConvouVehicleTwo
		{
			playerInVehicle = 1; /* 1 - Разрешать игрокам садится в транспорт. 0 - запрещать. Игроки не смогут сесть в эту технику. */
			convoyMarkerVehicle = 1; /* 1 - Отображать конвой на карте. 0 - не отображать на карте. */
			vehicleMarkerColor = "ColorRed"; // Цвет маркера на карте. Доступные цвета ColorGrey, ColorBlack, ColorRed, ColorBrown, ColorOrange, ColorYellow, ColorKhaki, ColorGreen, ColorBlue, ColorPink, ColorWhite
			vehicleMarkerName = "Bandit Car"; // Название маркера. Можно оставить просто пустым
			convoyAlertVehicle = 1; /* 1 - Отображать сообщение о том что появился конвой. 0 - не отображать. */
			vehicleAlertTitle = "ATTENTION"; // Заголовок оповещения
			vehicleAlertContent = "A convoy of bandits are moving through Chernarus."; // Текст опопвещения
			speedLimitedVehicle = 20; /* Ограничение скорости техники. Если у вас будет разная техника, то чтоб она ехала с одинаковой скоростью */
			exileMoneyMin = 50; /* Ставим минимальное значение игровых денег в машине. */
			exileMoneyMax = 100; /* Ставим максимальное значение игровых денег в машине. */
			exileBotMoneyMin = 0; /* Ставим минимальное значение игровых денег для ботов. */
			exileBotMoneyMax = 10; /* Ставим максимальное значение игровых денег для ботов. */
			dynamicLootOn = 1; /* Добавлять динамический лут из class ejikConvouBotLoot. 0 - не добавлять, 1 - добавлять */
			vehicleList[] =
		    {
				{			
					"O_LSV_02_armed_F", // Класс техники		
					6, // Количество ботов в машине
					{}, // Первый парамметр это класс, второй парамметр это количество. Третий парамметр это тип. Если это оружие то пишем 1, если это патроны то пишем 2, если это рюкзак то пишем 3, если это любой другой лут то пишем 4.
					0 // высота объекта. Если это будет вертолет то он появится в воздухе на высоте указаной в этом парамметре. Пишите в метрах.
				},
				{			
					"O_LSV_02_armed_F", // Класс техники		
					6, // Количество ботов в машине
					{}, // Первый парамметр это класс, второй парамметр это количество. Третий парамметр это тип. Если это оружие то пишем 1, если это патроны то пишем 2, если это рюкзак то пишем 3, если это любой другой лут то пишем 4.
					0 // высота объекта. Если это будет вертолет то он появится в воздухе на высоте указаной в этом парамметре. Пишите в метрах.
				},
				{			
					"O_Truck_03_transport_F", // Класс техники		
					10, // Количество ботов в машине
					{}, // Первый парамметр это класс, второй парамметр это количество. Третий парамметр это тип. Если это оружие то пишем 1, если это патроны то пишем 2, если это рюкзак то пишем 3, если это любой другой лут то пишем 4.
					0 // высота объекта. Если это будет вертолет то он появится в воздухе на высоте указаной в этом парамметре. Пишите в метрах.
				}
	        };
		};
		
		class ejikConvouVehicleThree
		{
			playerInVehicle = 1; /* 1 - Разрешать игрокам садится в транспорт. 0 - запрещать. Игроки не смогут сесть в эту технику. */
			convoyMarkerVehicle = 1; /* 1 - Отображать конвой на карте. 0 - не отображать на карте. */
			vehicleMarkerColor = "ColorBlack"; // Цвет маркера на карте. Доступные цвета ColorGrey, ColorBlack, ColorRed, ColorBrown, ColorOrange, ColorYellow, ColorKhaki, ColorGreen, ColorBlue, ColorPink, ColorWhite
			vehicleMarkerName = "Bandit Helicopter"; // Название маркера. Можно оставить просто пустым
			convoyAlertVehicle = 1; /* 1 - Отображать сообщение о том что появился конвой. 0 - не отображать. */
			vehicleAlertTitle = "ATTENTION"; // Заголовок оповещения
			vehicleAlertContent = "A convoy of bandits are moving through Chernarus."; // Текст опопвещения
			speedLimitedVehicle = 20; /* Ограничение скорости техники. Если у вас будет разная техника, то чтоб она ехала с одинаковой скоростью */
			exileMoneyMin = 50; /* Ставим минимальное значение игровых денег в машине. */
			exileMoneyMax = 100; /* Ставим максимальное значение игровых денег в машине. */
			exileBotMoneyMin = 0; /* Ставим минимальное значение игровых денег для ботов. */
			exileBotMoneyMax = 10; /* Ставим максимальное значение игровых денег для ботов. */
			dynamicLootOn = 1; /* Добавлять динамический лут из class ejikConvouBotLoot. 0 - не добавлять, 1 - добавлять */
			vehicleList[] =
		    {
				{			
					"I_C_Heli_Light_01_civil_F", // Класс техники		
					2, // Количество ботов в технике
					{}, // Первый парамметр это класс, второй парамметр это количество. Третий парамметр это тип. Если это оружие то пишем 1, если это патроны то пишем 2, если это рюкзак то пишем 3, если это любой другой лут то пишем 4.
					1200 // высота объекта. Если это будет вертолет то он появится в воздухе на высоте указаной в этом парамметре. Пишите в метрах.
				},
				{			
					"I_C_Heli_Light_01_civil_F", // Класс техники		
					2, // Количество ботов в технике
					{}, // Первый парамметр это класс, второй парамметр это количество. Третий парамметр это тип. Если это оружие то пишем 1, если это патроны то пишем 2, если это рюкзак то пишем 3, если это любой другой лут то пишем 4.
					1200 // высота объекта. Если это будет вертолет то он появится в воздухе на высоте указаной в этом парамметре. Пишите в метрах.
				}
	        };
		};
	};
	
	class ejikConvouBotLoot
	{
		/* Список основного оружия для ботов.
        1-ое значение класс оружия
        2-ое значение класс обойм
        3-ее значение количество обойм
        4-ое значение подствольного патрона. Если не указывать то не будет
        5-ое количество подствольных патронов */
		weaponBots[] =
		{
			{"srifle_DMR_03_F","20Rnd_762x51_Mag",7},
	        {"LMG_Zafir_F","150Rnd_762x54_Box",3},
	        {"srifle_DMR_05_blk_F","10Rnd_93x64_DMR_05_Mag",7},
	        {"MMG_01_hex_F","150Rnd_93x64_Mag",3},
	        {"srifle_GM6_F","5Rnd_127x108_Mag",7},
	        {"srifle_LRR_F","7Rnd_408_Mag",7},
	        {"srifle_EBR_F","20Rnd_762x51_Mag",7},
	        {"srifle_EBR_F","20Rnd_762x51_Mag",7},
	        {"srifle_EBR_F","20Rnd_762x51_Mag",7},
	        {"LMG_Mk200_F","200Rnd_65x39_cased_Box",3},
	        {"LMG_Mk200_F","200Rnd_65x39_cased_Box",3},
	        {"LMG_Mk200_F","200Rnd_65x39_cased_Box",3},
	        {"LMG_Mk200_F","200Rnd_65x39_cased_Box",3},
	        {"LMG_Mk200_F","200Rnd_65x39_cased_Box",3},
	        {"LMG_Mk200_F","200Rnd_65x39_cased_Box",3},
	        {"arifle_Katiba_GL_F","30Rnd_65x39_caseless_green",5,"1Rnd_HE_Grenade_shell",3},
	        {"arifle_MX_GL_F","30Rnd_65x39_caseless_mag",5,"3Rnd_HE_Grenade_shell",3},
	        {"arifle_MX_GL_F","30Rnd_65x39_caseless_mag",5,"3Rnd_HE_Grenade_shell",3},
	        {"arifle_MX_GL_F","30Rnd_65x39_caseless_mag",5,"3Rnd_HE_Grenade_shell",3},
	        {"arifle_MXC_Black_F","30Rnd_65x39_caseless_mag",5}
		};
		/* Список второстепенного оружия для ботов.
		1-ое значение класс оружия
		2-ое значение класс обойм
		3-ее значение количество обойм
		{"","",0} - означает ни чего не давать
		{"launch_RPG7_F","",0} - если второй параметр пустой то не будет зарядов */
		weaponSecondaryBots[] =
	    {
			{"","",0},
			{"","",0},
			{"","",0},
			{"CUP_launch_RPG18","CUP_RPG18_M",1},
			{"launch_RPG7_F","RPG7_F",2}
		};
		rifleOptics[] =
		{
			"optic_ERCO_khk_F",
			"optic_MRCO",
			"optic_Hamr",
			"optic_ERCO_khk_F",
			"optic_MRCO",
			"optic_Hamr",
			"optic_Nightstalker",
			"optic_DMS"
		};
		itemmy[] =
		{
			"HandGrenade",
			"HandGrenade",
			"HandGrenade",
			"HandGrenade",
			"HandGrenade",
			"HandGrenade",
			"APERSBoundingMine_Range_Mag",
			"APERSMine_Range_Mag",
			"RPG32_HE_F",
			"Rangefinder",
			"optic_Nightstalker",
			"Rangefinder"
		};
		uniform_bots[] =
		{
			"U_O_Wetsuit",
			"U_O_GhillieSuit",
			"U_O_CombatUniform_oucamo",
			"U_I_OfficerUniform",
			"U_I_CombatUniform_tshirt",
			"U_O_PilotCoveralls",
			"U_OG_Guerilla3_2",
			"U_O_CombatUniform_ocamo"
		};
		vst_bots[] =
		{
			"V_PlateCarrier1_rgr",
			"V_PlateCarrier2_blk",
			"V_PlateCarrierL_CTRG",
			"V_PlateCarrierH_CTRG",
			"V_PlateCarrierIA1_dgtl",
			"V_PlateCarrierGL_mtp",
			"V_PlateCarrierGL_blk",
			"V_PlateCarrierGL_rgr",
			"V_PlateCarrier3_rgr"
		};
		headgear_bots[] =
		{
			"H_PilotHelmetFighter_I",
			"H_PilotHelmetHeli_I",
			"H_CrewHelmetHeli_I",
			"H_HelmetO_ocamo",
			"H_HelmetSpecO_blk"
		};
		backpack_bots[] =
		{
			"B_Carryall_ocamo"
		};
		/* Список основного оружия для ботов.
        1-ое значение класс оружия
        2-ое значение класс обойм
        3-ее значение количество обойм */
		weaponVehicle[] =
		{
			{"srifle_DMR_03_F","20Rnd_762x51_Mag",7},
	        {"LMG_Zafir_F","150Rnd_762x54_Box",3},
	        {"srifle_DMR_05_blk_F","10Rnd_93x64_DMR_05_Mag",7},
	        {"MMG_01_hex_F","150Rnd_93x64_Mag",3},
	        {"srifle_GM6_F","5Rnd_127x108_Mag",7},
	        {"srifle_LRR_F","7Rnd_408_Mag",7},
	        {"srifle_EBR_F","20Rnd_762x51_Mag",7},
	        {"srifle_EBR_F","20Rnd_762x51_Mag",7},
	        {"srifle_EBR_F","20Rnd_762x51_Mag",7},
	        {"LMG_Mk200_F","200Rnd_65x39_cased_Box",3},
	        {"LMG_Mk200_F","200Rnd_65x39_cased_Box",3},
	        {"LMG_Mk200_F","200Rnd_65x39_cased_Box",3},
	        {"LMG_Mk200_F","200Rnd_65x39_cased_Box",3},
	        {"LMG_Mk200_F","200Rnd_65x39_cased_Box",3},
	        {"LMG_Mk200_F","200Rnd_65x39_cased_Box",3},
	        {"arifle_Katiba_GL_F","30Rnd_65x39_caseless_green",5},
	        {"arifle_MX_GL_F","30Rnd_65x39_caseless_mag",5},
	        {"arifle_MX_GL_F","30Rnd_65x39_caseless_mag",5},
	        {"arifle_MX_GL_F","30Rnd_65x39_caseless_mag",5},
	        {"arifle_MXC_Black_F","30Rnd_65x39_caseless_mag",5}
		};
		vehItemmy[] =
		{
			"HandGrenade",
			"HandGrenade",
			"APERSBoundingMine_Range_Mag",
			"Rangefinder",
			"optic_Nightstalker"
		};
		vehBackpack_bots[] =
		{
			"B_Carryall_ocamo"
		};
	};
};