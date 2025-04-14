FROM java:latest
WORKDIR /mpr-java-app
COPY . .
RUN mvn install -r application.properties
CMD ["java","LoginApp.java","LoginController.java"]