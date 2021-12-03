Reference Database: liquibase @ jdbc:sqlserver://localhost\\sqlexpress01:1434;maxResultBuffer=-1;sendTemporalDataTypesAsStringForBulkCopy=true;delayLoadingLobs=true;useFmtOnly=false;useBulkCopyForBatchInsert=false;cancelQueryTimeout=-1;sslProtocol=TLS;jaasConfigurationName=SQLJDBCDriver;statementPoolingCacheSize=0;serverPreparedStatementDiscardThreshold=10;enablePrepareOnFirstPreparedStatementCall=false;fips=false;socketTimeout=0;authentication=NotSpecified;authenticationScheme=nativeAuthentication;xopenStates=false;sendTimeAsDatetime=true;trustStoreType=JKS;trustServerCertificate=false;TransparentNetworkIPResolution=true;serverNameAsACE=false;sendStringParametersAsUnicode=true;selectMethod=direct;responseBuffering=adaptive;queryTimeout=-1;packetSize=8000;multiSubnetFailover=false;loginTimeout=15;lockTimeout=-1;lastUpdateCount=true;encrypt=false;disableStatementPooling=true;databaseName=liquibase;columnEncryptionSetting=Disabled;applicationName=Microsoft JDBC Driver for SQL Server;applicationIntent=readwrite; (Default Schema: dbo)
Comparison Database: liquibase @ offline:h2?snapshot=mySnapshot.json (Default Schema: dbo)
Compared Schemas: dbo
Product Name:
     Reference:   'Microsoft SQL Server'
     Target: 'Offline h2'
Product Version: EQUAL
Missing Catalog(s): 
     liquibase
Unexpected Catalog(s): NONE
Changed Catalog(s): NONE
Missing Column(s): 
     dbo.CUSTOMER2.AGE
     dbo.DATABASECHANGELOG.AUTHOR
     dbo.Scale.BitsData
     dbo.Scale.BitsSecond
     dbo.Scale.BitsStop
     dbo.Scale.COMDefault
     dbo.DATABASECHANGELOG.COMMENTS
     dbo.DATABASECHANGELOG.CONTEXTS
     dbo.vwAllocationFactorValue.Campo1
     dbo.vwDepotOrderFactors.Campo1
     dbo.vwDepotOrderFactorsBack.Campo1
     dbo.Scale.Code
     dbo.GateScale.CreatedBy
     dbo.Scale.CreatedBy
     dbo.GateScale.CreatedDate
     dbo.Scale.CreatedDate
     dbo.DATABASECHANGELOG.DATEEXECUTED
     dbo.DATABASECHANGELOG.DEPLOYMENT_ID
     dbo.DATABASECHANGELOG.DESCRIPTION
     dbo.DATABASECHANGELOG.EXECTYPE
     dbo.DATABASECHANGELOG.FILENAME
     dbo.Scale.FlowControl
     dbo.GateScale.GateId
     dbo.GateScale.GateScaleId
     dbo.CUSTOMER2.ID
     dbo.DATABASECHANGELOG.ID
     dbo.DATABASECHANGELOGLOCK.ID
     dbo.Scale.IpLAN
     dbo.GateScale.IsActive
     dbo.Scale.IsActive
     dbo.DATABASECHANGELOG.LABELS
     dbo.CUSTOMER2.LASTNAME
     dbo.DATABASECHANGELOG.LIQUIBASE
     dbo.DATABASECHANGELOGLOCK.LOCKED
     dbo.DATABASECHANGELOGLOCK.LOCKEDBY
     dbo.DATABASECHANGELOGLOCK.LOCKGRANTED
     dbo.Scale.LocalHost
     dbo.DATABASECHANGELOG.MD5SUM
     dbo.GateScale.ModifiedBy
     dbo.Scale.ModifiedBy
     dbo.GateScale.ModifiedDate
     dbo.Scale.ModifiedDate
     dbo.CUSTOMER2.NAME
     dbo.DATABASECHANGELOG.ORDEREXECUTED
     dbo.Scale.Paridad
     dbo.GateScale.RowStatus
     dbo.Scale.RowStatus
     dbo.GateScale.ScaleId
     dbo.Scale.ScaleId
     dbo.Scale.ScaleStatusId
     dbo.Scale.Serie
     dbo.DATABASECHANGELOG.TAG
     dbo.Scale.ValueIn
     dbo.Scale.Weight
     dbo.CUSTOMER2.YEAR
     dbo.Scale.YardId
     dbo.client.address1
     dbo.company.address1
     dbo.person.address1
     dbo.person_a8b.address1
     dbo.test.address1
     dbo.client.address2
     dbo.company.address2
     dbo.person.address2
     dbo.person_a8b.address2
     dbo.test.address2
     dbo.client.city
     dbo.company.city
     dbo.person.city
     dbo.person_a8b.city
     dbo.test.city
     dbo.happyNewTable.firstname
     dbo.client.id
     dbo.company.id
     dbo.happyNewTable.id
     dbo.person.id
     dbo.person_a8b.id
     dbo.test.id
     dbo.happyNewTable.lastname
     dbo.client.name
     dbo.company.name
     dbo.person.name
     dbo.person_a8b.name
     dbo.test.name
     dbo.pep.pepe
