.PHONY: run
run:
	docker build -t dotenv .
	docker run -v $$PWD/data.env:/etc/.env/data.env --rm dotenv env
