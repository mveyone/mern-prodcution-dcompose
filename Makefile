##make build dev
build-dev:
	cd client && $(MAKE) build-dev
	cd server && $(MAKE) build
run-dev:
	ENV=dev docker-compose -f docker-compose.dev.yml up

### make build production
build-local:
	cd client && $(MAKE) build-local
	cd server && $(MAKE) build
run-local:
	ENV=local docker-compose -f docker-compose.production.yml up

### make build production
build-production:
	cd client && $(MAKE) build-production
	cd server && $(MAKE) build
run-production:
	ENV=production docker-compose -f docker-compose.production.yml up

SSH_STRING= ubuntu@ec2-35-170-53-138.compute-1.amazonaws.com

ssh :
	 ssh -i "mern-key.pem" $(SSH_STRING)

copy_file:
	scp -r ./* $(SSH_STRING):/root/