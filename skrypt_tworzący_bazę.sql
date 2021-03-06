USE [master]
GO
/****** Object:  Database [L1Stasko]    Script Date: 06.12.2018 16:07:50 ******/
CREATE DATABASE [L1Stasko]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'L1Stasko', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\L1Stasko.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'L1Stasko_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\L1Stasko_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [L1Stasko] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [L1Stasko].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [L1Stasko] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [L1Stasko] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [L1Stasko] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [L1Stasko] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [L1Stasko] SET ARITHABORT OFF 
GO
ALTER DATABASE [L1Stasko] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [L1Stasko] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [L1Stasko] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [L1Stasko] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [L1Stasko] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [L1Stasko] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [L1Stasko] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [L1Stasko] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [L1Stasko] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [L1Stasko] SET  DISABLE_BROKER 
GO
ALTER DATABASE [L1Stasko] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [L1Stasko] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [L1Stasko] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [L1Stasko] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [L1Stasko] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [L1Stasko] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [L1Stasko] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [L1Stasko] SET RECOVERY FULL 
GO
ALTER DATABASE [L1Stasko] SET  MULTI_USER 
GO
ALTER DATABASE [L1Stasko] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [L1Stasko] SET DB_CHAINING OFF 
GO
ALTER DATABASE [L1Stasko] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [L1Stasko] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [L1Stasko]
GO
/****** Object:  Table [dbo].[Klasa]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klasa](
	[idKlasa] [int] IDENTITY(1,1) NOT NULL,
	[nazwa] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idKlasa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nauczyciel]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nauczyciel](
	[idNauczyciel] [int] IDENTITY(1,1) NOT NULL,
	[imie] [varchar](255) NOT NULL,
	[nazwisko] [varchar](255) NOT NULL,
	[adres] [varchar](255) NOT NULL,
	[nr_tel] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idNauczyciel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ocena]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ocena](
	[idOcena] [int] IDENTITY(1,1) NOT NULL,
	[stopien] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idOcena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Przedmiot]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Przedmiot](
	[idPrzedmiot] [int] IDENTITY(1,1) NOT NULL,
	[nazwa] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPrzedmiot] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uczen]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uczen](
	[idUczen] [int] IDENTITY(1,1) NOT NULL,
	[imie] [varchar](255) NOT NULL,
	[nazwisko] [varchar](255) NOT NULL,
	[adres] [varchar](255) NOT NULL,
	[nr_tel] [int] NOT NULL,
	[idKlasa] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idUczen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wynik]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wynik](
	[idWynik] [int] IDENTITY(1,1) NOT NULL,
	[idPrzedmiot] [int] NOT NULL,
	[idNauczyciel] [int] NOT NULL,
	[idUczen] [int] NOT NULL,
	[idOcena] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idWynik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Order Subtotals]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Order Subtotals] AS
SELECT "Order Details".OrderID, Sum(CONVERT(money,("Order Details".UnitPrice*Quantity*(1-Discount)/100))*100) AS Subtotal
FROM "Order Details"
GROUP BY "Order Details".OrderID
GO
/****** Object:  View [dbo].[Sales Totals by Amount]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Sales Totals by Amount] AS
SELECT "Order Subtotals".Subtotal AS SaleAmount, Orders.OrderID, Customers.CompanyName, Orders.ShippedDate
FROM 	Customers INNER JOIN 
		(Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID) 
	ON Customers.CustomerID = Orders.CustomerID
WHERE ("Order Subtotals".Subtotal >2500) AND (Orders.ShippedDate BETWEEN '19970101' And '19971231')
GO
/****** Object:  View [dbo].[Order Details Extended]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Order Details Extended] AS
SELECT "Order Details".OrderID, "Order Details".ProductID, Products.ProductName, 
	"Order Details".UnitPrice, "Order Details".Quantity, "Order Details".Discount, 
	(CONVERT(money,("Order Details".UnitPrice*Quantity*(1-Discount)/100))*100) AS ExtendedPrice
FROM Products INNER JOIN "Order Details" ON Products.ProductID = "Order Details".ProductID
--ORDER BY "Order Details".OrderID
GO
/****** Object:  View [dbo].[Sales by Category]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Sales by Category] AS
SELECT Categories.CategoryID, Categories.CategoryName, Products.ProductName, 
	Sum("Order Details Extended".ExtendedPrice) AS ProductSales
FROM 	Categories INNER JOIN 
		(Products INNER JOIN 
			(Orders INNER JOIN "Order Details Extended" ON Orders.OrderID = "Order Details Extended".OrderID) 
		ON Products.ProductID = "Order Details Extended".ProductID) 
	ON Categories.CategoryID = Products.CategoryID
WHERE Orders.OrderDate BETWEEN '19970101' And '19971231'
GROUP BY Categories.CategoryID, Categories.CategoryName, Products.ProductName
--ORDER BY Products.ProductName
GO
/****** Object:  View [dbo].[Summary of Sales by Quarter]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Summary of Sales by Quarter] AS
SELECT Orders.ShippedDate, Orders.OrderID, "Order Subtotals".Subtotal
FROM Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID
WHERE Orders.ShippedDate IS NOT NULL
--ORDER BY Orders.ShippedDate
GO
/****** Object:  View [dbo].[Summary of Sales by Year]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Summary of Sales by Year] AS
SELECT Orders.ShippedDate, Orders.OrderID, "Order Subtotals".Subtotal
FROM Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID
WHERE Orders.ShippedDate IS NOT NULL
--ORDER BY Orders.ShippedDate
GO
/****** Object:  View [dbo].[Product Sales for 1997]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Product Sales for 1997] AS
SELECT Categories.CategoryName, Products.ProductName, 
Sum(CONVERT(money,("Order Details".UnitPrice*Quantity*(1-Discount)/100))*100) AS ProductSales
FROM (Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID) 
	INNER JOIN (Orders 
		INNER JOIN "Order Details" ON Orders.OrderID = "Order Details".OrderID) 
	ON Products.ProductID = "Order Details".ProductID
WHERE (((Orders.ShippedDate) Between '19970101' And '19971231'))
GROUP BY Categories.CategoryName, Products.ProductName
GO
/****** Object:  View [dbo].[Category Sales for 1997]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Category Sales for 1997] AS
SELECT "Product Sales for 1997".CategoryName, Sum("Product Sales for 1997".ProductSales) AS CategorySales
FROM "Product Sales for 1997"
GROUP BY "Product Sales for 1997".CategoryName
GO
/****** Object:  View [dbo].[Alphabetical list of products]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Alphabetical list of products] AS
SELECT Products.*, Categories.CategoryName
FROM Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
WHERE (((Products.Discontinued)=0))
GO
/****** Object:  View [dbo].[Current Product List]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Current Product List] AS
SELECT Product_List.ProductID, Product_List.ProductName
FROM Products AS Product_List
WHERE (((Product_List.Discontinued)=0))
--ORDER BY Product_List.ProductName
GO
/****** Object:  View [dbo].[Customer and Suppliers by City]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Customer and Suppliers by City] AS
SELECT City, CompanyName, ContactName, 'Customers' AS Relationship 
FROM Customers
UNION SELECT City, CompanyName, ContactName, 'Suppliers'
FROM Suppliers
--ORDER BY City, CompanyName
GO
/****** Object:  View [dbo].[Invoices]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Invoices] AS
SELECT Orders.ShipName, Orders.ShipAddress, Orders.ShipCity, Orders.ShipRegion, Orders.ShipPostalCode, 
	Orders.ShipCountry, Orders.CustomerID, Customers.CompanyName AS CustomerName, Customers.Address, Customers.City, 
	Customers.Region, Customers.PostalCode, Customers.Country, 
	(FirstName + ' ' + LastName) AS Salesperson, 
	Orders.OrderID, Orders.OrderDate, Orders.RequiredDate, Orders.ShippedDate, Shippers.CompanyName As ShipperName, 
	"Order Details".ProductID, Products.ProductName, "Order Details".UnitPrice, "Order Details".Quantity, 
	"Order Details".Discount, 
	(CONVERT(money,("Order Details".UnitPrice*Quantity*(1-Discount)/100))*100) AS ExtendedPrice, Orders.Freight
FROM 	Shippers INNER JOIN 
		(Products INNER JOIN 
			(
				(Employees INNER JOIN 
					(Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID) 
				ON Employees.EmployeeID = Orders.EmployeeID) 
			INNER JOIN "Order Details" ON Orders.OrderID = "Order Details".OrderID) 
		ON Products.ProductID = "Order Details".ProductID) 
	ON Shippers.ShipperID = Orders.ShipVia
GO
/****** Object:  View [dbo].[Orders Qry]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Orders Qry] AS
SELECT Orders.OrderID, Orders.CustomerID, Orders.EmployeeID, Orders.OrderDate, Orders.RequiredDate, 
	Orders.ShippedDate, Orders.ShipVia, Orders.Freight, Orders.ShipName, Orders.ShipAddress, Orders.ShipCity, 
	Orders.ShipRegion, Orders.ShipPostalCode, Orders.ShipCountry, 
	Customers.CompanyName, Customers.Address, Customers.City, Customers.Region, Customers.PostalCode, Customers.Country
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GO
/****** Object:  View [dbo].[Products Above Average Price]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Products Above Average Price] AS
SELECT Products.ProductName, Products.UnitPrice
FROM Products
WHERE Products.UnitPrice>(SELECT AVG(UnitPrice) From Products)
--ORDER BY Products.UnitPrice DESC
GO
/****** Object:  View [dbo].[Products by Category]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Products by Category] AS
SELECT Categories.CategoryName, Products.ProductName, Products.QuantityPerUnit, Products.UnitsInStock, Products.Discontinued
FROM Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
WHERE Products.Discontinued <> 1
--ORDER BY Categories.CategoryName, Products.ProductName
GO
/****** Object:  View [dbo].[Quarterly Orders]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Quarterly Orders] AS
SELECT DISTINCT Customers.CustomerID, Customers.CompanyName, Customers.City, Customers.Country
FROM Customers RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderDate BETWEEN '19970101' And '19971231'
GO
ALTER TABLE [dbo].[Uczen]  WITH CHECK ADD  CONSTRAINT [FK_Uczen_Klasa] FOREIGN KEY([idKlasa])
REFERENCES [dbo].[Klasa] ([idKlasa])
GO
ALTER TABLE [dbo].[Uczen] CHECK CONSTRAINT [FK_Uczen_Klasa]
GO
ALTER TABLE [dbo].[Wynik]  WITH CHECK ADD  CONSTRAINT [FK_Wynik_Nauczyciel] FOREIGN KEY([idNauczyciel])
REFERENCES [dbo].[Nauczyciel] ([idNauczyciel])
GO
ALTER TABLE [dbo].[Wynik] CHECK CONSTRAINT [FK_Wynik_Nauczyciel]
GO
ALTER TABLE [dbo].[Wynik]  WITH CHECK ADD  CONSTRAINT [FK_Wynik_Ocena] FOREIGN KEY([idOcena])
REFERENCES [dbo].[Ocena] ([idOcena])
GO
ALTER TABLE [dbo].[Wynik] CHECK CONSTRAINT [FK_Wynik_Ocena]
GO
ALTER TABLE [dbo].[Wynik]  WITH CHECK ADD  CONSTRAINT [FK_Wynik_Przedmiot] FOREIGN KEY([idPrzedmiot])
REFERENCES [dbo].[Przedmiot] ([idPrzedmiot])
GO
ALTER TABLE [dbo].[Wynik] CHECK CONSTRAINT [FK_Wynik_Przedmiot]
GO
ALTER TABLE [dbo].[Wynik]  WITH CHECK ADD  CONSTRAINT [FK_Wynik_Uczen] FOREIGN KEY([idUczen])
REFERENCES [dbo].[Uczen] ([idUczen])
GO
ALTER TABLE [dbo].[Wynik] CHECK CONSTRAINT [FK_Wynik_Uczen]
GO
/****** Object:  StoredProcedure [dbo].[CustOrderHist]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CustOrderHist] @CustomerID nchar(5)
AS
SELECT ProductName, Total=SUM(Quantity)
FROM Products P, [Order Details] OD, Orders O, Customers C
WHERE C.CustomerID = @CustomerID
AND C.CustomerID = O.CustomerID AND O.OrderID = OD.OrderID AND OD.ProductID = P.ProductID
GROUP BY ProductName
GO
/****** Object:  StoredProcedure [dbo].[CustOrdersDetail]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CustOrdersDetail] @OrderID int
AS
SELECT ProductName,
    UnitPrice=ROUND(Od.UnitPrice, 2),
    Quantity,
    Discount=CONVERT(int, Discount * 100), 
    ExtendedPrice=ROUND(CONVERT(money, Quantity * (1 - Discount) * Od.UnitPrice), 2)
FROM Products P, [Order Details] Od
WHERE Od.ProductID = P.ProductID and Od.OrderID = @OrderID
GO
/****** Object:  StoredProcedure [dbo].[CustOrdersOrders]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CustOrdersOrders] @CustomerID nchar(5)
AS
SELECT OrderID, 
	OrderDate,
	RequiredDate,
	ShippedDate
FROM Orders
WHERE CustomerID = @CustomerID
ORDER BY OrderID
GO
/****** Object:  StoredProcedure [dbo].[Employee Sales by Country]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Employee Sales by Country] 
@Beginning_Date DateTime, @Ending_Date DateTime AS
SELECT Employees.Country, Employees.LastName, Employees.FirstName, Orders.ShippedDate, Orders.OrderID, "Order Subtotals".Subtotal AS SaleAmount
FROM Employees INNER JOIN 
	(Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID) 
	ON Employees.EmployeeID = Orders.EmployeeID
WHERE Orders.ShippedDate Between @Beginning_Date And @Ending_Date
GO
/****** Object:  StoredProcedure [dbo].[Sales by Year]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Sales by Year] 
	@Beginning_Date DateTime, @Ending_Date DateTime AS
SELECT Orders.ShippedDate, Orders.OrderID, "Order Subtotals".Subtotal, DATENAME(yy,ShippedDate) AS Year
FROM Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID
WHERE Orders.ShippedDate Between @Beginning_Date And @Ending_Date
GO
/****** Object:  StoredProcedure [dbo].[SalesByCategory]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SalesByCategory]
    @CategoryName nvarchar(15), @OrdYear nvarchar(4) = '1998'
AS
IF @OrdYear != '1996' AND @OrdYear != '1997' AND @OrdYear != '1998' 
BEGIN
	SELECT @OrdYear = '1998'
END

SELECT ProductName,
	TotalPurchase=ROUND(SUM(CONVERT(decimal(14,2), OD.Quantity * (1-OD.Discount) * OD.UnitPrice)), 0)
FROM [Order Details] OD, Orders O, Products P, Categories C
WHERE OD.OrderID = O.OrderID 
	AND OD.ProductID = P.ProductID 
	AND P.CategoryID = C.CategoryID
	AND C.CategoryName = @CategoryName
	AND SUBSTRING(CONVERT(nvarchar(22), O.OrderDate, 111), 1, 4) = @OrdYear
GROUP BY ProductName
ORDER BY ProductName
GO
/****** Object:  StoredProcedure [dbo].[Ten Most Expensive Products]    Script Date: 06.12.2018 16:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Ten Most Expensive Products] AS
SET ROWCOUNT 10
SELECT Products.ProductName AS TenMostExpensiveProducts, Products.UnitPrice
FROM Products
ORDER BY Products.UnitPrice DESC
GO
USE [master]
GO
ALTER DATABASE [L1Stasko] SET  READ_WRITE 
GO
