# Scope

## 1. Bối cảnh dự án

Đây là **bài tập lớn nhóm** (môn Nhập môn Công nghệ phần mềm, PTIT) xây dựng hệ thống
quản lý spa thú cưng nội bộ. Repo này tài liệu hóa hai tầng do tôi thực hiện:

- **Mức toàn hệ thống** (lấy yêu cầu, phân tích, thiết kế): actor, use case, lớp thực thể, ERD.
  Đây là phần nền để nhóm chia module.
- **Mức module**: đặc tả chi tiết module **Quản lý dịch vụ & Báo cáo thống kê** của vai trò Manager.

## 2. Phạm vi theo chức năng hệ thống

| Chức năng hệ thống | Actor | Mức tài liệu hóa trong repo |
|---|---|---|
| Đăng nhập, đổi mật khẩu, đăng xuất | User | Mức hệ thống (use case, dữ liệu) |
| Quản lý tài khoản người dùng | Admin | Mức hệ thống |
| Quản lý khách hàng, đơn dịch vụ, thanh toán | Receptionist | Mức hệ thống (là nguồn dữ liệu đầu vào của báo cáo) |
| Quản lý công việc | Grooming | Mức hệ thống |
| **Thêm dịch vụ** | Manager | **Chi tiết** |
| **Sửa dịch vụ** | Manager | **Chi tiết** |
| **Tìm kiếm và xem danh sách dịch vụ** | Manager | **Chi tiết** (use case phụ trợ) |
| **Thống kê doanh thu theo dịch vụ** + xem hóa đơn chi tiết | Manager | **Chi tiết** |
| **Thống kê doanh thu theo khách hàng** + xem hóa đơn chi tiết | Manager | **Chi tiết** |

## 3. Trong phạm vi

- Toàn hệ thống: mô tả nghiệp vụ, 4 vai trò kế thừa User, 10 use case, lớp thực thể, ERD 10 bảng.
- Module Manager: 5 chức năng chính, tìm kiếm dịch vụ, xem hóa đơn, cấu thành từng dòng thống kê,
  kiểm tra dữ liệu đầu vào và xử lý tình huống lỗi.

## 4. Ngoài phạm vi (không làm trong phiên bản này)

- Đặc tả chi tiết (kịch bản, user story, test case) cho các module Admin, Lễ tân, Chăm sóc, Login.
- Đặt/hủy lịch hẹn; quản lý thông tin spa (tên, địa chỉ, mô tả).
- Báo cáo doanh thu theo tuần/tháng/năm, tỉ lệ sử dụng dịch vụ, khách hàng đặt lịch nhiều
  (xem `07-improvement-proposals/`).
- Xuất báo cáo ra file, biểu đồ.
- Giảm giá, phụ thu, khuyến mãi; thanh toán nhiều lần cho một đơn.

## 5. Ràng buộc

- Giao diện máy tính, dùng nội bộ; cơ sở dữ liệu tập trung (MySQL).
- Dữ liệu đơn và hóa đơn do module Lễ tân tạo ra; module Manager chỉ đọc.

## 6. Giả định

- Người dùng đã đăng nhập với vai trò Manager trước khi vào module.
- Mỗi đơn dịch vụ có tối đa một hóa đơn (quan hệ 1-1).
- Giá dịch vụ được lưu cùng chi tiết đơn tại thời điểm sử dụng, nên sửa giá về sau
  không làm thay đổi doanh thu quá khứ.
- Vai trò người dùng được xác định bằng 4 bảng vai trò (Manager, Receptionist, Grooming, Admin).
- Chưa xét giảm giá, phụ thu, khuyến mãi.
- Dữ liệu minh họa là dữ liệu mẫu, không phải dữ liệu thật của spa.
