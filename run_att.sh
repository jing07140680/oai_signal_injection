apt-get update
sudo apt install -y libboost-all-dev libusb-1.0-0-dev doxygen python3-docutils python3-mako python3-numpy python3-requests python3-ruamel.yaml python3-setuptools cmake build-essential

cd ~
git clone https://github.com/EttusResearch/uhd.git ~/uhd
cd ~/uhd
git checkout v4.5.0.0
cd host
mkdir build
cd build
cmake ../
make -j $(nproc)
make test # This step is optional
sudo make install
sudo ldconfig
sudo uhd_images_downloader

cd ~
git clone https://gitlab.eurecom.fr/oai/openairinterface5g.git 
~/openairinter\
face5g
cd ~/openairinterface5g
git checkout 2023.w19
cp ../oai-sigover/attacker_10_1.txt .
git apply attacker_10_1.txt
cd ~/openairinterface5g/cmake_targets
./build_oai -I
./build_oai -w USRP --nrUE

