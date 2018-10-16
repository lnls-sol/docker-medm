FROM lnlssol/docker-debian8-epicsbase

RUN apt-get update

RUN apt-get install x11proto-print-dev libxmuu-dev  libnetcdf-dev libhdf5-dev  libbz2-dev  libxml2-dev libxp-dev -y


#install MEDM

WORKDIR /usr/local/epics/
RUN wget https://github.com/jeonghanlee/extensions/archive/extensions_20120904.tar.gz
RUN tar -xzf extensions_20120904.tar.gz
RUN rm -fv extensions_20120904.tar.gz
RUN mv extensions-extensions_20120904 extensions
WORKDIR /usr/local/epics/extensions/src
RUN wget https://github.com/epics-extensions/medm/archive/MEDM3_1_13.tar.gz
RUN tar -xzf MEDM3_1_13.tar.gz
RUN rm -fv MEDM3_1_13.tar.gz


WORKDIR /usr/local/epics/extensions/configure/os
RUN sed -i 's:X11_LIB=.*$:X11_LIB=/usr/lib/x86_64-linux-gnu:g' CONFIG_SITE.linux-x86_64.linux-x86_64
RUN sed -i 's:MOTIF_LIB=.*$:MOTIF_LIB=/usr/lib/x86_64-linux-gnu:g' CONFIG_SITE.linux-x86_64.linux-x86_64


WORKDIR /usr/local/epics/extensions/src/medm-MEDM3_1_13
RUN make
WORKDIR /usr/local/epics/extensions/bin/linux-x86_64

#./medm -x -macro "P=mcaTest:,R=Amptek1:, M=mca1" /usr/local/epics/synApps/support/mca-R7-7/mcaApp/op/adl/Amptek.adl & 


CMD bash


