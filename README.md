# ClaireBot Docker

Docker containers for hosting [ClaireBot](https://github.com/Sidpatchy/ClaireBot/) and [ClaireData](https://github.com/Sidpatchy/ClaireData/)

1. Clone this repo `git clone https://github.com/Sidpatchy/ClaireBot-Docker.git`.
2. `cd ClaireBot-Docker`
3. Edit the values in `./.env` and `./config/application.yml`.
4. Edit the values in the `docker-compose.yml` to your liking.
5. Run `docker-compose build` to build the ClaireBot and ClaireData containers.
6. Run `docker-compose up`, wait a few seconds for ClaireBot to generate config files and exit, then run `docker-compose down`.
7. Edit the ClaireBot config file `./config/config.yml`, specifically, you will need to edit the database configuration and fill out the Zerfas emoji details (I should probably add a toggle for that, huh?)
8. Run `docker-compose up -d`
9. That's it. Open an issue if you have a problem.
