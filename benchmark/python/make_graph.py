import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Create a DataFrame from your data
data = pd.read_csv("./output_csv/bfs_migration")  # Replace 'your_data_file.csv' with your actual file path

# Create the line plot using seaborn
sns.set(style="darkgrid")
plt.figure(figsize=(10, 6))
sns.lineplot(x='time', y='counts', data=data)
plt.title('LLC-load-misses Over Time')
plt.xlabel('Time')
plt.ylabel('Counts (LLC-load-misses)')
plt.savefig('output_graph/bfs_migration_semi')
plt.show()