Unexpected Column(s): NONE
Changed Column(s): NONE
Missing Foreign Key(s): NONE
Unexpected Foreign Key(s): NONE
Changed Foreign Key(s): NONE
Missing Index(s): 
     PK_CUSTOMER2 UNIQUE  ON dbo.CUSTOMER2(ID, YEAR)
     PK_DATABASECHANGELOGLOCK UNIQUE  ON dbo.DATABASECHANGELOGLOCK(ID)
     PK__client__3213E83F930C2EED UNIQUE  ON dbo.client(id)
     PK__company__3213E83FD7F693B7 UNIQUE  ON dbo.company(id)
     PK__happyNew__3213E83F0ADB7AAE UNIQUE  ON dbo.happyNewTable(id)
     PK__person__3213E83F9F988FE2 UNIQUE  ON dbo.person(id)
     PK__person_a__3213E83FBE101A25 UNIQUE  ON dbo.person_a8b(id)
     PK__test__3213E83FEF65B165 UNIQUE  ON dbo.test(id)
     pkGateScale UNIQUE  ON dbo.GateScale(GateScaleId)
     pkScale UNIQUE  ON dbo.Scale(ScaleId)
Unexpected Index(s): NONE
Changed Index(s): NONE
Missing Primary Key(s): 
     PK_CUSTOMER2 on dbo.CUSTOMER2(ID, YEAR)
     PK_DATABASECHANGELOGLOCK on dbo.DATABASECHANGELOGLOCK(ID)
     PK__client__3213E83F930C2EED on dbo.client(id)
     PK__company__3213E83FD7F693B7 on dbo.company(id)
     PK__happyNew__3213E83F0ADB7AAE on dbo.happyNewTable(id)
     PK__person__3213E83F9F988FE2 on dbo.person(id)
     PK__person_a__3213E83FBE101A25 on dbo.person_a8b(id)
     PK__test__3213E83FEF65B165 on dbo.test(id)
     pkGateScale on dbo.GateScale(GateScaleId)
     pkScale on dbo.Scale(ScaleId)
Unexpected Primary Key(s): NONE
Changed Primary Key(s): NONE
Missing Schema(s): 
     liquibase.dbo
Unexpected Schema(s): NONE
Changed Schema(s): NONE
Missing Sequence(s): NONE
Unexpected Sequence(s): NONE
Changed Sequence(s): NONE
Missing Table(s): 
     CUSTOMER2
     DATABASECHANGELOG
     DATABASECHANGELOGLOCK
     GateScale
     Scale
     client
     company
     happyNewTable
     pep
     person
     person_a8b
     test
Unexpected Table(s): NONE
Changed Table(s): NONE
Missing Unique Constraint(s): NONE
Unexpected Unique Constraint(s): NONE
Changed Unique Constraint(s): NONE
Missing View(s): 
     vwAllocationFactorValue
     vwDepotOrderFactors
     vwDepotOrderFactorsBack
Unexpected View(s): NONE
Changed View(s): NONE
