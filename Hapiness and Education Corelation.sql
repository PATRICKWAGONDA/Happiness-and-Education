------EDUCATION COMPLETION RATES AND HAPPINESS
-------Correlate primary, lower secondary, and upper secondary school completion rates with happiness scores
select [Countries and areas],Completion_Rate_Lower_Secondary_Female,
Completion_Rate_Lower_Secondary_Male,
Completion_Rate_Primary_Female,Completion_Rate_Primary_Male,
Completion_Rate_Upper_Secondary_Female,Completion_Rate_Upper_Secondary_Male,[Ladder score]
from Global_Education
join ['world-happiness-report-2021']
on Global_Education.[Countries and areas]=['world-happiness-report-2021'].[Country name]
order by [Ladder score] desc

---------Proficiency rates and Happiness
--------Determine if higher proficiency rates in reading and math correlate with higher happiness scores.
select [Countries and areas],
(Primary_End_Proficiency_Math + Primary_End_Proficiency_Reading+Lower_Secondary_End_Proficiency_Math+Primary_End_Proficiency_Reading)/4 as AVG_Proficiency,
[Ladder score]
from Global_Education
join ['world-happiness-report-2021']
on Global_Education.[Countries and areas]=['world-happiness-report-2021'].[Country name]
order by [Ladder score] desc

--------Out of school rates and Happiness
-------Examine the relationship between out-of-school rates at various education levels and happiness scores.
select [Countries and areas],OOSR_Lower_Secondary_Age_Female,
OOSR_Lower_Secondary_Age_Male,OOSR_Pre0Primary_Age_Female,
OOSR_Pre0Primary_Age_Male,OOSR_Primary_Age_Female,OOSR_Primary_Age_Male,
OOSR_Upper_Secondary_Age_Female,OOSR_Upper_Secondary_Age_Male,[Ladder score]
from Global_Education
join ['world-happiness-report-2021']
on Global_Education.[Countries and areas]=['world-happiness-report-2021'].[Country name]
order by [Ladder score] desc


------GDP per Capita  and Happiness
-------Investigate the correlation between GDP per capita and happiness scores.
select [Country name],[Logged GDP per capita],[Ladder score]
from ['world-happiness-report-2021']
order by [Ladder score] desc


---------Social Support and Hapiness
------ shows how social support influences happiness scores.
SELECT [Country name], [Social support],[Ladder score]
FROM ['world-happiness-report-2021']
ORDER BY [Ladder score] DESC


-----Impact of Education on Economic factors
--------shows how education completion rates influence GDP per capita.
select [Countries and areas],
(Completion_Rate_Lower_Secondary_Female+Completion_Rate_Lower_Secondary_Male+
Completion_Rate_Primary_Female+Completion_Rate_Primary_Male+
Completion_Rate_Upper_Secondary_Female+Completion_Rate_Upper_Secondary_Male)/6 as AVG_completion,
[Logged GDP per capita]
from Global_Education
join ['world-happiness-report-2021']
on Global_Education.[Countries and areas]=['world-happiness-report-2021'].[Country name]
order by AVG_completion desc,[Logged GDP per capita] desc


---------Regional differences in GDP per capita
-------Compare average GDP per capita across different regions
select [Regional indicator],AVG([Logged GDP per capita])as AVG_GDP
from ['world-happiness-report-2021']
group by [Regional indicator]
order by AVG_GDP

-------Corelation of Happiness with Education And Health 
--------shows  how a combination of education and health factors correlate with happiness scores.
select [Countries and areas],
(Completion_Rate_Lower_Secondary_Female+Completion_Rate_Lower_Secondary_Male+
Completion_Rate_Primary_Female+Completion_Rate_Primary_Male+
Completion_Rate_Upper_Secondary_Female+Completion_Rate_Upper_Secondary_Male)/6 as AVG_Completion,
[Healthy life expectancy],[Ladder score]
from Global_Education
join ['world-happiness-report-2021']
on Global_Education.[Countries and areas]=['world-happiness-report-2021'].[Country name]
order by AVG_Completion desc,[Healthy life expectancy] desc


-------Impact of Education Proficiency on economic developent 
----------Examine the relationship between education proficiency rates and GDP per capita.
select [Countries and areas],
(Primary_End_Proficiency_Math+Primary_End_Proficiency_Reading+
Lower_Secondary_End_Proficiency_Math+Lower_Secondary_End_Proficiency_Reading)/4 as AVG_proficiency,
[Logged GDP per capita]
from Global_Education
join ['world-happiness-report-2021']
on Global_Education.[Countries and areas]=['world-happiness-report-2021'].[Country name]
order by AVG_proficiency desc,[Logged GDP per capita] desc


----------Impact of freedom on economic development 
-----Assess the relationship between freedom to make life choices and GDP per capita.
select [Country name],[Freedom to make life choices],[Logged GDP per capita]
from ['world-happiness-report-2021']
order by [Freedom to make life choices] desc


---------Gender disparities in Happiness and Education
------Examine the impact of gender disparities in education completion rates on happiness scores.
select [Countries and areas],
Completion_Rate_Lower_Secondary_Female,Completion_Rate_Lower_Secondary_Male,
Completion_Rate_Primary_Female,Completion_Rate_Primary_Male,
Completion_Rate_Upper_Secondary_Female,Completion_Rate_Upper_Secondary_Male,
[Ladder score]
from Global_Education
join ['world-happiness-report-2021']
on Global_Education.[Countries and areas]=['world-happiness-report-2021'].[Country name]
order by [Ladder score] desc


