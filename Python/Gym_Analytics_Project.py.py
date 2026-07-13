"""
====================================================
GYM ANALYTICS PROJECT
====================================================

Tools Used:
- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn

Dataset:
Gym Analytics Dataset

Author:
Rahul Yadav
"""


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns


file_path = r"../Excel/Gym_Analytics_Dataset.xlsx.xlsx"

# excel_file = pd.ExcelFile(file_path)

# print(excel_file.sheet_names)
members = pd.read_excel(file_path, sheet_name="Members")
attendance = pd.read_excel(file_path, sheet_name="Attendance")
payments = pd.read_excel(file_path, sheet_name="Payments")
trainers = pd.read_excel(file_path, sheet_name="Trainers")
membership = pd.read_excel(file_path, sheet_name="Membership Plans")
workout = pd.read_excel(file_path, sheet_name="workoutsessin")
body = pd.read_excel(file_path, sheet_name="BodyMeasurement")
nutrition = pd.read_excel(file_path, sheet_name="Nutrition")
feedback = pd.read_excel(file_path, sheet_name="FeedBack")

# print("Members:", members.shape)
# print("Attendance:", attendance.shape)
# print("Payments:", payments.shape)
# print("Trainers:", trainers.shape)
# print("Membership:", membership.shape)
# print("Workout:", workout.shape)
# print("Body:", body.shape)
# print("Nutrition:", nutrition.shape)
# print("Feedback:", feedback.shape)

#What is the total number of members, and what percentage are Active vs Inactive?
# total_members = len(members)
# print("Total Members:", total_members)
# status_count = members["Status"].value_counts()
# print("Status Counts:", status_count)

# status_percentage=members["Status"].value_counts(normalize=True)*100
# print("Status Percentage:", status_percentage)

# status_count = members["Status"].value_counts()
# status_count.plot(
#     kind="bar",
#     figsize=(6,4)
#     )
# plt.title("Active vs Inactive Members")
# plt.xlabel("Membership Status")
# plt.ylabel("Numbers of Members")
# plt.show()


#Which city has the highest number of members?
# city_count=members["City"].value_counts()
# print(city_count)

# city_count.plot(
#     kind="bar",
#     figsize=(8,5)
# )
# plt.title("Members by City")
# plt.xlabel("City")
# plt.ylabel("Numbers of Members")
# plt.savefig(
#     "MembersbyCity.png",
#     dpi=300,
#     bbox_inches="tight"
# )
# plt.show()

#What is the gender distribution of gym members?
# gender_count=members["Gender"].value_counts()
# print(gender_count)

# gender_df=gender_count.reset_index()#convert series into dataframe
# print(gender_df)
# gender_df.columns=["Gender","Count"]

# sns.barplot(
#     data=gender_df,
#     x="Gender",
#     y="Count"
# )
# plt.title("Gender Distribution")
# plt.show()

#What are the most common fitness goals of gym members?
fitness_count=members["FitnessGoal"].value_counts()
# print(fitness_count)
fitness_df=fitness_count.reset_index()
# print(fitness_df)
fitness_df.columns=["Fitness Goal","Count"]

# plt.figure(figsize=(8,5))

# sns.barplot(
#     data=fitness_df,
#     x="Fitness Goal",
#     y="Count"
# )

# plt.title("Fitness Goal Distribution")
# plt.xlabel("Fitness Goal")
# plt.ylabel("Number of Members")

# plt.show()

# print(members.columns)
# print(membership.columns)

#Which membership plan is the most popular?
# member_plan=pd.merge(
#     members,
#     membership,
#     on="MembershipID"
# )
# plan_count=member_plan["PlanName"].value_counts()
# # print(plan_count)

# plt.figure(figsize=(8,5))
# plt.hist(
#     members["Age"],
#     bins=10,
#     edgecolor="black"
# )
# plt.title("Age Distribution of Members")
# plt.xlabel("Age")
# plt.ylabel("Number of Members")
# plt.savefig(
#     "Age Distribution of Members",
#     dpi=300,
#     bbox_inches="tight"
# )
# plt.show()

#Which trainer handles the highest number of members?
# trainer_member=pd.merge(
#     members,
#     trainers,
#     on="TrainerID"
# )
# trainer_count=trainer_member.groupby("TrainerName")["MemberID"].count()
# print(trainer_count)

# trainer_count.plot(
#     kind="bar",
#     figsize=(8,5)
# )
# plt.title("Number of Members Handled by Each Trainer")

# plt.xlabel("TrainerName")
# plt.ylabel("Count")
# plt.show()


#Which membership plan generates the highest revenue?
# print(membership.columns)
# print(payments.columns)

# revenue_membership=pd.merge(
#     membership,
#     payments,
#     on="MembershipID"
# )
# revenue=revenue_membership.groupby("PlanName")["FinalAmount"].sum()
# print(revenue.idxmax())

#Is the gym's revenue increasing or decreasing over time?


# print(payments.columns)
# print(payments.dtypes)

# payments["Month"] =payments["PaymentDate"].dt.month_name()
# # print(payments["Month"])

# Gym_revenue=payments.groupby("Month")["FinalAmount"].sum()
# print(Gym_revenue)

# plt.figure(figsize=(10,5))

# Gym_revenue.plot(
#     kind="line",
#     marker="o"
# )

# plt.title("Monthly Revenue Trend")
# plt.xlabel("Month")
# plt.ylabel("Revenue")
# plt.savefig(
#     "Monthly Revenue Trend",
#     dpi=300,
#     bbox_inches="tight"
# )
# plt.show()


