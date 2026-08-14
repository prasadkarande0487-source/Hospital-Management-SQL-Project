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
SELECT 
    dep.department_id,
    dep.department_name,
    COUNT(d.doctor_id) AS doctor_count
FROM doctor d
JOIN department dep
    ON d.department_id = dep.department_id
GROUP BY dep.department_id, dep.department_name
ORDER BY doctor_count DESC
LIMIT 1;
-- 53.	Find the patient who has the highest total billing amount.
select p.patient_id ,p.patient_name ,sum(b.net_amount) as total_bill
from patient p join bill b
on p.patient_id=b.patient_id
group by p.patient_id,p.patient_name
order by total_bill desc
limit 1;
-- 54.	Find patients who have more than one appointment.
select p.patient_id , p.patient_name , count(a.appointment_id) as appointments 
from patient p 
join appointment a 
on p.patient_id=a.appointment_id
group by p.patient_id , p.patient_name
having appointments>1;
-- 55.	Find doctors who have never received an appointment.
select d.doctor_id , d.doctor_name , count(a.appointment_id) as appointments
from doctor d 
left join appointment a 
on d.doctor_id=a.doctor_id
group by d.doctor_id, d.doctor_name
having appointments=0;
-- 56.	Find patients who have never had an appointment.
select p.patient_id , p.patient_name , count(a.appointment_id)
from patient p 
left join appointment a 
on p.patient_id=a.patient_id
group by p.patient_id , p.patient_name 
having count(a.appointment_id)=0;
-- 57.	Find the second-highest staff salary.
select max(salary) from staffs 
where salary < (select max(salary) from staffs);
-- 58.	Find the highest-paid staff member in each department.
select s.* from staffs s 
where s.salary = (select max(s1.salary) 
from staffs s1 
where s.department_id=s1.department_id);
-- 59.	Find the department whose staff has the highest average salary.
select department_id,avg(salary) max_avg_salary
from staffs 
group by department_id
order by max_avg_salary desc limit 1; 
-- 60.	Find the percentage of appointments that were cancelled.
SELECT 
    COUNT(CASE WHEN status = 'Cancelled' THEN 1 END) * 100.0 / COUNT(*) AS cancelled_percentage
FROM appointment;
-- 61.	Find the top 5 doctors by completed appointments.
SELECT 
    d.doctor_id,
    d.doctor_name,
    COUNT(a.appointment_id) AS completed_appointments
FROM doctor d
JOIN appointment a
    ON d.doctor_id = a.doctor_id
WHERE a.status = 'Completed'
GROUP BY d.doctor_id, d.doctor_name
ORDER BY completed_appointments DESC
LIMIT 5;
-- 62.	Find the top 5 patients by total medical billing.
SELECT 
    p.patient_id,
    p.patient_name,
    SUM(b.amount) AS total_billing
FROM patient p
JOIN bill b
    ON p.patient_id = b.patient_id
GROUP BY p.patient_id, p.patient_name
ORDER BY total_billing DESC
LIMIT 5;
-- 63.	Calculate monthly hospital revenue from paid bills.
SELECT 
    DATE_FORMAT(bill_date, '%Y-%m') AS month,
    SUM(amount) AS monthly_revenue
FROM bill
WHERE payment_status = 'Paid'
GROUP BY DATE_FORMAT(bill_date, '%Y-%m')
ORDER BY month;
-- 64.	Find the most frequently prescribed medicines.
SELECT 
    medicine_name,
    COUNT(*) AS prescription_count
FROM prescription
GROUP BY medicine_name
ORDER BY prescription_count DESC;
-- 65.	Find the most commonly used room type for admissions.
SELECT 
    r.room_type,
    COUNT(a.admission_id) AS admission_count
FROM room r
JOIN admission a
    ON r.room_id = a.room_id
GROUP BY r.room_type
ORDER BY admission_count DESC
LIMIT 1;
-- 66.	Calculate the average length of hospital stay using admission and discharge dates.
SELECT 
    AVG(DATEDIFF(discharge_date, admission_date)) AS average_stay_days
