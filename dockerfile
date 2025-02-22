FROM amazonlinux as builder
RUN yum update -y && yum install java-17-amazon-corretto -y && yum install maven -y && yum install git -y
RUN git clone https://github.com/harsh-jaiswal-21/student-ui.git
WORKDIR ./student-ui
RUN mvn clean install

FROM tomcat:jre8-alpine
COPY --from=builder ./student-ui/target/*.war /usr/local/tomcat/webapps/student.war

