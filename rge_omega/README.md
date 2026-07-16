These scripts run the Run Group E analyses for the omega meson on the JLab farm.

<h2>Requirements</h2>
<u>
<li>Jefferson Lab environment with CLAS12 software stack:
'module load clas12'
</li>  
<li>SWIF2 workflow manager (/usr/bin/swif2)</li>
<li>Access to the JLab /volatile and /work storage areas.</li>
</ul>

<h2>Usage for Large Batch Jobs</h2>
<ol>
<li>Edit paths in scripts/generate_batch_jobs.sh if needed:</li>
  <ul>
    <li>INPUT_BASE_DIR – base directory with input .hipo files</li>
    <li>SKIMMED_DIR – where outputs will be written</li>
  </ul>  
<li>Run the script to generate a SWIF2 JSON workflow:</li>
cd scripts
./generate_batch_jobs.sh
<li>Import and submit the workflow to the JLab farm:</li>
swif2 import -file <file_name>.json
swif2 run <workflow-name>
<li>Monitor jobs:</li>
swif2 status <workflow-name> -jobs
</ol>
