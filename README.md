## Demo Rasa X App
This is a repository showing an example bot and the setup needed to run it with Rasa X.

## Development Internals

### When to release a new version
This repo is kept up to date with `rasa-x`, and for each `rasa-x` minor release, there 
should be a `rasa-x-demo` release. Note that this does not generally apply to patch 
releases.

### How to release a new version
**Note: The new workflow [Rasa OSS bumper](https://github.com/RasaHQ/rasa-x-demo/actions/workflows/rasaoss-version-bumper.yml) has automated steps 1-5 for us. There should be a PR with the updated Rasa OSS version and trained model. Once it's merged into the base branch, please perform step 6 to release a new version of rasa-x-demo.**

**If you didn't see the PR, please let us know and follow the manual steps below.**

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
