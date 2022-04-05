APP := challenge
PID = /tmp/challenge.pid
PRODUCTION_PATH = /usr/local/challenge
SECRETS_PATH=.env

build:
	go build -o bin/$(APP)/main cmd/$(APP)/main.go

restart: kill build
	bin/$(APP)/main & echo $$! > $(PID)

develop: restart
	@fswatch -o . -e ".*" -i "\\.go$$" | xargs -n1 -I{}  make restart || make kill

kill:
	@kill `cat $(PID)` || true
