
NAME=marmot-pocketbase-flyio

FLY_NAME=fly-$(NAME)
FLY_CMD=fly
FLY_CONSOLE=https://fly.io/apps/$(FLY_NAME)

PD_ADMIN=http://$(FLY_NAME).fly.dev/_/
PB_API=http://$(FLY_NAME).fly.dev/api/

print:
	@echo ""
	@echo "FLY_NAME:       $(FLY_NAME)"
	@echo "FLY_CMD:        $(FLY_CMD)"
	@echo "FLY_CONSOLE:    $(FLY_CONSOLE)"
	@echo ""
	@echo "PD_ADMIN:       $(PD_ADMIN)"
	@echo "PB_API:         $(PB_API)"

all: dep fly-destroy fly-create fly-deploy fly-console

dep:
	# https://fly.io/docs/flyctl/
	brew install flyctl
	# OR
	# curl -L https://fly.io/install.sh | sh

fly-destroy:
	$(FLY_CMD) apps destroy $(FLY_NAME)
fly-create:
	$(FLY_CMD) app create $(FLY_NAME)
fly-deploy:
	$(FLY_CMD) deploy -a $(FLY_NAME)
fly-console:
	open $(FLY_CONSOLE)
fly-scale-zero:
	$(FLY_CMD) scale count 0 -a $(FLY_NAME)
fly-scale-up:
	$(FLY_CMD) scale count 3 -a $(FLY_NAME)
fly-scale-down:
	$(FLY_CMD) scale count 1 -a $(FLY_NAME)
fly-ls:	
	$(FLY_CMD) apps list
fly-stop:
	$(FLY_CMD) apps stop $(FLY_NAME)


pb-admin:
	open $(PD_ADMIN)
pb-api:
	curl $(PB_API)