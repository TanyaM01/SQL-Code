-- Data Cleaning

SELECT *
FROM layoffs;

-- 1. Remove Duplicates
-- 2. Stadardize the data
-- 3. Null Values or blank values
-- 4. Remove Any Columns that unnecessary

CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT *
FROM layoffs_staging;

INSERT layoffs_staging
SELECT * 
FROM layoffs;

-- 1. Removing Duplicates

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off,percentage_laid_off, `date` ) as row_num
FROM layoffs_staging;
-- if op has row_num 2 or above, that means there are duplicates

WITH duplicate_CTE AS 
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off,percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
where row_num > 1;

SELECT *
FROM layoffs_staging
where company = 'Casper';

-- remove only 1 duplicate

WITH duplicate_CTE AS 
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off,percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
FROM layoffs_staging
)
DELETE
FROM duplicate_cte
where row_num > 1;
-- the target table, duplicate_cte of the DELETE is not updatable

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_staging2;

INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off,percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
FROM layoffs_staging;

SELECT *
FROM layoffs_staging2
where row_num >1;

DELETE 
FROM layoffs_staging2
where row_num >1;

SELECT * 
FROM layoffs_staging2;


-- 2. Standardizing the data- finding issues in the data and then fixing it

SELECT company, 
(TRIM(company))
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = TRIM(company);

-- now look at industry
SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY 1;

SELECT *
FROM layoffs_staging2
where industry like 'CRYPTO%';

UPDATE layoffs_staging2
SET industry = 'Crypto'
where industry LIKE 'Crypto%';

SELECT DISTINCT industry
FROM layoffs_staging2;

SELECT DISTINCT location
FROM layoffs_staging2
ORDER BY 1;

SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1;

SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1;

UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
where country LIKE 'United States%';

-- date should be of date and time column data type

SELECT `date` ,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

SELECT `date`
FROM layoffs_staging2;

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

SELECT *
FROM layoffs_staging2;

-- 3. Null Values or blank values

SELECT *
FROM layoffs_staging2
where total_laid_off IS NULL
AND percentage_laid_off IS NULL;

UPDATE layoffs_staging2
SET industry = NULL
where industry = '';

SELECT *
FROM layoffs_staging2
where industry IS NULL
OR industry = '';

SELECT *
FROM layoffs_staging2
where company = 'Airbnb';


SELECT *
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON  t1.company = t2.company
    AND t1.location = t2.location
where (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

SELECT t1.industry, t2.industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON  t1.company = t2.company
    AND t1.location = t2.location
where (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON  t1.company = t2.company
    AND t1.location = t2.location
SET t1.industry = t2.industry
where t1.industry IS NULL 
AND t2.industry IS NOT NULL; 

SELECT *
FROM layoffs_staging2;

SELECT * 
FROM layoffs_staging2
where company LIKE 'Bally%';

SELECT *
FROM layoffs_staging2
where total_laid_off IS NULL
AND percentage_laid_off IS NULL;
-- we are going to get rid of these
DELETE
FROM layoffs_staging2
where total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging2;

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;