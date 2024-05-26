# Scrip_bashURL

Primeramente el scrip verifica si se ingreso una url junto al scrip de no ser asi sale del programa y no ejecuta nada mas
si se existe se asigna a la variable url 

Si la url no contiene dominio asiganara uno con la claves prevista como lo es https:// y acomodara el nombre de la pagina con las otras ventanas que contenga la url pero no matchea con la peticion https que realiza despues 

Si la url cumple con los parametros realizara una peticion https y usara el comando greap para busar coinidencias entre urls y
la url que ingresamos ,se ordenan los resultados y los normaliza para que todas las url tengan el formato 
https:// al incio ,al final se verifica que sean unicos para que no se muestre varias veces el mismo resultado 
