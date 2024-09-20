-- Exploratory Data Analysis

SELECT * 
FROM layoffs_staging2;

SELECT * 
FROM layoffs_staging2;


SELECT MAX(total_laid_off), MAX(percentage_laid_off)  -- 1 represents 100
FROM layoffs_staging2;

SELECT *
FROM layoffs_staging2
where percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;
-- these are the companies that went completely under, or lost all of their employees 

SELECT *
FROM layoffs_staging2
where company = 'Amazon';

SELECT company, SUM(total_laid_off) 
FROM layoffs_staging2
Group By company
Order BY 2 desc;

SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;

SELECT industry, SUM(total_laid_off) 
FROM layoffs_staging2
Group By industry
Order BY 2 desc;

SELECT * 
FROM layoffs_staging2;

SELECT country, SUM(total_laid_off) 
FROM layoffs_staging2
Group By country
Order BY 2 desc;

SELECT YEAR(`date`), SUM(total_laid_off) 
FROM layoffs_staging2
Group By YEAR(`date`)
Order BY 1 desc;
-- maxm ppl in 2023 -> 125677

SELECT stage, SUM(total_laid_off) 
FROM layoffs_staging2
Group By stage
Order BY 2 desc;

SELECT SUBSTRING(`date`, 1,7) as `MONTH`, SUM(total_laid_off)
FROM layoffs_staging2
where SUBSTRING(`date`, 1,7) IS NOT NULL
GROUP by `MONTH`
order by 1 asc
;


WITH Rolling_Total AS
(
SELECT SUBSTRING(`date`, 1,7) as `MONTH`, SUM(total_laid_off) as total_off
FROM layoffs_staging2
where SUBSTRING(`date`, 1,7) IS NOT NULL
GROUP by `MONTH`
order by 1 asc
)
SELECT `MONTH`, SUM(total_off) OVER (ORDER BY `MONTH`) AS rolling_total
FROM Rolling_Total;



