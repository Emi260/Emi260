--liquibase formatted sql
--changeset none:none enddelimiter:\nGO runOnChange:true
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[isValidateBusinessPartnerTransfer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[isValidateBusinessPartnerTransfer] AS' 
END
GO
	 --DECLARE @outField int;
	 --EXEC isValidateBusinessPartnerTransfer '22', @outField=@outField OUTPUT
	 --SELECT @outField
	ALTER PROCEDURE [dbo].[isValidateBusinessPartnerTransfer]
		@bp_Code varchar(255) NULL=NULL,
		@bp_EquivalentCode varchar(255) NULL=NULL,
		@bp_Name varchar(255) NULL=NULL,
		@bp_ShortName varchar(255) NULL=NULL,
		@bp_Phone varchar(255) NULL=NULL,
		@bp_Email varchar(255) NULL=NULL,
		@bp_WebSite varchar(255) NULL=NULL,
		@bp_PaymentMethod varchar(255) NULL=NULL,
		@bp_PaymentTerm varchar(255) NULL=NULL,
		@bp_IsCustomer varchar(255) NULL=NULL,
		@bp_IsVendor varchar(255) NULL=NULL,
		@bp_IsoCode varchar(255) NULL=NULL,
		@bp_Remarks varchar(255) NULL=NULL,
		@bpa_AddressTypeCode varchar(255) NULL=NULL,
		@bpa_Address1 varchar(255) NULL=NULL,
		@bpa_Address2 varchar(255) NULL=NULL,
		@bpa_Phone varchar(255) NULL=NULL,
		@bpa_Email varchar(255) NULL=NULL,
		@bpa_ZipCode varchar(255) NULL=NULL,
		@bpa_CityCode varchar(255) NULL=NULL,
		@bpa_StateCode varchar(255) NULL=NULL,
		@bpa_CountryCode varchar(255) NULL=NULL,
		@bpc_ContactTypeCode varchar(255) NULL=NULL,
		@bpc_Name varchar(255) NULL=NULL,
		@bpc_Phone varchar(255) NULL=NULL,
		@bpc_Phone1 varchar(255) NULL=NULL,
		@bpc_Email varchar(255) NULL=NULL,
		@bpc_IsMainContact varchar(255) NULL=NULL,
		@bpr_RoleTypeCode varchar(255) NULL=NULL,
		@bpdtd_DocumentTypeCode varchar(255) NULL=NULL,
		@bpdtd_DocumentTypeNumber varchar(255) NULL=NULL,
		@bpdtd_DocumentTypeCode2 varchar(255) NULL=NULL,
		@bpdtd_DocumentTypeNumber2 varchar(255) NULL=NULL,
		@bpdtd_DocumentStartDate2 varchar(255) NULL=NULL,
		@DocumentTypeExpirationDate2 varchar(255) NULL=NULL,
		@bpr_RoleTypeCode2 varchar(255) NULL=NULL,
		@bp_Ass_Code varchar(255) NULL=NULL,
		@bp_ContractNumber varchar(255) NULL=NULL,
		@bp_StartDate varchar(255) NULL=NULL,
		@bp_ExpirationDate varchar(255) NULL=NULL,
		@isValid int OUTPUT,
		@validationReport nvarchar(255) OUTPUT
	AS
	BEGIN
		SET NOCOUNT ON
		SELECT @isValid=1
		SELECT @validationReport='';
		DECLARE @Count INT=NULL;

		-- Valida si existe duplicidad de codigo
		SELECT @Count=COUNT(bp_Code)
		FROM BusinessPartnerTransfer
		WHERE bp_Code=@bp_Code;

		IF(@Count > 1)
		BEGIN
			SELECT @isValid=0;
			SELECT @validationReport='@bp_Code, duplicados - ' + CAST(@Count AS NVARCHAR(255)) + ' - ' + CAST( GETDATE() AS NVARCHAR(255));
		END

		-- Valida si todos tienen el numero de RUC
		IF ISNULL(@bpdtd_DocumentTypeNumber,'')=''
		BEGIN
			SELECT @isValid=0;
			SELECT @validationReport='@bpdtd_DocumentTypeNumber, está vacio' + ' - ' + CAST( GETDATE() AS NVARCHAR(255));
		END

		---- Valida que no existan RUC repetidos	
		--SELECT @Count=COUNT(bpdtd_DocumentTypeNumber)
		--FROM BusinessPartnerTransfer
		--WHERE bpdtd_DocumentTypeNumber=@bpdtd_DocumentTypeNumber;

		--IF(@Count > 1)
		--BEGIN
		--	SELECT @isValid=0;
		--	SELECT @validationReport='@bpdtd_DocumentTypeNumber, duplicados - ' + CAST(@Count AS NVARCHAR(255)) + ' - ' + CAST( GETDATE() AS NVARCHAR(255));
		--END

		-- 0099999999-9
		--select *
		--from BusinessPartnerTransfer
		--where bpdtd_documenttypenumber = '0099999999-9'
		
		-- Valida si todos tiene Tipo de Role cargado
		IF ISNULL(@bpr_RoleTypeCode,'')=''
		BEGIN
			SELECT @isValid=0;
			SELECT @validationReport='@bpr_RoleTypeCode, está vacio' + ' - ' + CAST( GETDATE() AS NVARCHAR(255));
		END

		-- Valida si existen codigos que no corresponden al nombre anteriormente cargados  (si se han cambiado los codigos para los carrier)
		SELECT @Count=COUNT(*)
		FROM BusinessPartnerTransfer a inner join BusinessPartner b
		ON a.bp_Code = b.Code
		WHERE bpr_RoleTypeCode = 'CAR'
			and a.bp_Code=@bp_Code 
			and a.bp_Name <> b.name;

		IF(@Count > 0)
		BEGIN
			SELECT @isValid=0;
			SELECT @validationReport='@bp_Code, no corresponde al nombre anteriormente cargado - ' + CAST(@Count AS NVARCHAR(255)) + ' - ' + CAST( GETDATE() AS NVARCHAR(255));
		END

	END
GO
