sudo su;
echo "adding mysql to system path"
sudo echo "PATH=$PATH:/usr/local/mysql/bin" >> /etc/profile;
sudo echo "export PATH" >> /etc/profile;
PATH=$PATH:/usr/local/mysql/bin;
export PATH;
echo "mysql added to system path"
echo "downloading jpg lib"
curl -O http://www.ijg.org/files/jpegsrc.v8c.tar.gz; 
tar -xvzf jpegsrc.v8c.tar.gz; 
cd jpeg-8c; 
./configure; 
make; 
sudo make install; 
echo "jpeg lib installed"
echo "downloading freetype lib"
cd ..; 
curl -O http://ftp.igh.cnrs.fr/pub/nongnu/freetype/freetype-2.4.5.tar.gz; 
tar -xvzf freetype-2.4.5.tar.gz; 
cd freetype-2.4.5; 
./configure; 
make; 
sudo make install;
echo "freetype installed"
echo "installing PIP"
sudo easy_install pip;
echo "installing django" 
sudo pip install django;
echo "installing PIL"
sudo pip install PIL;
echo "installing MySQL-python" 
sudo pip install MySQL-python;
echo "installing django social auth"
sudo pip install django-allauth
#echo "updating"
#sudo pip sudo pip install --upgrade django-social-auth
echo "adding MySQL-python to path"
sudo echo "export DLYD_LIBRARY_PATH=/usr/local/mysql/lib" >> /etc/profile;
sudo ln -s /usr/local/mysql/lib/libmysqlclient.18.dylib /usr/local/lib/libmysqlclient.18.dylib;

