# Exploring Facial Biomarkers for Depression through Temporal Analysis of Action Units

This repository contains the code and data for the paper [Exploring Facial Biomarkers for Depression through Temporal Analysis of Action Units](https://arxiv.org/abs/2407.13753).

## Overview

This project aims to identify potential facial biomarkers for depression by analyzing the temporal dynamics of facial action units (AUs). The analysis is performed using various machine learning techniques to evaluate the correlation between facial expressions and depressive states.

## Repository Structure

- `notebooks/`: Jupyter notebooks for data analysis, feature extraction, and modeling.
  - `data_preprocessing.ipynb`: Steps to preprocess the raw data.
  - `feature_extraction.ipynb`: Methods to extract temporal features from action units.
  - `model_training.ipynb`: Training and evaluation of machine learning models.
- `scripts/`: Python scripts for batch processing, generating events, and utility functions.
  - `batch_process.py`: Script to process data in batches.
  - `generate_events.py`: Script to generate events from session data.
  - `utils.py`: Utility functions used across the project.
- `data/`: CSV files with participant data and labels.
  - `participants.csv`: Information about the participants.
  - `labels.csv`: Labels indicating depressive states.

## Key Objectives

1. **Data Collection and Preprocessing**: Collect and preprocess facial video data to extract relevant action units.
2. **Feature Extraction**: Extract temporal features from action units to capture dynamic facial expressions.
3. **Model Development**: Develop and evaluate machine learning models to identify patterns associated with depression.
4. **Validation**: Validate the findings using statistical analysis and cross-validation techniques.

## Results
The results of this study include:

- Identification of specific facial action units that are significantly correlated with depressive states.
- Development of a predictive model with performance metrics detailed in the paper.
- Visualization of temporal patterns in facial expressions related to depression.

## Installation

To use this repository, clone it and install the required dependencies.

```bash
git clone https://github.com/ADE-17/Exploring-Facial-Biomarkers-for-Depression-through-Temporal-Analysis-of-Action-Units.git
cd Exploring-Facial-Biomarkers-for-Depression-through-Temporal-Analysis-of-Action-Units
pip install -r requirements.txt 
```

## Usage
- Preprocess the data using the scripts in the scripts/ directory.
- Run the Jupyter notebooks in the notebooks/ directory to perform the analysis and model training.

## Citation
If you use this code or data in your research, please cite our paper:
```bash
@misc{parikh2024exploringfacialbiomarkersdepression,
      title={Exploring Facial Biomarkers for Depression through Temporal Analysis of Action Units}, 
      author={Aditya Parikh and Misha Sadeghi and Bjorn Eskofier},
      year={2024},
      eprint={2407.13753},
      archivePrefix={arXiv},
      primaryClass={cs.CV},
      url={https://arxiv.org/abs/2407.13753}, 
}
```
## License
This project is licensed under the MIT License.

## Contact
For any questions or issues, please contact - adinparikh@gmail.com

