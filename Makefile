start:
	docker-compose up

test:
	docker-compose run web bundler exec rspec spec
