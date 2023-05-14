create database if not exists casestudy;
use casestudy;

create table vi_tri(
ma_vi_tri int primary key auto_increment,
ten_vi_tri varchar(45)
);

create table trinh_do(
ma_trinh_do int primary key auto_increment,
ten_trinh_do varchar(45)
);

create table bo_phan(
ma_bo_phan int primary key auto_increment,
ten_bo_phan varchar(45)
);

create table loai_khach(
ma_loai_khach int primary key auto_increment,
ten_loai_khach varchar(45));

create table kieu_thue(
ma_kieu_thue int primary key auto_increment,
ten_loai_thue varchar(45)
);

create table loai_dich_vu(
ma_loai_dich_vu int primary key auto_increment,
ten_loai_dich_vu varchar(45)
);

create table dich_vu_di_kem(
ma_dich_vu_di_kem int primary key auto_increment,
ten_dich_vu_di_kem varchar(45) not null,
gia double not null,
don_vi varchar(10) not null,
trang_thai varchar(45)
);

create table dich_vu(
ma_dich_vu int primary key auto_increment,
ten_dich_vu varchar(45) not null,
dien_tich int,
chi_phi_thue double not null,
so_nguoi_toi_da int,
ma_kieu_thue int,
foreign key(ma_kieu_thue) references kieu_thue(ma_kieu_thue),
ma_loai_dich_vu int,
foreign key(ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu),
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int
);

create table nhan_vien(
ma_nhan_vien int primary key auto_increment,
ho_ten varchar(45) not null,
ngay_sinh date not null,
so_cmnd varchar(45) not null,
luong double not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int,
foreign key(ma_vi_tri) references vi_tri(ma_vi_tri),
ma_trinh_do int,
foreign key(ma_trinh_do) references trinh_do(ma_trinh_do),
ma_bo_phan int,
foreign key(ma_bo_phan) references bo_phan(ma_bo_phan)
);

create table khach_hang(
ma_khach_hang int primary key auto_increment,
loai_khach_hang int,
foreign key(loai_khach_hang) references loai_khach(ma_loai_khach),
ho_ten varchar(45) not null,
ngay_sinh date not null,
gioi_tinh bit not null,
so_cmnd varchar(45) not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45)
);

create table hop_dong(
ma_hop_dong int primary key auto_increment,
ngay_lam_hop_dong datetime not null,
ngay_ket_thuc datetime not null,
tien_dat_coc double not null,
ma_nhan_vien int,
foreign key(ma_nhan_vien) references nhan_vien(ma_nhan_vien),
ma_khach_hang int,
foreign key(ma_khach_hang) references khach_hang(ma_khach_hang),
ma_dich_vu int,
foreign key(ma_dich_vu) references dich_vu(ma_dich_vu)
);

create table hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int primary key auto_increment,
ma_hop_dong int,
foreign key(ma_hop_dong) references hop_dong(ma_hop_dong),
ma_dich_vu_di_kem int,
foreign key(ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem),
so_luong int not null
);

insert into trinh_do(ten_trinh_do)
values ("Trung cấp"),("Cao Đẳng"),("Đại Học"),("Sau Đại Học");

insert into bo_phan(ten_bo_phan)
values ("Sale - Marketing"),("Hành Chính"),("Phục Vụ"),("Quản Lý");

insert into vi_tri(ten_vi_tri)
values ("Lễ tân"),("Phục vụ"),("Chuyên viên"),("Giám sát"),("Quản lý"),("Giám đốc");

insert into nhan_vien(ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi)
values ("Nguyễn Tuán Kiệt", 19960709,123456789,1000000,0987654321,"kiet@gmail,com","Đà Nẵng"),
("Mai Phước Tài", 20001212,123456789,200000,0987654321,"tai@gmail,com","Huế"),
("Lê Văn Hưng", 19991212,123456789,3000000,0987654321,"hung@gmail,com","Đà Nẵng"),
("Phạm Công Nam ", 19981212,123456789,4000000,0987654321,"nam@gmail,com","Nghệ An"),
("Lê Thị Yến Hoa", 19991112,123456789,500000,0987654321,"hoa@gmail,com","Quảng Nam");

insert into loai_dich_vu(ten_loai_dich_vu)
values ("Villa"),("House"),("Room");

insert into kieu_thue(ten_loai_thue)
values ("Giờ"),("Ngày"),("Tháng"),("Năm");

insert into dich_vu_di_kem(ten_dich_vu_di_kem, gia, don_vi, trang_thai)
values ("massage",10000,"resort","oke"),
("karaoke",20000,"resort","oke"),
("thức ăn",500,"resort","oke"),
("thức uống",500,"resort","oke"),
("thuê xe di chuyển",50000,"resort","oke");

insert into loai_khach(ten_loai_khach)
values ("Diamond"),("Platinium"),("Gold"),("Silver"),("Member");

insert into khach_hang(ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi)
values ("Thái",19961212,1,"123456789","0987654321","thai@gmail.com","Quảng Nam"),
("Kiệt",19960907,1,"123456987","0965702079","kiet@gmail.com","Gia Lai"),
("Văn Hưng",19981212,1,"123987456","0987654321","hung@gmail.com","Đà Nẵng"),
("Phúc Quy",20021212,1,"123456789","0987653214","quy@gmail.com","Quảng Nam");

-- insert into dich_vu
-- insert into hop_dong
-- insert into hop_dong_chi_tiet;