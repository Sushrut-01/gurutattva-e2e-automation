import xml.etree.ElementTree as ET
import sys
import io

# Fix encoding for Windows console
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')

# Parse the output.xml file
tree = ET.parse(r'D:\gurutattva-e2e-automation\results\output.xml')
root = tree.getroot()

# Find all test cases
tests = root.findall('.//test')

print("=" * 100)
print("TEST EXECUTION RESULTS - DETAILED BREAKDOWN")
print("=" * 100)
print()

passed_tests = []
failed_tests = []

for idx, test in enumerate(tests, 1):
    test_name = test.get('name')
    status_elem = test.find('.//status[@status]')
    if status_elem is not None:
        status = status_elem.get('status')

        if status == 'PASS':
            passed_tests.append(test_name)
            print(f"✅ [{idx}] PASS: {test_name}")
        else:
            failed_tests.append(test_name)
            print(f"❌ [{idx}] FAIL: {test_name}")

print()
print("=" * 100)
print(f"SUMMARY")
print("=" * 100)
print(f"Total Tests   : {len(tests)}")
print(f"✅ Passed     : {len(passed_tests)}")
print(f"❌ Failed     : {len(failed_tests)}")
print(f"Success Rate  : {len(passed_tests)/len(tests)*100:.1f}%")
print("=" * 100)
print()
print("FAILED TESTS:")
print("-" * 100)
for idx, test in enumerate(failed_tests, 1):
    print(f"{idx}. {test}")
print()
