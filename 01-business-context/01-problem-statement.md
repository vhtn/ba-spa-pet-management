# Problem Statement

## 1. Bối cảnh

Spa thú cưng là cơ sở cung cấp các dịch vụ chăm sóc như tắm, cắt tỉa lông, massage cho thú cưng. Spa có nhiều vai trò làm việc song song: quản lý, lễ tân, nhân viên chăm sóc và quản trị hệ thống. Dữ liệu về dịch vụ, khách hàng, đơn dịch vụ và hóa đơn cần được lưu tập trung để các vai trò cùng sử dụng.

*(Giả định: spa hoạt động nội bộ, chỉ nhân viên được truy cập hệ thống, cơ sở dữ liệu đặt tại một máy chủ duy nhất.)*

## 2. Vấn đề của người quản lý

Khi chưa có hệ thống quản lý tập trung, người quản lý spa gặp các khó khăn sau:

| # | Vấn đề | Hậu quả |
|---|---|---|
| 1 | Danh mục dịch vụ và bảng giá ghi rải rác, cập nhật thủ công | Giá không đồng nhất giữa các nhân viên, dễ tính sai tiền |
| 2 | Khó biết dịch vụ nào đang bán tốt, dịch vụ nào ít được dùng | Khó quyết định giữ, điều chỉnh giá hoặc ngừng dịch vụ |
| 3 | Khó biết khách hàng nào mang lại nhiều doanh thu | Không có cơ sở chăm sóc khách hàng quan trọng |
| 4 | Tổng hợp doanh thu theo kỳ phải làm tay từ hóa đơn | Tốn thời gian, dễ sai sót |
| 5 | Dịch vụ không còn phù hợp bị xóa khỏi danh sách | Có nguy cơ mất lịch sử sử dụng, báo cáo quá khứ thiếu chính xác |

*(Các vấn đề trên là mô tả bối cảnh được xác định từ mục đích của hệ thống; chưa qua phỏng vấn người dùng thực tế.)*

## 3. Mục tiêu của module

Module **Quản lý dịch vụ và Báo cáo thống kê** dành cho vai trò Manager nhằm:

| Mục tiêu | Chỉ số đo được |
|---|---|
| Quản lý danh mục dịch vụ chính xác, tập trung | Thêm, sửa, ngừng một dịch vụ qua một luồng thao tác thống nhất |
| Không làm mất dữ liệu lịch sử khi bỏ dịch vụ | Dịch vụ đã có lịch sử sử dụng không bị xóa khỏi CSDL |
| Xem doanh thu theo dịch vụ và theo khách hàng | Có báo cáo cho một kỳ bất kỳ |
| Truy vết từ số liệu tổng hợp về hóa đơn gốc | Từ mỗi dòng thống kê xem được danh sách hóa đơn cấu thành |

## 4. Tiêu chí thành công

- Quản lý hoàn thành thêm/sửa/xóa dịch vụ mà không cần hỗ trợ kỹ thuật.
- Số liệu ở bảng thống kê khớp với tổng các hóa đơn chi tiết.
- Báo cáo chỉ có thể được truy cập bởi người có vai trò Manager.
