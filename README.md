# msconvert-scripts
Some shell scripts related to Thermo Fisher raw format conversion using msconvert

## docker scripts
```shell
docker pull chambm/pwiz-skyline-i-agree-to-the-vendor-licenses
docker run -itd -v <local directory>:<container directory> <image ID> /bin/bash
docker exec -it <container names> bash
apt-get update -y
apt-get install parallel -y 
git clone https://github.com/Nesvilab/msconvert-scripts.git
```

## shell scripts
- `run_msconvert.sh`: convert raw files to mzML files. Run in the docker container
- `run_msconvert_parallel.sh`: convert raw files to mzML files in parallel. Adjust the `threads` as needed. Run in the docker container
- `check_converted_mzml.sh`: check the completeness and correctness of the converted mzML files. Does not need docker.
