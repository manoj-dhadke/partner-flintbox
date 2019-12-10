=begin
#
#  INFIVERVE TECHNOLOGIES PTE LIMITED CONFIDENTIAL
#  _______________________________________________
# 
#  (C) INFIVERVE TECHNOLOGIES PTE LIMITED, SINGAPORE
#  All Rights Reserved.
#  Product / Project: Flint IT Automation Platform
#  NOTICE:  All information contained herein is, and remains
#  the property of INFIVERVE TECHNOLOGIES PTE LIMITED.
#  The intellectual and technical concepts contained
#  herein are proprietary to INFIVERVE TECHNOLOGIES PTE LIMITED.
#  Dissemination of this information or any form of reproduction of this material
#  is strictly forbidden unless prior written permission is obtained
#  from INFIVERVE TECHNOLOGIES PTE LIMITED, SINGAPORE.
=end

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
