class Investimentos

    def initialize
        @invetsimentos = []
        dados_formatados = []
    end
    def investir
        require 'date'
        data_hoje = Date.today
        puts "Investir"
        print "Cliente: "
        cliente = gets.chomp
        print "Taxa de retorno: "
        retorno = gets.chomp.to_f
        print "Aporte inicial: R$ "
        aporte_inicial = gets.chomp.to_f
        puts "Tipo de investimento"
        
        puts ""
        puts "1 - Ações"
        puts "2 - Poupança"
        puts "3 - Fundos imobiliários"
        puts "4 - Debentures"
        puts "5 - Imóveis"
        puts "6 - Criptomoedas"
        puts "7 - Tesouro direto"
        puts "8 - LCI/LCA"
        puts "9 - CDB"
        puts ""
        print "Opção: "

        escolha = gets.chomp.to_i

        if escolha == 1
            puts "Ações"
            print "Ação: "
            acao = gets.chomp.upcase
            investimento = 'AÇÃO ' + acao

            @investimentos = { investimento: investimento, retorno: retorno, aporte: aporte_inicial}
            dados_formatados = "cliente: #{cliente} | Investimento: #{@investimentos[:investimento]}, Retorno: #{'%.1f' % @investimentos[:retorno]} %, Aporte inicial: R$ #{'%.2f' % @investimentos[:aporte]}, Data: #{data_hoje.strftime("%d/%m/%Y")}"

            File.open("investimentos.txt", "a") do |arquivo|
                arquivo.puts dados_formatados
            end
            
            return @investimentos

        elsif escolha == 2
            puts "Poupança"
            investimento = 'Poupança'
            @investimentos = { investimento: investimento, retorno: retorno, aporte: aporte_inicial}
            dados_formatados = "cliente: #{cliente} | Investimento: #{@investimentos[:investimento]}, Retorno: #{'%.1f' % @investimentos[:retorno]} %, Aporte inicial: R$ #{'%.2f' % @investimentos[:aporte]}, Data: #{data_hoje.strftime("%d/%m/%Y")}"

            File.open("investimentos.txt", "a") do |arquivo|
                arquivo.puts dados_formatados
            end

            return @investimentos

        elsif escolha == 3
            puts "Fundos imobiliários"
            print "Fundo imobiliário: "
            fundo = gets.chomp.upcase
            investimento = 'FUNDO ' + fundo

            @investimentos = { investimentos: investimento, retorno: retorno, aporte: aporte_inicial}
            dados_formatados = "cliente: #{cliente} | Investimento: #{@investimentos[:investimento]}, Retorno: #{'%.1f' % @investimentos[:retorno]} %, Aporte inicial: R$ #{'%.2f' % @investimentos[:aporte]}, Data: #{data_hoje.strftime("%d/%m/%Y")}"

            File.open("investimentos.txt", "a") do |arquivo|
                arquivo.puts dados_formatados
            end

            return @investimentos
        elsif escolha == 4
            puts "Debentures"
            print "Empresa: "
            debentures = gets.chomp.upcase
            investimento = 'DEBENTURE ' + debentures

            @investimentos = { investimento: investimento, retorno: retorno, aporte: aporte_inicial}
            dados_formatados = "cliente: #{cliente} | Investimento: #{@investimentos[:investimento]}, Retorno: #{'%.1f' % @investimentos[:retorno]} %, Aporte inicial: R$ #{'%.2f' % @investimentos[:aporte]}, Data: #{data_hoje.strftime("%d/%m/%Y")}"

            File.open("investimentos.txt", "a") do |arquivo|
                arquivo.puts dados_formatados
            end

            return @investimentos
        elsif escolha == 5
            puts "Imoveis"
            puts "Compra | Venda | Aluguel"
            print "Imóvel: "
            imovel = gets.chomp.upcase
            investimento = imovel

            @invetsimentos = { investimento: investimento, retorno: retorno, aporte: aporte_inicial}
            dados_formatados = "cliente: #{cliente} | Investimento: #{@investimentos[:investimento]}, Retorno: #{'%.1f' % @investimentos[:retorno]} %, Aporte inicial: R$ #{'%.2f' % @investimentos[:aporte]}, Data: #{data_hoje.strftime("%d/%m/%Y")}"

            File.open("investimentos.txt", "a") do |arquivo|
                arquivo.puts dados_formatados
            end

            return @investimentos
        elsif escolha == 6
            puts "Criptomoedas"
            print "Criptomoeda: "
            cripto = gets.chomp.upcase
            investimento = cripto

            @investimentos = { investimento: investimento, retorno: retorno, aporte: aporte_inicial}
            dados_formatados = "cliente: #{cliente} | Investimentos: #{@investimentos[:investimento]}, Retorno: #{'%.1f' % @investimentos[:retorno]} %, Aporte inicial: R$ #{'%.2f' % @investimentos[:aporte]}, Data: #{data_hoje.strftime("%d/%m/%Y")}"

            File.open("investimentos.txt", "a") do |arquivo|
                arquivo.puts dados_formatados
            end

            return @investimentos
        elsif escolha == 7
            puts "Tesouro direto"
            puts "Selic | Prefixado | IPCA"
            print "Tipo: "
            tesouro = gets.chomp.upcase
            investimento = 'TESOURO ' + tesouro

            @investimentos = { investimento: investimento, retorno: retorno, aporte: aporte_inicial}
            dados_formatados = "cliente: #{cliente} | Investimento: #{@investimentos[:investimento]}, Retorno: #{'%.1f' % @investimentos[:retorno]} %, Aporte inicial: R$ #{'%.2f' % @investimentos[:aporte]}, Data: #{data_hoje.strftime("%d/%m/%Y")}"

            File.open("investimentos.txt", "a") do |arquivo|
                arquivo.puts dados_formatados
            end

            return @investimentos
        elsif escolha == 8
            puts "LCA/LCI"
            puts "Ex: LCA | BB"
            print "Intituição: "
            lca_lci = gets.chomp.upcase
            investimento = lca_lci

            @investimentos = { investimento: investimento, retorno: retorno, aporte: aporte_inicial}
            dados_formatados = "cliente: #{cliente} | Investimento: #{@investimentos[:investimento]}, Retorno: #{'%.1f' % @investimentos[:retorno]} %, Aporte inicial: R$ #{'%.2f' % @investimentos[:aporte]}, Data: #{data_hoje.strftime("%d/%m/%Y")}"

            File.open("investimentos.txt", "a") do |arquivo|
                arquivo.puts dados_formatados
            end

            return @investimentos
        elsif escolha == 9
            puts "CDB"
            puts "Prefixado | Pós-fixado | Hibrido"
            print "CDB: "
            cdb = gets.chomp.upcase
            investimento = 'CBD ' + cdb

            @investimentos = { investimento: investimento, retorno: retorno, aporte: aporte_inicial}
            dados_formatados = "cliente: #{cliente} | Investimento: #{@investimentos[:investimento]}, Retorno: #{'%.1f' % @investimentos[:retorno]} %, Aporte inicial: R$ #{'%.2f' % @investimentos[:aporte]}, Data: #{data_hoje.strftime("%d/%m/%Y")}"

            File.open("investimentos.txt", "a") do |arquivo|
                arquivo.puts dados_formatados
            end

            return @investimentos
        else
            puts "Opção inválida"
        end
    end

    def mostra_investimento
        puts @investimentos
    end
end

investir = Investimentos.new
investir.investir