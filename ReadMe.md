# ReadMe adalah Baca Saya!

```bash
docker cp laravel.app:/var/www/html/myapp/. ./
```

For development this project, we need mount source code from container in host. So, in `docker-compose.yaml`.

```bash
     laravel.app
          ...
          volumes:
               ./:/var/www/html/myapp
          ...
```

Sometime we need clean up this project.

```sh
ls -lah | grep -xv "docker-compose.yaml" | xargs rm -rf
```