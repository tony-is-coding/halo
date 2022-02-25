docker container stop halo-blog
docker container rm halo-blog

docker image rm halo-blog

docker build -t halo-blog:latest .

#
#docker tag halo-blog:latest newbiwtan/special-halo-blog:latest
#
#docker push newbiwtan/special-halo-blog:latest

