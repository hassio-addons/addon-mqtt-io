#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: MQTT IO
# Configures MQTT IO
# ==============================================================================
declare arch

# Creates initial MQTT IO configuration in case it is non-existing
if ! bashio::fs.directory_exists '/config/mqtt-io'; then
    cp -R /root/mqtt-io /config/mqtt-io \
        || bashio::exit.nok 'Failed to create initial MQTT IO configuration'
fi

# Raise warning if the directory exists, but the mqtt-io config is missing.
if ! bashio::fs.file_exists '/config/mqtt-io/config.yml'; then
    bashio::log.fatal
    bashio::log.fatal "Seems like the /config/mqtt-io folder exists,"
    bashio::log.fatal "however config.yml wasn't found."
    bashio::log.fatal
    bashio::log.fatal "Remove or rename the /config/mqtt-io folder"
    bashio::log.fatal "and the add-on will create a new and fresh one"
    bashio::log.fatal "for you."
    bashio::log.fatal

    bashio::exit.nok
fi
