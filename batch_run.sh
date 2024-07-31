#!/bin/bash
#SBATCH --nodes=1                # node count
#SBATCH --ntasks=1               # total number of tasks across all nodes
#SBATCH --gres=gpu:0
#SBATCH --cpus-per-task=4        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem-per-cpu=8G         # memory per cpu-core (4G is default)
#SBATCH --time=24:00:00          # total run time limit (HH:MM:SS)
#SBATCH --mail-type=end          # send email when job ends
#SBATCH --mail-user=aditya.17.parikh@fau.de

export https_proxy=http://proxy:80
export http_proxy=http://proxy:80

declare -a INPUT_PATHS=(
    "/home/vault/empkins/tpD/D02/RCT/raw_data/337/337_t2_20231214.mp4"
    "/home/vault/empkins/tpD/D02/RCT/raw_data/325/325_t2_20240201.mp4"
    "/home/vault/empkins/tpD/D02/RCT/raw_data/321/321_t2_20231128.mp4"
    "/home/vault/empkins/tpD/D02/RCT/raw_data/438/438_t2_20231218.mp4"
    "/home/vault/empkins/tpD/D02/RCT/raw_data/476/476_t2_20240119.mp4"
    "/home/vault/empkins/tpD/D02/RCT/raw_data/511/511_t2_20240216.mp4"
)

declare -a OUTPUT_PATHS=(
    "/home/vault/empkins/tpD/D02/processed_data/SonyCam_processed_data/337"
    "/home/vault/empkins/tpD/D02/processed_data/SonyCam_processed_data/325"
    "/home/vault/empkins/tpD/D02/processed_data/SonyCam_processed_data/321"
    "/home/vault/empkins/tpD/D02/processed_data/SonyCam_processed_data/438"
    "/home/vault/empkins/tpD/D02/processed_data/SonyCam_processed_data/476"
    "/home/vault/empkins/tpD/D02/processed_data/SonyCam_processed_data/511"

)

for ((i=0; i<${#INPUT_PATHS[@]}; i++)); do
    INPUT_PATH="${INPUT_PATHS[$i]}"
    OUTPUT_PATH="${OUTPUT_PATHS[$i]}"
    
    apptainer exec --writable-tmpfs /home/vault/empkins/tpD/D02/processed_data/SonyCam_processed_data/dbm-openface-2.sif /bin/bash -c "cd /app; python3 -W ignore /app/process_data.py --input_path $INPUT_PATH --output_path $OUTPUT_PATH"
done
