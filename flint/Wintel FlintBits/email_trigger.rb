=begin
##########################################################################
#
#  INFIVERVE TECHNOLOGIES PTE LIMITED CONFIDENTIAL
#  __________________
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

@log.info("STARTED execution of 'email_trigger.rb' script")
from = @input.get("from")
to = @input.get("to")
trigger = @input.get("trigger")
cc = @input.get("cc")
subject = @input.get("subject")
date = @input.get("date")
body = @input.get("body")
content_type = @input.get("content-type")
 
@log.info("Triggered script : #{trigger}")
@log.info("Got mail From : #{from}")
@log.info("To : #{to}")
@log.info("Cc : #{cc}")
@log.info("Subject : #{subject}")
@log.info("Date : #{date}")
@log.info("Body : #{body}")
@log.info("Content-type :#{content_type}")
 
@log.info("FINISHED execution of 'email_trigger.rb' script")
