#=================================================================================================#
#                                Notas sobre programación en bash                                 #
#=================================================================================================#

#--------------------------------------------------------------------------------------------------
# 01. Moverse por los directiorios, reconocer el sistema de archivos de windows
#     a través de la consola de ubunto on windows
#     Para poder hacerlo se necesita anteponerle a la ruta de windows el comando
                                              /mnt/
#
#     Por ejemplo la ruta "C:\Users"
#     quedaria de la siguiente forma, ya que el nombre del disco en este caso C:\
#     debe ser reemplazado por minusculas y eliminando los dos puntos
#     "/mnt/c/Users"
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 02. Mostrar el contenido de una ruta en la que no me encuentro actualmente parado
#     para mi prueba voy a usar la ruta "E:\Descargas"
#     NOTA: el nombre del disco en este caso la "E:\" se debe escribir en minuscula y
#           quitando los dos puntos.
ls "/mnt/e/descargas"
#     Si se quiere mostrar el contenido de la carpeta en la que la consola se encuentra
#     parada en ese momento solo es necesario el comando ls
ls
#     El parametro '-l' hace que se imprima la información detallada de los archivos
ls -l
#     El parametro -a hace que se muestren todos los archivos, incluidos los ocultos
#     (En Linux son los que empiezan por '.')
#     El parametro -A hace que se muestren casi todos los archivos, exceptuando los que comiencen
#     exactamente por un punto '.' o por dos puntos '..'
#
# 02.1 El resultado del comando '-l' envía como resultado un codigo de 10 digitos con los permisos
#      que tienen los usuarios y se interpreta de la siguiente manera
#      'drwxrwxrwx' --> 'd'|'rwx'|'rwx'|'rwx'
#      -> 'd': si es una 'd' significa que es una carpeta, de lo contrario si es un '-' indica que
#              es un archivo
#      -> 'rwx': Indica los permisos que tiene el usuario
#                'r': lectura   '-' en caso de no ternerlo
#                'w': escritura '-' en caso de no ternerlo
#                'x': ejecucion '-' en caso de no ternerlo
#      Estos 3 caracteres se repiten 3 veces
#         El primero para especificar los permisos del usuario
#         El segundo para especificar los permisos del grupo
#         El tercero para los demás
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 03. Para movernos a una carpeta diferente a la que estamos pasados actualmente usamos
#     el comando 'cd'
cd "/mnt/c/Users/HP/01. Proyectos de jupyter/01. Ciencia de los datos/Bash/"
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 04. Verificar la ruta del directirio de trabajo donde la consola se encuentra en el momento
pwd
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 05. Crear carpetas con el comando 'mkdir' seguido del nombre de la carpeta
#     si solo se pone el nombre la creara en el directorio actual donde se esté ejecutando la 
#     consola
mkdir prueba
#     Tambien se puede especificar la ruta completa o relativa al archivo para que se cree en un 
#     directorio diferente al actual
#
#     Este comando tambien cuenta con parametros, entre los cuales destaca
#     '-p' para que no saque error si la carpeta ya se encuentra creada y que cree todas las
#          carpetas que hacen falta en la ruta
mkdir -p "prueba/otra carpeta para crear/y una ultima mas"
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 06. Eliminar carpetas con el comando 'rmdir' seguido por el nombre de la carpeta
rmdir "prueba/otra carpeta para crear/y una ultima mas"
#     Cabe resaltar que este comando solo funciona en el caso de que la carpeta a eliminar se
#     encuentre vacía de lo contrario saca un error, sin embargo el parametro 
#     '--ignore-fail-on-non-empty' evita que se muestre esto como un error
#
#     Al igual que el comando para crearlas, este comando cuenta con parametros similares como
#     '-p' que igual al caso anterior sirve para remover todas las carpetas de la ruta siempre y
#          cuando la unica cosa que tenga adentro sea la carpeta que se desea eliminar tambien
rmdir -p "prueba/otra carpeta para crear"
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 07. El comando 'touch' puede utilizarce para crear archivos vacíos aunque esa no es su funcion
#     principal
touch "archivo nuevo.txt"
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 08. Copiar un archivo con el comando 'cp', a este comando se le deben especificar 2 archivos
#     el primero es el archivo (Ya sea solo el nomrbe o la ruta completa) que se desea copiar
#     el segundo es el destino (Ya sea solo el nombre o la ruta completa) al que se desea enviar
cp "archivo nuevo.txt" "copia del archivo nuevo.txt"
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 09. Mover un archivo con el comadno 'mv', tiene el mismo funcionamiento que el comando 'cp'
#     pero con la diferencia que aqui el archivo original se elimina, o en otras palabras se mueve
#
#     El comando tambien es utilizado para renombrar un archivo por la forma en la que funciona
mv "copia del archivo nuevo.txt" "archivo renombrado.txt"
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 10. Para eliminar archivos se utliza el comando 'rm'
rm "archivo renombrado.txt" "archivo nuevo.txt"
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 11. El comando 'echo' permite poder imprimir en consola lo que se quiera
echo hola    mundo     cruel
#     cada palabra pasa como un argumento y los concatena con espacio, si se quiere respetar los
#     espacios, se debe pasar como un string
echo 'hola    mundo     cruel'
#
#     Para imprimir varias lineas a la vez se puede utilizar el comando '\'
echo linea1 \
     linea2 \
     linea3
