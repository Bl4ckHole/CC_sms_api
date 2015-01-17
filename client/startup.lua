tArgs={...}
local pseudo = nil
print("Please enter your pseudo")
pseudo = read()

function sendSMS(target, message)
	local ID = rednet.lookup("SMS", target)
	rednet.send(ID, message, "SMS")
end

local modem = peripheral.wrap("back")

rednet.open("back")
rednet.host("SMS",pseudo)
