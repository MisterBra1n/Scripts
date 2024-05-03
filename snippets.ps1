# Before running script(s), make sure to run the following:
# Set-ExecutionPolicy RemoteSigned

# Search for all files in a directory that have been accessed in the last 2 years and export data to CSV
$item = Get-Item C:\ProgramData\Fonts\
Get-ChildItem -Path $item -Filter *.* -Recurse |
  ?{$_.LastAccessTime -gt (Get-Date).AddYears(-2)} |
    Select-Object Name, LastAccessTime | Export-Csv "test.csv" -force
