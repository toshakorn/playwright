# ใช้ Python base image
FROM python:3.10

# กำหนด path ที่จะใช้ใน container
WORKDIR /project

# คัดลอกทุกอย่างจากเครื่องคุณเข้า container
COPY . /project

# ติดตั้ง Playwright และ dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    playwright install --with-deps

# คำสั่งเริ่มต้น: รัน Pytest และสร้าง HTML รายงาน
CMD ["pytest", "tests", "--html=report.html", "--self-contained-html"]
