tArgs={...}
local pseudo = nil
baseShellID = multishell.getFocus()
print("Please enter your pseudo")
pseudo = read()

function sendSMS(recipient, message)
	local ackMessage, receiver = nil
	local recipientID = rednet.lookup("SMS", recipient)
	rednet.send(recipientID, message, "SMS")
	-- Waiting for ack
	listenerTabID = multishell.launch({ackMessage, receiver}, "/listener", "ack")
	multishell.setTitle(listenerTabID, "Listener tab")
	multishell.setFocus(baseShellID) 
	if receiver == recipientID and ackMessage == "#!ACK!#" then 
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
	print("You've got a message from "..sender.." :\n")
	print(message)
end

local modem = peripheral.wrap("back")

rednet.open("back")
rednet.host("SMS",pseudo)




