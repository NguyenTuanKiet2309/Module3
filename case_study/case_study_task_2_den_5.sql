use casestudy;

-- task 2:  
select * from nhan_vien
where (ho_ten like "K%" or ho_ten like "T%" or ho_ten like "H%") and CHAR_LENGTH(ho_ten) < 16;

-- task 3: 
select * from khach_hang
where (dia_chi like "%Đà nẵng%" or dia_chi like "%Quảng Trị%") and ((year(curdate()) - year(ngay_sinh)) > 18 and (year(curdate()) - year(ngay_sinh)) <= 50);

-- task4:
select * from khach_hang
where loai_khach_hang like "Diamond"; 