CREATE TABLE medicine (
    medicine_id CHAR(10) PRIMARY KEY,
    medicine_name CHAR(50),
    medicine_brandname CHAR(50),
    expire_date TIMESTAMP,
    price DOUBLE PRECISION,
    supplier_id CHAR(10) REFERENCES supplier(supplier_id)
);

CREATE TABLE equipment (
    equipment_id CHAR(10) PRIMARY KEY,
    equipment_name CHAR(50),
    unit INTEGER,
    price DOUBLE PRECISION,
    minimize INTEGER,
    supplier_id CHAR(10) REFERENCES supplier(supplier_id)
);

CREATE TABLE supplier (
    supplier_id CHAR(10) PRIMARY KEY,
    supplier_name CHAR(50),
    supplier_address CHAR(100),
    phone_num CHAR(10)
);

CREATE TABLE order_medicine (
    medicine_id CHAR(10) REFERENCES medicine(medicine_id),
    bill_id CHAR(10) REFERENCES bill(bill_id),
    order_date TIMESTAMP,
    order_time TIMESTAMP,
    quantity INTEGER,
    pharmacist_name CHAR(50),
    PRIMARY KEY (medicine_id, bill_id)
);

CREATE TABLE order_equipment (
    equipment_id CHAR(10) REFERENCES equipment(equipment_id),
    bill_id CHAR(10) REFERENCES bill(bill_id),
    order_date TIMESTAMP,
    order_time TIMESTAMP,
    quantity INTEGER,
    pharmacist_name CHAR(50),
    PRIMARY KEY (equipment_id, bill_id)
);

CREATE TABLE patient_information (
    patient_id CHAR(10) PRIMARY KEY,
    patient_name CHAR(50),
    patient_address CHAR(100),
    birthday TIMESTAMP,
    phone_num CHAR(10)
);

CREATE TABLE bill (
    bill_id CHAR(10) PRIMARY KEY,
    bill_date TIMESTAMP,
    bill_time TIMESTAMP,
    amount INTEGER,
    payment INTEGER,
    reception_name CHAR(50),
    patient_id CHAR(10) REFERENCES patient_information(patient_id)
);

CREATE TABLE appointment (
    appointment_id CHAR(10) PRIMARY KEY,
    appointment_date TIMESTAMP,
    appointment_time TIMESTAMP,
    Comment CHAR(100),
    doctor_name CHAR(50),
    patient_id CHAR(10) REFERENCES patient_information(patient_id)
);

CREATE TABLE patient_history (
    patient_history_id CHAR(10) PRIMARY KEY,
    blood_pressure INTEGER,
    heat DOUBLE PRECISION,
    diagnose CHAR(100),
    Comment CHAR(100),
    doctor_name CHAR(50),
    patient_id CHAR(10) REFERENCES patient_information(patient_id)
);

CREATE TABLE queue (
    queue_id CHAR(10) PRIMARY KEY,
    queue_date TIMESTAMP,
    queue_time TIMESTAMP,
    reception_name CHAR(50),
    patient_id CHAR(10) REFERENCES patient_information(patient_id)
);
