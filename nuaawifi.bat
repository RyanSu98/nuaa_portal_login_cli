:: 功能；   南京航空航天大学校园网nuaa.portal的命令行登录
:: 作者：   苏瑞辅
:: Email:   i@suruifu.com
:: 公众号： 瑞辅笔记
:: 附注：   本脚本完成过程中得到了@张世博同学的帮助

@echo off
setlocal
chcp 65001 > nul

:: 1. 初始化工号密码 直接在等号后面写就行，不用单引号、双引号、空格
set NUMBER=
set PASSWORD=


:: 2. 获取内网ip
for /f "delims=" %%A in ('curl -s "http://222.192.72.253/drcom/chkstatus?callback="') do set "page1_str=%%A"
powershell -Command " '%page1_str%' | Select-String -Pattern 'v46ip:(.*?),'  | %% {"""$($_.matches.groups[1])"""} " > .nuaawifi.tmp 
set /p ip= < .nuaawifi.tmp 
del .nuaawifi.tmp

:: 3. 实现认证登录
curl -s "http://222.192.72.253:801/eportal/?c=Portal&a=login&login_method=1&user_account=%NUMBER%&user_password=%PASSWORD%&wlan_user_ip=%ip%" > nul
