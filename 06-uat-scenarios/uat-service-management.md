# UAT: Quản lý dịch vụ

**Dữ liệu chuẩn ban đầu (tblService):** 01 Tắm cơ bản, 0-5 kg, 150.000, Đang hoạt động · 07 Tắm massage, 0-5 kg, 200.000, Đang hoạt động. Cả hai đã có trong chi tiết đơn (có lịch sử sử dụng).

Trạng thái mọi TC: Designed.

## 1. Thêm dịch vụ (UC01)

| Mã | Mô tả | Dữ liệu vào | Kết quả mong đợi | CSDL sau test | US / BR |
|---|---|---|---|---|---|
| TC-ADD-01 | Thêm dịch vụ mới hợp lệ | Mã 010, tên "Cắt cơ bản", đơn vị "0-5 kg", giá 200.000, mô tả "test", trạng thái "Đang hoạt động" → Lưu → OK | Thông báo "Thêm dịch vụ mới thành công"; OK về trang chủ Manager | Thêm dòng 010 | US01 / BR01-04, BR14 |
| TC-ADD-02 | Thêm dịch vụ trùng mã | Mã 07, tên "Cắt cơ bản", giá 200.000, các trường khác hợp lệ → Lưu | "Dịch vụ đã tồn tại"; OK quay lại form thêm **giữ thông tin đã nhập** | Không đổi | US01 / BR01, BR04 |
| TC-ADD-03 | Để trống trường bắt buộc | Mã 03, tên/đơn vị/giá để trống, mô tả "test" → Lưu | "Điền đầy đủ thông tin"; OK quay lại form giữ thông tin | Không đổi | US01 / BR02, BR04 |
| TC-ADD-04 | Giá âm | Mã 03, tên "Cắt cơ bản", giá -200.000 → Lưu | "Dữ liệu không hợp lệ"; OK quay lại form | Không đổi | US01 / BR03 |
| TC-ADD-05 | Giá là chữ | Mã 03, giá "abc" → Lưu | "Dữ liệu không hợp lệ"; OK quay lại form | Không đổi | US01 / BR03 |
| TC-ADD-06 | Thêm hai lần liên tiếp cùng mã | Lần 1: mã 03, "Cắt cơ bản", giá 200.000 → thành công. Lần 2: nhập lại y hệt | Lần 1 thành công; lần 2 "Dịch vụ đã tồn tại" | Chỉ có một dòng 03 | US01 / BR01 |
| TC-ADD-07 | Giá bằng 0 | Mã 03, giá 0 → Lưu | "Dữ liệu không hợp lệ" | Không đổi | US01 / BR03 |
| TC-ADD-08 | Bấm Hủy | Nhập một phần dữ liệu → Hủy | Về giao diện quản lý dịch vụ, không lưu | Không đổi | US01 / BR14 |
| TC-ADD-09	| Nhiều lỗi cùng lúc | Mã 07 (trùng), tên để trống, giá -200.000 → Lưu | Chỉ báo “Điền đầy đủ thông tin” (lỗi bắt buộc đứng trước). Sửa tên, giữ giá âm → Lưu → báo “Dữ liệu không hợp lệ”. Sửa giá hợp lệ, giữ mã 07 → Lưu → báo “Dịch vụ đã tồn tại” | Không đổi | US01 / BR04 |

## 2. Sửa dịch vụ (UC02)

| Mã | Mô tả | Dữ liệu vào | Kết quả mong đợi | CSDL sau test | US / BR |
|---|---|---|---|---|---|
| TC-UPD-01 | Sửa giá hợp lệ | Tìm "tắm" → Chọn 01 → giá 150.000 → 180.000 → Lưu → OK | Danh sách có 01 và 07; form hiện sẵn dữ liệu, **ID bị khóa**; "Cập nhật dịch vụ thành công"; OK về trang chủ | 01 giá 180.000. **Chi tiết đơn cũ vẫn 150.000, doanh thu quá khứ không đổi** | US02 / BR05, BR14 |
| TC-UPD-02 | Tìm không có kết quả | Tìm "cắt" | "Không có dịch vụ nào trong kết quả tìm kiếm" | Không đổi | US03 / BR15 |
| TC-UPD-03 | Bấm Hủy khi sửa | Tìm "tắm" → Chọn 01 → Hủy | Về giao diện quản lý dịch vụ | Không đổi | US02 / BR14 |
| TC-UPD-04 | Xóa trống tên | Chọn 01 → xóa tên → Lưu | "Điền đầy đủ thông tin"; OK quay lại form sửa giữ nội dung | Không đổi | US02 / BR02 |
| TC-UPD-05 | Sửa giá âm | Chọn 01 → giá -200.000 → Lưu | "Dữ liệu không hợp lệ" | Không đổi | US02 / BR03 |
| TC-UPD-06 | Sửa giá là chữ | Chọn 01 → giá "abc" → Lưu | "Dữ liệu không hợp lệ" | Không đổi | US02 / BR03 |
| TC-UPD-07 | Kích hoạt lại dịch vụ đã ngừng | Tiền điều kiện: 07 đang "Ngừng hoạt động". Chọn 07 → trạng thái "Đang hoạt động" → Lưu | "Cập nhật dịch vụ thành công" | 07 = Đang hoạt động | US02 / BR06 |
