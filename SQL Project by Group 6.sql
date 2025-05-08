use project_data;
Select * from data;
#KPI-1
SELECT round(sum(`Manufactured Qty`),0) FROM data;

#KPI-2
SELECT round(sum(`Rejected Qty`),0) FROM data;

#KPI-3
SELECT round(sum(`Processed Qty`),0) FROM data;

#KPI-4
SELECT CONCAT(ROUND(Sum(`Rejected Qty`)/Sum(`Processed Qty`)*100,2)*100, "%")
FROM data;

#KPI-5
SELECT Machine_Employee, 
       round(sum(`Rejected Qty`),1) AS Rejected_Qty
FROM data
group by Machine_Employee;


#KPI-6
SELECT `Machine Code`,
sum(`Rejected Qty`) as Rejected_Quantity
FROM data
GROUP By `Machine Code`;


#KPI-7
Select `Doc Date`,sum(`Produced Qty`) as Produced_Quantity 
FROM data
GROUP BY `Doc Date`;

#KPI-8
SELECT 
    CASE 
        WHEN (SELECT sum(`Rejected Qty`) FROM data ) > (SELECT sum(`Manufactured Qty`) FROM data ) THEN 'More Rejected'
        WHEN (SELECT sum(`Rejected Qty`) FROM data ) < (SELECT sum(`Manufactured Qty`) FROM data ) THEN 'Less Rejected'
        ELSE 'Equal'
    END AS `Comparison`;

#KPI-9
SELECT 
    `Department Name`,
    round(sum(`Manufactured Qty`),0) AS `Total Manufactured Qty`,
    round(sum(`Rejected Qty`),0) AS `Total Rejected Qty`,
    CASE 
        WHEN round(sum(`Rejected Qty`),0) > round(sum(`Manufactured Qty`),0) THEN 'More Rejected'
        WHEN sum(`Rejected Qty`) < sum(`Manufactured Qty`) THEN 'Less Rejected'
        ELSE 'Equal'
    END AS `Comparison`
FROM data
GROUP BY 
    `Department Name`;
    
 #KPI-10
    SELECT `Emp Name`,round(sum(`Rejected Qty`),2) as Rejected_Quantity from data
    group by `Emp Name`;
    







