# Pet Spa Management: Service & Report Module
### Phân tích yêu cầu cho module Quản lý dịch vụ và Báo cáo thống kê của hệ thống spa thú cưng nội bộ

| | |
|---|---|
| **Loại project** | Requirements specification (bài tập lớn nhóm, PTIT) |
| **Vai trò** | Business Analyst, phụ trách module Manager trong nhóm 6 người |
| **Thời gian** | [tháng/năm - tháng/năm] |
| **Công cụ** | [Visual Paradigm / draw.io], MySQL, Markdown, [Figma/draw.io] |

---

## 1. Bối cảnh và vấn đề

Spa thú cưng nội bộ có nhiều vai trò làm việc song song (quản lý, lễ tân, nhân viên chăm sóc,
quản trị hệ thống). Khi chưa có hệ thống tập trung, người quản lý khó kiểm soát danh mục dịch vụ
và bảng giá, khó biết dịch vụ hay khách hàng nào mang lại doanh thu, và phải tổng hợp doanh thu
thủ công từ hóa đơn.

*(Bối cảnh là giả định từ mục đích hệ thống, chưa qua phỏng vấn người dùng thực tế.)*

**Mục tiêu của module:**
- Quản lý danh mục dịch vụ (thêm, sửa, ngừng) mà không làm mất lịch sử doanh thu.
- Xem doanh thu theo dịch vụ và theo khách hàng trong một kỳ bất kỳ, truy vết được về hóa đơn gốc.

## 2. Bối cảnh hệ thống

Đây là **bài tập lớn nhóm 6 thành viên** xây dựng hệ thống quản lý spa với 5 vai trò (User tổng
quát hóa Admin, Manager, Receptionist, Grooming). Tôi phụ trách **module Quản lý dịch vụ và Báo
cáo thống kê** của vai trò Manager. Dữ liệu module đọc (đơn, hóa đơn) do module Lễ tân tạo ra.

<!-- ![Use case tổng quan](03-use-cases/system-use-case-overview.png) -->
*Hai use case Manage service và View report (tô nổi bật) là phạm vi của tôi.*

## 3. Đóng góp của tôi

- Phân tích yêu cầu, xác định stakeholder và phạm vi module
- Viết **16 business rules** và **10 user stories** kèm acceptance criteria (MoSCoW)
- Đặc tả **5 use case** với luồng chính và luồng ngoại lệ
- Rà soát mô hình dữ liệu **10 bảng**, viết data dictionary, schema và dữ liệu mẫu chạy được trên MySQL
- Thiết kế **42 kịch bản UAT** và lập ma trận truy vết BR - US - UC - TC (16/16 rule và 10/10 story có test)
- Đề xuất **10 hướng cải tiến** cho phiên bản sau
- Phát hiện và thống nhất các mâu thuẫn giữa kịch bản, test case và sơ đồ (xem mục 5)

## 4. Phạm vi

| Trong phạm vi | Ngoài phạm vi |
|---|---|
| Thêm / sửa / xóa (ngừng) dịch vụ | Đăng nhập, quản lý tài khoản |
| Tìm kiếm dịch vụ | Tạo đơn, lập hóa đơn, thanh toán |
| Thống kê doanh thu theo dịch vụ | Đặt/hủy lịch hẹn, thông tin spa |
| Thống kê doanh thu theo khách hàng | Giảm giá, phụ thu, xuất báo cáo |

## 5. Các quyết định phân tích đáng chú ý

| Quyết định | Lý do |
|---|---|
| **Xóa mềm** dịch vụ đã có lịch sử (chuyển "Ngừng hoạt động") | Bảo toàn báo cáo quá khứ; CSDL cũng chặn xóa cứng bằng khóa ngoại (BR05) |
| **Giá chụp lại** trong chi tiết đơn tại thời điểm sử dụng | Sửa giá không làm đổi doanh thu quá khứ (BR06) |
| Doanh thu dịch vụ = Σ(số lượng × giá); doanh thu khách hàng = Σ tiền hóa đơn | Một hóa đơn gồm nhiều dịch vụ nên cần tách; khách hàng dùng tiền thực thu (BR10) |
| Cột chi tiết hóa đơn đổi thành **"Thành tiền dịch vụ"** | Tổng chi tiết khớp doanh thu ở bảng thống kê, đối chiếu được (BR13) |
| Lọc kỳ theo ngày thanh toán, dạng nửa khoảng `[bắt đầu, kết thúc + 1)` | `paymentDay` là timestamp; `BETWEEN` sẽ bỏ sót hóa đơn cuối ngày cuối kỳ (BR09) |

**Mâu thuẫn đã phát hiện và xử lý khi viết lại tài liệu nhóm:** số liệu tiền không khớp giữa kịch bản và bảng; test case xóa tên "hủy" nhưng thao tác "xác nhận"; test báo cáo có dữ liệu nhưng mong đợi "không có dữ liệu"; lỗi tên phương thức trong sơ đồ; ERD thiếu vai trò, v.v.

## 6. Mục lục tài liệu

| Thư mục | Nội dung |
|---|---|
| [01-business-context](01-business-context/) | Vấn đề, stakeholder, phạm vi, giả định |
| [02-requirements](02-requirements/) | Business rules, user stories, NFR, glossary, ma trận truy vết |
| [03-use-cases](03-use-cases/) | Sơ đồ và đặc tả 5 use case |
| [04-wireframes](04-wireframes/) | Thiết kế giao diện *(đang bổ sung ảnh)* |
| [05-data](05-data/) | ERD, data dictionary, schema, dữ liệu mẫu, truy vấn kiểm chứng |
| [06-uat-scenarios](06-uat-scenarios/) | 42 kịch bản kiểm thử nghiệm thu |
| [appendix-technical](appendix-technical/) | Sơ đồ lớp, tuần tự, ghi chú thiết kế (phụ lục) |

**Chạy thử số liệu:** chạy `05-data/schema.sql` → `sample-data.sql` → `report-queries.sql`; kết quả khớp các con số trong use case và UAT (450.000 / 200.000 theo dịch vụ, 350.000 / 300.000 theo khách hàng).

## 7. Bài học rút ra

- Viết test case cho dữ liệu ràng buộc làm lộ ra quyết định nghiệp vụ còn bỏ ngỏ (xóa cứng hay xóa mềm),
  nên cần chốt quy tắc trước khi viết giao diện.
- Số liệu ở kịch bản, test case và báo cáo phải đối chiếu với **một bộ dữ liệu chuẩn duy nhất**.
- Kiểu `timestamp` làm lộ lỗi kinh điển khi lọc theo khoảng ngày, nên đã có test riêng cho biên ngày cuối kỳ.
- Nếu làm lại: [phỏng vấn người dùng thật, làm prototype bấm được, chạy UAT thực tế].

## 8. Liên hệ

VŨ THỊ HẢI THANH · 0968226005 · vhthanh2308@gmail.com
