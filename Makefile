build:
	docker build -t webcolor_app_image .

start:
	docker run --name webcolor_app -p 4000:4000 webcolor_app_image