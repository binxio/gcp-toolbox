[![CircleCI](https://circleci.com/gh/binxio/gcp-toolbox.svg?style=svg)](https://circleci.com/gh/binxio/gcp-toolbox)

# [gcp-toolbox](https://hub.docker.com/repository/docker/binxio/gcp-toolbox)

A toolbox for deploying and managing infrastructure on Google Cloud Platform! w(-.-)w

## Image Details
| Heading | Details |
| --- | --- |
| Image Base | Centos 8 |
| Tools Installed | kubectl<br>terraform<br>app-engine-python<br>app-engine-python-extras<br>app-engine-java<br>app-engine-go<br>bigtable-emulator<br>cbt<br>cloud-build-local<br>datalab<br>datastore-emulator<br>firestore-emulator<br>pubsub-emulator<br>kubectl |

## Usage
You may use this image in a CI pipeline or locally by running:
```docker run -it --rm -v $(PWD):/home -e GCP_SERVICE_KEY=$(cat ./key_file) binxio/gcp-toolbox ```
