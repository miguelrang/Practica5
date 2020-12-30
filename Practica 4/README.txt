***********************************************************************************************************************
	       ESTE PROGRAMA SIRVE PARA CREAR, RENOMBRAR, MOVER O ELIMINAR ARCHIVOS O CARPETAS.
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		     A continuacion se muestra de que manera se puede ejecutar el código:
=======================================================================================================================
[*] Si vas a trabajar con Carpetas:
:::: PS C:\Users\tu_usuario\Documentos\Practica4> .\Application.ps1 -opt1 1

:[+] Si vas a CREAR uno:
::::: PS C:\Users\tu_usuario\Documentos\Practica4> .\Application.ps1 -opt1 1 -opt2 1 -name "Aqui escribes el nombre de tu
carpeta a crear"

:[+] Si vas a RENOMBRAR uno:
::::: PS C:\Users\tu_usuario\Documentos\Practica4> .\Application.ps1 -opt1 1 -opt2 2 -name "Aqui escribes el nombre de tu
carpeta" -new_name "El nuevo nombre de la carpeta"

:[+] Si vas a MOVER uno:
::::: PS C:\Users\tu_usuario\Documentos\Practica4> .\Application.ps1 -opt1 1 -opt2 3 -name "Aqui escribes el nombre de tu
carpeta" -new_dir "El directorio a donde la quieres mover"

:[+] Si vas a ELIMINAR uno:
::::: PS C:\Users\tu_usuario\Documentos\Practica4> .\Application.ps1 -opt1 1 -opt2 4 -name "Aqui escribes el nombre de tu
carpeta a eliminar"
=======================================================================================================================
[*] Si vas a trabajar con Archivos:
:::: PS C:\Users\tu_usuario\Documentos\Practica4> .\Application.ps1 -opt1 2

:[+] Si vas a CREAR una:
::::: PS C:\Users\tu_usuario\Documentos\Practica4> .\Application.ps1 -opt1 2 -opt2 1 -name "Aqui escribes el nombre de tu
archivo a crear"

:[+] Si vas a RENOMBRAR una:
::::: PS C:\Users\tu_usuario\Documentos\Practica4> .\Application.ps1 -opt1 2 -opt2 2 -name "Aqui escribes el nombre de tu
archivo" -new_name "El nuevo nombre del archivo"

:[+] Si vas a MOVER una:
::::: PS C:\Users\tu_usuario\Documentos\Practica4> .\Application.ps1 -opt1 2 -opt2 3 -name "Aqui escribes el nombre de tu
archivo" -new_dir "El directorio a donde lo quieres mover"

:[+] Si vas a ELIMINAR una:
::::: PS C:\Users\tu_usuario\Documentos\Practica4> .\Application.ps1 -opt1 2 -opt2 4 -name "Aqui escribes el nombre de tu
archivo a eliminar"
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
***********************************************************************************************************************