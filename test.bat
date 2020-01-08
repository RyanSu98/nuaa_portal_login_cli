@echo off
setlocal
for /f "delims=" %%A in ('curl -s "http://222.192.72.253/drcom/chkstatus?callback="') do set "page1_str=%%A"
powershell -Command " '%page1_str%' | Select-String -Pattern 'v46ip:(.*?),'  | %% {"""$($_.matches.groups[1])"""} "

REM "http://192.168.3.114:8080/compierews/" | Select-String -Pattern '^http://(.*):8080/(.*)/$'  | % {"IP is $($_.matches.groups[1]) and path is $($_.matches.groups[2])"}
