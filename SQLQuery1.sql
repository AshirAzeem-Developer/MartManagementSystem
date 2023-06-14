------create database Mart_Management_system


----               --<<<<<-------------------STORE--------------------->>>>>

------create table store
------(
------StoreID int,
------Storename varchar(20),
------Storelocation varchar(20),
------PhoneNumber varchar(11),
------Email varchar(20),
------constraint pk_store primary key (StoreID)
------)
------1)department            
------create table department
------(
------DepartmentID int,
------StoreID int,
------DeptName varchar(20),
------DeptMgr varchar(20),
------constraint pk_department primary key (Departmentid),
------constraint fk_store foreign key (StoreID) references store(StoreID)
------)

------2)ZipCode
------create table ZipCode(
------Zipcode varchar(5),
------city varchar(20),
------State varchar(20),
------constraint pk_zip primary key (zipCode),
------)



------3)LOCATION
------create table location 
------(
------locationid int,
------StreetNO varchar(10),
------Zipcode varchar(5),
------HouseNo varchar(30),
------area varchar (20),
------constraint pk_location primary key (locationid),
------ constraint fk_zip_code foreign key (zipcode) references zipcode (zipcode)
------)



------4)login
------create table login 
------(
------loginid varchar(20),
------UserName varchar(20),
------Email varchar(20),
------Password varchar(11),
------Timelogin varchar(10),
------Timeloginout varchar(10),
------constraint pk_login primary key (loginid)
------)



------5)EMPLOYEE
------create table Employee
------(
------EmployeeID  int,
------EmpFirstName varchar(20),
------EmpLastName varchar(20),
------DOB varchar (10),
------DOJ varchar (10),
------PhoneNumber varchar(11),
------OfficeNo varchar(11),
------Gender varchar (4),
------MGRID int,
------DepartmentID int,
------locationid int,
------Loginid varchar(20),
------constraint pk_employee primary key (employeeID),
------constraint fk_employee foreign key (departmentID) references department(departmentID),
------constraint fk_emp_loc foreign key (locationID) references location(locationID),
------constraint fk_emplogin foreign key (loginid) references login(loginid),
------)



----------6)ROLE
------create table Role (
------RoleID int,
------name varchar (20),
------constraint pk_Role primary key (RoleID)
------)



--------7)ROLE_EMP
------create table Role_Emp
------(
------EmpID int,
------RoleID int,
------constraint pk_Role_Emp primary key (EmpID),
------constraint fk_Role_Emp foreign key(roleid) references Role(RoleID)
------)




--------8)EXTRAALLOWANCE

------create table extraAllowance
------(
------ExtraHours varchar(10),
------extraAmount varchar(10),
------constraint pk_extraAllowance primary key (ExtraHours)
------)
------9)amount detect
------create table AmountDeduct(
------AbsentHours varchar(10),
------Amount_Deduct varchar (10),
------constraint pk_amountdeduct primary key (absentHours)
------)


------10) payroll
------create table payroll
------(
------PayRolID int,
------basicsalary varchar(20),
------Date_Created varchar(10),
------PresentHours int,
------AbsentHours varchar(10),
------ExtraHours varchar(10),
------Employeeid int,
------constraint pk_payroll primary key (PayRolID),
------constraint fk_payroll foreign key (extrahours) references  extraAllowance(ExtraHours),
------constraint fk_absent foreign key (absenthours) references  AmountDeduct(absenthours),
------constraint fk_payroll_emp foreign key (employeeid) references employee(employeeid)
------)





