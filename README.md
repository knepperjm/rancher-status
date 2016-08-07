# Rancher-Status-Page:

* The purpose of this repo is to house a container that display the current status of a given rancher environment.
* This is important, because it allows to get a high-level view of currently deployed docker tags for each respective stack.

## Notes:
  * This job requires that the container runs in a Rancher environment in order to access the Rancher-Metadata API.
  * Containers that wish to use the status page must implement the `stack.name` label in their rancher-compose:
  * Be sure to export DOCKER_TAG for your desired docker tag from DockerHub prior to submitting rancher-compose.yml.

    ```
      labels:
        io.rancher.container.dns: "true"
        io.rancher.stack.name: "srflaxu40/rancher_status_page:${DOCKER_TAG}"
    ```

  * To use the rancher-metadata API, you must enable the following label in your container's rancher-compose file:

    ```
      io.rancher.container.dns: true
    ```

## Build:
  * `docker build --no-cache -t rancher-status-page`

## Run (this won't hit the Rancher-metadata API):
  * `docker-compose -f docker-compose.yml  up -d web`

## Run in rancher (requires changing values in `rancher_env.sh`:
  * `source rancher_env.sh`
  * `rancher-compose --verbose -f rancher-compose.yml -p rancher-status up --upgrade --confirm-upgrade --pull -d`
    * After running the above command, go to port 20040 of your rancher instance or host, and see what tags you
      have deployed for each stack / container. 

