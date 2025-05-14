FROM python:3.10

WORKDIR /project
COPY . /project

RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    playwright install --with-deps

# รัน pytest และลบ __pycache__ ทิ้งหลังเสร็จ
CMD ["bash", "-c", "PYTHONPATH=. pytest --html=report.html --self-contained-html && find . -type d -name '__pycache__' -exec rm -rf {} +"]
