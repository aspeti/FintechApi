CREATE DATABASE FintechDB;
GO

USE FintechDB;
GO

CREATE PROCEDURE AssignBalancesToManagers
AS
BEGIN

    DECLARE @ManagerCount INT = 10;
    DECLARE @BalanceTable TABLE (Balance DECIMAL(10, 2));
    DECLARE @ManagerTable TABLE
    (
        ManagerID INT,
        AssignedBalance DECIMAL(10, 2)
    );
    DECLARE @ManagerId INT = 1;

    INSERT INTO @BalanceTable
    (
        Balance
    )
    VALUES (2277),
    (3953),
    (4726),
    (1414),
    (627),
    (1784),
    (1634),
    (3958),
    (2156),
    (1347),
    (2166),
    (820),
    (2325),
    (3613),
    (2389),
    (4130),
    (2007),
    (3027),
    (2591),
    (3940),
    (3888),
    (2975),
    (4470),
    (2291),
    (3393),
    (3588),
    (3286),
    (2293),
    (4353),
    (3315),
    (4900),
    (794),
    (4424),
    (4505),
    (2643),
    (2217),
    (4193),
    (2893),
    (4120),
    (3352),
    (2355),
    (3219),
    (3064),
    (4893),
    (272),
    (1299),
    (4725),
    (1900),
    (4927),
    (4011);

    DECLARE cursor_balances CURSOR FOR
    SELECT Balance
    FROM @BalanceTable
    ORDER BY Balance DESC;

    DECLARE @CurrentBalance DECIMAL(10, 2);

    OPEN cursor_balances;
    FETCH NEXT FROM cursor_balances
    INTO @CurrentBalance;

    WHILE @@FETCH_STATUS = 0
    BEGIN

        INSERT INTO @ManagerTable
        (
            ManagerID,
            AssignedBalance
        )
        VALUES
        (@ManagerId, @CurrentBalance);

        SET @ManagerId = @ManagerId + 1;

        IF @ManagerId > @ManagerCount
        BEGIN
            SET @ManagerId = 1;
        END
        FETCH NEXT FROM cursor_balances
        INTO @CurrentBalance;
    END

    CLOSE cursor_balances;
    DEALLOCATE cursor_balances;

    SELECT *
    FROM @ManagerTable;
END;
