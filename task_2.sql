select concat_ws(' ', FirstName, MidName, LastName) as 'Полное ФИО пациента',
       Phone as Телефон,
       Email as Email,
       Date as 'Дата посещений'
from Schedules
join Patients P on Schedules.PatientId = P.Id
where PatientId = (select id from Patients
where concat_ws(' ', FirstName, MidName, LastName) = (select
       concat_ws(' ', FirstName, MidName, LastName) as FIO
    from Patients
    join Schedules S on Patients.Id = S.PatientId
    join Diagnoses D on S.DiagnosisId = D.Id
    WHERE Sex=2 AND year(Date)=2018 AND datediff(year, BirthDay, getdate()) >= 18
group by concat_ws(' ', FirstName, MidName, LastName), Phone, Email
having count(1) = 1))