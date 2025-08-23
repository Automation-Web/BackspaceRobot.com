import os
from os.path import curdir

import pandas as pd
import math
import shutil

input_folder= "E:/MyWork/robotFramework/Input"
resource_folder = 'E:/MyWork/robotFramework/Test/Resource'
MAX_ROWS = 10

def split_and_move_files():
    if not os.path.exists(resource_folder):
        os.makedirs(resource_folder)

    for file in os.listdir(input_folder):
        if file.endswith('.xlsx'):
            file_path = os.path.join(input_folder, file)
            df = pd.read_excel(file_path)

            row_count = len(df)

            if row_count <= MAX_ROWS:
                new_path = os.path.join(resource_folder, file)
                shutil.copy(file_path, new_path)
            else:
                chunks = math.ceil(row_count / MAX_ROWS)
                for i in range(chunks):
                    chunk_df = df.iloc[i * MAX_ROWS: (i + 1) * MAX_ROWS]
                    chunk_name = f"{os.path.splitext(file)[0]}_part{i + 1}.xlsx"
                    chunk_path = os.path.join(resource_folder, chunk_name)
                    chunk_df.to_excel(chunk_path, index=False)

            # Delete original file after processing
            os.remove(file_path)

if __name__ == "__main__":
    split_and_move_files()