---- --<<<<<-------------------HR--------------------->>>>>
---- --1)HR
---- --create table HR(
---- --DepartmentID int,
---- --HRSpeedDial  varchar(20),
---- --HRDetails varchar(20),
---- --constraint fk_DepartmentID foreign key (DepartmentID) references department(DepartmentID)
---- --)
---- --2)FeedBack
---- --create table Feedback (
---- --FeedbackID int,
---- --DepartmentID int,
---- --UserName varchar(20),
---- --UserContact varchar(11),
---- --UserEmail varchar (20),
---- --Description varchar (30),
---- --constraint pk_feedback primary key (FeedbackID),
---- --constraint fk_feedback foreign key (DepartmentID) references Department(departmentid)

---- --)
----  --3)leave 
---- -- create table Leave (
---- -- LeaveId int,
---- -- UsedLeave int,
---- -- BalancedLeave int,
---- -- EmployeeId int,
---- --constraint pk_leave primary key (Leaveid),
---- --constraint fk_leave foreign key (employeeid) references Employee(employeeid)
  
---- -- )
----  --4)appraisal
---- -- create table Appraisal (
---- -- AprraisalID int,
---- -- DataRecorded int,
---- -- QualityScore int,
---- -- EfficiencyScore int,
---- -- EmployeeId int,
---- --constraint pk_appraisal primary key (AprraisalID),
---- --constraint fk_appraisal foreign key (employeeid) references Employee(employeeid)

---- -- )

---- --<<<<<-------------------FINANCE--------------------->>>>>
------1)Transaction1
---- --create table   Transaction1(
---- --TransactionID int,
---- --TransactionDate varchar(10),
---- --Details varchar(30),
---- --DepartmentID int,
---- --constraint pk_TransactionID  primary key (TransactionID),
---- --constraint fk_Transaction1 foreign key (DepartmentID) references department(DepartmentID),
---- --)



---- --2)Report
---- --create table   Report(
---- --ReportID int,
---- --ReportStartDate varchar(10),
---- --ReportEndDate varchar(10),
---- --constraint pk_ReportID  primary key (ReportID),

---- --)

---- --3)TransactionReport
---- --create table   TransactionReport(
---- --TransactionID int,
---- --ReportID int,
---- --constraint fk_TransactionReportID  foreign key (TransactionID) references Transaction1(TransactionID),
---- --constraint fk_TransactionReport  foreign key (ReportID) references Report(ReportID),
---- --)

----  --4)Finance
---- --create table   Finance(
---- --DepartmentID int,
---- --FinanceSpeedDial varchar(11),
---- --constraint pk_FinanceDepartmentID primary key (DepartmentID) ,
---- --constraint fk_FinanceDepartmentID  foreign key (DepartmentID) references Department(DepartmentID),
---- --)

----  --5)Payment 
----  --create table Payment
----  --(
----  --PaymentID int ,
----  --TransactionID int,
----  --constraint Pk_PaymentID primary key (PaymentID),
----  --constraint Fk_TransactionID foreign key (TransactionID) references Transaction1(TransactionID),
----  --)


----  --6)cash
----  --create table Cash (
----  --CashID  int ,
----  --PaymentID int ,
----  --constraint Pk_CashID primary key (CashID),
----  --constraint Fk_PaymentID foreign key (PaymentID) references Payment(PaymentID),
----  --)

----  --7)Income Statement
----  --  create table Income_Statement (
----  --IncomeID  int ,
----  --Total_Revenue int,
----  --Total_Expenses int ,
----  --NetIncome int,
----  --ReportID int,
----  --StartDate varchar (10),
----  --EndDate varchar (10),
----  --constraint Pk_IncomeID primary key (IncomeID),
----  --constraint Fk_ReportID foreign key (ReportID) references Report(ReportID),
----  --)

----  --8)CREDITCARD

----  --create table CreditCard(
----  --CreditCardID int,
----  --PaymentID int,
----  --OwnerName varchar(20),
----  --CreditCardNo  varchar(16),
----  --amount int,
----  --constraint Pk_CreditCardID primary key (CreditCardID),
----  --constraint Fk_CreditCardPaymentID foreign key (PaymentID) references Payment(PaymentID),
----  --)

