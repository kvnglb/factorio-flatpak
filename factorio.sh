#!/bin/sh

CONFIG_DIR=data/factorio/config
CONFIG_FILE=$CONFIG_DIR/config.ini

if [ ! -f $CONFIG_FILE ]; then
	mkdir -p $CONFIG_DIR
	cat >$CONFIG_FILE <<-EOL
		[path]
		read-data=/app/factorio/data
		write-data=data/factorio
	EOL
fi

exec /app/factorio/bin/x64/factorio --config $CONFIG_FILE
