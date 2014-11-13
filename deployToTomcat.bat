set PROJECT_ROOT=%~dp0%
echo %PROJECT_ROOT%
call %PROJECT_ROOT%..\..\env.bat
call mvn clean package
set TOMCAT_ROOT=%ROOT%bin\apache-tomcat-7.0.56
echo %TOMCAT_ROOT%
if exist %TOMCAT_ROOT%\webapps\showcase (
	rmdir %TOMCAT_ROOT%\webapps\showcase /Q
	echo "Old Directory removed"
)
if exist %TOMCAT_ROOT%\webapps\showcase.war (
	del %TOMCAT_ROOT%\webapps\showcase.war /Q
	echo "Old WAR-File removed"
)
echo "Source Directory"
echo %PROJECT_ROOT%target\richfaces-showcase-tomcat6.war
echo "Target Directory"
echo %TOMCAT_ROOT%\webapps\showcase.war
copy %PROJECT_ROOT%target\richfaces-showcase-tomcat6.war %TOMCAT_ROOT%\webapps\showcase.war
if exist %TOMCAT_ROOT%\webapps\showcase.war (
	echo "WAR-File copied succesfully"
)
