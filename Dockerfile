FROM itzg/minecraft-server

# Устанавливаем рабочий каталог
WORKDIR /data


VOLUME ["/data/minecraft", "/data"]


# Копируем необходимые файлы и директории
COPY ./custom /custom
COPY ./custom/dynmap/configuration.txt /data/dynmap/configuration.txt

# Устанавливаем переменные окружения
ENV EULA=TRUE \
    MAX_MEMORY=5G \
    INIT_MEMORY=5G \
    TZ=Europe/Samara \
    USE_AIKAR_FLAGS=true \
    TYPE=FABRIC \
    FABRIC_LOADER_VERSION=0.14.22 \
    VERSION=1.20.1 \
    MOTD="Дарова ёпта" \
    DIFFICULTY=hard \
    ICON=/custom/icon/asa.png \
    OVERRIDE_ICON=TRUE \
    SNOOPER_ENABLED=false \
    MODE=survival \
    ALLOW_FLIGHT=TRUE \
    SERVER_NAME="Сервак ёпта" \
    ONLINE_MODE=false \
    COPY_MODS_SRC=/custom/mods \
    COPY_CONFIG_SRC=/custom/config \
    SYNC_SKIP_NEWER_IN_DESTINATION=true \
    REMOVE_OLD_MODS=TRUE


# Открываем порты
EXPOSE 25565 8123

# Команда запуска
CMD ["sh", "-c", "/start"]