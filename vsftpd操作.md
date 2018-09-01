1、vsftpd安装
  centos下
  
    a、yum search vsftpd
    
    b、yum install vsftpd.x86_xx
    
    
2、配置vsftpd
编辑vsftpd的配置文件/etc/vsftpd/vsftpd.conf
在配置文件中找到"anonymous_enable=YES"，将"YES"改为"NO"，将匿名登陆禁用
    查看配置文件是否生效：cat /etc/vsftpd/vsftpd.conf |grep ^[^#]
    local_enable=YES
    write_enable=YES
    local_umask=022
    anon_upload_enable=YES
    anon_mkdir_write_enable=YES
    anon_umask=022
    dirmessage_enable=YES
    xferlog_enable=YES
    connect_from_port_20=YES
    xferlog_std_format=YES
    listen=YES
    pam_service_name=vsftpd
    userlist_enable=YES
    tcp_wrappers=YES
3、启动vsftpd服务，service vsftpd start
  开机启动，chkconfig vsftpd on
  查看是否加入了开启启动项，chkconfig --list
4、创建ftp用户
  a、创建ftp用户的账号，例如账号为ftpddd，ftp目录为/home/ftp，且设置为不允许通过ssh登陆
    useradd -d /home/ftp -s /sbin/nologin ftpddd
  b、设置ftp账号对应的密码，例如密码为123456
    passwd 123456
  
出现的问题：
1、如果vsftpd启动失败，首先检查21端口是否被占用 netstat -natp |grep 21


其他问题：
  如果使用的是pureftp，如果出现以下提示：
  正在连接到 ×××××××× -> IP=××××××××× PORT=21
  已连接到×××××××
  220---------- Welcome to Pure-FTPd [privsep] ----------
  220-You are user number 1 of 50 allowed.
  220-Local time is now 12:29. Server port: 21.
  220-This is a private system - No anonymous login
  220-IPv6 connections are also welcome on this server.
  220 You will be disconnected after 15 minutes of inactivity.
  USER didatao×××××
  331 User didatao_com OK. Password required
  PASS (隐藏)
  530 Login authentication failed
  连接失败
  
解决方法：
这是在centos上的bug，目前还没有查出具体原因
请登陆ssh，然后手动重启一下pureftpd（pureftpd-restart）
  
