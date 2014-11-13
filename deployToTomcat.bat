set PROJECT_ROOT=%~dp0
echo %PROJECT_ROOT%
call %PROJECT_ROOT%..\..\env.bat
call mvn clean package
set TOMCAT_ROOT=%ROOT%bin\apache-tomcat-7.0.26\
echo %TOMCAT_ROOT%
if exist %TOMCAT_ROOT%\webapps\showcase (
	rmdir %TOMCAT_ROOT%\webapps\showcase /Q
)
if exist %TOMCAT_ROOT%\webapps\showcase.war (
	del %TOMCAT_ROOT%\webapps\showcase.war /Q
)
copy %PROJECT_ROOT%\target\richfaces-showcase-tomcat6.war %TOMCAT_ROOT%\webapps\showcase.war