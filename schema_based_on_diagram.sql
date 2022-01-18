CREATE TABLE patients (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(40),
    date_of_birth date
);

CREATE TABLE medical_histories (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    admitted_at timestamp,
    patient_id int,
    status varchar(40),
    FOREIGN KEY(patient_id) REFERENCES patients(id)
);


CREATE TABLE treatments(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    type varchar(40),
    name varchar(40)
);

CREATE TABLE invoices (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int,
    FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE invoices_items (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    unit_price decimal,
    quantity int,
    total_price decimal,
    invoice_id int,
    treatment_id int,
    FOREIGN KEY(invoice_id) REFERENCES invoices(id),
    FOREIGN KEY(treatment_id) REFERENCES treatments(id)
);

CREATE TABLE history_treatments(
    treatment_id int,
    medical_history_id int,
    FOREIGN KEY(treatment_id) REFERENCES treatments(id),
    FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
);