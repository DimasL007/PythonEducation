FROM python:3.11-slim

WORKDIR /code

# Копіюємо файл зі списком бібліотек
COPY requirements.txt .

# Встановлюємо бібліотеки звичайним піпом
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Копіюємо весь твій код (папку app, run.py тощо)
COPY . .

# Запускаємо через точку входу
CMD ["python", "run.py"]