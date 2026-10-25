# Stakeholders

## 1. Danh sách stakeholder

| Stakeholder | Vai trò trong hệ thống | Nhu cầu chính | Chức năng sử dụng (toàn hệ thống) |
|---|---|---|---|
| **Quản lý (Manager)** | Người dùng chính của module này | Kiểm soát danh mục dịch vụ, theo dõi hiệu quả kinh doanh | Quản lý thông tin spa, quản lý dịch vụ, xem báo cáo thống kê |
| **Quản trị hệ thống (Admin)** | Người dùng nội bộ | Cấp và quản lý tài khoản, đảm bảo đúng người đúng quyền | Thêm, sửa, xóa tài khoản người dùng |
| **Lễ tân (Receptionist)** | Người dùng nội bộ | Nhận yêu cầu dịch vụ, ghi nhận đơn, thanh toán nhanh và đúng | Quản lý khách hàng, ghi nhận đơn dịch vụ, lập hóa đơn thanh toán |
| **Nhân viên chăm sóc (Grooming)** | Người dùng nội bộ | Biết việc cần làm, cập nhật trạng thái dịch vụ | Xem công việc, thực hiện từng dịch vụ (ghi nhận qua `groomingID` ở chi tiết đơn), cập nhật trạng thái |
| **Chủ spa** *(nếu khác Manager)* | Bên thụ hưởng | Doanh thu tăng, vận hành ổn định | Nhận thông tin từ báo cáo của Manager |
| **Khách hàng** | Không thao tác trực tiếp | Dịch vụ đúng giá, hóa đơn chính xác | Gián tiếp qua lễ tân và nhân viên chăm sóc |

## 2. Mối liên quan với module Quản lý dịch vụ & Báo cáo thống kê

| Stakeholder | Liên quan thế nào | Mức độ |
|---|---|---|
| **Quản lý (Manager)** | Là actor trực tiếp, thực hiện mọi chức năng của module | Rất cao |
| **Lễ tân (Receptionist)** | Chọn dịch vụ từ danh mục Manager quản lý; **tạo hóa đơn là nguồn dữ liệu của báo cáo** | Cao (gián tiếp) |
| **Nhân viên chăm sóc (Grooming)** | Dịch vụ họ thực hiện nằm trong danh mục; có xem thống kê riêng về việc đã làm | Trung bình |
| **Quản trị hệ thống (Admin)** | Cấp tài khoản Manager để truy cập module | Thấp |
| **Khách hàng** | Giá dịch vụ và hóa đơn ảnh hưởng trực tiếp đến họ | Gián tiếp |

## 3. Luồng dữ liệu giữa các vai trò (tóm tắt)

Nhân viên lễ tân ghi nhận đơn dịch vụ và lập hóa đơn → dữ liệu được lưu vào CSDL tập trung → nhân viên quản lý đọc dữ liệu đó để xem báo cáo. Vì vậy, chất lượng báo cáo của nhân viên quản lý phụ thuộc vào việc nhân viên lễ tân nhập dữ liệu đầy đủ và chính xác.