----  --9)Product
----  --create table product (
----  --ProductID int,
----  --ProductName varchar(20),
----  --ProductPrice int,
----  --ProductDescription varchar(30),
----  --ProductBarCode varchar (12),
----  --CategoryID int,
----  --BrandID int,
----  --constraint Pk_ProductID primary key ( ProductID),

----  --)
----    --10)Invoice
---- -- create table Invoice(
---- --InvoiceId int,
---- --ReportId int,
---- -- constraint Pk_ProductInvoiceId primary key (InvoiceId),
---- -- constraint Fk_ProductInvoice foreign key (ReportID) references Report(ReportID),
---- --)

----  --11)Product_Invoice
----  --create table Product_Invoice
----  --(
----  --InvoiceID int,
----  --ProductID int,
----  --constraint fk_product_Invoice Foreign Key ( InvoiceID ) references Invoice ( InvoiceID ),
----  --constraint fk_productIDInvoice Foreign Key (  ProductID ) references  Product (  ProductID ),
----  --)


------   --<<<<<-------------------ADMIN--------------------->>>>>
------ --1)ORDER1
------ create table Order1(
------ OrderID int,
------ OrderDate varchar(20),
------ EmployeeId int,
------ constraint pk_ORDER1 primary key (orderid),
------ constraint fk_order1 foreign key (employeeID) references Employee(employeeID)
------ )

 
------ --2)Product_Order
------  create Table Product_Order(
------  OrderID int,
------  ProductID int,
------  Ordered_Quantity int,
------  constraint fk_ProductOrderorderID foreign key (OrderID) references Order1(OrderId),
------  constraint fk_ProductOrder  foreign key ( ProductID ) references product( ProductID )
------  )

------  --3)Admin

------  create table ADMIN (
------  DepartmentID int,
------  AdminSpeedDial varchar (11),
------  AdminDetails varchar (30),
------  constraint pk_Admin primary key (DepartmentID),
------  constraint fk_admin foreign key (departmentid)  references department (DepartmentID)
------  )

------ --4)category
------ create table category(
------ categoryID int,
------ CategoryName varchar(20),
------ CategoryDescription varchar (30),
------ constraint pk_categoryId primary key (categoryId)

------ )
------ --5)brand
------ create table brand
------ (
------ BrandID int,
------ BrandName varchar(20),
------ BrandDescription varchar(20),
------ constraint pk_BrandID primary Key (brandid)
------ )
------ --6)supplier
------create table supplier(
------SupplierID int,
------SupplierName varchar(20),
------CompanyName varchar(20),
------CompanyLocation varchar(20),
------PhoneNO varchar (11)
------constraint pk_supplierid primary key (SupplierID)
------)

------ --7)supplier_product
------ create table supplier_product(
------ SupplierID int,
------ ProductID int,
------ constraint fk_supplierID foreign key (supplierID) references supplier (supplierID),
------ constraint fk_productID foreign key (productid) references product (productid)
------ )

------ --8)stock
------ create table stock(
------ SKU int,
------ productid int,
------ NOTES varchar (20),
------ quantity int,
------ constraint pk_stocksku primary key (SKU),
------ )

------ --9)promotion
------ create table Promotion(
------ PromotionID int,
------ promotionName varchar (20),
------ promotionStartDate varchar (10),
------ promotionEndDate varchar (10),
------ constraint pk_promotionid primary key ( PromotionID)

------ )
------ --10)PRODUCT PROMO
------ CREATE TABLE Product_Promo(
------ ProductID int,
------ PromotionID int,
------ newonce int,
------ constraint fk_productid foreign key (promotionid) references promotion (PromotionID),
------ constraint fk_productIDpromo foreign key (productid) references product (productid)
------ )

------ alter table product
------ add constraint fk_categoryid foreign key (categoryid)references category(categoryid),
------ constraint fk_brandid foreign key (brandid)references category(categoryid)




------=========================================================================
------=====================			DDL					=====================			 
------=========================================================================


------=====================			Store				=====================			 

