# MyPythonService

A template for creating a well behaved system service for your Python program

## Installation

This program installs using GNU Make. Here is what you will need to get started:

```
python3
python3-venv
make
```

After that, simply use make to install/uninstall

```console
sudo make install
sudo make uninstall
```

After installation, use systemctl to interact with your service and journalctl to look at logs:

```console
systemctl start mypythonservice
systemctl status mypythonservice
journalctl -r -u mypthonservice
```

