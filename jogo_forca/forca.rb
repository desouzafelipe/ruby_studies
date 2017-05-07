def apresentacao
 puts "Jogo da Forca\n"
 puts "Qual é o seu nome?" 
 nome = gets.strip
 puts "\n\n***Olá, #{nome}. Seja bem-vindo!***\n\n"
end

def sortear_palavra
 puts "\nSorteando palavra..."
 palavras = ["programador", "computador", "advogado", "carro", "chuva"]
 palavra_sorteada = palavras[rand(palavras.size)]
 puts "Foi escolhida uma palavra de #{palavra_sorteada.size} letras."
 palavra_sorteada.downcase
end

def pede_um_chute(lista_chutes, erros, total_tentativas)
 puts "\nErros até agora: #{erros} de #{total_tentativas}."
 puts "Chutes até agora: nenhum.\n\n" if lista_chutes.empty?
 puts "Chutes até agora: #{lista_chutes}\n\n" if !lista_chutes.empty?
 puts "Escolha uma letra ou palavra: "
 chute = gets.strip
 puts "Ok, você chutou '#{chute}'"
 chute
end

def jogar(total_tentativas, palavra)
 lista_chutes = [] 
 letras_certas = 0
 pontos = 0
 erros = 0 

 while erros < total_tentativas
    chute = pede_um_chute(lista_chutes, erros, total_tentativas)
    if lista_chutes.include? chute
     puts "Você já chutou '#{chute}'. Faça outro chute.\n"
     next
    end

    lista_chutes << chute
    
    chutou_uma_letra = chute.size == 1 
    if chutou_uma_letra
     total_encontrado = palavra.count(chute[0])
     letras_certas += total_encontrado
     if total_encontrado == 0
      puts "Letra não encontrada dentro da palavra com #{palavra.size} letras."
      pontos -= 15
      erros += 1
     else
      puts "Letra encontrada #{total_encontrado} vez dentro uma palavra de #{palavra.size} letras." if total_encontrado == 1
      puts "Letra encontrada #{total_encontrado} vezes dentro de uma palavra de #{palavra.size} letras." if total_encontrado > 1
      pontos += 50 * total_encontrado

      acertou = letras_certas == palavra.size
      if acertou
       puts "Parabéns! Acertou todas as letras da palavra '#{palavra.upcase}': #{lista_chutes}"
       pontos += 50 * palavra.size
       puts "Seus pontos: #{pontos}"
       break
      end
     end
    else
     acertou = chute == palavra
     if acertou
      puts "Parabéns! Você acertou a palavra '#{palavra.upcase}' de uma só vez!"
      pontos += 100 * palavra.size
      puts "Seus pontos: #{pontos}"
      break
     else
      puts "Errou..Perdeu todos os pontos por ter chutado uma palavra."
      pontos = 0
      erros += 1
     end
    end
   puts "\nPontos: #{pontos}"
   puts "Faltam #{palavra.size - letras_certas} letras para acertar a palavra!" if (palavra.size - letras_certas) > 1
   puts "Falta **UMA** letra para acertar a palavra" if (palavra.size - letras_certas) == 1
  end
  acertou   
end

def jogar_novamente?
 puts "Deseja jogar novamente?"
 quer_jogar = gets.strip.upcase
 quer_jogar ==  "S" ? true : false
end

def terminar(ganhou)
  puts "Perdeu esta partida, mas não desista. Até a próxima." if !ganhou
  puts "Parabéns, boa partida. Até a próxima." if ganhou
end

def gameflow
 ganhou = false
 apresentacao
 
 loop do
   ganhou = jogar(tentativas = 5, sortear_palavra)
   querer_jogar = jogar_novamente?
   break if !querer_jogar
 end
 terminar(ganhou)
end

gameflow
