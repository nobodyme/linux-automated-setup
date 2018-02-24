install_googlechrome() {
    wget -N https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ~/
    dpkg -i --force-depends ~/google-chrome-stable_current_amd64.deb
    apt-get -f install -y
    rm ~/google-chrome-stable_current_amd64.deb
}

install_git() {
    apt install -y git
    git config --global user.name "nobodyme"
    git config --global user.email "naveenkumarspa@gmail.com"
}

install_fontrendering() {
    # for better font rendering
    add-apt-repository ppa:no1wantdthisname/ppa
    apt-get update   
    apt-get install -y fontconfig-infinality

    # Infinality config here
    bash /etc/fonts/infinality/infctl.sh setstyle linux
    chmod a+w /etc/profile.d/infinality-settings.sh

    # search for USE_STYLE in the below file to set it
    gedit /etc/profile.d/infinality-settings.sh
}

install_java() {
    apt install -y openjdk-9-jre-headless
}

install_sublime() {
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg |  apt-key add -
    echo "deb https://download.sublimetext.com/ apt/stable/" |  tee /etc/apt/sources.list.d/sublime-text.list
    apt-get update
    apt-get install sublime-text
}

install_python() {
    # Might wanna look at this as well for future tasks https://askubuntu.com/questions/244641/how-to-set-up-and-use-a-virtual-python-environment-in-ubuntu
    apt install -y virtualenv
    apt install-y python3-pip
    # useful for vim plugins as well
    apt-get install -y build-essential cmake
    apt-get install -y python3-dev
    apt-get install -y python3-setuptools
    # mpg123 dependencies -- used in a pet project
    apt-get install -y libasound-dev portaudio19-dev libportaudio2 libportaudiocpp0
}

install_vim() {
    # vim
    apt install -y vim
    # downloads vundle plugin manager for vim
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim > /dev/null 2>&1
    # fetch uploaded .vimrc
    git clone https://github.com/nobodyme/linux-automated-setup/.vimrc.git ~/.vimrc > /dev/null 2>&1
    # install all plugins
    vim +PluginInstall +qall
    # vim plugins requirements
    install_python
    # install youcomplete me plugin syntax highlighter
    cd ~/.vim/bundle/YouCompleteMe
    ./install.py --all
}

install_c++() {
    apt-get install -y g++
    # for C++ to work
    apt-get install -y libc6-dev
}

install_chromedriverselenium() {
    # Install ChromeDriver.
    wget -N http://chromedriver.storage.googleapis.com/2.33/chromedriver_linux64.zip -P ~/
    unzip ~/chromedriver_linux64.zip -d ~/
    rm ~/chromedriver_linux64.zip
    mv -f ~/chromedriver /usr/local/bin/chromedriver
    chown root:root /usr/local/bin/chromedriver
    chmod 0755 /usr/local/bin/chromedriver

    # Install Selenium.
    wget -N http://selenium-release.storage.googleapis.com/3.4/selenium-server-standalone-3.4.0.jar -P ~/
    mv -f ~/selenium-server-standalone-3.4.0.jar /usr/local/bin/selenium-server-standalone.jar
    chown root:root /usr/local/bin/selenium-server-standalone.jar
    chmod 0755 /usr/local/bin/selenium-server-standalone.jar
}

install_all() {
    install_googlechrome
    install_sublime
    install_git
    install_vim
    install_java
    install_fontrendering
    install_chromedriverselenium
    install_c++
}

install_minimal() {   
    install_git
    install_sublime
    install_python
    install_c++
}

for i in "$@"
    do
    case $i in
        -minimal) install_minimal;;
        -chrome) install_googlechrome;; 
        -git) install_git;;
        -sublime) install_sublime;;
        -c++) install_c++;;
        -vim) install_vim;;
        -java) install_java;;
        -python) install_python;;
        -better-font) install_fontrendering;;
        -chromedriverselenium) install_chromedriverselenium;;
        -all) install_all;;
        *) echo "wrong argument" exit 1;;
    esac
done
