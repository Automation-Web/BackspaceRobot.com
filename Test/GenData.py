import pandas as pd
import os
import random

# Create output directory
output_dir = "../Input"
if not os.path.exists(output_dir):
    os.makedirs(output_dir)

# Sample data
names = ["Amol", "Riya", "Neha", "Raj", "Simran", "Amit", "Priya", "Vikas", "Sneha", "Rohan"]
departments = ["QA", "Development", "HR", "Support", "Finance"]

# Desired row counts for each file
row_counts = [10, 15, 20, 35, 60]

# Loop through each count and create a separate Excel file
for idx in range(len(row_counts)):
    count = row_counts[idx]
    ids = list(range(1, count + 1))
    name_list = random.choices(names, k=count)
    emails = [f"user{i}@example.com" for i in ids]
    dept_list = random.choices(departments, k=count)

    df = pd.DataFrame({
        "ID": ids,
        "Name": name_list,
        "Email": emails,
        "Department": dept_list
    })

    file_name = f"TestData_File_{idx + 1}.xlsx"
    file_path = os.path.join(output_dir, file_name)
    df.to_excel(file_path, index=False)

print("✅ Successfully created 5 Excel test files with varying data rows.")