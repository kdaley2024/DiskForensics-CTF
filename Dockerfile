# Karla Daley
# CTF challenge
# Disk Forensics


FROM ubuntu:22.04
LABEL maintainer="Karla Daley <kdaley2024@my.fit.edu>"

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /opt/ctf

# -------------------------------------------------
# Packages
# -------------------------------------------------
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      bash vim nano curl wget netcat iputils-ping traceroute nmap \
      tcpdump tshark unzip zip gcc gdb python3 python3-pip git sudo \
      build-essential man-db socat && \
    rm -rf /var/lib/apt/lists/*

# --------------------------------------------------------
# Install system dependencies
# --------------------------------------------------------
RUN apt-get update && apt-get install -y \
    zip unzip openssl steghide \
    bash coreutils \
    ca-certificates \
    file \
    build-essential \
    binwalk \
    binutils \
    nano \
    jq \
    ngrep \
    tcpreplay \
    tcpslice \
    snort \
    sleuthkit \
    ewf-tools libewf-dev \
    foremost \
    autopsy \
    tshark tcpdump wireshark-common \
    wireshark \
    python3 \
    python3-pip \
    git \
    foremost \
    python3-dev \
    python3-bandit \
    python3-scapy \
    sudo \
    scalpel \
    yara \
    hashdeep \
    whois \
    curl \
    exiftool \
    apache2 \
    ghostscript \
    enscript \
    libssl-dev \
    libffi-dev \
    python3-venv \
    python3-distutils \
    php libapache2-mod-php \
    imagemagick libimage-exiftool-perl \
    xxd git vim less curl wget \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and setuptools
RUN pip3 install --upgrade pip setuptools wheel

# --------------------------------------------------
# Overview
# --------------------------------------------------
RUN mkdir -p /opt/ctf/
RUN printf '%s\n' \
  '  Welcome to the Forensic CTF Challenge Environment!' \
  '  You will be given a series of challenges to test your skills in network analysis and disk forensics.' \
  '  Each challenge is located in its own directory under /opt/ctf/.' \
  '  Good luck and have fun!' \
  > /opt/ctf/README.txt

# -------------------------------------------------
# Network Analysis Challenge
# -------------------------------------------------

RUN mkdir -p /opt/ctf/pcap
RUN printf '%s\n' \
  '  Goal: Analyze the provided PCAP file to uncover hidden messages and extract the secret flag.' \
  '  Open the suspicious.pcap file using Wireshark or tshark or any other packet analysis tool.' \
  '  Look for unusual traffic patterns, hidden data within packets, or encoded messages.' \
  > /opt/ctf/pcap/README.txt

RUN printf '%s\n' \
  '  Hint: Focus on TCP packets and look for any anomalies in the payload.' \
  '  Also look for unusual ports.' \
  > /opt/ctf/pcap/.hint.txt

RUN printf '%s \n' 'https://drive.google.com/file/d/1YrKmSam2cYoN6bOQLUY1LkSnvf1bHUAQ/view?usp=sharing' \
  > /opt/ctf/pcap/pcap.txt
  
# -------------------------------------------------
# Disk Forensics Challenge
# -------------------------------------------------
RUN mkdir -p /opt/ctf/diskForensics
RUN printf '%s\n' \
  '  Goal: Investigate the disk image to find hidden files, deleted content, and other forensic evidence.' \
  '  Use the provided disk image and forensics tools to analyze the data.' \
  '  Look for any suspicious files or activities that could lead to the flag.' \
  > /opt/ctf/diskForensics/README.txt

RUN printf '%s \n' 'https://drive.google.com/drive/folders/1kbqc3z4dskoUbLoT_KMsyquZErU0G591?usp=sharing' \
  > /opt/ctf/diskForensics/disk_image.txt


CMD ["bash"]
