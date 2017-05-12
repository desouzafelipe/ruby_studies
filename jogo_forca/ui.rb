def apresentacao
 puts "        _                         _         ______                 "
 puts "      | |                       | |       |  ____|                 "
 puts "      | | ___   __ _  ___     __| | __ _  | |__ ___  _ __ ___ __ _ "
 puts "  _   | |/ _ \ / _` |/ _ \   / _` |/ _` | |  __/ _ \| '__/ __/ _` |"
 puts " | |__| | (_) | (_| | (_) | | (_| | (_| | | | | (_) | | | (_| (_| |"
 puts "  \____/ \___/ \__, |\___/   \__,_|\__,_| |_|  \___/|_|  \___\__,_|"
 puts "                __/ |                                              "
 puts "               |___/                                               "
 puts "																	  "
 puts "PS: tirar homens da forca é realmente um jogo? ..Quem dera Tiradentes ter podido jogar isso!"
 puts "Qual é o seu nome?" 
 nome = gets.strip
 puts "\n\n***Olá, #{nome}. Seja bem-vindo!***\n\n"
 nome
end

def mensagem_campeao_atual(dados)
 puts "O campeão atual em salvar homens da forca é #{dados[0]}, com #{dados[1]} pontos."
 puts "Teria um trabalhão na França de 1789..\n"
end

def mensagem_novo_recordista
 puts "Parabéns, você bateu o recorde atual! "
end

def mensagem_jogar_novamente
 puts "Quer tentar tirar outro homem da forca?"
 quer_jogar = gets.strip.upcase
end

def terminar(ganhou)
 puts "Um homem foi enforcado. Talvez ele tenha merecido, mas nunca desista de fazer o bem." if !ganhou
 puts "Parabéns, você tirou um homem da forca. Que ele pague em vida pelo que fez. Até a próxima ;-)" if ganhou
end

def mensagem_sorteando_palavra
 puts "\nSorteando palavra..."
end

def mensagem_palavra_sorteada(quantidade_letras_palavra_sorteada)
 puts "Foi escolhida uma palavra de #{quantidade_letras_palavra_sorteada} letras."
end

def mensagem_status_jogo(lista_chutes, erros, total_tentativas, mascara)
 puts "Palavra: #{mascara}"
 puts "\nErros até agora: #{erros} de #{total_tentativas}."
 puts "Chutes até agora: nenhum.\n\n" if lista_chutes.empty?
 puts "Chutes até agora: #{lista_chutes}\n\n" if !lista_chutes.empty?
end

def pede_um_chute
 puts "Escolha uma letra ou palavra: "
 chute = gets.strip.downcase
 puts "Ok, você chutou '#{chute}'"
 chute
end

def mensagem_chute_repetido(chute)
 puts "Você já chutou '#{chute}'. Faça outro chute.\n"
end

def mensagem_letra_nao_encontrada(quantidade_letras_palavra_sorteada)
 puts "Letra não encontrada dentro da palavra com #{quantidade_letras_palavra_sorteada} letras."
end

def mensagem_letra_encontrada(total_encontrado, quantidade_letras_palavra_sorteada)
 puts "Letra encontrada #{total_encontrado} vez dentro uma palavra de #{quantidade_letras_palavra_sorteada} letras." if total_encontrado == 1
 puts "Letra encontrada #{total_encontrado} vezes dentro de uma palavra de #{quantidade_letras_palavra_sorteada} letras." if total_encontrado > 1
end

def mensagem_acertou_todas_letras(palavra, lista_chutes) 
 puts "Parabéns! Acertou todas as letras da palavra '#{palavra.upcase}': #{lista_chutes}"
 puts "..e de quebra tirou um condenado da forca. Sorte a dele!"
end

def mostra_pontos(pontos)
 puts "Seus pontos: #{pontos}"
end

def mensagem_acertou_palavra(palavra)
 puts "Parabéns! Você acertou a palavra '#{palavra.upcase}' de uma só vez!"
 puts "..e de quebra tirou um condenado da forca. Sorte a dele!"
end

def mensagem_errou_palavra
 puts "Errou..Perdeu todos os pontos por ter chutado uma palavra."
 puts "..segure as pontas aí."
end

def mensagem_arquivo_palavras_nao_encontrado
 puts "Arquivo <palavras.txt> não encontrado. Tchau!"
end

def montar_desenho_forca(palavra_sorteada, lista_chutes)
 mascara = ""
 for letra in palavra_sorteada.chars
 	if lista_chutes.include? letra
 		mascara += letra
 	else
 		mascara += "_"
 	end
 end
 mascara
end

def desenha_forca(erros)
 head = ""
 body = ""
 legs = ""

 if erros == 1
  head = " @"
 end

 if erros > 1 and erros < 4 
  head = " @"
  body = "\\|/"
 end

 if erros == 4
  head = " @"
  body = "\\|/"
  legs = "/ \\"
 end

 if erros > 4
  head = " X"
  body = "/|\\"
  legs = "/ \\"
 end

 puts " _________     \n"
 puts "|/        |    \n"
 puts "|        #{head}    \n"
 puts "|        #{body}  \n"
 puts "|        #{legs}  \n"
 puts "|              \n"
 puts "|              \n"

end
 