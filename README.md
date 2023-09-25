# Sqlprojects

**MySQL Analysis on 2022 FIFA World Cup Data**

I have conducted a MySQL analysis on the data from the 2022 FIFA World Cup. 
The focus of this analysis is to understand the dominance of the winning team, Argentina. 
To achieve this, I have analyzed four key components:

1) Goals Conceded and Goals Scored per Team: I have examined the number of goals conceded and goals 
scored by each team participating in the World Cup. This analysis provides insights into the offensive
and defensive capabilities of the teams.

2) Quality of Possession and its Distribution: I have explored the quality of possession by analyzing 
where possession was held most by the teams. This analysis sheds light on the teams' ability to 
maintain control over the ball and dictate the game.

3) Best Offensive Team: I have determined the best offensive team based on the goals scored and
the percentage of completed line breaks. This analysis highlights the teams that excelled in breaking 
through the opponent's defense and scoring goals.

4) Best Defensive Team: I have identified the best defensive team by considering the goals 
conceded and goal prevention per team. This analysis reveals the teams with a strong defensive strategy
and the ability to prevent goals effectively.

5) The Infamous "Group of Death": I have examined the group stage of the tournament and identified
the group with the highest level of competitiveness. I have analyzed which teams faced the 
toughest challenges and ultimately emerged as the most successful from this group. 

**RESOURCES:**

The data used for this analysis was obtained as a direct download from Kaggle. 
You can access the dataset at the following link: https://www.kaggle.com/datasets/die9origephit/fifa-world-cup-2022-complete-dataset?resource=download

In my analysis, I formatted the downloaded file and constructed three separate tables, 
namely Teams.csv, Matches.csv, and Stats.csv. These tables served as the foundation for running queries 
and extracting meaningful insights from the dataset.

To refer to the specific analysis and its corresponding data, please make use of the following documents:
1) Teams.csv: This document contains information about the participating teams.
2) Matches.csv: This document provides details about the matches played during the FIFA World Cup 2022, 
such as the teams involved, match dates, and final scores.
3) Stats.csv: This document encompasses various statistical measures related to the teams' performances, 
including goals scored, goals conceded, possession statistics, and other relevant metrics.

**Other tables**

To gain a comprehensive understanding of my MySQL analysis on the FIFA World Cup 2022 data, 
please refer to the MySQL file titled FIFA.sql. This file provides a step-by-step walkthrough of my analysis. 

The FIFA.sql file is divided into two sections:

Data Cleansing and Formatting: In this section, I focused on cleaning and formatting the data. 
I performed tasks such as creating standardized columns and addressing any anomalies present in the dataset. 
In addition, I created foreign and primary relations between the tables to ensure data consistency and accuracy, 
I set the foundation for reliable analysis.

Query Execution: The second section of the file involves running queries based on the four key components discussed earlier. 
These components were identified to understand the dominance of the winning team, Argentina. 
The tables produced from my query are as follows:
1) Offensive teams
2) defensive teams
3) goals scored vs conceded
4) group of death
5) quality of possession

**TABLEAU DASHBOARD:** 
