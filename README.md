# ecolab-project

## Необходимые условия
  * ОС Debian или Ubuntu
  * В ОС установлен Docker и Docker-compose 
  * Создана группа docker
  * Пользователь добавлен в группу docker
  * Пользователь является администратором и добавлен в группу sudo
  * В компьютер подключени только один USB-Com переходник с идентификатором продукта idProduct = "2303"
  * К комрьютеру подключен прибор Эколаб
  * Прибор Эколаб работает и производит измерения

## Открыть терминал

## Выполнить аутентификацию в docker с приведенным кодом PAT в инструкции
  export CR_PAT=КОД_PAT_ИЗ_ИНСТРУКЦИИ

## Выполнить команду
  echo $CR_PAT | docker login ghcr.io -u $USER --password-stdin
  
## Выполнить клонирование репозитория проекта
  git clone https://github.com/smrtsstms/ecolab-project.git
  
## перейти в папку проекта
  cd ecolab-project
  
## Отметить скрипт как исполняемый 
  chmod u+x ecolab-runner.sh
  
## Запустить скрипт

  ./ecolab-runner.sh

Далее при перезагрузке компьютера ПО будет запускаться автоматически. 
