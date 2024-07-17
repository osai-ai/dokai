import matplotlib.pyplot as plt
import pandas as pd


bar_width = 0.35  # Width of the bars
versions = [
    "23.12-pytorch",
    "24.06-gpu.pytorch",
]


models = None
train_values, infer_values = [], []
for i, version in enumerate(versions):
    # Load the data from CSV file
    df = pd.read_csv(f"results/benchmark_float32_dokai:{version}.csv")

    # Extract the necessary data
    models = df["model"]

    train_values.append(df["train_samples_per_sec"])
    infer_values.append(df["infer_samples_per_sec"])

# Plotting
fig, axis = plt.subplots(1, 2, figsize=(16, 8))
for i in range(2):

    index = range(len(models))

    if i == 0:
        values = train_values
    else:
        values = infer_values

    axis[i].bar(index, values[0], bar_width, label=versions[0], color="blue")
    axis[i].bar([i + bar_width for i in index], values[1], bar_width, label=versions[1], color="green")

    # Adding labels and title
    axis[i].set_xlabel("Model")
    axis[i].set_ylabel("Samples per Second")
    if i == 0:
        axis[i].set_title(f"Training Samples per Second Comparison")
    else:
        axis[i].set_title(f"Inference Samples per Second Comparison")
    axis[i].set_xticks([i + bar_width / 2 for i in index])
    axis[i].set_xticklabels(models, rotation=45, ha="right")
    axis[i].legend()

# Adjust layout to fit labels
plt.tight_layout()

# Save the figure
plt.savefig("release_comparison.png")

# Show the plot
plt.show()
