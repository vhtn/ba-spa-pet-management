# Business Rules

Các quy tắc nghiệp vụ áp dụng cho module Quản lý dịch vụ & Báo cáo thống kê.
Mỗi quy tắc có mã BR để truy vết tới user story, use case và test case.

## 1. Quản lý dịch vụ

| Mã | Quy tắc | Lý do | Liên quan |
|---|---|---|---|
| BR01 | Mã dịch vụ là số nguyên dương, duy nhất, do người dùng nhập, hiển thị 3 chữ số (ví dụ 007) và **không sửa được** sau khi tạo | Mã là khóa tham chiếu của chi tiết đơn dịch vụ; đổi mã sẽ làm hỏng liên kết | US01, US02 |
| BR02 | Bắt buộc nhập: mã, tên, đơn vị, giá, trạng thái. Mô tả là tùy chọn | Thiếu các trường này thì dịch vụ không dùng được khi lập đơn | US01, US02 |
| BR03 | Giá dịch vụ phải là số lớn hơn 0 (đơn vị VNĐ) | Giá âm, bằng 0 hoặc là chữ làm sai tổng tiền và doanh thu | US01, US02 |
| BR04 | Thứ tự kiểm tra khi lưu: (1) trường bắt buộc, (2) định dạng/giá trị, (3) trùng mã | Thứ tự cố định để mỗi lần chỉ báo một loại lỗi, thông báo dễ hiểu | US01, US02 |
| BR05 | Dịch vụ đã xuất hiện trong ít nhất một chi tiết đơn dịch vụ **không bị xóa khỏi CSDL**: hệ thống chuyển trạng thái sang "Ngừng hoạt động" và thông báo cho quản lý. Dịch vụ chưa từng được dùng thì xóa hẳn | Bảo toàn lịch sử sử dụng và toàn vẹn khóa ngoại; báo cáo quá khứ vẫn đúng | US03 |
| BR06 | Giá được lưu cùng chi tiết đơn tại thời điểm sử dụng. Sửa giá dịch vụ chỉ ảnh hưởng đơn tạo sau đó | `price` nằm trong bảng chi tiết đơn (ERD sau mịn hóa); nếu tra giá hiện tại thì sửa giá sẽ làm đổi doanh thu quá khứ | US02, US05 |
| BR07 | Trạng thái dịch vụ gồm "Đang hoạt động" và "Ngừng hoạt động"; sửa được qua danh sách chọn, cho phép kích hoạt lại dịch vụ đã ngừng | Tránh phải tạo mới dịch vụ khi spa muốn mở bán lại | US02 |
| BR08 | Tìm kiếm theo mã hoặc tên chứa từ khóa, hiển thị dịch vụ ở mọi trạng thái | Quản lý cần thấy cả dịch vụ đã ngừng để kích hoạt lại hoặc kiểm tra | US04 |

## 2. Báo cáo thống kê

| Mã | Quy tắc | Lý do | Liên quan |
|---|---|---|---|
| BR09 | Doanh thu chỉ tính trên đơn dịch vụ **đã có hóa đơn thanh toán**, lọc theo ngày thanh toán, bao gồm cả ngày bắt đầu và ngày kết thúc | Đơn chưa thanh toán chưa phải tiền đã thu | US05, US07 |
| BR10 | Doanh thu theo dịch vụ = Σ (số lượng × giá) trong chi tiết đơn của dịch vụ đó. Doanh thu theo khách hàng = Σ số tiền thanh toán của các hóa đơn thuộc khách hàng đó (liên kết Bill → ServiceOrder → Client) | Dịch vụ cần tách theo từng dịch vụ trong một hóa đơn; khách hàng dùng số tiền thực thu | US05, US07 |
| BR11 | Khoảng thời gian thống kê: cả hai ngày bắt buộc, định dạng dd/mm/yyyy, là ngày tồn tại thật trên lịch, và ngày bắt đầu ≤ ngày kết thúc | Ngăn truy vấn sai và báo lỗi rõ ràng | US09 |
| BR12 | Báo cáo sắp xếp theo doanh thu giảm dần | Quản lý quan tâm nhất mục đem lại nhiều doanh thu | US05, US07 |
| BR13 | Bảng chi tiết hóa đơn hiển thị cột "Thành tiền dịch vụ" (số lượng × giá) và tổng các dòng phải khớp doanh thu ở bảng thống kê | Cho phép đối chiếu số liệu tổng hợp về nguồn | US06, US08 |

## 3. Truy cập và điều hướng

| Mã | Quy tắc | Lý do | Liên quan |
|---|---|---|---|
| BR14 | Chỉ vai trò Manager truy cập được module | Dữ liệu doanh thu và danh mục giá là thông tin nhạy cảm | US10 |
| BR15 | Thao tác thành công → quay về trang chủ Manager. Bấm Hủy hoặc Quay lại → về màn hình ngay trước đó | Hành vi nhất quán giữa các chức năng | US01-US09 |
| BR16 | Khi không có kết quả: tìm kiếm báo "Không có dịch vụ nào trong kết quả tìm kiếm"; thống kê báo "Không có dữ liệu thống kê" | Thông báo thống nhất, người dùng biết hệ thống không lỗi | US04, US05, US07 |
