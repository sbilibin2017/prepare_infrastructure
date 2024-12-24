.PHONY: setup

setup:
	sudo chmod +x install_oh_my_zsh.sh && ./install_oh_my_zsh.sh && source ~/.zshrc
	sudo chmod +x configure_gnome.sh && ./configure_gnome.sh && \
	echo -e "export NO_COLOR=1\nalias ls='ls --color=never'\nalias grep='grep --color=never'" >> ~/.zshrc && source ~/.zshrc && \
	sudo chmod +x install_docker.sh && ./install_docker.sh && \
	sudo chmod +x install_go.sh && ./install_go.sh && source ~/.zshrc && sudo chmod +x configure_go.sh && ./configure_go.sh && \
	sudo chmod +x install_python.sh && ./install_python.sh && source ~/.zshrc && poetry config virtualenvs.in-project true && \
	sudo chmod +x install_neovim.sh && ./install_neovim.sh && source ~/.zshrc && \
	sudo chmod +x install_chatgpt.sh && ./install_chatgpt.sh && \
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb
	rm go1.21.6.linux-amd64.tar.gz google-chrome-stable_current_amd64.deb

