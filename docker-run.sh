DEST_PATH=/home/developer/app
docker run -it --rm \
  -v $(pwd)/lib:${DEST_PATH}/lib \
  -v $(pwd)/scripts:${DEST_PATH}/scripts \
  -v $(pwd)/test:${DEST_PATH}/test \
  -v $(pwd)/index.js:${DEST_PATH}/index.js \
  -v $(pwd)/package.json:${DEST_PATH}/package.json \
  --name mathsteps \
  innox/mathsteps:1.0.0 \
  /bin/bash