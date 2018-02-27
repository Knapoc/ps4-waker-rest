# ps4-waker-rest

This is simple REST-wrapper around [ps4-waker](https://github.com/dhleong/ps4-waker).

**Warning**: no authentication is performed. Don't expose this service to outside network.

To run this image:
`docker run -d --name container-name -v "/path/to/your/config/folder:/waker/data" --net=host knapoc/ps4-waker-rest`

The file `ps4-config.json` should be generate on its own but try to create it by running the following commends:
1. `docker exec -it container-name /bin/sh`
2. `rm /waker/data/ps4-creds.json`
3. `ps4-waker -c /waker/data/ps4-creds.json`
4. Type ctrl + d to exit the container

The REST wrapper around ps4-waker will listen on port `3031` by default. If you encounter any port conflicts run the container with the port option: `-p XXXX:3031`
