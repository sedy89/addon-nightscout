#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: Nightscout
# Configures Nightscout
# ==============================================================================

readonly api_key=$(bashio::config 'api_key')

bashio::log.info "Setting up API KEY: ${api_key}"
export API_SECRET="${api_key}"

#mmconnect
if bashio::config.has_value 'mmconnect_user_name'; then
    readonly mmconnect_user_name=$(bashio::config 'mmconnect_user_name')
    bashio::log.debug "Setting up MMCONNECT_USER_NAME: ${mmconnect_user_name}"
    export MMCONNECT_USER_NAME="${mmconnect_user_name}"
fi
if bashio::config.has_value 'mmconnect_password'; then
    readonly mmconnect_password=$(bashio::config 'mmconnect_password')
    bashio::log.debug "Setting up MMCONNECT_PASSWORD: ${mmconnect_password}"
    export MMCONNECT_PASSWORD="${mmconnect_password}"
fi
if bashio::config.has_value 'mmconnect_verbose'; then
    readonly mmconnect_verbose=$(bashio::config 'mmconnect_verbose')
    bashio::log.debug "Setting up MMCONNECT_VERBOSE: ${mmconnect_verbose}"
    export MMCONNECT_VERBOSE="${mmconnect_verbose}"
fi
if bashio::config.has_value 'mmconnect_server'; then
    readonly mmconnect_server=$(bashio::config 'mmconnect_server')
    bashio::log.debug "Setting up MMCONNECT_SERVER: ${mmconnect_server}"
    export MMCONNECT_SERVER="${mmconnect_server}"
fi

