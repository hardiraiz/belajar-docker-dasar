
docker network create --driver bridge mongonetwork

docker container create --name mongodb --network mongonetwork --env MONGO_INITDB_ROOT_USERNAME=hardi --env MONGO_INITDB_ROOT_PASSWORD=hardi mongo:latest

docker image pull mongo-express:latest

# pattern sebelum definisi username dan password pada url
docker container create --name mongodbexpress --network mongonetwork --publish 8081:8081 --env ME_CONFIG_MONGODB_URL="mongodb://username:pasword@namahost:27017/" mongo-express:latest
docker container create --name mongodbexpress --network mongonetwork --publish 8081:8081 --env ME_CONFIG_MONGODB_URL="mongodb://hardi:hardi@mongodb:27017/" mongo-express:latest
# jika ketika akses port diharuskan input username dan password
# maka remove container yang dibuat sebelumnya dan buat ulang dengan sintaks berikut
docker container create --name mongodbexpress --network mongonetwork --publish 8081:8081 --env ME_CONFIG_MONGODB_URL="mongodb://hardi:hardi@mongodb:27017/" --env ME_CONFIG_BASICAUTH_USERNAME="hardi" --env ME_CONFIG_BASICAUTH_PASSWORD="hardi" mongo-express:latest

docker container start mongodb

docker container start mongodbexpress

docker network disconnect mongonetwork mongodb

docker network connect mongonetwork mongodb
