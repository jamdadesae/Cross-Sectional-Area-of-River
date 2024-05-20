<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CrossSectionArea.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="color:blue">Cross Section Calulation</h2><hr />
    <asp:Button ID="Button1" runat="server" Text="Run" class="btn btn-primary" OnClick="Button1_Click"/>
    <hr />
    <br />
    <h2>Cross Section Results</h2>

    <div class="container">
  <div class="row">
    <div class="col-sm-4">
     <img src="CrossSection/data.jpg" class="img-responsive"/>
    </div>
    <div class="col-sm-4">
       <img src="CrossSection/data1.jpg" class="img-responsive"/>
    </div>
    <div class="col-sm-4">
      <img src="CrossSection/data2.jpg" class="img-responsive"/>
    </div>
  </div>
</div>



</asp:Content>

