docker run -it \
  --rm \
  --gpus all \
  -v $HOME/big_file:/model_file \
  -v $HOME/project:/project \
  --name cudatest \
  --network host \
  testcuda \
  bash