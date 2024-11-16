# msconvert-scripts
Some shell scripts related to Thermo Fisher raw format conversion using msconvert

## docker scripts
```shell
> docker build -t Nesvilab/msconvert-scripts .
> docker run -itd -v <local directory (your data directory)>:/data/ Nesvilab/msconvert-scripts /bin/bash
container_id will appear here

> docker exec -it <container id> bash
```

The script in this repo will be in `/` and your will be in the `/data` directory when you enter the container.

## shell scripts
- `run_msconvert.sh`: convert raw files to mzML files. Run in the docker container
- `run_msconvert_parallel.sh`: convert raw files to mzML files in parallel. Adjust the `threads` as needed. Run in the docker container
- `check_converted_mzml.sh`: check the completeness and correctness of the converted mzML files. Does not need docker.
