import csv
import random
import os
import sys

NUM_ROWS = 50


PEOPLE = ["NAME", "SURNAME", "AGE", "BALANCE"]

def generate_row():
    return {
        "NAME": random.choice(["ILYA","MATHEW","ALICE","VADIM","ARTUR"]),
        "SURNAME": random.choice(["MAZOXHIN","BYSTRITSKY","SHTEYNBERG","PAVLOV","TUYZUKOV"]),
        "AGE": round(random.uniform(0,20),2),
        "BALANCE": random.randint(0,100),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=PEOPLE)
    writer.writeheader()
    writer.writerows(rows)