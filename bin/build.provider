#!/usr/bin/env bash

# Ensure PROJECT_ROOT is set
if [[ -z "$PROJECT_ROOT" ]]; then
  echo "PROJECT_ROOT environment variable is not set. Exiting."
  exit 1
fi

# Set the plugin directory and name
PLUGIN_DIR="/home/gitpod/.terraform.d/plugins/local.providers/local/terratowns/1.0.0"
PLUGIN_NAME="terraform-provider-terratowns_v1.0.0"

# # Debugging: Print variable values
# echo "PROJECT_ROOT: $PROJECT_ROOT"
# echo "PLUGIN_DIR: $PLUGIN_DIR"

# Copy the terraformrc to the appropriate location
echo "Copying terraformrc..."
cp "$PROJECT_ROOT/terraformrc" "/home/gitpod/.terraformrc"

# Remove any existing plugin directory and lock files
echo "Removing existing plugin directory and lock files..."
rm -rf "/home/gitpod/.terraform.d/plugins"
rm -rf "$PROJECT_ROOT/.terraform"
rm -rf "$PROJECT_ROOT/.terraform.lock.hcl"

# Build the provider
cd "$PROJECT_ROOT/terraform-provider-terratowns" || exit
echo "Building the provider..."
go build -o "$PLUGIN_NAME"

# Prepare the plugin directory structure
echo "Creating directories..."
mkdir -p "$PLUGIN_DIR/x86_64" && echo "Created x86_64 directory."
mkdir -p "$PLUGIN_DIR/linux_amd64" && echo "Created linux_amd64 directory."

# # Debugging: Check if directories exist
# ls -R "$PLUGIN_DIR"

# Copy the provider binary to the appropriate directories
echo "Copying the provider binary..."
cp "$PLUGIN_NAME" "$PLUGIN_DIR/x86_64/"
cp "$PLUGIN_NAME" "$PLUGIN_DIR/linux_amd64/"

# # Debugging: Check if directories exist
# ls -R "$PLUGIN_DIR"

# Print the directory structure for verification
echo "Directory structure after copying the provider:"
ls -R "/home/gitpod/.terraform.d/plugins/"
