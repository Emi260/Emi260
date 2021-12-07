-- *********************************************************************
-- Rollback 1 Change(s) Script
-- *********************************************************************
-- Change Log: samplechangelog.sql
-- Ran at: 6/12/21 18:09
-- Against: liquibase@jdbc:sqlserver://localhost\sqlexpress01:1434;maxResultBuffer=-1;sendTemporalDataTypesAsStringForBulkCopy=true;delayLoadingLobs=true;useFmtOnly=false;useBulkCopyForBatchInsert=false;cancelQueryTimeout=-1;sslProtocol=TLS;jaasConfigurationName=SQLJDBCDriver;statementPoolingCacheSize=0;serverPreparedStatementDiscardThreshold=10;enablePrepareOnFirstPreparedStatementCall=false;fips=false;socketTimeout=0;authentication=NotSpecified;authenticationScheme=nativeAuthentication;xopenStates=false;sendTimeAsDatetime=true;trustStoreType=JKS;trustServerCertificate=false;TransparentNetworkIPResolution=true;serverNameAsACE=false;sendStringParametersAsUnicode=true;selectMethod=direct;responseBuffering=adaptive;queryTimeout=-1;packetSize=8000;multiSubnetFailover=false;loginTimeout=15;lockTimeout=-1;lastUpdateCount=true;encrypt=false;disableStatementPooling=true;databaseName=liquibase;columnEncryptionSetting=Disabled;applicationName=Microsoft JDBC Driver for SQL Server;applicationIntent=readwrite;
-- Liquibase version: 4.3.1
-- *********************************************************************

USE liquibase;
GO

-- Lock Database
UPDATE DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = 'ITLQBPOCRVAR (192.168.11.163)', LOCKGRANTED = '2021-12-06T18:09:47.617' WHERE ID = 1 AND LOCKED = 0
GO

-- Rolling Back ChangeSet: samplechangelog.sql::3::script
drop table users
GO

DELETE FROM DATABASECHANGELOG WHERE ID = '3' AND AUTHOR = 'script' AND FILENAME = 'samplechangelog.sql'
GO

-- Release Database Lock
UPDATE DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1
GO

