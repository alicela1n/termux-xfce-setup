#!/data/data/com.termux/files/usr/bin/sh
# Termux script to setup Xfce desktop with VNC server
#
# Updating and installing packages
pkg install x11-repo -y
pkg update -y
pkg install tigervnc xfce4 xfce4-terminal -y

# Setup VNC server
mkdir ~/.vnc
cat > ~/.vnc/xstartup << "EOF"
#!/data/data/com.termux/files/usr/bin/sh
xfce4-session &
EOF

cat > ~/start-vnc-local.sh << "EOF"
#!/data/data/com.termux/files/usr/bin/sh
echo "Starting VNC server on localhost 127.0.0.1:5901 (you can only connect on device)"
vncserver -localhost
EOF

cat > ~/start-vnc.sh << "EOF"
#!/data/data/com.termux/files/usr/bin/sh
echo "Starting VNC server 127.0.0.1:5901, or device-ip:5091"
vncserver
EOF

chmod +x ~/start-vnc.sh
chmod +x ~/start-vnc-local.sh

echo "You will be asked to make a password first time starting the VNC server."
echo "All done, you can start VNC server using the script ./start-vnc-local.sh or ./start-vnc.sh"
# End of script