------INSERT INTO store (StoreID, StoreName, Storelocation,PhoneNumber,Email) 
------VALUES
------(1,'1 General Store', 'Memon Goth', '03334456877','generalstore@gmail.com'),
------(2,'2 General Store', 'Machhar Colony', '03215869756','store@gmail.com'),
------(3,'3 general store', 'Nagin Chourangi', '03334154587','aqsastore@gmail.com'),
------(4,'4 general store', 'Gulistan e jouhar', '03334158458','ashirstore@gmail.com'),
------(5,'5 general store', 'Malir Colony', '03334156987','huzaifastore@gmail.com')
------alter table store alter column email varchar(50)
------select * from store


------=====================		Department	=====================	

------select * from department

------insert into department(DepartmentID,StoreID,DeptName,DeptMgr)
------values
------(1,2,'InventoryManagement',5),
------(2,3,'Supply Chain',3),
------(3,1,'HR',2)
------delete from department

------=====================	 Zip Code =====================	

------select  * from ZipCode
------insert into ZipCode(Zipcode,city,State)
------values
------('75228','Karachi','Pakistan'),
------('75328','lahore','Pakistan'),
------('75428','Multan','Pakistan')

------=====================	 location 	=====================	

------select * from location

------insert into Location(locationid,StreetNO,Zipcode,HouseNo,area)
------values
------(1,'3','75228','32/10','Gulshan'),
------(2,'4','75328','58/33','Jouhar'),
------(3,'5','75428','44/10','Dalmian')

------=====================	 login ID =====================	
------select * from login

------insert into login(loginid,UserName,Email,Password,Timelogin,Timeloginout)
------values
------(1,'ashir','ashir@gmail.com','123456','11:00 AM','12:00 AM'),
------(2,'huzaifa','huz@gmail.com','654321','10:00 AM','12:00 AM'),
------(3,'Aqsa','aqsa@gmail.com','897654','9:00 AM','9:00 PM')
------delete from login

------=====================	 Extra Allowance =====================	

------select * from extraAllowance

------insert into extraAllowance(ExtraHours,extraAmount)
------values
------('3','3000'),
------('4','4000'),
------('5','5000'),
------('6','6000'),
------('7','7000'),
------('8','8000')


--------=====================	 Roll =====================	
------select * from Role
------insert into role(RoleID,name)
------values
------(1,'Assistant Manager'),
------(2,'Manager'),
------(3,'SuperVisor')

--------=====================	 Employee =====================	


------select * from Employee
------insert into
------Employee(EmployeeID,DepartmentID,EmpFirstName,EmpLastName,DOB,DOJ,Gender,LocationID,LoginID,MgrID,OfficeNo,PhoneNumber)
------Values
------(1,1,'Ashir','Azeem','24-2-2003','1-2-2021','Male',1,1,null,'123456','03040426130'),
------(2,2,'Muhammad','Huzaifa','24-3-2002','1-3-2021','Male',2,2,null,'7891011','03040420015'),
------(3,3,'Aqsa','Malik','24-4-2001','1-4-2021','Female',3,3,null,'121314','03040485472')
------alter table employee alter column gender varchar(6)
--------=====================	 Amount Deduct =====================	
------select * from AmountDeduct 
------insert into  AmountDeduct(AbsentHours,Amount_Deduct)
------values
------('1','600'),
------('2','1200'),
------('3','1800'),
------('4','2400'),
------('5','3000')



--------=====================	 Payroll =====================	
----select * from payroll
----select * from extraAllowance

 
----insert into
----Payroll(PayRolID,EmployeeID,BasicSalary,PresentHours,AbsentHours,ExtraHours,Date_Created)
----values
----(1,1,100000,25,'1',5,GETDATE()),
----(2,2,150000,20,'5',3,GETDATE()),
----(3,3,200000,14,'3',4,GETDATE())


--------=====================	 Roll Emloyee =====================	

------insert into Role_Emp(EmpID,RoleID)
------values
------(1,2),
------(2,3),
------(3,1)
------select * from Role_Emp


------...............XXXXXXXXXXXXXXXXXXXXXXXXXX....................................

------=====================		HR			=====================	

