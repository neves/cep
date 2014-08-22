# conta quantos arquivos existem por pasta
for d in *; do echo -n $d; echo -n "\\t"; ls -1 $d | wc -l; done

# soma o tamanho individual de cada arquivo: 84378224 = 80,4MB
for d in *; do ls -FGl $d | awk '{ total += $5 }; END { print total }'; done | awk '{ total += $0 }; END { print total }'
