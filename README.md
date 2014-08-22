# TODO

- configurar nginx para servir o cep.json direto do diretório
- fazer importador para memcached
- fazer importador para redis
- configurar nginx em outro host para servir a partir do memcached
- configurar nginx em outro host para servir a partir do php com sqlite


### CEP
curl --data "Cep=87033420" https://carrinho.ricardoeletro.com.br/Cliente/EnderecoCep
http://www.buscarcep.com.br/site.php
http://www.buscacep.correios.com.br/servicos/dnec/menuAction.do?Metodo=menuCep
http://republicavirtual.com.br/cep/
http://cep.guiamais.com.br/busca/87033420
http://www.qualocep.com/busca-cep/87033420
http://www.achecep.com.br/
http://buscacepbrasil.com/ver/parana/maringa/zona-02/

### comprar
http://cepfacil.com.br/
http://www.ceponline.com.br/tabela-de-ceps.html

### cep.qtde.txt

possui o prefixo de 3 dígitos do cep e a quantidade dentro do diretório.

### cep.tar.bz2
expandido vai para um tar de 658.8MB e um diretório com 860 pastas, 2.63GB de arquivos json
