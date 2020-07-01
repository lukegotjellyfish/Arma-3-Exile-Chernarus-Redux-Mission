_configs = "getNumber (_x >> 'scope') >= 2" configClasses (configFile >> "CfgVehicles") apply {configName _x}; 
copyToClipBoard str _configs;


_configs = "getNumber (_x >> 'scope') >= 2" configClasses (configFile >> "CfgVehicles") apply {getText (_x >> "displayName")};
copyToClipBoard str _configs;
