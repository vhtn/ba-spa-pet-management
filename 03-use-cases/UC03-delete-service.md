# UC03: Xóa / ngừng dịch vụ

| Mục | Nội dung |
|---|---|
| Actor | Manager |
| Mô tả | Manager xóa một dịch vụ không còn phù hợp. Dịch vụ đã có lịch sử sử dụng được chuyển sang "Ngừng hoạt động" thay vì xóa khỏi CSDL |
| Tiền điều kiện | Đã đăng nhập với vai trò Manager; dịch vụ cần xóa tồn tại |
| Hậu điều kiện (chưa từng dùng) | Dịch vụ bị xóa khỏi tblService |
| Hậu điều kiện (đã có lịch sử) | Dịch vụ giữ nguyên trong CSDL, trạng thái = "Ngừng hoạt động" |
| Hậu điều kiện (hủy) | Dữ liệu không thay đổi |
| Business rules | BR05, BR08, BR15, BR16 |
| User stories | US03, US04 |

## Luồng chính (dịch vụ chưa từng được sử dụng)

*Ví dụ: dịch vụ 10 "Cắt cơ bản" vừa thêm ở UC01, chưa có trong chi tiết đơn nào.*

1. Manager chọn chức năng quản lý dịch vụ từ trang chủ. Manager muốn xóa dịch vụ mã 10.
2. Hệ thống hiển thị giao diện quản lý dịch vụ với 3 nút: Thêm, Sửa, Xóa dịch vụ.
3. Manager bấm nút Xóa dịch vụ.
4. Hệ thống hiển thị giao diện tìm kiếm (ô nhập "Mã hoặc tên dịch vụ" và nút Tìm).
5. Manager nhập "10" và bấm Tìm.
6. Hệ thống hiển thị bảng kết quả dịch vụ (cột ID, Tên, Đơn vị, Giá, Trạng thái, nút Chọn).
7. Manager bấm Chọn ở dòng 10.
8. Hệ thống hiển thị hộp thoại "Xác nhận xóa dịch vụ" với nút Xác nhận và Hủy.
9. Manager bấm Xác nhận.
10. Hệ thống kiểm tra dịch vụ chưa có trong chi tiết đơn nào và xóa khỏi CSDL.
11. Hệ thống hiển thị "Xóa dịch vụ thành công" cùng nút OK.
12. Manager bấm OK.
13. Hệ thống quay về trang chủ Manager (BR15).

## Luồng thay thế: dịch vụ đã có lịch sử sử dụng

*Ví dụ: dịch vụ 07 "Tắm massage" đã nằm trong chi tiết đơn 02.*

Bước 1-9 như luồng chính (nhập "07" ở bước 5).

10a. Hệ thống phát hiện dịch vụ đã có trong ít nhất một chi tiết đơn dịch vụ,
     **không xóa**, chuyển trạng thái sang "Ngừng hoạt động".
11a. Hệ thống hiển thị "Dịch vụ đã có lịch sử sử dụng nên được chuyển sang Ngừng hoạt động" + OK.
12a. Manager bấm OK; hệ thống quay về trang chủ Manager.

Kết quả: dịch vụ 07 vẫn còn trong CSDL (status = "Ngừng hoạt động"); bảng đơn và chi tiết đơn không thay đổi; báo cáo quá khứ vẫn tính dịch vụ này.

## Luồng ngoại lệ

| Bước | Tình huống | Xử lý |
|---|---|---|
| 6.1 | Không có dịch vụ khớp từ khóa (ví dụ "cắt", "@#$%^") | Hiển thị "Không có dịch vụ nào trong kết quả tìm kiếm" (BR16) |
| 9.1 | Manager bấm Hủy ở hộp thoại xác nhận | Hệ thống quay về giao diện quản lý dịch vụ, dữ liệu không đổi |
| 11.1 | Xóa lần hai cùng một dịch vụ đã bị xóa | Tìm lại mã đó trả về "Không có dịch vụ nào trong kết quả tìm kiếm" |

## Ghi chú
- Lý do xóa mềm: giữ lịch sử và toàn vẹn khóa ngoại (BR05). CSDL cũng chặn xóa cứng vì khóa ngoại `serviceID` dùng RESTRICT.
- Trong bộ dữ liệu chuẩn, cả 01 và 07 đều đã có lịch sử; luồng chính cần dịch vụ chưa từng dùng, nên phải tạo thêm dịch vụ 10 làm tiền điều kiện (xem Bước 7).
