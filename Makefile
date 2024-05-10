NAME = Inception

all: $(NAME)

$(NAME):
	docker compose -f srcs/docker-compose.yml up

down:
	docker compose down --volumes
