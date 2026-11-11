"""Выполнить SQL-запрос к учебной базе и вывести результат таблицей.

Примеры:
    python sql.py "SELECT * FROM customers"
    python sql.py solutions/task_05.sql
"""
import sqlite3
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        return

    arg = sys.argv[1]
    sql = Path(arg).read_text(encoding="utf-8") if arg.endswith(".sql") else arg

    connection = sqlite3.connect(":memory:")
    connection.executescript((ROOT / "db" / "schema.sql").read_text(encoding="utf-8"))
    connection.executescript((ROOT / "db" / "seed.sql").read_text(encoding="utf-8"))

    try:
        cursor = connection.execute(sql)
    except sqlite3.Error as error:
        print(f"Ошибка: {error}")
        return

    headers = [column[0] for column in cursor.description or []]
    rows = [[str(value) for value in row] for row in cursor.fetchall()]
    widths = [max([len(h)] + [len(r[i]) for r in rows]) for i, h in enumerate(headers)]

    print(" | ".join(h.ljust(w) for h, w in zip(headers, widths)))
    print("-+-".join("-" * w for w in widths))
    for row in rows:
        print(" | ".join(v.ljust(w) for v, w in zip(row, widths)))
    print(f"\nСтрок: {len(rows)}")


if __name__ == "__main__":
    main()
