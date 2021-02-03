@ECHO OFF & SETLOCAL EnableDelayedExpansion
TITLE WinPEAS - Windows local Privilege Escalation Awesome Script
COLOR 0F
CALL SetOnce

REM  WinPEAS - Windows local Privilege Escalation Awesome Script
REM  Code by carlospolop; Re-Write by ThisLimn0

REM Registry scan of other drives besides 
REM true or false
SET long=false

Splash
ECHO.
CALL ColorLine             %E%32m((,.,((((((((((((((((((((,  %E%97m
CALL ColorLine      %E%32m,,..(((((((((((((((((((((((((((((((((,%E%97m              
CALL ColorLine    %E%32m,((((((((((((((((((,  %E%92m.((,%E%32m .((((((%E%97m       
CALL ColorLine    %E%32m(((((((((((((((( %E%94m%E%32m,,,########## %E%32m.( ,((((((%E%97m   
CALL ColorLine    %E%32m((((((((((( %E%94m%E%32m####### %E%32m.(. ((((((%E%97m
CALL ColorLine    %E%32m((((((.%E%92m.%E%94m%E%97m@@@@@%E%94m%E%92m######%E%32m ((((((%E%97m
CALL ColorLine    %E%32m,,.%E%92m.%E%94m%E%97m@@@@@@@@@@(%E%94m%E%92m,####%E%32m ..(((((%E%97m
CALL ColorLine    %E%32m, ,%E%92m%E%94m%E%97m#@@@@@#@@@@%E%94m%E%92m##%E%32m(( ((((%E%97m
CALL ColorLine    %E%32m..((%E%92m(##########%E%94m%E%97m#@@@@@@@@@%E%94m%E%32m,,..((((%E%97m
CALL ColorLine    %E%32m.((%E%92m(################(%E%94m%E%97m@@@@@#%E%94m%E%32m.. ((%E%97m
CALL ColorLine    %E%32m.(%E%92m(########################(%E%94m%E%32m..(%E%97m
CALL ColorLine    %E%32m.(%E%92m(#############################(%E%94m%E%32m.,(%E%97m
CALL ColorLine    %E%32m.(%E%92m(##################################(%E%94m%E%32m..(%E%97m
CALL ColorLine    %E%32m.(%E%92m(######################################(%E%94m%E%32m..(%E%97m
CALL ColorLine    %E%32m.(%E%92m(######(,..,(###################(..(%E%94m%E%32m..(%E%97m
CALL ColorLine    %E%32m.(%E%92m(######(#####((##################((######(%E%94m%E%32m..(%E%97m
CALL ColorLine    %E%32m.(%E%92m(##################((################(%E%94m%E%32m...(%E%97m
CALL ColorLine    %E%32m.((%E%92m(####################(###################%E%32m.((((%E%97m 
CALL ColorLine    %E%32m.((((%E%92m(############################################%E%32m  ((%E%97m
CALL ColorLine    %E%32m..((((%E%92m(#########################################(%E%32m..(((((.%E%97m
CALL ColorLine    %E%32m....((((%E%92m(#####################################(%E%32m .((((((.%E%97m
CALL ColorLine    %E%32m......((((%E%92m(#################################(%E%32m .(((((((.%E%97m
CALL ColorLine    %E%32m(((((((((. ,%E%92m(############################(%E%32m..(((((((((.%E%97m
CALL ColorLine        %E%32m(((((((((,  %E%92m,####################(%E%32m..((((((((((.%E%97m
CALL ColorLine              %E%32m(((((((((,.  %E%92m,,.%E%32m .(((((((((((.%E%97m
CALL ColorLine                 %E%32m(((((((((((((((((((((((((((%E%97m
ECHO.                       by carlospolop
ECHO.
ECHO.

Advisory
REM  Increase progress in title by n percent
CALL T_Progress 0
ECHO.^^! Advisory WinPEAS - Windows local Privilege Escalation Awesome Script
CALL ColorLine    %E%41mWinPEAS should be used for authorized penetration testing andor educational purposes only.%E%40;97m
CALL ColorLine    %E%41mAny misuse of this software will not be the responsibility of the author or of any other collaborator.%E%40;97m
CALL ColorLine    %E%41mUse it at your own networks andor with the network owner's permission.%E%40;97m
ECHO.

SystemInfo
CALL ColorLine %E%32m[]%E%97m BASIC SYSTEM INFO
CALL ColorLine  %E%33m[+]%E%97m WINDOWS OS
ECHO.   [i] Check for vulnerabilities for the OS version with the applied patches
ECHO.   [] httpsbook.hacktricks.xyzwindowswindows-local-privilege-escalation#kernel-exploits
systeminfo
ECHO.
CALL T_Progress 2

ListHotFixes
wmic qfe get Caption,Description,HotFixID,InstalledOn  more
set expl=no
for f tokens=3-9 %%a in ('systeminfo') do (ECHO.%%a %%b %%c %%d %%e %%f %%g  findstr i 2000 XP 2003 2008 vista && set expl=yes) & (ECHO.%%a %%b %%c %%d %%e %%f %%g  findstr i Cwindows 7 && set expl=yes)
IF %expl% == yes ECHO.   [i] Possible exploits (httpsgithub.comcodingoOSCP-2blobmasterWindowsWinPrivCheck.bat)
IF %expl% == yes wmic qfe get Caption,Description,HotFixID,InstalledOn  findstr CKB2592799 1NUL
IF %expl% == yes IF errorlevel 1 ECHO.MS11-080 patch is NOT installed! (Vulns XPSP3,2K3SP3-afd.sys)
IF %expl% == yes wmic qfe get Caption,Description,HotFixID,InstalledOn  findstr CKB3143141 1NUL
IF %expl% == yes IF errorlevel 1 ECHO.MS16-032 patch is NOT installed! (Vulns 2K8SP12,VistaSP2,7SP1-secondary logon)
IF %expl% == yes wmic qfe get Caption,Description,HotFixID,InstalledOn  findstr CKB2393802 1NUL
IF %expl% == yes IF errorlevel 1 ECHO.MS11-011 patch is NOT installed! (Vulns XPSP23,2K3SP2,2K8SP2,VistaSP12,7SP0-WmiTraceMessageVa)
IF %expl% == yes wmic qfe get Caption,Description,HotFixID,InstalledOn  findstr CKB982799 1NUL
IF %expl% == yes IF errorlevel 1 ECHO.MS10-59 patch is NOT installed! (Vulns 2K8,Vista,7SP0-Chimichurri)
IF %expl% == yes wmic qfe get Caption,Description,HotFixID,InstalledOn  findstr CKB979683 1NUL
IF %expl% == yes IF errorlevel 1 ECHO.MS10-21 patch is NOT installed! (Vulns 2KSP4,XPSP23,2K3SP2,2K8SP2,VistaSP012,7SP0-Win Kernel)
IF %expl% == yes wmic qfe get Caption,Description,HotFixID,InstalledOn  findstr CKB2305420 1NUL
IF %expl% == yes IF errorlevel 1 ECHO.MS10-092 patch is NOT installed! (Vulns 2K8SP012,VistaSP12,7SP0-Task Sched)
IF %expl% == yes wmic qfe get Caption,Description,HotFixID,InstalledOn  findstr CKB981957 1NUL
IF %expl% == yes IF errorlevel 1 ECHO.MS10-073 patch is NOT installed! (Vulns XPSP23,2K3SP22K8SP2,VistaSP12,7SP0-Keyboard Layout)
IF %expl% == yes wmic qfe get Caption,Description,HotFixID,InstalledOn  findstr CKB4013081 1NUL
IF %expl% == yes IF errorlevel 1 ECHO.MS17-017 patch is NOT installed! (Vulns 2K8SP2,VistaSP2,7SP1-Registry Hive Loading)
IF %expl% == yes wmic qfe get Caption,Description,HotFixID,InstalledOn  findstr CKB977165 1NUL
IF %expl% == yes IF errorlevel 1 ECHO.MS10-015 patch is NOT installed! (Vulns 2K,XP,2K3,2K8,Vista,7-User Mode to Ring)
IF %expl% == yes wmic qfe get Caption,Description,HotFixID,InstalledOn  findstr CKB941693 1NUL
IF %expl% == yes IF errorlevel 1 ECHO.MS08-025 patch is NOT installed! (Vulns 2KSP4,XPSP2,2K3SP12,2K8SP0,VistaSP01-win32k.sys)
IF %expl% == yes wmic qfe get Caption,Description,HotFixID,InstalledOn  findstr CKB920958 1NUL
IF %expl% == yes IF errorlevel 1 ECHO.MS06-049 patch is NOT installed! (Vulns 2KSP4-ZwQuerySysInfo)
IF %expl% == yes wmic qfe get Caption,Description,HotFixID,InstalledOn  findstr CKB914389 1NUL
IF %expl% == yes IF errorlevel 1 ECHO.MS06-030 patch is NOT installed! (Vulns 2K,XPSP2-Mrxsmb.sys)
IF %expl% == yes wmic qfe get Caption,Description,HotFixID,InstalledOn  findstr CKB908523 1NUL
IF %expl% == yes IF errorlevel 1 ECHO.MS05-055 patch is NOT installed! (Vulns 2KSP4-APC Data-Free)
IF %expl% == yes wmic qfe get Caption,Description,HotFixID,InstalledOn  findstr CKB890859 1NUL
IF %expl% == yes IF errorlevel 1 ECHO.MS05-018 patch is NOT installed! (Vulns 2KSP34,XPSP12-CSRSS)
IF %expl% == yes wmic qfe get Caption,Description,HotFixID,InstalledOn  findstr CKB842526 1NUL
IF %expl% == yes IF errorlevel 1 ECHO.MS04-019 patch is NOT installed! (Vulns 2KSP234-Utility Manager)
IF %expl% == yes wmic qfe get Caption,Description,HotFixID,InstalledOn  findstr CKB835732 1NUL
IF %expl% == yes IF errorlevel 1 ECHO.MS04-011 patch is NOT installed! (Vulns 2KSP234,XPSP01-LSASS service BoF)
IF %expl% == yes wmic qfe get Caption,Description,HotFixID,InstalledOn  findstr CKB841872 1NUL
IF %expl% == yes IF errorlevel 1 ECHO.MS04-020 patch is NOT installed! (Vulns 2KSP4-POSIX)
IF %expl% == yes wmic qfe get Caption,Description,HotFixID,InstalledOn  findstr CKB2975684 1NUL
IF %expl% == yes IF errorlevel 1 ECHO.MS14-040 patch is NOT installed! (Vulns 2K3SP2,2K8SP2,VistaSP2,7SP1-afd.sys Dangling Pointer)
IF %expl% == yes wmic qfe get Caption,Description,HotFixID,InstalledOn  findstr CKB3136041 1NUL
IF %expl% == yes IF errorlevel 1 ECHO.MS16-016 patch is NOT installed! (Vulns 2K8SP12,VistaSP2,7SP1-WebDAV to Address)
IF %expl% == yes wmic qfe get Caption,Description,HotFixID,InstalledOn  findstr CKB3057191 1NUL
IF %expl% == yes IF errorlevel 1 ECHO.MS15-051 patch is NOT installed! (Vulns 2K3SP2,2K8SP2,VistaSP2,7SP1-win32k.sys)
IF %expl% == yes wmic qfe get Caption,Description,HotFixID,InstalledOn  findstr CKB2989935 1NUL
IF %expl% == yes IF errorlevel 1 ECHO.MS14-070 patch is NOT installed! (Vulns 2K3SP2-TCPIP)
IF %expl% == yes wmic qfe get Caption,Description,HotFixID,InstalledOn  findstr CKB2778930 1NUL
IF %expl% == yes IF errorlevel 1 ECHO.MS13-005 patch is NOT installed! (Vulns Vista,7,8,2008,2008R2,2012,RT-hwnd_broadcast)
IF %expl% == yes wmic qfe get Caption,Description,HotFixID,InstalledOn  findstr CKB2850851 1NUL
IF %expl% == yes IF errorlevel 1 ECHO.MS13-053 patch is NOT installed! (Vulns 7SP0SP1_x86-schlamperei)
IF %expl% == yes wmic qfe get Caption,Description,HotFixID,InstalledOn  findstr CKB2870008 1NUL
IF %expl% == yes IF errorlevel 1 ECHO.MS13-081 patch is NOT installed! (Vulns 7SP0SP1_x86-track_popup_menu)
ECHO.
CALL T_Progress 2

DateAndTime
CALL ColorLine  %E%33m[+]%E%97m DATE and TIME
ECHO.   [i] You may need to adjust your local datetime to exploit some vulnerability
date T
time T
ECHO.
CALL T_Progress 2

AuditSettings
CALL ColorLine  %E%33m[+]%E%97m Audit Settings
ECHO.   [i] Check what is being logged
REG QUERY HKEY_LOCAL_MACHINESoftwareMicrosoftWindowsCurrentVersionPoliciesSystemAudit 2nul
ECHO.
CALL T_Progress 1

WEFSettings
CALL ColorLine  %E%33m[+]%E%97m WEF Settings
ECHO.   [i] Check where are being sent the logs
REG QUERY HKEY_LOCAL_MACHINESoftwarePoliciesMicrosoftWindowsEventLogEventForwardingSubscriptionManager 2nul
ECHO.
CALL T_Progress 1

LAPSInstallCheck
CALL ColorLine  %E%33m[+]%E%97m LAPS installed
ECHO.   [i] Check what is being logged
REG QUERY HKEY_LOCAL_MACHINESoftwarePoliciesMicrosoft ServicesAdmPwd v AdmPwdEnabled 2nul
ECHO.
CALL T_Progress 1

LSAProtectionCheck
CALL ColorLine  %E%33m[+]%E%97m LSA protection
ECHO.   [i] Active if 1
REG QUERY HKEY_LOCAL_MACHINESYSTEMCurrentControlSetControlLSA v RunAsPPL 2nul
CALL T_Progress 1

LSACredentialGuard
CALL ColorLine  %E%33m[+]%E%97m Credential Guard
ECHO.   [i] Active if 1 or 2
REG QUERY HKEY_LOCAL_MACHINESYSTEMCurrentControlSetControlLSA v LsaCfgFlags 2nul
ECHO.
CALL T_Progress 1

LogonCredentialsPlainInMemory
CALL ColorLine  %E%33m[+]%E%97m WDigest
ECHO.   [i] Plain-text creds in memory if 1
reg query HKLMSYSTEMCurrentControlSetControlSecurityProvidersWDigestUseLogonCredential 2nul
ECHO.
CALL T_Progress 1

CachedCreds
CALL ColorLine  %E%33m[+]%E%97m Number of cached creds
ECHO.   [i] You need System-rights to extract them
reg query HKEY_LOCAL_MACHINESOFTWAREMicrosoftWindows NTCurrentVersionWinlogon v CACHEDLOGONSCOUNT 2nul
CALL T_Progress 1

UACSettings
CALL ColorLine  %E%33m[+]%E%97m UAC Settings
ECHO.   [i] If the results read ENABLELUA REG_DWORD 0x1, part or all of the UAC components are on
ECHO.   [] httpsbook.hacktricks.xyzwindowswindows-local-privilege-escalation#basic-uac-bypass-full-file-system-access
REG QUERY HKEY_LOCAL_MACHINESoftwareMicrosoftWindowsCurrentVersionPoliciesSystem v EnableLUA 2nul
ECHO.
CALL T_Progress 1

AVSettings
CALL ColorLine  %E%33m[+]%E%97m Registered Anti-Virus(AV)
WMIC Nodelocalhost NamespacerootSecurityCenter2 Path AntiVirusProduct Get displayName FormatList  more 
ECHO.Checking for defender whitelisted PATHS
reg query HKLMSOFTWAREMicrosoftWindows DefenderExclusionsPaths 2nul
CALL T_Progress 1

PSSettings
CALL ColorLine  %E%33m[+]%E%97m PowerShell settings
ECHO.PowerShell v2 Version
REG QUERY HKEY_LOCAL_MACHINESOFTWAREMicrosoftPowerShell1PowerShellEngine v PowerShellVersion 2nul
ECHO.PowerShell v5 Version
REG QUERY HKEY_LOCAL_MACHINESOFTWAREMicrosoftPowerShell3PowerShellEngine v PowerShellVersion 2nul
ECHO.Transcriptions Settings
REG QUERY HKEY_LOCAL_MACHINESOFTWAREPoliciesMicrosoftWindowsPowerShellTranscription 2nul
ECHO.Module logging settings
REG QUERY HKEY_LOCAL_MACHINESOFTWAREPoliciesMicrosoftWindowsPowerShellModuleLogging 2nul
ECHO.Scriptblog logging settings
REG QUERY HKEY_LOCAL_MACHINESOFTWAREPoliciesMicrosoftWindowsPowerShellScriptBlockLogging 2nul
ECHO.
ECHO.PS default transcript history
dir %SystemDrive%transcripts 2nul
ECHO.
ECHO.Checking PS history file
dir %APPDATA%MicrosoftWindowsPowerShellPSReadLineConsoleHost_history.txt 2nul
ECHO.
CALL T_Progress 3

MountedDisks
CALL ColorLine  %E%33m[+]%E%97m MOUNTED DISKS
ECHO.   [i] Maybe you find something interesting
(wmic logicaldisk get caption 2nul  more)  (fsutil fsinfo drives 2nul)
ECHO.
CALL T_Progress 1

Environment
CALL ColorLine  %E%33m[+]%E%97m ENVIRONMENT
ECHO.   [i] Interesting information
ECHO.
set
ECHO.
CALL T_Progress 1

InstalledSoftware
CALL ColorLine  %E%33m[+]%E%97m INSTALLED SOFTWARE
ECHO.   [i] Some weird software Check for vulnerabilities in unknow software installed
ECHO.   [] httpsbook.hacktricks.xyzwindowswindows-local-privilege-escalation#software
ECHO.
dir b CProgram Files CProgram Files (x86)  sort
reg query HKLMSOFTWAREMicrosoftWindowsCurrentVersionUninstall s  findstr InstallLocation  findstr 
reg query HKLMSOFTWAREWOW6432NodeMicrosoftWindowsCurrentVersionUninstall s  findstr InstallLocation  findstr 
IF exist CWindowsCCMSCClient.exe ECHO.SCCM is installed (installers are run with SYSTEM privileges, many are vulnerable to DLL Sideloading)
ECHO.
CALL T_Progress 2

RemodeDeskCredMgr
CALL ColorLine  %E%33m[+]%E%97m Remote Desktop Credentials Manager
ECHO.   [] httpsbook.hacktricks.xyzwindowswindows-local-privilege-escalation#remote-desktop-credential-manager
IF exist %AppLocal%LocalMicrosoftRemote Desktop Connection ManagerRDCMan.settings ECHO.Found RDCMan.settings in %AppLocal%LocalMicrosoftRemote Desktop Connection ManagerRDCMan.settings, check for credentials in .rdg files
ECHO.
CALL T_Progress 1

WSUS
CALL ColorLine  %E%33m[+]%E%97m WSUS
ECHO.   [i] You can inject 'fake' updates into non-SSL WSUS traffic (WSUXploit)
ECHO.   [] httpsbook.hacktricks.xyzwindowswindows-local-privilege-escalation#wsus
reg query HKEY_LOCAL_MACHINESoftwarePoliciesMicrosoftWindowsWindowsUpdate 2nul  findstr i wuserver  findstr i http
ECHO.
CALL T_Progress 1

RunningProcesses
CALL ColorLine  %E%33m[+]%E%97m RUNNING PROCESSES
ECHO.   [i] Something unexpected is running Check for vulnerabilities
ECHO.   [] httpsbook.hacktricks.xyzwindowswindows-local-privilege-escalation#running-processes
tasklist SVC
ECHO.
CALL T_Progress 2
ECHO.   [i] Checking file permissions of running processes (File backdooring - maybe the same files start automatically when Administrator logs in)
for f tokens=2 delims='=' %%x in ('wmic process list full^find i executablepath^find i v system32^find ') do (
	for f eol^=^^ delims^=^ %%z in ('ECHO.%%x') do (
		icacls %%z 2nul  findstr i (F) (M) (W)   findstr i  everyone authenticated users todos %username% && ECHO.
	)
)
ECHO.
ECHO.   [i] Checking directory permissions of running processes (DLL injection)
for f tokens=2 delims='=' %%x in ('wmic process list full^find i executablepath^find i v system32^find ') do for f eol^=^^ delims^=^ %%y in ('ECHO.%%x') do (
	icacls %%~dpy 2nul  findstr i (F) (M) (W)   findstr i  everyone authenticated users todos %username% && ECHO.
)
ECHO.
CALL T_Progress 3

RunAtStartup
CALL ColorLine  %E%33m[+]%E%97m RUN AT STARTUP
ECHO.   [i] Check if you can modify any binary that is going to be executed by admin or if you can impersonate a not found binary
ECHO.   [] httpsbook.hacktricks.xyzwindowswindows-local-privilege-escalation#run-at-startup
(autorunsc.exe -m -nobanner -a  -ct accepteula 2nul  wmic startup get caption,command 2nul  more & ^
reg query HKLMSoftwareMicrosoftWindowsCurrentVersionRun 2nul & ^
reg query HKLMSoftwareMicrosoftWindowsCurrentVersionRunOnce 2nul & ^
reg query HKCUSoftwareMicrosoftWindowsCurrentVersionRun 2nul & ^
reg query HKCUSoftwareMicrosoftWindowsCurrentVersionRunOnce 2nul & ^
CALL T_Progress 2
icacls CDocuments and SettingsAll UsersStart MenuProgramsStartup 2nul  findstr i (F) (M) (W)   findstr i  everyone authenticated users todos %username% && ECHO. & ^
icacls CDocuments and SettingsAll UsersStart MenuProgramsStartup 2nul  findstr i (F) (M) (W)   findstr i  everyone authenticated users todos %username% && ECHO. & ^
icacls CDocuments and Settings%username%Start MenuProgramsStartup 2nul  findstr i (F) (M) (W)   findstr i  everyone authenticated users todos %username% && ECHO. & ^
icacls CDocuments and Settings%username%Start MenuProgramsStartup 2nul  findstr i (F) (M) (W)   findstr i  everyone authenticated users todos %username% && ECHO. & ^
CALL T_Progress 2
icacls %programdata%MicrosoftWindowsStart MenuProgramsStartup 2nul  findstr i (F) (M) (W)   findstr i  everyone authenticated users todos %username% && ECHO. & ^
icacls %programdata%MicrosoftWindowsStart MenuProgramsStartup 2nul  findstr i (F) (M) (W)   findstr i  everyone authenticated users todos %username% && ECHO. & ^
icacls %appdata%MicrosoftWindowsStart MenuProgramsStartup 2nul  findstr i (F) (M) (W)   findstr i  everyone authenticated users todos %username% && ECHO. & ^
icacls %appdata%MicrosoftWindowsStart MenuProgramsStartup 2nul  findstr i (F) (M) (W)   findstr i  everyone authenticated users todos %username% && ECHO. & ^
CALL T_Progress 2
schtasks query fo TABLE nh  findstr v i disable deshab informa)
ECHO.
CALL T_Progress 2

AlwaysInstallElevated
CALL ColorLine  %E%33m[+]%E%97m AlwaysInstallElevated
ECHO.   [i] If '1' then you can install a .msi file with admin privileges ;)
ECHO.   [] httpsbook.hacktricks.xyzwindowswindows-local-privilege-escalation#alwaysinstallelevated
reg query HKCUSOFTWAREPoliciesMicrosoftWindowsInstaller v AlwaysInstallElevated 2 nul
reg query HKLMSOFTWAREPoliciesMicrosoftWindowsInstaller v AlwaysInstallElevated 2 nul
ECHO.
CALL T_Progress 2

NetworkShares
CALL ColorLine %E%32m[]%E%97m NETWORK
CALL ColorLine  %E%33m[+]%E%97m CURRENT SHARES
net share
ECHO.
CALL T_Progress 1

NetworkInterfaces
CALL ColorLine  %E%33m[+]%E%97m INTERFACES
ipconfig  all
ECHO.
CALL T_Progress 1

NetworkUsedPorts
CALL ColorLine  %E%33m[+]%E%97m USED PORTS
ECHO.   [i] Check for services restricted from the outside
netstat -ano  findstr i listen
ECHO.
CALL T_Progress 1

NetworkFirewall
CALL ColorLine  %E%33m[+]%E%97m FIREWALL
netsh firewall show state
netsh firewall show config
ECHO.
CALL T_Progress 2

ARP
CALL ColorLine  %E%33m[+]%E%97m ARP
arp -A
ECHO.
CALL T_Progress 1

NetworkRoutes
CALL ColorLine  %E%33m[+]%E%97m ROUTES
route print
ECHO.
CALL T_Progress 1

WindowsHostsFile
CALL ColorLine  %E%33m[+]%E%97m Hosts file
type CWINDOWSSystem32driversetchosts  findstr v ^#
CALL T_Progress 1

DNSCache
CALL ColorLine  %E%33m[+]%E%97m DNS CACHE
ipconfig displaydns  findstr Record  findstr Name Host
ECHO.
CALL T_Progress 1

WifiCreds
CALL ColorLine  %E%33m[+]%E%97m WIFI
for f tokens=4 delims=  %%a in ('netsh wlan show profiles ^ find Profile ') do (netsh wlan show profiles name=%%a key=clear  findstr SSID Cipher Content  find v Number & ECHO.)
CALL T_Progress 1

BasicUserInfo
CALL ColorLine %E%32m[]%E%97m BASIC USER INFO
ECHO.   [i] Check if you are inside the Administrators group or if you have enabled any token that can be use to escalate privileges like SeImpersonatePrivilege, SeAssignPrimaryPrivilege, SeTcbPrivilege, SeBackupPrivilege, SeRestorePrivilege, SeCreateTokenPrivilege, SeLoadDriverPrivilege, SeTakeOwnershipPrivilege, SeDebbugPrivilege
ECHO.   [] httpsbook.hacktricks.xyzwindowswindows-local-privilege-escalation#users-and-groups
ECHO.
CALL ColorLine  %E%33m[+]%E%97m CURRENT USER
net user %username%
net user %USERNAME% domain 2nul
whoami all
ECHO.
CALL T_Progress 2

BasicUserInfoUsers
CALL ColorLine  %E%33m[+]%E%97m USERS
net user
ECHO.
CALL T_Progress 1

BasicUserInfoGroups
CALL ColorLine  %E%33m[+]%E%97m GROUPS
net localgroup
ECHO.
CALL T_Progress 1

BasicUserInfoAdminGroups
CALL ColorLine  %E%33m[+]%E%97m ADMINISTRATORS GROUPS
REM seems to be localised
net localgroup Administrators 2nul
net localgroup Administradores 2nul
ECHO. 
CALL T_Progress 1

BasicUserInfoLoggedUser
CALL ColorLine  %E%33m[+]%E%97m CURRENT LOGGED USERS
quser
ECHO. 
CALL T_Progress 1

KerberosTickets
CALL ColorLine  %E%33m[+]%E%97m Kerberos Tickets
klist
ECHO. 
CALL T_Progress 1

CurrentClipboard
CALL ColorLine  %E%33m[+]%E%97m CURRENT CLIPBOARD
ECHO.   [i] Any password inside the clipboard
powershell -command Get-Clipboard 2nul
ECHO.
CALL T_Progress 1

ServiceVulnerabilities
CALL ColorLine %E%32m[]%E%97m SERVICE VULNERABILITIES
sysinternals external tool
ECHO.
CALL ColorLine  %E%33m[+]%E%97m SERVICE PERMISSIONS WITH accesschk.exe FOR 'Authenticated users', Everyone, BUILTINUsers, Todos and CURRENT USER
ECHO.   [i] If Authenticated Users have SERVICE_ALL_ACCESS or SERVICE_CHANGE_CONFIG or WRITE_DAC or WRITE_OWNER or GENERIC_WRITE or GENERIC_ALL, you can modify the binary that is going to be executed by the service and startstop the service
ECHO.   [i] If accesschk.exe is not in PATH, nothing will be found here
ECHO.   [i] AUTHETICATED USERS
accesschk.exe -uwcqv Authenticated Users  accepteula 2nul
ECHO.   [i] EVERYONE
accesschk.exe -uwcqv Everyone  accepteula 2nul
ECHO.   [i] BUILTINUsers
accesschk.exe -uwcqv BUILTINUsers  accepteula 2nul
ECHO.   [i] TODOS
accesschk.exe -uwcqv Todos  accepteula 2nul
ECHO.   [i] %USERNAME%
accesschk.exe -uwcqv %username%  accepteula 2nul
ECHO.
CALL ColorLine  %E%33m[+]%E%97m SERVICE PERMISSIONS WITH accesschk.exe FOR 
ECHO.   [i] Check for weird service permissions for unexpected groups
accesschk.exe -uwcqv  accepteula 2nul
CALL T_Progress 1
ECHO.

ServiceBinaryPermissions
CALL ColorLine  %E%33m[+]%E%97m SERVICE BINARY PERMISSIONS WITH WMIC and ICACLS
ECHO.   [] httpsbook.hacktricks.xyzwindowswindows-local-privilege-escalation#services
for f tokens=2 delims='=' %%a in ('cmd.exe c wmic service list full ^ findstr i pathname ^findstr i v system32') do (
    for f eol^=^^ delims^=^ %%b in (%%a) do icacls %%b 2nul  findstr i (F) (M) (W)   findstr i  everyone authenticated users todos usuarios %username% && ECHO.
)
ECHO.
CALL T_Progress 1

CheckRegistryModificationAbilities
CALL ColorLine  %E%33m[+]%E%97m CHECK IF YOU CAN MODIFY ANY SERVICE REGISTRY
ECHO.   [] httpsbook.hacktricks.xyzwindowswindows-local-privilege-escalation#services
for f %%a in ('reg query hklmsystemcurrentcontrolsetservices') do del %temp%reg.hiv nul 2&1 & reg save %%a %temp%reg.hiv nul 2&1 && reg restore %%a %temp%reg.hiv nul 2&1 && ECHO.You can modify %%a
ECHO.
CALL T_Progress 1

UnquotedServicePaths
CALL ColorLine  %E%33m[+]%E%97m UNQUOTED SERVICE PATHS
ECHO.   [i] When the path is not quoted (ex CProgram filessoftnew folderexec.exe) Windows will try to execute first 'CProgam.exe', then 'CProgram Filessoftnew.exe' and finally 'CProgram Filessoftnew folderexec.exe'. Try to create 'CProgram Filessoftnew.exe'
ECHO.   [i] The permissions are also checked and filtered using icacls
ECHO.   [] httpsbook.hacktricks.xyzwindowswindows-local-privilege-escalation#services
for f tokens=2 %%n in ('sc query state^= all^ findstr SERVICE_NAME') do (
	for f delims= tokens=1 %%r in ('sc qc %%~n ^ findstr BINARY_PATH_NAME ^ findstr i v l ccwindowssystem32 ^ findstr v c') do (
		ECHO.%%~s ^ findstr r c[a-Z][ ][a-Z] nul 2&1 && (ECHO.%%n && ECHO.%%~s && icacls %%s  findstr i (F) (M) (W)   findstr i  everyone authenticated users todos %username%) && ECHO.
	)
)
CALL T_Progress 2
wmic service get name,displayname,pathname,startmode  more  findstr i v CWindowssystem32  findstr i v 
ECHO.
CALL T_Progress 1

PATHenvHijacking
CALL ColorLine %E%32m[]%E%97m DLL HIJACKING in PATHenv variable
ECHO.   [i] Maybe you can take advantage of modifyingcreating some binary in some of the following locations
ECHO.   [i] PATH variable entries permissions - place binary or DLL to execute instead of legitimate
ECHO.   [] httpsbook.hacktricks.xyzwindowswindows-local-privilege-escalation#dll-hijacking
for %%A in (%path;=;%) do ( cmd.exe c icacls %%~A 2nul  findstr i (F) (M) (W)   findstr i  everyone authenticated users todos %username% && ECHO. )
ECHO.
CALL T_Progress 1

WindowsCredentials
CALL ColorLine %E%32m[]%E%97m CREDENTIALS
ECHO.
CALL ColorLine  %E%33m[+]%E%97m WINDOWS VAULT
ECHO.   [] httpsbook.hacktricks.xyzwindowswindows-local-privilege-escalation#windows-vault
cmdkey list
ECHO.
CALL T_Progress 2

DPAPIMasterKeys
CALL ColorLine  %E%33m[+]%E%97m DPAPI MASTER KEYS
ECHO.   [i] Use the Mimikatz 'dpapimasterkey' module with appropriate arguments (rpc) to decrypt
ECHO.   [] httpsbook.hacktricks.xyzwindowswindows-local-privilege-escalation#dpapi
powershell -command Get-ChildItem %appdata%MicrosoftProtect 2nul
powershell -command Get-ChildItem %localappdata%MicrosoftProtect 2nul
CALL T_Progress 2
CALL ColorLine  %E%33m[+]%E%97m DPAPI MASTER KEYS
ECHO.   [i] Use the Mimikatz 'dpapicred' module with appropriate masterkey to decrypt
ECHO.   [i] You can also extract many DPAPI masterkeys from memory with the Mimikatz 'sekurlsadpapi' module
ECHO.   [] httpsbook.hacktricks.xyzwindowswindows-local-privilege-escalation#dpapi
ECHO.
ECHO.Looking inside %appdata%MicrosoftCredentials
ECHO.
dir ba %appdata%MicrosoftCredentials 2nul 
CALL T_Progress 2
ECHO.
ECHO.Looking inside %localappdata%MicrosoftCredentials
ECHO.
dir ba %localappdata%MicrosoftCredentials 2nul
CALL T_Progress 2
ECHO.

UnattendedFiles
CALL ColorLine  %E%33m[+]%E%97m Unattended files
IF EXIST %WINDIR%sysprepsysprep.xml ECHO.%WINDIR%sysprepsysprep.xml exists. 
IF EXIST %WINDIR%sysprepsysprep.inf ECHO.%WINDIR%sysprepsysprep.inf exists. 
IF EXIST %WINDIR%sysprep.inf ECHO.%WINDIR%sysprep.inf exists. 
IF EXIST %WINDIR%PantherUnattended.xml ECHO.%WINDIR%PantherUnattended.xml exists. 
IF EXIST %WINDIR%PantherUnattend.xml ECHO.%WINDIR%PantherUnattend.xml exists. 
IF EXIST %WINDIR%PantherUnattendUnattend.xml ECHO.%WINDIR%PantherUnattendUnattend.xml exists. 
IF EXIST %WINDIR%PantherUnattendUnattended.xml ECHO.%WINDIR%PantherUnattendUnattended.xml exists.
IF EXIST %WINDIR%System32Sysprepunattend.xml ECHO.%WINDIR%System32Sysprepunattend.xml exists.
IF EXIST %WINDIR%System32Sysprepunattended.xml ECHO.%WINDIR%System32Sysprepunattended.xml exists.
IF EXIST %WINDIR%..unattend.txt ECHO.%WINDIR%..unattend.txt exists.
IF EXIST %WINDIR%..unattend.inf ECHO.%WINDIR%..unattend.inf exists. 
ECHO.
CALL T_Progress 2

SAMSYSBackups
CALL ColorLine  %E%33m[+]%E%97m SAM and SYSTEM backups
IF EXIST %WINDIR%repairSAM ECHO.%WINDIR%repairSAM exists. 
IF EXIST %WINDIR%System32configRegBackSAM ECHO.%WINDIR%System32configRegBackSAM exists.
IF EXIST %WINDIR%System32configSAM ECHO.%WINDIR%System32configSAM exists.
IF EXIST %WINDIR%repairSYSTEM ECHO.%WINDIR%repairSYSTEM exists.
IF EXIST %WINDIR%System32configSYSTEM ECHO.%WINDIR%System32configSYSTEM exists.
IF EXIST %WINDIR%System32configRegBackSYSTEM ECHO.%WINDIR%System32configRegBackSYSTEM exists.
ECHO.
CALL T_Progress 3

McAffeeSitelist
CALL ColorLine  %E%33m[+]%E%97m McAffee SiteList.xml
cd %ProgramFiles% 2nul
dir s SiteList.xml 2nul
cd %ProgramFiles(x86)% 2nul
dir s SiteList.xml 2nul
cd %windir%..Documents and Settings 2nul
dir s SiteList.xml 2nul
cd %windir%..Users 2nul
dir s SiteList.xml 2nul
ECHO.
CALL T_Progress 2

GPPPassword
CALL ColorLine  %E%33m[+]%E%97m GPP Password
cd %SystemDrive%MicrosoftGroup Policyhistory 2nul
dir sb Groups.xml == Services.xml == Scheduledtasks.xml == DataSources.xml == Printers.xml == Drives.xml 2nul
cd %windir%..Documents and SettingsAll UsersApplication DataMicrosoftGroup Policyhistory 2nul
dir sb Groups.xml == Services.xml == Scheduledtasks.xml == DataSources.xml == Printers.xml == Drives.xml 2nul
ECHO.
CALL T_Progress 2

CloudCreds
CALL ColorLine  %E%33m[+]%E%97m Cloud Credentials
cd %SystemDrive%Users
dir sb .aws == credentials == gcloud == credentials.db == legacy_credentials == access_tokens.db == .azure == accessTokens.json == azureProfile.json 2nul
cd %windir%..Documents and Settings
dir sb .aws == credentials == gcloud == credentials.db == legacy_credentials == access_tokens.db == .azure == accessTokens.json == azureProfile.json 2nul
ECHO.
CALL T_Progress 2

AppCMD
CALL ColorLine  %E%33m[+]%E%97m AppCmd
ECHO.   [] httpsbook.hacktricks.xyzwindowswindows-local-privilege-escalation#appcmd-exe
IF EXIST %systemroot%system32inetsrvappcmd.exe ECHO.%systemroot%system32inetsrvappcmd.exe exists. 
ECHO.
CALL T_Progress 2

RegFilesCredentials
CALL ColorLine  %E%33m[+]%E%97m Files in registry that may contain credentials
ECHO.   [i] Searching specific files that may contains credentials.
ECHO.   [] httpsbook.hacktricks.xyzwindowswindows-local-privilege-escalation#credentials-inside-files
ECHO.Looking inside HKCUSoftwareORLWinVNC3Password
reg query HKCUSoftwareORLWinVNC3Password 2nul
CALL T_Progress 2
ECHO.Looking inside HKEY_LOCAL_MACHINESOFTWARERealVNCWinVNC4password
reg query HKEY_LOCAL_MACHINESOFTWARERealVNCWinVNC4 v password 2nul
CALL T_Progress 2
ECHO.Looking inside HKLMSOFTWAREMicrosoftWindows NTCurrentversionWinLogon
reg query HKLMSOFTWAREMicrosoftWindows NTCurrentversionWinlogon 2nul  findstr i DefaultDomainName DefaultUserName DefaultPassword AltDefaultDomainName AltDefaultUserName AltDefaultPassword LastUsedUsername
CALL T_Progress 2
ECHO.Looking inside HKLMSYSTEMCurrentControlSetServicesSNMP
reg query HKLMSYSTEMCurrentControlSetServicesSNMP s 2nul
CALL T_Progress 2
ECHO.Looking inside HKCUSoftwareTightVNCServer
reg query HKCUSoftwareTightVNCServer 2nul
CALL T_Progress 2
ECHO.Looking inside HKCUSoftwareSimonTathamPuTTYSessions
reg query HKCUSoftwareSimonTathamPuTTYSessions s 2nul
CALL T_Progress 2
ECHO.Looking inside HKCUSoftwareOpenSSHAgentKeys
CALL T_Progress 2
reg query HKCUSoftwareOpenSSHAgentKeys s 2nul
cd %USERPROFILE% 2nul && dir sb password == credential 2nul
cd ......................................
dir sb A-D RDCMan.settings == .rdg == SCClient.exe == _history == .sudo_as_admin_successful == .profile == bashrc == httpd.conf == .plan == .htpasswd == .git-credentials == .rhosts == hosts.equiv == Dockerfile == docker-compose.yml == appcmd.exe == TypedURLs == TypedURLsTime == History == Bookmarks == Cookies == Login Data == places.sqlite == key3.db == key4.db == credentials == credentials.db == access_tokens.db == accessTokens.json == legacy_credentials == azureProfile.json == unattend.txt == access.log == error.log == .gpg == .pgp == config.php == elasticsearch.yml == kibana.yml == .p12 == .der == .csr == .cer == known_hosts == id_rsa == id_dsa == .ovpn == anaconda-ks.cfg == hostapd.conf == rsyncd.conf == cesi.conf == supervisord.conf == tomcat-users.xml == .kdbx == KeePass.config == Ntds.dit == SAM == SYSTEM == FreeSSHDservice.ini == sysprep.inf == sysprep.xml == unattend.xml == unattended.xml == vnc.ini == vnc.cnf == vnc.txt == vnc.xml == groups.xml == services.xml == scheduledtasks.xml == printers.xml == drives.xml == datasources.xml == php.ini == https.conf == https-xampp.conf == httpd.conf == my.ini == my.cnf == access.log == error.log == server.xml == SiteList.xml == ConsoleHost_history.txt == setupinfo == setupinfo.bak 2nul  findstr v .dll
cd inetpub 2nul && (dir sb web.config == .log & cd ..)
ECHO.
CALL T_Progress 2

ExtendedDriveScan
if %long% == true (
    CALL ColorLine  %E%33m[+]%E%97m REGISTRY WITH STRING pass OR pwd
	reg query HKLM f passw t REG_SZ s
	reg query HKCU f passw t REG_SZ s
	reg query HKLM f pwd t REG_SZ s
	reg query HKCU f pwd t REG_SZ s
	ECHO.
	ECHO.   [i] Iterating through the drives
	ECHO.
	for f %%x in ('wmic logicaldisk get name^ more') do (
		set tdrive=%%x
		if !tdrive~1,2! ==  (
			%%x
            CALL ColorLine  %E%33m[+]%E%97m FILES THAT CONTAINS THE WORD PASSWORD WITH EXTENSION .xml .ini .txt .cfg .config
	        findstr snmi password .xml .ini .txt .cfg .config 2nul  findstr v i AppDataLocal WinSxS ApnDatabase.xml UEVInboxTemplates Microsoft.Windows.Cloud Notepad++ vmware cortana alphabet 7-zip 2nul
            ECHO.
            CALL ColorLine  %E%33m[+]%E%97m FILES WHOSE NAME CONTAINS THE WORD PASS CRED or .config not inside Windows
            dir sb pass == cred == .config == .cfg 2nul  findstr v i windows  
            ECHO.
		)
	)
	CALL T_Progress 2
) ELSE (
	CALL T_Progress 2
)
TITLE WinPEAS - Windows local Privilege Escalation Awesome Script - Idle
ECHO.---
ECHO.Scan complete.
PAUSE NUL 
EXIT B

-Subroutines

SetOnce
REM  ANSI escape character is set once below - for ColorLine Subroutine
SET E=0x1B[
SET PercentageTrack=0
EXIT B

T_Progress
SET Percentage=%~1
SET A PercentageTrack=PercentageTrack+Percentage
TITLE WinPEAS - Windows local Privilege Escalation Awesome Script - Scanning... !PercentageTrack!%%
EXIT B

ColorLine
SET CurrentLine=%~1
FOR F delims= %%A IN ('FORFILES.EXE P %~dp0 M %~nx0 C CMD C ECHO.!CurrentLine!') DO ECHO.%%A
EXIT B