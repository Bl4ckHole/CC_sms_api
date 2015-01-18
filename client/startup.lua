tArgs={...}
local pseudo = nil
print("Please enter your pseudo")
pseudo = read()

function sendSMS(target, message)
	local ackMessage = nil
	local ID = rednet.lookup("SMS", target)
	rednet.send(ID, message, "SMS")
	receiver, ackMessage = listener("ack")
	if receiver == ID and ackMessage == "#!ACK!#" then 
		print("Message received by recipient")
	else
		print("Failed to send message.\nEither you or the recipient are too far from any relay")
	end
end

function listener(mode)
	local timeout = nil
	if mode == "ack" then
		timeout = 5
	end
	local sender, message, protocol = rednet.receive("SMS", timeout)
	return sender, message
end

function displaySMS(sender,message)
	print("Vous avez un message de "..sender.." :\n")
	print(message)
end

local modem = peripheral.wrap("back")

rednet.open("back")
rednet.host("SMS",pseudo)


