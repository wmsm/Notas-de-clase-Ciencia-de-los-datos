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
# 19. Usar 'less' para abrir un editor y revisar un archivo
less employee
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# 20. 
#--------------------------------------------------------------------------------------------------





