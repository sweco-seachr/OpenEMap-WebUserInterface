@echo off 
set release_name=OpenEMap-1.2.0-rc.1
echo ..\release\%release_name%
cd ..\release
rd /s /q %release_name%
del %release_name%.zip
md %release_name%
cd %release_name%
md config
md resources
cd..
sencha.exe compile --classpath=..\src\main\javascript,\libs\ext-4.2.1\src,\libs\geoext-2.0.1\src exclude -all and include -namespace OpenEMap and include -file ..\src\main\javascript\OpenEMap.js and concat --closure ..\%release_name%-all.js
sencha.exe compile --classpath=..\src\main\javascript,\libs\ext-4.2.1\src,\libs\geoext-2.0.1\src exclude -all and include -namespace OpenEMap and include -file ..\src\main\javascript\OpenEMap.js and concat ..\%release_name%-all-debug.js
copy ..\*.html ..\release\%release_name%
copy ..\*-all.js ..\release\%release_name%
xcopy ..\config ..\release\%release_name%\config /E
xcopy ..\resources ..\release\%release_name%\resources /E
zip -r %release_name%.zip %release_name%/*
more
  
