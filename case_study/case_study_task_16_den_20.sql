use case_study;

-- Task 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
set sql_safe_updates = 0;
DELETE FROM nhan_vien 
WHERE ma_nhan_vien NOT IN (SELECT *
    FROM (SELECT nv.ma_nhan_vien
        FROM nhan_vien nv
        JOIN hop_dong hd ON hd.ma_nhan_vien = nv.ma_nhan_vien
        WHERE YEAR(hd.ngay_lam_hop_dong) BETWEEN 2019 AND 2021) AS tim_nhan_vien_can_xoa);
set sql_safe_updates = 1;

-- Task 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
--  chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
set sql_safe_updates = 0;
UPDATE khach_hang 
SET ma_loai_khach = 1
WHERE ma_khach_hang = (SELECT *
        FROM (SELECT kh.ma_khach_hang
            FROM loai_khach lk
            JOIN khach_hang kh ON kh.ma_loai_khach = lk.ma_loai_khach
            JOIN hop_dong hd ON hd.ma_khach_hang = kh.ma_khach_hang
            JOIN dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
            JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
            JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
            WHERE lk.ten_loai_khach = 'Platinium'
            GROUP BY kh.ma_khach_hang
            HAVING SUM(dv.chi_phi_thue + dvdk.gia * hdct.so_luong) > 10000000) AS bang_tam);
set sql_safe_updates = 1;

-- Task 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
alter table khach_hang
add column is_delete int default 0;
UPDATE khach_hang 
SET is_delete = 1
WHERE
    ma_khach_hang IN (SELECT *
        FROM (SELECT kh.ma_khach_hang
            FROM khach_hang kh
            JOIN hop_dong hd ON hd.ma_khach_hang = kh.ma_khach_hang
            WHERE YEAR(hd.ngay_lam_hop_dong) < 2021) AS tim_khach_hang);

-- Task 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
set sql_safe_updates = 0;
UPDATE dich_vu_di_kem 
SET gia = gia * 2
WHERE ma_dich_vu_di_kem IN (SELECT *
	FROM (SELECT hdct.ma_dich_vu_di_kem
		FROM dich_vu_di_kem dvdk
		JOIN hop_dong_chi_tiet hdct ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
		JOIN hop_dong hd ON hd.ma_hop_dong = hdct.ma_hop_dong
		WHERE YEAR(hd.ngay_lam_hop_dong) = 2020
		GROUP BY hdct.ma_hop_dong_chi_tiet
		HAVING SUM(hdct.so_luong) > 10) AS tim_ma_dvdk);
set sql_safe_updates = 1;

-- Task 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
SELECT 
    ma_nhan_vien,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
FROM nhan_vien 
UNION 
SELECT 
    ma_khach_hang,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
FROM khach_hang