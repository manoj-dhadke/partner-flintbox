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

# begin
@log.trace("Started executing 'flint-util:winrm-ruby:negotiate.rb' flintbit...")

@endpoint = @input.get("endpoint")               # Endpoint where the command will be executed
@username = @input.get("username")               # Target username
@password = @input.get("password")               # Target password
@ADuser = @input.get("ADusername")
@ADPasswd = @input.get("NewPassword") 
@quote = "'"

@command = "Set-ADAccountPassword " + instance_variable_get("@ADuser") + "-NewPassword " + "'" + instance_variable_get("@ADPasswd") + "'"


#@output.set("Result : #@services")
@log.trace('Calling WinRM Connector...')

call_connector = @call.connector("winrm")
                               .set("endpoint", @endpoint)
                               .set("username", @username)
                               .set("password", @password)
                               .set("shell", "ps")
                               .set("transport-type", "plaintext")
                               .set("command", @command)
                               .set("operation_timeout",80)

if @timeout.to_s.empty?
     connector_response = call_connector.sync
else
     connector_response = call_connector.set('timeout', @timeout).sync
end

# WinRM Connector Response Meta Parameters
response_exitcode = connector_response.exitcode       # Exit status code
response_message = connector_response.message         # Execution status messages

# WinRM Connector Response Parameters
response_body = connector_response.get('result')                # Response Body

if response_exitcode == 0
    @log.info("Success in executing WinRM Connector, where exitcode :: #{response_exitcode} | message :: #{response_message}")
    @log.info("Command executed :: #{@command} | Command execution results :: #{response_body}")
    @output.set('result', response_body)
    @log.trace("Finished executing 'winrm' flintbit with success...")
else
    @log.error("Failure in executing WinRM Connector where, exitcode :: #{response_exitcode} | message :: #{response_message}")
    #@output.set("result : ", services)
    @output.set('error', response_message)
    @log.trace("Finished executing 'winrm' flintbit with error...")
end

#rescue Exception => e
#    @log.error(e.message)
#    @output.set('message', e.message).set('exit-code', -1)
#    @log.info('output in exception')
#end
# end
