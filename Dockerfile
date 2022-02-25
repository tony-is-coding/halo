FROM adoptopenjdk:11-jre-hotspot as builder
WORKDIR /data/wwwRoot
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} application.jar
RUN java -Djarmode=layertools -jar application.jar extract

################################

FROM adoptopenjdk:11-jre-hotspot
MAINTAINER johnniang <johnniang@fastmail.com>
WORKDIR application
COPY --from=builder /data/wwwRoot/dependencies/ ./
COPY --from=builder /data/wwwRoot/spring-boot-loader/ ./
COPY --from=builder /data/wwwRoot/snapshot-dependencies/ ./
COPY --from=builder /data/wwwRoot/application/ ./

# JVM_XMS and JVM_XMX configs deprecated for removal in halov1.4.4

RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone