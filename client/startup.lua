tArgs={...}
local pseudo = nil
baseShellID = multishell.getFocus()
print("Please enter your pseudo")
pseudo = read()
--Add pseudo to message so that we can easily check who's the sender
os.loadAPI("smsAPI")

local listenerTabID = multishell.launch({}, "listener")
local modem = peripheral.wrap("left")
rednet.open("left")
rednet.host("SMS",pseudo)

smsAPI.sendSMS("ceselegend","Bonjour")
