use casestudy;

-- task 2:  
SELECT 
    *
FROM
    nhan_vien
WHERE
    (ho_ten LIKE 'K%' 
    OR ho_ten LIKE 'T%'
	OR ho_ten LIKE 'H%')
		AND CHAR_LENGTH(ho_ten) < 16;

-- task 3: 
SELECT *
FROM khach_hang
WHERE (dia_chi LIKE '%Đà nẵng%'
        OR dia_chi LIKE '%Quảng Trị%')
        AND ((YEAR(CURDATE()) - YEAR(ngay_sinh)) > 18
        AND (YEAR(CURDATE()) - YEAR(ngay_sinh)) <= 50);

-- task 4:
SELECT 
    kh.ma_khach_hang,
    kh.ho_ten,
    COUNT(kh.ma_khach_hang) AS so_lan_dat_phong
FROM khach_hang kh
JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
JOIN loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
WHERE lk.ten_loai_khach = 'Diamond'
GROUP BY ma_khach_hang
ORDER BY so_lan_dat_phong;

-- task5:
SELECT 
    kh.ma_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    SUM(dv.chi_phi_thue + IFNULL((hdct.so_luong * dvdk.gia), 0)) AS 'tong_tien'
FROM khach_hang kh
JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
LEFT JOIN hop_dong hd ON hd.ma_khach_hang = kh.ma_khach_hang
LEFT JOIN dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu 
LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
LEFT JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY hd.ma_hop_dong , kh.ma_khach_hang
ORDER BY kh.ma_khach_hang;