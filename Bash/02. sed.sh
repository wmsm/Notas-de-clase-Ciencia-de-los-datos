#=================================================================================================#
#                        Notas sobre programación en bash (Comando 'sed')                         #
#=================================================================================================#

#--------------------------------------------------------------------------------------------------
# Ejemplo de un uso similar a 'grep'
seq 20 | sed -n '/1/p'
# '-n' indica que lo haga de manera silenciosa, es decir que no imprima las lineas del archivo
# la 'p' al final del patron, indica que se imprima la linea que cumple con la expresion solicitada
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 01. Al igual que en grep, se usan expresiones regulares, por lo que se pueden usar los
#     caracteres especiales como el '^' para el inicio del texto, y el '$' para el final
seq 100 | sed -n '/^1/p' #Las lineas que comiencen en 1
seq 100 | sed -n '/1$/p' #Las lineas que terminen en 1
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 02. Impresion de lineas con sed, para ello se usa la expresion '# p' donde
#     '#' representa el numero o el rango de lineas a ser procesadas
#     'p' indica la accion que se debe realizar, en este caso imprimir
seq 20 | sed -n '3 p'
seq 20 | sed -n '3,6 p'
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 03. El parametro 'd' indica que debe ser eliminado
#     Tambien se pueden usar las expresiones '$' para indicar el final de las lineas
seq 20 | sed '3 d'
seq 20 | sed '3,6 d'
seq 20 | sed '3,$ d'
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 04. '-e' Indica que a continuacion viene una expresion, es util para concatenar expresiones
seq 20 | sed -e '2 d' -e '6 d'
# EJERCICIO
#     1. Para el siguiente archivo, elimine las líneas con datos faltantes, es decir, las
#        identificadas con la cadena NA
echo \
"Date, Year, CustomerID, Value
2013-01-12, 2013, 1, 100
2014-05-12, 2014, NA, 100
2013-02-25, 2013, 2, 200
2013-04-04, 2013, 1, 100
2013-06-21, 2013, 2, 200
2014-05-12, 2014, 1, 100
2014-05-12, 2014, NA, 200
2013-02-28, 2013, 1, 100
2013-08-02, 2013, NA, 100" \
| sed '/NA,/d'
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 05. El parametro 's' sirve para decirle a 'sed' que se quiere ejecutar una accion de sustitucion
echo \
"FieldA, FieldD, FieldE, FieldG
   2, X, 2X, 2XG
   2, Y, 2Y, 2YG 
   3, Y, 3Y, 3YG
   3, X, 3X, 3XG
   4, Z, 4Z, 3XG" > out.1
#     Se desea hacer un reemplazo de las 'X' mayusculas a 'x' minusculas en el archivo anterior
sed 's/X/x/' out.1
#     De todas formas, este solo lo realiza una unica vez por linea.
#     Si se desea que lo reemplace en la totalidad de la linea, se debe decirle que lo debe hacer
#     de manera global, esto se hace a través del comando 'g'
sed 's/X/x/g' out.1
#     Además tambien se puede especificar en cual de las apariciones es que se debe aplicar
#     (por defecto es 1)
sed 's/X/x/2' out.1
#     Si se quiere hacer que lo haga a partir de una aparicion en adelante, al '#' de la aparicion
#     se le puede adicionar la g de global
sed 's/X/x/2g' out.1
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 06. El parametro 'y' sirve para que transforme la linea en el orden en que indique la expresion
#     regular. En el siguiente ejemplo, reemplaza las 'X' por 'x' y las 'Y' por las 'y'
sed 'y/XY/xy/' out.1
#     Esta se hace de manera global, y no requiere la 'g' para ser aplicado a toda la linea
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 07. En expresiones regulares, el simbolo '&' representa la cadena de texto que coincide con el
#     patron buscado, y se puede usar para reutilizarlo
sed 's/X/{&}/g' out.1
#     Tambien se pueden los rangos para determinar a que lineas se les aplica
sed '5 s/X/{&}/g' out.1
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# EJERCICIO
# Sea el siguiente archivo:
cat > out.1 <<EOF
1980-JAN-1+1:0:1.134
1980-JAN-5+1:0:1.12
1982-JAN-13+10:12:42.33
EOF
# Se desea formatear las fechas de
#    1980-JAN-1+1:0:1.134
# al siguiente formato
#    1980-JAN-01 01:00:01
#    1. Anteponerles a los dias de un solo digito el cero
sed 's|-\([0-9]\)+|-0\1+|' out.1 > out.2
#    2. Hacer lo mismo con las horas, minutos y segundos
sed -e 's|+\([0-9]\):|+0\1:|' -e 's|:\([0-9]\):|:0\1:|' -e 's|:\([0-9]\)\.|:0\1.|' out.2 > out.3
#    3. Eliminar el '+'
sed 's|+| |' out.3 > out.4
#    4. Eliminar los decimales
sed 's|\.[0-9][0-9]*||' out.4
#    5. Eliminar los pasos intermedios
rm out.*
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 08. Se pueden agregar lineas antes o despues de la expresion encontrada o sobreescribirlas
cat > out.1 <<EOF
Angelica Montes 2541122 SI
Diana Castro 4223647 SI
Gerardo Lopez 5447996 NO
EOF
#     Antes 'i':
sed '/Diana/ i Camilo Fernandez 6114432 SI/' out.1
#     Reemplazar 'c':
sed '/Diana/ c Camilo Fernandez 6114432 SI/' out.1
#     despues 'a':
sed '/Diana/ a Camilo Fernandez 6114432 SI/' out.1
#     Eliminar archivo auxiliar
rm out.1
#--------------------------------------------------------------------------------------------------

#=================================================================================================#
# EJERCICIOS
# 1. Con el siguiente archivo se desea agregar un campo llamado Year-CostumerID que contiene una
#    clave compuesta por la concatenacion de estos dos campos
cat > out.1 <<EOF
Date, Year, CustomerID, Value
2013-01-12, 2013, 1, 100
2014-05-12, 2014, 1, 100
2013-02-25, 2013, 2, 200
2013-04-04, 2013, 1, 100
2013-06-21, 2013, 2, 200
2014-05-12, 2014, 12, 100
2014-05-12, 2014, 2, 200
2013-02-28, 2013, 11, 100
2013-08-02, 2013, 1, 100
EOF
#    a. Concatenar al archivo el titulo
sed '1 s|^|Year-CostumerID, |' out.1 > out.2
#    b. Agregar el nuevo campo
sed '2,$ s|^[^,]*, *\([0-9]*\), *\([0-9]*\)|\1-\2, &|' out.2 > out.3
#    c. Mostrar los resultados
cat out.3
#    d. Eliminar archivos usados
rm out.*
#
#    Para los demas ejercicios me debo encontrar en la carpeta 'files'
cd files
# 3. Agregue dos nuevos campos al archivo order2000; el primer campo corresponde al mes y el 
#    segundo al año.
#    a. Organizar titulos
sed '1 s|$|,"mes","año"|' order2000 > out.1
#    b. Crear los nuevos campos
sed '2,$ s|\([0-9]*\)-\([0-9]*\)[^,]*"|&,"\1","\2"|' out.1
#    c. Eliminar los archivos creados
rm out.*
#=================================================================================================#





