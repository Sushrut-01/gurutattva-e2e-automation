#!/bin/bash

# Appium Rancher Setup Script
# This script helps deploy Appium server in Rancher

set -e

echo "=========================================="
echo "Appium Server Rancher Setup Script"
echo "=========================================="
echo ""

# Check prerequisites
echo "Checking prerequisites..."
which kubectl > /dev/null || { echo "kubectl not found. Please install kubectl"; exit 1; }
which docker > /dev/null || { echo "docker not found. Please install docker"; exit 1; }
echo "✓ kubectl and docker are installed"
echo ""

# Get cluster context
echo "Available Kubernetes contexts:"
kubectl config get-contexts
echo ""
read -p "Enter context name (or press Enter for current): " CONTEXT
if [ ! -z "$CONTEXT" ]; then
    kubectl config use-context $CONTEXT
fi
echo ""

# Create namespace
echo "Creating namespace: gurutattva-appium..."
kubectl apply -f - <<EOF
apiVersion: v1
kind: Namespace
metadata:
  name: gurutattva-appium
  labels:
    app: gurutattva
    component: mobile-testing
EOF
echo "✓ Namespace created"
echo ""

# Deploy Appium service
echo "Deploying Appium service..."
kubectl apply -f rancher-appium-service.yaml
echo "✓ Appium service deployed"
echo ""

# Wait for deployment
echo "Waiting for Appium pod to be ready..."
kubectl wait --for=condition=ready pod -l app=gurutattva,service=appium -n gurutattva-appium --timeout=300s

echo "✓ Appium pod is ready"
echo ""

# Get pod name
POD_NAME=$(kubectl get pods -n gurutattva-appium -l app=gurutattva,service=appium -o jsonpath='{.items[0].metadata.name}')
echo "Appium pod name: $POD_NAME"
echo ""

# Port forward (optional)
read -p "Do you want to setup port forwarding? (y/n): " PORT_FWD
if [[ $PORT_FWD == "y" || $PORT_FWD == "Y" ]]; then
    echo "Setting up port forward: localhost:4723 -> pod:4723"
    kubectl port-forward -n gurutattva-appium $POD_NAME 4723:4723 &
    sleep 3
    echo "✓ Port forward established"
fi
echo ""

# Test connectivity
echo "Testing Appium connectivity..."
MAX_ATTEMPTS=5
ATTEMPT=0

while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
    ATTEMPT=$((ATTEMPT + 1))
    echo "Attempt $ATTEMPT/$MAX_ATTEMPTS..."

    if curl -f http://localhost:4723/wd/hub/status 2>/dev/null; then
        echo "✓ Appium server is responding!"
        break
    else
        echo "  Waiting for server to be ready..."
        sleep 5
    fi
done

if [ $ATTEMPT -eq $MAX_ATTEMPTS ]; then
    echo "⚠ Could not connect to Appium server (port forwarding may be needed)"
else
    # Show status
    echo ""
    echo "Appium Status:"
    curl -s http://localhost:4723/wd/hub/status | jq '.'
fi

echo ""
echo "=========================================="
echo "Setup Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "1. Verify Android device/emulator is connected"
echo "2. Update REMOTE_URL in resources/variables.robot if needed"
echo "3. Run mobile tests:"
echo "   python -m robot --include TC64 tests/E2EDhyankendra.robot"
echo ""
echo "For more information, see: APPIUM_RANCHER_SETUP.md"
echo ""
