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
