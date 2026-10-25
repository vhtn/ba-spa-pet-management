-- Dữ liệu mẫu (toàn bộ là dữ liệu giả)
USE petspa;

INSERT INTO tblUser (id, username, password, fullName, birthday, address, phone, email, description) VALUES
(1, 'manager01', 'HASH_PLACEHOLDER', 'Nguyễn Quản Lý', '1990-05-10', 'Hải Phòng', '0900000001', 'manager01@example.com', NULL),
(2, 'admin01',   'HASH_PLACEHOLDER', 'Trần Quản Trị',  '1992-03-15', 'Hà Nội',    '0900000002', 'admin01@example.com',   NULL),
(3, 'recep01',   'HASH_PLACEHOLDER', 'Hoàng Lễ Tân',   '1997-01-25', 'Hải Phòng', '0900000003', 'recep01@example.com',   NULL),
(4, 'groom01',   'HASH_PLACEHOLDER', 'Lê Chăm Sóc',    '1998-07-20', 'Hải Phòng', '0900000004', 'groom01@example.com',   NULL),
(5, 'groom02',   'HASH_PLACEHOLDER', 'Phạm Chăm Sóc',  '1999-11-02', 'Hải Phòng', '0900000005', 'groom02@example.com',   NULL);

INSERT INTO tblManager      (userID) VALUES (1);
INSERT INTO tblAdmin        (userID) VALUES (2);
INSERT INTO tblReceptionist (userID) VALUES (3);
INSERT INTO tblGrooming     (userID) VALUES (4), (5);

INSERT INTO tblService (id, name, unit, price, description, status) VALUES
(1, 'Tắm cơ bản',  '0-5 kg', 150000, NULL, 'Đang hoạt động'),
(7, 'Tắm massage', '0-5 kg', 200000, NULL, 'Đang hoạt động');

INSERT INTO tblClient (id, name, phone, address, note) VALUES
(1, 'Nguyễn Văn A', '0901234567', 'Hải Phòng', NULL),
(7, 'Lò Thị B',     '0907654321', 'Cao Bằng',  NULL);

INSERT INTO tblServiceOrder (id, `date`, note, clientID, receptionistID) VALUES
(1, '2025-09-01 09:00:00', NULL, 1, 3),
(2, '2025-09-03 14:30:00', NULL, 7, 3);

INSERT INTO tblDetailServiceOrder (id, quantity, status, price, note, serviceOrderID, serviceID, groomingID) VALUES
(1, 2, 'Hoàn thành', 150000, NULL, 1, 1, 4),   -- đơn 1: 2 x Tắm cơ bản, groom01 thực hiện
(2, 1, 'Hoàn thành', 150000, NULL, 2, 1, 4),   -- đơn 2: 1 x Tắm cơ bản, groom01
(3, 1, 'Hoàn thành', 200000, NULL, 2, 7, 5);   -- đơn 2: 1 x Tắm massage, groom02

INSERT INTO tblBill (id, paymentDay, paymentAmount, paymentType, note, serviceOrderID, receptionistID) VALUES
(1, '2025-09-01 10:15:00', 300000, 'Tiền mặt',     NULL, 1, 3),   -- 2 x 150.000
(2, '2025-09-03 15:45:00', 350000, 'Chuyển khoản', NULL, 2, 3);   -- 150.000 + 200.000
