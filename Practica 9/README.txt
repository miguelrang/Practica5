***********************************************************************************************************************
                                         ENVIA CORREOS MEDIANTE BASH
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
                       A continuacion se muestra de que manera se puede ejecutar el código
=======================================================================================================================
[*] Primero: El codigo debe de ser ejecutado como super usuario, como se muestra en el siguiente ejemplo:
::: mikeagr@mikeagr:~/Documents/Practica9$ sudo ./Application.sh

:[*] Segundo: El codigo debe de contener 3 parametros: 1. Correo, 2. Contraseña, 3. Hostname. Ejemplo:
::: mikeagr@mikeagr:~/Documents/Practica9$ sudo ./Application.sh "correo@gmail.com" "contraseña_del_correo" "el_host"

::[*] Tercero: Hay unos o mas parametros que se deben de agregar, me refiero al destinatario, para agregarlo(s) hay
::::: que hacer lo siguiente:
::::: mikeagr@mikeagr:~/Documents/Practica9$ sudo ./Application.sh "correo@gmail.com" "contraseña_del_correo" "el_host"
::::: "destinatario1" "destinatario2" "destinatario3"

:::[*] Por ultimo: Como en cualquier correo es necesario agregarle el texto, el mismo còdigo se lo solicitara, y una
:::::: vez que termine su mensaje debe de presionar las siguientes teclas:
:::::: 1. Enter
:::::: 2. Ctrl + D
=======================================================================================================================
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
***********************************************************************************************************************
