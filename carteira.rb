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
        investimento_match = linha.match(/Investimento:\s*(.*?)(?=\s*,|\z)/)
        retorno_match = linha.match(/Retorno:\s*([\d.]+)\s*%/)
        aporte_inicial_match = linha.match(/Aporte inicial:\s*R\$ ([\d.,]+)/)
        data_match = linha.match(/Data:\s*([\d\/]+)/)
      
        if investimento_match && retorno_match && aporte_inicial_match && data_match
          investimento = investimento_match[1]
          retorno = retorno_match[1].to_f
          aporte_inicial = aporte_inicial_match[1].gsub(',', '.').to_f
          data_str = data_match[1]
          data = Date.strptime(data_str, "%d/%m/%Y")
      
          { investimento: investimento, retorno: retorno, aporte_inicial: aporte_inicial, data: data }
        else
          puts "Linha não corresponde ao formato esperado: #{linha}"
          nil
        end
    end

    def calcular_retorno
        puts "Calcular retorno"
        if File.exist?("investimentos.txt") && !File.zero?("investimentos.txt")
            print "Nome: "
            nome = gets.chomp.upcase
            puts ""
            clientes = File.readlines("investimentos.txt")
          
            clientes_selecionados = clientes.select { |cliente| cliente.include?(nome) }
          
            clientes_selecionados.each do |linha|
              campos = extrair_campos(linha)
              
              if campos
                investimento = campos[:investimento]
                retorno = campos[:retorno]
                aporte_inicial = campos[:aporte_inicial]
                data = campos[:data]
          
                puts "Investimento: #{investimento}"
                puts "Retorno: #{retorno}%"
                puts "Aporte Inicial: R$ #{aporte_inicial}"
                puts "Data investimento : #{data}"

                
                hoje = Date.today
                puts "Hoje: #{hoje}"
                
                dias = (hoje - data).to_i
                meses = dias / 30.42
                puts "#{'%.2f' % dias} dias"
                puts "#{'%.2f' % meses} meses"
          
               
                retorno_investimento = aporte_inicial * ((1 + retorno / 100) ** meses)
                puts "Retorno bruto: R$ #{'%.2f' % retorno_investimento}"
                puts ""
              end
            end
        else
            puts "Arquivo inexistente!"
        end
    end
end
