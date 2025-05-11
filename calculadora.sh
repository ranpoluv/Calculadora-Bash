#!/bin/bash

# Calculadora simples em bash

echo "Calculadora Simples"
echo "-------------------"

# Perguntar pelo primeiro número
read -p "Digite o primeiro número: " num1

# Perguntar pelo segundo número
read -p "Digite o segundo número: " num2

# Mostrar opções de operação
echo ""
echo "Escolha uma operação:"
echo "1 - Adição (+)"
echo "2 - Subtração (-)"
echo "3 - Multiplicação (*)"
echo "4 - Divisão (/)"
read -p "Digite o número da operação (1-4): " opcao

# Realizar a operação selecionada
case $opcao in
    1)
        resultado=$(echo "$num1 + $num2" | bc)
        operacao="+"
        ;;
    2)
        resultado=$(echo "$num1 - $num2" | bc)
        operacao="-"
        ;;
    3)
        resultado=$(echo "$num1 * $num2" | bc)
        operacao="*"
        ;;
    4)
        if [ "$num2" -eq 0 ]; then
            echo "Erro: Divisão por zero não é permitida."
            exit 1
        fi
        resultado=$(echo "scale=2; $num1 / $num2" | bc)
        operacao="/"
        ;;
    *)
        echo "Opção inválida. Por favor, execute o script novamente e escolha uma opção de 1 a 4."
        exit 1
        ;;
esac

# Mostrar o resultado
echo ""
echo "Resultado: $num1 $operacao $num2 = $resultado"
