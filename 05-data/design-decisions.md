# Design Decisions

## 1. Các điều chỉnh khi mịn hóa mô hình dữ liệu

| # | Thay đổi | Lý do |
|---|---|---|
| 1 | Bỏ `name` khỏi tblDetailServiceOrder | Tên lấy được từ tblService qua `serviceID`, tránh lưu trùng |
| 2 | Bỏ `date` khỏi tblDetailServiceOrder | Ngày sử dụng đã có ở tblServiceOrder qua `serviceOrderID` |
| 3 | Thêm `quantity` vào tblDetailServiceOrder | Một đơn có thể dùng nhiều lần cùng một dịch vụ; cần để tính tiền |
| 4 | Bỏ `totalPrice` khỏi tblServiceOrder | Tổng tiền tính được từ chi tiết đơn; lưu thêm dễ lệch số liệu |
| 5 | Thêm `status` vào tblService | Cần để ngừng dịch vụ mà không xóa dữ liệu |

## 2. Quyết định nghiệp vụ ảnh hưởng đến dữ liệu

| # | Quyết định | Lý do | Rule |
|---|---|---|---|
| 1 | Giữ `price` trong tblDetailServiceOrder dù tblService đã có `price` | Giá thay đổi theo thời gian; lưu giá lúc sử dụng để sửa giá không đổi doanh thu quá khứ | BR06 |
| 2 | Không lưu lại tên dịch vụ ở chi tiết đơn | Chấp nhận hạn chế: đổi tên dịch vụ thì báo cáo quá khứ hiển thị tên mới | , |
| 3 | Xóa mềm dịch vụ đã có lịch sử | Bảo toàn báo cáo quá khứ; FK `serviceID` dùng RESTRICT nên CSDL cũng chặn xóa cứng | BR05 |
| 4 | Mã dịch vụ nhập tay, không tự tăng | Khớp thiết kế gốc; không sửa sau khi tạo để giữ ổn định tham chiếu | BR01 |
| 5 | Doanh thu dịch vụ tính từ chi tiết đơn, doanh thu khách hàng tính từ hóa đơn | Một hóa đơn gồm nhiều dịch vụ nên cần tách theo dịch vụ; khách hàng dùng số tiền thực thu | BR10 |
| 6 | Lọc kỳ theo `paymentDay`, không theo ngày sử dụng | Doanh thu là tiền đã thu, ghi nhận lúc thanh toán | BR09 |
| 7 | tblBill không có `clientID` | Tránh lưu dư; khách hàng suy ra qua tblServiceOrder | , |
| 8 | Tách 4 bảng vai trò (Manager, Receptionist, Grooming, Admin) khỏi `tblUser` (quan hệ 1-1) | Mô hình hóa vai trò bằng kế thừa; các bảng nghiệp vụ chỉ tham chiếu đúng vai trò được phép | BR14 |
| 9 | Dùng TIMESTAMP cho `paymentDay`; lọc kỳ bằng nửa khoảng mở `[bắt đầu, kết thúc + 1)` | Tránh bỏ sót hóa đơn trong ngày cuối kỳ | BR09 |
| 10 | Ràng buộc UNIQUE cho `phone` (tblClient, tblUser), `email`, `username` (tblUser) | Tránh trùng khách hàng/tài khoản | , |
| 11 |	Quan hệ tblServiceOrder - tblBill là 1 - 1, ép bằng UNIQUE trên tblBill.serviceOrderID | Mỗi đơn thanh toán một lần nên doanh thu không bị tính trùng; đồng thời tổng chi tiết dịch vụ khớp số tiền hóa đơn	| BR09, BR10|

## 3. Hạn chế đã biết

- Chưa có giảm giá, phụ thu nên `paymentAmount` luôn bằng tổng `quantity × price` của đơn. Khi có giảm giá, hai cách tính doanh thu (theo dịch vụ, theo khách hàng) cho tổng khác nhau.
- `tblServiceOrder` và `tblBill` đều tham chiếu đến `tblManager`, tức là chỉ Manager được ghi nhận là người lập. Phân tích hệ thống có vai trò Lễ tân (lập hóa đơn) và Chăm sóc (thực hiện dịch vụ) nhưng ERD chưa có bảng riêng cho hai vai trò này. Đây là đơn giản hóa phù hợp phạm vi module Manager; nếu mở rộng cho cả hệ thống cần thêm `tblReceptionist`, `tblGrooming` và tách khóa ngoại.
- Chưa có bảng thông tin spa (tên, địa chỉ, mô tả) dù mô tả nghiệp vụ có nhắc tới; nằm ngoài module này.
