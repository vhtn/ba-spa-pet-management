# UAT: Báo cáo thống kê

**Dữ liệu chuẩn:** 2 hóa đơn trong kỳ 01/09/2025 - 30/09/2025.

| Hóa đơn | Ngày thanh toán | Số tiền | Hình thức | Đơn | Khách hàng |
|---|---|---|---|---|---|
| 01 | 01/09/2025 | 300.000 | Tiền mặt | 01 (2 × Tắm cơ bản) | Nguyễn Văn A |
| 02 | 03/09/2025 | 350.000 | Chuyển khoản | 02 (1 × Tắm cơ bản, 1 × Tắm massage) | Lò Thị B |

Trạng thái mọi TC: Designed. Mọi TC ở file này **không làm thay đổi CSDL**.

## 1. Thống kê doanh thu theo dịch vụ (UC03)

| Mã | Mô tả | Dữ liệu vào | Kết quả mong đợi | US / BR |
|---|---|---|---|---|
| TC-SVR-01 | Kỳ hợp lệ, có dữ liệu | Thống kê dịch vụ → 01/09/2025 - 30/09/2025 → Áp dụng → Chi tiết "Tắm cơ bản" → Quay lại → Quay lại | Bảng: **Tắm cơ bản, SL 3, 450.000; Tắm massage, SL 1, 200.000** (giảm dần). Chi tiết: hóa đơn 1 (01/09, SL 2, 300.000, tiền mặt), hóa đơn 2 (03/09, SL 1, 150.000, chuyển khoản); tổng 450.000 khớp. Quay lại về bảng thống kê, rồi về trang chủ | US04, US05 / BR08, BR09, BR11, BR12 |
| TC-SVR-02 | Kỳ hợp lệ, không có dữ liệu | 01/11/2025 - 30/11/2025 → Áp dụng | "Không có dữ liệu thống kê" | US04 / BR15 |
| TC-SVR-03 | Ngày không tồn tại | 01/02/2025 - 31/02/2025 → Áp dụng | "Ngày tháng không hợp lệ" + OK; OK quay lại giao diện thống kê | US08 / BR10 |
| TC-SVR-04 | Sai định dạng | Bắt đầu "1 tháng 9 năm 2025", kết thúc 30/09/2025 → Áp dụng | "Ngày tháng không hợp lệ" + OK | US08 / BR10 |
| TC-SVR-05 | Để trống ngày bắt đầu | Bắt đầu trống, kết thúc 30/09/2025 → Áp dụng | "Điền đầy đủ thông tin" + OK | US08 / BR10 |
| TC-SVR-06 | Ngày bắt đầu lớn hơn kết thúc | Bắt đầu 31/10/2025, kết thúc 30/09/2025 → Áp dụng | "Khoảng thời gian không hợp lệ" + OK | US08 / BR10 |
| TC-SVR-07 | **Hóa đơn cuối ngày cuối kỳ** | Tiền điều kiện: thêm hóa đơn 03, thanh toán **30/09/2025 23:30**, cho đơn có dịch vụ Tắm cơ bản (xem lưu ý). Kỳ 01/09 - 30/09/2025 | Hóa đơn 03 **vẫn được tính** trong kỳ, không bị bỏ sót | US04 / BR08 |
| TC-SVR-08 | Hóa đơn ngoài kỳ không được tính | Kỳ 01/09/2025 - 02/09/2025 | Chỉ hóa đơn 01: Tắm cơ bản SL 2, 300.000; không có Tắm massage | US04 / BR08 |

## 2. Thống kê doanh thu theo khách hàng (UC04)

| Mã | Mô tả | Dữ liệu vào | Kết quả mong đợi | US / BR |
|---|---|---|---|---|
| TC-CLR-01 | Kỳ hợp lệ, có dữ liệu | Thống kê khách hàng → 01/09/2025 - 30/09/2025 → Áp dụng → Chi tiết "Nguyễn Văn A" → Quay lại → Quay lại | Bảng: **Lò Thị B 350.000; Nguyễn Văn A 300.000** (giảm dần). Chi tiết A: hóa đơn 1, 01/09/2025, 300.000, tiền mặt; tổng khớp 300.000 | US06, US07 / BR08, BR09, BR11, BR12 |
| TC-CLR-02 | Không có dữ liệu | 01/11/2025 - 30/11/2025 | "Không có dữ liệu thống kê" | US06 / BR15 |
| TC-CLR-03 | Ngày không tồn tại | 01/02/2025 - 31/02/2025 | "Ngày tháng không hợp lệ" | US08 / BR10 |
| TC-CLR-04 | Sai định dạng | Bắt đầu "1 tháng 9 năm 2025", kết thúc 30/09/2025 | "Ngày tháng không hợp lệ" | US08 / BR10 |
| TC-CLR-05 | Để trống ngày bắt đầu | Bắt đầu trống, kết thúc 30/09/2025 (**ở màn thống kê khách hàng**) | "Điền đầy đủ thông tin" | US08 / BR10 |
| TC-CLR-06 | Bắt đầu lớn hơn kết thúc | 31/10/2025 - 30/09/2025 | "Khoảng thời gian không hợp lệ" | US08 / BR10 |
| TC-CLR-07 | Hóa đơn cuối ngày cuối kỳ | Như TC-SVR-07 với hóa đơn 03 của Lò Thị B | Doanh thu Lò Thị B = 350.000 + 150.000 = **500.000** | US06 / BR08 |
