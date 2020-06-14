/**
 * ExileServer_ejik_convou_createBots
 * © 2018 ejik designer
 *
 */
private["_vehicleBots","_thisvehicle","_itemmy","_countItemBots","_Headgear_bots","_weaponSecondaryBots","_rifleOptics","_LMGs_bots","_vst_bots","_backpack_bots","_uniform_bots","_abilityBots","_rankBoats","_classBoats","_vehSolders","_randomMoney","_exileMoneyMin","_exileMoneyMax","_exileMoneyMid","_className"];
_vehicleBots = _this;
//diag_log format["DEBUG: Техника для ботов %1",_vehicleBots];
_newgroup = grpNull;
if!(_vehicleBots isEqualTo objNull)then{
            _className = _vehicleBots getVariable ["classVehicleConfig",""];
		    _vehicleB = _vehicleBots getVariable ["vehicleBots",0];
			_vehSolders = _vehicleB;
			_classBoats = getText(configFile >> "ejikConvou" >> "ejikConvouConfig" >> "classBoats");
			_roads = getPos _vehicleBots;
			//diag_log format["DEBUG: Количество ботов %1",_vehSolders];
			_rankBoats = getArray(configFile >> "ejikConvou" >> "ejikConvouConfig" >> "rankBoats");
			_abilityBots = getArray(configFile >> "ejikConvou" >> "ejikConvouConfig" >> "abilityBots");
			_uniform_bots = getArray(configFile >> "ejikConvou" >> "ejikConvouBotLoot" >> "uniform_bots");
			_backpack_bots = getArray(configFile >> "ejikConvou" >> "ejikConvouBotLoot" >> "backpack_bots");
			_vst_bots = getArray(configFile >> "ejikConvou" >> "ejikConvouBotLoot" >> "vst_bots");
			_LMGs_bots = getArray(configFile >> "ejikConvou" >> "ejikConvouBotLoot" >> "weaponBots");
			_rifleOptics = getArray(configFile >> "ejikConvou" >> "ejikConvouBotLoot" >> "rifleOptics");
			_weaponSecondaryBots = getArray(configFile >> "ejikConvou" >> "ejikConvouBotLoot" >> "weaponSecondaryBots");
			_Headgear_bots = getArray(configFile >> "ejikConvou" >> "ejikConvouBotLoot" >> "headgear_bots");
			_countItemBots = getArray(configFile >> "ejikConvou" >> "ejikConvouConfig" >> "countItemBots");
			_itemmy = getArray(configFile >> "ejikConvou" >> "ejikConvouBotLoot" >> "itemmy");
			_exileBotMoneyMin = getNumber(configFile >> "ejikConvou" >> "ejikConvouVehicle" >> _className >> "exileBotMoneyMin");
	        _exileBotMoneyMax = getNumber(configFile >> "ejikConvou" >> "ejikConvouVehicle" >> _className >> "exileBotMoneyMax");
	        _exileBotMoneyMid = _exileBotMoneyMin + ((_exileBotMoneyMax - _exileBotMoneyMin) / 2);
	        _randomMoney = ceil(random[_exileBotMoneyMin,ceil(_exileBotMoneyMid),_exileBotMoneyMax]);
			_thisvehicle = _vehicleBots;
			
			_nextUnit = 0;
			_arrUnit = [];
			_newgroup = createGroup EAST;
			if!(isNull _newgroup)then{
			    _newgroup setVariable ["timeOutHold",time];
			    //diag_log format["DEBUG: Проверили группу %1",_newgroup];
				for "_i" from 1 to _vehSolders do {				   
					_unit_109 = objNull;
					if (true) then{
						_solder = _newgroup createUnit [_classBoats, _roads, [], 0, "CAN_COLLIDE"];
						_unit_109 = _solder;
						removeAllWeapons _solder;
						removeAllItems _solder;
						removeUniform _solder;
						removeVest _solder;
						removeBackpack _solder;
						_solder setPos _roads;
						if(count(_rankBoats) > 0)then{
							_rankBot = _rankBoats select (random (count _rankBoats -1));
							_solder setUnitRank _rankBot;
						};
						if(count(_abilityBots) > 0)then{
							_abilityBot = _abilityBots select (random (count _abilityBots -1));
							_solder setUnitAbility _abilityBot;
						};
						if(count(_uniform_bots) > 0)then{
							_uniform = _uniform_bots select (random (count _uniform_bots -1));
							_solder forceAddUniform _uniform;
						};
						if(count(_backpack_bots) > 0)then{
							_backpack = _backpack_bots select (random (count _backpack_bots -1));
							_solder addBackpack _backpack;
						};
						if(count(_vst_bots) > 0)then{
							_vst = _vst_bots select (random (count _vst_bots -1));
							_solder addVest _vst;
						};
						if(count(_LMGs_bots) > 0)then{
							_wpn = _LMGs_bots select (random (count _LMGs_bots -1));
							_solder addMagazines [(_wpn select 1),(_wpn select 2)];
							if(count(_wpn) == 5)then{
								_solder addMagazines [(_wpn select 3),(_wpn select 4)];
							};
							_solder addWeapon (_wpn select 0);
							_pricel = _rifleOptics select (random (count _rifleOptics -1));
							_solder addWeaponItem [(_wpn select 0),_pricel];
						};
						if((count _weaponSecondaryBots) > 0)then{
							_wpnBoats = _weaponSecondaryBots select (random (count _weaponSecondaryBots -1));
							if(count (_wpnBoats select 0) > 0)then{
								if(count (_wpnBoats select 1) > 0)then{
									_solder addMagazines [(_wpnBoats select 1),(_wpnBoats select 2)];
								};
								_solder addWeapon (_wpnBoats select 0);
							};
						};
						if((count _Headgear_bots) > 0)then{
							_Headgear = _Headgear_bots select (random (count _Headgear_bots -1));
							_solder addHeadgear _Headgear;
						};
						_countItemBot = _countItemBots select (random (count _countItemBots -1));
						for "_i" from 1 to _countItemBot do {
							_itemBot = _itemmy select (random (count _itemmy -1));
							_solder addItem _itemBot;
						};
						
                        _solder setVariable ["ExileMoney", _randomMoney, true];						
						_solder addMPEventHandler ["MPKilled", "[_this select 0, _this select 1] call ExileServer_ejik_convou_killedBots"];
						[_solder] join _newgroup;
						
						_solder moveInAny _thisvehicle;
						
						_nextUnit = _nextUnit + 1;
						if!(isNull _solder)then{
							_arrUnit pushBack _solder;
						};
						{
							deleteWaypoint _x;
						}forEach (waypoints _solder);
				
						_solder setVariable ["vehicleItsUnit",_thisvehicle];
						_solder disableAI "ALL";
						
					};
					sleep 0.5;
				};
				_thisvehicle setVariable ["vehicleUnitArray",_arrUnit];
				_thisvehicle setVariable ["vehicleGroup",_newgroup];
			};
};
_newgroup