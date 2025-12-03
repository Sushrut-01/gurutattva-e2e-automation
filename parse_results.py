import xml.etree.ElementTree as ET
import sys

# Set UTF-8 encoding for console output
sys.stdout.reconfigure(encoding='utf-8')

tree = ET.parse('C:\\Users\\srvadmin\\version_0_guruttava_automation\\Gurutattva_E2E_Automation\\results\\output.xml')
root = tree.getroot()
tests = root.findall('.//test')

print(f"\n{'='*80}")
print(f"LATEST TEST EXECUTION RESULTS - {len(tests)} E2E Tests")
print(f"{'='*80}\n")

passed = []
failed = []

for i, test in enumerate(tests, 1):
    test_name = test.get('name')
    status_elem = test.find('status')
    status = status_elem.get('status')
    error_msg = status_elem.text if status_elem.text else ""

    if status == 'PASS':
        passed.append((i, test_name))
        print(f"[PASS] Test Case {i}: {test_name}")
    else:
        failed.append((i, test_name, error_msg))
        print(f"[FAIL] Test Case {i}: {test_name}")
        if error_msg:
            # Show first 120 characters of error
            short_error = error_msg[:120] + "..." if len(error_msg) > 120 else error_msg
            print(f"       Error: {short_error}")

print(f"\n{'='*80}")
print(f"SUMMARY: {len(passed)} PASSED, {len(failed)} FAILED")
print(f"{'='*80}\n")

print("PASSED TESTS:")
for i, name in passed:
    print(f"  Test Case {i}: {name}")

print(f"\nFAILED TESTS:")
for i, name, error in failed:
    print(f"  Test Case {i}: {name}")
