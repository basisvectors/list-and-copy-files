function Get-Tree {
    param (
        [string]$Path
    )

    $tree = @()
    Get-ChildItem -Path $Path -Recurse | ForEach-Object {
        if (-not $_.PSIsContainer) {
            # append relative path to the file
            $tree += $_
        }
    }
    return $tree
}
# print ascii art of "list files"
Write-Host @"
                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠖⠒⠢⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
                ⠀⠀⠀⠀⠀⠀⠀⠀⡴⠃⠀⠀⠀⠀⠀⠙⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
                ⠀⠀⠀⠀⠀⠀⠀⣰⠁⠀⠀⠀⠀⠀⠀⠀⠈⠳⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
                ⠀⠀⠀⠀⠀⠀⡰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
                ⠀⠀⠀⠀⣠⠞⠁⠀⠀⠀⠀⠀⠀⠀⠂⠀⠤⠤⡀⠈⠳⣄⠀⠀⠀⠀⠀⠀⠀⠀
                ⠀⠀⣠⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⢄⠀⠀⠀⠀⠀⠀
                ⢠⠞⠁⠀⣀⣠⣤⠤⠤⠤⠤⢤⣤⠤⠤⠤⠤⣤⣀⣀⡀⠀⠀⠀⠑⢤⠀⠀⠀⠀
                ⣣⠔⠚⠻⣄⣡⣞⣄⣠⣆⠀⢼⣼⣄⣀⣀⣠⣆⠜⡘⡻⠟⠙⣲⠦⣈⢳⡀⠀⠀
                ⡇⠒⢲⡤⡜⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⠛⠤⣖⠬⠓⠂⠉⣿⠇⠀⠀
                ⠙⠲⠦⠬⣧⡀⠀⠀⠀⠀⠀⣠⣿⣿⣷⡄⠀⠀⠀⠀⠀⣞⠀⢀⣲⠖⠋⠀⠀⠀
                ⠀⠀⠀⠀⠘⣟⢢⠃⠀⠀⠀⠉⠙⠻⠛⠁⠀⠀⠀⢀⡜⠒⢋⡝⠁⢀⣀⣤⠂⠀
                ⠀⠀⠀⠀⠀⡇⠷⠆⠶⠖⠀⠀⠀⠀⠀⠀⠀⠀⣠⠮⠤⠟⠉⠀⢰⠱⡾⣧⠀⠀
                ⠀⠀⠀⠀⠀⠹⢄⣀⣀⠀⠀⠀⠀⠀⠀⣀⡤⠚⠁⠀⢠⣤⡀⣼⢾⠀⠀⡟⠀⠀
                ⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛⠛⠒⡏⠀⡡⠣⢖⣯⠶⢄⣀⣿⡾⠋⢸⢀⡶⠿⠲⡀
                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⣹⠃⣀⣤⠞⠋⠀⠉⠢⣿⣿⡄⠀⣿⠏⠀⠀⠐⢣
                ⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⢱⢡⡾⠋⠀⠀⢀⡐⣦⣀⠈⠻⣇⢸⢁⣤⡙⡆⠈⡏
                ⠀⠀⠀⠀⠀⠀⣠⠎⢁⠔⡳⡟⠀⠐⠒⠒⠋⠀⠠⡯⠙⢧⡈⠻⣮⠯⣥⠧⠞⠁
                ⠀⠀⠀⣀⠴⠋⠀⢶⠋⢸⡝⠀⠀⠀⠀⠀⠀⠀⠀⣸⢦⠀⠙⡆⠘⠦⢄⡀⠀⠀
                ⠀⠀⣸⠅⢀⡤⢺⢸⠀⢸⡃⠤⠀⠀⠀⠀⣀⡤⢚⣋⣿⢄⡀⢇⡀⠀⠀⣝⡶⠀
                ⠀⠀⢿⠀⡏⠀⠘⠞⠀⢸⡵⣦⠤⠤⠖⣿⠥⠞⠉⠀⢸⠖⠁⠀⠙⠢⣑⠶⣽⢂
                ⠀⠀⠸⠤⠃⠀⠀⠀⠀⠀⠉⢳⠂⠈⡽⠁⠀⠀⠀⢀⡼⠒⠓⢤⠀⠀⠀⠙⠚⠛
                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠓⡎⠀⠀⠀⠀⢠⠎⣠⠀⠀⠈⢳⠀⠀⠀⠀⠀
                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⢸⡶⠗⠋⣱⠄⠀⠀⠀⣧⠀⠀⠀⢀
                ⠀⠀⠀⠀⠀⠀⠀⣀⠴⠒⠒⠦⣤⣷⠂⢀⡸⠁⠀⡼⠁⠀⠀⠀⠈⢺⠀⠀⠀⠀
                ⠀⠀⠀⠀⠀⢠⠋⢀⣀⡀⠀⠀⠀⠀⠀⠈⡇⠀⠀⠙⠢⠤⠤⣄⡤⠼⠀⠀⠀⠀
                ⠀⠀⠀⠀⠀⠀⠑⢦⣄⣉⣑⠢⠄⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
                    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠙⠓⠒⠒⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

  ▓█████ ▒██   ██▒▄▄▄█████▓     █████▒██▓ ██▓  ▄▄▄█████▓▓█████  ██▀███  
  ▓█   ▀ ▒▒ █ █ ▒░▓  ██▒ ▓▒   ▓██   ▒▓██▒▓██▒  ▓  ██▒ ▓▒▓█   ▀ ▓██ ▒ ██▒
  ▒███   ░░  █   ░▒ ▓██░ ▒░   ▒████ ░▒██▒▒██░  ▒ ▓██░ ▒░▒███   ▓██ ░▄█ ▒
  ▒▓█  ▄  ░ █ █ ▒ ░ ▓██▓ ░    ░▓█▒  ░░██░▒██░  ░ ▓██▓ ░ ▒▓█  ▄ ▒██▀▀█▄  
  ░▒████▒▒██▒ ▒██▒  ▒██▒ ░    ░▒█░   ░██░░██████▒▒██▒ ░ ░▒████▒░██▓ ▒██▒
  ░░ ▒░ ░▒▒ ░ ░▓ ░  ▒ ░░       ▒ ░   ░▓  ░ ▒░▓  ░▒ ░░   ░░ ▒░ ░░ ▒▓ ░▒▓░
   ░ ░  ░░░   ░▒ ░    ░        ░      ▒ ░░ ░ ▒  ░  ░     ░ ░  ░  ░▒ ░ ▒░
     ░    ░    ░    ░          ░ ░    ▒ ░  ░ ░   ░         ░     ░░   ░ 
     ░  ░ ░    ░                      ░      ░  ░          ░  ░   ░                                                                             
         

