#!/bin/bash
sudo apt update && sudo apt full-upgrade
bold=$(tput bold)

echo -e " ${bold} 1. Installing all php packages (Apache, APCu, Arrays BC Math, Bzip2, Calendar, Classes/Objects CommonMark COM Componere Ctype CUBRID cURL Date/Time DBA dBase Direct IO Directories DOM Data Structures Eio Enchant Error Handling Ev Event Program execution Exif Expect FANN FDF FFI Fileinfo Filesystem Filter FastCGI Process Manager FTP Function Handling Gearman Gender GeoIP Gettext Gmagick GMP GnuPG Hash HRTime Firebird/InterBase IBM DB2 iconv Igbinary GD ImageMagick IMAP PHP Options/Info Inotify intl JSON LDAP libxml Lua LuaSandbox LZF Mail Mailparse Math Multibyte String Mcrypt Memcache Memcached Mhash Misc. MongoDB mqseries MySQL (Original) Mysql_xdevapi, MySQLi, Mysqlnd, Network, OAuth, OCI8, OPcache, OpenAL, OpenSSL, Output, Control, parallel, Parle, Password Hashing, PCNTL, PCRE, PDO, CUBRID, (PDO) MS SQL Server, (PDO) Firebird, (PDO) IBM, (PDO) Informix, (PDO) MySQL, (PDO) Oracle, (PDO) ODBC and DB2, (PDO) PostgreSQL, (PDO) SQLite, (PDO) MS, SQL, Server, (PDO) PostgreSQL, Phar, phpdbg, POSIX, PS, Pspell, pthreads, Quickhash, Radius, Random, Rar, Readline, Recode, Reflection, Rnp, RpmInfo, RRD, runkit7, ScoutAPM, Seaslog, Semaphore, Sessions, Shared, Memorym, Simdjson, SimpleXML, SNMP, SOAP, Sockets, Sodium, Solr, SPL, SQLite3, SQLSRV, ssdeep, SSH2, Statistics, Stomp, Streams, Strings, SVM, SVN, Swoole, Sync, Taint, TCP, Tidy, Tokenizer, Trader UI, ODBC, uopz, URLs, V8js, Variable, handling, var_representation, Varnish, WDDX, win32service, WinCache, wkhtmltox, xattr, xdiff, Xhprof, XLSWriter, XML, Parser, XMLDiff, XMLReader, XML-RPC, XMLWriter, XSL, Yac, Yaconf, Yaf, Yaml, Yar, YAZ, Zip, Zlib, 0MQ messaging, ZooKeeper). "
read -p "Do you want to proceed? (y/n) " yn

case $yn in 
	y ) echo Apache2 is Installing;;
	n ) Aborting Installation;
		exit;;
	* ) echo invalid response;
		exit 1;;
esac

BWhite='\033[1;37m'       # White
echo -e "${BWhite}Installing Apache2"
sudo apt-get install apache2