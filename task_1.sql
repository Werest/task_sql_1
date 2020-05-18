select
    concat_ws(' ', FirstName, MidName, LastName)
    ,D.Name as Diagno
    ,substring(convert(varchar, Date, 23), 6, 2) as Mo
    ,COUNT(D.Name) as Numberko
from Patients
join Schedules S on Patients.Id = S.PatientId
join Diagnoses D on S.DiagnosisId = D.Id
GROUP BY D.Name, concat_ws(' ', FirstName, MidName, LastName), substring(convert(varchar, Date, 23), 6, 2)
HAVING COUNT(D.Name) > 1