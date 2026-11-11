# SQL Trainer

[![SQL tests](https://github.com/A160LKN/sql-trainer/actions/workflows/tests.yml/badge.svg?branch=main)](https://github.com/A160LKN/sql-trainer/actions/workflows/tests.yml)

Тренажёр SQL для тестировщика: учебная база интернет-магазина, 15 задач и автотесты, которые проверяют решения.

## Как это работает

1. Читаешь условие в [`TASKS.md`](TASKS.md).
2. Пишешь запрос в файл `solutions/task_XX.sql`.
3. Запускаешь `pytest` — тест выполняет твой запрос на свежей базе и сравнивает результат с эталоном.

Нерешённые задачи пропускаются (`SKIPPED`), правильные — `PASSED`, неправильные — `FAILED` с подсказкой, что ожидалось и что получилось.

## Что внутри

**База данных** (`db/`): покупатели, товары, заказы и позиции заказов. В данных **намеренно спрятаны ошибки** — дубли email, заказ несуществующего покупателя, заказ без товаров, товар с нулевой ценой. Их нужно найти запросами, как при проверке данных на реальном проекте.

**Темы задач:**
- `SELECT`, `WHERE`, `ORDER BY`, `BETWEEN`, `LIMIT`;
- агрегаты `COUNT`, `SUM`, `AVG`, `GROUP BY`, `HAVING`;
- `JOIN` и `LEFT JOIN` по двум, трём и четырём таблицам;
- поиск записей без связи (`LEFT JOIN ... WHERE ... IS NULL`);
- подзапросы.

## Запуск

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

# проверить решения
pytest

# только одну задачу
pytest -k task_05

# выполнить любой запрос и посмотреть результат таблицей
python sql.py "SELECT * FROM orders"
python sql.py solutions/task_05.sql
```

База создаётся заново в памяти при каждом запуске, поэтому испортить её нельзя — `DELETE` и `UPDATE` тоже можно пробовать.

## Структура

```
├── db
│   ├── schema.sql          — таблицы
│   └── seed.sql            — тестовые данные с ошибками
├── solutions/task_XX.sql   — сюда пишутся решения
├── answers/task_XX.sql     — эталонные решения
├── tests/test_solutions.py — сравнение решений с эталоном
├── sql.py                  — запуск любого запроса
└── TASKS.md                — условия задач
```
