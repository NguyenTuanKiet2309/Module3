create
database ss5_luyen_tap_view_index_stored_procedure;
use
ss5_luyen_tap_view_index_stored_procedure;

create table product
(
    id                  int primary key auto_increment,
    product_code        varchar(10),
    product_name        varchar(50),
    product_price       int,
    product_amount      int,
    product_description varchar(50),
    product_status      varchar(50)
);

insert into product(product_code, product_name, product_price, product_amount, product_description, product_status)
values ("P-1", "AF1", 100, 200, "Nike", "Used"),
       ("P-2", "AF2", 200, 300, "Nike", "Used"),
       ("P-3", "AF3", 300, 400, "Nike", "Used");
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index index_code on product (product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice
create index composite_index on product (product_name, product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain
select *
from product;
select *
from product;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view view_product(product_code, product_name, product_price, product_status) as
select product_code, product_name, product_price, product_status
from product;

-- Tiến hành sửa đổi view
insert into view_product(product_code, product_name, product_price, product_status)
values ("P-5", "AF5", 1000, "Used");

-- Tiến hành xoá view
drop view view_product;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter
//
create procedure find_all()
begin
select *
from product;
end
//
delimiter ;

call find_all;

-- Tạo store procedure thêm một sản phẩm mới
delimiter
//
create procedure add_product(product_code varchar (20), product_name varchar (50),
                             product_price int, product_amount int, product_description varchar (50),
                             product_status varchar (50))
begin
insert into product(product_code, product_name, product_price, product_amount, product_description, product_status)
values (product_code, product_name, product_price, product_amount, product_description, product_status);
end
// delimiter ;
call add_product("P-09", "AF10", 3000, 333, "Nike", "new");

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter
//
create procedure edit_product(id int, code varchar (20), name varchar (50),
                              price int, amount int, description varchar (50), status varchar (50))
begin
update product
set product_code        = code,
    product_name        = name,
    product_price       = price,
    product_amount      = amount,
    product_description = description,
    product_status      = status
where product.id = id;
end
// delimiter ;

call edit_product(2,"P-09" , "Air Max 97", 50000, 400, "Nike", "New");
select *
from product;

-- Tạo store procedure xoá sản phẩm theo id
delimiter
//
create procedure delete_product(id int)
begin
delete
from product
where product.id = id;
end
// delimiter ;

call delete_product(5);
