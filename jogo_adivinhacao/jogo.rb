def apresentacao
 puts "Jogo da adivinhação\n"
 puts "Qual é o seu nome?" 
 nome = gets.strip
 puts "Olá, #{nome}. Seja bem-vindo!\n\n"
end

def sortear_numero_secreto(limite)
 puts "Escolhendo um número entre 0 e 200...\n\n"
 rand(limite)
end

def jogar(tentativas, numero_secreto)
 for tentativa in 1..tentativas do
   puts "Tentativa #{tentativa}"
   puts "Entre com o número: " 
   chute = gets.strip
   puts "Ok..você chutou #{chute} "
   acertou = numero_secreto == chute.to_i

   if acertou
    puts "Acertou!"
    break
   else
    puts "Errou, o número secreto é maior que #{chute}" if numero_secreto > chute.to_i
    puts "Errou, o número secreto é menor que #{chute}" if numero_secreto < chute.to_i
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
   ganhou = jogar(lives = 3, numero_secreto = sortear_numero_secreto(200))
   querer_jogar = jogar_novamente?
   break if !querer_jogar
 end
 terminar(ganhou, numero_secreto)
end

gameflow
