create database quan_ly_cua_hang_internet;
use quan_ly_cua_hang_internet;

create table dich_vu_di_kem(
ma_dich_vu_di_kem int primary key auto_increment,
ten_loai_dich_vu_di_kem varchar(50)
);

create table loai_khach_hang(
ma_loai_khach int primary key auto_increment,
ten_loai_khach_hang varchar(50)
);

create table may_tinh(
ma_may int auto_increment primary key,
hang_san_xuat varchar(50),
vi_tri_dat_may varchar(50)
);

create table khach_hang(
ma_khach_hang int auto_increment primary key,
cccd varchar(14),
ho_ten varchar(50),
sdt int,
email varchar(50),
ma_loai_khach int,
foreign key (ma_loai_khach) references loai_khach_hang(ma_loai_khach)
);

create table dich_vu(
ma_dich_vu int primary key auto_increment,
ma_may int,
ma_khach_hang int,
thoi_gian_bat_dau datetime,
thoi_gian_ket_thuc datetime,
ma_dich_vu_di_kem int,
foreign key (ma_may) references may_tinh(ma_may),
foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem),
tong_tien_thanh_toan double
);

create table dich_vu_chi_tiet(
ma_dich_vu_chi_tiet int primary key auto_increment,
ma_dich_vu int,
ma_dich_vu_di_kem int,
foreign key (ma_dich_vu) references dich_vu(ma_dich_vu),
foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem),
so_luong int
);