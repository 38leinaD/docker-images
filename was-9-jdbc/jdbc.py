import java.lang.System as sys

def findJAASAlias(pAlias):
    allAuthDataEntries = AdminTask.listAuthDataEntries().splitlines()
    fullQualifiedJAASName = ""
    for i in allAuthDataEntries:
            if(i.find(pAlias) != -1):
                cellManager = i[i.find('alias ')+6:i.find("/")]
                fullQualifiedJAASName = cellManager + "/" + pAlias
    return fullQualifiedJAASName

AdminTask.createAuthDataEntry('[-alias %s -user %s -password %s -description \'%s\']'%('oracle', 'system', 'oracle', 'oracle user'))
oracleCredentials = findJAASAlias('oracle')
oracleXA = AdminTask.createJDBCProvider('[-scope Server=server1 -databaseType Oracle -providerType "Oracle JDBC Driver" -implementationType "XA data source" -name "Oracle JDBC Driver (XA)" -description "Oracle JDBC Driver" -classpath [ "/opt/ojdbc7.jar" ] -nativePath "" ]')
AdminTask.createDatasource(oracleXA, '[-name %s -jndiName %s -dataStoreHelperClassName com.ibm.websphere.rsadapter.Oracle11gDataStoreHelper -containerManagedPersistence %s -componentManagedAuthenticationAlias %s -configureResourceProperties [[URL java.lang.String %s]]]'%('ORACLE_DS', 'ORACLE_DS', 'false', oracleCredentials, 'jdbc:oracle:thin:@oracle:1521/XE'))

AdminConfig.save()

print 'Done.'