## How to build libs and sample apps

Straightforward steps for building libraries and samples on supported platforms.

For detailed guidance of the code samples, see [Linux code examples](https://msdn.microsoft.com/en-us/Library/mt283720(v=vs.85).aspx) on MSDN.

---
## Supported targets
- [Ubuntu 14.04](#ubuntu-1404)
- [OpenSUSE 13.2](#opensuse-132)
- [CentOS 7.1](#centos-7)
 
Note: When the libs are compiled you will have created four libs; librms.so, librmsauth.so, librmscrypto.so, and libwebAuthDialog.so. All four are necessary if you use our ADAL for OAuth authentication.

Libs and samples have been successfully compiled on Windows and OSX as well, but these are not fully supported at this time.

### Windows

1. Install Visual Studio 2015
2. Install Qt Creator. Select the msvc2015 component (32 bit) in the installer prompt under Qt 5.7.
  ```
  open https://www.qt.io/download-open-source/
  download the last version of Qt Creator and install it
  ```

3. Install git
  ```
  open https://git-scm.com/download/win. The latest version will be downloaded automatically
  install downloaded version
  ```

4. Clone this repo:
  ```
  open git-bash
  enter the directory you want to clone project in
  execute command: git clone https://github.com/aragun/rms-sdk-for-cpp.git
  ```

5. Switch to the 'winport_evo_15' branch.
   ```
   cd rms-sdk-for-cpp
   git checkout winport_evo_15
   ```
   
6. Unzip and copy the 'third_party' folder provided to the cloned folder 'rms-sdk-for-cpp'
  
7. Build projects
  ```
  Use the Desktop Qt5.7.0 MSVC2015 32 bit kit for both sdk\sdk.pro and samples\samples.pro.
  Run qmake every time you change the .pro file before building.
  ```

8. Run sample applications (suffixed with 'd' for debug builds):
  ```
  cd ../bin
  rms_sample.exe	# RMS sample
  rmsauth_sample.exe	# auth sample
  ```

### Ubuntu 14.04
1. Install Qt Creator. Select Desktop gcc 64-bit, Qt WebEngine, and Source in the installer prompt under Qt 5.7.
  ```
  Open https://www.qt.io/download-open-source/
  Download version 5.7 of Qt Creator and install it
  ```

2. Install dev dependencies:
  ```
  sudo apt-get install libssl-dev
  sudo apt-get install libsecret-1-dev
  sudo apt-get install freeglut3-dev
  ```

3. Clone this repo:
  ```
  sudo apt-get install git
  git clone https://github.com/AzureAD/rms-sdk-for-cpp
  cd rms-sdk-for-cpp
  git checkout feature/winport-evo
  ```

4. Build libraries:
  ```
  cd sdk
  qmake
  make
  ```

5. Build sample applications:
  ```
  cd ../samples
  qmake
  make
  ```

  Alternatively, you can open Qt Creator and build rms-sdk-for-cpp/sdk/sdk.pro and rms-sdk-for-cpp/samples/samples.pro from Qt Creator.

6. Run sample applications:
  ```
  cd ../bin
  export LD_LIBRARY_PATH=`pwd`
  ./rms_sample	    # RMS sample
  ./rmsauth_sample	# auth sample
  ```

  Alternatively, you can run the sample application from Qt Creator.


## Create a tarball (to deploy apps):

1. Install Linuxdeployqt
  Follow the steps from this repo https://github.com/probonopd/linuxdeployqt
  Make sure that the PATH variable has the location of Qt 5.7
  ```
  export PATH=$HOME/Qt/5.7/gcc_64/bin/:$PATH
  which qmake
  $HOME/Qt/5.7/gcc_64/bin/qmake
  qmake -v
  Using Qt version 5.7.0 in $HOME/Qt/5.7/gcc_64/lib
  ```

2. Copy libraries to new directory
  ```
  mkdir deployed
  cp bin/rms_sample deploy/.
  cp bin/rmsauth_sample deploy/.
  cp bin/librms*.so deploy/.
  ```

3. Run linuxdeployqt
  ```
  cd deployed
  sudo $HOME/linuxdeployqt/linuxdeployqt/linuxdeployqt rms_sample
  sudo $HOME/linuxdeployqt/linuxdeployqt/linuxdeployqt rmsauth_sample
  ```

  If it throws errors that some files failed to copy, rerun the commands.

4. Move library files to lib directory
  ```
  sudo mv *.so lib
  ```

5. Copy additional libraries from Qt
  ```
  sudo cp -r $HOME/Qt/5.7/gcc_64/translations/qtwebengine* libexec/.
  sudo cp -r $HOME/Qt/5.7/gcc_64/translations/qtwebengine* resources/.
  ```

6. Create a tarball (to deploy apps)
  ```
  cd ..
  tar czf deployed.tar.gz ./deployed
  ```
  
### OpenSUSE 13.2

1. Install dev dependencies:
  ```
  sudo zypper install libqt5-qtbase-devel
  sudo zypper install libQt5WebKitWidgets-devel
  sudo zypper install libQt5XmlPatterns-devel
  sudo zypper install libopenssl-devel
  sudo zypper install libsecret-devel
  ```

2. Clone this repo
  ```
  sudo zypper install git
  git clone https://github.com/AzureAD/rms-sdk-for-cpp
  ```

3. Build libraries:
  ```
  cd sdk
  qmake-qt5
  make
  ```

4. Build sample applications:
  ```
  cd ../samples
  qmake-qt5
  make
  ```

5. Run sample applications:
  ```
  cd ../bin
  export LD_LIBRARY_PATH=`pwd`
  ./rms_sample	    # RMS sample
  ./rmsauth_sample	# auth sample
  ```
  
6. Create a tarball (to deploy apps):
  ```
  tar czf sample_apps.tar.gz ./rms_sample ./rmsauth_sample ./librmsauth.so ./librmsauthWebAuthDialog.so ./librms.so ./librmscrypto.so
  ```

### CentOS 7

1. Install dev dependencies:
  ```
  sudo yum groupinstall "Development Tools"
  sudo yum install wget
  sudo yum install gcc-c++
  wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
  sudo rpm -ivh epel-release-7-5.noarch.rpm
  sudo yum --enablerepo=epel install qt5-qtbase-devel
  sudo yum --enablerepo=epel install qt5-qtwebkit-devel
  sudo yum --enablerepo=epel install qt5-qtxmlpatterns-devel
  sudo yum install openssl-devel
  sudo yum install libsecret-devel
  ```

2. Clone this repo:
  ```
  git clone https://github.com/AzureAD/rms-sdk-for-cpp
  ```

3. Build libraries:
  ```
  cd sdk
  qmake-qt5
  make
  ```

4. Build sample applications:
  ```
  cd ../samples
  qmake-qt5
  make
  ```

5. Run sample applications:
  ```
  cd ../bin
  export LD_LIBRARY_PATH=`pwd`
  ./rms_sample	    # RMS sample
  ./rmsauth_sample	# auth sample
  ```

6. Create a tarball (to deploy apps):
  ```
  tar czf sample_apps.tar.gz ./rms_sample ./rmsauth_sample ./librmsauth.so ./librmsauthWebAuthDialog.so ./librms.so ./librmscrypto.so
  ```
