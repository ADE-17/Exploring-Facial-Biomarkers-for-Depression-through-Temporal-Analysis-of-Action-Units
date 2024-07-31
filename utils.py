import os
import pandas as pd

def collect_event_data(rawdata_csv_path, timestamp_csv_path):
   data_raw = pd.read_csv(rawdata_csv_path)
   relevant_features = ['fac_AU01int', 'fac_AU02int', 'fac_AU04int', 'fac_AU05int',
       'fac_AU06int', 'fac_AU07int', 'fac_AU09int', 'fac_AU10int',
       'fac_AU12int', 'fac_AU14int', 'fac_AU15int', 'fac_AU17int',
       'fac_AU20int', 'fac_AU23int', 'fac_AU25int', 'fac_AU26int',
       'fac_AU45int', 'timestamp']
   data_df = data_raw[relevant_features]
   time_df = pd.read_csv(timestamp_csv_path)
   timestamps = {
   'start_exp' : 'start_01',
   'latency_start' : 'lat_instr_01',
   'latency_end' : 'lat_end',
   'ei_start' : 'ei_01',
   'ei_end' : 'ei_end',
   'coping_start' : 'coping_base-rating_start',
   'coping_end' : 'coping_end',
   'training_start' : 'training_start',
   'training_end' : 'training_end' 
   }
   rel_time_df = time_df[time_df['label'].isin(timestamps.values())]
   rel_time_df['label'] = rel_time_df['label'].map({v: k for k, v in timestamps.items()})
   rel_time_df.reset_index(drop=True, inplace=True)
   rel_time_df['timestamp'] = pd.to_datetime(rel_time_df['timestamp'], errors='coerce')
   rel_time_df.sort_values(by='timestamp', inplace=True)
   start_exp_index = rel_time_df[rel_time_df['label'] == 'start_exp'].index
   if not start_exp_index.empty:
      start_exp_index = start_exp_index[0]
      rel_time_df['time_since_start_exp'] = (rel_time_df['timestamp'] - rel_time_df.loc[start_exp_index, 'timestamp']).dt.total_seconds().round(2)
   else:
      rel_time_df['time_since_start_exp'] = float('NaN')
      
   events = ['latency', 'ei', 'coping', 'training']
      
   event_dfs = {}

   for event in events:
      event_start = rel_time_df[rel_time_df['label'] == f'{event}_start']
      event_end = rel_time_df[rel_time_df['label'] == f'{event}_end']
      
      if not event_start.empty and not event_end.empty:
         event_range = data_df[
               (data_df['timestamp'] >= event_start['time_since_start_exp'].iloc[0]) & 
               (data_df['timestamp'] <= event_end['time_since_start_exp'].iloc[0])
         ]
         
         event_range.reset_index(drop=True, inplace=True)
         
         event_dfs[event] = event_range
         
   return event_dfs