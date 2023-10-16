import csv
import argparse
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Get argument
parser = argparse.ArgumentParser(description="A simple script with command-line arguments.")
parser.add_argument('--input', type=str, help="Input file")
args = parser.parse_args()
input_file = args.input

# Make CSV file
data = []
with open("./output_file/" + input_file, "r") as file:
    lines = file.read().split("\n")
    for line in lines:
        if line.strip():  # Skip empty lines
            parts = line.split()
            if parts[0] == "#":
                continue
            else:
                time = parts[0]
                counts = parts[1].replace(',', '')  # Remove comma from counts
                unit_event = parts[2]
                data.append([time, counts, unit_event])

with open("./output_csv/" + input_file, "w", newline="") as csv_file:
    csv_writer = csv.writer(csv_file)
    csv_writer.writerow(["time", "counts", "unit_events"])  # Write header
    csv_writer.writerows(data)  # Write data rows

# Make CSV file
data = pd.read_csv("./output_csv/" + input_file)  # Replace 'your_data_file.csv' with your actual file path
sns.set(style="darkgrid") 
plt.figure(figsize=(10, 6))
sns.lineplot(x='time', y='counts', data=data)   
plt.title('LLC-load-misses Over Time') 
plt.xlabel('Time')
plt.ylabel('Counts (LLC-load-misses)') 
plt.ylim(0, 1000000000) 
plt.savefig("./output_graph/" + input_file)
