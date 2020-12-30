function Create-Folder($name){
    [String]$directory = dir
    $verify_name = "*$name*"
    if($directory -notlike $verify_name){
        mkdir $name
    }else{
        Write-Host "[!] Esta carpeta ya existe en el directorio '$PWD'"
        Write-Host "::: *Recuerde que PowerShell no ve diferencia entre"
        Write-Host ":::  mayusculas y minusculas"
    }
    
}

function Rename-Folder([String]$name, [String]$new_name){
    [String]$directory = dir
    $verify_name = "*$name*"
    if($directory -like $verify_name){
        
        $verify_newname = "*$new_name*"
        if($directory -notlike $verify_newname){
            ren $name $new_name
        }else{
            Write-Host "[!] Esta carpeta ya existe en el directorio '$PWD'"
            Write-Host "::: *Recuerde que PowerShell no ve diferencia entre"
            Write-Host ":::  mayusculas y minusculas"
        }
    }else{
        Write-Host "[!] Esta carpeta no existe en el directorio '$PWD'"
    }

}

function Move-Folder($name, $new_dir){
    try{
        if($new_dir -like "*../*" -or $new_dir -like "*C:*" -or $new_dir -like "*..\*" -or $new_dir -like "*..*"){
            move $name $new_dir -ErrorAction SilentlyContinue
        }else{
            Write-Host "[!] No agrego un directorio valido."
            Write-Host "::: Lea el archivo README.txt para mas informacion."
        }
    }catch{
        Write-Host "[!] Ya existe una carpeta con este nombre en"
        Write-Host "::: ese directorio"
    }
}

function Delete-Folder($name){
    [String]$directory = dir
    $verify_name = "*$name*"
    if($directory -like $verify_name){
        Remove-Item $name
    }else{
        Write-Host "[!] Esta carpeta no existe en el directorio '$PWD'"
        Write-Host "::: *Recuerde que PowerShell no ve diferencia entre"
        Write-Host ":::  mayusculas y minusculas"
    }
}
