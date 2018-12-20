#!/usr/bin/env bash

CERTIFICATE_DIR="${HOME}/certificate"
JUPYTER_CONFIG_DIR="${HOME}/.jupyter"

if [ ! -d "$CERTIFICATE_DIR" ]; then
    mkdir -p $CERTIFICATE_DIR
    openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout "$CERTIFICATE_DIR/mykey.key" -out "$CERTIFICATE_DIR/mycert.pem" -batch
    chown -R $USER $CERTIFICATE_DIR
    # if getting the message "unable to write 'random state'", you may not have permissions to write to ~/.rnd
fi

if [ ! -f "$JUPYTER_CONFIG_DIR/jupyter_notebook_config.py" ]; then
    mkdir -p $JUPYTER_CONFIG_DIR
    # generate default config file
    jupyter notebook --generate-config --config=$JUPYTER_CONFIG_DIR/jupyter_notebook_config.py
    jupass=`python -c "from notebook.auth import passwd; print(passwd())"`

    # append notebook server settings
    cat <<EOF >> "$JUPYTER_CONFIG_DIR/jupyter_notebook_config.py"
# Set options for certfile, ip, password, and toggle off browser auto-opening
c.NotebookApp.certfile = u'$CERTIFICATE_DIR/mycert.pem'
c.NotebookApp.keyfile = u'$CERTIFICATE_DIR/mykey.key'
c.NotebookApp.allow_remote_access = True
# Set ip to '*' to bind on all interfaces (ips) for the public server
c.NotebookApp.ip = '*'
c.NotebookApp.password = u'$jupass'
c.NotebookApp.open_browser = False
# It is a good idea to set a known, fixed port for server access
c.NotebookApp.port = 8888
EOF
    chown -R $USER $JUPYTER_CONFIG_DIR
else
    echo "Already exists, not configuring: $JUPYTER_CONFIG_DIR/jupyter_notebook_config.py"
fi
