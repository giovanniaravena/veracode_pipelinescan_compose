#!/bin/sh 

# Edit here
policy="Policy_DESSEG"
binario="componenteporescanear.jar"


# Directories
pathbinario="../binarios/${binario}"
directorio="results"

# Copy credentials 
mkdir /root/.veracode
cp credentials /root/.veracode/credentials


# Download security policy in results folder
cd $directorio 
java -jar ../pipelinescan/pipeline-scan.jar --request_policy $policy

# Scan with pipelinescan (Summary results)
java -jar ../pipelinescan/pipeline-scan.jar --file $pathbinario --summary_output_file summary_results.txt

# Scan with pipelinescan (JSON results)
java -jar ../pipelinescan/pipeline-scan.jar --file $pathbinario --json_output_file json_results.json



tail -f /dev/null
