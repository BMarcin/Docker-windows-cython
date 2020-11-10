FROM python:3.6-windowsservercore-1809

SHELL ["cmd", "/S", "/C"]

ADD https://aka.ms/vs/16/release/vs_community.exe C:\\Downloads\\vs_community.exe 

RUN C:\\Downloads\\vs_community.exe --quiet --wait --norestart --nocache \
	--add Microsoft.VisualStudio.Workload.NativeCrossPlat \
	--add Microsoft.VisualStudio.Workload.NativeDesktop \
	--add Microsoft.VisualStudio.Workload.Universal \
	--add Microsoft.VisualStudio.Component.Windows10SDK \
	--includeRecommended

RUN SETX /M Path "%Path%;C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\BuildTools\\MSBuild\\15.0\\Bin;C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\BuildTools\\VC\\Tools\\MSVC\\14.15.26726;C:\\Program Files (x86)\\Microsoft Visual Studio 14.0\\VC"

RUN where cl >nul 2>nul || "%VS140COMNTOOLS%..\..\VC\vcvarsall.bat" amd64

RUN pip install --upgrade setuptools