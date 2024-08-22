
-- Bảng địa điểm lấy hàng
CREATE TABLE pick_addresses (
    pick_address_id VARCHAR(50) PRIMARY KEY,
    address VARCHAR(255),
    province VARCHAR(100) NOT NULL,
    district VARCHAR(100) NOT NULL,
    ward VARCHAR(100),
    street VARCHAR(100)
);

-- Bảng tỉnh/thành phố
CREATE TABLE provinces (
    province_id INT AUTO_INCREMENT PRIMARY KEY,
    province_name VARCHAR(100) NOT NULL
);

-- Bảng quận/huyện
CREATE TABLE districts (
    district_id INT AUTO_INCREMENT PRIMARY KEY,
    district_name VARCHAR(100) NOT NULL,
    province_id INT,
    FOREIGN KEY (province_id) REFERENCES provinces(province_id)
);

-- Bảng phường/xã
CREATE TABLE wards (
    ward_id INT AUTO_INCREMENT PRIMARY KEY,
    ward_name VARCHAR(100) NOT NULL,
    district_id INT,
    FOREIGN KEY (district_id) REFERENCES districts(district_id)
);

-- Bảng phương thức vận chuyển
CREATE TABLE transport_methods (
    transport_id INT AUTO_INCREMENT PRIMARY KEY,
    transport_name VARCHAR(50) NOT NULL
);

-- Bảng tùy chọn giao hàng
CREATE TABLE deliver_options (
    option_id INT AUTO_INCREMENT PRIMARY KEY,
    option_name VARCHAR(50) NOT NULL
);

-- Bảng nhãn đơn hàng
CREATE TABLE tags (
    tag_id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(50) NOT NULL
);

-- Bảng biểu phí vận chuyển
CREATE TABLE shipping_fees (
    fee_id INT AUTO_INCREMENT PRIMARY KEY,
    pick_province VARCHAR(100) NOT NULL,
    pick_district VARCHAR(100) NOT NULL,
    province VARCHAR(100) NOT NULL,
    district VARCHAR(100) NOT NULL,
    weight INT NOT NULL,
    value INT,
    transport_id INT,
    deliver_option_id INT NOT NULL,
    fee DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (transport_id) REFERENCES transport_methods(transport_id),
    FOREIGN KEY (deliver_option_id) REFERENCES deliver_options(option_id)
);

-- Bảng liên kết giữa đơn hàng và nhãn
CREATE TABLE order_tags (
    order_id INT,
    tag_id INT,
    PRIMARY KEY (order_id, tag_id),
    FOREIGN KEY (tag_id) REFERENCES tags(tag_id)
);