----------Overall Education and Happiness Comparison
----------- Compare countries with the highest combined education completion rates and happiness scores
select top 10 [Countries and areas],
(Completion_Rate_Lower_Secondary_Female+Completion_Rate_Lower_Secondary_Male+
Completion_Rate_Primary_Female+Completion_Rate_Primary_Male+
Completion_Rate_Upper_Secondary_Female+Completion_Rate_Upper_Secondary_Male)/6 as AVG_completion,
[Ladder score]
from Global_Education
join ['world-happiness-report-2021']
on Global_Education.[Countries and areas]=['world-happiness-report-2021'].[Country name]
order by AVG_completion desc, [Ladder score] desc


--------Top performer Analysis 
 --------- analyze top performers in happiness, education, health, and economic factors.
 select top 10 [Countries and areas],
Completion_Rate_Lower_Secondary_Female,Completion_Rate_Lower_Secondary_Male,
Completion_Rate_Primary_Female,Completion_Rate_Primary_Male,
Completion_Rate_Upper_Secondary_Female,Completion_Rate_Upper_Secondary_Male,
[Ladder score],[Logged GDP per capita],[Healthy life expectancy],[Social support],[Freedom to make life choices]
from Global_Education
join ['world-happiness-report-2021']
on Global_Education.[Countries and areas]=['world-happiness-report-2021'].[Country name]
order by  [Ladder score] desc


-------countries with the highest hapiness score
SELECT top 10
    "Country name", 
    "Ladder score"
FROM ['world-happiness-report-2021']
ORDER BY "Ladder score" DESC


---------least hapiness score
SELECT top 10
    "Country name", 
    "Ladder score"
FROM ['world-happiness-report-2021']
ORDER BY "Ladder score" asc

-------Analysis of Top 10 Countries with the Highest Average Proficiency Rates and Their Happiness Scores

WITH ProficiencyRates AS (
    SELECT 
        "Countries and areas",
        (Primary_End_Proficiency_Math + Primary_End_Proficiency_Reading + 
         Lower_Secondary_End_Proficiency_Math + Lower_Secondary_End_Proficiency_Reading) / 4 AS Avg_Proficiency
    FROM Global_Education
)
SELECT top 10
    "Countries and areas",
    Avg_Proficiency,
    "Ladder score",
    "Logged GDP per capita",
    "Social support",
    "Healthy life expectancy",
    "Freedom to make life choices"
FROM ['world-happiness-report-2021']
JOIN ProficiencyRates 
ON ['world-happiness-report-2021'].[Country name]= ProficiencyRates.[Countries and areas]
ORDER BY Avg_Proficiency DESC

----------Analysis of  the worst 10 Countries with the Highest Average Proficiency Rates and Their Happiness Scores
with proficiency_rates as 
(
select [Countries and areas],
(Lower_Secondary_End_Proficiency_Math+Primary_End_Proficiency_Math+
Primary_End_Proficiency_Reading+Lower_Secondary_End_Proficiency_Reading)/4 as AVG_proficiency
from Global_Education
)
select top 10
[Countries and areas],AVG_proficiency,
[Ladder score],[Logged GDP per capita],
[Social support],[Healthy life expectancy],
[Freedom to make life choices]
from ['world-happiness-report-2021']
join proficiency_rates
on ['world-happiness-report-2021'].[Country name]=proficiency_rates.[Countries and areas]
order by AVG_proficiency asc


----------Analysis of Factors Contributing to High Happiness Scores in Top 20 Countries
WITH TopHappiness AS (
    SELECT top 20
        [Country name],
        [Ladder score],
        [Logged GDP per capita],
        [Social support],
        [Healthy life expectancy],
        [Freedom to make life choices]
    FROM ['world-happiness-report-2021']
    ORDER BY "Ladder score" DESC
    
)
SELECT 
    [Country name],
    [Ladder score],
    [Logged GDP per capita],
    [Social support],
    [Healthy life expectancy],
    [Freedom to make life choices],
    AVG([Logged GDP per capita]) OVER() AS Avg_GDP_Top20,
    AVG([Social support]) OVER() AS Avg_Social_Support_Top20,
    AVG([Healthy life expectancy]) OVER() AS Avg_Health_Top20,
    AVG([Freedom to make life choices]) OVER() AS Avg_Freedom_Top20
FROM TopHappiness



---------- Countries with High Happiness and Low Completion Rates: Identifying Outliers

with Number_of_completion as 
(
select [Countries and areas],
(Completion_Rate_Lower_Secondary_Female+Completion_Rate_Lower_Secondary_Male+
Completion_Rate_Primary_Female+Completion_Rate_Primary_Male+
Completion_Rate_Upper_Secondary_Female+Completion_Rate_Upper_Secondary_Male) as AVG_completion_rate

from Global_Education
),
HighHappinessLowCompletion as (
select [Countries and areas],AVG_completion_rate,[Ladder score]
from Number_of_completion
join ['world-happiness-report-2021']
on Number_of_completion.[Countries and areas]=['world-happiness-report-2021'].[Country name]
where [Ladder score]>(select avg([Ladder score]) from ['world-happiness-report-2021'])
and AVG_completion_rate<(select avg(AVG_completion_rate) from Number_of_completion)) 

SELECT 
    [Countries and areas],
   HighHappinessLowCompletion .[Ladder score],
    [Logged GDP per capita],
    [Social support],
    [Healthy life expectancy],
   [Freedom to make life choices]
FROM HighHappinessLowCompletion
JOIN ['world-happiness-report-2021']
ON HighHappinessLowCompletion.[Countries and areas]=['world-happiness-report-2021'].[Country name]
ORDER BY [Ladder score] desc
