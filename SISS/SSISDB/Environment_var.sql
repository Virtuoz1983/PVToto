/*
Before running the script, nesecary to create the catalog SSISDB
*/

-- Create folder LoadHD in SSIDB
GO
Declare @folder_id bigint
EXEC [SSISDB].[catalog].[create_folder] @folder_name=N'LoadHD', @folder_id=@folder_id OUTPUT
Select @folder_id
EXEC [SSISDB].[catalog].[set_folder_description] @folder_name=N'LoadHD', @folder_description=N''
GO

/*
Now it nesecsary make deploy project and refresh
*/

-- create environment variable
GO
EXEC [SSISDB].[catalog].[create_environment] @environment_name=N'HTTPConnectionMarTiragesHistory', @environment_description=N'', @folder_name=N'LoadHD'
GO

-- add variable
GO
DECLARE @var sql_variant = N'http://www.marathontotoservice.com/sttot/HistoryTotal17/HistoryTotalsMT.xls'
EXEC [SSISDB].[catalog].[create_environment_variable] @variable_name=N'ExtVar1', @sensitive=False, @description=N'', @environment_name=N'HTTPConnectionMarTiragesHistory', @folder_name=N'LoadHD', @value=@var, @data_type=N'String'
GO

-- configure references environment
GO
Declare @reference_id bigint
EXEC [SSISDB].[catalog].[create_environment_reference] @environment_name=N'HTTPConnectionMarTiragesHistory', @reference_id=@reference_id OUTPUT, @project_name=N'VTtoto', @folder_name=N'LoadHD', @reference_type=R
Select @reference_id
GO

/*
and then you can execute the project with parameters
*/
