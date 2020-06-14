/**
 * ExileServer_ejik_convou_addWaypointGetIn
 * © 2018 ejik designer
 *
 */
private["_waypointPosition","_waypointGroups","_vehicle"];
_waypointPosition = _this select 0;
_waypointGroups = _this select 1;
_vehicle = _this select 2;
_waypointGroups call ExileServer_ejik_convou_waypointDelete;
_vehiclePosEnd = _vehicle getVariable ["vehicleWaypointPosition",[]];
_waypointGroups call ExileServer_ejik_convou_waypointDelete;

//diag_log format["DEBUG WAYPOINT GETIN position %1, GROUP %2",_waypointPosition,_waypointGroups];
/* Обновляем точку куда нужно ехать */
_vehicle setVariable ["botsOutVehicleTime",(time + 100)];
_vehicle setVariable ["botsOutVehicle",0];

_waypoint = _waypointGroups addWaypoint [_vehiclePosEnd, 50];
_waypoint setWaypointType "GETIN";
_waypoint setWaypointCombatMode "YELLOW";
_waypoint setWaypointSpeed "NORMAL";
_waypoint setWaypointBehaviour "SAFE";
_waypoint setWaypointFormation "STAG COLUMN";

_waypoint = _waypointGroups addWaypoint [_vehiclePosEnd, 50];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCombatMode "YELLOW";
_waypoint setWaypointSpeed "NORMAL";
_waypoint setWaypointBehaviour "SAFE";
_waypoint setWaypointFormation "STAG COLUMN";

_waypoint = _waypointGroups addWaypoint [_vehiclePosEnd, 50];
_waypoint setWaypointType "CYCLE";
_waypoint setWaypointCombatMode "YELLOW";
_waypoint setWaypointSpeed "NORMAL";
_waypoint setWaypointBehaviour "SAFE";
_waypoint setWaypointFormation "STAG COLUMN";