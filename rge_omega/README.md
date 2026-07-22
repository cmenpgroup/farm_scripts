These scripts run the Run Group E analyses for the omega meson on the JLab farm.

# Requirements
<ul>
<li>Jefferson Lab environment with CLAS12 software stack: 

```
module load clas12
```

</li>  
<li>SWIF2 workflow manager (/usr/bin/swif2)</li>
<li>Access to the JLab /volatile and /work storage areas.</li>
</ul>

# Usage 
## Large Batch Jobs
1. Edit paths in scripts/generate_batch_jobs_omega.sh if needed:</li>
  * INPUT_BASE_DIR – base directory with input .hipo files</li>
  * SKIMMED_DIR – where outputs will be written</li>  
2. Run the script to generate a SWIF2 JSON workflow:</li>
  
```  
cd farm_scripts/rge_omega   
./generate_batch_jobs_omega.sh
```

## Job for Single Run Number
1. Edit paths in scripts/generate_single_job_omega.sh if needed:
  * INPUT_BASE_DIR – base directory with input .hipo files
  * SKIMMED_DIR – where outputs will be written
2. Run the script to generate a SWIF2 JSON workflow:
  
```  
cd farm_scripts/rge_omega   
./generate_simple_job_omega.sh <Run>
```

## Job for Single File
1. Edit paths in scripts/generate_single_file_omega.sh if needed:
  * INPUT_BASE_DIR – base directory with input .hipo files
  * SKIMMED_DIR – where outputs will be written
2. Run the script to generate a SWIF2 JSON workflow:
  
```  
cd farm_scripts/rge_omega   
./generate_simple_file_omega.sh <Run> <File Extension>
```

# To Submit a Job
* Import and submit the workflow to the JLab farm:

```
swif2 import -file <file_name>.json 
swif2 run <workflow-name>
```

* Monitor jobs:
  
```
swif2 status <workflow-name> -jobs
```

</ol>