"@

$dir = Read-Host "Enter the path to your directory"
$exts_to_search = Read-Host "Enter the extension(s) to search for (separated by spaces) eg: .txt .docx .pdf"
$save_trees = Read-Host "Do you want to save the paths to a file? (y/n)"
$verbose = Read-Host "Do you want to see verbose output? (y/n)"
$save_trees = $save_trees -eq "y"
$verbose = $verbose -eq "y"
$exts_to_search = $exts_to_search -split " "
$objtree = Get-Tree -Path $dir

$tree = $objtree | ForEach-Object {
    # get the relative path of the file
    $relative_path = $_.FullName.Substring($dir.Length + 1)
    $relative_path
}

$filtered_tree = $objtree | Where-Object { $exts_to_search -contains $_.Extension } | ForEach-Object {
    # get the relative path of the file
    $relative_path = $_.FullName.Substring($dir.Length + 1)
    $relative_path
}

if ($save_trees) {
    $current_dir = Get-Location
    $current_dir = $current_dir.Path
    Write-Host "Saving the paths to $current_dir/tree.txt and $current_dir/filtered_tree.txt"
    $tree | Out-File -FilePath "tree.txt" -Encoding UTF8
    $filtered_tree | Out-File -FilePath "filtered_tree.txt" -Encoding UTF8
}

$filtered_dir = "filtered_" + $exts_to_search -join "_"
if (Test-Path $filtered_dir) {
    Remove-Item -Path $filtered_dir -Recurse -Force
}
New-Item -ItemType Directory -Path $filtered_dir

$objtree | Where-Object { $exts_to_search -contains $_.Extension } | ForEach-Object {
    $relative_path = $_.FullName.Substring($dir.Length + 1)
    $new_path = $filtered_dir + "\" + ( $relative_path -replace "\\", "_" )
    $old_path = $_.FullName
    if ($verbose) {
        Write-Host "Copying $old_path to $new_path"
    }
    Copy-Item -LiteralPath $_.PSPath -Destination $new_path
}

