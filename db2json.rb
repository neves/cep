# convert mysql cep em arquivos .json,
# organizados em pastas com os 3 primeiros dígitos,
# e o cep completo .json dentro da pasta.

require 'sequel'
require 'json'
require 'fileutils'

DB = Sequel.mysql2 host: 'localhost', user: 'root', password: '', database: 'cep'

DB[:cep].each do |row|
  row[:cep] = cep = '%08d' % [row[:cep]]
  json = JSON.generate(row)
  suffix = cep[0..2]
  print cep
  print "\r"
  FileUtils.mkdir_p(suffix)
  IO.write "#{suffix}/#{cep}.json", json
end
