builtin cd $HOME
baglanti_kes(){
  if [ -d ~/bnl ];then  
    fusermount -u ~/bnl && \rm -r ~/bnl
    kill ${$(netstat -atnp 2>/dev/null|grep '127.0.0.1:6166'|grep '0.0.0.0'|tr -s ' '|cut -d " " -f 7)/\/ssh/}
  fi
  cat /etc/mtab|grep tigress> /dev/null&& (fusermount -u ~/tigress && \rm -r ~/tigress)
  cat /etc/mtab|grep hopper > /dev/null&& (fusermount -u ~/hopper && \rm -r ~/hopper)
  \rm .ssh/master* 2>/dev/null
}
[ `w -h|wc -l` -lt 2 ] && baglanti_kes

