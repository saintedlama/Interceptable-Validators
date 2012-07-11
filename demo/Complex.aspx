<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Complex.aspx.cs" Inherits="_Complex" %>

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
        Complex Validator with Interception
    </h2>
    <p>
        This example uses RequiredFieldValidators with Validation groups in conjunction with interceptableValidators to highlight
        a surrounding div marked with css class 'input-fields' as erroneous. RequiredFieldValidators
        do not render any error message.
    </p>
    
    <fieldset>
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

        <asp:Button OnClick="UpdatePersonalInformation" Text="Update Personal Information" runat="server" />
        <asp:Label ID="lbPersonalMessage" EnableViewState="False" runat="server" />
    </fieldset>

    <fieldset>
        <div class="input-fields">
            <asp:Label AssociatedControlID="tbCompany" runat="server">Company:</asp:Label>
            <asp:TextBox ID="tbCompany" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="tbCompany" ValidationGroup="Company" runat="server" />
        </div>

        <div class="input-fields">
            <asp:Label AssociatedControlID="tbPosition" runat="server">Position:</asp:Label>
            <asp:TextBox ID="tbPosition" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="tbPosition" ValidationGroup="Company" runat="server" />
        </div>

        <asp:Button OnClick="UpdateCompanyInformation" Text="Update Company Information" ValidationGroup="Company" runat="server" />
        <asp:Label ID="lbCompanyMessage" EnableViewState="False" runat="server" />
    </fieldset>
    
    <fieldset>
        <div class="input-fields">
            <asp:Label AssociatedControlID="tbNickname" runat="server">Nickname:</asp:Label>
            <asp:TextBox ID="tbNickname" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="tbNickname" ValidationGroup="Profile" runat="server" />
        </div>

        <div class="input-fields">
            <asp:Label AssociatedControlID="tbStatus" runat="server">Status:</asp:Label>
            <asp:TextBox ID="tbStatus" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="tbStatus" ValidationGroup="Profile" runat="server" />
        </div>

        <asp:Button OnClick="UpdateProfileInformation" Text="Update Profile Information" ValidationGroup="Profile" runat="server" />
        <asp:Label ID="lbProfileMessage" EnableViewState="False" runat="server" />
    </fieldset>
</asp:Content>


