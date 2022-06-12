#!/command/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: MQTT IO
# Pre-run checks for MQTT IO
# ==============================================================================
# Creates initial MQTT IO configuration in case it is non-existing
declare configuration_file

configuration_file=$(bashio::config 'configuration_file')
if ! bashio::fs.file_exists "${configuration_file}"; then
    bashio::log.fatal
    bashio::log.fatal "Seems like the configured configuration file does"
    bashio::log.fatal "not exists:"
    bashio::log.fatal
    bashio::log.fatal "${configuration_file}"
    bashio::log.fatal
    bashio::log.fatal "Please check the add-on configuration, or create the"
    bashio::log.fatal "configuration file. More information about the"
    bashio::log.fatal "configuration file format see:"
    bashio::log.fatal
    bashio::log.fatal "https://mqtt-io.app"
    bashio::log.fatal
    bashio::exit.nok
fi
