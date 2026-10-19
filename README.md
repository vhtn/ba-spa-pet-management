# ba-spa-pet-management
# 01 - Business Context

Bối cảnh nghiệp vụ và phạm vi của module Quản lý dịch vụ & Báo cáo thống kê.

| File | Nội dung |
|---|---|
| [01-problem-statement.md](01-problem-statement.md) | Vấn đề của người quản lý, mục tiêu, tiêu chí thành công |
| [02-stakeholders.md](02-stakeholders.md) | Các bên liên quan và mức độ liên quan đến module |
| [03-scope.md](03-scope.md) | Phạm vi trong/ngoài của module trong hệ thống nhóm |

# 02 - Requirements

| File | Nội dung |
|---|---|
| [01-business-rules.md](01-business-rules.md) | 16 quy tắc nghiệp vụ kèm lý do |
| [02-user-stories.md](02-user-stories.md) | 10 user story có acceptance criteria |
| [03-non-functional-requirements.md](03-non-functional-requirements.md) | Yêu cầu phi chức năng |
| [04-glossary.md](04-glossary.md) | Thuật ngữ dùng trong dự án |
| [05-traceability-matrix.md](05-traceability-matrix.md) | Ma trận truy vết BR - US - UC - TC (làm ở Bước 8) |

# 03 - Use Cases

Mô hình use case của hệ thống spa thú cưng và đặc tả chi tiết các use case thuộc module Quản lý dịch vụ & Báo cáo thống kê (vai trò Manager).

## Sơ đồ

**Tổng quan toàn hệ thống** (hai use case Manage service và View report là phạm vi của tôi):

![Use case tổng quan](system-use-case-overview.svg)

| Sơ đồ chi tiết | Ảnh |
|---|---|
| Quản lý dịch vụ | [uc-manage-service.png](uc-manage-service.png) |
| Xem báo cáo | [uc-view-report.png](uc-view-report.png) |

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

# 05 - Data

Mô hình dữ liệu của hệ thống spa thú cưng (7 bảng) và dữ liệu mẫu dùng cho kiểm thử.

| File | Nội dung |
|---|---|
| [ERD.png](ERD.png) | Sơ đồ ERD |
| [data-dictionary.md](data-dictionary.md) | Mô tả bảng, trường, ràng buộc, đường nối dữ liệu báo cáo |
| [design-decisions.md](design-decisions.md) | Quyết định thiết kế dữ liệu và lý do |
| [schema.sql](schema.sql) | Lệnh tạo bảng dữ liệu |
| [sample-data.sql](sample-data.sql) | Dữ liệu mẫu giả, nguồn số liệu cho mọi kịch bản |
| [report-queries.sql](report-queries.sql) | Truy vấn kiểm chứng số liệu thống kê |

**Chạy thử:** `schema.sql` → `sample-data.sql` → `report-queries.sql`.
