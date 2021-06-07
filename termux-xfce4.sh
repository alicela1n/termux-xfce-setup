#!/data/data/com.termux/files/usr/bin/sh
# Copyright (c) 2020 quarkyalice (devfusediboot@protonmail.com)

# MIT license
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

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

# Create scripts to start VNC server
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

# Make things executable
chmod +x ~/start-vnc.sh
chmod +x ~/start-vnc-local.sh
chmod +x ~/.vnc/xstartup

echo "You will be asked to make a password first time starting the VNC server."
echo "All done, you can start VNC server using the script ./start-vnc-local.sh or ./start-vnc.sh"
# End of script
