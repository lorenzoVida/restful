function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'UAT_COLOMBIA';
  }
  var config = {
    env: env,
    apiUrl: 'https://restful-booker.herokuapp.com'
  }
  if (env == 'UAT_COLOMBIA') {
    apiUrl: 'https://api-uat.restful-booker.herokuapp.com'
    config.publicID ='1'
    config.privateID = '2'
    config.currency = 'COP'
  if (env == 'UAT_PERU') {
        apiUrl: 'https://api-uat.restful-booker.herokuapp.com'
        config.publicID =''
        config.privateID = '2'
        config.currency = 'PEN'
      }
  } else if (env == 'UAT_BRASIL') {
        apiUrl: 'https://api-uat.restful-booker.herokuapp.com'
        config.publicID ='1'
        config.privateID = '2'
        config.currency = 'MXN'
  }

  return config;
}