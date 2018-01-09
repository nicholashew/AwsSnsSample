<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SimpleNotificationService.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AWS SNS SMS EXAMPLE</title>
    <style>
        .label-error {
            color: red;
            display: inline-block;
        }

        dl {
            margin-top: 0;
            margin-bottom: 20px;
        }

        dt,
        dd {
            line-height: 1.42857143;
        }

        dt {
            font-weight: bold;
        }

        dd {
            margin-left: 0;
        }

        @media (min-width: 768px) {
            .dl-horizontal dt {
                float: left;
                width: 200px;
                overflow: hidden;
                clear: left;
                text-align: right;
                text-overflow: ellipsis;
                white-space: nowrap;
                margin-bottom: 5px;
            }

            .dl-horizontal dd {
                margin-left: 180px;
                margin-bottom: 5px;
            }

                .dl-horizontal dd input {
                    width: 350px;
                }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>AWS SNS .NET</h1>
            <dl class="dl-horizontal">
                <dt>Credentials Type
                </dt>
                <dd>
                    <asp:DropDownList ID="ddlCredentialsType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCredentialsType_SelectedIndexChanged">
                        <asp:ListItem Value="default">Default (Configure in web.config)</asp:ListItem>
                        <asp:ListItem Value="custom">Custom (Override with Custom Credentials)</asp:ListItem>
                    </asp:DropDownList>
                </dd>
                <asp:PlaceHolder ID="phCustomCredentials" runat="server" Visible="false">
                    <dt>AWSAccessKey:</dt>
                    <dd>
                        <asp:TextBox ID="txtAccessKey" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAccessKey" CssClass="label-error" ErrorMessage="Required." />
                    </dd>
                    <dt>AWSSecretKey:</dt>
                    <dd>
                        <asp:TextBox ID="txtSecretKey" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSecretKey" CssClass="label-error" ErrorMessage="Required." />
                    </dd>
                    <dt>Region:</dt>
                    <dd>
                        <asp:DropDownList ID="ddlRegion" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlRegion" CssClass="label-error" ErrorMessage="Required." />
                    </dd>
                </asp:PlaceHolder>
                <dt>Message Type:</dt>
                <dd>
                    <asp:DropDownList ID="ddlMessageType" runat="server">
                        <asp:ListItem Value="Promotional">Promotional</asp:ListItem>
                        <asp:ListItem Value="Transactional">Transactional</asp:ListItem>
                    </asp:DropDownList>
                </dd>
                <dt>Max Price:</dt>
                <dd>
                    <asp:DropDownList ID="ddlMaxPrice" runat="server">
                        <asp:ListItem Value="0.5">0.50</asp:ListItem>
                        <asp:ListItem Value="0.4">0.40</asp:ListItem>
                        <asp:ListItem Value="0.3">0.30</asp:ListItem>
                        <asp:ListItem Value="0.2" Selected="True">0.20</asp:ListItem>
                        <asp:ListItem Value="0.1">0.10</asp:ListItem>
                    </asp:DropDownList>
                </dd>
                <dt>Phone Number:</dt>
                <dd>
                    <asp:TextBox ID="txtTo" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTo" CssClass="label-error" ErrorMessage="Required." />
                </dd>
                <dt>Message:</dt>
                <dd>
                    <asp:TextBox ID="txtMessage" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtMessage" CssClass="label-error" ErrorMessage="Required." />
                </dd>
                <dt>&nbsp;</dt>
                <dd>
                    <asp:Button ID="btnSend" runat="server" Text="Send SMS" OnClick="btnSend_Click" />
                </dd>
            </dl>
            <hr />
            <asp:Label ID="lblResult" runat="server" />
        </div>
    </form>
</body>
</html>
