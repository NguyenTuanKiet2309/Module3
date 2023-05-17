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
ho_ten varchar(45) not null,
ngay_sinh date not null,
gioi_tinh bit not null,
so_cmnd varchar(45) not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45),
ma_loai_khach int,
foreign key(ma_loai_khach) references loai_khach(ma_loai_khach)
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
so_luong int not null,
ma_hop_dong int,
foreign key(ma_hop_dong) references hop_dong(ma_hop_dong),
ma_dich_vu_di_kem int,
foreign key(ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem)
);

insert into trinh_do(ten_trinh_do)
values ("Trung cấp"),("Cao Đẳng"),("Đại Học"),("Sau Đại Học");

insert into bo_phan(ten_bo_phan)
values ("Sale - Marketing"),("Hành Chính"),("Phục Vụ"),("Quản Lý");

insert into vi_tri(ten_vi_tri)
values ("Quản lý"),("Nhân Viên");

insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan)
values ("Nguyễn Văn An", 19701107,"456231786",10000000,"0901234121","annguyen@gmail.com","295 Nguyễn Tất Thành, Đà Nẵng",1,3,1),
("Lê Văn Bình", 19970409,"654231234",7000000,"0934212314","binhlv@gmail.com","22 Yên Bái, Đà Nẵng",1,2,2),
("Hồ Thị Yến", 19951212,"999231723",14000000,"0412352315","thiyen@gmail.com","K234/11 Điện Biên Phủ, Gia Lai",1,3,2),
("Võ Công Toản", 19800404,"123231365",17000000,"0374443232","toan0404@gmail.com","77 Hoàng Diệu, Quảng Trị",1,4,4),
("Nguyễn Bỉnh Phát", 19991209,"454363232",6000000,"0902341231","phatphat@gmail.com","43 Yên Bái, Đà Nẵng",2,1,1),
("Khúc Nguyễn An Nghi", 20001108,"964542311",7000000,"0978653213","annghi20@gmail.com","294 Nguyễn Tất Thành, Đà Nẵng",2,2,3),
("Nguyễn Hữu Hà", 19930101,"534323231",8000000,"0941234553","nhh0101@gmail.com","4 Nguyễn Chí Thanh, Huế",2,3,2),
("Nguyễn Hà Đông", 19890903,"234414123",9000000,"0642123111","donghanguyen@gmail.com","111 Hùng Vương, Hà Nội",2,4,4),
("Tòng Hoang", 19820903,"256781231",6000000,"0245144444","hoangtong@gmail.com","213 Hàm Nghi, Đà Nẵng",2,4,4),
("Nguyễn Công Đạo",19940108,"755434343",8000000,"0988767111","nguyencongdao12@gmail.com","6 Hoà Khánh, Đồng Nai",2,3,2);

insert into loai_khach(ten_loai_khach)
values ("Diamond"),("Platinium"),("Gold"),("Silver"),("Member");

insert into khach_hang(ho_ten,ngay_sinh,gioi_tinh, so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach)
values ("Nguyễn Thị Hào",19701107,0,"643431213","0945423362","thihao07@gmail.com","23 Nguyễn Hoàng, Đà Nẵng",5),
("Phạm Xuân Diệu",19920808,1,"865342123","0954333333","xuandieu92@gmail.com","K77/22 Thái Phiên, Quảng Trị",3),
("Trương Đình Nghệ",19900227,1,"488645199","0373213122","nghenhan2702@gmail.com","K323/12 Ông Ích Khiêm, Vinh",1),
("Dương Văn Quan",19810708,1,"543432111","0490039241","duongquan@gmail.com","K453/12 Lê Lợi, Đà Nẵng",1),
("Hoàng Trần Nhi Nhi",19951209,0,"795453345","0312345678","nhinhi123@gmail.com","224 Lý Thái Tổ, Gia Lai",4),
("Tôn Nữ Mộc Châu",20051206,0,"732434215","0988888844","tonnuchau@gmail.com","37 Yên Thế, Đà Nẵng",4),
("Nguyễn Mỹ Kim",19840408,0,"856453123","0912345698","kimcuong84@gmail.com","K123/45 Lê Lợi, Hồ Chí Minh",1),
("Nguyễn Thị Hào",19990408,0,"965656433","0763212345","haohao99@gmail.com","55 Nguyễn Văn Linh, Kon Tum",3),
("Trần Đại Danh",19940701,1,"432341235","0643343433","danhhai99@gmail.com","24 Lý Thường Kiệt, Quảng Ngãi",1),
("Nguyễn Tâm Đắc",19890701,1,"344343432","0987654321","dactam@gmail.com","22 Ngô Quyền, Đà Nẵng",2);

insert into kieu_thue(ten_loai_thue)
values ("Year"),("Month"),("Day"),("Hour");

insert into loai_dich_vu(ten_loai_dich_vu)
values ("Villa"),("House"),("Room");

insert into dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,ma_kieu_thue,ma_loai_dich_vu)
values("Villa Beach Front",25000,10000000,10,"vip","Có hồ bơi",500,4,3,1),
("House Princess 01",14000,5000000,7,"vip","Có thêm bếp nướng",null,3,2,2),
("Room Twin 01",5000,1000000,2,"normal","Có tivi",null,null,4,3),
("Villa No Beach Front",22000,9000000,8,"normal","Có hồ bơi",300,3,3,1),
("House Princess 02",10000,4000000,5,"normal","Có thêm bếp nướng",null,2,3,2),
("Room Twin 02",3000,900000,2,"normal","Có tivi",null,null,4,3);

insert into dich_vu_di_kem(ten_dich_vu_di_kem, gia, don_vi, trang_thai)
values ("Karaoke",10000,"giờ","tiện nghi, hiện tại"),
("Thuê xe máy",10000,"chiếc","hỏng 1 xe"),
("Thuê xe đạp",20000,"chiếc","tốt"),
("Buffet buổi sáng",15000,"suất","đầy đủ đồ ăn, tráng miệng"),
("Buffet buổi trưa",90000,"suất","đầy đủ đồ ăn, tráng miệng"),
("Buffet buổi tối",16000,"suất","đầy đủ đồ ăn, tráng miệng");

insert into hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang ,ma_dich_vu)
values (20201208,20201208,0,3,1,3),
(20200714,20200721,200000,7,3,1),
(20210315,20210317,50000,3,4,2),
(20210114,20210118,100000,7,5,5),
(20210714,20210715,0,7,2,6),
(20210601,20210603,0,7,7,6),
(20210902,20210905,100000,7,4,4),
(20210617,20210618,150000,3,4,1),
(20201119,20201119,0,3,4,5),
(20210412,20210414,0,10,3,5),
(20210425,20210425,0,2,2,1),
(20210525,20210527,0,7,10,1);

insert into hop_dong_chi_tiet(so_luong,ma_hop_dong,ma_dich_vu_di_kem)
values (5,2,4),
(8,2,5),
(15,2,6),
(1,3,1),
(11,3,2),
(1,1,3),
(2,1,2),
(2,12,2);