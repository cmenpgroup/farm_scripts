These scripts run the Run Group E analyses for the omega meson on the JLab farm.

Requirements
<u>
<li>Jefferson Lab environment with CLAS12 software stack:
module load clas12
</li>  
<li>SWIF2 workflow manager (/usr/bin/swif2)</li>li>
<li>Access to the JLab /volatile and /work storage areas.</li>li>
</ul>

Usage for Large Batch Jobs
Edit paths in scripts/generate_batch_jobs.sh if needed:
INPUT_BASE_DIR – base directory with input .hipo files
SKIMMED_DIR – where outputs will be written
Run the script to generate a SWIF2 JSON workflow:
cd scripts
bash generate_batch_jobs.sh
Import and submit the workflow to the JLab farm:
swif2 import -file <file_name>.json
swif2 run <workflow-name>
Monitor jobs:
swif2 status <workflow-name> -jobs
