@echo off
echo 🔁 Running Playwright UI Tests...
echo ==============================

cd C:\Users\zxzsw\Downloads\login_test_project\tests\run_playwright_tests.bat

set PYTHONPATH=%CD%
pytest tests/test_login_logout.py ^
 --headed ^
 --html=report.html ^
 --self-contained-html ^
 --metadata tester jamei ^
 --metadata project "Login Automation with Playwright"

echo.
echo ✅ Done! Opening report...
start report.html

pause
