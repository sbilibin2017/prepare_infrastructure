# Makefile для настройки системы

# Порядок выполнения скриптов
SCRIPTS = install_oh_my_zsh.sh \
          configure_gnome.sh \
          configure_git.sh \
          install_docker.sh \
          install_go.sh \
          install_python.sh \
          install_neovim.sh \
          configure_neovim.sh

# Цель по умолчанию
all: $(SCRIPTS)

# Обработка каждого скрипта
$(SCRIPTS):
	@echo "Запуск $@..."
	@bash $@
	@echo "$@ завершён."
