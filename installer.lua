local computer = require("computer")
local fs = require("filesystem")
local kb = require("keyboard")
local event = require("event")
local shell = require("shell")
local term = require("term")

local running = true

local function greeting()
term.clear()
term.setCursor(1,1)
	print("Welcome to the SecureOS installer!")
	print("This installer will help guide you through setting up and installing SecureOS.")
	print("Press any key to continue.")
local event = event.pull("key_down")
	if event then
		term.clear()
		term.setCursor(1,1)
	end
end

local function downLoad()

	if not fs.exists("/root/") then
		fs.makeDirectory("/root/")
	end

	if not fs.exists("/etc/update.cfg") then
		c = io.open("/etc/update.cfg", "w")
		 c:write("release")
		  c:close()
	end

	term.write("Please wait while the files are downloaded and installed.")
	term.setCursor(1,2)
shell.execute("wget https://raw.githubusercontent.com/Shuudoushi/SecureOS/release/boot/99_login.lua /boot/99_login.lua \n")
	os.sleep(1)
shell.execute("wget https://raw.githubusercontent.com/Shuudoushi/SecureOS/release/root/sudo.lua /root/sudo.lua \n")
	os.sleep(1)
shell.execute("wget https://raw.githubusercontent.com/Shuudoushi/SecureOS/release/bin/logout.lua /bin/logout.lua \n")
	os.sleep(1)
shell.execute("wget https://raw.githubusercontent.com/Shuudoushi/SecureOS/release/bin/usage.lua /bin/usage.lua \n")
	os.sleep(1)
shell.execute("wget https://raw.githubusercontent.com/Shuudoushi/SecureOS/release/root/.root.lua /root/.root.lua \n")
	os.sleep(1)
shell.execute("wget https://raw.githubusercontent.com/Shuudoushi/SecureOS/release/bin/update.lua /bin/update.lua \n")
	os.sleep(1)
shell.execute("wget https://raw.githubusercontent.com/Shuudoushi/SecureOS/release/lib/sha256.lua /lib/sha256.lua \n")
	os.sleep(1)
shell.execute("wget https://raw.githubusercontent.com/Shuudoushi/SecureOS/release/lib/auth.lua /lib/auth.lua \n")
	os.sleep(1)
shell.execute("wget https://raw.githubusercontent.com/Shuudoushi/SecureOS/release/bin/adduser.lua /bin/adduser.lua \n")
	os.sleep(1)
shell.execute("wget https://raw.githubusercontent.com/Shuudoushi/SecureOS/release/bin/deluser.lua /bin/deluser.lua \n")
	os.sleep(1)
shell.execute("wget https://raw.githubusercontent.com/Shuudoushi/SecureOS/release/bin/uninstall.lua /bin/uninstall.lua \n")
	os.sleep(1)
shell.execute("wget -f https://raw.githubusercontent.com/Shuudoushi/SecureOS/release/init.lua /init.lua \n")
	os.sleep(1)
shell.execute("wget -f https://raw.githubusercontent.com/Shuudoushi/SecureOS/release/.osprop /.osprop \n")
	os.sleep(1)
shell.execute("wget -f https://raw.githubusercontent.com/Shuudoushi/SecureOS/release/ect/motd /ect/motd \n")
	os.sleep(1)
end

local function userInfo()
	term.clear()
	term.setCursor(1,1)
	term.write("Please enter a username and password. Usernames must be lowercase.")
	term.setCursor(1,2)
	term.write("Username: ")
		username = term.read()
		username = string.gsub(username, "\n", "")
		username = string.lower(username)
	term.setCursor(1,3)
	term.write("Password: ")
		password = term.read(nil, nil, nil, "")
		password = string.gsub(password, "\n", "")

	local auth = require("auth").addUser(username, password, true)

	if not fs.exists("/usr/home/" .. username .. "/") then
		fs.makeDirectory("/usr/home/" .. username .. "/")
	end

	term.clear()
	term.setCursor(1,1)
	term.write("Would you like to restart now? [Y/n]")
	term.setCursor(1,2)
		input = term.read()
		input = string.gsub(input, "\n", "")
		input = string.lower(input)

			if input == "y" then
				computer.shutdown(true)
			elseif input == "n" then
				print("Dropping to shell.")
				term.clear()
				term.setCursor(1,1)
				running = false
			end
end

while running do
	greeting()
	downLoad()
	userInfo()
end