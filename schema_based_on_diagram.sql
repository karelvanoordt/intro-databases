CREATE TABLE patients (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(40),
    date_of_birth date
);

CREATE INDEX patient_id ON patients(id);

CREATE TABLE medical_histories (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    admitted_at timestamp,
    patient_id int,
    status varchar(40),
    FOREIGN KEY(patient_id) REFERENCES patients(id)
);

CREATE INDEX patient_histories_id ON medical_histories(id);

CREATE TABLE treatments(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    type varchar(40),
    name varchar(40)
);

CREATE INDEX treatments_id ON treatments(id);

CREATE TABLE invoices (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int,
    FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
);

CREATE INDEX invoices_id ON invoices(id);

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

CREATE INDEX invoices_items_id ON invoices_items(id);
CREATE INDEX invoice_id ON invoices_items(invoice_id);
CREATE INDEX treatment_id ON invoices_items(treatment_id);


CREATE TABLE history_treatments(
    treatment_id int,
    medical_history_id int,
    FOREIGN KEY(treatment_id) REFERENCES treatments(id),
    FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
);

CREATE INDEX treatment_id ON history_treatments(treatment_id);
CREATE INDEX medical_history_id ON history_treatments(medical_history_id);