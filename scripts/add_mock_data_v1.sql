BULK INSERT Member
FROM '/tmp//members.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    ERRORFILE = '/tmp//members_error.csv',
    TABLOCK
)