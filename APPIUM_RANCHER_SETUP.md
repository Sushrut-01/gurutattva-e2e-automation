# Appium Server Setup in Rancher Container

## Overview
This document describes how to deploy Appium server in Rancher for consistent, scalable mobile testing.

## Prerequisites
- Rancher cluster running
- kubectl configured
- Docker installed (for building custom image)
- Android SDK and ADB available on host or in container

## Setup Steps

### Option 1: Deploy Using Docker Compose (for testing)

```bash
# Set environment variables
export ANDROID_SDK_PATH=/path/to/android-sdk
export ADB_PATH=/path/to/adb

# Start Appium
docker-compose -f docker-compose-appium.yml up -d

# Verify
curl http://localhost:4723/wd/hub/status
```

### Option 2: Deploy Using Rancher UI

1. **Create New Project**
   - Go to Rancher Dashboard
   - Click "Add Cluster" → Select your cluster
   - Click "Create Project"
   - Name: `gurutattva-appium`
   - Description: `Mobile Testing - Appium Server`

2. **Create Namespace**
   - In the project, go to Namespaces
   - Click "Create Namespace"
   - Name: `gurutattva-appium`

3. **Deploy Service via YAML**
   - Go to Workloads → Deployments
   - Click "Create from YAML"
   - Paste content from `rancher-appium-service.yaml`
   - Click "Create"

4. **Verify Deployment**
   ```bash
   kubectl get pods -n gurutattva-appium
   kubectl logs -n gurutattva-appium -f deployment/appium-server
   ```

### Option 3: Build Custom Docker Image

```bash
# Build image
docker build -f Dockerfile.appium -t your-registry/appium:gurutattva-latest .

# Push to registry
docker push your-registry/appium:gurutattva-latest

# Update rancher-appium-service.yaml with your image
# Then deploy using Rancher UI
```

## Configuration

### Environment Variables
- `APPIUM_HOST`: Default `0.0.0.0` (listen on all interfaces)
- `APPIUM_PORT`: Default `4723`
- `LOG_LEVEL`: `debug`, `info`, `warn`, `error`
- `ANDROID_HOME`: Path to Android SDK (if using Android emulator)

### Resource Requirements
- **Memory**: 2Gi (min), 4Gi (recommended)
- **CPU**: 1 core (min), 2 cores (recommended)
- **Storage**: 500Mi for logs and temporary files

## Connecting to Appium Server

### From Test Client (within cluster)
```python
# Use service DNS name
appium_server_url = "http://appium-service.gurutattva-appium.svc.cluster.local:4723/wd/hub"
```

### From Test Client (external to cluster)
```python
# Use Rancher hostname or IP
appium_server_url = "http://appium-server.rancher.example.com:4723/wd/hub"
```

### Robot Framework Configuration
```robot
*** Settings ***
Library    AppiumLibrary

*** Variables ***
${REMOTE_URL}    http://appium-service.gurutattva-appium.svc.cluster.local:4723/wd/hub
${PLATFORM_NAME}    Android
${DEVICE_NAME}    emulator-5554
${APP_PACKAGE}    com.org.gurutattva.app
${APP_ACTIVITY}    com.example.gurutattva_flutter_app.MainActivity
${AUTOMATION_NAME}    UiAutomator2
```

## Health Checks

### Verify Appium is Running
```bash
# Check status endpoint
curl http://appium-service.gurutattva-appium.svc.cluster.local:4723/wd/hub/status

# Expected response
{"value": {"ready": true, "message": "Appium is ready to accept connections"}}
```

### Monitor Logs
```bash
# View logs
kubectl logs -n gurutattva-appium -f deployment/appium-server

# View last 100 lines
kubectl logs -n gurutattva-appium --tail=100 deployment/appium-server
```

## Android Emulator / Device Setup

### Option A: Android Emulator in Container
1. Install Android SDK inside container (update Dockerfile)
2. Create/configure Android emulator
3. Start emulator before running tests

### Option B: Android Emulator on Host
1. Start emulator on host machine
2. Configure ADB to connect: `adb tcpip 5037`
3. Connect from Appium: Use emulator's network IP

### Option C: Real Android Device
1. Enable USB debugging on device
2. Connect USB or enable ADB over network
3. Configure device name in test configuration

## Running Tests

### Update test configuration
Edit `resources/variables.robot`:
```robot
${REMOTE_URL}    http://appium-service.gurutattva-appium.svc.cluster.local:4723/wd/hub
```

### Run tests
```bash
cd d:\gurutattva-e2e-automation
python -m robot --include TC64 tests/E2EDhyankendra.robot
python -m robot --include TC67 tests/E2EDhyankendra.robot
python -m robot --include TC66 tests/E2EDhyankendra.robot
```

## Troubleshooting

### Issue: Connection Refused
**Solution:** Verify Appium pod is running
```bash
kubectl get pods -n gurutattva-appium
kubectl describe pod -n gurutattva-appium <pod-name>
```

### Issue: Device Not Found
**Solution:** Check ADB connection
```bash
adb devices
adb connect <device-ip>:5037
```

### Issue: App Won't Install
**Solution:** Verify APK path and app package
```bash
adb install /path/to/app.apk
adb shell pm list packages | grep gurutattva
```

### Issue: UIAutomator2 Driver Error
**Solution:** Upgrade Appium and driver
```bash
appium driver update uiautomator2
```

## Monitoring & Logs

### View Appium Logs
```bash
kubectl logs -n gurutattva-appium -f deployment/appium-server
```

### View Test Results
```bash
# After test run
cat results/report.html
```

## Scaling

### Increase Replicas
```bash
kubectl scale deployment appium-server -n gurutattva-appium --replicas=3
```

### Use Load Balancer
Update service type in YAML:
```yaml
spec:
  type: LoadBalancer  # Instead of ClusterIP
```

## Production Checklist

- [ ] Verify Appium server is running and healthy
- [ ] Test connectivity from test runner machine
- [ ] Verify Android device/emulator is connected
- [ ] Test with sample test case
- [ ] Monitor resource usage (CPU, Memory)
- [ ] Configure logging and monitoring
- [ ] Setup alerts for pod failures
- [ ] Document device/emulator configuration
- [ ] Create backup of Appium configuration
- [ ] Test disaster recovery procedure

## References

- [Appium Documentation](https://appium.io/docs/)
- [Appium Docker Image](https://hub.docker.com/r/appium/appium)
- [Robot Framework AppiumLibrary](https://github.com/serhatbolsu/robotframework-appiumlibrary)
- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [Rancher Documentation](https://rancher.com/docs/)
