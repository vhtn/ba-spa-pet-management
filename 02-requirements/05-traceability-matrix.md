# Traceability Matrix

Ma trận truy vết giữa quy tắc nghiệp vụ (BR), user story (US), use case (UC) và test case (TC), để kiểm tra mọi yêu cầu đã có kiểm thử hay chưa. Chỉ liệt kê các test case đang có trong [06-uat-scenarios](../06-uat-scenarios/).

## 1. Business Rule → User Story → Use Case → Test Case

| BR | Nội dung rút gọn | US | UC | Test case |
|---|---|---|---|---|
| BR01 | Mã duy nhất, không sửa sau khi tạo | US01, US02 | UC01, UC02 | TC-ADD-01, 02, 06; TC-UPD-01 |
| BR02 | Trường bắt buộc | US01, US02 | UC01, UC02 | TC-ADD-01, 03, 09; TC-UPD-04 |
| BR03 | Giá là số > 0 | US01, US02 | UC01, UC02 | TC-ADD-01, 04, 05, 07; TC-UPD-05, 06 |
| BR04 | Thứ tự kiểm tra: bắt buộc → định dạng → trùng mã | US01, US02 | UC01, UC02 | TC-ADD-01, 02, 03, 09 |
| BR05 | Giá chụp lại lúc sử dụng | US02, US04 | UC02, UC03 | TC-UPD-01 |
| BR06 | Trạng thái, kích hoạt lại | US02 | UC02 | TC-UPD-07 |
| BR07 | Tìm kiếm theo mã hoặc tên, hiện mọi trạng thái | US03 | UC02 | TC-UPD-01, 07 |
| BR08 | Chỉ tính đơn đã có hóa đơn; lọc theo ngày thanh toán; gồm hai đầu mút | US04, US06 | UC03, UC04 | TC-SVR-01, 07, 08; TC-CLR-01, 07 |
| BR09 | Công thức doanh thu dịch vụ / khách hàng | US04, US06 | UC03, UC04 | TC-SVR-01; TC-CLR-01, 07 |
| BR10 | Khoảng thời gian hợp lệ | US08 | UC03, UC04 | TC-SVR-03 đến 06; TC-CLR-03 đến 06 |
| BR11 | Sắp xếp doanh thu giảm dần | US04, US06 | UC03, UC04 | TC-SVR-01; TC-CLR-01 |
| BR12 | Tổng chi tiết khớp thống kê | US05, US07 | UC03, UC04 | TC-SVR-01; TC-CLR-01 |
| BR13 | Chỉ Manager truy cập | US09 | UC01-UC04 | *(chưa có TC)* |
| BR14 | Điều hướng sau thao tác thành công, Hủy, Quay lại | US01-US08 | UC01-UC04 | TC-ADD-01, 08; TC-UPD-01, 03; TC-SVR-01; TC-CLR-01 |
| BR15 | Thông báo khi không có kết quả | US03, US04, US06 | UC02-UC04 | TC-UPD-02; TC-SVR-02; TC-CLR-02 |

## 2. User Story → Use Case → Test Case

| US | Tên | UC | Test case | Số TC |
|---|---|---|---|---|
| US01 | Thêm dịch vụ | UC01 | TC-ADD-01 đến 09 | 9 |
| US02 | Sửa dịch vụ | UC02 | TC-UPD-01, 03, 04, 05, 06, 07 | 6 |
| US03 | Tìm kiếm dịch vụ | UC02 | TC-UPD-02 | 1 |
| US04 | Thống kê theo dịch vụ | UC03 | TC-SVR-01, 02, 07, 08 | 4 |
| US05 | Hóa đơn chi tiết của dịch vụ | UC03 | TC-SVR-01 | 1 |
| US06 | Thống kê theo khách hàng | UC04 | TC-CLR-01, 02, 07 | 3 |
| US07 | Hóa đơn chi tiết của khách hàng | UC04 | TC-CLR-01 | 1 |
| US08 | Kiểm tra khoảng thời gian | UC03, UC04 | TC-SVR-03 đến 06; TC-CLR-03 đến 06 | 8 |
| US09 | Giới hạn truy cập Manager | UC01-UC04 | *(chưa có TC)* | 0 |

## 3. Use Case → Test Case

| UC | Use case | Test case | Số TC |
|---|---|---|---|
| UC01 | Thêm dịch vụ | TC-ADD-01 đến 09 | 9 |
| UC02 | Sửa dịch vụ | TC-UPD-01 đến 07 | 7 |
| UC03 | Thống kê theo dịch vụ | TC-SVR-01 đến 08 | 8 |
| UC04 | Thống kê theo khách hàng | TC-CLR-01 đến 07 | 7 |
| | **Tổng** | | **31** |

## 4. Tổng kết độ phủ

| Hạng mục | Tổng | Có ít nhất 1 TC | Ghi chú |
|---|---|---|---|
| Business rule | 15 | 14 | BR13 chưa có TC; BR05, BR06 chỉ có 1 TC |
| User story | 9 | 8 | US09 chưa có TC; US03, US05, US07 chỉ có 1 TC |
| Use case | 4 | 4 | |
| Test case | 31 | | ADD 9, UPD 7, SVR 8, CLR 7 |

## 5. Hạn chế đã biết
- Chưa có test case cho phân quyền (BR13, US09); phần này phụ thuộc module đăng nhập do thành viên khác phụ trách.
- Các TC ở trạng thái "Designed" chưa chạy trên hệ thống nên chưa có kết quả Pass/Fail.
