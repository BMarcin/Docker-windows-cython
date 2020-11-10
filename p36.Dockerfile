FROM python:3.6-windowsservercore-1809

SHELL ["cmd", "/S", "/C"]

ADD https://aka.ms/vs/16/release/vs_buildtools.exe C:\\Downloads\\vs_buildtools.exe

RUN C:\\Downloads\\vs_buildtools.exe --quiet --wait \
	--add Microsoft.VisualStudio.Workload.MSBuildTool \ 
	--add Microsoft.VisualStudio.Workload.VCTools \
	--add Microsoft.VisualStudio.Workload.UniversalBuildTools \
	--includeRecommended

RUN SETX /M Path "%Path%;C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\BuildTools\\MSBuild\\15.0\\Bin;C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\BuildTools\\VC\\Tools\\MSVC\\14.15.26726;C:\\Program Files (x86)\\Microsoft Visual Studio 14.0\\VC"

RUN pip install --upgrade setuptools