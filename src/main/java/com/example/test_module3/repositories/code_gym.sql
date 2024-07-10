create database code_gym;
use code_gym;

CREATE TABLE Products (
                          ProductID INT AUTO_INCREMENT PRIMARY KEY,
                          ProductName VARCHAR(255) NOT NULL,
                          Price DECIMAL(10,2) NOT NULL,
                          Discount DECIMAL(5,2),
                          StockQuantity INT NOT NULL
);

CREATE TABLE Employees (
                           EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
                           EmployeeName VARCHAR(255) NOT NULL,
                           DateOfBirth DATE,
                           Address VARCHAR(255)
);

CREATE TABLE Customers (
                           CustomerID INT AUTO_INCREMENT PRIMARY KEY,
                           CustomerName VARCHAR(255) NOT NULL,
                           DateOfBirth DATE,
                           Phone VARCHAR(20),
                           Address VARCHAR(255),
                           Email VARCHAR(100)
);


CREATE TABLE Orders (
                        OrderID INT AUTO_INCREMENT PRIMARY KEY,
                        PaymentMethod VARCHAR(100) NOT NULL,
                        CustomerID INT,
                        EmployeeID INT,
                        OrderDate DATE NOT NULL,
                        DeliveryDate DATE,
                        DeliveryAddress VARCHAR(255),
                        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
                        FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Products (ProductName, Price, Discount, StockQuantity)
VALUES
    ('Sách Toán Cao Cấp', 150000, 0.1, 50),
    ('Điện thoại Samsung Galaxy A52', 8000000, 0.05, 20),
    ('Áo khoác phao nam', 1200000, NULL, 30),
    ('Túi xách nữ thời trang', 500000, NULL, 100),
    ('Bánh trung thu nhân đậu xanh', 250000, NULL, 200),
    ('Quần jean nam cao cấp', 700000, 0.15, 80),
    ('Máy tính xách tay Dell Inspiron', 15000000, 0.08, 15),
    ('Giày thể thao Adidas', 1000000, NULL, 60),
    ('Đồng hồ đeo tay Casio', 3000000, NULL, 50),
    ('Bộ bàn ghế phòng khách', 5000000, NULL, 10);


INSERT INTO Employees (EmployeeName, DateOfBirth, Address)
VALUES
    ('Nguyễn Văn A', '1990-05-15', '123 Đường ABC, Quận 1, TP.HCM'),
    ('Trần Thị Bình', '1985-08-20', '456 Đường XYZ, Quận 2, TP.HCM'),
    ('Phạm Minh Cường', '1993-02-10', '789 Đường DEF, Quận 3, TP.HCM'),
    ('Lê Thị Dương', '1998-11-25', '321 Đường KLM, Quận 4, TP.HCM'),
    ('Hoàng Văn Tùng', '1991-07-07', '654 Đường GHI, Quận 5, TP.HCM'),
    ('Nguyễn Thị Hương', '1987-04-30', '987 Đường NOP, Quận 6, TP.HCM'),
    ('Trần Văn Nam', '1995-09-18', '741 Đường QRS, Quận 7, TP.HCM'),
    ('Phạm Thị Lan Anh', '1994-03-22', '852 Đường TUV, Quận 8, TP.HCM'),
    ('Nguyễn Minh Tuấn', '1989-06-12', '963 Đường WXY, Quận 9, TP.HCM'),
    ('Lê Văn Bình', '1997-12-05', '159 Đường UVW, Quận 10, TP.HCM');


INSERT INTO Customers (CustomerName, DateOfBirth, Phone, Address, Email)
VALUES
    ('Nguyễn Thị Hà', '1992-01-20', '0901234567', '234 Nguyễn Văn Linh, Quận Bình Thạnh, TP.HCM', 'nguyenthaha@gmail.com'),
    ('Trần Văn Đức', '1995-07-10', '0987654321', '567 Lê Lợi, Quận Gò Vấp, TP.HCM', 'tranduc123@gmail.com'),
    ('Phạm Thị Mai', '1993-04-05', '0912345678', '890 Điện Biên Phủ, Quận Tân Bình, TP.HCM', 'phammai456@gmail.com'),
    ('Lê Văn Dũng', '1990-09-15', '0976543210', '123 Phan Xích Long, Quận Phú Nhuận, TP.HCM', 'levandung789@gmail.com'),
    ('Hoàng Minh Anh', '1998-03-25', '0932468102', '456 Nguyễn Thị Minh Khai, Quận 1, TP.HCM', 'hoangminhanh@gmail.com'),
    ('Nguyễn Văn Đạt', '1991-11-12', '0943216789', '789 Cách Mạng Tháng 8, Quận 3, TP.HCM', 'nguyenvandat@hotmail.com'),
    ('Trần Thị Thu', '1988-06-30', '0965432178', '987 Võ Văn Tần, Quận 10, TP.HCM', 'tranthithu@yahoo.com'),
    ('Phan Văn Hoàng', '1996-02-18', '0921876543', '654 Đinh Tiên Hoàng, Quận 5, TP.HCM', 'phanhoang123@gmail.com'),
    ('Đỗ Thị Thanh Hương', '1994-08-22', '0998765432', '321 Nguyễn Công Trứ, Quận 11, TP.HCM', 'dothithanhhuong@gmail.com'),
    ('Vũ Minh Tuấn', '1989-12-01', '0918374652', '159 Hai Bà Trưng, Quận 4, TP.HCM', 'vuminhtuan@hotmail.com');


INSERT INTO Orders (PaymentMethod, CustomerID, EmployeeID, OrderDate, DeliveryDate, DeliveryAddress)
VALUES
    ('Thanh toán tiền mặt', 1, 1, '2024-07-10', '2024-07-12', '234 Nguyễn Văn Linh, Quận Bình Thạnh, TP.HCM'),
    ('Thanh toán qua thẻ', 2, 2, '2024-07-10', '2024-07-13', '567 Lê Lợi, Quận Gò Vấp, TP.HCM'),
    ('Thanh toán chuyển khoản', 3, 3, '2024-07-11', '2024-07-14', '890 Điện Biên Phủ, Quận Tân Bình, TP.HCM'),
    ('Thanh toán qua thẻ', 4, 4, '2024-07-11', '2024-07-15', '123 Phan Xích Long, Quận Phú Nhuận, TP.HCM'),
    ('Thanh toán tiền mặt', 5, 5, '2024-07-12', '2024-07-16', '456 Nguyễn Thị Minh Khai, Quận 1, TP.HCM'),
    ('Thanh toán qua thẻ', 6, 6, '2024-07-12', '2024-07-17', '789 Cách Mạng Tháng 8, Quận 3, TP.HCM'),
    ('Thanh toán chuyển khoản', 7, 7, '2024-07-13', '2024-07-18', '987 Võ Văn Tần, Quận 10, TP.HCM'),
    ('Thanh toán qua thẻ', 8, 8, '2024-07-13', '2024-07-19', '654 Đinh Tiên Hoàng, Quận 5, TP.HCM'),
    ('Thanh toán tiền mặt', 9, 9, '2024-07-14', '2024-07-20', '321 Nguyễn Công Trứ, Quận 11, TP.HCM'),
    ('Thanh toán qua thẻ', 10, 10, '2024-07-14', '2024-07-21', '159 Hai Bà Trưng, Quận 4, TP.HCM');

ALTER TABLE Orders
    ADD COLUMN id_products int;

select * from Products join Orders on Orders.id_products= Orders.id_products where OrderDate between '2024-07-14' and  '2024-07-20'
