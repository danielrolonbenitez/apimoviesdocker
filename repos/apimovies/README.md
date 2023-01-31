
#Apimovies
This is a api rest for movies and tvshows done in laravel 9 and docker and use jwt for autentication.

#requeriments
comporser.
docker v20 or higher docker composer v2 or higher.
app postman for request to api.

step by step to run docker laravel.
requisites 
1-execute docker-compose up -d //to run docker container.

2-configure your file hosts in yours system operative add  127.0.0.0  apimovies.op  then your may enter in browser http://apimovies.op:4080/api/login for example or use http://localhost:4080/api/login.

2- in console enter docker exec -it apimovies bash  for enter in container docker
4- move to var/www/html/apimovies/
  
3- ceate file .env may copy file .env.example
  -run command composer install.

4- create to jwt token   with comman  php artisan jwt:secret. 
5- create key aplicacion php artisan key:generate.

6- "Important active module write in apache for that the route work"
   command  -sudo a2enmod rewrite  and sudo service apache2 restart


#configure
1-access to database in file .env

DB_CONNECTION=mysql
DB_HOST=mariadb
DB_PORT=3306
DB_DATABASE=apimovies
DB_USERNAME=api
DB_PASSWORD=123456

2-run php artisan migrate

3-run php artisan migrate:fresh --seed //for  run seeders and factories.

4-now may do login in url  http://apimovies.op:4080/api/login post with data json.



5-run comand in your console 
 composer install to create folder vendor.
 php artisan migrate:fresh --sed this run migration and seeder and factories that load data (movies,tvshow,staff,season,episode) and user default for test in yours table. 
 php artisan jwt:secret  for generate key app.

#Model
movies:contain to movies.
staff:contain two type of role director and actor
tvshow: contain tv show and can have many season.
season: contain season can have many enpisode.
episode:contain episode have one season.

#resquest api
all url  of  the api is protected for the token jwt except login, is nececesary generate the token and attach in each request.
-you may use app postman for that see response json.

-generate token, send email and password has one by default.
 Post to http://replaceyourservername/api/login with  json 
{
"email":"admin@admin.com",
"password":"123456" 
}

this serve responds example
{
    "status": 200,
    "content": {
        "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9hcGltb3ZpZXMub3BcL2FwaVwvbG9naW4iLCJpYXQiOjE2NzQ4ODkwNzksImV4cCI6MTY3NDg5MjY3OSwibmJmIjoxNjc0ODg5MDc5LCJqdGkiOiJKa21UM3oyY2hneTdsTzRRIiwic3ViIjoxLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.vB35naM_syIPzU17jScrH23kLx1Vg28nEEgZWLL7nyo",
        "type_token": "bearer",
        "expired_token": 60,
        "message": "Success Login",
        "User": {
            "id": 1,
            "name": "admin",
            "email": "admin@admin.com",
            "created_at": "2023-01-27T06:49:32.000000Z",
            "updated_at": "2023-01-27T06:49:32.000000Z"
        }
    }
}

#jwt
 post to resfresh token rember attach token generate in login 
 Post to http://replaceyourservername/api/refresh.

#Movies.
get to movies remenber attach token generate in login.
-Get to  http://replaceyourservername/api/movie  return all movies.
-Get to  http://replaceyourservername/api/movie/1  return movie with id=1 wiht director and actor.
-Get to  http://replaceyourservername/api/movie/search/{key}/{value}/{order?} return movies filter por any  values for example 
        example: http://replaceyourservername/api/movie/search/genre/action/year rerurn all movies of genre action order by year desc order is optional and can be any colum to table movies.
-Get to  http://replaceyourservername/api/movie/1/{role} return actors if role is actors or director if role is director or both if role is staffs; 
        example:  http://replaceyourservername/api/movie/1/actors.

#create movie  remenber attach token generate in login.
POST to  http://replaceyourservername/api/movie  with json example.
{
 "title":"roky ",
 "genre":"action",
 "year":"2021-09-21",
 "lang":"es",
 "duration":"2hs",
"description":"new movie",
"picture":"urlexample",
"director":"Tommy Holiday",
"actor":"sylvester stallone"
}

value "director" and  "actor" is optional may not be sent, you can search id director or actor to attach to movie for example
"director":1  attack director if find  in table staffs, if you sent string  name, this create new director attach to movie ("director":"Tommy Holiday") 
the same with actor.
{
 "title":"roky ",
 "genre":"action",
 "year":"2021-09-21",
 "lang":"es",
 "duration":"2hs",
"description":"new movie",
"picture":"urlexample"
}

#Staff 
 -Get to  http://replaceyourservername/api/staff  return all staff actor and director.
  -Get to  http://replaceyourservername/api/staff/{role}  return all actor  or director.
           example: http://replaceyourservername/api/staff/actor

#tvshows
 -Get to  http://replaceyourservername/api/tvshow  return all tvshow.
  -Get to  http://replaceyourservername/api/tvshow/1  return tvshow id=1 with season and espisode.
          