#     Si se quiere que se respete los saltos de linea ingresarlo como string
echo "linea1
linea2
linea3"
#
#     Para usar los caracteres especiales usar la instruccion '-e'
echo    "hola\tmundo\tcruel\nmuuuuy cruel" #Asi se interpreta literal
echo -e "hola\tmundo\tcruel\nmuuuuy cruel" #Asi se interpreta los caracteres especiales
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 12. Pare crear strings formateados se usa el comando 'printf', estas son las opciones:
printf '%s: contiene %d registros\n' '"archivo de prueba.txt"' 256
printf '%d es un entero, %4.2f es un decimal con 2 decimales\n' 8 5.26825465465
#     Importante terminar el patron o formato a usar con el caracter de salto de linea '\n'
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 13. Para la creación de secuencias, usar el comando 'seq'
#     Si se usa con un solo numero, se entiende que empieza en 1 y que aumente de a 1
#     Si se usa con dos numeros, entiende que el primero es donde debe empezar y el segundo el fin
#       y que aumenta de a +1
#     Si se usa con tres numeros, el primero es el inicio, el segundo es cunto debe aumentar o 
#       disminuir si es negativo, y el tercero es el final
seq 5      # imprime 1 2 3 4 5
seq 3 7    # imrpime 3 4 5 6 7
seq 2 3 15 # imprime 2 5 8 11 14
#     El parametro '-f' sirve para proveer un formato a la secuencia
seq -f "esta es la linea %02g" 0 2 10 #NOTA: revisar bien cuales son los codigos de los formatos
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 14. Guardar el resutlado en un archivo con el comando '>'
echo -e 'hola mundo cruel \n\r'> prueba.txt
#     Con el comando anterior, si el archivo existe, lo sobreescribe y elilimina todo el contenido
#     que hubiera tenido.
#     Para pegarlo al final del archivo usar el comando '>>'
echo otro mundo cruel que estoy concatenando >> prueba.txt
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 15. Para imprimir en pantalla todo el contenido de un archivo en la pantalla se usa el comando
#     'cat' seguido de la ruta del archivo o archivos a leer
cat prueba.txt
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 16. Se puede usar el comando 'EOF' como entrada acompañado de '<<' para hacer la entrada
cat > out.1 << EOF
CustomerID, Customer
   1, Customer A
   2, Customer B
EOF
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 17. 'head' para ver el principio
#     'tail' para ver el final
#     Por defecto muestra 10 filas
seq -f"linea %g" 100 > out.1 # se generan 100 líneas
head out.1
tail out.1
#     se puede usar el comando '-n' seguido de la cantidad de registros que se quieren ver
head -n 5 out.1
tail -n 5 out.1
#     Adicional en tail se tiene el comando '+' que junto al numero de la linea, me muestra a
#     partir de esa linea en adelante
tail -n +94 out.1
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 18. Se pueden realizar varios comando en una misma linea usando el comando ';' para concatenarlos
echo 1;echo 2; echo 3
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# NOTA: PAra cambiar el contenido del nombre de la linea del comando
echo $PS1 #Para revisar que tiene
PS1="\s-\v:"
#--------------------------------------------------------------------------------------------------

