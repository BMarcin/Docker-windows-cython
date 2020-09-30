FROM python:3.8.6-windowsservercore-ltsc2016

SHELL ["cmd", "/S", "/C"]

ADD https://aka.ms/vs/16/release/vs_buildtools.exe ./vs_buildtools.exe

RUN vs_buildtools.exe --quiet --wait --norestart --nocache \
    --installPath C:\BuildTools --all \
    --remove Microsoft.VisualStudio.Component.Windows10SDK.10240 \
    --remove Microsoft.VisualStudio.Component.Windows10SDK.10586 \
    --remove Microsoft.VisualStudio.Component.Windows10SDK.14393 \
    --remove Microsoft.VisualStudio.Component.Windows81SDK \
 || IF "%ERRORLEVEL%"=="3010" EXIT 0
	
RUN del vs_buildtools.exe