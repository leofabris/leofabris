#!/bin/bash

baixar_arquivos() {

    clear
    echo
    echo "================================"
    echo "Baixando arquivos necessários..."
    echo "================================"
    echo
    sleep 2

    
    mkdir Ambiente\ Desenvolvimento\ Java
    wget https://leofabris.com.br/downloads/progs/jdk/jdk-8u333-linux-x64.tar.gz
    wget https://archive.apache.org/dist/netbeans/netbeans/14/netbeans-14-bin.zip
    wget https://leofabris.com.br/downloads/java_lib.tar.gz
    wget https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz
    wget https://github.com/cli/cli/releases/download/v2.22.1/gh_2.22.1_linux_amd64.deb
    wget https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
    wget https://github.com/advanced-rest-client/arc-electron/releases/download/v17.0.9/arc-linux-17.0.9-amd64.deb
    wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
}

processar_arquivos() {

    clear
    echo
    echo "================================"
    echo "Processando arquivos baixados..."
    echo "================================"
    echo
    sleep 2

    tar vzxf jdk-8u333-linux-x64.tar.gz
    mv jdk1.8.0_333 jdk8
    sudo mkdir /usr/java
    sudo mv jdk8 /usr/java

    tar vzxf openjdk-11.0.1_linux-x64_bin.tar.gz
    mv jdk-11.0.1 jdk11
    sudo mv jdk11 /usr/java

    unzip netbeans-14-bin.zip
    mv netbeans netbeans-14
    mv netbeans-14 $HOME

    sudo dpkg -i *.deb

}

atualizar() {

    clear
    echo
    echo "==============================================="
    echo "Atualizando repositório e pacotes do sistema..."
    echo "==============================================="
    echo
    sleep 2

    sudo apt-get update
    sudo apt-get upgrade -y
    sudo apt-get install mysql-server apache2 php git zip unzip php7.4 php7.4-intl php7.4-mbstring php7.4-mysql php7.4-zip php7.4-xml php7.4-sqlite3 php7.4-soap php7.4-json build-essential -y
}

