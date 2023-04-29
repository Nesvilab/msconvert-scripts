# msconvert-scripts
Some shell scripts related to raw format conversion using msconvert

## docker scripts
```shell
docker pull chambm/pwiz-skyline-i-agree-to-the-vendor-licenses
docker run -itd -v <local directory>:<container directory> <image ID> /bin/bash
docker exec -it <container names> bash
```

## shell scripts
- `run_msconvert.sh`: convert raw files to mzML files. Run in the docker container
- `check_converted_mzml.sh`: check the completeness and correctness of the converted mzML files. Does not need docker.
