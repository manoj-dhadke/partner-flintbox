# This is an first flintbit tutorial - Hello World!!

@log.info("Welcome to flint!")
#Finding out the type of input document
input_type=@input.type

#Retrieving input parameters
if input_type == "application/xml"
 message = @input.get("/my_message/text()")
end

if input_type == "application/json"
 message=@input.get("my_message")
end

#Setting output parameters
@output.set("message", message)

@log.info("Message received : #{message}")
