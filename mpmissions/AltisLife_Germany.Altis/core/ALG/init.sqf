/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
_handle = [] spawn compile PreprocessFileLineNumbers "core\ALG\gambling\configuration.sqf";
diag_log "::ALG Client:: Initialization Variables gambling";
waitUntil {scriptDone _handle};

_handle = [] spawn compile PreprocessFileLineNumbers "core\ALG\gambling\functions.sqf";
diag_log "::ALG Client:: Initialization Functions gambling";
waitUntil {scriptDone _handle};
