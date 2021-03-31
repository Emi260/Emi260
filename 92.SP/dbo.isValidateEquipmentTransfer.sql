--liquibase formatted sql
--changeset none:none enddelimiter:\nGO runOnChange:true

/****** Object:  StoredProcedure [dbo].[isValidateEquipmentTransfer]    Script Date: 8/14/2020 8:20:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[isValidateEquipmentTransfer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[isValidateEquipmentTransfer] AS' 
END
GO
--- áíóú
	 --DECLARE @outField int;
	 --EXEC isValidateBusinessPartnerTransfer '22', @outField=@outField OUTPUT
	 --SELECT @outField
	ALTER PROCEDURE [dbo].[isValidateEquipmentTransfer]
		@EquipmentNo varchar(255) NULL=NULL,
		@EquipmentFamilyCode varchar(255) NULL=NULL,
		@EquipmentSizeTypeCode varchar(255) NULL=NULL,
		@OwnerPartnerCode varchar(255) NULL=NULL,
		@OwnerShipTypeCode varchar(255) NULL=NULL,
		@ManufacturerCode varchar(255) NULL=NULL,
		@ManufacturerCountryCode varchar(255) NULL=NULL,
		@ManufactureDate varchar(255) NULL=NULL,
		@WeightUnitCode varchar(255) NULL=NULL,
		@TareWeight varchar(255) NULL=NULL,
		@MaxGrossWeight varchar(255) NULL=NULL,
		@MaxPayloadWeight varchar(255) NULL=NULL,
		@MaterialTypeCode varchar(255) NULL=NULL,
		@DoorTypeCode varchar(255) NULL=NULL,
		@FloorTypeCode varchar(255) NULL=NULL,
		@CubicCapacity varchar(255) NULL=NULL,
		@CubicCapacityUnitCode varchar(255) NULL=NULL,
		@DimensionUnitCode varchar(255) NULL=NULL,
		@InsideLength varchar(255) NULL=NULL,
		@InsideWidth varchar(255) NULL=NULL,
		@InsideHeight varchar(255) NULL=NULL,
		@OutsideLength varchar(255) NULL=NULL,
		@OutsideWidth varchar(255) NULL=NULL,
		@OutsideHeight varchar(255) NULL=NULL,
		@DoorLength varchar(255) NULL=NULL,
		@DoorWidth varchar(255) NULL=NULL,
		@DoorHeight varchar(255) NULL=NULL,
		@VIN varchar(255) NULL=NULL,
		@isValid int OUTPUT,
		@validationReport nvarchar(255) OUTPUT
	AS
	BEGIN
		SET NOCOUNT ON;
		SELECT @isValid=1;
		SELECT @validationReport='';
		DECLARE @Count INT=NULL;

		-- Valida que no exista duplicidad de numero de equipo
		SELECT @Count=COUNT(EquipmentNo)
		FROM EquipmentTransfer
		WHERE EquipmentNo=@EquipmentNo;

		IF(@Count > 1)
		BEGIN
			SELECT @isValid=0;
			SELECT @validationReport='@EquipmentNo, duplicados - ' + CAST(@Count AS NVARCHAR(255)) + ' - ' + CAST( GETDATE() AS NVARCHAR(255));
		END

		-- validar datos completos
		IF	ISNULL(@EquipmentFamilyCode, '') = ''
		BEGIN
			SELECT @isValid=0;
			SELECT @validationReport='@EquipmentFamilyCode, está vacio' + ' - ' + CAST( GETDATE() AS NVARCHAR(255));
		END
		IF	ISNULL(@EquipmentSizeTypeCode,'') = ''
		BEGIN
			SELECT @isValid=0;
			SELECT @validationReport='@EquipmentSizeTypeCode, está vacio' + ' - ' + CAST( GETDATE() AS NVARCHAR(255));
		END
		IF	ISNULL(@OwnerPartnerCode, '') = ''
		BEGIN
			SELECT @isValid=0;
			SELECT @validationReport='@OwnerPartnerCode, está vacio' + ' - ' + CAST( GETDATE() AS NVARCHAR(255));
		END
		--IF	ISNULL(@ManufacturerCode, '') = ''
		--BEGIN
		--	SELECT @isValid=0;
		--	SELECT @validationReport='@ManufacturerCode, está vacio' + ' - ' + CAST( GETDATE() AS NVARCHAR(255));
		--END

		-- valida datos
		IF(ISNULL(@TareWeight,'')<>'' AND ISNUMERIC(@TareWeight)=0)
		BEGIN
			SELECT @isValid=0;
			SELECT @validationReport='@TareWeight, no es un número' + ' - ' + CAST( GETDATE() AS NVARCHAR(255));
		END
		IF(ISNULL(@MaxGrossWeight,'')<>'' AND ISNUMERIC(@MaxGrossWeight)=0)
		BEGIN
			SELECT @isValid=0;
			SELECT @validationReport='@MaxGrossWeight, no es un número' + ' - ' + CAST( GETDATE() AS NVARCHAR(255));
		END
		IF(ISNULL(@MaxPayloadWeight,'')<>'' AND ISNUMERIC(@MaxPayloadWeight)=0)
		BEGIN
			SELECT @isValid=0;
			SELECT @validationReport='@MaxPayloadWeight, no es un número' + ' - ' + CAST( GETDATE() AS NVARCHAR(255));
		END

		----update EquipmentTransfer
		----set TareWeight = '0'
		----, MaxGrossWeight = '0'
		----, MaxPayloadWeight = '0'
		----where TareWeight like '%.%'
		----or MaxGrossWeight like '%.%'
		----or MaxPayloadWeight like '%.%'
		
		-- Valida si es fecha válida
		IF(ISNULL(@ManufactureDate,'')<>'' AND ISDATE(@ManufactureDate)=0)
		BEGIN
			SELECT @isValid=0;
			SELECT @validationReport='@ManufactureDate, no es una fecha válida' + ' - ' + CAST( GETDATE() AS NVARCHAR(255));
		END
	END
GO
