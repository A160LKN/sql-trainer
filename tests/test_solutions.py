import re
import sqlite3
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parent.parent
TASKS = [f"{n:02d}" for n in range(1, 16)]


def make_db():
    """Свежая база в памяти: схема + тестовые данные."""
    connection = sqlite3.connect(":memory:")
    connection.executescript((ROOT / "db" / "schema.sql").read_text(encoding="utf-8"))
    connection.executescript((ROOT / "db" / "seed.sql").read_text(encoding="utf-8"))
    return connection


def has_query(sql):
    """Есть ли в файле что-то кроме комментариев и пустых строк."""
    without_comments = re.sub(r"--[^\n]*", "", sql)
    return without_comments.strip() != ""


def run(sql):
    connection = make_db()
    try:
        return connection.execute(sql).fetchall()
    finally:
        connection.close()


@pytest.mark.parametrize("task", TASKS, ids=[f"task_{t}" for t in TASKS])
def test_solution(task):
    solution = (ROOT / "solutions" / f"task_{task}.sql").read_text(encoding="utf-8")
    if not has_query(solution):
        pytest.skip("решение ещё не написано")

    expected = run((ROOT / "answers" / f"task_{task}.sql").read_text(encoding="utf-8"))

    try:
        actual = run(solution)
    except sqlite3.Error as error:
        pytest.fail(f"Ошибка в запросе: {error}")

    assert actual == expected, (
        f"\nОжидалось строк: {len(expected)}, получено: {len(actual)}"
        f"\nОжидалось: {expected[:5]}"
        f"\nПолучено:  {actual[:5]}"
    )
