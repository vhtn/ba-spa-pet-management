USE petspa;
-- Q1. Doanh thu theo dịch vụ (BR09, BR10, BR12)
-- Kết quả đúng: Tắm cơ bản SL 3, 450000 | Tắm massage SL 1, 200000
SELECT s.id, s.name, s.unit, s.price,
       SUM(d.quantity)           AS total_quantity,
       SUM(d.quantity * d.price) AS revenue
FROM tblDetailServiceOrder d
JOIN tblService      s ON s.id = d.serviceID
JOIN tblServiceOrder o ON o.id = d.serviceOrderID
JOIN tblBill         b ON b.serviceOrderID = o.id
WHERE b.paymentDay >= '2025-09-01' AND b.paymentDay < '2025-10-01'
GROUP BY s.id, s.name, s.unit, s.price
ORDER BY revenue DESC;

-- Q2. Chi tiết hóa đơn của "Tắm cơ bản" trong kỳ (BR13, US06)
-- Kết quả đúng: Bill 1 (SL 2, 300000, Tiền mặt) + Bill 2 (SL 1, 150000, Chuyển khoản) = 450000
SELECT b.id, b.paymentDay, d.quantity,
       d.quantity * d.price AS line_total,
       b.paymentType, b.note
FROM tblDetailServiceOrder d
JOIN tblBill b ON b.serviceOrderID = d.serviceOrderID
WHERE d.serviceID = 1
  AND b.paymentDay >= '2025-09-01' AND b.paymentDay < '2025-10-01'
ORDER BY b.paymentDay;

-- Q3. Doanh thu theo khách hàng (BR10, BR12). Chuỗi: Bill -> ServiceOrder -> Client
-- Kết quả đúng: Lò Thị B 350000 | Nguyễn Văn A 300000
SELECT c.id, c.name, c.address, c.phone,
       SUM(b.paymentAmount) AS revenue
FROM tblBill b
JOIN tblServiceOrder o ON o.id = b.serviceOrderID
JOIN tblClient       c ON c.id = o.clientID
WHERE b.paymentDay >= '2025-09-01' AND b.paymentDay < '2025-10-01'
GROUP BY c.id, c.name, c.address, c.phone
ORDER BY revenue DESC;

-- Q4. Chi tiết hóa đơn của Nguyễn Văn A trong kỳ (US08)
-- Kết quả đúng: Bill 1, 300000, Tiền mặt
SELECT b.id, b.paymentDay, b.paymentAmount, b.paymentType, b.note
FROM tblBill b
JOIN tblServiceOrder o ON o.id = b.serviceOrderID
WHERE o.clientID = 1
  AND b.paymentDay >= '2025-09-01' AND b.paymentDay < '2025-10-01';

-- Q5. Kỳ không có dữ liệu: 01/11/2025 - 30/11/2025
-- Kết quả đúng: 0 dòng -> "Không có dữ liệu thống kê" (BR16)

-- Q6. Minh họa xóa mềm (BR05)
SELECT COUNT(*) AS usage_count FROM tblDetailServiceOrder WHERE serviceID = 7;   -- kết quả: 1
-- UPDATE tblService SET status = 'Ngừng hoạt động' WHERE id = 7;               -- được phép
-- DELETE FROM tblService WHERE id = 7;                                          -- bị FK RESTRICT chặn
