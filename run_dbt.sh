#!/bin/bash

# Animal Insights DBT Execution Script

# Default target is duckdb
TARGET="duckdb"

echo "Starting DBT workflow with target: $TARGET"

# Debug connection
echo "Debugging DBT connection..."
dbt debug --target $TARGET
if [ $? -ne 0 ]; then
  echo "Error: DBT debug failed. Please check your connection settings."
  exit 1
fi
echo "Debug successful!"

# Run DBT models
echo "Running DBT models..."
dbt run --target $TARGET
if [ $? -ne 0 ]; then
  echo "Error: DBT run failed. Exiting."
  exit 1
fi
echo "Models built successfully!"

# Run tests
echo "Running DBT tests..."
dbt test --target $TARGET
if [ $? -ne 0 ]; then
  echo "Warning: Some tests failed. Proceeding with caution."
else
  echo "All tests passed successfully!"
fi

# Generate and serve documentation
echo "Generating DBT documentation..."
dbt docs generate --target $TARGET
if [ $? -ne 0 ]; then
  echo "Error: Documentation generation failed. Exiting."
  exit 1
fi

echo "Documentation generated successfully!"
echo "Starting documentation server..."
echo "Documentation will be available at http://localhost:8080"
echo "Press Ctrl+C to stop the server when finished"
dbt docs serve
