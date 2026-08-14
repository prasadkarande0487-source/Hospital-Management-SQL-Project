use Hospital_Management_System;

CREATE TABLE department( department_id int primary key,
department_name varchar(45), hospital_id varchar(25),
foreign key (hospital_id) references hospital(hospital_id));

create table doctor ( doctor_id int primary key, doctor_name varchar(45),
department_id int , specialization varchar(45),
email varchar(45), qualification varchar(45),
foreign key (department_id) references department(department_id));

create table patient(patient_id int primary key , 
patient_name varchar(45), age int , 
date_of_birth varchar(45),
gender varchar(15) , 
address varchar(45),
phone_no int );

create table appointment(appointment_id int primary key , 
patient_id int , doctor_id int ,
appointment_date varchar(45) , 
appointment_time timestamp ,
status varchar(45));

create table room(room_id int primary key,
room_type varchar(45) ,
charge_per_day varchar(45),
status varchar(45));

create table admission(
admission_id int primary key , 
patient_id int ,
room_id int,
admission_date date ,
discharge_date date ,
status varchar(45),
foreign key (patient_id) references patient(patient_id),
foreign key (room_id) references room(room_id)
);

create table lab_test(test_id int primary key,
test_name varchar(45),
patient_id int ,
doctor_id int,
status varchar(45),
foreign key (patient_id) references patient(patient_id),
foreign key (doctor_id) references doctor(doctor_id));

create table prescription ( prescription_id int primary key ,
medicine_name varchar(45), dosage varchar(45) , frequency int , patient_id int ,
foreign key (patient_id) references patient(patient_id));

create table bill (bill_id int primary key ,
 patient_id int , 
 total_amount int ,
 discount decimal ,
 gst decimal,
 net_amount decimal,
 status varchar(45));
  
 create table medicine (medicine_id int primary key ,
 medicine_name varchar(45) ,
 company varchar(45),
 price decimal ,
 stock int ,
 expiry_date date );

 create table staffs ( staff_id int primary key ,
  staff_name varchar(45) ,
  department_id int ,
  age int ,
  gender varchar(45),
  email varchar(35),
  phone_no int ,
  shift varchar(45),
 designation varchar(45),
 foreign key (department_id) references department(department_id));

select * from doctor;
describe doctor;

commit;
 