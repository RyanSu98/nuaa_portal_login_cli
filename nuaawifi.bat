:: 功能；   南京航空航天大学校园网nuaa.portal的命令行登录
:: 作者：   苏瑞辅
:: Email:   i@suruifu.com
:: 公众号： 瑞辅笔记
:: 附注：   本脚本完成过程中得到了@张世博同学的帮助

@echo off
setlocal
chcp 65001 > nul

:: 1. 初始化工号密码
set NUMBER=
set PASSWORD=


:: 2. 获取内网ip
for /f "delims=" %%A in ('curl -s "http://222.192.72.253/drcom/chkstatus?callback="') do set "page1_str=%%A"
set "string1=%page1_str:v46ip=" & set "string2=%"
set ip=%string2:~3,14%

:: 3. 实现认证登录
curl -s "http://222.192.72.253:801/eportal/?c=Portal&a=login&login_method=1&user_account=%NUMBER%&user_password=%PASSWORD%&wlan_user_ip=%ip%" > nul
