from utils import collect_event_data
import pandas as pd
import json
import os
import warnings

def create_directory(directory):
    if not os.path.exists(directory):
        os.makedirs(directory)
        
warnings.filterwarnings('ignore')

id_paths = pd.read_csv('/home/woody/iwso/iwso092h/empkins/notebooks/patient_id_paths_au.csv')

save_dir = '/home/vault/empkins/tpD/D02/Students/Aditya/facau_data'

for i in range(len(id_paths)):
    if id_paths['Presence_y'][i] == True:
        patient_id = id_paths['Patient ID'][i]
        patient_dir = os.path.join(save_dir, str(patient_id))
        create_directory(patient_dir)
        print(f'processing id - {patient_id}')
        json_data = collect_event_data(id_paths['Facemo CSV Path'][i], id_paths['App CSV Path'][i])
        
        for key, df in json_data.items():
            json_data_dict = df.to_dict(orient='records')
            
            output_file = os.path.join(patient_dir, f'{key}.json')
            
            with open(output_file, 'w') as f:
                json.dump(json_data_dict, f)