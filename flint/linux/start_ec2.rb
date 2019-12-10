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

@log.trace("Started executing 'example:start_ec2.rb' flintbit...")

#Flintbit Input Parameters
instance_id = @input.get("instance-id")

@log.info("Flintbit input parameters are, instance_id : #{instance_id}")

response = @call.connector("amazon-ec2").set("action","start-instances")
                                        .set("region","us-east-1")
                                        .set("instance-id",instance_id).sync

#Amazon EC2 Connector Response Meta Parameters
response_exitcode = response.exitcode					#Exit status code
response_message = response.message					#Execution status messages

#Amazon EC2 Connector Response Parameters
instances_set=response.get("started-instances-set")			#Set of Amazon EC2 started instances

if response_exitcode == 0
	@log.info("Instance started successfully")
	@output.set("exit-code",0).setraw("started-instances",instances_set.to_s)
else
	@log.error("ERROR in executing amazon-ec2 where, exitcode : #{response_exitcode} | message : #{response_message}")  
	@output.set("exit-code",1).set("message",response_message)
end
@log.trace("Finished executing 'example:start_ec2.rb' flintbit")

