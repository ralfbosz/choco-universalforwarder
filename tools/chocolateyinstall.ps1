$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName= 'UniversalForwarder'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://download.splunk.com/products/splunk/releases/6.5.0/universalforwarder/windows/splunkforwarder-6.5.0-59c8927def0f-x86-release.msi'
$url64      = 'http://download.splunk.com/products/splunk/releases/6.5.0/universalforwarder/windows/splunkforwarder-6.5.0-59c8927def0f-x64-release.msi'
#$fileLocation = Join-Path $toolsDir 'NAME_OF_EMBEDDED_INSTALLER_FILE'
#$fileLocation = Join-Path $toolsDir 'SHARE_LOCATION_OF_INSTALLER_FILE'

#if ($env:chocolateyPackageParameters) { 
# $params = $env:chocolateyPackageParameters
#}
#Else { 
  $params = @{} #empty hash
#}

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi' #only one of these: exe, msi, msu
  url           = $url
  url64bit      = $url64
  #file         = $fileLocation

  #MSI
  silentArgs    = "LAUNCHSPLUNK=0 AGREETOLICENSE=Yes /quiet"
  validExitCodes= @(0, 3010, 1641)

  # optional, highly recommended
  softwareName  = 'UniversalForwarder*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = '3ee387a71748b632ad3e4bb09ddcb9f22fb24ba5f5d7a9889764184cb13bbd4c'
  checksumType  = 'sha256' #default is md5, can also be sha1
  checksum64    = '4eeba47224ad288089dfbd6d0e4171d9dd19588cb38296c7074f7ca1a732bc5f'
  checksumType64= 'sha256' #default is checksumType
}

Install-ChocolateyPackage @packageArgs
