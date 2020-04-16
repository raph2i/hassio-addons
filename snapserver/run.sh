#!/usr/bin/env bashio

mkdir -p /share/snapfifo
mkdir -p /share/snapcast

config=/etc/snapserver.conf

if ! bashio::fs.file_exists '/etc/snapserver.conf'; then
    touch /etc/snapserver.conf ||
        bashio::exit.nok "Could not create snapserver.conf file on filesystem"
fi
bashio::log.info "Populating snapserver.conf..."

# Start creation of configuration

echo "[stream]" > "${config}"
for stream in $(bashio::config 'stream.streams'); do
    echo "stream = ${stream}" >> "${config}"
done
echo "buffer = $(bashio::config 'stream.buffer')" >> "${config}"
echo "codec = $(bashio::config 'stream.codec')" >> "${config}"
echo "send_to_muted = $(bashio::config 'stream.send_to_muted')" >> "${config}"
echo "sampleformat = $(bashio::config 'stream.sampleformat')" >> "${config}"

echo "[http]" >> "${config}"
echo "enabled = $(bashio::config 'http.enabled')" >> "${config}"
echo "doc_root = $(bashio::config 'http.docroot')" >> "${config}"

echo "[tcp]" >> "${config}"
echo "enabled = $(bashio::config 'tcp.enabled')" >> "${config}"

echo "[logging]" >> "${config}"
echo "debug = $(bashio::config 'logging.enabled')" >> "${config}"

echo "[server]" >> "${config}"
echo "threads = $(bashio::config 'server.threads')" >> "${config}"

echo "[server]" >> "${config}"
echo "datadir = $(bashio::config 'server.datadir')" >> "${config}"

bashio::log.info "Starting SnapServer..."

/usr/bin/snapserver -c /etc/snapserver.conf
