def cadastar_cliente
    require_relative 'investidor'
    investir = Investidor.new
    investir.cliente
end

def fazer_aporte
    require_relative 'investimentos'
    investir = Investimentos.new
    investir.investir
end

def ver_investimentos
    require_relative 'carteira'
    investir = Carteira.new
    investir.acompanhar_investimentos
end

def calcular_retorno
    require_relative 'carteira'
    investir = Carteira.new
    investir.calcular_retorno
end



def menu
    loop do
        puts "CALCULO DE RETONO DE INVESTIMENTOS"
        puts ""
        puts "      Menu"
        puts ""
        puts "1 - Cadastrar cliente"
        puts "2 - Fazer aporte"
        puts "3 - Ver investimentos"
        puts "4 - Calcular retorno"
        puts ""
        puts "0 - Sair"
        print "Opção: "

        escolha = gets.chomp.to_i

        if escolha == 1
            cadastar_cliente
        elsif escolha == 2
            fazer_aporte
        elsif escolha == 3
            ver_investimentos
        elsif escolha == 4
            calcular_retorno
        elsif escolha == 0
            puts "Saindo..."
            return
        else
            puts "Opção inválida! Tente novamente"
        end
    end

end

menu