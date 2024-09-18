require 'date'

class Carteira

    def initialize
        @cliente = []
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
    end

    def extrair_campos(linha)
        
        # Expressões regulares para capturar os campos
        investimento = linha.match(/Investimento:\s*(.*?)(?=\s*,|\z)/)[1]
        retorno = linha.match(/Retorno:\s*([\d.]+)\s*%/)[1].to_f
        aporte_inicial = linha.match(/Aporte inicial:\s*R\$ ([\d.,]+)/)[1].gsub(',', '.').to_f
        data_str = linha.match(/Data:\s*([\d\/]+)/)[1]
        data = Date.strptime(data_str, "%d/%m/%Y")
      
        { investimento: investimento, retorno: retorno, aporte_inicial: aporte_inicial, data: data }
    end

    def calcular_retorno
        puts "Calcular retorno"
        if File.exist?("investimentos.txt") && !File.zero?("investimentos.txt")
            print "Nome: "
            nome = gets.chomp.upcase
            @clientes = File.readlines("investimentos.txt")

            cliente_nome = @clientes.select { |cliente| cliente.include?(nome)}

            cliente_nome.map!(&:chomp)

            #puts cliente_nome

            datas = []

            cliente_nome.each do |cliente|
                elementos = cliente.split(" ")  # Divide a linha em partes
                data_str = elementos.last       # Pega o último elemento (a data)

                # Converter a string de data para um objeto Date e armazenar no array
                data = Date.strptime(data_str, "%d/%m/%Y")  # Ajuste o formato conforme necessário
                datas << data
            end

            # Exibir as datas convertidas
            puts "Datas: #{datas}"

            # Exemplo de cálculo com datas
            # Subtrair a primeira data da segunda (se houver mais de uma)
            if datas.length > 1
                diferenca = datas[1] - datas[0]  # Diferença em dias
                puts "Diferença entre as duas primeiras datas: #{diferenca} dias"
            end

        else
            puts "Arquivo inexistente!"
        end
    end
end

investir = Carteira.new
investir.mostrar