model_dir=$(echo "$(pwd)/model")
models=$(ls $model_dir | grep ".xml")

#BCF='0.1'
BCF='0.001 0.01 0.05 0.1 0.5 1'
#RHOI='0.5'
RHOI='0.01 0.05 0.1 0.5 1'
#CV='0.05'
CV='0.05 0.1 0.5 1'

for model in ${models}
  do
    if [[ $model =~ (DV-)[^_]* ]]; then
      DV=${BASH_REMATCH}

    for b_cf in ${BCF}
      do for rho_i in ${RHOI}
        do for c_V in ${CV}
          do
            OUT="${PWD}/output_6_9/${DV}_bcf-${b_cf}_pi-${rho_i}_cv-${c_V}"
            mkdir ${OUT}
            echo $OUT
            model_path=$(echo "$(pwd)/model/${model}")
            echo $model_path
            echo ${rho_i}
            morpheus -f ${model_path} -o ${OUT} -b_cf=${b_cf} -c_V=${c_V} -p_V=${rho_i}
          done
        done
      done
    fi
  done
