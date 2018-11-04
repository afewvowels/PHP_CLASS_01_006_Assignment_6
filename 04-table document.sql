DEFINE('HOST', 'localhost');
DEFINE('USER', 'kbsmith01_user1');
DEFINE('PASS', 'Mynewpassword2');
DEFINE('DB', 'kbsmith01_cs');

USE cs_customers;

CREATE_TABLE cs_customers {
  cs_customer_id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  full_name VARCHAR(80) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phone CHAR(10) NOT NULL,
  password VARCHAR(40) NOT NULL,
  date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(cs_customer_id)
}ENGINE = InnoDB;

CREATE_TABLE cs_admins {
  cs_admin_id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  full_name VARCHAR(80) NOT NULL,
  position VARCHAR(40) NOT NULL,
  employee_id_num MEDIUMINT NOT NULL,
  PRIMARY KEY(cs_admin_id)
}ENGINE = InnoDB;

CREATE_TABLE cs_addresses {
  cs_address_id MEDIUMINT NOT NULL,
  cs_customer_id MEDIUMINT NOT NULL,
  type TINYINT NOT NULL,
  address_street1 VARCHAR(100) NOT NULL,
  address_street2 VARCHAR(100) NOT NULL,
  city VARCHAR(40) NOT NULL,
  state CHAR(2) NOT NULL,
  zip CHAR(5) NOT NULL,
  date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(cs_address_id)
}ENGINE = InnoDB;

CREATE_TABLE cs_address_types {
  cs_address_type_id TINYINT NOT NULL,
  type VARCHAR(9) NOT NULL,
  PRIMARY KEY(cs_addresss_type_id)
}ENGINE = InnoDB;

CREATE_TABLE cs_credit_cards {
  cs_credit_card_id MEDIUMINT NOT NULL,
  cs_customer_id MEDIUMINT NOT NULL,
  cs_address_id MEDIUMINT NOT NULL,
  cs_credit_card_type_id TINYINT NOT NULL,
  credit_card_number CHAR(16) NOT NULL,
  exp_month CHAR(2) NOT NULL,
  exp_year CHAR(2) NOT NULL,
  PRIMARY KEY(cs_credit_card_id)
}ENGINE = InnoDB;

CREATE_TABLE cs_credit_card_types {
  cs_credit_card_type_id TINYINT NOT NULL,
  card_type VARCHAR(10) NOT NULL,
  PRIMARY KEY(cs_credit_card_type_id)
}ENGINE = InnoDB;

CREATE_TABLE cs_carts {
  cs_case_id MEDIUMINT NOT NULL,
  cs_cart_id MEDIUMINT NOT NULL,
  cs_customer_id MEDIUMINT NOT NULL,
  cs_clothing_id MEDIUMINT NOT NULL,
  cs_clothing_size_id TINYINT NOT NULL,
  cs_clothing_color_id TINYINT NOT NULL,
  cs_clothing_price_id DOUBLE(5,2) NOT NULL,
  quantity TINYINT NOT NULL,
  date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  date_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(cs_case_id)
}ENGINE = InnoDB;

CREATE_TABLE cs_transactions {
  cs_transaction_id MEDIUMINT NOT NULL,
  cs_customer_id MEDIUMINT NOT NULL,
  shipping_type_id TINYINT NOT NULL,
  shipping_cost DOUBLE(5,2) NOT NULL,
  shipping_address_id MEDIUMINT NOT NULL,
  credit_card_id MEDIUMINT NOT NULL,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  date_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(cs_transaction_id)
}ENGINE = InnoDB;

CREATE_TABLE cs_shipping_types {
  cs_shipping_type_id TINYINT NOT NULL,
  carrier VARCHAR(5) NOT NULL,
  type VARCHAR(9) NOT NULL,
  PRIMARY KEY(cs_shipping_types)
}ENGINE = InnoDB;

CREATE_TABLE cs_clothing_items {
  cs_clothing_id MEDIUMINT NOT NULL,
  clothing_type_id TINYINT NOT NULL,
  clothing_description_id MEDIUMINT NOT NULL,
  clothing_size_id TINYINT NOT NULL,
  clothing_color_id TINYINT NOT NULL,
  clothing_photo MEDIUMINT NOT NULL,
  clothing_price DOUBLE(5,2) NOT NULL,
  clothing_stock_quantity MEDIUMINT NOT NULL,
  weight DOUBLE(2,1) NOT NULL,
  date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(cs_clothing_items)
}ENGINE = InnoDB;

CREATE_TABLE cs_clothing_types {
  cs_clothing_type_id TINYINT NOT NULL,
  item_type VARCHAR(9) NOT NULL,
  PRIMARY KEY(cs_clothing_types)
}ENGINE = InnoDB;

CREATE_TABLE cs_clothing_descriptions {
  cs_clothing_description_id MEDIUMINT NOT NULL,
  cs_clothing_type_id MEDIUMINT NOT NULL,
  description MEDIUMTEXT NOT NULL,
  PRIMARY KEY(cs_clothing_description_id)
}ENGINE = InnoDB;

CREATE_TABLE cs_clothing_sizes {
  cs_clothing_size_id TINYINT NOT NULL,
  size VARCHAR(8) NOT NULL,
  PRIMARY KEY(cs_clothing_size_id)
}ENGINE = InnoDB;

CREATE_TABLE cs_clothing_colors {
  cs_clothing_color_id TINYINT NOT NULL,
  color VARCHAR(12) NOT NULL,
  PRIMARY KEY(cs_clothing_color_id)
}ENGINE = InnoDB;

CREATE_TABLE cs_clothing_sales {
  cs_sale_id MEDIUMINT NOT NULL,
  cs_clothing_id MEDIUMINT NOT NULL,
  sale_price DOUBLE(5,2) NOT NULL,
  open_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  close_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(cs_clothing_color_id)
}ENGINE = InnoDB;