------insert into HR(DepartmentID,HRSpeedDial,HRDetails )
------values
------(1,'4444','hiring'),
------(2,'3333','training'),
------(3,'1111','benefits administration')
------select * from HR


--------=====================	FEEDBACK		=====================	

------INSERT INTO Feedback (FeedbackID,DepartmentID,UserName,UserContact,UserEmail,Description)
------values(1,1,'TALHA','03134567893','talha@gmail.com','Good'),
------(2,3,'Haseeb','03134567333','haeeeb@gmail.com','Excellent'),
------(3,2,'Haider','03134567833','haider@gmail.com','Fair')

------select * from Feedback


--------=====================	LEAVE		=====================	
------select * from Leave
------insert into Leave(LeaveId,UsedLeave,BalancedLeave,Employeeid)
------values(1,3,6,1),
------(2,2,5,2),
------(3,3,6,3)


--------=====================	APPRAISAL		=====================	
------insert into Appraisal(AprraisalID,DataRecorded,QualityScore,EfficiencyScore,EmployeeId)
------values
------(1,1,4,5,1),
------(2,2,5,4,2),
------(3,3,5,2,3)

------select * from Appraisal


------...............XXXXXXXXXXXXXXXXXXXXXXXXXX....................................


------=====================	 FINANACE		=====================	

------insert into Finance(DepartmentID,FinanceSpeedDial)
------values(1,2222),
------(2,3333),
------(3,4444)
------select * from Finance

--------=====================	 transaction 1=====================	
------SELECT * FROM Transaction1

------INSERT INTO Transaction1(TransactionID,TransactionDate,Details,DepartmentID)
------VALUES (1,GETDATE(),'withdrawn',1),
------(2,GETDATE(),'deposit',2),
------(3,GETDATE(),'withdrawn',3)

--------=====================	 payment=====================	
------insert into Payment(PaymentID,TransactionID)
------values (1,2),
------(2,1),
------(3,3)
------select * from Payment


--------=====================	 cash=====================	
------insert into Cash(CashID,PaymentID)
------values(1,3),
------(2,2),
------(3,1)
------select * from Cash


--------=====================	 Report =====================	

------insert into Report(ReportID,ReportStartDate,ReportEndDate)
------values (1,'25-6-2021','30-12-2023'),
------ (2,'14-5-2020','30-5-2023'),
------ (3,'21-3-2019','30-6-2023')
------ select * from Report


--------=====================	 TRANS_REPORT =====================	

------insert into TransactionReport(TransactionID,ReportID)
------values(1,2),
------(2,1),
------(3,3)
------select * from TransactionReport


--------=====================	Income Statement =====================	
------insert into Income_Statement(IncomeID,Total_Revenue,Total_Expenses,NetIncome,ReportID,StartDate,EndDate)
------values (1,80000,750000,960000,1,'25-6-2021','30-12-2023'),
------ (2,90000,80000,100000,2,'14-5-2020','30-5-2023'),
------ (3,70000,750000,860000,3,'21-3-2019','30-6-2023')

------ select * from Income_Statement

 
--------=====================Credit Card=====================
------insert into CreditCard (CreditCardID,PaymentID,OwnerName,CreditCardNo,amount)
------values (1,3,'Hamza','123456789','100000000'),
------(2,2,'Bilal','123456239','20000000'),
------(3,1,'Imran','235673419','30000000')
------select * from CreditCard

--------=====================INVOICE=====================
--------insert into Invoice(InvoiceId,ReportId,Invoicedate)
--------values(1,1,GETDATE()),
--------(2,3,GETDATE()),
--------(3,2,GETDATE())
--------select * from Invoice
--------delete from Invoice

--------...............XXXXXXXXXXXXXXXXXXXXXXXXXX....................................


--------=====================	 ADMIN		=====================	

------insert into ADMIN(DepartmentID,AdminSpeedDial,AdminDetails)
------values (1,7777,'Inventory Manager'),
------(2,9999,'SUPPLY CHAIN'),
------(3,3232,'HR')
------select * from ADMIN

