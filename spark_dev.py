from pyspark.sql import SparkSession
from pyspark.sql.functions import avg

# Initialize a SparkSession
spark = SparkSession.builder \
    .appName("hello") \
    .getOrCreate()


# Load data into a DataFrame
data = [
    {"name": "Alice", "age": 25, "city": "New York"},
    {"name": "Bob", "age": 17, "city": "San Francisco"},
    {"name": "Charlie", "age": 35, "city": "Los Angeles"},
    {"name": "David", "age": 15, "city": "Chicago"},
    {"name": "Eve", "age": 29, "city": "Miami"}
]

df = spark.createDataFrame(data)

# Show the original data
print("Original Data:")
df.show()

# Filter out rows where age is less than 18
adults_df = df.filter(df.age >= 18)

# Show filtered data
print("Adults Data:")
adults_df.show()

# Calculate the average age of adults
average_age = adults_df.agg(avg("age")).first()[0]
print(f"Average Age of Adults: {average_age}")

# Additional transformation: select specific columns and sort by age
result_df = adults_df.select("name", "age", "city").orderBy("age", ascending=False)

# Show the transformed data
print("Transformed Data:")
result_df.show()

# Stop the SparkSession
spark.stop()
