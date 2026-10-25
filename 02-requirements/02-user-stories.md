# User Stories

Tất cả story có actor là **Manager**. Ưu tiên theo MoSCoW.

| Mã | Tên | UC | BR liên quan |
|---|---|---|---|
| US01 | Thêm dịch vụ | UC01 | BR01-BR04 |
| US02 | Sửa dịch vụ | UC02 | BR01-BR04, BR05, BR06 |
| US03 | Tìm kiếm dịch vụ | UC02 | BR07, BR15 |
| US04 | Thống kê doanh thu theo dịch vụ | UC03 | BR05, BR08, BR09, BR11, BR15 |
| US05 | Xem hóa đơn chi tiết của một dịch vụ | UC03 | BR12 |
| US06 | Thống kê doanh thu theo khách hàng | UC04 | BR08, BR09, BR11, BR15 |
| US07 | Xem hóa đơn chi tiết của một khách hàng | UC04 | BR12 |
| US08 | Kiểm tra khoảng thời gian thống kê | UC03, UC04 | BR10 |
| US09 | Giới hạn truy cập cho Manager | UC01-UC04 | BR13 |

---

### US01: Thêm dịch vụ
Là người quản lý, tôi muốn thêm một dịch vụ mới vào danh mục để nhân viên có thể chọn dịch vụ đó khi ghi nhận đơn cho khách.

**Acceptance criteria**
- Given tôi ở màn hình thêm dịch vụ, When nhập mã 010, tên "Cắt cơ bản", đơn vị "0-5 kg",
  giá 200.000, trạng thái "Đang hoạt động" và bấm Lưu, Then hiển thị "Thêm dịch vụ mới
  thành công"; bấm OK thì về trang chủ Manager và dịch vụ có trong danh mục.
- Given tôi để trống trường bắt buộc, When bấm Lưu, Then hiển thị "Điền đầy đủ thông tin" và không lưu.
- Given giá là số âm, bằng 0 hoặc chứa chữ, When bấm Lưu, Then hiển thị "Dữ liệu không hợp lệ".
- Given mã đã tồn tại, When bấm Lưu, Then hiển thị "Dịch vụ đã tồn tại"; sau khi bấm OK vẫn giữ các thông tin đã nhập.
- Given tôi bấm Hủy, Then về màn hình quản lý dịch vụ, không lưu gì.

### US02: Sửa dịch vụ
Là người quản lý, tôi muốn sửa thông tin dịch vụ để bảng giá và mô tả luôn đúng với thực tế.

**Acceptance criteria**
- Given tôi đã chọn một dịch vụ từ kết quả tìm kiếm, Then form sửa hiện sẵn thông tin
  hiện tại; mã bị khóa, không sửa được.
- Given tôi đổi giá từ 150.000 thành 200.000 và bấm Lưu, Then hiển thị "Cập nhật dịch vụ
  thành công"; bấm OK về trang chủ Manager; **doanh thu của các đơn đã tạo trước đó
  không thay đổi**.
- Given tôi xóa trống tên hoặc nhập giá không hợp lệ, When bấm Lưu, Then hiển thị
  thông báo tương ứng và giữ nguyên dữ liệu đã nhập.
- Given tôi đổi trạng thái sang "Đang hoạt động" cho dịch vụ đã ngừng, Then dịch vụ
  được kích hoạt lại.
- Given tôi bấm Hủy, Then về màn hình quản lý dịch vụ, dữ liệu không đổi.

### US03: Tìm kiếm dịch vụ
Là người quản lý, tôi muốn tìm dịch vụ theo mã hoặc tên, để nhanh chóng chọn đúng dịch vụ cần sửa.

**Acceptance criteria**
- Given tôi nhập "tắm" và bấm Tìm, Then hiển thị mọi dịch vụ có tên chứa "tắm" (không
  phân biệt hoa thường), kể cả dịch vụ đã ngừng, kèm cột ID, tên, đơn vị, giá, trạng thái.
- Given tôi nhập "007", Then hiển thị dịch vụ có mã 007.
- Given không có kết quả (ví dụ "cắt" hoặc ký tự đặc biệt "@#$%^"), Then hiển thị
  "Không có dịch vụ nào trong kết quả tìm kiếm."

