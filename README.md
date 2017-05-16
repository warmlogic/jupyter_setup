# Contents

This repo contains the following items:

1. `functions`: Convenient functions to go in your `~/.bash_profile` (or similar) to download template Jupyter Notebooks.
1. `exports`: a definition of your personal initials to be included in the template notebook filename upon download.
1. `notebooks`: Contains the actual template Jupyter notebooks downloaded by the functions mentioned above.
1. `jupyter_userdata.sh`: A script to configure a Jupyter Notebook server with a password.
    - This script essentially automates [these](http://jupyter-notebook.readthedocs.io/en/latest/public_server.html#notebook-server-security) instructions.

## Jupyter Notebook server setup

The server configuration script requires a couple manual steps. After installing `jupyter` and `notebook` via your favorite method (e.g., `conda`):

- Start a Python shell in a terminal (activate your conda environment first, if necessary), and run the following commands:

``` python
>>> from notebook.auth import passwd
>>> passwd()
```

- You will then enter and verify your desired password for the server.
- Copy the resulting hash and paste it on the line of `jupyter_userdata.sh` that begins with `c.NotebookApp.password`.
- Run the `jupyter_userdata.sh` script to copy the appropriate configuration to your server config file.
- Run your notebook server, browse to its URL, and enter the password when prompted. You can start the server in a `screen` session if you want to run it in the background.
- Your browser may produce a safety warning about accessing the server page.
    - Chrome: Click "Advanced" and proceed to the notebook server page.
    - Safari: Follow [these](https://support.apple.com/kb/PH18677?locale=en_US) instructions.
    - If you want to have a fully trusted server, you can use [these](http://jupyter-notebook.readthedocs.io/en/latest/public_server.html#using-let-s-encrypt) instructions.
