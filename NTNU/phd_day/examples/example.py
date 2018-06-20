"""Read in band beard lengths and calculating relation to church burning."""
import csv
import os


def read_file_and_do_calculations(file_path):
    """Function for reading band files and do the calculations.
    INPUT:
        file_path: The full path to the file
    Output:
        nothing
    """
    
    # Read the data
    with open(os.path.join(data_dir, fname)) as csvfile:
        reader = csv.DictReader(csvfile)
        total_beard_length = 0
        total_churches_burned = 0
        cummulative_age = 0
        band_members = 0
        for row in reader:
            total_beard_length += int(row["beard length"])
            total_churches_burned += int(row["churches burned"])
            cummulative_age += int(row["age"])
            band_members += 1

    # Do the calculations
    average_beard_length = total_beard_length/band_members
    churches_per_beard_length = total_churches_burned/total_beard_length
    average_age = cummulative_age/band_members

    print("Calculations done")


# Define data directory
data_dir = "../data"

# Define data file
fname = "blood_thirsty_janitors.csv"

# Do calculations
read_file_and_do_calculations(os.path.join(data_dir, fname))

# Define data file
fname = "evil_vikings.csv"

# Do calculations
read_file_and_do_calculations(os.path.join(data_dir, fname))

# Define data file
fname = "hungry_crusaders.csv"

# Do calculations
read_file_and_do_calculations(os.path.join(data_dir, fname))
