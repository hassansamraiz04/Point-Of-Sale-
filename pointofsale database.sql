USE [master]
GO
/****** Object:  Database [POS]    Script Date: 11/30/2024 1:45:17 PM ******/
CREATE DATABASE [POS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'POS', FILENAME = N'D:\sql\MSSQL16.SQLEXPRESS\MSSQL\DATA\POS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'POS_log', FILENAME = N'D:\sql\MSSQL16.SQLEXPRESS\MSSQL\DATA\POS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [POS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [POS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [POS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [POS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [POS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [POS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [POS] SET ARITHABORT OFF 
GO
ALTER DATABASE [POS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [POS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [POS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [POS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [POS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [POS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [POS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [POS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [POS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [POS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [POS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [POS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [POS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [POS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [POS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [POS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [POS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [POS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [POS] SET  MULTI_USER 
GO
ALTER DATABASE [POS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [POS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [POS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [POS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [POS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [POS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [POS] SET QUERY_STORE = ON
GO
ALTER DATABASE [POS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [POS]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employ]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employ](
	[EmployeeID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Designation] [varchar](50) NULL,
	[PhoneNo] [int] NULL,
	[Address] [varchar](100) NULL,
	[Email] [varchar](50) NULL,
	[CNIC] [int] NULL,
	[BirthDate] [date] NULL,
	[Salary] [int] NULL,
	[JoiningDate] [date] NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[AccessibilityStatus] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Designation] [varchar](50) NULL,
	[PhoneNo] [int] NULL,
	[Address] [varchar](100) NULL,
	[Email] [varchar](50) NULL,
	[CNIC] [int] NULL,
	[BirthDate] [date] NULL,
	[Salary] [int] NULL,
	[JoiningDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] NOT NULL,
	[ProductName] [varchar](50) NULL,
	[CategoryID] [int] NULL,
	[PurchasePrice] [int] NULL,
	[SalePrice] [int] NULL,
	[Stock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleDetail]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleDetail](
	[SalesDetailID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SalesID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [int] NULL,
	[Discount] [int] NULL,
	[SoldPrice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[SalesID] [int] NOT NULL,
	[Date] [date] NULL,
	[UserID] [int] NOT NULL,
	[TotalAmount] [int] NULL,
	[TotalDiscount] [int] NULL,
	[GrandTotal] [int] NULL,
	[CustomerName] [varchar](50) NULL,
	[CustomerPhNo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[UserID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Password] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[SaleDetail]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[SaleDetail]  WITH CHECK ADD FOREIGN KEY([SalesID])
REFERENCES [dbo].[Sales] ([SalesID])
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserLogin] ([UserID])
GO
ALTER TABLE [dbo].[UserLogin]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
/****** Object:  StoredProcedure [dbo].[add_employ]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[add_employ] @empID int, @empName varchar(50),@designation varchar(50), @PhoneNo int,@address varchar(50),@email varchar(50),@cnic int, @bdate date,@salary int,@joindate date,@UserName varchar(50),@Password varchar(50),@AccessibilityStatus int
as
insert into Employ values(@empID, @empName,@designation, @PhoneNo,@address ,@email ,@cnic, @bdate,@salary ,@joindate,@UserName,@Password,@AccessibilityStatus)
GO
/****** Object:  StoredProcedure [dbo].[add_employee]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[add_employee] @empID int, @empName varchar(50),@designation varchar(50), @PhoneNo int,@address varchar(50),@email varchar(50),@cnic int, @bdate date,@salary int,@joindate date
as
insert into Employee values(@empID, @empName,@designation, @PhoneNo,@address ,@email ,@cnic, @bdate,@salary ,@joindate)
GO
/****** Object:  StoredProcedure [dbo].[add_info_of_sale]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[add_info_of_sale] @SalesDetailID int, @ProductID int, @SalesID int, @Quantity int, @Price int,
@Discount int, @SoldPrice int
as
insert into SaleDetail values(@SalesDetailID, @ProductID, @SalesID, @Quantity, @Price, @Discount, @SoldPrice)

GO
/****** Object:  StoredProcedure [dbo].[add_product]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[add_product] @ProductID int, @ProductName varchar(50), @CategoryID int, @PurchasePrice int,
@SalePrice int, @Stock int
as
insert into Products values(@ProductID, @ProductName, @CategoryID, @PurchasePrice, @SalePrice, @Stock)

GO
/****** Object:  StoredProcedure [dbo].[add_product_after_return]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[add_product_after_return] @SalesDetailID int, @ProductID int, @quantity int
as
declare @SalesID int
select @SalesID = SalesID
from SaleDetail
where ProductID = @ProductID
update Sales
set TotalAmount = TotalAmount - @quantity
where SalesID = @SalesID
delete SalesDetailID
from SaleDetail
where SalesDetailID = @SalesDetailID
update Products
set Stock = Stock + @quantity
where ProductID = @ProductID
GO
/****** Object:  StoredProcedure [dbo].[Add_saleDetail_Info]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_saleDetail_Info]
    @SalesID INT,
    @ProductID INT,
    @Quantity INT,
    @Price INT,
    @Discount INT,
    @SoldPrice INT
AS
BEGIN
    -- Generate a new SalesDetailID based on MAX(SalesDetailID) + 1
    DECLARE @NewSalesDetailID INT;
    SELECT @NewSalesDetailID = ISNULL(MAX(SalesDetailID), 0) + 1 FROM SaleDetail;

    -- Insert sale detail information
    INSERT INTO SaleDetail (SalesDetailID, SalesID, ProductID, Quantity, Price, Discount, SoldPrice)
    VALUES (@NewSalesDetailID, @SalesID, @ProductID, @Quantity, @Price, @Discount, @SoldPrice);
END;
GO
/****** Object:  StoredProcedure [dbo].[add_userlogin]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[add_userlogin] @userID int, @employeeid int,@password int
as
insert into UserLogin values( @userID, @employeeid,@password)


GO
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddProduct]
    @ProductID INT,
    @ProductName VARCHAR(50),
    @CategoryID INT,
    @CategoryName VARCHAR(50),
    @PurchasePrice INT,
    @SalePrice INT,
    @Quantity INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ProductExists INT = 0;
    DECLARE @ProductNameExists INT = 0;
    DECLARE @CategoryIDExistsInProducts INT = 0;
    DECLARE @CategoryIDExistsInCategory INT = 0;
    DECLARE @CategoryNameExistsInCategory INT = 0;

    -- Check if the ProductID and ProductName exist in the Products table
    SELECT 
        @ProductExists = COUNT(*) 
    FROM Products
    WHERE ProductID = @ProductID AND ProductName = @ProductName;

    -- Check if the CategoryID exists in the Products table
    SELECT 
        @CategoryIDExistsInProducts = COUNT(*)
    FROM Products
    WHERE CategoryID = @CategoryID;

    -- Check if the CategoryID exists in the Category table
    SELECT 
        @CategoryIDExistsInCategory = COUNT(*)
    FROM Category
    WHERE CategoryID = @CategoryID;

    -- Check if the CategoryName exists in the Category table
    SELECT 
        @CategoryNameExistsInCategory = COUNT(*)
    FROM Category
    WHERE CategoryName = @CategoryName;

    -- If either ProductID or ProductName exists but Category differs, handle Category insertion
    IF @ProductExists = 1 AND (@CategoryIDExistsInCategory = 0 OR @CategoryNameExistsInCategory = 0)
    BEGIN
        -- Insert into Category table if necessary
        IF @CategoryIDExistsInCategory = 0
        BEGIN
            INSERT INTO Category (CategoryID, CategoryName)
            VALUES (@CategoryID, @CategoryName);
            PRINT 'Category inserted into Category table.';
        END

        -- No action needed in Products table since ProductID and ProductName exist
        PRINT 'Category exists or updated. No action needed in Products table.';
        RETURN;
    END

    -- If ProductID and ProductName do not exist, handle inserting product and category
    IF @ProductExists = 0
    BEGIN
        -- Insert into Category table if necessary
        IF @CategoryIDExistsInCategory = 0
        BEGIN
            INSERT INTO Category (CategoryID, CategoryName)
            VALUES (@CategoryID, @CategoryName);
            PRINT 'Category inserted into Category table.';
        END

        -- Insert the product into Products table
        INSERT INTO Products (ProductID, ProductName, CategoryID, PurchasePrice, SalePrice, Stock)
        VALUES (@ProductID, @ProductName, @CategoryID, @PurchasePrice, @SalePrice, @Quantity);

        PRINT 'Product inserted into Products table.';
    END

    -- If Category exists but ProductID or ProductName differs, handle product insertion
    IF @CategoryIDExistsInCategory = 1 OR @CategoryNameExistsInCategory = 1
    BEGIN
        -- Insert the product into Products table if Category exists
        IF @ProductExists = 0
        BEGIN
            -- Insert into Products table
            INSERT INTO Products (ProductID, ProductName, CategoryID, PurchasePrice, SalePrice, Stock)
            VALUES (@ProductID, @ProductName, @CategoryID, @PurchasePrice, @SalePrice, @Quantity);
            PRINT 'Product inserted into Products table.';
        END
        RETURN;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[All_sales_of_this_product]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[All_sales_of_this_product] @ProductID int
as
select count(ProductID) as All_sales_of_this_product
from SaleDetail
where ProductID = @ProductID
group by ProductID
GO
/****** Object:  StoredProcedure [dbo].[All_stocks]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[All_stocks] @CategoryID int
as
select * 
from Products
where CategoryID = @CategoryID
GO
/****** Object:  StoredProcedure [dbo].[CheckQuantityAvailability]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckQuantityAvailability]
    @ProductID INT,
    @Quantity INT,
    @QuantityAvailable INT OUTPUT -- Added OUTPUT parameter
AS
BEGIN
    -- Check if the quantity is available
    IF EXISTS (
        SELECT 1
        FROM Products
        WHERE ProductID = @ProductID
          AND Stock >= @Quantity
    )
    BEGIN
        -- Quantity is available
        SET @QuantityAvailable = 1;
    END
    ELSE
    BEGIN
        -- Quantity is not available
        SET @QuantityAvailable = 0;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[customerdetail]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[customerdetail] as
select CustomerPhNo,CustomerName,count(CustomerName) as NoOfPurchases
from Sales
group by CustomerPhNo,CustomerName

GO
/****** Object:  StoredProcedure [dbo].[Daily_Report]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Daily_Report]
@current_date date

as
begin

	select s.SalesID, s.TotalAmount, s.TotalDiscount, s.GrandTotal, s.GrandTotal - sum(p.purchasePrice) as Profit
	from Sales s
	join SaleDetail sd on s.SalesID = sd.SalesID
	join Products p on p.ProductID = sd.ProductID 
	where s.Date = @current_date
	group by s.SalesID, s.TotalAmount, s.TotalDiscount, s.GrandTotal
	
end



GO
/****** Object:  StoredProcedure [dbo].[Daily_Report_Sum]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Daily_Report_Sum]
    @current_date DATE,
    @ts VARCHAR(50) OUTPUT,
    @ta VARCHAR(50) OUTPUT,
    @tp VARCHAR(50) OUTPUT
AS
BEGIN
    -- Temporary table to hold aggregated sales data
    CREATE TABLE #SalesSummary (
        SalesID INT,
        TotalAmount DECIMAL(10, 2),
        TotalDiscount DECIMAL(10, 2),
        GrandTotal DECIMAL(10, 2),
        Profit DECIMAL(10, 2)
    )

    -- Insert aggregated sales data into the temporary table
    INSERT INTO #SalesSummary (SalesID, TotalAmount, TotalDiscount, GrandTotal, Profit)
    SELECT
        s.SalesID,
        s.TotalAmount,
        s.TotalDiscount,
        s.GrandTotal,
        s.GrandTotal - ISNULL(SUM(p.PurchasePrice), 0) AS Profit
    FROM
        Sales s
    JOIN
        SaleDetail sd ON s.SalesID = sd.SalesID
    JOIN
        Products p ON p.ProductID = sd.ProductID
    WHERE
        s.Date = @current_date
    GROUP BY
        s.SalesID,
        s.TotalAmount,
        s.TotalDiscount,
        s.GrandTotal

    -- Select the aggregated data into output parameters
    SELECT
        @ts = COUNT(*),
        @ta = CONVERT(VARCHAR(50), SUM(ss.GrandTotal)),
        @tp = CONVERT(VARCHAR(50), SUM(ss.Profit))
    FROM
        #SalesSummary ss

    -- Drop the temporary table
    DROP TABLE #SalesSummary
END
GO
/****** Object:  StoredProcedure [dbo].[Daily_Report_With_Sum]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Daily_Report_With_Sum]
    @current_date DATE,
    @TotalSales DECIMAL(10, 2) OUTPUT,
    @TotalAmount DECIMAL(10, 2) OUTPUT,
    @TotalProfit DECIMAL(10, 2) OUTPUT
AS
BEGIN
    -- Temporary table to hold aggregated sales data
    CREATE TABLE #SalesSummary (
        TotalSales DECIMAL(10, 2),
        TotalAmount DECIMAL(10, 2),
        TotalProfit DECIMAL(10, 2)
    )

    -- Insert aggregated sales data into the temporary table
    INSERT INTO #SalesSummary (TotalSales, TotalAmount, TotalProfit)
    SELECT
        SUM(s.TotalAmount) AS TotalSales,
        SUM(s.GrandTotal) AS TotalAmount,
        SUM(s.GrandTotal - p.PurchasePrice) AS TotalProfit
    FROM
        Sales s
    JOIN
        SaleDetail sd ON s.SalesID = sd.SalesID
    JOIN
        Products p ON p.ProductID = sd.ProductID
    WHERE
        s.Date = @current_date

    -- Retrieve the aggregated values and assign to OUTPUT parameters
    SELECT
        @TotalSales = TotalSales,
        @TotalAmount = TotalAmount,
        @TotalProfit = TotalProfit
    FROM
        #SalesSummary

    -- Drop the temporary table
    DROP TABLE #SalesSummary
END
GO
/****** Object:  StoredProcedure [dbo].[display_employ]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[display_employ]
as
select * from Employ
GO
/****** Object:  StoredProcedure [dbo].[display_employees]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[display_employees]
as
select * from Employee
GO
/****** Object:  StoredProcedure [dbo].[display_products]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[display_products]
as
select *
from Products
GO
/****** Object:  StoredProcedure [dbo].[FinalizeSale]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FinalizeSale]
    @SalesID INT,
    @Date DATE,
    @UserID INT,
    @TotalAmount DECIMAL(10, 2),
    @TotalDiscount DECIMAL(10, 2),
    @GrandTotal DECIMAL(10, 2),
    @CustomerName VARCHAR(50),
    @CustomerPhNo VARCHAR(15)
AS
BEGIN
    -- Update the Sales table with the provided data
    UPDATE Sales
    SET 
        Date = @Date,
        UserID = @UserID,
        TotalAmount = @TotalAmount,
        TotalDiscount = @TotalDiscount,
        GrandTotal = @GrandTotal,
        CustomerName = @CustomerName,
        CustomerPhNo = @CustomerPhNo
    WHERE SalesID = @SalesID;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetSaleDetailsSum]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSaleDetailsSum]
    @SalesID INT
AS
BEGIN
    -- Calculate the sum of SoldPrice for the given SalesID
    SELECT SUM(SoldPrice) AS TotalSoldPrice
    FROM SaleDetail
    WHERE SalesID = @SalesID;
END;
GO
/****** Object:  StoredProcedure [dbo].[Init_sale]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Init_sale]
    @UserID INT -- Accept UserID as a parameter
AS
BEGIN
    DECLARE @NewSalesID INT;

    -- Generate the next SalesID (assuming sequential values are required)
    SELECT @NewSalesID = ISNULL(MAX(SalesID), 0) + 1 FROM Sales;

    -- Insert the new sale record with the provided UserID
    INSERT INTO Sales (SalesID, Date, UserID, TotalAmount)
    VALUES (@NewSalesID, GETDATE(), @UserID, -1);
END;
GO
/****** Object:  StoredProcedure [dbo].[Low_inventory]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Low_inventory] as
select ProductID,ProductName
from Products
where Stock <= 2
GO
/****** Object:  StoredProcedure [dbo].[Monthly_Report]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Monthly_Report]
@current_month int,
@current_year int 

as
begin
	
	select s.SalesID, s.TotalAmount, s.TotalDiscount, s.GrandTotal, s.GrandTotal - sum(p.purchasePrice) as Profit
	from Sales s
	join SaleDetail sd on s.SalesID = sd.SalesID
	join Products p on p.ProductID = sd.ProductID 
	where month(s.Date) = @current_month and year(s.Date) = @current_year
	group by s.SalesID, s.TotalAmount, s.TotalDiscount, s.GrandTotal
	
end

GO
/****** Object:  StoredProcedure [dbo].[Monthly_Report_Sum]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Monthly_Report_Sum]
    @current_month int,
    @current_year int, 
    @ts VARCHAR(50) OUTPUT,
    @ta VARCHAR(50) OUTPUT,
    @tp VARCHAR(50) OUTPUT
AS
BEGIN
    -- Temporary table to hold aggregated sales data
    CREATE TABLE #SalesSummary (
        SalesID INT,
        TotalAmount DECIMAL(10, 2),
        TotalDiscount DECIMAL(10, 2),
        GrandTotal DECIMAL(10, 2),
        Profit DECIMAL(10, 2)
    )

    -- Insert aggregated sales data into the temporary table
    INSERT INTO #SalesSummary (SalesID, TotalAmount, TotalDiscount, GrandTotal, Profit)
    SELECT
        s.SalesID,
        s.TotalAmount,
        s.TotalDiscount,
        s.GrandTotal,
        s.GrandTotal - ISNULL(SUM(p.PurchasePrice), 0) AS Profit
    FROM
        Sales s
    JOIN
        SaleDetail sd ON s.SalesID = sd.SalesID
    JOIN
        Products p ON p.ProductID = sd.ProductID
    WHERE
        month(s.Date) = @current_month and year(s.Date) = @current_year
    GROUP BY
        s.SalesID,
        s.TotalAmount,
        s.TotalDiscount,
        s.GrandTotal

    -- Select the aggregated data into output parameters
    SELECT
        @ts = COUNT(*),
        @ta = CONVERT(VARCHAR(50), SUM(ss.GrandTotal)),
        @tp = CONVERT(VARCHAR(50), SUM(ss.Profit))
    FROM
        #SalesSummary ss

    -- Drop the temporary table
    DROP TABLE #SalesSummary
END
GO
/****** Object:  StoredProcedure [dbo].[most_demand_product]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[most_demand_product] as
select top 1 saleDetail.ProductID,ProductName
from SaleDetail join Products on SaleDetail.ProductID = Products.ProductID
group by saleDetail.ProductID ,ProductName
order by count(saleDetail.ProductID) desc 



GO
/****** Object:  StoredProcedure [dbo].[remove_employ]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[remove_employ] @employID int
as
delete from Employ
where EmployeeID =  @employID

delete from UserLogin
where EmployeeID =  @employID


GO
/****** Object:  StoredProcedure [dbo].[remove_employee]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[remove_employee] @employeeID int
as
delete from Employee
where EmployeeID =  @employeeID

delete from UserLogin
where EmployeeID =  @employeeID


GO
/****** Object:  StoredProcedure [dbo].[remove_product]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[remove_product] @ProductID int
as
delete from Products
where ProductID =  @ProductID
GO
/****** Object:  StoredProcedure [dbo].[remove_product_after_sale]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[remove_product_after_sale] @ProductID int, @quantity int
as
update Products
set stock = stock - @quantity
where ProductID = @ProductID
GO
/****** Object:  StoredProcedure [dbo].[RemoveQuantityAndUpdateSaleDetails]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveQuantityAndUpdateSaleDetails]
    @salesID INT,
    @productID INT,
    @quantityToRemove INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the product exists
    IF NOT EXISTS (SELECT 1 FROM Products WHERE ProductID = @productID)
    BEGIN
        THROW 50000, 'Product does not exist.', 1;
    END

    -- Declare a variable to store the current quantity in SaleDetail
    DECLARE @currentQuantity INT;

    -- Retrieve the current quantity from SaleDetail
    SELECT @currentQuantity = Quantity
    FROM SaleDetail
    WHERE SalesID = @salesID AND ProductID = @productID;

    -- Check if sale detail exists
    IF @currentQuantity IS NULL
    BEGIN
        THROW 50001, 'Sale detail not found for the given SalesID and ProductID.', 1;
    END

    -- Check if the quantity to remove is greater than the current quantity
    IF @currentQuantity < @quantityToRemove
    BEGIN
        THROW 50002, 'Invalid quantity to remove. Exceeds current sale quantity.', 1;
    END

    -- Increase the stock in the Products table
    UPDATE Products
    SET Stock = Stock + @quantityToRemove
    WHERE ProductID = @productID;

    -- Update the sale details in the SaleDetail table
    -- Here, we just subtract the quantity from the existing sale detail
    UPDATE SaleDetail
    SET Quantity = Quantity - @quantityToRemove,
        SoldPrice = SoldPrice - (Price * @quantityToRemove)
    WHERE SalesID = @salesID AND ProductID = @productID;

    -- Check if rows were updated
    IF @@ROWCOUNT = 0
    BEGIN
        THROW 50003, 'No rows were updated. Please verify the data and check the matching SalesID and ProductID.', 1;
    END

    -- Remove the sale detail if quantity becomes zero
    DELETE FROM SaleDetail
    WHERE SalesID = @salesID AND ProductID = @productID AND Quantity = 0;

    -- Check if rows were deleted
    IF @@ROWCOUNT = 0
    BEGIN
        THROW 50004, 'No rows were deleted after quantity became zero. Please verify the data.', 1;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[RemoveSaleTotals]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveSaleTotals]
    @salesID INT,
    @totalAmount INT,
    @totalDiscount INT,
    @grandTotal INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Update the Sales table by reducing totals
    UPDATE Sales
    SET
        TotalAmount = TotalAmount - @totalAmount,
        TotalDiscount = TotalDiscount - @totalDiscount,
        GrandTotal = GrandTotal - @grandTotal
    WHERE SalesID = @salesID;

    -- Check if the update affected any rows
    IF @@ROWCOUNT = 0
    BEGIN
        THROW 50000, 'No sale found with the provided SalesID.', 1;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[return_product]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[return_product]
    @ProductID INT,
    @Quantity INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Update the stock in the Products table
    UPDATE Products
    SET Stock = Stock + @Quantity
    WHERE ProductID = @ProductID;

    -- Check if the update affected any rows
    IF @@ROWCOUNT = 0
    BEGIN
        THROW 50000, 'Product does not exist.', 1;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[update_employ]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[update_employ] @employeeid int,@designation varchar(50),@phNo int, @address varchar(50), @salary int, @UserName varchar(50),@Password varchar(50),@AccessibilityStatus int
as
update Employ
set 
Designation = @designation,
PhoneNo = @phNo,
Address = @address,
Salary = @salary,
UserName = @UserName,
Password = @Password,
AccessibilityStatus = @AccessibilityStatus
where EmployeeID = @employeeid
GO
/****** Object:  StoredProcedure [dbo].[update_employee]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[update_employee] @employeeid int,@designation varchar(50),@phNo int, @address varchar(50), @salary int
as
update Employee
set 
Designation = @designation,
PhoneNo = @phNo,
Address = @address,
Salary = @salary
where EmployeeID = @employeeid
GO
/****** Object:  StoredProcedure [dbo].[update_product]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[update_product]
    @ProductID INT,
    @ProductName VARCHAR(50),
    @CategoryID INT,
    @PurchasePrice INT,
    @SalePrice INT,
    @Quantity INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ProductExists INT = 0;
    DECLARE @CategoryExistsInCategory INT = 0;

    -- Check if the Product exists by ProductID
    SELECT @ProductExists = COUNT(*) 
    FROM Products
    WHERE ProductID = @ProductID;

    -- Check if the CategoryID exists in the Category table
    SELECT @CategoryExistsInCategory = COUNT(*)
    FROM Category
    WHERE CategoryID = @CategoryID;

    -- Validate that the Product exists before attempting to update
    IF @ProductExists = 0
    BEGIN
        PRINT 'Product does not exist.';
        RETURN;
    END

    -- If the CategoryID in the Products table is to be changed, validate the new CategoryID exists in the Category table
    IF @CategoryExistsInCategory = 0 AND @CategoryID <> (SELECT CategoryID FROM Products WHERE ProductID = @ProductID)
    BEGIN
        PRINT 'New CategoryID does not exist in the Category table.';
        RETURN;
    END

    -- Update the Product table
    UPDATE Products
    SET 
        ProductName = @ProductName,
        CategoryID = @CategoryID,  -- Update CategoryID if it exists
        PurchasePrice = @PurchasePrice,
        SalePrice = @SalePrice,
        Stock = @Quantity
    WHERE ProductID = @ProductID;

    PRINT 'Product updated successfully.';
END;
GO
/****** Object:  StoredProcedure [dbo].[User_authentication]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_authentication]
    @UserName VARCHAR(50),
    @Password VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the provided username and password exist in the Employ table
    SELECT EmployeeID, Name, Designation
    FROM dbo.Employ
    WHERE UserName = @UserName AND Password = @Password;
END
GO
/****** Object:  StoredProcedure [dbo].[Yearly_Report]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Yearly_Report]
@current_year int 

as
begin
	
	select s.SalesID, s.TotalAmount, s.TotalDiscount, s.GrandTotal, s.GrandTotal - sum(p.purchasePrice) as Profit
	from Sales s
	join SaleDetail sd on s.SalesID = sd.SalesID
	join Products p on p.ProductID = sd.ProductID 
	where year(s.Date) = @current_year
	group by s.SalesID, s.TotalAmount, s.TotalDiscount, s.GrandTotal
	
end
GO
/****** Object:  StoredProcedure [dbo].[Yearly_Report_Sum]    Script Date: 11/30/2024 1:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Yearly_Report_Sum]
	@current_year int,
    @ts VARCHAR(50) OUTPUT,
    @ta VARCHAR(50) OUTPUT,
    @tp VARCHAR(50) OUTPUT
AS
BEGIN
    -- Temporary table to hold aggregated sales data
    CREATE TABLE #SalesSummary (
        SalesID INT,
        TotalAmount DECIMAL(10, 2),
        TotalDiscount DECIMAL(10, 2),
        GrandTotal DECIMAL(10, 2),
        Profit DECIMAL(10, 2)
    )

    -- Insert aggregated sales data into the temporary table
    INSERT INTO #SalesSummary (SalesID, TotalAmount, TotalDiscount, GrandTotal, Profit)
    SELECT
        s.SalesID,
        s.TotalAmount,
        s.TotalDiscount,
        s.GrandTotal,
        s.GrandTotal - ISNULL(SUM(p.PurchasePrice), 0) AS Profit
    FROM
        Sales s
    JOIN
        SaleDetail sd ON s.SalesID = sd.SalesID
    JOIN
        Products p ON p.ProductID = sd.ProductID
    WHERE
        year(s.Date) = @current_year
    GROUP BY
        s.SalesID,
        s.TotalAmount,
        s.TotalDiscount,
        s.GrandTotal

    -- Select the aggregated data into output parameters
    SELECT
        @ts = COUNT(*),
        @ta = CONVERT(VARCHAR(50), SUM(ss.GrandTotal)),
        @tp = CONVERT(VARCHAR(50), SUM(ss.Profit))
    FROM
        #SalesSummary ss

    -- Drop the temporary table
    DROP TABLE #SalesSummary
END
GO
USE [master]
GO
ALTER DATABASE [POS] SET  READ_WRITE 
GO
