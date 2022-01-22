# eb_testy
Going to try to do an elastic beanstalk repo

### preq setup pyenv
[pyenv setup](pyenv.md)

### install and use eb cli
[eb install and use](eb_cli.md)


### Cloud Front

Need to add entry for Cloud Front

### Route 53

Need to add entry for Route 53 to point to Cloud Front Distribution

### https

Afterwards need to updated Elastic Beanstalk environment configuration for Load Balancer

Using [this](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/configuring-https-elb.html) guide assuming classic load balancer configuration. 

* Set listening port to 443
* Set listening protocol to https
* Set instance port to 80
* Set listening protocol to http
* Set SSL certificate to one for chosen domain in Route 53





