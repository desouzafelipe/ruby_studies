require_relative 'ui'

def salva_rank(nome, pontos)
 recorde_atual = ler_rank
 if pontos > recorde_atual[1].to_i
  File.write("rank.txt", "#{nome}\n#{pontos}") 
  mensagem_novo_recordista
 end
end

def ler_rank
 if File.file?("rank.txt") 
  conteudo = File.read("rank.txt").split("\n")
 else
  File.write("rank.txt", "Zé Ninguém\n0")
  conteudo = ler_rank
 end
 conteudo 
end