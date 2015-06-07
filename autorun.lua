local keyboard = require("keyboard")
local computer = require("computer")
local process = require("process")
local fs = require("filesystem")
local event = require("event")
local shell = require("shell")
local sha = require("sha256")
local term = require("term")
local io = require("io")

u = io.open("/.userName.dat", "r") -- Reads the username file.
 textu = u:read()
  u:close()
  
local function check()
 if keyboard.isControlDown() and keyboard.isAltDown() then -- Prevents "ctrl+alt+c".
  computer.shutdown(true)
 end
end
event.listen("key_down", check)

while true do
  if fs.exists("/installer.lua") then -- Auto deletes the installer at first boot.
    fs.remove("/installer.lua")
  end

  term.clear()
  term.setCursor(1,1)
  term.write("User: ")
  username = term.read()
  username = string.gsub(username, "\n", "")
  term.setCursor(1,2)
  term.write("Password: ")
  password = term.read(nil, nil, nil, "")
  password = string.gsub(password, "\n", "")
  password = sha.sha256(password)

  _username, _password = textu:match("([^:]+):([^:]+)")

  if username == _username and password == _password then -- Checks to see if the input from the user matches that which is on file.
    hn = io.open("/tmp/.hostname.dat", "w") -- Writes the user inputted username to file for future use.
     hn:write(username)
      hn:close()
    term.clear()
    term.setCursor(1,1)
    print("Welcome, " .._username)
    os.sleep(1.5)
    term.clear()
    term.setCursor(1,1)
    shell.setAlias("usage", "/bin/usage.lua")
    shell.setAlias("logout", "/bin/logout.lua")
    shell.setAlias("update", "/bin/update.lua")
    os.setenv("PS1", _username .. "@" .. _username .. "# ") -- Sets the user environment.
    shell.setWorkingDirectory("/usr/home/" .. _username .. "/")
    shell.execute("/bin/.root.lua/") -- Starts the root check program.
    event.ignore("key_down", check)
    break
  else
    term.clear()
    term.setCursor(1,1)
    term.write("Password incorrect...")
    os.sleep(2.5)
  end
end