@target1 = @input.get("target")
@usrname = @input.get("username")
@passw = @input.get("password")
@log.trace("Calling SSH Connector...")
connector_name_response = @call.connector("ssh")
                               .set("target",@target1) #Target machine hostname or ip address
                               .set("port",22)              #Target machine port,default 22
                               .set("type","exec")          #Shell execution type:shell or exec,default exec
                               .set("username",@usrname)  #Target machine username
                               .set("password",@passw)  #Target machine password
                               .set("command","sudo service nfs-kernel-server stop")    #Command to be executed on target machine
                               .set("timeout",60000)          #Optional timeout in milliseconds
                               .sync


if   connector_name_response.exitcode == 0
    @log.info("Success")
    connector_name_output = connector_name_response.get("result")
    @output.set("result","Service has stoped")
    @log.info("#{connector_name_output}")
end