Param(
    [Parameter(Mandatory)][int]$opt1,
    [Parameter(Mandatory)][int]$opt2,
    [Parameter(Mandatory)][String]$name,
    [String]$new_name,
    [String]$new_dir
)

[String]$location = dir
if($location -like "*Application.ps1*" -and $location -like "*Folder*" -and $location -like "*File*"){
    [String]$directory = $PWD
    Import-Module "$directory\File\File.psm1"
    Import-Module "$directory\Folder\Folder.psm1"

    if(($opt1 -eq 1 -or $opt1 -eq 2) -and $opt2 -ge 1 -and $opt2 -le 4){
        if($name -ne ""){
            
            # Carpetas
            if($opt1 -eq 1){

                if($opt2 -eq 1){
                    Create-Folder $name
                }elseif($opt2 -eq 2){
                    Rename-Folder $name $new_name
                }elseif($opt2 -eq 3){
                    Write-Host "$new_dir"
                    if($new_dir -ne ""){
                        Move-Folder $name $new_dir

                    }else{
                        Write-Host "[!] Para mover una carpeta es necesario agregar mas"
                        Write-Host "::: parametros."
                        Write-Host "::: Lea el archivo README.txt para mas informacion."

                    }

                }elseif($opt2 -eq 4){
                    Delete-Folder $name
                }
            
            # Archivos
            }elseif($opt1 -eq 2){

                if($opt2 -eq 1){
                    Create-File $name

                }elseif($opt2 -eq 2){
                    if($new_name -ne ""){
                       Rename-File $name $new_name
                    }else{
                        Write-Host "[!] No agrego el parametro '-new_name 'NAME''."
                        Write-Host "::: Lea el archivo README.txt para mas informacion."
                    }                
                }elseif($opt2 -eq 3){
                    if($new_dir -ne ""){
                        Move-File $name $new_dir
                    }else{
                        Write-Host "[!] No agrego el parametro '-new_dir 'DIRECTORY''."
                        Write-Host "::: Lea el archivo README.txt para mas informacion."
                    }
                }elseif($opt2 -eq 4){
                    Delete-File $name

                }
            }
        
        }else{
            Write-Host "[!] Debe agregar el nombre del archivo/carpeta"
            Write-Host "::: Lea el archivo README.txt para mas informacion."
        }

    }else{
        Write-Host "[!] Debe de agregar una opcion valida."
        Write-Host "::: Lea el archivo README.txt para mas informacion."
    }
}else{
    Write-Host "[!]Error"
    Write-Host "::: Su terminal debe de estar en el mismo"
    Write-Host "::: directorio donde se encuentran los codigos"
}
