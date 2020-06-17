# termux-xfce-setup
Easy script to setup Xfce on Termux so I don't have to keep doing this manually each time.

# How to
Install curl ``pkg install curl``, then run:
```
curl https://raw.githubusercontent.com/0xN0ri/termux-xfce-setup/master/termux-xfce4.sh | sh
```

# How to start a VNC server
You can run
```
vncserver
```
or
```
vncserver -localhost # can only connect from the device itself
```
or use the start scripts that are created for simplicity sake.

# How to connect to it
You can connect to it with a VNC client such as [VNC Viewer](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android) at ``127.0.0.1:5901`` or ``device-ip:5901``
