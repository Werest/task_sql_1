select
    concat_ws(' ', FirstName, MidName, LastName) as 'Полное ФИО пациента'
    ,month(Date) as Месяц
    ,D.Name as Диагноз
    ,COUNT(D.Name) as 'Количество посещений за месяц по текущему диагнозу'
from Patients
join Schedules S on Patients.Id = S.PatientId
join Diagnoses D on S.DiagnosisId = D.Id
GROUP BY D.Name, month(Date), concat_ws(' ', FirstName, MidName, LastName)
HAVING COUNT(D.Name) > 1