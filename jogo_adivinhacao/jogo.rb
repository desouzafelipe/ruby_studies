def apresentacao
 puts "*************************\n"
 puts "***Jogo da adivinhação***\n"
 puts "*************************\n"
 puts "Qual é o seu nome?" 
 nome = gets.strip
 puts "Olá, #{nome}. Seja bem-vindo!\n\n"
end

def sortear_numero_secreto(limite)
 puts "Escolhendo um número entre 0 e 200...\n\n"
 rand(limite)
end

def jogar(tentativas, numero_secreto)
 numeros_chutados = [] 
 pontos = 1000
 for tentativa in 1..tentativas do
   puts "Tentativa #{tentativa} de #{tentativas}"
   
   if tentativa == 1
    puts "Pontos: #{pontos}"
    puts "Números chutados até o momento: nenhum\n"
   else
    for chute in 1..numeros_chutados.size
     lista_chutes = "Números chutados até o momento: #{numeros_chutados.to_s}"
    end
    puts "Pontos: #{pontos}"
    puts "Números chutados até o momento: #{lista_chutes}.\n"
   end

   puts "Entre com um número: " 
   chute = gets.strip
   numeros_chutados << chute
   puts "Ok..vamos ver.."
   acertou = numero_secreto == chute.to_i

   if acertou
    pontos += chute.to_i
    puts "Acertou! O número era #{numero_secreto}!\n"
    puts "Pontos: #{pontos}"
    break
   else
    puts "Errou, o número secreto é maior que #{chute}" if numero_secreto > chute.to_i
    puts "Errou, o número secreto é menor que #{chute}" if numero_secreto < chute.to_i
    pontos -= chute.to_i.abs
   end
 end
 acertou
end

def jogar_novamente?
 puts "Deseja jogar novamente?"
 quer_jogar = gets.strip.upcase
 quer_jogar ==  "S" ? true : false
end

def terminar(resultado, numero_secreto)
 if resultado == false
  puts "O número secreto era #{numero_secreto}. Game-over."
 else
  puts "Até a próxima. Parabéns."
 end
end

def gameflow
 ganhou = false
 numero_secreto = 0
apresentacao
 loop do
   ganhou = jogar(lives = 5, numero_secreto = sortear_numero_secreto(200))
   querer_jogar = jogar_novamente?
   break if !querer_jogar
 end
 terminar(ganhou, numero_secreto)
end

gameflow