### US04: Thống kê doanh thu theo dịch vụ
Là người quản lý, tôi muốn xem doanh thu theo từng dịch vụ trong một khoảng thời gian, để quyết định dịch vụ nào nên duy trì hoặc điều chỉnh giá.

**Acceptance criteria**
- Given tôi nhập 01/09/2025 đến 30/09/2025 và bấm Áp dụng, Then hiển thị bảng gồm STT, tên, đơn vị, giá, số lượng, doanh thu, sắp xếp doanh thu giảm dần (Tắm cơ bản: SL 3, 450.000; Tắm massage: SL 1, 200.000).
- Given kỳ không có hóa đơn nào, Then hiển thị "Không có dữ liệu thống kê".
- Given đơn dịch vụ chưa có hóa đơn thanh toán, then đơn đó không được tính.

### US05: Xem hóa đơn chi tiết của một dịch vụ
Là người quản lý, tôi muốn xem các hóa đơn cấu thành doanh thu của một dịch vụ, để đối chiếu số liệu tổng hợp với nguồn.

**Acceptance criteria**
- Given tôi chọn dòng "Tắm cơ bản", Then hiển thị danh sách hóa đơn trong kỳ gồm ID,
  ngày, số lượng, thành tiền dịch vụ, hình thức thanh toán, ghi chú.
- Given xem danh sách đó, Then tổng cột "Thành tiền dịch vụ" bằng doanh thu ở bảng
  thống kê (300.000 + 150.000 = 450.000).
- Given tôi bấm Quay lại, Then về bảng thống kê dịch vụ với kỳ đã chọn.

### US06: Thống kê doanh thu theo khách hàng
Là người quản lý, tôi muốn xem doanh thu theo từng khách hàng trong một khoảng thời gian, để biết khách hàng nào đóng góp nhiều nhất.

**Acceptance criteria**
- Given tôi nhập 01/09/2025 đến 30/09/2025 và bấm Áp dụng, Then hiển thị bảng gồm
  STT, tên, địa chỉ, số điện thoại, doanh thu, sắp xếp giảm dần
  (Lò Thị B: 350.000; Nguyễn Văn A: 300.000).
- Given kỳ không có hóa đơn nào, Then hiển thị "Không có dữ liệu thống kê".

### US07: Xem hóa đơn chi tiết của một khách hàng
Là người quản lý, tôi muốn xem các hóa đơn của một khách hàng trong kỳ, để kiểm tra lịch sử sử dụng.

**Acceptance criteria**
- Given tôi chọn dòng "Nguyễn Văn A", Then hiển thị danh sách hóa đơn của khách hàng
  trong kỳ gồm ID, ngày, tổng tiền, hình thức thanh toán, ghi chú.
- Given tôi bấm Quay lại, Then về bảng thống kê khách hàng.

### US08: Kiểm tra khoảng thời gian thống kê
Là người quản lý, tôi muốn được báo lỗi rõ ràng khi nhập sai thời gian, để không xem nhầm báo cáo.

**Acceptance criteria**
- Given tôi để trống ngày bắt đầu hoặc kết thúc, Then hiển thị "Điền đầy đủ thông tin".
- Given tôi nhập sai định dạng (ví dụ "1 tháng 9 năm 2025"), Then hiển thị "Ngày tháng không hợp lệ."
- Given tôi nhập ngày không tồn tại (31/02/2025), Then hiển thị "Ngày tháng không hợp lệ".
- Given ngày bắt đầu lớn hơn ngày kết thúc, Then hiển thị "Khoảng thời gian không hợp lệ".
- Trong mọi trường hợp lỗi, sau khi bấm OK, quay về màn hình thống kê.

### US09: Giới hạn truy cập cho Manager
Là chủ spa, tôi muốn chỉ Manager mới xem được danh mục giá và doanh thu, để bảo vệ thông tin kinh doanh.

**Acceptance criteria**
- Given người dùng không có vai trò Manager, Then không thấy các mục Quản lý dịch vụ và Xem báo cáo trên trang chủ.
- Given người dùng không có vai trò Manager truy cập trực tiếp bằng đường dẫn, Then bị từ chối truy cập.
