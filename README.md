# Readme

This project is a copy of [django-allauth](https://github.com/pennersr/django-allauth)/examples/regular-django (tag *[64.0.0](https://github.com/pennersr/django-allauth/releases/tag/64.0.0)*).


**Changes**:

* settings.py
  * Disable (comment) all login provider execpt openid-connect
  * Add:
    ```
    SOCIALACCOUNT_PROVIDERS = {
        "openid_connect": {
            "APPS": [
                {
                    "provider_id": os.getenv("KC_PROVIDER_ID", "keycloak"),
                    "name": "Keycloak",
                    "client_id": os.getenv("KC_CLIENT_ID", "django"),
                    "secret": os.getenv("KC_CLIENT_SECRET", "changeme"),
                    "settings": {
                        "server_url": os.getenv("KC_SERVER_URL", "http://localhost:8080/realms/example/.well-known/openid-configuration"),
                    },
                }
            ]
        }
    }
    ```

## Quickstart


### Keycloak

```
cp template.env .env

docker compose up -d
# Login admin/password
```

#### Create realm *example*

* Create realm *example*
* Create client *django*
  * Lookup client credentials
  * Export client secret `export KC_CLIENT_SECRET="changme"`

![](./docs/kc-supp-1.mp4)

#### Enable user registration

* Enable user registration in realm settings

![](./docs/kc-supp-2.mp4)

### Django

```
make venv
# Django             5.0.7
# django-allauth     64.0.0

source venv/bin/activate

export KC_CLIENT_SECRET="changme"
./manage.py migrate

./manage.py runserver
```

## Demo

* Show login process

![](./docs/kc-supp-3.mp4)
