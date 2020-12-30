function Create-File($name){
    [String]$directory = dir
    $verify_name = "*$name*"
    if($directory -notlike $verify_name){
        if($directory -notlike "*file.txt*" -and $name -ne "file.txt"){
            $new_name = $name
            $name = "file.txt"
            New-Item -Name "file.txt" | Rename-File $name $new_name
        }else{
            New-Item -Name $name
        }
    }else{
        Write-Host "[!] Este archivo ya existe en el directorio '$PWD'"
        Write-Host "::: *Recuerde que PowerShell no ve diferencia entre"
        Write-Host ":::  mayusculas y minusculas"
    }
    
}

function Rename-File([String]$name, [String]$new_name){
    [String]$directory = dir
    $verify_name = "*$name*"
    if($directory -like $verify_name){
        
        $verify_newname = "*$new_name*"
        if($directory -notlike $verify_newname){
            ren $name $new_name
        }else{
            Write-Host "[!] Este archivo ya existe en el directorio '$PWD'"
            Write-Host "::: *Recuerde que PowerShell no ve diferencia entre"
            Write-Host ":::  mayusculas y minusculas"
        }
    }else{
        Write-Host "[!] Este archivo no existe en el directorio '$PWD'"
    }

}

function Move-File($name, $new_dir){
    try{
        if($new_dir -like "*../*" -or $new_dir -like "*C:*" -or $new_dir -like "*..\*" -or $new_dir -like "*..*"){
            move $name $new_dir -ErrorAction SilentlyContinue
        }else{
            Write-Host "[!] No agrego un directorio valido."
            Write-Host "::: Lea el archivo README.txt para mas informacion."
        }
    }catch{
        Write-Host "[!] Ya existe un archivo con este nombre en"
        Write-Host "::: ese directorio"
    }
}

function Delete-File($name){
    [String]$directory = dir
    $verify_name = "*$name*"
    if($directory -like $verify_name){
        Remove-Item $name
    }else{
        Write-Host "[!] Este archivo no existe en el directorio '$PWD'"
        Write-Host "::: *Recuerde que PowerShell no ve diferencia entre"
        Write-Host ":::  mayusculas y minusculas"
    }
}
