:: 功能；   南京航空航天大学校园网nuaa.portal的命令行登录
:: 作者：   苏瑞辅
:: Email:   i@suruifu.com
:: 公众号： 瑞辅笔记
:: 附注：   本脚本完成过程中得到了@张世博同学的帮助

@echo off
chcp 65001 > nul

:: 1. 初始化工号密码
:: 注意：输入学号或者密码的时候直接在等号后面输入，不要输入任何单引号、双引号、空格等字符
set NUMBER=这里填的是学号
set PASSWORD=这里填的是密码


:: 2. 获取内网ip
for /f "delims=" %%A in ('curl -s "http://222.192.72.253/drcom/chkstatus?callback="') do set "page1_str=%%A"
set "string1=%page1_str:v46ip=" & set "string2=%"
set ip=%string2:~3,14%

:: 3. 实现认证登录
curl -s "http://222.192.72.253:801/eportal/?c=Portal&a=login&login_method=1&user_account=%NUMBER%&user_password=%PASSWORD%&wlan_user_ip=%ip%" > nul
