
docker container stop mongovolume

docker container create --name nginxbackup --mount "type=bind,source=/home/m-hardi-raiz/Program/belajar-docker-dasar/backup,destination=/backup" --mount "type=volume,source=mongodata,destination=/data" nginx:latest

docker container start nginxbackup

docker container exec -i -t nginxbackup /bin/bash

tar cvf /backup/backup.tar.gz /data

exit

docker container stop nginxbackup

docker container rm nginxbackup

docker container start mongovolume

docker image pull ubuntu:latest

# Untuk eksekusi lebih ringkas gunakan 3 command dibawah
docker container stop mongovolume

docker container run --rm --name ubuntubackup --mount "type=bind,source=/home/m-hardi-raiz/Program/belajar-docker-dasar/backup,destination=/backup" --mount "type=volume,source=mongodata,destination=/data" ubuntu:latest tar cvf /backup/backup-lagi.tar.gz /data

docker container start mongovolume
