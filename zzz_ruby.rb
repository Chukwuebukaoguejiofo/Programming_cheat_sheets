# commentatios (que nao serao tratados como codigo)


puts "hello"  # resultado: hello

# criando uma funcao:
def	andar
  puts "estou andando"
end

# usando uma funcao:
walk  # resultado:  estou andando




# classes (usadas para criar varios objetos do mesmo tipo)
class Pessoa
	def falar
		puts "estou falando"
	end

	def caminhar
		puts "estou caminhando"
	end
end

brian = Pessoa.new # criando um objeto
brian.falar # resultado: estou falando
brian.caminhar # estou caminhando


erich = Pessoa.new # criando um objeto
erich.falar # resultado: estou falando
erich.caminhar # estou caminhando
