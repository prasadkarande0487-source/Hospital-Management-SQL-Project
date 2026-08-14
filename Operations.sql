-- Hospital_Management_System  Operations Questions

-- 1.	Display all hospital records.
-- Answer :-
 select * from hospital;
-- 2.	Display only hospital_name and location from the hospital table.
select hospital_name,location from hospital;
-- 3.	Display all patients.
select * from patient;
-- 4.	Find patients whose age is greater than 50.
select * from patient where age >50;
-- 5.	Find all female patients.
select * from patient where gender="Female";
-- 6.	Display doctors whose specialization is 'Cardiology'.
select * from doctor where specialization="Cardiology";
-- 7.	Display all staff working in the 'Morning' shift.
select * from staffs where shift="Morning";
-- 8.	Display medicines whose stock is less than 50.
select * from medicine where stock<50; 
-- 9.	Display rooms whose status is 'Available'.
select * from room where status="Available";
-- 10.	Display all appointments having status 'Completed'.
select * from appointment where status="Completed";
-- 11.	Display patients from oldest to youngest.
select * from patient order by age desc;
-- 12.	Display doctors alphabetically by doctor name.
select * from doctor order by doctor_name asc;
-- 13.	Display staff with salary greater than ₹40,000.
select * from staffs where salary >40000;
-- 14.	Display the top 10 highest-paid staff members.
select * from staffs order by salary desc limit 10;
-- 15.	Find medicines that expire before a particular date.
select * from medicine where expiry_date<'2028-06-06'
-- 16.	Find bills where net_amount is greater than ₹15,000.
select * from bill where net_amount >15000;
-- 17.	Find patients whose age is between 30 and 50.
select * from patient where age between 30 and 50;
-- 18.	Find appointments scheduled after '2026-08-01'.
select * from appointment where appointment_date>'2026-08-01';
-- 19.	Find staff members who work in either the Morning or Night shift.
select * from staffs where shift in ("Morning","Night"); 
-- 20.	Find patients whose name starts with 'A'.
select * from patient where patient_name like 'A%';
-- 21.	Find the total number of patients.
select count(*) from patient;
-- 22.	Find the total number of doctors.
select count(*) from doctor;
-- 23.	Find the average patient age.
select avg(age) from patient;
-- 24.	Find the maximum staff salary.
select max(salary) from staffs;
-- 25.	Find the minimum staff salary.
select min(salary) from staffs;
-- 26.	Find the average staff salary.
select avg(salary) from staffs;
-- 27.	Count the number of patients by gender.
select count(gender) from patient;
-- 28.	Count appointments by status.
SELECT status, COUNT(*) AS total_appointments
FROM appointment
GROUP BY status;
-- 29.	Find the total hospital revenue from paid bills.
SELECT SUM(net_amount) AS total_hospital_revenue
FROM bill
WHERE payment_status = 'Paid';
-- 30.	Find the total amount of discount given.
SELECT SUM(discount) AS total_discount
FROM bill;
-- 31.	Find the number of doctors in each department.
select department_id , count(*) count_doctor from doctor group by department_id;
-- 32.	Find the number of staff members in each department.
select department_id , count(*) from staffs group by department_id;
-- 33.	Find the average salary for each designation.
select designation ,avg(salary) from staff group by designation; 
-- 34.	Find the total salary expense for each department.
select department_id , sum(salary) total_salary_expences from staffs group by department_id ;
-- 35.	Find the number of appointments handled by each doctor.
select doctor_id , count(appointment_id) count_appointment from appointment group by doctor_id;
-- 36.	Find doctors who have more than 2 appointments.
select d.doctor_name , d.doctor_id , count(a.appointment_id) 
from doctor d 
join appointment a on d.doctor_id = a.doctor_id group by d.doctor_id , d.doctor_name
having count(a.appointment_id)>2  ;
-- 37.	Find departments having more than 2 staff members.
select d.department_name , d.department_id 
from department d join staffs s 
on d.department_id=s.department_id
group by d.department_id , d.department_name
having count(staff_id)=2;
-- 38.	Find the number of patients in each gender category.
SELECT gender, COUNT(*) AS patient_count
FROM patient
GROUP BY gender;   
-- 39.	Find the number of bills for each bill status.
select status , count(*) as no_of_bills 
from bill 
group by status;
SELECT status, AVG(net_amount) AS average_bill_amount
FROM bill
GROUP BY status;
-- 41.	Display patient name along with their appointment date and appointment status.
select p.patient_name, a.appointment_date, a.status
from patient p 
join appointment a  
on p.patient_id=a.patient_id;
-- 42.	Display patient name and doctor name for every appointment.
select p.patient_name , d.doctor_name 
from patient p 
join appointment a
on a.patient_id=p.patient_id
join doctor d
on d.doctor_id=a.doctor_id;
 
