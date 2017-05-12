require_relative 'ui'

def sortear_palavra
 if File.file?("palavras.txt")
  palavras = File.read("palavras.txt").split("\n")
  palavra_sorteada = palavras[rand(palavras.size)].downcase
  mensagem_palavra_sorteada(palavra_sorteada.size)
 else
  palavra_sorteada = nil
 end
 palavra_sorteada
end

def jogar(total_tentativas, palavra, nome)
 lista_chutes = [] 
 letras_certas = 0
 pontos = 0
 erros = 0 
 desenha_forca(erros)

 while erros < total_tentativas

    mensagem_status_jogo(lista_chutes, erros, total_tentativas, montar_desenho_forca(palavra, lista_chutes))
    chute = pede_um_chute
    if lista_chutes.include? chute
     mensagem_chute_repetido(chute)
     next
    end

    lista_chutes << chute
    
    chutou_uma_letra = chute.size == 1 
    if chutou_uma_letra
     total_encontrado = palavra.count(chute[0])
     letras_certas += total_encontrado
     if total_encontrado == 0
      mensagem_letra_nao_encontrada(palavra.size)
      pontos -= 15
      erros += 1
     else
      mensagem_letra_encontrada(total_encontrado, palavra.size)
      pontos += 50 * total_encontrado
      acertou = letras_certas == palavra.size
      if acertou
       mensagem_acertou_todas_letras(palavra, lista_chutes) 
       pontos += 50 * palavra.size
       mostra_pontos(pontos)
       mensagem_status_jogo(lista_chutes, erros, total_tentativas, montar_desenho_forca(palavra, lista_chutes))
       break
      end
     end
    else
     acertou = chute.eql?(palavra)
     if acertou
      mensagem_acertou_palavra(palavra)
      pontos += 100 * palavra.size
      mostra_pontos(pontos)
      mensagem_status_jogo(lista_chutes, erros, total_tentativas, montar_desenho_forca(palavra, lista_chutes))
      break
     else
      pontos = 0
      erros += 1
     end
    end
   desenha_forca(erros)
   mostra_pontos(pontos)
  end
  salva_rank(nome, pontos)
  acertou   
end

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

def jogar_novamente?
 mensagem_jogar_novamente ==  "S" ? true : false
end

def gameflow
 ganhou = false
 nome = apresentacao
 mensagem_campeao_atual(ler_rank)
 loop do
   palavra = sortear_palavra
   if palavra == nil
    mensagem_arquivo_palavras_nao_encontrado
    break
   end
   ganhou = jogar(tentativas = 5, palavra, nome)
   querer_jogar = jogar_novamente?
   break if !querer_jogar
 end
 terminar(ganhou)
end
