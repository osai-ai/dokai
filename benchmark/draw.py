import matplotlib.pyplot as plt
import pandas as pd


width = 0.35  # Width of the bars
versions = ["23.12-pytorch", "24.06-gpu.pytorch"]


models = None
train_values, infer_values = [], []
for version in versions:
    # Load the data from CSV file
    df = pd.read_csv(f"results/benchmark_float32_dokai:{version}.csv")

    # Extract the necessary data
    models = df["model"]

    train_values.append(df["train_samples_per_sec"])
    infer_values.append(df["infer_samples_per_sec"])

indices = range(len(models))

# Plotting
fig, axis = plt.subplots(1, 2, figsize=(16, 8))
for i, (label, values) in enumerate([("Training", train_values), ("Inference", infer_values)]):

    axis[i].bar(indices, values[0], width, label=versions[0], color="blue")
    axis[i].bar([i + width for i in indices], values[1], width, label=versions[1], color="green")

    # Adding labels and title
    axis[i].set_xlabel("Model")
    axis[i].set_ylabel("Samples per Second")
    axis[i].set_title(f"{label} Samples per Second Comparison")
    axis[i].set_xticks([j + width / 2 for j in indices])
    axis[i].set_xticklabels(models, rotation=45, ha="right")
    axis[i].legend()

# Adjust layout to fit labels
plt.tight_layout()

# Save the figure
plt.savefig("release_comparison.png")

# Show the plot
plt.show()
