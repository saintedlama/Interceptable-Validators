<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript">
        $(function () {
            interceptPageValidation({
                beforeValidation: function () {
                    console.log('beforeValidatorOnSubmit');
                },
                afterValidation: function (valid) {
                    console.log('afterValidatorOnSubmit' + valid);
                }
            });

            interceptFieldValidation({
                beforeValidation: function (val) {
                    console.log('beforeFieldValidation' + val);
                },
                afterValidation: function (val, valid) {
                    var inputFields = $(val).parent('.input-fields:first');
                    if (valid) {
                        inputFields.removeClass('error');
                    } else {
                        inputFields.addClass('error');
                    }
                }
            });
        });
    </script>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Simple Validator with Interception
    </h2>
    <p>
        This example uses RequiredFieldValidators in conjunction with interceptableValidators to highlight
        a surrounding div marked with css class 'input-fields' as erroneous. RequiredFieldValidators
        do not render any error message.
    </p>
    
    <div class="input-fields">
        <asp:Label AssociatedControlID="tbFirstname" runat="server">Firstname:</asp:Label>
        <asp:TextBox ID="tbFirstname" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ControlToValidate="tbFirstname" runat="server" />
    </div>

    <div class="input-fields">
        <asp:Label AssociatedControlID="tbLastname" runat="server">Lastname:</asp:Label>
        <asp:TextBox ID="tbLastname" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ControlToValidate="tbLastname" runat="server" />
    </div>

    <asp:Button OnClick="DoSomething" Text="ValidateInput" runat="server" />
    <asp:Label ID="lbMessage" runat="server" />
</asp:Content>


