# 03 - Use Cases

Mô hình use case của hệ thống spa thú cưng (mức hệ thống) và đặc tả chi tiết các use case của
module Quản lý dịch vụ & Báo cáo thống kê (vai trò Manager).

## Sơ đồ

**Tổng quan toàn hệ thống** (hai use case Manage service và View report được tô nổi bật):

[Use case tổng quan](system-use-case-overview.svg)

Actor `User` là tổng quát hóa của 4 vai trò (Admin, Manager, Receptionist, Grooming);
Login là use case dùng chung; Change password và Logout mở rộng Login.

**Sơ đồ chi tiết** phân rã hai use case của Manager:

| Sơ đồ | Ảnh |
|---|---|
| Quản lý dịch vụ | [uc-manage-service.png](uc-manage-service.svg) |
| Xem báo cáo | [uc-view-report.png](uc-view-report.svg) |

> Sơ đồ chi tiết được vẽ ở giai đoạn trước, còn hiển thị bước đăng nhập (`Manager login`)
> và actor `Employee`. Sơ đồ tổng quan là bản cập nhật gọn hơn. Phần phân rã nghiệp vụ
> (thêm/sửa, thống kê) giống nhau ở cả hai.

## Đặc tả use case

| Mã | Use case | Actor | User story | Business rules |
|---|---|---|---|---|
| [UC01](UC01-add-service.md) | Thêm dịch vụ | Manager | US01 | BR01-BR04 |
| [UC02](UC02-update-service.md) | Sửa thông tin dịch vụ | Manager | US02, US03 | BR01-BR07 |
| [UC03](UC03-view-service-report.md) | Thống kê doanh thu theo dịch vụ | Manager | US04, US05, US08 | BR08-BR12 |
| [UC04](UC04-view-client-report.md) | Thống kê doanh thu theo khách hàng | Manager | US06, US07, US08 | BR08-BR12 |

Search service và View list service được mô tả như các bước tìm kiếm trong UC02.
US09 (giới hạn truy cập) áp dụng cho cả 4 use case thông qua tiền điều kiện.
Các use case của Admin, Lễ tân, Chăm sóc ở mức tổng quan, xem [system overview](../01-business-context/04-system-overview.md).

## Quy ước
- Số liệu lấy từ [bộ dữ liệu mẫu](../05-data/sample-data.sql).
- Ngày hiển thị dd/mm/yyyy; tiền tính bằng VNĐ.