#=================================================================================================#
#                                            EJERCICIO                                            #
#=================================================================================================#

cd files

#--------------------------------------------------------------------------------------------------
# 01. Pegue el contenido de los archivos order2000, ..., order2015
ls order2*
cat order2* #Te escribe 2016 de mas
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 02. Cuál es el nombre del último empleado en el archivo employee?
head -n 1 employee
tail -n 1 employee
#     R:/ Helga Lasalle
#--------------------------------------------------------------------------------------------------
#=================================================================================================#

#--------------------------------------------------------------------------------------------------
# 19. Usar 'less' para abrir un visualizador y revisar un archivo
less employee
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 20. Para ordenar un archivo usar el comando 'sort'
seq -f 'esta es la linea %g' 8 > out.1 #Guardar en un archivo una secuencia de lineas
sort    out.1 out.1 out.1              #Pegar el mismo archivo 3 veces y ordenarlos
sort -r out.1 out.1 out.1              #Ordenarlos al contrario
sort -R out.1 out.1 out.1              #Ordenarlo de forma aleatoria
#--------------------------------------------------------------------------------------------------

#=================================================================================================#
#                                            EJERCICIO                                            #
#=================================================================================================#

#--------------------------------------------------------------------------------------------------
# 01. Ordene el archivo employee por EmployeeName.
#     1. Ir al directorio donde se encuentra employee
cd bash/files
#     2. revisar el contenido del inicio del archivo
head -n 3 employee
#     3. Guardar los encabezados
head -n 1 employee > aux.1
#     4. Eliminar el encabezado para poder ordenar el resto del archivo, luego, ordenar por el
#        contenido de la celda 3 en adelante (ya que en este caso no es importante declararle cuando
#        debe parar), despues, pegarle a los encabezados el resultado y mostrarlos en pantalla
tail -n +2 employee | sort -t , -k 3 | cat aux.1 -
#     5. Por ultimo eliminar el archivo aux.1
rm aux.1
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 02. Ordene el archivo anterior por CustomerID y luego por Birthdate
#     No entiendo muy bien el ejercicio, quizas estoy usando un archivo diferente, por tal motivo
#     ordenaré primero por Birthdate y luego si hay coincidencias, ordenar por employee id
#     1. Guardar los encabezados
head -n 1 employee > aux.1
#     2. Eliminar el encabezado para poder trabajar, ordenar primero por la columna 9 y si hay
#        conflictos que ordene por la columna 2, al final que le pegue los titulos de las columnas
#        al resultado y que lo copie en pantalla
tail -n +2 employee | sort -t , -k 9,9 -k 2,2 | cat aux.1 -
#     3. Eliminar el archivo aux.1
rm aux.1
# Esta solucion no es perfecta, pues trata a las fechas como si fueran caracteres
#--------------------------------------------------------------------------------------------------
#=================================================================================================#


#--------------------------------------------------------------------------------------------------
# 21. Para eliminar lineas que sea repetidas y que se encuentran consecutivas se utiliza el comando
#     'uniq'
seq -f 'linea %g' 3 > aux.1
cat aux.1 aux.1 aux.1 aux.1
 #       linea 1
 #       linea 2
 #       linea 3
 #       linea 1
 #       linea 2
 #       linea 3
 #       linea 1
 #       linea 2
 #       linea 3
 #       linea 1
 #       linea 2
 #       linea 3
#     Cuando al anterior resultado se le aplica el comando uniq
cat aux.1 aux.1 aux.1 aux.1 | uniq
 #       linea 1
 #       linea 2
 #       linea 3
 #       linea 1
 #       linea 2
 #       linea 3
 #       linea 1
 #       linea 2
 #       linea 3
 #       linea 1
 #       linea 2
 #       linea 3
