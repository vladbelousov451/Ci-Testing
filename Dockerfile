FROM jordan/rundeck
USER root
COPY assets/git-plugin-1.0.4.jar /var/lib/rundeck/libext/
COPY assets/powershell_7.0.3-1.debian.9_amd64.deb /tmp/
WORKDIR /tmp
RUN apt-get update -y && apt-get install liblttng-ust0 -y
RUN dpkg -i -a /tmp/powershell_7.0.3-1.debian.9_amd64.deb
RUN pwsh -command "Find-Module -Name VMware.PowerCLI | Install-Module -Force"
