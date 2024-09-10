#!/bin/bash

# Directory where your PDFs are located
input_dir="."

# Loop through all PDF files in the directory
for pdf in "$input_dir"/*.pdf; do
  # Extract filename without extension
  filename=$(basename "$pdf" .pdf)
  # Convert PDF to SVG using pdf2svg
  pdf2svg "$pdf" "${input_dir}/${filename}.svg"
  echo "Converted $pdf to ${filename}.svg"
done

