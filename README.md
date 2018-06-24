# Demo Rasa Platform App

## Developer Update Instructions

First, build the docker image with 

```bash
cd moodbot
docker build -t gcr.io/rasa-platform/platform-demo:v<VERSION> \
    --build-arg RASA_PYPI_USER=<USER> \
    --build-arg RASA_PYPI_PASSWORD=<PW> \
    .
```

Don't forget to increment the version in the tag. Ask someone from the team 
(Alan, Tom, Rick) for pypi credentials if you don't have any.

Now, log into Google Cloud with 

```bash
docker login -u _json_key -p "$(cat travis_gcloud_auth.json)" https://gcr.io
```

Again, ask for the credentials if you don't have any. Finally, push to the 
registry with

```bash
docker push gcr.io/rasa-platform/platform-demo:v<VERSION>
```