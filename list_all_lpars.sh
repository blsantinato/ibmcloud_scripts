#!/bin/bash
# Get list of Workspaces
workspaces_all=$(ibmcloud pi workspace list |awk {'print $1'} |grep -v CRN)

for group in $workspaces_all; do
    echo "Workspace: $group"
# Target the resource group
    ibmcloud pi workspace target "$group"
    
    # List all LPARs in the resource group
    ibmcloud pi instance list
    echo ""
done
