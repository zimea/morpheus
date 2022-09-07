string="something_DV-value_somethingelse"
if [[ "something_DV-value_somethingelse" =~ (DV-)[^_]* ]]; then
  echo ${BASH_REMATCH}
fi