--------=====================	 Order1	=====================	
------insert into Order1(OrderID,OrderDate,EmployeeId)

------values (1,GETDATE(),3),
------(2,GETDATE(),2),
------(3,GETDATE(),1),
------(4,GETDATE(),2),
------(5,GETDATE(),3),
------(6,GETDATE(),3)
------select * from Order1

--------=====================	 catergory	=====================	
------insert into category(categoryID,CategoryName,CategoryDescription)
------values (1,'DETERGENT','SOAPS,WASHINGPOWDER etc'),
------(2,'COOKIES','Buscuits,Rusk etc'),
------(3,'pulses','beans,chaana etc')

------select *from category


--------=====================	 BRAND	=====================	
------insert into brand(BrandID,BrandName,BrandDescription)
------values(1,'Ariel','Washing brand'),
------(2,'Bisconi','Biscuits brand'),
------(3,'Ponam','Pulses brand')

------select *from brand


--------=====================	 PRODUCT	=====================	
------insert into product(ProductID,ProductName,ProductPrice,ProductDescription,ProductBarCode,CategoryID,BrandID)
------values(1,'Super',40,'Made from Eggs','13354',2,2),
------(2,'Ariel-SURF',690,'NO 1 WashingPowder','12254',1,1),
------(3,'DaalChana',500,'Fresh Village Pulses','1224',3,3),
------(4,'Tuc',30,'Salty_Biscuit','12224',2,2),
------(5,'Bright_Total',590,' WashingPowder','12154',1,1),
------(6,'DaalMasoor',520,'Fresh Village Pulses','1524',3,3)
------select * from product


--------=====================	 SUPPLIER	=====================
------insert into supplier(SupplierID,SupplierName,CompanyName,CompanyLocation,PhoneNO)
------values(1,'Bashir','Bisconi','Islamabad','03112130987'),
------(2,'Ahmed','Ariel','Karachi','03512330987'),
------(3,'Nasir','Ponam','Lahore','03212830987')
------select * from supplier

--------=====================	 SUPPLIERPRODUCT	=====================
------insert into supplier_product(SupplierID,ProductID)
------values(1,3),
------(2,2),
------(3,3),
------(1,1),
------(2,3)
------select * from supplier_product

--------=====================	 STOCK	=====================
------insert into stock(SKU,productid,NOTES,quantity)
------values(1,3,'Avaialbe','50'),
------(2,2,'Short','4'),
------(3,1,'NotAvailable','0'),
------(4,5,'Avaialbe','90'),
------(5,4,'Short','4'),
------(6,6,'Available','70')
------select * from stock

--------=====================	promotion	=====================
------insert into Promotion(PromotionID,promotionName,promotionStartDate,promotionEndDate)
------values(1,'Buy 1 get 1 free','11-1-2023','20-1-2023'),
------(2,'50% off','20-2-2023','30-2-2023'),
------(3,'Flat 20% off','30-3-2023','5-4-2023')
------select * from Promotion


--------=====================	ProductPromo	=====================
--------select * from Product_Promo
--------insert into Product_Promo(ProductID,PromotionID,newprice)
--------values(1,1,30),
--------(2,2,345),
--------(3,3,100),
--------(4,3,6),
--------(5,2,260)

------select * from ZipCode


------...............XXXXXXXXXXXXXXXXXXXXXXXXXX....................................
------=====================	 VIEWS	=====================
------create view emp_vu 
------as
------Select e.*, d.DeptName from Employee e, Department d where e.DepartmentID=d.DepartmentID
------and d.DepartmentID=1
select * from emp_vu

------create view product_vu as
------Select p.*, c.CategoryName from Product p, Category c where p.CategoryID=c.CategoryID and
------c.CategoryID=2
select * from product_vu

------create view IncomeStatement_vu as
------Select * from Income_Statement


------Select * from IncomeStatement_vu

------...............XXXXXXXXXXXXXXXXXXXXXXXXXX....................................
------=====================	 FUNCTIONS	=====================



