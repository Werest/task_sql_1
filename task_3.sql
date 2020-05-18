select
       Name as 'Имя сотрудника',
       (select Name from Employees where Id In (select ManagerId from Employees where ManagerId = (select id from Employees
        where Name='Иванов'))) AS 'Имя прямого руководителя сотрудника'
from Employees
where ManagerId = (select id from Employees
where Name='Иванов')