model_dir=$(echo "$(pwd)/model")
models=$(ls $model_dir | grep ".xml")

BCF='0 0.2 0.4 0.6 0.8 1'
RHOI='0 0.2 0.4 0.6 0.8 1'
CV='0 0.2 0.4 0.6 0.8 1'
REP='1 2 3 4 5'

for model in ${models}
  do
    if [[ $model =~ (DV-)[^_]* ]]; then
      DV=${BASH_REMATCH}

    for b_cf in ${BCF}
      do for rho_i in ${RHOI}
        do for c_V in ${CV}
          do for rep in ${REP}
            do
              OUT="${PWD}/output/${DV}_bcf-${b_cf}_pi-${rho_i}_cv-${c_V}_rep-${rep}"
              mkdir ${OUT}
              echo $OUT
              model_path=$(echo "$(pwd)/model/${model}")
              echo $model_path
              echo ${rho_i}
              morpheus -f ${model_path} -o ${OUT} -b_cf=${b_cf} -c_V=${c_V} -p_V=${rho_i}
            done
          done
        done
      done
    fi
  done
