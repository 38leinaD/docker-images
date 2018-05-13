import java.lang.System as sys

# Oracle
AdminTask.createAuthDataEntry(
    (
        '[-alias %s '
        '-user %s '
        '-password %s '
        '-description "%s"]'
    ) %
    (
        'oracle',
        'system',
        'oracle',
        'oracle user'
    )
)


oracleCredentials = 'DefaultNode01/oracle'
oracleXA = AdminTask.createJDBCProvider(
    (
        '[-scope Server=server1 '
        '-databaseType Oracle '
        '-providerType "Oracle JDBC Driver" '
        '-implementationType "XA data source" '
        '-name "Oracle JDBC Driver (XA)" '
        '-description "Oracle JDBC Driver" '
        '-classpath [ "/opt/ojdbc7.jar" ] '
        '-nativePath "" ]'
    )
)
AdminTask.createDatasource(
    oracleXA,
    (
        '[-name %s '
        '-jndiName %s '
        '-dataStoreHelperClassName com.ibm.websphere.rsadapter.Oracle11gDataStoreHelper '
        '-containerManagedPersistence %s '
        '-componentManagedAuthenticationAlias %s '
        '-configureResourceProperties [[URL java.lang.String %s]]]'
    ) %
    (
        'ORACLE',
        'ORACLE',
        'false',
        oracleCredentials,
        'jdbc:oracle:thin:@oracle:1521/XE'
    )
)

# PostgreSQÖ
AdminTask.createAuthDataEntry(
    (
        '[-alias %s '
        '-user %s '
        '-password %s '
        '-description "%s"]'
    ) %
    (
        'postgres',
        'postgres',
        'postgres',
        'postgres user'
    )
)


postgresCredentials = 'DefaultNode01/postgres'
postgresXA = AdminTask.createJDBCProvider(
    (
        '[-scope Server=server1 '
        '-databaseType User-defined '
        '-providerType "User-defined JDBC Provider" '
        '-implementationType "User-defined" '
        '-name "Postgres JDBC Provider" '
        '-description "PostgreSQL JDBC Driver" '
        '-classpath [ "/opt/postgresql-9.4.1209.jar" ] '
        '-nativePath "" '
        '-implementationClassName org.postgresql.jdbc3.Jdbc3ConnectionPool ]'
    )
)

postgresDatasource = AdminTask.createDatasource(
    postgresXA,
    (
        '[-name %s '
        '-jndiName %s '
        '-dataStoreHelperClassName com.ibm.websphere.rsadapter.GenericDataStoreHelper '
        '-containerManagedPersistence %s '
        '-componentManagedAuthenticationAlias %s ]'
    ) %
    (
        'POSTGRES',
        'POSTGRES',
        'false',
        postgresCredentials
    )
)

serverNameProp =  AdminConfig.create('J2EEResourceProperty', AdminConfig.showAttribute(postgresDatasource, 'propertySet'), [['name', 'serverName']])
AdminConfig.modify(serverNameProp, '[[name "serverName"] [type "java.lang.String"] [description ""] [value "postgres"] [required "false"]]')

databaseNameProp =  AdminConfig.create('J2EEResourceProperty', AdminConfig.showAttribute(postgresDatasource, 'propertySet'), [['name', 'databaseName']])
AdminConfig.modify(databaseNameProp, '[[name "databaseName"] [type "java.lang.String"] [description ""] [value "postgres"] [required "false"]]')

userProp =  AdminConfig.create('J2EEResourceProperty', AdminConfig.showAttribute(postgresDatasource, 'propertySet'), [['name', 'user']])
AdminConfig.modify(userProp, '[[name "user"] [type "java.lang.String"] [description ""] [value "postgres"] [required "false"]]')

passwordProp =  AdminConfig.create('J2EEResourceProperty', AdminConfig.showAttribute(postgresDatasource, 'propertySet'), [['name', 'password']])
AdminConfig.modify(passwordProp, '[[name "password"] [type "java.lang.String"] [description ""] [value "postgres"] [required "false"]]')

AdminConfig.save()

print 'Done.'