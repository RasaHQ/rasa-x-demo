## Demo Rasa X App
This is a repository showing an example bot and the setup needed to run it with Rasa X.

## Development Internals

### When to release a new version
This repo is kept up to date with `rasa-x`, and for each `rasa-x` minor release, there 
should be a `rasa-x-demo` release. Note that this does not generally apply to patch 
releases.

### How to release a new version
1. Update the `rasa` version in `requirements.txt` to reflect the Rasa Open Source
 release used in the associated `rasa-x` release.
2. If there was a major config / pipeline change in `rasa`: Update `config.yml` and
 `domain.yml` to the latest recommended configuration 
 (e.g. from `rasa.cli.initial_project`).
3. Install the `rasa` version specified in 1. in your local environment.
4. Train a new model by running `make train`.
5. Create a PR.
6. Wait until it's merged into master, then tag and push a new release with 
    ```
    git tag 0.26.0 -m 'new minor release for compatibility with Rasa X 0.26'
    git push origin 0.26.0
    ```
7. Update the `rasa-x-demo` version in the `rasa-x` repo (`rasa-x/.env`).
