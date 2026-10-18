# Scope

## 1. Bối cảnh dự án

Đây là **bài tập lớn nhóm 6 thành viên** (môn Nhập môn Công nghệ phần mềm, PTIT) xây dựng hệ thống quản lý spa thú cưng nội bộ. 
Repo này là tài liệu hóa cho module Quản lý dịch vụ và Báo cáo thống kê của vai trò Manager.

## 2. Phạm vi theo chức năng hệ thống

| Chức năng hệ thống | Actor | Ghi chú |
|---|---|---|
| Đăng nhập, đổi mật khẩu, đăng xuất | Employee | Đặt giả định đã đăng nhập |
| Quản lý tài khoản người dùng | Admin |  |
| Quản lý thông tin spa | Manager |  |
| Quản lý khách hàng, dịch vụ được yêu cầu, thanh toán | Receptionist | Dữ liệu đầu vào |
| Quản lý công việc, thống kê dịch vụ đã làm | Grooming |  |
| **Thêm dịch vụ** | Manager | Chức năng của module |
| **Sửa dịch vụ** | Manager | Chức năng của module |
| **Xóa / ngừng dịch vụ** | Manager | Chức năng của module |
| **Tìm kiếm và xem danh sách dịch vụ** | Manager | Chức năng của module |
| **Thống kê doanh thu theo dịch vụ** + xem hóa đơn chi tiết | Manager | Chức năng của module |
| **Thống kê doanh thu theo khách hàng** + xem hóa đơn chi tiết | Manager | Chức năng của module |

## 3. Trong phạm vi

- 5 chức năng chính: thêm, sửa, xóa dịch vụ; thống kê theo dịch vụ; thống kê theo khách hàng.
- Tìm kiếm dịch vụ theo mã hoặc tên (phục vụ sửa/xóa).
- Xem danh sách hóa đơn cấu thành từng dòng thống kê.
- Kiểm tra dữ liệu đầu vào và xử lý các tình huống lỗi.

## 4. Ngoài phạm vi (không làm trong phiên bản này)

- Đăng nhập, phân quyền chi tiết, quản lý tài khoản.
- Tạo đơn dịch vụ, lập hóa đơn, thanh toán (do module Lễ tân đảm nhiệm).
- Báo cáo doanh thu theo tuần/tháng/năm, tỉ lệ sử dụng dịch vụ, khách hàng đặt lịch nhiều → ghi nhận ở `07-improvement-proposals/`.
- Xuất báo cáo ra file, biểu đồ.
- Giảm giá, phụ thu, khuyến mãi.

## 5. Ràng buộc

- Giao diện máy tính, dùng nội bộ; cơ sở dữ liệu tập trung (MySQL).
- Dữ liệu hóa đơn đã tồn tại do module khác tạo ra.

## 6. Giả định

- Người dùng đã đăng nhập với vai trò Manager trước khi vào module.
- Đơn dịch vụ và hóa đơn do module nhân viên lễ tân tạo; module này chỉ đọc dữ liệu đó.
- Mỗi hóa đơn gắn với đúng một đơn dịch vụ.
- Giá dịch vụ được lưu cùng chi tiết đơn tại thời điểm sử dụng, nên sửa giá về sau không làm thay đổi doanh thu quá khứ.
- Chưa xét giảm giá, phụ thu, khuyến mãi (xem mục 4 Ngoài phạm vi).
- Dữ liệu dùng để minh họa là dữ liệu mẫu, không phải dữ liệu thật của spa.
