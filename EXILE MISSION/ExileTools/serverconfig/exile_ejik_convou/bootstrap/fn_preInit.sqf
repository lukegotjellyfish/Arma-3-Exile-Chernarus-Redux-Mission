/**
 * Pre-Initialization
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private ['_code', '_function', '_file', '_fileContent'];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;
    _isLocked = _x select 2;

    if (_isLocked isEqualTo false) then
    {
        if (isText (missionConfigFile >> 'CfgExileCustomCode' >> _function)) then
        {
            _file = getText (missionConfigFile >> 'CfgExileCustomCode' >> _function);
        };
    };

    _fileContent = preprocessFileLineNumbers _file;

    if (_fileContent isEqualTo '') then
    {
        diag_log (format ['ERROR: Override of %1 in CfgExileCustomCode points to a non-existent file: %2. Defaulting to vanilla Exile code!', _function, _file]);
   
        _fileContent = preprocessFileLineNumbers (_x select 1);
    };

    _code = compileFinal _fileContent;                    

    missionNamespace setVariable [_function, _code];
}
forEach 
[
	['ExileServer_ejik_convou_createVehicle', 'exile_ejik_convou\code\ExileServer_ejik_convou_createVehicle.sqf', false],
	['ExileServer_ejik_convou_createBots', 'exile_ejik_convou\code\ExileServer_ejik_convou_createBots.sqf', false],
	['ExileServer_ejik_convou_killedBots', 'exile_ejik_convou\code\ExileServer_ejik_convou_killedBots.sqf', false],
	['ExileServer_ejik_convou_addWaypointGetIn', 'exile_ejik_convou\code\ExileServer_ejik_convou_addWaypointGetIn.sqf', false],
	['ExileServer_ejik_convou_controller', 'exile_ejik_convou\code\ExileServer_ejik_convou_controller.sqf', false],
	['ExileServer_ejik_convou_waypointDelete', 'exile_ejik_convou\code\ExileServer_ejik_convou_waypointDelete.sqf', false],
	['ExileServer_ejik_convou_addWaypointMove', 'exile_ejik_convou\code\ExileServer_ejik_convou_addWaypointMove.sqf', false],
	['ExileServer_ejik_convou_addWaypointGetIn', 'exile_ejik_convou\code\ExileServer_ejik_convou_addWaypointGetIn.sqf', false],
	['ExileServer_ejik_convou_damageBots', 'exile_ejik_convou\code\ExileServer_ejik_convou_damageBots.sqf', false],
	['ExileServer_ejik_convou_firedNearBots', 'exile_ejik_convou\code\ExileServer_ejik_convou_firedNearBots.sqf', false],
	['ExileServer_ejik_convou_getOutPlayer', 'exile_ejik_convou\code\ExileServer_ejik_convou_getOutPlayer.sqf', false],
	['ExileServer_ejik_convou_repairVehicleUnit', 'exile_ejik_convou\code\ExileServer_ejik_convou_repairVehicleUnit.sqf', false]
];

true