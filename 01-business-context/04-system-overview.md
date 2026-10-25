# System Overview

Tài liệu mức hệ thống do tôi thực hiện ở ba pha: lấy yêu cầu, phân tích, thiết kế.

## 1. Mục đích và phạm vi

Trang web quản lý spa thú cưng nội bộ nhằm hỗ trợ quản lý, kiểm soát và tối ưu hoạt động kinh
doanh. Chỉ nhân viên có thẩm quyền được dùng; hệ thống chạy trên nhiều máy của nhân viên,
cơ sở dữ liệu tập trung tại một máy chủ.

## 2. Actor và use case

`User` là actor tổng quát hóa của 4 vai trò: Admin, Manager, Receptionist, Grooming.

| Actor | Chức năng chính | Use case |
|---|---|---|
| User | Đăng nhập, đổi mật khẩu, đăng xuất | Login, Change password, Logout |
| Admin | Quản lý tài khoản người dùng | Manage user |
| Manager | Quản lý dịch vụ, xem báo cáo thống kê | Manage service, view report |
| Receptionist | Quản lý khách hàng, đơn dịch vụ, thanh toán | Manage customer, Manage service order, Process payment |
| Grooming | Quản lý công việc | Manage work |

Tổng cộng **10 use case** ở mức hệ thống.

## 3. Đối tượng dữ liệu chính

Dịch vụ, khách hàng, người dùng (4 vai trò), đơn dịch vụ, chi tiết đơn dịch vụ, hóa đơn.
Chi tiết xem [05-data](../05-data/data-dictionary.md).

## 4. Luồng dữ liệu

Lễ tân ghi nhận đơn dịch vụ cho khách → nhân viên chăm sóc thực hiện từng dịch vụ → lễ tân lập hóa đơn khi thanh toán → Manager xem báo cáo doanh thu theo dịch vụ, theo khách hàng.

## 5. Sơ đồ và mô hình

- Use case tổng quan: [03-use-cases](../03-use-cases/)
- Lớp thực thể: [appendix-technical](../appendix-technical/)
- ERD 10 bảng: [05-data](../05-data/)

## 6. Phân rã module

Sau khi hoàn tất mô hình mức hệ thống, nhóm chia module theo vai trò. Tài liệu chi tiết trong repo này là module Manager: Quản lý dịch vụ & Báo cáo thống kê.
