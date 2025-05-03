build:
	docker compose build

clean:
	docker rmi -f stormbl8/emailrelay
