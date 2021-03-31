--liquibase formatted sql
--changeset none:none enddelimiter:\nGO runOnChange:true
/****** Object:  StoredProcedure [dbo].[sp_AllNightLog]    Script Date: 8/14/2020 8:20:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON 
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AllNightLog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_AllNightLog] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_AllNightLog] AS RETURN 0;
GO
