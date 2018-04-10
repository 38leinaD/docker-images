import java.lang.System as sys

AdminApp.uninstall('DefaultApplication')

cell = AdminConfig.getid('/Cell:DefaultCell01/')
md = AdminConfig.showAttribute(cell, "monitoredDirectoryDeployment")
AdminConfig.modify(md, [['enabled', "true"]])
AdminConfig.modify(md, [['pollingInterval', "1"]])
#AdminConfig.modify(md, [['monitoredDirectory', "/newPath"]])

print AdminConfig.show(md)

AdminConfig.save()

print 'Done.'