#     Al no haber filas repetidas de manera consecutiva no es capaz de eliminarlas.
#     Sin embargo si primero se ordena las lineas, al poner consecutivas las lienas iguales
#     logra funcionar sin problemas y se logra el objetivo que se queria
cat aux.1 aux.1 aux.1 aux.1 | sort | uniq
 #       linea 1
 #       linea 2
 #       linea 3
rm aux.1
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 22. Contar numero de lineas, palabras, caracteres o bytes de un archivo con el comando 'wc'
seq -f 'esta es la linea %g del archivo aux.1' 6 > aux.1
seq -f 'esta es la liena %g del archivo aux.2' 9 > aux.2
#     * Numero de lineas
wc -l aux.1 aux.2
#     * Numero de palabras
wc -w aux.1 aux.2
#     * Numero de caracteres
wc -m aux.1 aux.2
#     * Numero de bytes
wc -c aux.1 aux.2
#     Por defecto, imprime las lineas, las palabras y los bytes
wc aux.1 aux.2
# Eliminando los archivos auxiliares
rm aux.*
#--------------------------------------------------------------------------------------------------

#=================================================================================================#
#                                            EJERCICIO                                            #
#=================================================================================================#

#--------------------------------------------------------------------------------------------------
# 01. Cuántos registros tienen los archivos product, orderdetail y customer
#     1. Irnos a la carpeta donde estan estos archivos
cd files
#     2. Hacer un conteo de las lineas que hay en los 3 archivos
wc -l product orderdetail customer
#     3. Devolvernos a la carpeta donde estabamos de Bash
cd ..
#--------------------------------------------------------------------------------------------------
#=================================================================================================#

#--------------------------------------------------------------------------------------------------
# 23. Busqueda con expresiones regulares con el comando 'grep'
#     El siguiente ejemplo muestra las lineas que contienen un 1 en los numeros del 1 al 20
seq 20 | grep 1
#     El simbolo '$' significa el FINAL de la liena
seq 20 | grep 1$
#     El simbolo '^' significa el INICIO de la linea
seq 20 | grep ^1
#--------------------------------------------------------------------------------------------------

#=================================================================================================#
#                                            EJERCICIO                                            #
#=================================================================================================#

#--------------------------------------------------------------------------------------------------
# 01. Cuántos registros hay para la ciudad de AUSTIN en el archivo consumer (customer?)
#     1. Movernos nuevamente a la carpeta donde esta el archivo
cd files
#     2. Verificar el contenido del archivo
head -n 2 customer
#     3. Revisar como llegar hasta la columna que deseo, en este caso la 3ra
grep austin -i customer #Ninguno :| :'(
#     4. Volver a la carpeta Bash
cd ..
#--------------------------------------------------------------------------------------------------
#=================================================================================================#

#--------------------------------------------------------------------------------------------------
# 24. Reemplazo de cadenas de texto con comando 'tr' (translate)
#     El parametro '-d' se usa para eliminar 
echo 'h-o-l-a- -m-u-n-d-o-' | tr -d '-'
#     De lo contrario se le debe adicionar un parametro mas a la llamada de 'tr' indicandole con
#     que se desea reemplazar
echo 'h-o-l-a- -m-u-n-d-o-' | tr '-' '.'
#     Otra forma de pasarle el texto a tr
tr '-' '.' << EOF
'h-o-l-a- -m-u-n-d-o-'
EOF
#     Otra mas
echo 'h-o-l-a- -m-u-n-d-o-' > aux.1
tr '-' '.' < aux.1
#     A mayusculas
tr '[:lower:]' '[:upper:]' < aux.1
#     Eliminar archivo auxiliares
rm aux.1
#--------------------------------------------------------------------------------------------------

#=================================================================================================#
#                                            EJERCICIO                                            #
#=================================================================================================#

#--------------------------------------------------------------------------------------------------
# 01. Para el siguiente archivo, convierta únicamente la primera fila a minúsculas.
cat > out.1 <<EOF
Date, Year, CustomerID, Value
2013-01-12, 2013, 1, 100
2014-05-12, 2014, 1, 100
2013-02-25, 2013, 2, 200
2013-04-04, 2013, 1, 100
2013-06-21, 2013, 2, 200
2014-05-12, 2014, 1, 100
2014-05-12, 2014, 2, 200
2013-02-28, 2013, 1, 100
2013-08-02, 2013, 1, 100
EOF
#     1. Organizar la fila
head -n 1 out.1 | tr '[:lower:]' '[:upper:]' > out.2
#     2. Concatenarlo con los datos
tail -n +2 out.1 | cat out.2 -
#     3. Eliminar los archivos auxiliares
rm out.*
#--------------------------------------------------------------------------------------------------
#=================================================================================================#


