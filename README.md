# FCRWQCD SEACAR Analysis
This project:
1. compares SEACAR standard exports to an aggregated dataset developed in previous years
2. generates rate of change analyses for each water quality parameter
3. creates a `dashboardDataSEACAR.csv` from the SEACAR standard export for use in the [FCRWQDC Data Visualization Tool](https://github.com/USF-IMARS/FCRWQDC_data_dashboard)

# Upstream Data
The following data sources should be downloaded and placed in `./data/`:
1. `Discrete WQ - 10006.txt` from [SEACAR standard export page](https://data.florida-seacar.org/programs/details/10006).
2. previous year's `dashboardData.csv` from [this gdrive folder](https://drive.google.com/drive/folders/1QMUpJOwfAMG9dB_fYT0Yva3IBVRg27fr) produced by [USF-IMARS/FCRWQDC_data_ingest](https://github.com/USF-IMARS/FCRWQDC_data_ingest/tree/main)

# Usage
## Setup
```R
pak::local_install_deps()
```

## Deployment
```bash
quarto publish
```

## Create a New Batch
1. Use create_batch R function:
    ```R
    source("create_batch.R")
    create_batch("testBatchName", "testExampleValue")
    ```
2. in the new {batch_name} folder, modify getData & getListOfValues to work with your data.
3. modify the {batch_name}/template.yml
4. `quarto publish`

----------------------------------------------------------------------------

# Attribution
This project is powered by the [quartobatch template](https://github.com/7yl4r/quartobatch).

----------------------------------------------------------------------------
