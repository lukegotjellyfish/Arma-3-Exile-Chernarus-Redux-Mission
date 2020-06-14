/**
 * ExileServer_ejik_convou_getOutPlayer
 * © 2018 ejik designer
 *
 */
private["_unit","_vehicle","_allVehicle","_playerInVehicle"];
_unit = _this select 1;
_vehicle = _this select 0;
_playerInVehicle = _vehicle getVariable ["playerInVehicle",false];
_allVehicle = missionNamespace getVariable "ejikConvouArray";
if(isPlayer _unit)then{
    if!(_playerInVehicle)then{
	    moveOut _unit;
	};
};