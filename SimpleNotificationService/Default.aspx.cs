using Amazon;
using Amazon.SimpleNotificationService;
using Amazon.SimpleNotificationService.Model;
using System;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SimpleNotificationService
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                foreach (var region in RegionEndpoint.EnumerableAllRegions)
                {
                    ddlRegion.Items.Add(new ListItem(region.DisplayName, region.SystemName));
                }
            }
        }

        protected void ddlCredentialsType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCredentialsType.SelectedValue == "custom")
            {
                phCustomCredentials.Visible = true;
            }
            else {
                phCustomCredentials.Visible = false;
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                AmazonSimpleNotificationServiceClient snsClient;

                if (ddlCredentialsType.SelectedValue == "custom")
                {
                    RegionEndpoint regionEndpoint = RegionEndpoint.GetBySystemName(ddlRegion.SelectedValue);
                    snsClient = new AmazonSimpleNotificationServiceClient(txtAccessKey.Text.Trim(), txtSecretKey.Text.Trim(), regionEndpoint);
                }
                else {
                    //default, configure via web.config
                    snsClient = new AmazonSimpleNotificationServiceClient();
                }

                var smsAttributes = new Dictionary<string, MessageAttributeValue>();

                MessageAttributeValue senderID = new MessageAttributeValue();
                senderID.DataType = "String";
                senderID.StringValue = "AwsSnsTest";

                MessageAttributeValue smsType = new MessageAttributeValue();
                smsType.DataType = "String";
                smsType.StringValue = ddlMessageType.SelectedValue;

                MessageAttributeValue maxPrice = new MessageAttributeValue();
                maxPrice.DataType = "Number";
                maxPrice.StringValue = ddlMaxPrice.SelectedValue;

                smsAttributes.Add("AWS.SNS.SMS.SenderID", senderID);
                smsAttributes.Add("AWS.SNS.SMS.SMSType", smsType);
                smsAttributes.Add("AWS.SNS.SMS.MaxPrice", maxPrice);
                
                var snsResponse = snsClient.Publish(new PublishRequest
                {
                    Message = txtMessage.Text,
                    PhoneNumber = txtTo.Text,
                    MessageAttributes = smsAttributes,
                });

                var serializer = new JavaScriptSerializer();
                lblResult.Text = serializer.Serialize(snsResponse);
            }
            catch (Exception ex)
            {
                lblResult.Text = ex.ToString();
            }
        }
    }
}