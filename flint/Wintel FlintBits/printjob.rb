# begin
@log.trace("Started executing 'flint-util:winrm-ruby:negotiate.rb' flintbit...")

@endpoint = @input.get("endpoint")               # Endpoint where the command will be executed
@username = @input.get("username")               # Target username
@password = @input.get("password")               # Target password
@file = @input.get("Computername")
@var = "Invoke-Command -ComputerName -ScriptBlock { get-service } -credential Administrator"
@log.trace('Calling WinRM Connector...')

call_connector = @call.connector("winrm")
                               .set("endpoint", @endpoint)
                               .set("username", @username)
                               .set("password", @password)

                               .set("shell", "ps")
                               .set("transport-type", "plaintext")
                               .set("command","@var")
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

@log.trace('Calling WinRM Connector...')

call_connector = @call.connector(@connector_name)
                               .set("endpoint", @endpoint)
                               .set("username", @username)
                               .set("password", @password)
                               .set("shell", @shell)
                               .set("transport-type", @transport_type)
                               .set("command",@command)
                               .set("operation_timeout",@operation_timeout)

if @timeout.to_s.empty?
     connector_response = call_connector.sync
else
     connector_response = call_connector.set('timeout', @timeout).sync
end

#rescue Exception => e
#    @log.error(e.message)
#    @output.set('message', e.message).set('exit-code', -1)
#    @log.info('output in exception')
#end
# end
