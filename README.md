# Amaç
C++ ile g3log kütüphanesi kullanmak ve kütüphanelerin bağlanmasına dair bir şeyler öğrenebilmek
Ayrıca Makefile ile bu projeyi derleyebilmek.

# İlgili Kütüphane Paketi Yüklü Değilken

## Derleme Sırasında g3log Paketi Yüklü Değilken
`make` ile kodumuzu derlerken g3log paketi sistemde değilse ve Makefile içinde bağımlı olduğu paketleri kurmak için bir etiket yok veya tetiklenmemişse derleme hatayla sonuçlanır.
```
root@11e7a268af15:/kod# make
g++ -pg ./src/main.cpp -lg3logger -g -std=c++14 -Wall -Wunused-parameter -O0 -I./src -I/usr/include/g3log
./src/main.cpp:2:28: fatal error: g3log/g3log.hpp: No such file or directory
compilation terminated.
Makefile:17: recipe for target 'build' failed
make: *** [build] Error 1
```
`main.cpp` içinde `#include <g3log/g3log.hpp>` satırı, g3log.hpp dosyasına erişemiyor.

Çözüm için `prereqs` adında bir etiket ve içerisinde bağımlı olduğu paketleri yükleyen `apt-get install <paket_adı>` satırları olacak.
`prereqs` etiketini `all` etiketi içinde çağıracak şekilde tanımladığımızda (`all: prereqs build`) aşağıdaki başarılı sonucu alırız.

```
root@11e7a268af15:/kod# make
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following NEW packages will be installed:
  g3log
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 122 kB of archives.
After this operation, 679 kB of additional disk space will be used.
Get:1 http://192.168.13.173:8080/repos/thirdparty amd64/ g3log 2.1.2 [122 kB]
Fetched 122 kB in 0s (395 kB/s)
perl: warning: Setting locale failed.
perl: warning: Please check that your locale settings:
        LANGUAGE = (unset),
        LC_ALL = (unset),
        LANG = "en_US.UTF-8"
    are supported and installed on your system.
perl: warning: Falling back to the standard locale ("C").
debconf: delaying package configuration, since apt-utils is not installed
Selecting previously unselected package g3log.
(Reading database ... 20737 files and directories currently installed.)
Preparing to unpack .../archives/g3log_2.1.2_amd64.deb ...
Unpacking g3log (2.1.2) ...
Setting up g3log (2.1.2) ...
g++ -pg ./src/main.cpp -lg3logger -g -std=c++14 -Wall -Wunused-parameter -O0 -I./src -I/usr/include/g3log
root@11e7a268af15:/kod# echo $?
0
root@11e7a268af15:/kod# ./a.out 
FILE ERROR:  could not open log file:[./log.txt/etiketi.log]
                 std::ios_base state = 4
Cannot write log file to location, attempting current directory
LOGGER NOT INITIALIZED:
                streaming API is as easy as ABC or 123
merhaba dunya
g3log g3FileSink shutdown at: 14:39:00 985087
Log file at: [./etiketi.log]
```

## Derlenmiş Çalıştırılabilir Programı Çalıştırdığımızda g3log Paketi Yüklü Değilken
Derlerken g3log paketinin olduğu bir çıktıyı sonrasında, g3log paketini kaldırdıktan sonra çalıştırdığımızda aşağıdaki hatayı verir:

```
root@11e7a268af15:/kod# ./a.out 
./a.out: error while loading shared libraries: libg3logger.so.2.1.2-119: cannot open shared object file: No such file or directory
```

---

# Kütüphaneyi Bağlarken (-lg3logger)
