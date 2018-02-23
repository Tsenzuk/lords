var USER_LANGUAGE = 1;

function card_name(card_id) {
	return card_names[USER_LANGUAGE][card_id]["name"];
}

function card_description(card_id) {
	return card_names[USER_LANGUAGE][card_id]["description"];
}

function unit_name(unit_id) {
	return unit_names[USER_LANGUAGE][unit_id]["name"];
}

function unit_description(unit_id) {
	return unit_names[USER_LANGUAGE][unit_id]["description"];
}

function unit_log_name(unit_id) {
	return unit_names[USER_LANGUAGE][unit_id]["log_short_name"] || unit_names[USER_LANGUAGE][unit_id]["name"];
}

function unit_log_name_akk(unit_id) {
	return unit_names[USER_LANGUAGE][unit_id]["log_name_accusative"];
}

function unit_feature_description(feature_id) {
	return unit_feature_names[USER_LANGUAGE][feature_id]["description"];
}

function building_name(building_id) {
	return building_names[USER_LANGUAGE][building_id]["name"];
}

function building_description(building_id) {
	return building_names[USER_LANGUAGE][building_id]["description"];
}

function building_log_name(building_id) {
	return building_names[USER_LANGUAGE][building_id]["log_short_name"] || building_names[USER_LANGUAGE][building_id]["name"];
}

function error_message(error_id) {
	return error_dictionary_messages[USER_LANGUAGE][error_id]["description"];
}

function procedure_param_description(procedure_param_id) {
	return procedures_params_descriptions[USER_LANGUAGE][procedure_param_id]["description"];
}

function log_message_text(message_code) {
	return log_message_texts[USER_LANGUAGE][message_code]["message"];
}

