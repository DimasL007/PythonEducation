FROM python:3.12-slim

WORKDIR /app

# Встановлюємо Poetry
RUN pip install poetry

# Копіюємо конфігурацію (зірочка рятує, якщо лок-файлу немає)
COPY pyproject.toml poetry.lock* ./

# Встановлюємо залежності без створення віртуального середовища
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi --no-root

# Копіюємо решту коду
COPY . .

# Запуск
CMD ["poetry", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]