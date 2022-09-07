model_dir=$(echo "$(pwd)/model")
models=$(ls $model_dir | grep ".xml")
echo $models
