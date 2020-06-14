/**
 * ExileServer_ejik_convou_controller
 * © 2018 ejik designer
 *
 */
private["_startMove","_statusWaypoint","_timeOutHold","_markerEnable","_countPlayerOnline","_betweenTimeConvoy","_maxCount","_ejikConvouNextTimeConvou","_stop","_maxTimeConvoyVehicle","_maxTimeConvoy","_positionNewWaypoint","_minus","_newConvou","_speedLimitedVehicle","_className","_vehicleMarkerColor","_vehicleMarkerName","_firstVehicle","_indexVehicle","_vehiclePosEnd","_thisVehicle","_WType","_allVehicle","_varnames","_groups","_unitVehicle","_ejikConvouArray","_vehicleWayPosition","_radiusNonPlayer","_newgroup","_vehiclePosFirst","_botsOutVehicle","_botsOutVehicleTime","_maxTimeStopConvoyVehicle","_isover","_crew"];
_allVehicle = missionNamespace getVariable "ejikConvouArray";
_ejikConvouNextTimeConvou = missionNamespace getVariable "ejikConvouNextTimeConvou";
_radiusNonPlayer = getNumber(configFile >> "ejikConvou" >> "ejikConvouConfig" >> "radiusNonPlayer");
_maxTimeConvoy = getNumber(configFile >> "ejikConvou" >> "ejikConvouConfig" >> "maxTimeConvoy");
_maxTimeStopConvoy = getNumber(configFile >> "ejikConvou" >> "ejikConvouConfig" >> "maxTimeStopConvoy");
_countPlayerOnline = getNumber(configFile >> "ejikConvou" >> "ejikConvouConfig" >> "countPlayerOnline");
_maxCount = getNumber(configFile >> "ejikConvou" >> "ejikConvouConfig" >> "maxCount");
_betweenTimeConvoy = getNumber(configFile >> "ejikConvou" >> "ejikConvouConfig" >> "betweenTimeConvoy");
_ejikConvouArray = [];
_newgroup = objNull;
//diag_log format["DEBUG ALLVEHICLE %1",_allVehicle];
if!(_allVehicle isEqualTo [])then{
    {
	    _firstVehicle = objNull;
		_indexVehicle = 0;
		_newConvou = [];
		_positionNewWaypoint = [];
		_stop = 0;
		{ 
		    if!(_x isEqualTo objNull)then{
				_isover = false;
				_varnames = _x getVariable ["vehicleVarname",""];
				_groups = _x getVariable ["vehicleGroup",grpNull];
				_timeOutHold = _groups getVariable ["timeOutHold",0];
				_vehiclePosEnd = _x getVariable ["vehicleWaypointPosition",[]];
				_vehiclePosFirst = _x getVariable ["firstVehPosMission",[]];
				_maxTimeConvoyVehicle = _x getVariable ["maxTimeConvoy",0];
				_maxTimeStopConvoyVehicle = _x getVariable ["maxTimeStopConvoy",0];
				_botsOutVehicleTime = _x getVariable ["botsOutVehicleTime",0];
				_botsOutVehicle = _x getVariable ["botsOutVehicle",0];
				_markerEnable = _x getVariable ["markerEnable",0];
				_statusWaypoint = _x getVariable ["statusWaypoint",""];
				_startMove = _x getVariable ["startMove",0];
				_vehiclePos = getPos _x;
				_thisVehicle = _x;
				_className = _x getVariable ["classVehicleConfig",""];
				_vehicleMarkerName = getText(configFile >> "ejikConvou" >> "ejikConvouVehicle" >> _className >> "vehicleMarkerName");
				_vehicleMarkerColor = getText(configFile >> "ejikConvou" >> "ejikConvouVehicle" >> _className >> "vehicleMarkerColor");
				_speedLimitedVehicle = getNumber(configFile >> "ejikConvou" >> "ejikConvouVehicle" >> _className >> "speedLimitedVehicle");
				_minus = 20;
				_crew = crew _x;
				_isTruePlayer = 0;
				{
				    if(isPlayer _x)then{
					    _isTruePlayer = 1;
					};
				}forEach _crew;
				
				if(_isTruePlayer == 1)then{
				    if(_varnames in allMapMarkers)then{
						deleteMarker _varnames;
					};
				}else{
					if!(_groups isEqualTo grpNull)then{					
						_WType2 = "";
						if(count (waypoints _groups) > 0)then{
							_WType = waypointType ((waypoints _groups) select 0);
							if!(waypointType ((waypoints _groups) select 1) isEqualTo "")then{
								_WType2 = waypointType ((waypoints _groups) select 1)
							};
							//diag_log format["DEBUG waypoints type %1, ALT position %2, position %2",_WType,(getPosATL _x),(getPos _x)];
							
							if((damage _x) == 1)then{
								_list = {isPlayer _x} count (_vehiclePos nearEntities ["CAManBase",_radiusNonPlayer]);
								if(_list == 0)then{
									diag_log format["Техника взорвалась класс: %2, Название класса конвоя %1. В окрестности игроков не обнаружено",_className,(typeOf _x)];
									{
										if(alive _x)then{
											deleteVehicle _x;
										};
									}forEach units _groups;
									deleteVehicle _x;
								}else{
									diag_log format["Техника взорвалась класс: %2, Название класса конвоя %1. Не далеко есть игроки, ботов оставляем",_className,(typeOf _x)];
									_groups call ExileServer_ejik_convou_waypointDelete;
									_waypoint = _groups addWaypoint [(getPos _x), 50];
									_waypoint setWaypointType "SAD";
									_waypoint setWaypointCombatMode "RED";
									_waypoint setWaypointSpeed "NORMAL";
									_waypoint setWaypointBehaviour "AWARE";
									_thisVehicle setVariable ["statusWaypoint","SAD"];	
																	
								};	
								_isover = true;
								if (_varnames in allMapMarkers) then {
									deleteMarker _varnames;
								};						
							}else{
								if((_vehiclePosEnd distance2D (getPos _x)) < 150)then{
									_list = {isPlayer _x} count (_vehiclePos nearEntities ["CAManBase",_radiusNonPlayer]);
									if(_list == 0)then{
										diag_log format["(1) Техника %3 прибыла в место назначение класс: %2, Название класса конвоя %1. Игроков вокруге нет. Техника удаляется.",_className,(typeOf _x),_varnames];
										{
											if(alive _x)then{
												deleteVehicle _x;
											};
										}forEach units _groups;
										if (_varnames in allMapMarkers) then {
											deleteMarker _varnames;
										};
										deleteVehicle _x;
										_isover = true;
									};
								}else{
									_limitoff = 0;
									{
										if!(_x in _thisVehicle)then{
											_limitoff = 1;
										};
									}forEach units _groups;
									
									if(_limitoff == 1)then{
										_x limitSpeed 5;
										if(_botsOutVehicleTime < time)then{
											if(_botsOutVehicle == 0)then{
												_x setVariable ["botsOutVehicle",1];
												[_vehiclePosEnd,_groups,_thisVehicle] call ExileServer_ejik_convou_addWaypointGetIn;
											};
										};
									}else{
										_x setVariable ["botsOutVehicleTime",(time + 100)];
										_x limitSpeed _speedLimitedVehicle;
									};
								
									if(_indexVehicle == 0)then{
										_indexVehicle = 1;
										
										if(!isEngineOn _x)then{
											if((damage _x) < 1)then{
												if(time > _maxTimeConvoyVehicle)then{
													//_groups call ExileServer_ejik_convou_waypointDelete;
													_stop = 1;
												};
											};
										};
									}else{
										if(_stop > 0)then{
											//_groups call ExileServer_ejik_convou_waypointDelete;
										};
									};
										
										if(((_x getHitPointDamage "HitEngine") > 0.8) || ((_x getHitPointDamage "HitLFWheel") > 0.8) || ((_x getHitPointDamage "HitLF2Wheel") > 0.8) || ((_x getHitPointDamage "HitRFWheel") > 0.8) || ((_x getHitPointDamage "HitRF2Wheel") > 0.8))then{
											_unitRepair = units _groups select 0;
											//_groups call ExileServer_ejik_convou_waypointDelete;
											[_unitRepair,_vehiclePos,_x,_vehiclePosEnd,_groups] call ExileServer_ejik_convou_repairVehicleUnit;		
										};
										
										if(isEngineOn _x)then{
											_x setVariable ["maxTimeConvoy",(time + _maxTimeConvoy)];
											_x setVariable ["maxTimeStopConvoy",(time + _maxTimeStopConvoy)];
										};
										//_x setVariable ["maxTimeConvoy",(time + _maxTimeConvoy)];
								};
								
								if(_markerEnable == 1)then{
									if (_varnames in allMapMarkers) then {
										_varnames setMarkerPos _vehiclePos; 
									};
								};
							};
							
							if((_vehiclePosFirst distance2D (getPos _x)) < 200)then{
								if(_maxTimeStopConvoyVehicle < time)then{
									_list = {isPlayer _x} count (_vehiclePos nearEntities ["CAManBase",_radiusNonPlayer]);
									if(_list == 0)then{
										diag_log format["Техника ни куда не поехала с начальной точки класс: %2, Название класса конвоя %1. Не возможно проложить путь. Скорее всего точка на острове, либо нет возможности к ней проехать. Удаляем технику.",_className,(typeOf _x)];
										{
											if(alive _x)then{
												deleteVehicle _x;
											};
										}forEach units _groups;
										deleteVehicle _x;
										_isover = true;
										if (_varnames in allMapMarkers) then {
											deleteMarker _varnames;
										};
									};
								};
							}else{;
								if(time > _maxTimeConvoyVehicle)then{
									_list = {isPlayer _x} count (_vehiclePos nearEntities ["CAManBase",_radiusNonPlayer]);
									if(_list == 0)then{
										diag_log format["Техника закончилось время ожидания конвоя. Конвой не двигается. класс: %2, Название класса конвоя %1. Игроков вокруге нет. Техника удаляется.",_className,(typeOf _x)];
										{
											if(alive _x)then{
												deleteVehicle _x;
											};
										}forEach units _groups;
										deleteVehicle _x;
										_isover = true;
										if(_varnames in allMapMarkers)then{
											deleteMarker _varnames;
										};
									};
								};
							};
						}else{
							if((_vehiclePosEnd distance2D (getPos _x)) < 150)then{
								_list = {isPlayer _x} count (_vehiclePos nearEntities ["CAManBase",_radiusNonPlayer]);
								if(_list == 0)then{
									diag_log format["Техника %3 прибыла в место назначение класс: %2, Название класса конвоя %1. Игроков вокруге нет. Техника удаляется.",_className,(typeOf _x),_varnames];
									{
										if(alive _x)then{
											deleteVehicle _x;
										};
									}forEach units _groups;
									deleteVehicle _x;
									_isover = true;
									if (_varnames in allMapMarkers) then {
										deleteMarker _varnames;
									};
								};	
							};
							
							if(_markerEnable == 1)then{
								if (_varnames in allMapMarkers) then {
									_varnames setMarkerPos _vehiclePos; 
								};
							};
						
							if(time > _maxTimeConvoyVehicle)then{
								_list = {isPlayer _x} count (_vehiclePos nearEntities ["CAManBase",_radiusNonPlayer]);
								if(_list == 0)then{
									diag_log format["Техника закончилось время конвоя класс: %2, Название класса конвоя %1. Игроков вокруге нет. Техника удаляется.",_className,(typeOf _x)];
									{
										if(alive _x)then{
											deleteVehicle _x;
										};
									}forEach units _groups;
									_isover = true;
									deleteVehicle _x;
									if(_varnames in allMapMarkers)then{
										deleteMarker _varnames;
									};
								}else{
										if((damage _x) == 1)then{
											if!(_groups isEqualTo grpNull)then{
												_groups call ExileServer_ejik_convou_waypointDelete;
												_waypoint = _groups addWaypoint [(getPos _x), 50];
												_waypoint setWaypointType "SAD";
												_waypoint setWaypointCombatMode "RED";
												_waypoint setWaypointSpeed "NORMAL";
												_waypoint setWaypointBehaviour "AWARE";
												_vehicle setVariable ["statusWaypoint","SAD"];	
											}; 										
										};
										
										if!(_groups isEqualTo grpNull)then{							
											if(((_x getHitPointDamage "HitEngine") > 0.8) || ((_x getHitPointDamage "HitLFWheel") > 0.8) || ((_x getHitPointDamage "HitLF2Wheel") > 0.8) || ((_x getHitPointDamage "HitRFWheel") > 0.8) || ((_x getHitPointDamage "HitRF2Wheel") > 0.8))then{
												_unitRepair = units _groups select 0;
												//_groups call ExileServer_ejik_convou_waypointDelete;
												//diag_log format["DEBUG REPAIR OK %1",_unitRepair];
												[_unitRepair,_vehiclePos,_x,_vehiclePosEnd,_groups] call ExileServer_ejik_convou_repairVehicleUnit;		
											};									
										};								
								};
							}else{
								if(_startMove == 0)then{
									_x setVariable ["maxTimeConvoy",(time + _maxTimeConvoy)];
								};
								_firstVehicle = _x;
							};
						};
						
						if!(_isover)then{					
							_newConvou pushBack _x;	
						};					
					}else{
						if(_varnames in allMapMarkers)then{
							deleteMarker _varnames;
						};
					};
				};
			};
		}forEach _x;
		if!(_newConvou isEqualTo [])then{
		    if((_ejikConvouArray find _newConvou) < 0) then {
			    _ejikConvouArray pushBack _newConvou;	
			};
		};
		missionNamespace setVariable ["ejikConvouArray",_ejikConvouArray];	
		
		sleep 0.5;
	}forEach _allVehicle;
};

if(time > _ejikConvouNextTimeConvou)then{
    if(count _allVehicle < _maxCount)then{
	    if(count allPlayers >= _countPlayerOnline)then{
            call ExileServer_ejik_convou_createVehicle;
		    missionNamespace setVariable ["ejikConvouNextTimeConvou",(time + _betweenTimeConvoy)];
		};
	};
};