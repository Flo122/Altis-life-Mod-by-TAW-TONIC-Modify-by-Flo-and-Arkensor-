/*

	Updates player clothing by replacing vanilla by custom ones

*/

/* =================Cops================= */
/* Streife */
if(playerSide == west && {uniform player == "U_B_CombatUniform_mcam"}) then {
	player setObjectTextureGlobal [0,"textures\uniforms\polizei_uniform.paa"];
};
/* Einsatz */
if(playerSide == west && {uniform player == "U_B_CombatUniform_mcam_worn"}) then {
	player setObjectTextureGlobal [0,"textures\uniforms\polizei_einsatz_uniform.paa"];
};
/* SEK */
if(playerSide == west && {uniform player == "U_B_CombatUniform_mcam_vest"}) then {
	player setObjectTextureGlobal [0,"textures\uniforms\sek_uniform.paa"];
};
/* HideBackpack */
if(playerSide == west && {backpack player != ""}) then {
	unitBackpack player setObjectTextureGlobal [0,""];
};

/* =================Medics================= */
/* Normal */
if(playerSide == independent && {uniform player == "U_I_HeliPilotCoveralls"}) then {
	player setObjectTextureGlobal [0,"textures\uniforms\medic_uniform.paa"];
};
/* MedicBackpack */
if(playerSide == independent && {backpack player != ""}) then {
	unitBackpack player setObjectTextureGlobal [0,"textures\uniforms\medic_backpack.paa"];
};

/* =================ASF================= */
/* Normal */
if(playerSide == east && {uniform player == "U_B_CombatUniform_mcam_vest"}) then {
	player setObjectTextureGlobal [0,"textures\uniforms\ASF_uniform.paa"];
};

if(playerSide == east && {backpack player != ""}) then {
	unitBackpack player setObjectTextureGlobal [0,""];
};