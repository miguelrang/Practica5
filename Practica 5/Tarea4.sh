#!/bin/bash


for (( i = 0; $i <= 3; i = $i + 1 )); do

	if [[ $i -le 1 ]]; then

		if [[ $i == 0 ]]; then
			file=mystery_img1.txt
			var="5db9862819edb16f9ac0f3b1c406e79d"

		elif [[ $i == 1 ]]; then
			file=mystery_img2.txt
			var="b091a841da98ca516635f4dfea1dbaf5"
		fi

		checksum_file=$(md5sum $file | awk '{print $1;}')
		echo "checksum: ${checksum_file}"
		echo "checksum original: ${var}"

		if [[ "$checksum_file" == "$var" ]]; then
			echo "Son iguales"
			img_str=$(cat $file)
			file=Archivo$i
			echo "$img_str" | base64 -d > ${file}.jpg
			echo "imagen decodificada y guardada"
		else
			echo "No son iguales"
		fi

	fi

	if [[ $i == 2 ]]; then
		file=msg.txt
		var=40744679dff4bf36705c00f9cb815579

		checksum_file=$(md5sum -t $file | awk '{print $1}')
		echo "checksum: ${checksum_file}"
		echo "checksum original: ${var}"

		if [[ "$checksum_file" == "$var" ]]; then
			echo "Son iguales"
			img_str=$(cat $file)
			echo "$img_str" | base64 $file > "msgEncriptado"
			echo "Texto codificada y guardada"
		else
			echo "No son iguales"
		fi

	fi
	if [[ $i == 3 ]]; then
		file=fcfm.png
		var="4260808329804b5f553cf3e3d5a446c6"

		checksum_file=$(md5sum -b $file | awk '{print $1}')
		echo "checksum: ${checksum_file}"
		echo "checksum original: ${var}"

		if [[ "$checksum_file" == "$var" ]]; then
			echo "Son iguales"
			echo fcfm.png | base64 $file > "fcfmEncriptado"
			echo "imagen codificada y guardada"
		else
			echo "No son iguales"
		fi
	fi
	echo
	echo
done


mkdir Archivos
cp fcfm.png Archivos
cp msg.txt Archivos
cp mystery_img1.txt Archivos
cp mystery_img2.txt Archivos

mkdir "Archivos Nuevos"
mv fcfmEncriptado "Archivos Nuevos"
mv msgEncriptado "Archivos Nuevos"
mv Archivo0.jpg "Archivos Nuevos"
mv Archivo1.jpg "Archivos Nuevos"