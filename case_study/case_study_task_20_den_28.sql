use case_study;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
create view v_nhan_vien(ma_nhan_vien,ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi) as
select nv.ma_nhan_vien,nv.ho_ten,nv.ngay_sinh,nv.so_cmnd,nv.luong,nv.so_dien_thoai,nv.email,nv.dia_chi
from nhan_vien nv
join hop_dong hd 
on hd.ma_nhan_vien = nv.ma_nhan_vien
where nv.dia_chi like "%Hải Châu%" and hd.ngay_lam_hop_dong = 2019-12-12;

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
update v_nhan_vien
set dia_chi = 'Liên Chiểu'
where dia_chi like '%Hải Châu%';

-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang
-- được truyền vào như là 1 tham số của sp_xoa_khach_hang.
delimiter // 
create procedure sp_xoa_khach_hang(ma_khach_hang int)
begin
    update khach_hang
    set is_delete = 1
    where khach_hang.ma_khach_hang = ma_khach_hang;
end // 
delimiter ;

call sp_xoa_khach_hang(6);

-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải
-- thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
delimiter //
create procedure sp_them_moi_hop_dong(sp_ma_hop_dong int,sp_ngay_lam_hop_dong datetime,sp_ngay_ket_thuc datetime,
sp_tien_dat_coc double,sp_ma_nhan_vien int,sp_ma_khach_hang int,sp_ma_dich_vu int)
begin
	if sp_ma_hop_dong in (select ma_hop_dong from hop_dong) then
		SIGNAL SQLSTATE '50000'
		SET MESSAGE_TEXT = 'Mã hợp đồng đã tồn tại';
	end if;
	if sp_ma_nhan_vien not in (select ma_nhan_vien from hop_dong) then
		SIGNAL SQLSTATE '55000'
		SET MESSAGE_TEXT = 'Mã nhân viên không tồn tại';
	end if;
	if sp_ma_dich_vu not in (select ma_dich_vu from hop_dong) then
		SIGNAL SQLSTATE '60000'
		SET MESSAGE_TEXT = 'Mã dịch vụ không tồn tại';
	end if;
	if sp_ma_khach_hang not in (select ma_khach_hang from hop_dong) then
		SIGNAL SQLSTATE '50005'
		SET MESSAGE_TEXT = 'Mã khách hàng không tồn tại';
	end if;
	insert into hop_dong(ma_hop_dong,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
	values (sp_ma_hop_dong,sp_ngay_lam_hop_dong,sp_ngay_ket_thuc,sp_tien_dat_coc,sp_ma_nhan_vien,sp_ma_khach_hang,sp_ma_dich_vu);
end //
delimiter ;

call sp_them_moi_hop_dong(16,20201208,20201208,0,3,33,3);
-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượn
-- bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
create table xoa_hop_dong(
tong_so_luong_ban_ghi_con_lai int);
alter table hop_dong
add column is_delete int default 0;

delimiter //
create trigger tr_xoa_hop_dong
after update on hop_dong
for each row
begin 
	declare so_luong int;
    select count(is_delete) from hop_dong where is_delete = 0 into so_luong;
    insert into xoa_hop_dong(tong_so_luong_ban_ghi_con_lai)
    values (so_luong);
end //
delimiter ;
update hop_dong
set is_delete = 1
where ma_hop_dong = 5;
drop trigger tr_xoa_hop_dong
-- 26.	Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không
-- với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật,
-- nếu dữ liệu không hợp lệ thì in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
delimiter //
create trigger tr_cap_nhat_hop_dong
after update on hop_dong.ngay_ket_thuc
for each row
begin 
	
end //
delimiter ;

-- 27.	Tạo Function thực hiện yêu cầu sau:
-- a.	Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ.
-- b.	Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến lúc
-- kết thúc hợp đồng mà khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ,
-- không xét trên toàn bộ các lần làm hợp đồng). Mã của khách hàng được truyền vào như là 1 tham số của function này.


-- 28.	Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room”
-- từ đầu năm 2015 đến hết năm 2019 để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng dich_vu) và 
-- xóa những hop_dong sử dụng dịch vụ liên quan (tức là phải xóa những bản gi trong bảng hop_dong) và những bản liên quan khác.
