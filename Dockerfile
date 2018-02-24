FROM ubuntu:16.04

# Import MongoDB public GPG Key
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5

# Add MongoDB to 'apt' / package manager sources
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.6.list

# Install Python 3 & MongoDB
RUN apt-get update && apt-get install python3 mongodb-org -y

# Start MongoDB server
RUN service mongodb start

# Create virtual python instance & install python dependencies
RUN virtualenv -p python3 env
RUN source env/bin/activate
RUN pip install -r auth_service/requirements.txt

# Export environment variable for MONGODB connection string
RUN export MONGODB=mongodb://localhost:27017/

EXPOSE 3000 3001