------create Function Stock_Prod_Cat_Brand()
------returns table
------as
------return(Select
------p.ProductID,p.ProductName,s.SKU,s.Quantity,c.CategoryID,c.CategoryName,b.BrandID,b.BrandName
------from Product p, Stock s, Category c, Brand b
------where p.ProductID=s.ProductID and p.CategoryID=c.CategoryID and b.BrandID=p.BrandID
------)
------Select * from Stock_Prod_Cat_Brand()
------............................................................

------create Function Payment_Method()
------returns table
------as
------return(Select p.PaymentID,cc.CreditCardID,cc.OwnerName,cc.amount
------from Payment p, CreditCard cc
------where p.PaymentID=cc.PaymentID
------)
------Select * from Payment_Method()
------............................................................

------create Function T_Sal(@EmpID int)
------returns table
------as
------return(Select e.EmpFirstName,e.EmpLastName,p.BasicSalary,p.ExtraHours,ea.ExtraAmount,
------(p.BasicSalary+ea.ExtraAmount) as T_Sal
------from Employee e, Payroll p, ExtraAllowance ea
------where e.EmployeeID=p.EmployeeID and ea.ExtraHours=p.ExtraHours and
------e.EmployeeID=@EmpID
------)
------Select * from T_Sal(3)

------...............XXXXXXXXXXXXXXXXXXXXXXXXXX....................................
------=====================	 PROCEDURE	=====================

----create Procedure Emp_App
----as
----begin
----Select a.AprraisalID, e.EmpFirstName,e.EmpLastName,a.QualityScore,a.EfficiencyScore
----from employee e, Appraisal a
----where e.employeeID=a.employeeID
----end
----exec Emp_App

----select * from Invoice
----select * from product
----select * from Product_Invoice



----create Procedure Invoice_Prod
----as
----begin
----Select p.ProductName,i.InvoiceID,i.IssueDate
----from Invoice i, Product p, Product_Invoice pii
----where pii.InvoiceID=i.InvoiceID and pii.ProductID=p.ProductID
----end
----exec Invoice_Prod





----insert into Product_Invoice(InvoiceID,ProductID)
----values(1,5),
----(2,2),
----(3,3)


------...............XXXXXXXXXXXXXXXXXXXXXXXXXX....................................

------=====================	TRIGGERS	=====================

------=======================ADMIN====================
------create table AdminAudit(
------Details ntext
------)
------create trigger tr_tblAdmin_forInsert
------on Admin
------for insert
------as
------begin
------declare @ID int
------select @ID=DepartmentID from inserted
------insert into AdminAudit
------values ('New DEpartment with id ='+
------cast(@id as nvarchar(5))+
------'is added at '+ cast(GETDATE() as nvarchar(20))
------)
------end
------SELECT * FROM  AdminAudit



----create trigger tr_tblAdmin_fordelete
----on Admin
----for delete
----as
----begin
----declare @ID int
----select @ID=DepartmentID from deleted
----insert into AdminAudit
----values ('An existing Department with id ='+
----cast(@id as nvarchar(5))+
----' is deleted at '+ cast(GETDATE() as nvarchar(20))
----)
----End


----create trigger tr_tblAdmin_forupdate
----on Admin
----for update
----as
----begin
----select * from inserted
----select * from deleted
----end

-----------------------------Supplier
----create table SupplierAudit(
----Details ntext
----)
----create trigger tr_tblSup_forInsert
----on Supplier
----for insert
----as
----begin
----declare @ID int
----select @ID=SupplierID from inserted
----insert into SupplierAudit
----values ('New Supplier with id ='+cast(@id as nvarchar(5))+
----'is added at '+ cast(GETDATE() as nvarchar(20))
----)
----end



----create trigger tr_tblSup_fordelete
----on Supplier
----for delete
----as
----begin
----declare @ID int
----select @ID=SupplierID from deleted
----insert into SupplierAudit
----values ('An existing Supplier with id ='+
----cast(@id as nvarchar(5))+
----' is deleted at '+ cast(GETDATE() as nvarchar(20))
----)
----End

