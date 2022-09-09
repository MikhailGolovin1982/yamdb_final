FROM python:3.7-slim

# ������� ���������� /app ������� �����������.
WORKDIR /app

# ����������� � ���������� ���������� ���� ������������
# � ���������� /app.
COPY requirements.txt .

# ��������� ��������� ������������ ������ ����������.
RUN pip3 install -r requirements.txt --no-cache-dir

# ����������� ���������� ���������� /api_yamdb c ���������� ����������
# � ���������� /app.
COPY . .

# ��������� ������ ������� ���������� ��� ������ ����������.
CMD ["gunicorn", "api_yamdb.wsgi:application", "--bind", "0:8000" ]
