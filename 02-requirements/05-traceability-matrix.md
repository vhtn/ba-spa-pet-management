# Traceability Matrix

Ma trận truy vết giữa quy tắc nghiệp vụ (BR), user story (US), use case (UC) và test case (TC), để chứng minh mọi yêu cầu đều có kiểm thử.

## 1. Business Rule → User Story → Use Case → Test Case

| BR | Nội dung rút gọn | US | UC | Test case |
|---|---|---|---|---|
| BR01 | Mã duy nhất, không sửa sau khi tạo | US01, US02 | UC01, UC02 | TC-ADD-01, 02, 06; TC-UPD-01 |
| BR02 | Trường bắt buộc | US01, US02 | UC01, UC02 | TC-ADD-03, 09; TC-UPD-04 |
| BR03 | Giá là số > 0 | US01, US02 | UC01, UC02 | TC-ADD-04, 05, 07; TC-UPD-05, 06 |
| BR04 | Thứ tự kiểm tra: bắt buộc → định dạng → trùng mã | US01, US02 | UC01, UC02 | TC-ADD-02, 03, 09 |
| BR05 | Xóa mềm dịch vụ đã có lịch sử | US03 | UC03 | TC-DEL-01, 05; TC-DAT-02 |
| BR06 | Giá chụp lại lúc sử dụng | US02, US05 | UC02, UC04 | TC-UPD-01 |
| BR07 | Trạng thái, kích hoạt lại | US02 | UC02 | TC-UPD-07; TC-ADD-01; TC-DEL-05 |
| BR08 | Tìm theo mã hoặc tên, mọi trạng thái | US04 | UC02, UC03 | TC-UPD-01, 07; TC-DEL-01, 05 |
| BR09 | Chỉ tính đơn đã có hóa đơn; lọc theo ngày thanh toán; gồm hai đầu mút | US05, US07 | UC04, UC05 | TC-SVR-01, 07, 08, 09; TC-CLR-01, 07; TC-DAT-01 |
| BR10 | Công thức doanh thu dịch vụ / khách hàng | US05, US07 | UC04, UC05 | TC-SVR-01; TC-CLR-01, 07; TC-DAT-01 |
| BR11 | Khoảng thời gian hợp lệ | US09 | UC04, UC05 | TC-SVR-03 đến 06; TC-CLR-03 đến 06 |
| BR12 | Sắp xếp doanh thu giảm dần | US05, US07 | UC04, UC05 | TC-SVR-01; TC-CLR-01 |
| BR13 | Tổng chi tiết khớp thống kê | US06, US08 | UC04, UC05 | TC-SVR-01; TC-CLR-01 |
| BR14 | Chỉ Manager truy cập | US10 | UC01-UC05 | TC-SEC-01, 02 |
| BR15 | Điều hướng sau thao tác | US01-US03 | UC01-UC03 | TC-ADD-01, 08; TC-UPD-01, 03; TC-DEL-01, 03, 05 |
| BR16 | Thông báo khi không có kết quả | US04, US05, US07 | UC02-UC05 | TC-UPD-02; TC-DEL-02, 04, 06; TC-SVR-02; TC-CLR-02 |

## 2. User Story → Use Case → Test Case

| US | Tên | UC | Test case | Số TC |
|---|---|---|---|---|---|
| US01 | Thêm dịch vụ | UC01 | TC-ADD-01 đến 09 | 9 |
| US02 | Sửa dịch vụ | UC02 | TC-UPD-01, 03, 04, 05, 06, 07 | 6 |
| US03 | Xóa / ngừng dịch vụ | UC03 | TC-DEL-01, 03, 04, 05 | 4 |
| US04 | Tìm kiếm dịch vụ | UC02, UC03 | TC-UPD-02; TC-DEL-02, 06 | 3 |
| US05 | Thống kê theo dịch vụ | UC04 | TC-SVR-01, 02, 07, 08, 09 | 5 |
| US06 | Hóa đơn chi tiết của dịch vụ | UC04 | TC-SVR-01 | 1 |
| US07 | Thống kê theo khách hàng | UC05 | TC-CLR-01, 02, 07 | 3 |
| US08 | Hóa đơn chi tiết của khách hàng | UC05 | TC-CLR-01 | 1 |
| US09 | Kiểm tra khoảng thời gian | UC04, UC05 | TC-SVR-03 đến 06; TC-CLR-03 đến 06 | 8 |
| US10 | Giới hạn truy cập Manager | UC01-UC05 | TC-SEC-01, 02 | 2 |

## 3. Use Case → Test Case

| UC | Use case | Test case | Số TC |
|---|---|---|---|
| UC01 | Thêm dịch vụ | TC-ADD-01 đến 09 | 9 |
| UC02 | Sửa dịch vụ | TC-UPD-01 đến 07 | 7 |
| UC03 | Xóa / ngừng dịch vụ | TC-DEL-01 đến 06 | 6 |
| UC04 | Thống kê theo dịch vụ | TC-SVR-01 đến 09 | 9 |
| UC05 | Thống kê theo khách hàng | TC-CLR-01 đến 07 | 7 |
| (Dữ liệu) | Ràng buộc CSDL | TC-DAT-01, 02 | 2 |
| (Phân quyền) | Truy cập | TC-SEC-01, 02 | 2 |

## 4. Tổng kết độ phủ

| Hạng mục | Tổng | Có ít nhất 1 TC | Ghi chú |
|---|---|---|---|
| Business rule | 16 | 16 | BR06, BR14 chỉ có 1-2 TC |
| User story | 10 | 10 | US06, US08 chỉ có 1 TC (nằm trong luồng tổng) |
| Use case | 5 | 5 | |
| Test case | 42 | , | 30 TC gốc đã sửa + 12 TC mới |

## 5. Hạn chế đã biết

- TC-SEC phụ thuộc vào module đăng nhập do thành viên khác phụ trách; ở đây chỉ mô tả kết quả mong đợi.
- Các TC ở trạng thái "Designed" chưa chạy trên hệ thống nên chưa có kết quả Pass/Fail.