----create trigger tr_tblSup_forupdate
----on Supplier
----for update
----as
----begin
----select * from inserted
----select * from deleted
----end

------------------------Report

----create table ReportAudit(
----Details ntext
----)
----create trigger tr_tblReport_forInsert
----on Report
----for insert
----as
----begin
----declare @ID int
----select @ID=ReportID from inserted
----insert into ReportAudit
----values ('New Report with id ='+
----cast(@id as nvarchar(5))+
----'is added at '+ cast(GETDATE() as nvarchar(20))
----)
----end


----create trigger tr_tblReport_fordelete
----on Report
----for delete
----as
----begin
----declare @ID int
----select @ID=ReportID from deleted
----insert into ReportAudit
----values ('An existing Report with id ='+
----cast(@id as nvarchar(5))+
----' is deleted at '+ cast(GETDATE() as nvarchar(20))
----)
----End
----create trigger tr_tblReport_forupdate
----on Report
----for update
----as
----begin
----select * from inserted
----select * from deleted

------=====================	SAMPLE QUERIES	=====================

select p.ProductID , p.ProductName ,ProductPrice as old_price , pp.NewPrice as new_price ,
s.Quantity , pr.PromotionName
from product p , Product_Promo pp , Promotion pr , Category c , Stock s
where
p.CategoryID = c.CategoryID and
p.ProductID = s.ProductID and
p.ProductID = pp.ProductID and
pp.PromotionID = pr.PromotionID
order by p.ProductID


------------------------------------------------------------------------
select p.ProductID , p.ProductName , su.SupplierName , su.CompanyName ,s.SKU, s.Quantity
from product p , Supplier su , Supplier_Product sp , Category c , Stock s
where
p.CategoryID = c.CategoryID and
p.ProductID = s.ProductID and
p.ProductID = sp.ProductID and
sp.SupplierID = su.SupplierID
order by p.ProductID

----------------------------------------------------------------------
select e.EmployeeID , e.EmpFirstName +' ' +e.EmpLastName as Emp_name , a.QualityScore ,
a.EfficiencyScore , l.UsedLeave , l.BalancedLeave
from Employee e , Appraisal a , Leave l , Department d
where e.EmployeeID = l.EmployeeID and
d.DepartmentID = e.EmployeeID and
e.EmployeeID = a.EmployeeID
----------------------------------------------------------------------


select e.EmployeeID , e.EmpFirstName+' '+e.EmpLastName as emp_name,d.DeptName , r.Name as
role , p.BasicSalary , l.area , l.Zipcode
from Employee e,Role r,Role_Emp re,Location l , Payroll p , Department d
where
e.EmployeeID = re.EmpID and
re.RoleID = r.RoleID and
e.LocationID = l.LocationID and
e.EmployeeID = p.EmployeeID and
d.DepartmentID = e.DepartmentID
----------------------------------------------------------------------

select e.EmpFirstName as Cashier , o.OrderID, p.ProductName ,po.Ordered_Quantity ,
p.ProductPrice
from Employee e , Order1 o , Product_Order po , Product p
where
e.EmployeeID = o.EmployeeID and
o.OrderID = po.OrderID and
po.ProductID = p.ProductID

------------------------------------------------------------------------------------
select e.EmployeeID , e.EmpFirstName +e.EmpLastName as Emp_name , p.BasicSalary
,ad.AbsentHours, ad.AbsentHours,ad.Amount_Deduct as ammount_deduct ,ea.ExtraHours,
ea.ExtraHours ,ea.extraAmount as extra_allowance
from Employee e , Role r , Role_Emp re , Payroll p , AmountDeduct ad , ExtraAllowance ea
where
e.EmployeeID = re.EmpID and
re.RoleID = r.RoleID and
e.EmployeeID = p.EmployeeID and
p.AbsentHours = ad.AbsentHours and
p.ExtraHours = ea.ExtraHours

select * from CreditCard
select * from Payment
select * from HR