FROM admission
WHERE discharge_date IS NOT NULL;
-- 67.	Find patients who were admitted but have not yet been discharged.
SELECT 
    p.patient_id,
    p.patient_name,
    a.admission_date
FROM patient p
JOIN admission a
    ON p.patient_id = a.patient_id
WHERE a.discharge_date IS NULL;
-- 68.	Find doctors who have appointments with patients aged above 60.
SELECT DISTINCT
    d.doctor_id,
    d.doctor_name
FROM doctor d
JOIN appointment a
    ON d.doctor_id = a.doctor_id
JOIN patient p
    ON a.patient_id = p.patient_id
WHERE p.age > 60;
-- 69.	Find the department generating the highest total billing revenue.
SELECT 
    dep.department_id,
    dep.department_name,
    SUM(b.amount) AS total_revenue
FROM department dep
JOIN doctor d
    ON dep.department_id = d.department_id
JOIN appointment a
    ON d.doctor_id = a.doctor_id
JOIN bill b
    ON a.patient_id = b.patient_id
GROUP BY dep.department_id, dep.department_name
ORDER BY total_revenue DESC
LIMIT 1;
-- 70.	Create a report showing:
SELECT 
    p.patient_id,
    p.patient_name,
    COUNT(DISTINCT a.appointment_id) AS total_appointments,
    COALESCE(SUM(b.net_amount), 0) AS total_billing
FROM patient p
LEFT JOIN appointment a
    ON p.patient_id = a.patient_id
LEFT JOIN bill b
    ON p.patient_id = b.patient_id
GROUP BY p.patient_id, p.patient_name;
-- 71.	Rank doctors according to their number of completed appointments using a window function.
SELECT 
    d.doctor_id,
    d.doctor_name,
    COUNT(a.appointment_id) AS completed_appointments,
    RANK() OVER (
        ORDER BY COUNT(a.appointment_id) DESC
    ) AS doctor_rank
FROM doctor d
JOIN appointment a
    ON d.doctor_id = a.doctor_id
WHERE a.status = 'Completed'
GROUP BY d.doctor_id, d.doctor_name;
-- 72.	Rank staff members according to salary within each department.
SELECT 
    s.staff_id,
    s.staff_name,
    s.department_id,
    s.salary,
    RANK() OVER (
        PARTITION BY s.department_id
        ORDER BY s.salary DESC
    ) AS salary_rank
FROM staff s;
-- 73.	Find each patient's total number of appointments and rank patients by appointment count.
SELECT 
    p.patient_id,
    p.patient_name,
    COUNT(a.appointment_id) AS total_appointments,
    RANK() OVER (
        ORDER BY COUNT(a.appointment_id) DESC
    ) AS patient_rank
FROM patient p
LEFT JOIN appointment a
    ON p.patient_id = a.patient_id
GROUP BY p.patient_id, p.patient_name;
-- 74.	Find the running total of hospital revenue by bill/order date if you have a bill date column;
--  otherwise note that your current bill table needs a date column.
SELECT 
    bill_id,
    net_amount,
    SUM(net_amount) OVER (
        ORDER BY bill_id
    ) AS running_total_revenue
FROM bill
WHERE status = 'Paid'
ORDER BY bill_id;
-- 75.	Create a summary showing:
SELECT 
    COUNT(DISTINCT p.patient_id) AS total_patients,
    COUNT(DISTINCT d.doctor_id) AS total_doctors,
    COUNT(a.appointment_id) AS total_appointments,
    COUNT(CASE WHEN a.status = 'Completed' THEN 1 END) AS completed_appointments,
    COUNT(CASE WHEN a.status = 'Cancelled' THEN 1 END) AS cancelled_appointments,
    COALESCE(SUM(b.amount), 0) AS total_billing
FROM patient p
LEFT JOIN appointment a
    ON p.patient_id = a.patient_id
LEFT JOIN doctor d
    ON a.doctor_id = d.doctor_id
LEFT JOIN bill b
    ON p.patient_id = b.patient_id;
