class Carteira

    def initialize
        @clientes = []
    end


    def acompanhar_investimentos
        puts "Acompanhar investimentos"
        if File.exist?("clientes.txt") && !File.zero?("clientes.txt")
            File.open("clientes.txt") do |arquivo|
                arquivo.each_line do |linha|
                    puts linha
                end
            end
            if File.exist?("investimentos.txt") && !File.zero?("investimentos.txt")
                File.open("investimentos.txt") do |arquivo|
                    arquivo.each_line do |linha|
                        puts linha
                    end
                end
            else
                puts "Arquivo inexistente ou vazio!"
                puts "Fazer investimento?"
                puts "1 - Sim | Enter - Não"
                escolha = gets.chomp

                if escolha == '1'
                    require_relative 'investimentos'
                    investir = Investimentos.new
                    investir.investir
                elsif escolha == ''
                    puts "Saindo..."
                    return
                else
                    puts "Opção inválida"
                end
            end
        else
            puts "Arquivo inexistente ou vazio!"
            puts "Cadastrar cliente?"
            puts "1 - Sim | 0 - Não"
            escolha = gets.chomp

            if escolha == '1'
                require_relative 'investidor'
                investir = Investidor.new
                investir.cliente
            elsif escolha == ''
                puts "Saindo..."
                return
        end
    end

    def calcular_retorno
    end
end

investir = Carteira.new
investir.acompanhar_investimentos