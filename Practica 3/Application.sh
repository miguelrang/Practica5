#!/bin/bash

declare -i opt1=$1
declare -i opt2=$2
name=$3
new_name=$4
new_dir=$4

############################################################################
# Carpetas
createFolder(){
	detect="False"
	files=$(ls)
	for file in $files; do
		if [[ $name == $file ]]; then
			echo "[!] Esta carpeta ya existe." > /dev/stderr
			detect="True"
			break
		fi
	done

	name=$1
	if [[ $detect == "False" ]]; then
		echo "[*] La carpeta se creo satisfactoriamente." > /dev/stderr
		mkdir $name
	fi
}

renameFolder(){
	detect="False"
	files=$(ls)
	name="$1"
	new_name="$2"
	# Revisamos que el folder exista.
	for file in $files; do
		# Si existe la carpeta
		if [[ $file == $name ]]; then
			detect="True"
			break
		fi
	done

	if [[ $detect == "True" ]]; then
		# Verificamos que el nuevo nombre no exista ya.
		for file in $files; do
			if [[ $file == $new_name ]]; then
				# Si satisface la anterior condicion quiere decir
				# que ya existe un archivo o carpeta con el mismo nombre
				detect="True"
				break
			else
				# Si no satisface la condicion significa que no se a
				# encontrado ningun archivo con ese mismo nombre aun
				detect="False"
			fi
		done

		# Si todo esta bien...
		if [[ $detect == "False" ]]; then
			echo "[*] El nombre de la carpeta se cambio satisfactoriamente." > /dev/stderr
			mv $name $new_name

		# Si el nombre nuevo que recibira la carpeta ya existe...
		else
			echo "[!] Ya existe un archivo o carpeta con el nombre '$new_name'" > /dev/stderr
		fi
	else
		echo "[!] La carpeta '$name' no existe." > /dev/stderr
	fi
}

moveFolder(){
	detect="False"
	files=$(dir)
	name=$1
	new_dir=$2

	for file in $files; do
		# Si satisface la siguiente condicion significa
		# que la carpeta a mover si existe
		if [[ $file == $name ]]; then
			detect="True"
			echo "[*] La carpeta se movio satisfactoriamente." > /dev/stderr
			mv $name $new_dir
			break
		else
			detect="False"
		fi
	done

	if [[ $detect == "False" ]]; then
		echo "[!] No se pudo encontrar la carpeta '$name'" > /dev/stderr
	fi
}

removeFolder(){
	detect="False"
	files=$(dir)
	name=$1

	for file in $files; do
		if [[ $name == $file ]]; then
			detect="True"
			echo "[*] La carpeta '$name' se elimino satisfactoriamente." > /dev/stderr
			rm -r $name
			break
		fi
	done

	if [[ $detect == "False" ]]; then
		echo "[!] La carpeta '$name' no existe." > /dev/stderr
	fi

}
#####################################################################################
# Archivos
createFile(){
	detect="False"
	files=$(ls)
	for file in $files; do
		if [[ $name == $file ]]; then
			echo "[!] Este archivo ya existe." > /dev/stderr
			detect="True"
			break
		fi
	done

	name=$1
	if [[ $detect == "False" ]]; then
		echo "[*] El archivo se creo satisfactoriamente." > /dev/stderr
		touch $name
	fi
}

renameFile(){
	detect="False"
	files=$(ls)
	name="$1"
	new_name="$2"
	# Revisamos que el File exista.
	for file in $files; do
		# Si existe el archivo
		if [[ $file == $name ]]; then
			detect="True"
			break
		fi
	done

	if [[ $detect == "True" ]]; then
		# Verificamos que el nuevo nombre no exista ya.
		for file in $files; do
			if [[ $file == $new_name ]]; then
				# Si satisface la anterior condicion quiere decir
				# que ya existe un archivo o carpeta con el mismo nombre
				detect="True"
				break
			else
				# Si no satisface la condicion significa que no se a
				# encontrado ningun archivo con ese mismo nombre aun
				detect="False"
			fi
		done

		# Si todo esta bien...
		if [[ $detect == "False" ]]; then
			echo "[*] El nombre del archivo se cambio satisfactoriamente." > /dev/stderr
			mv $name $new_name

		# Si el nombre nuevo que recibira el archivo ya existe...
		else
			echo "[!] Ya existe un archivo o carpeta con el nombre '$new_name'" > /dev/stderr
		fi
	else
		echo "[!] La carpeta '$name' no existe." > /dev/stderr
	fi
}

moveFile(){
	detect="False"
	files=$(dir)
	name=$1
	new_dir=$2

	if [[ $new_dir == *".."* ]]; then
		new_dir=$new_dir
	else
		if [[ $new_dir == *"\\"* ]]; then
			new_dir=$new_dir
		else
			new_dir="\\$new_dir"
		fi
	fi

	for file in $files; do
		# Si satisface la siguiente condicion significa
		# que la carpeta a mover si existe
		if [[ $file == $name ]]; then
			detect="True"
			echo "[*] La carpeta se movio satisfactoriamente." > /dev/stderr
			mv $name $new_dir
			break
		else
			detect="False"
		fi
	done

	if [[ $detect == "False" ]]; then
		echo "[!] No se pudo encontrar la carpeta '$name'" > /dev/stderr
	fi
}

removeFile(){
	detect="False"
	files=$(dir)
	name=$1

	for file in $files; do
		if [[ $name == $file ]]; then
			detect="True"
			echo "[*] El archivo '$name' se elimino satisfactoriamente." > /dev/stderr
			rm $name
			break
		fi
	done

	if [[ $detect == "False" ]]; then
		echo "[!] El archivo '$name' no existe." > /dev/stderr
	fi

}

########################################################################
# Aplicacion
if [[ ($opt1 == 1 || $opt1 == 2) && $opt2 -ge 1 && $opt2 -le 4 ]]; then
	# Carpetas	
	if [[ $opt1 == 1 ]]; then
		if [[ $opt2 == 1 ]]; then
			# Crear Carpeta
			createFolder $name | echo "[*] Creando carpeta..."
		elif [[ $opt2 == 2 ]]; then
			# Renombrar Carpeta
			renameFolder $name $new_name | echo "[*] Renombrando carpeta..."
		elif [[ $opt2 == 3 ]]; then
			# Mover Carpeta
			moveFolder $name $new_dir | echo "[*] Moviendo carpeta..."
		elif [[ $opt2 == 4 ]]; then
			# Eliminar Carpeta
			removeFolder $name | echo "[*] Eliminando carpeta..."
		fi
	# Archivos
	elif [[ $opt1 == 2 ]]; then	
		if [[ $opt2 == 1 ]]; then
			# Crear Carpeta
			createFile $name | echo "[*] Creando carpeta..."
		elif [[ $opt2 == 2 ]]; then
			# Renombrar Carpeta
			renameFile $name $new_name | echo "[*] Renombrando carpeta..."
		elif [[ $opt2 == 3 ]]; then
			# Mover Carpeta
			moveFile $name $new_dir | echo "[*] Moviendo carpeta..."
		elif [[ $opt2 == 4 ]]; then
			# Eliminar Carpeta
			removeFile $name | echo "[*] Eliminando carpeta..."
		fi	
	fi

else
	echo "[!] Esta opcion no existe."
	echo "::: Lea el archivo README.txt para mas informacion."
fi
