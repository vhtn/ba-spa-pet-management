# UC01: Thêm dịch vụ

| Mục | Nội dung |
|---|---|
| Actor | Manager |
| Mô tả | Manager thêm một dịch vụ mới vào danh mục của spa |
| Tiền điều kiện | Đã đăng nhập với vai trò Manager (BR14) |
| Hậu điều kiện (thành công) | Dịch vụ mới được lưu vào tblService với trạng thái đã chọn |
| Hậu điều kiện (thất bại) | Dữ liệu không thay đổi |
| Business rules | BR01, BR02, BR03, BR04, BR15 |
| User story | US01 |

## Luồng chính

1. Manager chọn chức năng quản lý dịch vụ từ trang chủ.
2. Hệ thống hiển thị giao diện quản lý dịch vụ với 3 nút: Thêm, Sửa, Xóa dịch vụ.
3. Manager bấm nút Thêm dịch vụ.
4. Hệ thống hiển thị form thêm dịch vụ gồm các ô: mã dịch vụ, tên, đơn vị, giá, mô tả, trạng thái (danh sách chọn) và hai nút Lưu, Hủy.
5. Manager nhập: mã = 10, tên = "Cắt cơ bản", đơn vị = "0-5 kg", giá = 200.000, mô tả để trống, trạng thái = "Đang hoạt động", rồi bấm Lưu.
6. Hệ thống kiểm tra dữ liệu (theo thứ tự BR04) và lưu dịch vụ.
7. Hệ thống hiển thị "Thêm dịch vụ mới thành công" cùng nút OK.
8. Manager bấm OK.
9. Hệ thống quay về trang chủ Manager (BR15).

## Luồng ngoại lệ

| Bước | Tình huống | Xử lý |
|---|---|---|
| 5.1 | Manager để trống một trường bắt buộc rồi bấm Lưu | Hệ thống hiển thị "Điền đầy đủ thông tin" + OK. Bấm OK quay lại form thêm, **giữ các thông tin đã nhập** |
| 5.2 | Giá là số âm, bằng 0 hoặc chứa chữ | Hệ thống hiển thị "Dữ liệu không hợp lệ" + OK. Bấm OK quay lại form, giữ thông tin đã nhập |
| 5.3 | Mã dịch vụ đã tồn tại | Hệ thống hiển thị "Dịch vụ đã tồn tại" + OK. Bấm OK quay lại form, giữ thông tin đã nhập |
| 5.4 | Manager bấm Hủy | Hệ thống quay về giao diện quản lý dịch vụ, không lưu gì |

## Ghi chú
- Khi nhiều lỗi cùng xảy ra, chỉ báo lỗi đầu tiên theo thứ tự: bắt buộc → định dạng/giá trị → trùng mã (BR04).
