# conta quantos arquivos existem por pasta
for d in *; do echo -n $d; echo -n "\\t"; ls -1 $d | wc -l; done
