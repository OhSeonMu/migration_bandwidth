import csv
import argparse

# Create an argument parser
parser = argparse.ArgumentParser(description="A simple script with command-line arguments.")

# Define a command-line argument
parser.add_argument('--input', type=str, help="Input file")

# Parse the command-line arguments
args = parser.parse_args()

# Access the argument value
input_file = args.input



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

