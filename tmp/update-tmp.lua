local shell = require("shell")

shell.execute("wget -f https://raw.githubusercontent.com/Shuudoushi/SecureOS/" .. textu .. "/boot/99_login.lua /boot/99_login.lua \n")
shell.execute("wget -f https://raw.githubusercontent.com/Shuudoushi/SecureOS/" .. textu .. "/root/sudo.lua /root/sudo.lua \n")
shell.execute("wget -f https://raw.githubusercontent.com/Shuudoushi/SecureOS/" .. textu .. "/root/.root.lua /root/.root.lua \n")
shell.execute("wget -f https://raw.githubusercontent.com/Shuudoushi/SecureOS/" .. textu .. "/bin/logout.lua /bin/logout.lua \n")
shell.execute("wget -f https://raw.githubusercontent.com/Shuudoushi/SecureOS/" .. textu .. "/bin/usage.lua /bin/usage.lua \n")
shell.execute("wget -f https://raw.githubusercontent.com/Shuudoushi/SecureOS/" .. textu .. "/bin/adduser.lua /bin/adduser.lua \n")
shell.execute("wget -f https://raw.githubusercontent.com/Shuudoushi/SecureOS/" .. textu .. "/bin/deluser.lua /bin/deluser.lua \n")
shell.execute("wget -f https://raw.githubusercontent.com/Shuudoushi/SecureOS/" .. textu .. "/bin/uninstall.lua /bin/uninstall.lua \n")
shell.execute("wget -f https://raw.githubusercontent.com/Shuudoushi/SecureOS/" .. textu .. "/lib/sha256.lua /lib/sha256.lua \n")
shell.execute("wget -f https://raw.githubusercontent.com/Shuudoushi/SecureOS/" .. textu .. "/lib/auth.lua /lib/auth.lua \n")
shell.execute("wget -f https://raw.githubusercontent.com/Shuudoushi/SecureOS/" .. textu .. "/init.lua /init.lua \n")
shell.execute("wget -f https://raw.githubusercontent.com/Shuudoushi/SecureOS/" .. textu .. "/.osprop /.osprop \n")
shell.execute("wget -f https://raw.githubusercontent.com/Shuudoushi/SecureOS/" .. textu .. "/etc/motd /etc/motd \n")
os.sleep(1.5)