-- 43.	Display doctor name, specialization, and department name.
select d.doctor_name , d.specialization, dep.department_name 
from doctor d join
departmment dep 
on d.department_id=dep.department_id;
-- 44.	Display staff name and their department name.
select s.staff_name , d.department_name
from staffs s join
department d
on d.department_id=s.department_id;

-- 45.	Display patient name, room type, admission date, and discharge date.
select p.patient_name , r.room_type , a.admission_date , a.discharge_date
from room r join 
admission a 
on r.room_id=a.room_id
join patient p
on a.patient_id=p.patient_id; 
-- 46.	Display patient name and their prescription/medicine information.
select p.patient_name , pres.* 
from patient p
join 
prescription pres
on p.patient_id=pres.patient_id; 
-- 47.	Display patient name, doctor name, and lab test status.
select p.patient_name , d.doctor_name , l.status as lab_status
from patient p
join
lab_test l 
on p.patient_id = l.patient_id
join 
doctoer d
on d.doctor_id=l.doctor_id;
-- 48.	Display patient name and their bill amount.
select p.patient_name , b.net_amount 
from patient p 
join bill b
 on p.patient_id=b.patient_id;
-- 49.	Display doctor name and the total number of appointments handled by each doctor.
select d.doctor_name , count(a.appointment_id) total_num_appointment 
from doctor d 
join appointment a 
on a.doctor_id=d.doctor_id
group by d.doctor_name;
-- 50.	Display department name and the number of doctors working in each department.
SELECT d.department_name, count(doc.doctor_id) as no_of_doctors
from department d 
join doctor doc
on d.department_id=doc.department_id
group by d.department_id;
-- 51.	Find the doctor who has handled the highest number of appointments.
select d.* , count(a.appointment_id) count_appoint  
from doctor d 
join 
appointment a 
on d.doctor_id=a.doctor_id
group by d.doctor_id, d.doctor_name 
order by count_appoint desc
limit 1;
-- 52.	Find the department with the highest number of doctors.

-- 53.	Find the patient who has the highest total billing amount.
-- 54.	Find patients who have more than one appointment.
-- 55.	Find doctors who have never received an appointment.
-- 56.	Find patients who have never had an appointment.
-- 57.	Find the second-highest staff salary.
-- 58.	Find the highest-paid staff member in each department.
-- 59.	Find the department whose staff has the highest average salary.
-- 60.	Find the percentage of appointments that were cancelled.
-- 61.	Find the top 5 doctors by completed appointments.
-- 62.	Find the top 5 patients by total medical billing.
-- 63.	Calculate monthly hospital revenue from paid bills.
-- 64.	Find the most frequently prescribed medicines.
-- 65.	Find the most commonly used room type for admissions.
-- 66.	Calculate the average length of hospital stay using admission and discharge dates.
-- 67.	Find patients who were admitted but have not yet been discharged.
-- 68.	Find doctors who have appointments with patients aged above 60.
-- 69.	Find the department generating the highest total billing revenue.
-- 70.	Create a report showing:
-- 71.	Rank doctors according to their number of completed appointments using a window function.
-- 72.	Rank staff members according to salary within each department.
-- 73.	Find each patient's total number of appointments and rank patients by appointment count.
-- 74.	Find the running total of hospital revenue by bill/order date if you have a bill date column; otherwise note that your current bill table needs a date column.
-- 75.	Create a summary showing:
