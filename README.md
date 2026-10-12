# 🏃 STRAVA FITNESS DATA ANALYTICS CASE STUDY

### Transforming Fitness Data into Actionable Insights

[![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)](https://pandas.pydata.org/)
[![Google Colab](https://img.shields.io/badge/Google_Colab-F9AB00?style=for-the-badge&logo=googlecolab&logoColor=black)](https://colab.research.google.com/)

---

## 📌 Project Overview

The **STRAVA FITNESS DATA ANALYTICS CASE STUDY** explores fitness and physical activity data to identify user behavior patterns, daily activity trends, and opportunities to improve engagement and wellness.

Using Python, SQL, and data visualization, this project follows an end-to-end analytical workflow, from data cleaning and validation to exploratory data analysis (EDA), insight generation, and business recommendations.

The goal is to transform raw activity data into meaningful insights that support data-driven decisions for fitness tracking and wellness applications.

## 🎯 Project Objectives

- Analyze daily activity, step counts, distance, and calories burned.
- Examine recorded sleep patterns and activity levels.
- Identify trends in user behavior and activity participation.
- Evaluate activity levels against relevant fitness benchmarks.
- Explore relationships between activity, distance, calories, and sleep.
- Develop actionable recommendations for user engagement and retention.

## 🛠️ Tools & Technologies

| Technology | Purpose |
|---|---|
| Python | Data analysis and processing |
| Pandas | Data cleaning and manipulation |
| NumPy | Numerical calculations |
| Matplotlib | Statistical and exploratory visualizations |
| Seaborn | Distribution and relationship analysis |
| Plotly | Interactive visualizations, if used |
| MySQL | Data validation, querying, and analysis |
| Google Colab | Cloud-based notebook development |
| Git & GitHub | Version control and project documentation |

## 📂 Project Structure

```text
strava-fitness-data-analytics-case-study/
│
├── data/
│   └── README.md
│
├── notebooks/
│   └── fitness_data_analysis.ipynb
│
├── sql/
│   └── fitness_data_analysis.sql
│
├── dashboardScreenshot/
│   └── README.md
│
├── reports/
│   └── README.md
│
├── README.md
├── requirements.txt
└── .gitignore
```

*The structure above is a template. Replace example filenames with your actual project files.*

## 🔄 Analytical Workflow

### 1. Data Understanding
- Inspect dataset structure, columns, and data types.
- Review the number of records and available activity metrics.
- Identify missing values and potential quality issues.

### 2. Data Cleaning & Validation
- Check for duplicate records.
- Handle missing and inconsistent values appropriately.
- Validate data types and date fields.
- Confirm data quality before analysis.

### 3. Exploratory Data Analysis
- Analyze distributions and summary statistics.
- Explore daily activity and movement patterns.
- Compare activity metrics across users.
- Investigate relationships between key variables.

### 4. SQL Analysis
- Validate record counts and data quality.
- Calculate summary metrics using aggregate queries.
- Analyze user activity and behavioral patterns.
- Extract insights using filtering, grouping, and joins where appropriate.

### 5. Visualization & Insights
- Build charts to communicate important patterns.
- Compare activity metrics against suitable benchmarks.
- Translate analytical observations into recommendations.

## 📊 Key Performance Indicators

| KPI | Analytical Purpose |
|---|---|
| Total Users | Understand dataset coverage |
| Average Daily Steps | Evaluate daily movement |
| Average Sleep Duration | Examine recorded sleep behavior |
| Average Calories Burned | Understand recorded energy expenditure |
| Average Distance Covered | Measure movement patterns |
| Peak Activity Hour | Identify periods of higher activity |

> **Note:** KPI values should be populated from the validated analysis. The peak activity hour requires timestamped activity data, and sleep metrics should only be reported for records where sleep was actually measured.

## 📈 Key Business Questions

1. How active are users on a typical day?
2. What patterns emerge in daily step counts and distance covered?
3. How does recorded activity vary across users and time periods?
4. What patterns are visible in sleep duration and activity levels?
5. Which user segments may benefit from personalized activity goals?
6. How can fitness applications encourage consistent engagement?

## 💡 Business Recommendations

| Business Area | Recommendation | Expected Benefit |
|---|---|---|
| Engagement | Introduce personalized activity goals | Encourage consistent activity |
| Motivation | Implement challenges and rewards | Increase participation |
| Notifications | Provide relevant activity reminders | Support daily habits |
| Wellness | Offer evidence-based sleep education | Improve wellness awareness |
| Segmentation | Group users by observed activity patterns | Enable targeted experiences |
| Retention | Track changes in engagement over time | Identify opportunities to improve retention |

*These are proposed recommendations. Their actual impact would need to be measured through product analytics or controlled experiments.*

## 📦 Project Deliverables

- Python analysis notebook
- SQL scripts for data validation and analysis
- Exploratory data visualizations
- KPI summary and analytical findings
- Final project report
- Dashboard screenshots, if applicable
- Business recommendations

## 🚀 Getting Started

### Prerequisites

- Python 3.10 or a compatible version
- Jupyter Notebook or Google Colab
- MySQL Server and MySQL Workbench, if running SQL analysis locally

### Installation

Clone the repository:

```bash
git clone https://github.com/YOUR-USERNAME/strava-fitness-data-analytics-case-study.git
```

Navigate to the project directory:

```bash
cd strava-fitness-data-analytics-case-study
```

Create a virtual environment:

```bash
python -m venv .venv
```

Activate the environment on Windows:

```bash
.venv\Scripts\activate
```

Install the required libraries:

```bash
pip install -r requirements.txt
```

Launch Jupyter Notebook:

```bash
jupyter notebook
```

Open the analysis notebook in the `notebooks/` directory.

### SQL Setup

1. Start MySQL Server.
2. Create the required database.
3. Import the source tables or CSV files.
4. Update table names and file paths if necessary.
5. Execute the SQL script in the `sql/` directory.

Follow the setup instructions in the actual SQL file if they differ from these steps.

## 📸 Dashboard & Visualizations

Add your project screenshots to `dashboardScreenshot/` and link them below.

Example:

```markdown
![Executive Overview](dashboardScreenshot/Executive%20Overview.png)
```

Ensure the image filenames and capitalization match the files uploaded to GitHub.

## 📁 Dataset & Data Privacy

Document the actual dataset provider, source URL, collection period, available fields, license, and any usage restrictions.

If the analysis uses the Fitbit-based Bellabeat case-study dataset, identify it accurately rather than attributing it to Strava. The repository title should not imply that data came from Strava unless the source confirms this.

Do not upload private, sensitive, or restricted datasets. If redistribution is not permitted, provide dataset access instructions instead of the raw files.

## ⚠️ Limitations

- Findings depend on dataset completeness and accuracy.
- Observed associations do not establish causation.
- Results may not represent all fitness-app users.
- Recorded activity and sleep measurements may not capture the complete picture of an individual's wellness.
- Business recommendations require further validation before implementation.

## 🔮 Future Enhancements

- Develop an interactive fitness analytics dashboard.
- Add time-series analysis of activity trends.
- Introduce user segmentation based on activity behavior.
- Build predictive models where appropriate data is available.
- Evaluate engagement strategies using measurable outcomes.

## 👤 Author

**Ayush Dash**

Data Analytics | Python | SQL | Exploratory Data Analysis | Data Visualization

GitHub: [AyushDash](https://github.com/Ayushdash02)

---

## ⭐ Acknowledgements

Thanks to the dataset providers and the open-source Python and SQL communities whose tools support data analytics and visualization.

---

*If you find this project useful, consider giving the repository a star.*
