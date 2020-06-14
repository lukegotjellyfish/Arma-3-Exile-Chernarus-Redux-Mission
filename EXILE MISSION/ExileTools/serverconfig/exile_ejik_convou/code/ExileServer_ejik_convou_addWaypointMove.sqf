/**
 * ExileServer_ejik_convou_addWaypointMove
 * © 2018 ejik designer
 *
 */
private["_waypointPosition","_waypointGroups"];
_waypointPosition = _this select 0;
_waypointGroups = _this select 1;
_vehicle = (units _waypointGroups select 0) getVariable ["vehicleItsUnit",objNull];
_waypointGroups call ExileServer_ejik_convou_waypointDelete;
//diag_log format["DEBUG WAYPOINT MOVE position %1, GROUP %2",_waypointPosition,_waypointGroups];
/* Обновляем точку куда нужно ехать */
/*_waypoint = _waypointGroups addWaypoint [getPos _vehicle, 50];
_waypoint setWaypointType "GETIN";
_waypoint setWaypointCombatMode "YELLOW";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "SAFE";
_waypoint waypointAttachVehicle _vehicle;
_waypoint setWaypointFormation "STAG COLUMN";*/

_waypoint = _waypointGroups addWaypoint [_waypointPosition, 50];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCombatMode "YELLOW";
_waypoint setWaypointSpeed "NORMAL";
_waypoint setWaypointBehaviour "SAFE";
_waypoint setWaypointFormation "STAG COLUMN";

_waypoint = _waypointGroups addWaypoint [_waypointPosition, 50];
_waypoint setWaypointType "CYCLE";
_waypoint setWaypointCombatMode "YELLOW";
_waypoint setWaypointSpeed "NORMAL";
_waypoint setWaypointBehaviour "SAFE";
_waypoint setWaypointFormation "STAG COLUMN";

_vehicle setVariable ["statusWaypoint","SAD"];
_vehicle setVariable ["startMove",1];