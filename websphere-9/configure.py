import java.lang.System as sys

server = AdminConfig.getid('/Server:server1/')
cell = AdminConfig.getid('/Cell:DefaultCell01/')

# Uninstall all default apps
AdminApp.uninstall('DefaultApplication')
AdminApp.uninstall('ivtApp')
AdminApp.uninstall('query')

# configure auto-deploy folder
md = AdminConfig.showAttribute(cell, "monitoredDirectoryDeployment")
AdminConfig.modify(md, [['enabled', "true"]])
AdminConfig.modify(md, [['pollingInterval', "1"]])
# Defalt is "/opt/IBM/WebSphere/AppServer/profiles/AppSrv01/monitoredDeployableApps"
#AdminConfig.modify(md, [['monitoredDirectory', "/newPath"]])

# Enable debug port
AdminTask.setJVMProperties('[-nodeName DefaultNode01 -serverName server1 -debugMode true -debugArgs "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=7777"]')
# Enable development-mode
AdminConfig.modify(server, [['developmentMode', 'true']])

print AdminConfig.show(md)

AdminConfig.save()

print 'Done.'