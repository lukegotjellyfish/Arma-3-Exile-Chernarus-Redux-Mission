/**
 * ExileServer_ejik_convou_repairVehicleUnit
 * © 2018 ejik designer
 *
 */
private["_unitRepair"];
_unitRepair = _this select 0;
_vehiclePos = _this select 1;
_vehicle = _this select 2;
_vehicleWayPosition = _this select 3;
_groups = _this select 4;
if!(_unitRepair isEqualTo objNull)then{
	if!(_vehicle isEqualTo objNull)then{
		if((damage _vehicle) < 1)then{
			if (vehicle _unitRepair != _unitRepair)then{
				moveOut _unitRepair;
			};
			_unitRepair doMove _vehiclePos;
			waitUntil { ((_unitRepair distance _vehicle) < 5) || (not alive _unitRepair)};
			if!(_unitRepair isEqualTo objNull)then{
				if!(_vehicle isEqualTo objNull)then{
					_unitRepair disableAI "ANIM";
					_unitRepair switchMove "Acts_carFixingWheel";
					sleep 10;
					if((damage _unitRepair) < 1)then{
						if((damage _vehicle) < 1)then{
							_unitRepair enableAI "ANIM";
							_vehicle setDamage 0;
						};
					};
				};
			};
		};
	};
};
true