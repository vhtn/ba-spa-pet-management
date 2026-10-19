# 03 - Use Cases

Mô hình use case của hệ thống spa thú cưng và đặc tả chi tiết các use case thuộc module Quản lý dịch vụ & Báo cáo thống kê (vai trò Manager).

## Sơ đồ

**Tổng quan toàn hệ thống** (hai use case Manage service và View report là phạm vi của tôi):

![Use case tổng quan](system-use-case-overview.svg)

Actor "User" là tổng quát hoá 4 vai trò (Admin, Manager, Receptionist, Grooming);
Login là use case dùng chung, Change password và Logout mở rộng Login.

| Sơ đồ chi tiết | Ảnh |
|---|---|
| Quản lý dịch vụ | [uc-manage-service.svg](uc-manage-service.svg) |
| Xem báo cáo | [uc-view-report.svg](uc-view-report.svg) |

## Đặc tả use case

| Mã | Use case | Actor | User story | Business rules |
|---|---|---|---|---|
| [UC01](UC01-add-service.md) | Thêm dịch vụ | Manager | US01 | BR01-BR04 |
| [UC02](UC02-update-service.md) | Sửa thông tin dịch vụ | Manager | US02, US04 | BR01-BR04, BR06-BR08 |
| [UC03](UC03-delete-service.md) | Xóa / ngừng dịch vụ | Manager | US03, US04 | BR05, BR08 |
| [UC04](UC04-view-service-report.md) | Thống kê doanh thu theo dịch vụ | Manager | US05, US06, US09 | BR09-BR13 |
| [UC05](UC05-view-client-report.md) | Thống kê doanh thu theo khách hàng | Manager | US07, US08, US09 | BR09-BR13 |

Các use case Search service và View list service (có trong sơ đồ chi tiết) được mô tả như các bước tìm kiếm trong UC02 và UC03, nên không có file riêng. US10 (giới hạn truy cập) áp dụng cho cả 5 use case thông qua tiền điều kiện.

## Quy ước
- Số liệu lấy từ bộ dữ liệu mẫu ở [05-data](../05-data/sample-data.sql).
- Ngày hiển thị dd/mm/yyyy; tiền tính bằng VNĐ.
