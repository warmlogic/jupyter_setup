# Contents

This repo contains the following items:

1. `functions`: Convenient functions to go in your `~/.bash_profile` (or similar) to download template Jupyter Notebooks.
1. `exports`: a definition of your personal initials to be included in the template notebook filename upon download.
1. `notebooks`: Contains the actual template Jupyter notebooks downloaded by the functions mentioned above.
1. `jupyter_userdata.sh`: A script to configure a Jupyter Notebook server with a password.

## Jupyter Notebook server setup

The server configuration script requires a couple manual steps:

- Run the following commands in a terminal:

``` python
ipython
from IPython.lib import passwd
passwd()
```

- Type in your desired password for the server.
- Copy the resulting hash and paste it on the line of `jupyter_userdata.sh` that begins with `c.NotebookApp.password`.
- Run this script (`./jupyter_userdata.sh`) to copy the appropriate configuration to your server config file.
- Run your notebook server, browse to its URL, and enter the password when prompted. You can start the server it in a `screen` session if you want to run it in the background.
