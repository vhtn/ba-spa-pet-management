# Non-Functional Requirements

| Mã | Loại | Yêu cầu | Cách kiểm tra |
|---|---|---|---|
| NFR01 | Bảo mật | Chỉ vai trò Manager truy cập module (BR14) | Đăng nhập bằng vai trò khác, xác nhận không thấy chức năng |
| NFR02 | Hiệu năng | Báo cáo thống kê hiển thị trong **3 giây** với dữ liệu mẫu | Đo thời gian khi chạy dữ liệu mẫu |
| NFR03 | Toàn vẹn dữ liệu | Không xóa cứng dịch vụ đã có lịch sử (BR05); khóa ngoại luôn hợp lệ | Thử xóa dịch vụ đã dùng, kiểm tra CSDL |
| NFR04 | Tính nhất quán | Tổng chi tiết hóa đơn khớp doanh thu thống kê (BR13) | So sánh số liệu trong kịch bản UAT |
| NFR05 | Khả dụng | Thông báo lỗi nêu rõ nguyên nhân bằng tiếng Việt; sau lỗi giữ lại dữ liệu đã nhập | Kiểm tra các TC báo lỗi |
| NFR06 | Khả năng truy vết | Có log ghi lại người, thời điểm, giá trị cũ/mới khi sửa giá hoặc đổi trạng thái dịch vụ | *(Đề xuất, chưa trong phạm vi triển khai)* |
| NFR07 | Tương thích | Giao diện chạy trên máy tính nội bộ, kết nối CSDL MySQL tập trung | Kiểm tra môi trường triển khai |
