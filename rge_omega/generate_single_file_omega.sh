#!/bin/bash

RUN=$1
EXT=$2

# Define variables
INPUT_BASE_DIR="/cache/clas12/rg-e/production/spring2024/pass1/torus-1/Pb_D2/dst/recon/$RUN"
SKIMMED_DIR="/work/clas12/mikewood/rg-e/skims/omega"
SKIMMED_FILE="$SKIMMED_DIR/omega_${RUN}_${EXT}_skim.hipo"

# JSON output
JSON_FILE="omega_pass1_0_$RUN_$EXT.json"

# Header
cat > "$JSON_FILE" <<EOF
{
  "name": "omega_pass1_0",
  "site": "jlab/enp",
  "max_dispatched": 500,
  "jobs": [
EOF

# Create the full command
cmd=$(cat <<EOF
hipo-utils -reduce -ct "REC::Particle://pid==211[GT]0//pid==-211[GT]0//pid==22[GT]1//pid==11&&i==0[EQ]1" -o $SKIMMED_FILE $INPUT_BASE_DIR/*_$RUN.evio.$EXT.hipo 
EOF
)

# Write job object
echo "    {" >> "$JSON_FILE"
echo "      \"name\": \"process_$RUN_$EXT\"," >> "$JSON_FILE"
echo "      \"constraint\": \"el9\"," >> "$JSON_FILE"
echo "      \"account\": \"clas12\"," >> "$JSON_FILE"
echo "      \"partition\": \"production\"," >> "$JSON_FILE"
echo "      \"shell\": \"/bin/bash\"," >> "$JSON_FILE"
echo "      \"cpu_cores\": \"1\"," >> "$JSON_FILE"
echo "      \"ram_bytes\": \"4294967296\"," >> "$JSON_FILE"
echo "      \"time_secs\": \"86400\"," >> "$JSON_FILE"
echo "      \"command\": [\"$(echo "$cmd" | sed 's/"/\\"/g')\"]" >> "$JSON_FILE"
echo -n "    }" >> "$JSON_FILE"

# Footer
echo "" >> "$JSON_FILE"
echo "  ]" >> "$JSON_FILE"
echo "}" >> "$JSON_FILE"

echo "✅ JSON batch job file created: $JSON_FILE"
