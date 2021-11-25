FROM conda/miniconda2:latest

LABEL author="Remi-Andre Olsen" \
      maintainer="remi-andre.olsen@scilifelab.se" \
      homepage="https://github.com/remiolsen/juicer-cpu-docker" \
      3ddna-version="180922" \
      3ddna-commit="529ccf4"

RUN apt-get update && \
    apt-get install -y git openjdk-8-jdk coreutils gawk wget parallel && \
    conda config --add channels bioconda && \
    conda install --yes bwa=0.7.17 scipy=0.14.0 numpy=1.9 matplotlib=1.4.3 && \
    echo 'alias awk=gawk' >> $HOME/.bashrc && \
    apt-get clean && \
    cd /opt && git clone https://github.com/aidenlab/3d-dna && cd 3d-dna && chmod a+x *.sh 

ENV PATH="/opt/3d-dna/:$PATH"

