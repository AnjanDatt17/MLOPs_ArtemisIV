.PHONY: install dev data train predict test lint format clean docker_build docker_run docs

# Note: 'uv' is a faster alternative to pip. Install with: pip install uv
# Then replace 'pip install' with 'uv pip install' in the commands below.

install:
	python -m pip install --upgrade pip
	python -m pip install -r requirements.txt
	python -m pip install -e .

dev: install
	python -m pip install -r requirements_dev.txt
	python -m pip install pre-commit

data:
	python -m teamartemisIV.data.make_dataset

train:
	python -m teamartemisIV.train_model

predict:
	python -m teamartemisIV.predict_model

test:
	pytest tests/

lint:
	ruff check .
	ruff format --check .

format:
	ruff check --fix .
	ruff format .

clean:
	find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name .pytest_cache -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name dist -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name build -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name "*.egg-info" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name .mypy_cache -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name .ruff_cache -exec rm -rf {} + 2>/dev/null || true

docker_build:
	docker build -t teamartemisIV -f dockerfiles/Dockerfile .

docker_run:
	docker run --rm teamartemisIV

docs:
	mkdocs serve
