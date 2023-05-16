use casestudy;

-- task 2:  
select * from nhan_vien
where (ho_ten like "K%" or ho_ten like "T%" or ho_ten like "H%") and CHAR_LENGTH(ho_ten) < 16;

-- task 3: 
select * from khach_hang
where (dia_chi like "%Đà nẵng%" or dia_chi like "%Quảng Trị%") and ((year(curdate()) - year(ngay_sinh)) > 18 and (year(curdate()) - year(ngay_sinh)) <= 50);

-- task 4:
select kh.ma_khach_hang, kh.ho_ten, count(kh.ma_khach_hang) as so_lan_dat_phong
from  khach_hang kh
join hop_dong hd
on kh.ma_khach_hang = hd.ma_khach_hang
join  loai_khach lk 
on lk.ma_loai_khach = kh.ma_loai_khach
where lk.ten_loai_khach = 'Diamond'
group by ma_khach_hang
order by so_lan_dat_phong;

-- task5:
select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach,hd.ma_hop_dong,dv.ten_dich_vu,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc
from khach_hang kh
left join loai_khach lk 
on kh.ma_loai_khach = lk.ma_loai_khach
join hop_dong hd 
on hd.ma_khach_hang = kh.ma_khach_hang
left join dich_vu dv 
on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct 
on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk 
on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by hd.ma_hop_dong, kh.ma_khach_hang
order by kh.ma_khach_hang;