class Investidor
    def initialize
    end

    def cliente
        @cliente = []
        puts "Cadastrar investidor"
        print "Nome: "
        nome = gets.chomp
        print "Endereço: "
        endereco = gets.chomp
        print "CPF: "
        cpf = gets.chomp


        File.open("clientes.txt", "a") do |arquivo|
            arquivo.puts "Nome: #{nome} - Endereço: #{endereco} - CPF: #{cpf}"
        end
    end



    def fazer_aporte
    end
end

investidor = Investidor.new
investidor.cliente