FROM python:3.12-slim
WORKDIR /workspace/ChipEvo
COPY . .
RUN pip install --no-cache-dir -r requirements.txt && python tools/doctor.py
ENTRYPOINT ["python", "-m", "chipevo"]
CMD ["doctor"]