gerar_arquivos_cofiguracoes() {

    clear
    echo
    echo "=============================================="
    echo "Gerando arquivo de configuração do NetBeans..."
    echo "=============================================="
    echo
    sleep 2
    cp $HOME/netbeans-14/netbeans/etc/netbeans.conf $HOME/netbeans-14/netbeans/etc/netbeans.conf.bk
    echo 'netbeans_default_userdir="${DEFAULT_USERDIR_ROOT}/14"' > $HOME/netbeans-14/netbeans/etc/netbeans.conf
    echo 'netbeans_default_cachedir="${DEFAULT_CACHEDIR_ROOT}/14"' >> $HOME/netbeans-14/netbeans/etc/netbeans.conf
    echo 'netbeans_default_options="-J-XX:+UseStringDeduplication -J-Xss2m  -J-Dapple.laf.useScreenMenuBar=true -J-Dapple.awt.graphics.UseQuartz=true -J-Dsun.java2d.noddraw=true -J-Dsun.java2d.dpiaware=true -J-Dsun.zip.disableMemoryMapping=true -J-Dplugin.manager.check.updates=false -J-Dnetbeans.extbrowser.manual_chrome_plugin_install=yes  -J--add-opens=java.base/java.net=ALL-UNNAMED -J--add-opens=java.base/java.lang.ref=ALL-UNNAMED -J--add-opens=java.base/java.lang=ALL-UNNAMED -J--add-opens=java.base/java.security=ALL-UNNAMED -J--add-opens=java.base/java.util=ALL-UNNAMED -J--add-opens=java.base/java.nio=ALL-UNNAMED -J--add-exports=java.base/sun.reflect.annotation=ALL-UNNAMED -J--add-opens=java.prefs/java.util.prefs=ALL-UNNAMED -J--add-opens=java.desktop/javax.swing.plaf.basic=ALL-UNNAMED -J--add-opens=java.desktop/javax.swing.text=ALL-UNNAMED -J--add-opens=java.desktop/javax.swing=ALL-UNNAMED -J--add-opens=java.desktop/java.awt=ALL-UNNAMED -J--add-opens=java.desktop/java.awt.event=ALL-UNNAMED -J--add-opens=java.desktop/sun.awt.X11=ALL-UNNAMED -J--add-opens=java.desktop/javax.swing.plaf.synth=ALL-UNNAMED -J--add-opens=java.desktop/com.sun.java.swing.plaf.gtk=ALL-UNNAMED -J--add-opens=java.desktop/sun.awt.shell=ALL-UNNAMED -J--add-opens=java.desktop/sun.awt.im=ALL-UNNAMED -J--add-exports=java.desktop/sun.awt=ALL-UNNAMED -J--add-exports=java.desktop/java.awt.peer=ALL-UNNAMED -J--add-exports=java.desktop/com.sun.beans.editors=ALL-UNNAMED -J--add-exports=java.desktop/sun.swing=ALL-UNNAMED -J--add-exports=java.desktop/sun.awt.im=ALL-UNNAMED -J--add-exports=java.desktop/com.sun.java.swing.plaf.motif=ALL-UNNAMED -J--add-exports=java.desktop/com.apple.eio=ALL-UNNAMED -J--add-opens=jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED -J--add-opens=jdk.compiler/com.sun.tools.javac.code=ALL-UNNAMED -J--add-opens=jdk.compiler/com.sun.tools.javac.comp=ALL-UNNAMED -J--add-opens=jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED -J--add-opens=jdk.compiler/com.sun.tools.javac.jvm=ALL-UNNAMED -J--add-opens=jdk.compiler/com.sun.tools.javac.main=ALL-UNNAMED -J--add-opens=jdk.compiler/com.sun.tools.javac.model=ALL-UNNAMED -J--add-opens=jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED -J--add-opens=jdk.compiler/com.sun.tools.javac.processing=ALL-UNNAMED -J--add-opens=jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED -J--add-opens=jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED -J--add-exports=jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED -J--add-exports=jdk.compiler/com.sun.tools.javac.code=ALL-UNNAMED -J--add-exports=jdk.compiler/com.sun.tools.javac.comp=ALL-UNNAMED -J--add-exports=jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED -J--add-exports=jdk.compiler/com.sun.tools.javac.jvm=ALL-UNNAMED -J--add-exports=jdk.compiler/com.sun.tools.javac.main=ALL-UNNAMED -J--add-exports=jdk.compiler/com.sun.tools.javac.model=ALL-UNNAMED -J--add-exports=jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED -J--add-exports=jdk.compiler/com.sun.tools.javac.processing=ALL-UNNAMED -J--add-exports=jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED -J--add-exports=jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED -J--add-modules=jdk.jshell -J--add-opens=jdk.jshell/jdk.jshell=ALL-UNNAMED -J--add-exports=jdk.jdeps/com.sun.tools.classfile=ALL-UNNAMED -J--add-exports=jdk.jdeps/com.sun.tools.javap=ALL-UNNAMED -J--add-exports=jdk.internal.jvmstat/sun.jvmstat.monitor=ALL-UNNAMED -J--add-exports=java.management/sun.management=ALL-UNNAMED -J-XX:+IgnoreUnrecognizedVMOptions"' >> $HOME/netbeans-14/netbeans/etc/netbeans.conf
    echo 'netbeans_jdkhome="/usr/java/jdk11/"' >> $HOME/netbeans-14/netbeans/etc/netbeans.conf

    echo
    echo "====================================="
    echo "Configurando variáveis de ambiente..."
    echo "====================================="
    echo
    sleep 2
    cp $HOME/.profile $HOME/.profile.bk
    echo "JAVA_HOME=/usr/java/jdk8" >> $HOME/.profile
    echo "PATH=\$PATH:\$JAVA_HOME/bin" >> $HOME/.profile

    echo
    echo "=================================="
    echo "Criando link executável do JRE8..."
    echo "=================================="
    echo
    sleep 2
    ln -s /usr/java/jdk8/bin/java
    mv java java8
    sudo mv java8 /bin

    echo
    echo "==================================="
    echo "Criando link executável do JRE11..."
    echo "==================================="
    echo
    sleep 2
    ln -s /usr/java/jdk11/bin/java
    mv java java11
    sudo mv java11 /bin

}

clear

echo
echo "=============================================================="
echo "Script para configuração de Ambiente para Desenvolvimento Java"
echo "               Escrito por: Leonardo F. Fabris"
echo "=============================================================="
echo

echo "Olá, $USER!"
echo "Iremos preparar sua máquina para desenvolver em java"
echo "Em um determinado local do script, será requisitado"
echo "que você informe a senha do super usuário."
echo "No caso, será a senha do seu próprio usuário para "
echo "atualizarmos o sistema e copiar os arquivos para os"
echo "devidos lugares sem restrição."
echo
echo
echo "Podemos continuar? (s/n)"
read RESPOSTA

if [ $RESPOSTA = "s" ]; then
    echo "Então vamos começar!"

    echo "3"
    sleep 1
    echo "2"
    sleep 1
    echo "1"
    sleep 1

    cd $HOME

    atualizar
    baixar_arquivos
    processar_arquivos
    gerar_arquivos_cofiguracoes
else
    echo "Tudo bem. Talvez uma outra hora..."
    echo "Tchau Tchau"
    exit
fi
