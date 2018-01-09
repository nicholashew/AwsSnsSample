# Amazon SNS (Simple Notification Service) Example

Web application to demonstrate sending SMS Message using Amazon SNS.

## Configuring AWS Credentials

The default credentials information can be configure in web.config. There are many ways to configure your application's AWS credentials, click [here](https://docs.aws.amazon.com/sdk-for-net/v2/developer-guide/net-dg-config-creds.html) to find out more.

```xml
<configuration>
  <appSettings>
    <!--AWS SETTINGS-->    
    <add key="AWSAccessKey" value="YourAWSAccessKey" />
    <add key="AWSSecretKey" value="YourAWSSecretKey" />
    <add key="AWSRegion" value="ap-southeast-1" />
  </appSettings>
 </configuration>
```

## Related Links
- [AWS SDK for .NET](https://aws.amazon.com/sdk-for-net/)
- [Sending a SMS Message](https://docs.aws.amazon.com/sns/latest/dg/sms_publish-to-phone.html)
- [Sending a SMS Message Using the AWS SDK for .NET](https://docs.aws.amazon.com/sdk-for-net/v3/developer-guide/send-sms-message.html)
- [Configuring AWS Credentials](https://docs.aws.amazon.com/sdk-for-net/v2/developer-guide/net-dg-config-creds.html)
- [Amazon SNS (Simple Notification Service) Using Visual Studio](http://www.c-sharpcorner.com/article/amazon-sns-simple-notification-service-using-visual-studio/)