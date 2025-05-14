FROM python:3.10

WORKDIR /project
COPY . /project

RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    playwright install --with-deps

# ใช้ PYTHONPATH=. เพื่อให้ Python มองเห็นโฟลเดอร์ pages/
CMD ["bash", "-c", "PYTHONPATH=. pytest --html=report.html --self-contained-html"]
