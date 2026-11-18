--This is the way you can load a csv file into a table using the BULK INSERT 
--There is a lot more options that the 3 that we used in the WIRH so check them
--also the method that is used is the truncate table so we dont have eny errors

USE DataWarehousePriject
GO;
--And create a procedure becouse this will be usded in a daily basis

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN 
	BEGIN TRY
		--===================================================================================================================
		TRUNCATE TABLE bronze.crm_cust_info
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\Julio Miranda\Desktop\dataaawareh\sql-data-warehouse-project-main\01_datasets\source_crm\cust_info.csv'
		WITH 
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		--===================================================================================================================
		TRUNCATE TABLE bronze.crm_prd_info
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\Julio Miranda\Desktop\dataaawareh\sql-data-warehouse-project-main\01_datasets\source_crm\prd_info.csv'
		WITH 
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
	
		--===================================================================================================================
		TRUNCATE TABLE bronze.crm_sales_details
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\Julio Miranda\Desktop\dataaawareh\sql-data-warehouse-project-main\01_datasets\source_crm\sales_details.csv'
		WITH 
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
	
		--===================================================================================================================
		TRUNCATE TABLE bronze.erp_cust_az12
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\Julio Miranda\Desktop\dataaawareh\sql-data-warehouse-project-main\01_datasets\source_erp\CUST_AZ12.csv'
		WITH 
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
	
		--===================================================================================================================
		TRUNCATE TABLE bronze.erp_loc_a101
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\Julio Miranda\Desktop\dataaawareh\sql-data-warehouse-project-main\01_datasets\source_erp\LOC_A101.csv'
		WITH 
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
	
		--===================================================================================================================
		TRUNCATE TABLE bronze.erp_px_cat_g1v2
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\Julio Miranda\Desktop\dataaawareh\sql-data-warehouse-project-main\01_datasets\source_erp\PX_CAT_G1V2.csv'
		WITH 
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
	
		PRINT 'All actions were concreted correctly without errors';
	END TRY

	BEGIN CATCH
		PRINT '===========================================';
		PRINT 'An ERROR Ocurred while trying execute procedure: silver.load_silver	';
		PRINT CONCAT('ERROR Message: ', ERROR_MESSAGE());
		PRINT CONCAT('ERROR Number: ', CAST(ERROR_NUMBER() AS NVARCHAR));
		PRINT '===========================================';
	END CATCH
END
