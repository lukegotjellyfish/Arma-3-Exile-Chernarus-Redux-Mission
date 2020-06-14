/**
 * Post-Initialization
 *
 * Ejik developer addon
 */
EAST setFriend [EAST, 1];
_betweenStartTimeConvoy = getNumber(configFile >> "ejikConvou" >> "ejikConvouConfig" >> "betweenStartTimeConvoy");
missionNamespace setVariable ["ejikConvouNextTimeConvou",(time + _betweenStartTimeConvoy)];
missionNamespace setVariable ["ejikConvouArray",[]];
missionNamespace setVariable ["ejikConvouNextCount",0];
_betweenTimeConvoyScript = getNumber(configFile >> "ejikConvou" >> "ejikConvouConfig" >> "betweenTimeConvoyScript");
ExileConvouEventThreadID = [_betweenTimeConvoyScript, ExileServer_ejik_convou_controller, [], true] call ExileServer_system_thread_addtask;
call ExileServer_ejik_convou_controller;
true