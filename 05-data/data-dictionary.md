# Data Dictionary

Sơ đồ ERD: [ERD.svg](ERD.svg) · Quyết định thiết kế dữ liệu: [design-decisions.md](design-decisions.md)

CSDL MySQL gồm 10 bảng. Module Quản lý dịch vụ & Báo cáo thống kê **ghi** vào`tblService`, **chỉ đọc** các bảng còn lại.

| Bảng | Quyền của module | Ghi chú |
|---|---|---|
| tblService | Đọc/Ghi (thêm, sửa) | Dữ liệu của module này |
| tblDetailServiceOrder | Chỉ đọc | Nguồn tính doanh thu theo dịch vụ |
| tblServiceOrder | Chỉ đọc | Nối dịch vụ, hóa đơn, khách hàng |
| tblBill | Chỉ đọc |  |
| tblClient | Chỉ đọc | Thông tin khách hàng trong báo cáo |
| tblManager | Chỉ đọc | Xác định người có vai trò Manager |
| tblReceptionist | Chỉ đọc | Xác định người có vai trò Receptionist |
| tblGrooming | Chỉ đọc | Xác định người có vai trò Grooming |
| tblAdmin | Chỉ đọc | Xác định người có vai trò Admin |
| tblUser | Không dùng trực tiếp | Thông tin tài khoản |

## tblService
| Trường | Kiểu | Ràng buộc | Mô tả |
|---|---|---|---|
| id | INT | PK, không tự tăng | Mã dịch vụ, người dùng nhập, hiển thị 3 chữ số (BR01) |
| name | VARCHAR(255) | NOT NULL | Tên dịch vụ |
| unit | VARCHAR(255) | NOT NULL | Đơn vị, ví dụ "0-5 kg" |
| price | DECIMAL(18,2) | NOT NULL, > 0 | Đơn giá hiện hành, VNĐ (BR03) |
| description | VARCHAR(255) | NULL | Mô tả (tùy chọn) |
| status | VARCHAR(255) | NOT NULL, mặc định "Đang hoạt động" | "Đang hoạt động" hoặc "Ngừng hoạt động" (BR06) |

## tblDetailServiceOrder
| Trường | Kiểu | Ràng buộc | Mô tả |
|---|---|---|---|
| id | INT | PK, tự tăng | Mã dòng chi tiết |
| quantity | INT | NOT NULL, > 0 | Số lượng |
| status | VARCHAR(255) | NOT NULL | Trạng thái thực hiện (ví dụ "Hoàn thành") |
| price | DECIMAL(18,2) | NOT NULL, > 0 | **Giá tại thời điểm sử dụng** (BR05) |
| note | VARCHAR(255) | NULL | Ghi chú |
| serviceOrderID | INT | FK → tblServiceOrder.id | Thuộc đơn nào |
| serviceID | INT | FK → tblService.id (RESTRICT) | Dịch vụ nào |
| groomingID | INT | FK → tblGrooming.userID | Nhân viên chăm sóc thực hiện dòng dịch vụ này|

## tblServiceOrder
| Trường | Kiểu | Ràng buộc | Mô tả |
|---|---|---|---|
| id | INT | PK, tự tăng | Mã đơn |
| date | TIMESTAMP | NOT NULL | Thời điểm sử dụng dịch vụ |
| note | VARCHAR(255) | NULL | Ghi chú |
| receptionistID | INT | FK → tblReceptionist.userID | Lễ tân phụ trách đơn |
| clientID | INT | FK → tblClient.id | Khách hàng của đơn |

## tblBill
| Trường | Kiểu | Ràng buộc | Mô tả |
|---|---|---|---|
| id | INT | PK, tự tăng | Mã hóa đơn |
| paymentDay | TIMESTAMP | NOT NULL | Thời điểm thanh toán; **dùng để lọc kỳ thống kê** (BR08). Lọc bằng `>= ngày bắt đầu` và `< ngày kết thúc + 1 ngày` |
| paymentAmount | DECIMAL(18,2) | NOT NULL, > 0 | Số tiền thực thu, VNĐ |
| paymentType | VARCHAR(255) | NOT NULL | "Tiền mặt", "Chuyển khoản", "Thẻ tín dụng" |
| note | VARCHAR(255) | NULL | Ghi chú |
| receptionistID | INT | FK → tblReceptionist.userID | Lễ tân lập hóa đơn |
| serviceOrderID | INT | FK → tblServiceOrder.id | Hóa đơn của đơn nào |

## tblClient
| Trường | Kiểu | Ràng buộc | Mô tả |
|---|---|---|---|
| id | INT | PK, tự tăng | Mã khách hàng |
| name | VARCHAR(255) | NOT NULL | Họ tên |
| phone | VARCHAR(10) | NOT NULL, UNIQUE | Số điện thoại |
| address | VARCHAR(255) | NOT NULL | Địa chỉ |
| note | VARCHAR(255) | NULL | Ghi chú |

## tblManager
| Trường | Kiểu | Ràng buộc | Mô tả |
|---|---|---|---|
| userID | INT | PK + FK → tblUser.id | Manager là một User (quan hệ 1-1, kế thừa) |

## tblReceptionist
| Trường | Kiểu | Ràng buộc | Mô tả |
|---|---|---|---|
| userID | INT | PK + FK → tblUser.id | Receptionist là một User (quan hệ 1-1, kế thừa) |

## tblGroomin
| Trường | Kiểu | Ràng buộc | Mô tả |
|---|---|---|---|
| userID | INT | PK + FK → tblUser.id | Grooming là một User (quan hệ 1-1, kế thừa) |

## tblAdmin
| Trường | Kiểu | Ràng buộc | Mô tả |
|---|---|---|---|
| userID | INT | PK + FK → tblUser.id | Admin là một User (quan hệ 1-1, kế thừa) |

## tblUser
| Trường | Kiểu | Ràng buộc | Mô tả |
|---|---|---|---|
| id | INT | PK, tự tăng | Mã người dùng |
| username | VARCHAR(255) | NOT NULL, UNIQUE | Tên đăng nhập |
| password | VARCHAR(255) | NOT NULL | Mật khẩu **dạng băm** |
| fullName | VARCHAR(255) | NOT NULL | Họ tên |
| birthday | DATE | NOT NULL | Ngày sinh |
| address | VARCHAR(255) | NOT NULL | Địa chỉ |
| phone | VARCHAR(10) | NOT NULL, UNIQUE | Số điện thoại |
| email | VARCHAR(255) | NOT NULL, UNIQUE | Email |
| description | VARCHAR(255) | NULL | Mô tả |

## Quan hệ giữa các bảng
tblDetailServiceOrder - tblServiceOrder là n - 1 
tblDetailServiceOrder - tblService là n - 1 
tblServiceOrder - tblClient là n - 1 
tblServiceOrder - tblReceptionít là n - 1 
tblBill - tblServiceOrder là 1 - 1 
tblBill - tblReceptionist là n - 1 
tblManager, tblReceptionist, tblGrooming, tblAdmin kế thừa từ tblUser 

## Đường nối dữ liệu dùng cho báo cáo
- **Theo dịch vụ:** tblService ← tblDetailServiceOrder → tblServiceOrder ← tblBill
- **Theo khách hàng:** tblClient ← tblServiceOrder ← tblBill (tblBill **không có** `clientID`; khách hàng của hóa đơn lấy qua tblServiceOrder)