#--------------------------------------------------------------------------------------------------
# 24. Extraer porciones de texto por cada linea con el comando 'cut'
echo -e "1234567890\nabcdefghij\nklmnopqrst" | cut -c3-5
#     El '-' indica las columnas entre la primera y la segunda, la ',' se usa para separarlas
echo -e "1234567890\nabcdefghij\nklmnopqrst" | cut -c2-4,6-8,10
#     Con el parametro '-f' y '-d' podemos manipular archivos delimitados (Con columnas)
echo -e "FieldA,FieldD,FieldE\n2,X,2X\n3,Y,3Y\n4,Z,4Z" | cut -d, -f2
#         -d, Significa que el delimitador es una coma
#         -f2 Significa que se va a usar la columna 2
echo -e "FieldA,FieldD,FieldE\n2,X,2X\n3,Y,3Y\n4,Z,4Z" | cut -d, -f1,2
#     EJERCICIO
#     1. Calcule el número de valores diferentes en la columna supplier.id del archivo product
cd files
#        Mirar lo que tiene el archivo
head -n 2 product
#        a. cortar solo la 3ra columna
#        b. ordenarla
#        c. eliminar repetidos
#        d. contar el numero de lineas que quedaron
cut -d, -f3 product | sort | uniq | wc -l
#     2. Obtenga un listado ordenado de las ciudades en el archivo customer
head -n2 customer
#        a. cortar la 3ra columna
#        b. ordenarla
#        c. Eliminar repetidas
cut -d, -f3 customer | sort | uniq
#     3. Obtenga el apellido para todos los empleados en el archivo employee
head -n2 employee
#        a. Extraer la columna 3 con el nombre completo
#        b. Extraer la segunda palabra con el apellido
#        c. Solo por ser un ejercicio de muestra mostrar solo los primeros registros
cut -d, -f3 employee | cut -d' ' -f2 | head
#     Volver a la carpeta bash
cd ..
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 25. Borrar columnas con 'colrm' seguido por la columna inicial y la final
echo \
"123456790
abcdefghi
jklmnopqr" \
| colrm 3 5 # Elimina desde la columna 3 a la 5, incluyendolas
#     Si no se especifica la columna donde debe terminar, elimna hasta el final
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 26. Join de archivos con 'join' seguido de las opciones y los 2 archivos a unir
#     '-t' para especificar el separador de columnas
#     '-1' para especificar la columna llave del archivo 1
#     '-2' para especificar la columna llace del archivo 2
#     '-o' para especificar las columnas que se desean tener en la salida
cat > out.1 <<EOF
key, F1, F2
  1, 11, 12
  2, 21, 22
  4, 41, 42
EOF
cat > out.2 <<EOF
key, F3, F4
  1, 13, 14
  2, 23, 24
  3, 33, 34 
EOF
#     Luego de creado los archivos ahora si vamos a unirlos
join -t, out.1 out.2
#     Por defecto la columna por la cual se unen es la primera, sin embargo se puede especificar
join -t, -1 1 -2 1 out.1 out.2
#     Para especificar las columnas deseadas en la salida
join -t, -o1.1,1.2,2.3 out.1 out.2
#     Eliminar los archivos auxiliares
rm out.*
# EJERCICIO
# 1. Agregue los campos EmployeeName del archivo employee y  Name de customer a los archivos
#     order2010, ..., order2015
# TODO: Pendiente
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 27. Pegar linea con linea con comando 'paste', '-d' para asignar un delimitador (TAB por defecto)
seq -f 'linea %g archivo 1' 5 > out.1
seq -f 'linea %g archivo 2' 5 > out.2
paste -d'-' out.1 out.2
rm out.*
#--------------------------------------------------------------------------------------------------





