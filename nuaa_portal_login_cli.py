"""
    功能：  南京航空航天大学校园网nuaa.portal的命令行登录
    作者：  苏瑞辅
    Email： i@suruifu.com
    附注：  本脚本在完成过程中得到了@的帮助
"""
import requests
import json

# 0. 初始化工号密码
NUMBER = ''
PASSWORD = ''

# 1. 获取当前ip地址
page1_str = requests.get('http://222.192.72.253/drcom/chkstatus?callback=').text.strip()
page1_dict = json.loads(page1_str[1:-1])
ip = page1_dict.get('v46ip')
# 2. 发起登录请求
data = dict(
    c='Portal',
    a='login',
    login_method='1',
    user_account=NUMBER,
    user_password=PASSWORD,
    wlan_user_ip=ip
)
page2_str = requests.get('http://222.192.72.253:801/eportal/', params=data).text
page2_dict = json.loads(page2_str[1:-1])
# 3. 根据返回数据判断登录状态
if page2_dict['result'] == '0':
    if page2_dict['ret_code'] == 2:
        print('已经登录')
    elif page2_dict['ret_code'] == 1:
        print('密码错误')
    else:
        print('未知错误')
else:
    print('认证成功')