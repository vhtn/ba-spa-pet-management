USE petspa;

INSERT INTO tblUser (id, username, password, fullName, birthday, address, phone, email, `position`, description) VALUES
(1, 'manager01', 'HASH_PLACEHOLDER', 'Nguyễn Quản Lý', '1990-05-10', 'Hải Phòng', '0900000001', 'manager01@example.com', 'Manager', NULL),
(2, 'manager02', 'HASH_PLACEHOLDER', 'Phạm Quản Lý',  '1991-08-22', 'Hải Phòng', '0900000002', 'manager02@example.com', 'Manager', NULL);

INSERT INTO tblManager (userID) VALUES (1), (2);

INSERT INTO tblService (id, name, unit, price, description, status) VALUES
(1, 'Tắm cơ bản',  '0-5 kg', 150000, NULL, 'Đang hoạt động'),
(7, 'Tắm massage', '0-5 kg', 200000, NULL, 'Đang hoạt động');

INSERT INTO tblClient (id, name, phone, address, note) VALUES
(1, 'Nguyễn Văn A', '0901234567', 'Hải Phòng', NULL),
(7, 'Lò Thị B',     '0907654321', 'Cao Bằng',  NULL);

INSERT INTO tblServiceOrder (id, `date`, note, managerID, clientID) VALUES
(1, '2025-09-01 09:00:00', NULL, 1, 1),
(2, '2025-09-03 14:30:00', NULL, 1, 7);

INSERT INTO tblDetailServiceOrder (id, quantity, status, price, note, serviceOrderID, serviceID) VALUES
(1, 2, 'Hoàn thành', 150000, NULL, 1, 1),   
(2, 1, 'Hoàn thành', 150000, NULL, 2, 1),   
(3, 1, 'Hoàn thành', 200000, NULL, 2, 7);   

INSERT INTO tblBill (id, paymentDay, paymentAmount, paymentType, note, managerID, serviceOrderID) VALUES
(1, '2025-09-01 10:15:00', 300000, 'Tiền mặt',     NULL, 1, 1),  
(2, '2025-09-03 15:45:00', 350000, 'Chuyển khoản', NULL, 1, 2);   
