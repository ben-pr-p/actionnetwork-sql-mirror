#!/bin/bash
gcloud projects add-iam-policy-binding $(gcloud config get-value project) --member="user:ben.paul.ryan.packer@gmail.com" --role="roles/bigquery.jobUser" --condition=None
bq add-iam-policy-binding --member="user:ben.paul.ryan.packer@gmail.com" --role="roles/bigquery.dataViewer" "$(gcloud config get-value project):actionnetwork_cleaned"
