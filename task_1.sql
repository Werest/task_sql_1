select
    concat_ws(' ', FirstName, MidName, LastName) as ФИО
    ,D.Name as Диагноз
    ,substring(convert(varchar, Date, 23), 6, 2) as Месяц
    ,COUNT(D.Name) as 'Количество посещений'
from Patients
join Schedules S on Patients.Id = S.PatientId
join Diagnoses D on S.DiagnosisId = D.Id
GROUP BY D.Name, concat_ws(' ', FirstName, MidName, LastName), substring(convert(varchar, Date, 23), 6, 2)
HAVING COUNT(D.Name) > 1