# UC05: Xem thống kê doanh thu theo khách hàng

| Mục | Nội dung |
|---|---|
| Actor | Manager |
| Mô tả | Manager xem doanh thu theo từng khách hàng trong một khoảng thời gian và xem hóa đơn của một khách hàng |
| Tiền điều kiện | Đã đăng nhập với vai trò Manager |
| Hậu điều kiện | Không thay đổi dữ liệu |
| Business rules | BR09, BR10, BR11, BR12, BR13, BR14, BR16 |
| User stories | US07, US08, US09 |

## Luồng chính

1. Manager chọn chức năng xem báo cáo thống kê từ trang chủ.
2. Hệ thống hiển thị giao diện chọn loại thống kê gồm 2 nút: Thống kê dịch vụ, Thống kê khách hàng.
3. Manager bấm Thống kê khách hàng.
4. Hệ thống hiển thị giao diện thống kê khách hàng theo doanh thu gồm: ô ngày bắt đầu, ô ngày kết thúc, nút Áp dụng và nút Quay lại.
5. Manager nhập ngày bắt đầu 01/09/2025, ngày kết thúc 30/09/2025 và bấm Áp dụng.
6. Hệ thống kiểm tra khoảng thời gian (BR11), tính doanh thu và hiển thị bảng, sắp xếp doanh thu giảm dần (BR12), mỗi dòng có nút Chi tiết:

   | STT | Tên khách hàng | Địa chỉ | Số điện thoại | Doanh thu | |
   |---|---|---|---|---|---|
   | 1 | Lò Thị B | Cao Bằng | 0907654321 | 350.000 | Chi tiết |
   | 2 | Nguyễn Văn A | Hải Phòng | 0901234567 | 300.000 | Chi tiết |

7. Manager bấm Chi tiết ở dòng "Nguyễn Văn A".
8. Hệ thống hiển thị danh sách hóa đơn của khách hàng này trong kỳ:

   | ID | Ngày | Tổng tiền | Hình thức | Ghi chú |
   |---|---|---|---|---|
   | 1 | 01/09/2025 | 300.000 | Tiền mặt | |

   Tổng cột "Tổng tiền" = 300.000.
9. Manager bấm Quay lại.
10. Hệ thống quay về giao diện thống kê khách hàng.
11. Manager bấm Quay lại.
12. Hệ thống quay về trang chủ Manager.

## Luồng ngoại lệ

| Bước | Tình huống | Xử lý |
|---|---|---|
| 5.1 | Manager để trống ngày bắt đầu hoặc ngày kết thúc | Hiển thị "Điền đầy đủ thông tin" + OK; quay lại giao diện thống kê khách hàng |
| 5.2 | Ngày sai định dạng | Hiển thị "Ngày tháng không hợp lệ" + OK; quay lại giao diện thống kê khách hàng |
| 5.3 | Ngày không tồn tại trên lịch (31/02/2025) | Hiển thị "Ngày tháng không hợp lệ" + OK; quay lại giao diện thống kê khách hàng |
| 5.4 | Ngày bắt đầu lớn hơn ngày kết thúc | Hiển thị "Khoảng thời gian không hợp lệ" + OK; quay lại giao diện thống kê khách hàng |
| 6.1 | Kỳ hợp lệ nhưng không có hóa đơn nào | Hiển thị "Không có dữ liệu thống kê" |

## Ghi chú
- Doanh thu khách hàng = Σ số tiền thanh toán các hóa đơn của khách hàng đó (BR10).
- Khách hàng của một hóa đơn lấy qua chuỗi Bill → ServiceOrder → Client; tblBill không có `clientID`.
- Số điện thoại trong ví dụ là số giả.
