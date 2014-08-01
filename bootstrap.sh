#initialize the yum repo
echo "updating yum repo ..."
yum -y update

echo "installing some tools ... "
yum -y install wget

#install ruby version manager
echo "installing rvm ..."
curl --silent -L get.rvm.io | rvm_quiet_curl_flag=1 bash -s stable
source /etc/profile.d/rvm.sh
echo "source ~/.profile" >> ~/.bash_profile
rvm requirements

#install ruby
echo "installing ruby ... "
rvm install 2.1.2 >/dev/null

echo "installing rubygems ..."
yum -y install rubygems

echo "installing ruby-devel ..."
yum -y install ruby-devel

#install rails
echo "intalling rails ... "
gem install rails --quiet

#install postgresql
echo "installing postgres ..."
mkdir /pgbak
wget --quiet -O /pgbak/pgdg-centos93-9.3-1.noarch.rpm http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-centos93-9.3-1.noarch.rpm
rpm -ihv /pgbak/pgdg-centos93-9.3-1.noarch.rpm
yum -y install postgresql93.x86_64
