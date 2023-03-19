SELECT *
FROM PortfolioProject1..CovidDeaths
where continent is not null
order by 3,4

SELECT *
FROM PortfolioProject1..CovidVaccinations
order by 3,4

SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject1..CovidDeaths
where continent is not null
Order by 1,2

-- Looking at Total Cases vs Total Deaths
-- shows likelihood of dying if you have covid in your country

SELECT Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM PortfolioProject1..CovidDeaths
WHERE Location like '%states%' and total_cases is not null
Order by 1,2

--looking at total cases vs population 
-- shows what percentage of population got Covid

SELECT Location, date, Population,total_cases, (total_cases/population)*100 as DeathPercentage
FROM PortfolioProject1..CovidDeaths
WHERE Location like '%states%' and total_cases is not null
Order by 1,2

-- Look at Counties with highest infection rate compared to population

SELECT Location, Population, MAX(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as 
   PercentPopulationInfected
FROM PortfolioProject1..CovidDeaths
GROUP BY Location, Population
Order by PercentPopulationInfected desc


--Showing Countries with highest DeathCount per Population

SELECT Location, MAX(cast(Total_deaths as int)) AS TotalDeathCount
FROM PortfolioProject1..CovidDeaths
WHERE Continent is not null
GROUP BY Location
Order by TotalDeathCount desc

-- Break things down by Continent

SELECT continent, MAX(cast(Total_deaths as int)) AS TotalDeathCount
FROM PortfolioProject1..CovidDeaths
WHERE continent is not null
GROUP BY continent
Order by TotalDeathCount desc

-- global Numbers 

SELECT SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/Sum(new_cases)*100 as DeathPercentage
FROM PortfolioProject1..CovidDeaths
WHERE Continent is not null
ORDER BY 1,2


-- Looking at total population vs vaccinations
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(convert(int,vac.new_vaccinations)) OVER (partition by dea.location ORDER BY dea.location, dea.date) as RollingPeopleVaccinated
, (RollingPeopleVaccinated/population)*100
from PortfolioProject1..CovidDeaths as dea
JOIN PortfolioProject1..CovidVaccinations as vac
	on dea.location = vac.location
	and dea.date= vac.date
WHERE dea.continent is not null
order by 2,3


--Use CTE 

With PopvsVac (Continent, Location, date, Population, New_vaccinations, RollingPeopleVaccinated)
as 
(
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(convert(int,vac.new_vaccinations)) OVER (partition by dea.location ORDER BY dea.location, dea.date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
from PortfolioProject1..CovidDeaths as dea
JOIN PortfolioProject1..CovidVaccinations as vac
	on dea.location = vac.location
	and dea.date= vac.date
WHERE dea.continent is not null
--order by 2,3
)
select *, (RollingPeopleVaccinated/Population)*100
From PopvsVac

drop table if exists #PercentPopulationVaccinated
Create table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVacinated numeric
)

INSERT INTO #PercentPopulationVaccinated
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(convert(int,vac.new_vaccinations)) OVER (partition by dea.location ORDER BY dea.location, dea.date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
from PortfolioProject1..CovidDeaths as dea
JOIN PortfolioProject1..CovidVaccinations as vac
	on dea.location = vac.location
	and dea.date= vac.date
WHERE dea.continent is not null
order by 2,3

select *, (RollingPeopleVaccinated/Population)*100
From #PercentPopulationVaccinated


--Creating View to store data for later visualizations

Create View PercentPopulationVaccinated as 
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(convert(int,vac.new_vaccinations)) OVER (partition by dea.location ORDER BY dea.location, dea.date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
from PortfolioProject1..CovidDeaths as dea
JOIN PortfolioProject1..CovidVaccinations as vac
	on dea.location = vac.location
	and dea.date= vac.date
WHERE dea.continent is not null
--order by 2,3


SELECT * 
FROM PercentPopulationVaccinated