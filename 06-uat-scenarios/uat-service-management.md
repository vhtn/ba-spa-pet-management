# UAT: Quản lý dịch vụ

**Dữ liệu chuẩn ban đầu (tblService):** 01 Tắm cơ bản, 0-5 kg, 150.000, Đang hoạt động · 07 Tắm massage, 0-5 kg, 200.000, Đang hoạt động. Cả hai đã có trong chi tiết đơn (có lịch sử sử dụng).

Trạng thái mọi TC: Designed.

## 1. Thêm dịch vụ (UC01)

| Mã | Mô tả | Dữ liệu vào | Kết quả mong đợi | CSDL sau test | US / BR |
|---|---|---|---|---|---|
| TC-ADD-01 | Thêm dịch vụ mới hợp lệ | Mã 010, tên "Cắt cơ bản", đơn vị "0-5 kg", giá 200.000, mô tả "test", trạng thái "Đang hoạt động" → Lưu → OK | Thông báo "Thêm dịch vụ mới thành công"; OK về trang chủ Manager | Thêm dòng 010 | US01 / BR01-04, BR15 |
| TC-ADD-02 | Thêm dịch vụ trùng mã | Mã 07, tên "Cắt cơ bản", giá 200.000, các trường khác hợp lệ → Lưu | "Dịch vụ đã tồn tại"; OK quay lại form thêm **giữ thông tin đã nhập** | Không đổi | US01 / BR01, BR04 |
| TC-ADD-03 | Để trống trường bắt buộc | Mã 03, tên/đơn vị/giá để trống, mô tả "test" → Lưu | "Điền đầy đủ thông tin"; OK quay lại form giữ thông tin | Không đổi | US01 / BR02, BR04 |
| TC-ADD-04 | Giá âm | Mã 03, tên "Cắt cơ bản", giá -200.000 → Lưu | "Dữ liệu không hợp lệ"; OK quay lại form | Không đổi | US01 / BR03 |
| TC-ADD-05 | Giá là chữ | Mã 03, giá "abc" → Lưu | "Dữ liệu không hợp lệ"; OK quay lại form | Không đổi | US01 / BR03 |
| TC-ADD-06 | Thêm hai lần liên tiếp cùng mã | Lần 1: mã 03, "Cắt cơ bản", giá 200.000 → thành công. Lần 2: nhập lại y hệt | Lần 1 thành công; lần 2 "Dịch vụ đã tồn tại" | Chỉ có một dòng 03 | US01 / BR01 |
| TC-ADD-07 | Giá bằng 0 *(mới)* | Mã 03, giá 0 → Lưu | "Dữ liệu không hợp lệ" | Không đổi | US01 / BR03 |
| TC-ADD-08 | Bấm Hủy *(mới)* | Nhập một phần dữ liệu → Hủy | Về giao diện quản lý dịch vụ, không lưu | Không đổi | US01 / BR15 |

## 2. Sửa dịch vụ (UC02)

| Mã | Mô tả | Dữ liệu vào | Kết quả mong đợi | CSDL sau test | US / BR |
|---|---|---|---|---|---|
| TC-UPD-01 | Sửa giá hợp lệ | Tìm "tắm" → Chọn 01 → giá 150.000 → 180.000 → Lưu → OK | Danh sách có 01 và 07; form hiện sẵn dữ liệu, **ID bị khóa**; "Cập nhật dịch vụ thành công"; OK về trang chủ | 01 giá 180.000. **Chi tiết đơn cũ vẫn 150.000, doanh thu quá khứ không đổi** | US02 / BR06, BR15 |
| TC-UPD-02 | Tìm không có kết quả | Tìm "cắt" | "Không có dịch vụ nào trong kết quả tìm kiếm" | Không đổi | US04 / BR16 |
| TC-UPD-03 | Bấm Hủy khi sửa | Tìm "tắm" → Chọn 01 → Hủy | Về giao diện quản lý dịch vụ | Không đổi | US02 / BR15 |
| TC-UPD-04 | Xóa trống tên | Chọn 01 → xóa tên → Lưu | "Điền đầy đủ thông tin"; OK quay lại form sửa giữ nội dung | Không đổi | US02 / BR02 |
| TC-UPD-05 | Sửa giá âm | Chọn 01 → giá -200.000 → Lưu | "Dữ liệu không hợp lệ" | Không đổi | US02 / BR03 |
| TC-UPD-06 | Sửa giá là chữ | Chọn 01 → giá "abc" → Lưu | "Dữ liệu không hợp lệ" | Không đổi | US02 / BR03 |
| TC-UPD-07 | Kích hoạt lại dịch vụ đã ngừng *(mới, tùy chọn)* | Tiền điều kiện: 07 đang "Ngừng hoạt động". Chọn 07 → trạng thái "Đang hoạt động" → Lưu | "Cập nhật dịch vụ thành công" | 07 = Đang hoạt động | US02 / BR07 |

## 3. Xóa dịch vụ (UC03)

Tiền điều kiện chung cho TC-DEL-01: thêm dịch vụ 010 chưa từng dùng (xem TC-ADD-01), vì trong dữ liệu chuẩn cả 01 và 07 đều đã có lịch sử.

| Mã | Mô tả | Dữ liệu vào | Kết quả mong đợi | CSDL sau test | US / BR |
|---|---|---|---|---|---|
| TC-DEL-01 | Xóa dịch vụ chưa từng dùng | Tìm "010" → Chọn → Xác nhận → OK | Hộp thoại "Xác nhận xóa dịch vụ"; "Xóa dịch vụ thành công"; OK về trang chủ | Dòng 010 bị xóa hẳn | US03 / BR05 |
| TC-DEL-02 | Tìm dịch vụ không tồn tại | Tìm "cắt" (khi chưa có dịch vụ nào tên cắt) | "Không có dịch vụ nào trong kết quả tìm kiếm" | Không đổi | US04 / BR16 |
| TC-DEL-03 | Bấm Hủy ở hộp thoại | Tìm "tắm" → Chọn 01 → hộp thoại → **Hủy** | Về giao diện quản lý dịch vụ | Không đổi | US03 / BR15 |
| TC-DEL-04 | Xóa liên tiếp 2 lần cùng dịch vụ | Xóa 010 thành công, sau đó tìm lại "010" | Lần tìm thứ hai: "Không có dịch vụ nào trong kết quả tìm kiếm" | 010 không còn | US03 / BR16 |
| TC-DEL-05 | Xóa dịch vụ đã có lịch sử (xóa mềm) | Tìm "07" → Chọn → Xác nhận | "Dịch vụ đã có lịch sử sử dụng nên được chuyển sang Ngừng hoạt động"; OK về trang chủ | 07 giữ nguyên, **status = Ngừng hoạt động**; tblServiceOrder, tblDetailServiceOrder không đổi | US03 / BR05 |
| TC-DEL-06 | Nhập ký tự đặc biệt khi tìm | Tìm "@#$%^" | "Không có dịch vụ nào trong kết quả tìm kiếm" | Không đổi | US04 / BR16 |
