﻿CREATE DATABASE QUANLY_BANTRANGSUC

USE QUANLY_BANTRANGSUC
GO

CREATE TABLE THELOAI (
	MALOAI INT IDENTITY,
	TENLOAI NVARCHAR(200),
	ICON_THELOAI VARCHAR(200),
	DAXOA BIT,
	CONSTRAINT PK_THELOAI PRIMARY KEY (MALOAI)
)

CREATE TABLE TRANGSUC (
	MATRANGSUC INT IDENTITY,
	MALOAI INT,
	TENTRANGSUC NVARCHAR(200),
	GIA INT,
	HINHANH VARCHAR(500),
	NGAYDANG DATETIME,
	MOTA NTEXT,
	DAXOA INT,
	CONSTRAINT PK_TRANGSUC PRIMARY KEY (MATRANGSUC)
)

CREATE TABLE TAIKHOAN (
	MATAIKHOAN INT IDENTITY,
	UNAME VARCHAR(200),
	PASS VARCHAR(200),
	FULL_NAME NVARCHAR(200),
	EMAIL_ADDRESS VARCHAR(100),
	PHAN_QUYEN TINYINT,
	DAXOA BIT,
	CONSTRAINT PK_TAIKHOAN PRIMARY KEY(MATAIKHOAN)
)

Insert into TAIKHOAN values('thanhnam','123',N'Hoàng Ngọc Thành Nam','hntnam98@gmail.com',1,0)
select * from TAIKHOAN

CREATE TABLE HOADON (
	MAHD INT IDENTITY,
	MATAIKHOAN INT,
	NGAYLAP DATETIME,
	TONGTIEN INT,
	CONSTRAINT PK_HOADON PRIMARY KEY (MAHD)
)
ALTER TABLE HOADON ADD NGAYGIAO DATETIME

CREATE TABLE CHITIETHD (
	MAHD INT, 
	MATRANGSUC INT,
	SOLUONG INT
	CONSTRAINT PK_CHITIETHD PRIMARY KEY (MAHD, MATRANGSUC)
)

ALTER TABLE TRANGSUC ADD CONSTRAINT FK_TRANGSUC_THELOAI FOREIGN KEY (MALOAI) REFERENCES THELOAI(MALOAI)
ALTER TABLE HOADON ADD CONSTRAINT FK_HOADON_TAIKHOAN FOREIGN KEY (MATAIKHOAN) REFERENCES TAIKHOAN(MATAIKHOAN)
ALTER TABLE CHITIETHD ADD CONSTRAINT FK_CHITIETHD FOREIGN KEY (MAHD) REFERENCES HOADON(MAHD)
ALTER TABLE CHITIETHD ADD CONSTRAINT FK_CHITIETHD_TRANGSUC FOREIGN KEY (MATRANGSUC) REFERENCES TRANGSUC (MATRANGSUC)

INSERT INTO THELOAI VALUES (N'NHẪN','NULL',0) -- // 0 LÀ CHƯA XÓA. 1 LÀ ĐÃ XÓA RỒI
INSERT INTO THELOAI VALUES (N'HOA TAI','NULL',0)
INSERT INTO THELOAI VALUES (N'DÂY CHUYỀN','NULL',0)
DELETE THELOAI
SELECT * FROM THELOAI

INSERT INTO TRANGSUC VALUES (5, N'BÔNG TAI KIM CƯƠNG MILLAY', 11900000, 'btgip0003-yg.png',GETDATE(), N'YÊN TÂM MUA ONLINE: Miễn phí đổi hàng trong 30 ngày.Điều kiện: Áp dụng cho đặt hàng online giao hàng tận nơi hoặc đơn hàng thanh toán 100% online.MIỄN PHÍ GIAO HÀNG cho đơn hàng từ 2.499.000đ.',0)
INSERT INTO TRANGSUC VALUES (4, N'NHẪN VÀNG TRẮNG 10K ĐÍNH ĐÁ', 31900000, 'nhan1.png',GETDATE(), N'YÊN TÂM MUA ONLINE: Miễn phí đổi hàng trong 30 ngày.Điều kiện: Áp dụng cho đặt hàng online giao hàng tận nơi hoặc đơn hàng thanh toán 100% online.MIỄN PHÍ GIAO HÀNG cho đơn hàng từ 2.499.000đ.',0)
INSERT INTO TRANGSUC VALUES (6, N'DÂY CHUYỀN VÀNG TRẮNG 10K ĐÍNH ĐÁ', 32900000, 'daychuyen1.png',GETDATE(), N'YÊN TÂM MUA ONLINE: Miễn phí đổi hàng trong 30 ngày.Điều kiện: Áp dụng cho đặt hàng online giao hàng tận nơi hoặc đơn hàng thanh toán 100% online.MIỄN PHÍ GIAO HÀNG cho đơn hàng từ 2.499.000đ.',0)
DELETE TRANGSUC
SELECT * FROM TRANGSUC where MATRANGSUC=2
 
--// MÀY TỰ THÊM MẤY CÁI KIA ZÔ ĐỂ TEST NGHEN.
SELECT * FROM HOADON

select * from chitiethd