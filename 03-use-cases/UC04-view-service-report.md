# UC03: Xem thống kê doanh thu theo dịch vụ

| Mục | Nội dung |
|---|---|
| Actor | Manager |
| Mô tả | Manager xem doanh thu theo từng dịch vụ trong một khoảng thời gian và xem hóa đơn chi tiết của một dịch vụ |
| Tiền điều kiện | Đã đăng nhập với vai trò Manager |
| Hậu điều kiện | Không thay đổi dữ liệu |
| Business rules | BR09, BR10, BR11, BR12, BR13, BR14, BR16 |
| User stories | US05, US06, US09 |

## Luồng chính

1. Manager chọn chức năng xem báo cáo thống kê từ trang chủ.
2. Hệ thống hiển thị giao diện chọn loại thống kê gồm 2 nút: Thống kê dịch vụ, Thống kê khách hàng.
3. Manager bấm Thống kê dịch vụ.
4. Hệ thống hiển thị giao diện thống kê dịch vụ theo doanh thu gồm: ô ngày bắt đầu, ô ngày kết thúc, nút Áp dụng và nút Quay lại.
5. Manager nhập ngày bắt đầu 01/09/2025, ngày kết thúc 30/09/2025 và bấm Áp dụng.
6. Hệ thống kiểm tra khoảng thời gian (BR11), tính doanh thu và hiển thị bảng, sắp xếp doanh thu giảm dần (BR12), mỗi dòng có nút Chi tiết:

   | STT | Tên dịch vụ | Đơn vị | Giá | Số lượng | Doanh thu | |
   |---|---|---|---|---|---|---|
   | 1 | Tắm cơ bản | 0-5 kg | 150.000 | 3 | 450.000 | Chi tiết |
   | 2 | Tắm massage | 0-5 kg | 200.000 | 1 | 200.000 | Chi tiết |

7. Manager bấm Chi tiết ở dòng "Tắm cơ bản".
8. Hệ thống hiển thị danh sách hóa đơn có dịch vụ này trong kỳ 01/09/2025 - 30/09/2025:

   | ID | Ngày | Số lượng | Thành tiền dịch vụ | Hình thức | Ghi chú |
   |---|---|---|---|---|---|
   | 1 | 01/09/2025 | 2 | 300.000 | Tiền mặt | |
   | 2 | 03/09/2025 | 1 | 150.000 | Chuyển khoản | |

   Tổng "Thành tiền dịch vụ" = 450.000.
9. Manager bấm Quay lại.
10. Hệ thống quay về giao diện thống kê dịch vụ.
11. Manager bấm Quay lại.
12. Hệ thống quay về trang chủ Manager.

## Luồng ngoại lệ

| Bước | Tình huống | Xử lý |
|---|---|---|
| 5.1 | Manager để trống ngày bắt đầu hoặc ngày kết thúc | Hiển thị "Điền đầy đủ thông tin" + OK; bấm OK quay lại giao diện thống kê dịch vụ |
| 5.2 | Ngày sai định dạng (ví dụ "1 tháng 9 năm 2025") | Hiển thị "Ngày tháng không hợp lệ" + OK; quay lại giao diện thống kê |
| 5.3 | Ngày không tồn tại trên lịch (ví dụ 31/02/2025) | Hiển thị "Ngày tháng không hợp lệ" + OK; quay lại giao diện thống kê |
| 5.4 | Ngày bắt đầu lớn hơn ngày kết thúc | Hiển thị "Khoảng thời gian không hợp lệ" + OK; quay lại giao diện thống kê |
| 6.1 | Kỳ hợp lệ nhưng không có hóa đơn nào (ví dụ 01/11/2025 - 30/11/2025) | Hiển thị "Không có dữ liệu thống kê" |

## Ghi chú
- Doanh thu dịch vụ = Σ (số lượng × giá trong chi tiết đơn), chỉ tính đơn đã có hóa đơn, lọc theo ngày thanh toán (BR09, BR10).
- Kỳ thống kê gồm cả ngày cuối: hóa đơn lúc 23:30 ngày 30/09/2025 vẫn nằm trong kỳ (BR09).
- Thứ tự kiểm tra đầu vào: trống → định dạng/ngày tồn tại → khoảng thời gian.
