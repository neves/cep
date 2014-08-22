# convert mysql do republica para uma tabela unica
# http://republicavirtual.com.br/cep/

require 'sequel'

DB = Sequel.mysql2 host: 'localhost', user: 'root', password: '', database: 'cep'

DB.create_table? :cep do
  Integer :cep, primary_key: true
  String :uf, size: 2, fixed: true
  String :cidade
  String :logradouro
  String :tipo_logradouro
  String :bairro
end

ufs = DB.tables.select {|name| name.length == 2} - [:uf]

ufs.each do |uf|
  puts uf
  DB.transaction do
    DB[uf].each do |row|
      begin
        DB[:cep].insert cep: row[:cep].gsub(/\D/, ''),
                         uf: uf.to_s,
                         cidade: row[:cidade],
                         logradouro: row[:logradouro],
                         tipo_logradouro: row[:tp_logradouro],
                         bairro: row[:bairro]
      rescue => e
        p e
      end
    end
  end
end

DB[:cep_unico].where('Cep IS NOT NULL').each do |row|
  begin
    DB[:cep].insert cep: row[:Cep].gsub(/\D/, ''),
                    uf: row[:UF],
                    cidade: row[:Nome]
  rescue => e
    puts e
  end
end
