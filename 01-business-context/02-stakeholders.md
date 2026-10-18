# Stakeholders

## 1. Danh sách stakeholder

| Stakeholder | Vai trò trong hệ thống | Nhu cầu chính | Chức năng sử dụng (toàn hệ thống) |
|---|---|---|---|
| **Quản lý (Manager)** | Người dùng chính của module này | Kiểm soát danh mục dịch vụ, theo dõi hiệu quả kinh doanh | Quản lý thông tin spa, quản lý dịch vụ, xem báo cáo thống kê |
| **Quản trị hệ thống (Admin)** | Người dùng nội bộ | Cấp và quản lý tài khoản, đảm bảo đúng người đúng quyền | Thêm, sửa, xóa tài khoản người dùng |
| **Lễ tân (Receptionist)** | Người dùng nội bộ | Nhận lịch hẹn, ghi nhận dịch vụ khách yêu cầu, thanh toán nhanh và đúng | Đặt/hủy lịch, quản lý khách hàng, quản lý dịch vụ được yêu cầu, thanh toán |
| **Nhân viên chăm sóc (Grooming)** | Người dùng nội bộ | Biết việc cần làm, cập nhật trạng thái dịch vụ | Xem lịch được phân công, cập nhật trạng thái, thêm/hủy dịch vụ tại chỗ, xem thống kê dịch vụ đã làm |
| **Chủ spa** *(nếu khác Manager)* | Bên thụ hưởng | Doanh thu tăng, vận hành ổn định | Nhận thông tin từ báo cáo của Manager |
| **Khách hàng** | Không thao tác trực tiếp | Dịch vụ đúng giá, hóa đơn chính xác | Gián tiếp qua lễ tân và nhân viên chăm sóc |

## 2. Mối liên quan với module Quản lý dịch vụ & Báo cáo thống kê

| Stakeholder | Liên quan thế nào | Mức độ |
|---|---|---|
| Manager | Là actor trực tiếp, thực hiện mọi chức năng của module | Rất cao |
| Lễ tân | Chọn dịch vụ từ danh mục Manager quản lý; **tạo hóa đơn là nguồn dữ liệu của báo cáo** | Cao (gián tiếp) |
| Nhân viên chăm sóc | Dịch vụ họ thực hiện nằm trong danh mục; có xem thống kê riêng về việc đã làm | Trung bình |
| Admin | Cấp tài khoản Manager để truy cập module | Thấp |
| Khách hàng | Giá dịch vụ và hóa đơn ảnh hưởng trực tiếp đến họ | Gián tiếp |

## 3. Luồng dữ liệu giữa các vai trò (tóm tắt)

Lễ tân ghi nhận đơn dịch vụ và lập hóa đơn → dữ liệu lưu vào CSDL tập trung → Manager đọc dữ liệu đó để xem báo cáo. Vì vậy chất lượng báo cáo của Manager phụ thuộc vào việc Lễ tân nhập dữ liệu đầy đủ và đúng.
