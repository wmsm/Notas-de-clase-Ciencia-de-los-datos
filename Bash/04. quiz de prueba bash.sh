#--------------------------------------------------------------------------------------------------
# QUIZ DE ENTRENAMIENTO DE BASH
#--------------------------------------------------------------------------------------------------

# Primero debemos ir a la carpeta donde está la información con la cual se
#    debe resolver las preguntas del QUIZ
cd "/mnt/c/Users/HP/01. Proyectos de jupyter/01. Ciencia de los datos/Bash/files/quiz"

# 01.
head -n 1 Discover.txt > out.1
head -n 3 Discover.txt | tail -n 1 | cat out.1 - | cut -d, -f3

# 02.
head -n 3 person
tail -n +2 person | sed '/"Riverside (California)"/d' | wc -l

# 03.
head person
head -n  1 person > out.1
tail -n +2 person | sort -t, -k1,1 | head -n 28 | tail -n 1 | cat out.1 - | cut -d, -f3

# 04.
head Discover.txt
head -n 1 Discover.txt > out.1
tail -n +2 Discover.txt | head -n 3819 | tail -n 1 | cat out.1 - | cut -d, -f4

# 05.
head person
tail -n +2 person | sed -n '/"Greensboro (North Carolina)"/p' | wc -l

# 06.
ls *.csv
echo "ccn","ssn" > out.1
for i in *.csv
do
    tail -n +2 "$i" >> out.1
done
head out.1

sed -n '/^"3608-1682-4445-1839",/p' out.1
head -n 1 person > out.1
sed -n '/^"320-54-1394",/p' person | cat out.1 - | cut -d, -f5

# 07.
cat *.txt | sed -n '/,"Oct/p' > out.1
cat *.txt | sed -n '/,"Nov/p' >> out.1
cat *.txt | sed -n '/,"Dec/p' >> out.1
wc -l out.1

# 08.
cat *.txt | sed -n '/^...........5407/p' | wc -l
cat *.csv | sed -n '/^...........5407/p' | wc -l

# 09.
cut -d, -f5 person | sed -n '/F.*O/p' | wc -l

# 10.
cat *.txt | cut -d, -f4 | sed -n '/09."/p' > out.1
cat *.txt | cut -d, -f4 | sed -n '/100"/p' >> out.1
wc -l out.1

# 11.
wc -l *.csv | sort

# NOTA: 2.56 :'(


#--------------------------------------------------------------------------------------------------
# SEGUNDO INTENTO

# Primero debemos ir a la carpeta donde está la información con la cual se
#    debe resolver las preguntas del QUIZ
cd "/mnt/e/Descargas/bash-for-analytics-master/quiz"

# 01.
ls Amer*
head -n 2 American\ Express.txt | cut -d, -f3

# 02.
head -n 3 person
wc -l person
cut -d, -f3 person | tail -n +2 | sed '/Los Angeles (California)/d' | wc -l

# 03.
tail -n +2 person | sort -t, -k1,1 | head -n21 | tail -n1 | cut -d, -f3

# 04.
ls Wells\ Fargo*
head Wells\ Fargo*
tail -n +2 Wells\ Fargo.txt | cut -d, -f2 | tail -n +3959 | head -n1

# 05.
cut -d, -f3 person | grep 'Fremont (California)' | wc -l

# 06.
head -n2 person
grep '3608-1721-4342-1216' *.csv
grep '279-85-1968' person | cut -d, -f5

# 07.
head -n2 *.txt
cut -d, -f2 *.txt | grep 'Jul\|Aug\|Sep' | wc -l

# 08.
head -n2 *.csv
cut -d, -f1 *.csv | cut -d'-' -f3 | grep 4711 | wc -l
cut -c12-15 *.csv | grep 4711 | wc -l

# 09.
head person
cut -d, -f5 person | grep "Y.* G" | wc -l

# 10.
head *.txt 
cut -d, -f4 *.txt | grep '64[0-9]\|650' | wc -l

# 11.
sort -b -n -t' ' -k1,1 -r
head -n2 *.txt
wc -l *.csv | sort -b -n -t' ' -k1,1 -r | head -n 2

#--------------------------------------------------------------------------------------------------
# TERCER INTENTO

# 01.
head -n2 Bank*
cut -d, -f2 Bank\ of\ America.txt | tail -n +2 | head -n2 | tail -n1

# 02.
head -n2 person
cut -d, -f3 person | tail -n +2 | sed '/New York (New York)/d' | wc -l

# 03.
head -n2 person
tail -n +2 person | sort -t, -k1,1 | head -n2 | tail -n1 | cut -d, -f3

# 04.
head Visa.txt
cut -d, -f4 Visa.txt | tail -n+2 | head -n3868 | tail -n1

# 05.
ls New\ York\ Community\ Bancorp*
tail -n+2 New\ York\ Community\ Bancorp.csv | wc -l

# 06.
head -n2 person
head -n2 *.csv
grep '3608-2751-4523-1245' *.csv
grep '320-31-1376' person | cut -d, -f5

# 07.
head -n2 *.txt
cut -d, -f2 *.txt | grep 'Apr\|May\|Jun' | wc -l

# 08.
head -n2 *.csv
cut -d, -f1 *.csv | cut -d'-' -f3 | grep '4580' | wc -l

# 09.
head -n2 person
cut -d, -f5 person | grep 'R.* K' | wc -l

# 10.
head -n2 *.txt
cut -d, -f4 *.txt | grep '86[0-9]\|870' | wc -l

# 11. NOTA: se le debe restar un 1 por los encabezados
ls *.csv | wc -l #Bancos
ls *.txt | wc -l #Franquicias
wc -l *.csv | sort -b -n -t' ' -k1.1 -r | head -n2 | tail -n1


#--------------------------------------------------------------------------------------------------
# QUIZ DE EVALUACION

# 01.
head -n2 PNC.txt | cut -d, -f2

# 02.
head -n2 person
cut -d, -f3 person | tail -n +2 | sed '/Newark (New Jersey)/d' | wc -l

# 03.
head -n2 person
tail -n +2 person | sort -t, -k1,1 | head -n84 | tail -n1 | cut -d, -f3

# 04.
head PNC.txt
tail -n +2 PNC.txt | head -n3741 | tail -n1 | cut -d, -f4

# 05.
head person
cut -d, -f3 person | grep 'Laredo (Texas)' | wc -l

# 06.
head -n2 person
head -n2 *.csv
grep '3608-2588-5691-1686' *.csv
grep '144-81-1813' person | cut -d, -f5

# 07.
head -n2 *.txt
cut -d, -f2 *.txt | grep 'Oct\|Nov\|Dec' | wc -l

# 08.
head -n2 *.csv
cut -d, -f1 *.csv | cut -d'-' -f3 | grep '5470' | wc -l

#09.
head -n2 person
cut -d, -f5 person | grep 'D.* S' | wc -l

# 10.
head -n2 *.txt
cut -d, -f4 *.txt | grep '26[0-9]\|270' | wc -l

# 11. NOTA: se le debe restar un 1 por los encabezados
ls *.csv | wc -l #Bancos
ls *.txt | wc -l #Franquicias
wc -l *.csv | sort -b -n -t' ' -k1.1 -r | head -n2 | tail -n1
