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
    "/home/vault/empkins/tpD/D02/RCT/raw_data/572/572_t2_20240229.mp4"
    "/home/vault/empkins/tpD/D02/RCT/raw_data/535/535_t2_20240227.mp4"
    "/home/vault/empkins/tpD/D02/RCT/raw_data/518/518_t2_20240214.mp4"
    "/home/vault/empkins/tpD/D02/RCT/raw_data/306/306_t2_20231208.mp4"
    "/home/vault/empkins/tpD/D02/RCT/raw_data/467/467_t2_20231219.mp4"
    "/home/vault/empkins/tpD/D02/RCT/raw_data/556/556_t2_20240229.mp4"
)

declare -a OUTPUT_PATHS=(
    "/home/vault/empkins/tpD/D02/processed_data/SonyCam_processed_data/572"
    "/home/vault/empkins/tpD/D02/processed_data/SonyCam_processed_data/535"
    "/home/vault/empkins/tpD/D02/processed_data/SonyCam_processed_data/518"
    "/home/vault/empkins/tpD/D02/processed_data/SonyCam_processed_data/306"
    "/home/vault/empkins/tpD/D02/processed_data/SonyCam_processed_data/467"
    "/home/vault/empkins/tpD/D02/processed_data/SonyCam_processed_data/556"

)

for ((i=0; i<${#INPUT_PATHS[@]}; i++)); do
    INPUT_PATH="${INPUT_PATHS[$i]}"
    OUTPUT_PATH="${OUTPUT_PATHS[$i]}"
    
    apptainer exec --writable-tmpfs /home/vault/empkins/tpD/D02/processed_data/SonyCam_processed_data/dbm-openface-2.sif /bin/bash -c "cd /app; python3 -W ignore /app/process_data.py --input_path $INPUT_PATH --output_path $OUTPUT_PATH"
done
