#!/bin/bash

# Function to display usage information
function display_usage {
    echo "Usage: $0 --repo <repository> --region <region> --file <file_name>"
}

REPOSITORY=""
REGION=""
FILE_NAME=""

# Parse named parameters using getopts
while [[ $# -gt 0 ]]; do
    case "$1" in
        --repo)
            REPOSITORY="$2"
            shift 2
            ;;
        --region)
            REGION="$2"
            shift 2
            ;;
        --file)
            FILE_NAME="$2"
            shift 2
            ;;
        *)
            echo "Invalid option: $1" >&2
            display_usage
            exit 1
            ;;
    esac
done

# Check if required parameters are provided
if [ -z "$REPOSITORY" ] || [ -z "$REGION" ] || [ -z "$FILE_NAME" ]; then
    echo "Error: All parameters (--repo, --region, and --file) are required."
    display_usage
    exit 1
fi

echo "REPOSITORY=$REPOSITORY"
echo "REGION=$REGION"
echo "FILE_NAME=$FILE_NAME"

# Read JSON data from the file
json_data=$(cat $FILE_NAME)

# Check if the file is not empty
if [ -n "$json_data" ]; then
    # Loop through the JSON array using jq and extract the "digest" values
    digests=$(echo "$json_data" | jq -r '.[] | .digest')

    # Loop through the extracted digests and process each one
    for digest in $digests; do
        echo "aws ecr batch-delete-image --repository-name $REPOSITORY --image-ids imageDigest=$digest --region $REGION"
        aws ecr batch-delete-image --repository-name $REPOSITORY --image-ids imageDigest=$digest --region $REGION
        # Add your desired processing here
    done
else
    echo "Error: The file 'digest_null.txt' is empty or doesn't exist."
fi

