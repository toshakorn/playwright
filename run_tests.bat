@echo off
setlocal ENABLEDELAYEDEXPANSION

echo [🛠️] Build Docker image...
docker build -t login-test-container .
IF %ERRORLEVEL% NEQ 0 (
    echo [❌] Build ไม่สำเร็จ!
    exit /b %ERRORLEVEL%
)

echo.
echo [🚀] Run Automated Test...
docker run --rm -v "%cd%:/project" login-test-container
IF %ERRORLEVEL% NEQ 0 (
    echo [⚠️] เทสบางส่วนอาจล้มเหลว โปรดตรวจสอบรายงาน
)

echo.
echo [🧹]  __pycache__...
for /d /r %%i in (__pycache__) do (
    echo [🧹] ลบ %%i
    rmdir /s /q "%%i"
)

echo.
echo [✅] เสร็จสิ้น! เปิดไฟล์ report.html เพื่อตรวจผลเทส
pause
