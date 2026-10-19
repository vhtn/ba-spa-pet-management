# UC02: Sửa thông tin dịch vụ

| Mục | Nội dung |
|---|---|
| Actor | Manager |
| Mô tả | Manager tìm một dịch vụ rồi sửa thông tin của nó |
| Tiền điều kiện | Đã đăng nhập với vai trò Manager; có ít nhất một dịch vụ trong danh mục |
| Hậu điều kiện (thành công) | Thông tin dịch vụ được cập nhật; **các đơn đã tạo trước đó giữ nguyên giá** (BR06) |
| Hậu điều kiện (thất bại) | Dữ liệu không thay đổi |
| Business rules | BR01, BR02, BR03, BR04, BR06, BR07, BR08, BR15, BR16 |
| User stories | US02, US04 |
| Use case liên quan | Search service, View list service (gộp trong luồng chính: bước 4-6) |

## Luồng chính

1. Manager chọn chức năng quản lý dịch vụ từ trang chủ. Manager muốn sửa dịch vụ mã 07 "Tắm massage".
2. Hệ thống hiển thị giao diện quản lý dịch vụ với 3 nút: Thêm, Sửa, Xóa dịch vụ.
3. Manager bấm nút Sửa dịch vụ.
4. Hệ thống hiển thị giao diện tìm kiếm gồm một ô nhập "Mã hoặc tên dịch vụ" và nút Tìm.
5. Manager nhập "Tắm" và bấm Tìm.
6. Hệ thống hiển thị bảng kết quả (mọi trạng thái, BR08) gồm các cột ID, Tên, Đơn vị, Giá, Trạng thái và nút Chọn ở cuối mỗi dòng:

   | ID | Tên | Đơn vị | Giá | Trạng thái | |
   |---|---|---|---|---|---|
   | 001 | Tắm cơ bản | 0-5 kg | 150.000 | Đang hoạt động | Chọn |
   | 007 | Tắm massage | 0-5 kg | 200.000 | Đang hoạt động | Chọn |

7. Manager bấm Chọn ở dòng thứ hai (mã 007).
8. Hệ thống hiển thị form sửa với dữ liệu hiện tại: mã = 07 (**bị khóa, không sửa được**), tên = "Tắm massage", đơn vị = "0-5 kg", giá = 200.000, mô tả trống, trạng thái (danh sách chọn) = "Đang hoạt động", và hai nút Lưu, Hủy.
9. Manager sửa mô tả thành "Massage thư giãn" và bấm Lưu.
10. Hệ thống kiểm tra dữ liệu (theo BR04) và cập nhật.
11. Hệ thống hiển thị "Cập nhật dịch vụ thành công" cùng nút OK.
12. Manager bấm OK.
13. Hệ thống quay về trang chủ Manager (BR15).

## Luồng ngoại lệ

| Bước | Tình huống | Xử lý |
|---|---|---|
| 6.1 | Không có dịch vụ nào khớp từ khóa (ví dụ "cắt" hoặc "@#$%^") | Hệ thống hiển thị "Không có dịch vụ nào trong kết quả tìm kiếm" (BR16); Manager có thể nhập lại |
| 9.1 | Manager xóa trống trường bắt buộc (ví dụ tên) rồi bấm Lưu | Hiển thị "Điền đầy đủ thông tin" + OK; bấm OK quay lại form sửa, giữ nội dung đang nhập |
| 9.2 | Giá là số âm, bằng 0 hoặc chữ | Hiển thị "Dữ liệu không hợp lệ" + OK; bấm OK quay lại form sửa, giữ nội dung đang nhập |
| 9.3 | Manager bấm Hủy | Hệ thống quay về giao diện quản lý dịch vụ, dữ liệu không đổi |

## Ghi chú
- Sửa giá chỉ ảnh hưởng đến đơn tạo **sau** thời điểm sửa (BR06). Doanh thu quá khứ không đổi.
- Manager có thể đổi trạng thái sang "Đang hoạt động" để kích hoạt lại dịch vụ đã ngừng (BR07).
