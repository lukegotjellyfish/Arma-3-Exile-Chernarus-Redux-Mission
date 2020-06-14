/**
 * ExileServer_ejik_convou_createVehicle
 * © 2018 ejik designer
 *
 */
 
private["_playerInVehicle","_vehicleAlertContent","_vehicleAlertTitle","_convoyAlertVehicle","_convoyMarkerVehicle","_maxTimeConvoy","_newConvou","_speedLimitedVehicle","_groupVehicle","_vehLMGs","_countWeaponVehicle","_vehBackpack_bots","_countBackpackVehicle","_vehItemmy","_countItemVehicle","_roadNew","_radiusSpawnListConvoy","_roads","_roadses","_allConvou","_bildings","_exileMoneyMin","_exileMoneyMid","_randomMoney","_exileMoneyMax","_maxTimeStopConvoy"];
_allConvou = "true" configClasses (configFile >> "ejikConvou" >> "ejikConvouVehicle");
_maxTimeConvoy = getNumber(configFile >> "ejikConvou" >> "ejikConvouConfig" >> "maxTimeConvoy");
_maxTimeStopConvoy = getNumber(configFile >> "ejikConvou" >> "ejikConvouConfig" >> "maxTimeStopConvoy");
_roadNew = [0,0,0] nearRoads 50000;
_road = getPos (_roadNew call BIS_fnc_selectRandom);
_radiusSpawnListConvoy = getNumber(configFile >> "ejikConvou" >> "ejikConvouConfig" >> "radiusSpawnListConvoy");
_roadses = _road nearRoads _radiusSpawnListConvoy;
_countItemVehicle = getArray(configFile >> "ejikConvou" >> "ejikConvouConfig" >> "countItemVehicle");
_vehItemmy = getArray(configFile >> "ejikConvou" >> "ejikConvouBotLoot" >> "vehItemmy");
_countBackpackVehicle = getArray(configFile >> "ejikConvou" >> "ejikConvouConfig" >> "countBackpackVehicle");
_vehBackpack_bots = getArray(configFile >> "ejikConvou" >> "ejikConvouBotLoot" >> "vehBackpack_bots");
_countWeaponVehicle = getArray(configFile >> "ejikConvou" >> "ejikConvouConfig" >> "countWeaponVehicle");
_vehLMGs = getArray(configFile >> "ejikConvou" >> "ejikConvouBotLoot" >> "weaponVehicle");
_newConvou = [];
if((count _allConvou) > 0)then{
    _randomConvou = selectRandom _allConvou;
	_className = configName _randomConvou;
	_allVehicle = getArray(configFile >> "ejikConvou" >> "ejikConvouVehicle" >> _className >> "vehicleList");
	_vehicleMarkerName = getText(configFile >> "ejikConvou" >> "ejikConvouVehicle" >> _className >> "vehicleMarkerName");
	_vehicleMarkerColor = getText(configFile >> "ejikConvou" >> "ejikConvouVehicle" >> _className >> "vehicleMarkerColor");
	_speedLimitedVehicle = getNumber(configFile >> "ejikConvou" >> "ejikConvouVehicle" >> _className >> "speedLimitedVehicle");
	_convoyMarkerVehicle = getNumber(configFile >> "ejikConvou" >> "ejikConvouVehicle" >> _className >> "convoyMarkerVehicle");
	_convoyAlertVehicle = getNumber(configFile >> "ejikConvou" >> "ejikConvouVehicle" >> _className >> "convoyAlertVehicle");
	_playerInVehicle = getNumber(configFile >> "ejikConvou" >> "ejikConvouVehicle" >> _className >> "playerInVehicle");
	_vehicleAlertTitle = getText(configFile >> "ejikConvou" >> "ejikConvouVehicle" >> _className >> "vehicleAlertTitle");
	_vehicleAlertContent = getText(configFile >> "ejikConvou" >> "ejikConvouVehicle" >> _className >> "vehicleAlertContent");
	_exileMoneyMin = getNumber(configFile >> "ejikConvou" >> "ejikConvouVehicle" >> _className >> "exileMoneyMin");
	_exileMoneyMax = getNumber(configFile >> "ejikConvou" >> "ejikConvouVehicle" >> _className >> "exileMoneyMax");
	_dynamicLootOn = getNumber(configFile >> "ejikConvou" >> "ejikConvouVehicle" >> _className >> "dynamicLootOn");
	_exileMoneyMid = _exileMoneyMin + ((_exileMoneyMax - _exileMoneyMin) / 2);
	_randomMoney = ceil(random[_exileMoneyMin,ceil(_exileMoneyMid),_exileMoneyMax]);
	if!(_allVehicle isEqualTo [])then{
	    if!(_roadses isEqualTo [])then{
		    if((count _roadses) > (count _allVehicle))then{
			    diag_log format["Спавн новый конвой Класс: %1",_className];
				{
					_vehName = _x select 0;
					_posRandomVeh = _roadses call BIS_fnc_selectRandom;
					_indexFind = _roadses find _posRandomVeh;
					_roads = getPos _posRandomVeh;
					_roadses deleteAt _indexFind;
					_ejikConvouNextCount = missionNamespace getVariable "ejikConvouNextCount";
					_nextCount = _ejikConvouNextCount + 1;
					missionNamespace setVariable ["ejikConvouNextCount",_nextCount];
					_varname = format["vehicle%1",_nextCount];
					_staticLoot = _x select 2;
					_botsConvou = _x select 1;
					_heightVehicle = _x select 3;
					diag_log format["Добавлена техника класс: %2, Название класса конвоя %1",_className,_vehName];
					
					if(_convoyMarkerVehicle == 1)then{
						_markerg = createMarker [_varname, _roads];
						_markerg setMarkerType "mil_circle";
						_markerg setMarkerColor _vehicleMarkerColor;
						_markerg setMarkerText _vehicleMarkerName;
						_markerg setMarkerBrush "Solid";
					};
					
					_thisvehicle = objNull;
					if (true) then
					{
					    _special = "NONE";
					    if(_heightVehicle > 0)then{
						    _special = "FLY";
						};
						_veh2 = createVehicle [_vehName, _roads, [], _heightVehicle, _special];
						_thisvehicle = _veh2;
						_veh2 setPos _roads;
						_veh2 setVehicleVarName _varname;
						clearItemCargoGlobal _veh2;
						clearWeaponCargoGlobal _veh2;
						clearMagazineCargoGlobal _veh2;
						clearBackPackCargoGlobal _veh2;
						
						if!(_staticLoot isEqualTo [])then{
							{
								_classStatic = _x select 0;
								_countStatic = _x select 1;
								_typeStatic = _x select 2;
								
								if(_typeStatic == 1)then{
									_veh2 addWeaponCargoGlobal [_classStatic, _countStatic];
								};
								if(_typeStatic == 2)then{
									_veh2 addMagazineCargoGlobal [_classStatic, _countStatic];
								};
								if(_typeStatic == 3)then{
									_veh2 addBackpackCargoGlobal [_classStatic, _countStatic];
								};
								if(_typeStatic == 4)then{
									_veh2 addItemCargoGlobal [_classStatic, _countStatic];
								};
							}forEach _staticLoot;
						};
						
						if(_dynamicLootOn == 1)then{
							_countIV = _countItemVehicle select (random (count _countItemVehicle -1));
							for "_i" from 1 to _countIV do {
								_itemVeh = _vehItemmy select (random (count _vehItemmy -1));
								_veh2 addItemCargoGlobal [_itemVeh,1];
							};
							
							_countB = _countBackpackVehicle select (random (count _countBackpackVehicle -1));
							for "_i" from 1 to _countB do {
								_itemVehBack = _vehBackpack_bots select (random (count _vehBackpack_bots -1));
								_veh2 addBackpackCargoGlobal [_itemVehBack,1];
							};
							
							_countVW = _countWeaponVehicle select (random (count _countWeaponVehicle -1));
							for "_i" from 1 to _countVW do {
								if(count(_vehLMGs) > 0)then{
									_wpn = _vehLMGs select (random (count _vehLMGs -1));
									_veh2 addMagazineCargoGlobal [(_wpn select 1),(_wpn select 2)];
									_veh2 addWeaponCargoGlobal [(_wpn select 0),1];
								};
							};
						};
						
						_veh2 setVariable ["ExileMoney", _randomMoney, true];
						_veh2 setVariable ["vehicleBots",_botsConvou];
						_veh2 setVariable ["firstVehPosMission",_roads];
						_veh2 setVariable ["vehicleVarname",_varname];
						_veh2 setVariable ["classVehicleConfig",_className];
						_veh2 setVariable ["markerEnable",_convoyMarkerVehicle];
						_veh2 setVariable ["maxTimeConvoy",(time + _maxTimeConvoy)];
						_veh2 setVariable ["maxTimeStopConvoy",(time + _maxTimeStopConvoy)];
                        _veh2 setVariable ["botsOutVehicleTime",(time + 100)];
                        _veh2 setVariable ["botsOutVehicle",0];
						if(_newConvou isEqualTo [])then{
						    _veh2 setVariable ["liderVehicle",true];
							_veh2 setVariable ["startMove",1];
						}else{
						    _veh2 setVariable ["liderVehicle",false];
							_veh2 setVariable ["startMove",0];
						};
						
						if(_playerInVehicle == 1)then{
						    _veh2 setVariable ["playerInVehicle",true];
						}else{
						    _veh2 setVariable ["playerInVehicle",false];
						};
						
						_veh2 addEventHandler ["GetIn", "[_this select 0, _this select 2] call ExileServer_ejik_convou_getOutPlayer"];
						
						_newConvou pushBack _veh2;
						_group = _veh2 call ExileServer_ejik_convou_createBots;
						_group addVehicle _veh2;
						_group setVariable ["timeOutHold",(time + 40)];
						_veh2 setVariable ["unitGroupConvou",_group];
						_veh2 setVariable ["statusWaypoint","GETIN"];
						sleep 1;
					};
					sleep 0.5;
				} forEach _allVehicle;
				if!(_newConvou isEqualTo [])then{
					_ejikConvouArray = missionNamespace getVariable "ejikConvouArray";
					_ejikConvouArray pushBack _newConvou;
					missionNamespace setVariable ["ejikConvouArray",_ejikConvouArray];
					if(_convoyAlertVehicle == 1)then{
						["toastRequest", ["InfoTitleAndText", [_vehicleAlertTitle, _vehicleAlertContent]]] call ExileServer_system_network_send_broadcast;
					}; 
				};
				sleep 5;
				_road2 = getPos (_roadNew call BIS_fnc_selectRandom);
				if!(_road2 isEqualTo [])then{
					{
					    if (typeName _x == "OBJECT")then{
						    _groupVehicle = _x getVariable ["unitGroupConvou",grpNull];
							if!(_groupVehicle isEqualTo grpNull)then{
							    //[getPos _x,_groupVehicle, _x] call ExileServer_ejik_convou_addWaypointGetIn;
								[_road2,_groupVehicle] call ExileServer_ejik_convou_addWaypointMove;
								
								{
									_x enableAI "ALL";
								}forEach units _groupVehicle;
								
							};
						    _x setVariable ["vehicleWaypointPosition",_road2];
							_x limitSpeed _speedLimitedVehicle;
						};
					} forEach _newConvou;
				};
			};
		};
	};
};
true