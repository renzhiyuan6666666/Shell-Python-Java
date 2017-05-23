vim  auto_ssh.sh 
#!/usr/bin/expect  
set timeout 10  
set username [lindex $argv 0]  
set password [lindex $argv 1]  
set hostname [lindex $argv 2]  
spawn ssh-copy-id -i /root/.ssh/id_rsa.pub $username@$hostname
expect {
            #first connect, no public key in ~/.ssh/known_hosts
            "Are you sure you want to continue connecting (yes/no)?" {
            send "yes\r"
            expect "password:"
                send "$password\r"
            }
            #already has public key in ~/.ssh/known_hosts
            "password:" {
                send "$password\r"
            }
            "Now try logging into the machine" {
                #it has authorized, do nothing!
            }
        }
expect eof

#����
./auto_ssh.sh �û� ���� ip

#���¾�Ϊע��

/*
#expect�÷�
http://www.cnblogs.com/iloveyoucc/archive/2012/05/11/2496433.html
1. ��#!/usr/bin/expect�� 
ָ��shell�������expect��ʵ��linux�µ�bash��windows�µ�cmd��һ�ණ���� 
2. ��set timeout 30��
��ʱʱ�䣬��λ�� ��timeout -1 Ϊ������ʱ
3. ��spawn ssh -l username 192.168.1.1�� 
spawn�ǽ���expect������ſ���ִ�е�expect�ڲ�������û��װexpect����ֱ����Ĭ�ϵ�SHELL��ִ�����Ҳ���spawn����ġ�
�ñ�windows���dir����һ���ڲ�������������shell�Դ������޷��ҵ�һ��dir.com �� dir.exe �Ŀ�ִ���ļ���
����Ҫ�Ĺ����Ǹ�ssh���н��̼Ӹ��ǣ��������ݽ���ָ� 
4. ��expect "password:"�� 
�����expectҲ��expect��һ���ڲ��������������˼���ж��ϴ����������Ƿ������password:�����ַ�����
��������������أ�����͵ȴ�һ��ʱ��󷵻أ�����ȴ�ʱ������ǰ�����õ�30�롣
5. ��send "ispass\r"�� 
�������ִ�н������������ֹ���������Ķ�����Ч�� ��ܰ��ʾ�� �����ַ�����β�����Ǽ��ϡ�\r������������쳣�ȴ���״̬���Ժ˲�һ�¡�
6. ��interact�� 
ִ����ɺ󱣳ֽ���״̬���ѿ���Ȩ��������̨�����ʱ��Ϳ����ֹ������ˡ�
���û����һ���¼��ɺ���˳�������������Զ���ն��ϡ������ֻ�ǵ�¼��ȥִ�� 
7.$argv ��������
expect�ű����Խ��ܴ�bash���ݹ����Ĳ���.����ʹ��[lindex $argv n]��ã�n��0��ʼ���ֱ��ʾ��һ��,�ڶ���,������....����
send_user�����������ݸ��û���
8.expect�������в����ο���c���Եģ���bash shell�е㲻һ�������У�$argcΪ�����в����ĸ�����$argv0Ϊ�ű����ֱ���$argvΪ�����в�����[lrange $argv 0 0]��ʾ��1��������[lrange $argv 0 4]Ϊ��һ�����������������c���Բ�һ���ĵط����ڣ�$argv�������ű����ֱ���

*/























