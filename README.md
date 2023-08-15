# Описание
Полный текст тестового задания находится в конце этого файла  
Программа позволяет производить отложенный перевод средств между пользователями  
 # Используюемые технологии
php 7.1  
composer  
laravel 5  
mysql  
планировщик задач  

 # Шаги установки
 ## Нужно для работы
 + docker
 + docker-compose
 + планировщик задач
### Опционально
 + make
 + git

1. Клонирование репозитория git
    ```
    git clone https://github.com/Suglobov/robo_last_test.git
    ```

1. Копируем файл ***.env.example*** в файл ***.env***
    Команда для линуска из папки проекта
   ```
   cp .env.example .env
   ```

1. Открыть доступ к папке проекта (777)
Команда для линуска из папки проекта
    ```
    sudo chmod -R 777 .
    ```

1. Выполните команду в папке с проектом
    ```
    make setup
    ```
    Если ***make*** не установлен, то список команд можно взять из ***Makefile***

1. Npm.  
    ***npm install*** отрабатывает в ***docker*** во время исполнения ***make setup***  
    но для работы ***npm run dev*** надо локально ***nodejs*** иметь  
    и использовать ***npm i*** в папке проекта

1. Миграции и сиды.  
    Из папки с проекторм
    ```
    docker-compose exec app php artisan migrate --seed
    ```
    Для пересборки
    ```
    docker-compose exec app php artisan migrate:refresh --seed
    ```
    Сиды отдельно
    ```
    docker-compose exec app php artisan db:seed
    ```

1. На сервере запустите планировщик задач  
    который будет запускать средствами ***docker-compose exec app php*** скрипт ***artisan***  
    по расписанию раз в час  
    
    Пример в linux:
    ```
    * * * * * docker-compose -f /path/to/work/folder/docker-compose.yml exec app php artisan schedule:run >>/dev/null 2>&1
    ```

1. Сайт доступен на <a href="http://localhost:8080/" target="_blank">http://localhost:8080/</a>

1. phpmyadmin доступен по адресу <a href="http://localhost:8081/" target="_blank">http://localhost:8081/</a>


