local ack = "#!ACK!#"

function sendSMS(recipient, message)
	local ackMessage, receiver = nil
	local recipientID = rednet.lookup("SMS", recipient)
	if recipientID == nil then
		print("Recipient not found. Either your recipient has is phone off or you mispell his pseudo.\n")
	else
		rednet.send(recipientID, message, "SMS")
		receiver, ackMessage = listener("ack")
		if receiver == recipientID and ackMessage == ack then
			print("Message receive by recipient")
		else
			print("Failed to send message.\nEither you or the recipient are too far from any relay\n")
		end
	end
end

function listener(mode)
	local timeout = nil
	if mode == "ack" then
		timeout = 1
	end
	local sender, message, protocol = rednet.receive("SMS", timeout)
	return sender, message
end

function displaySMS(sender, message)
	print("You've got a message from "..sender.." :\n")
	print(message.."\n")
	local log = fs.open("log", "a")
	log.write(sender.." : "..message.."\n")
	log.close()
end

function sendAck(sender)
	rednet.send(sender, ack, "SMS")
end
