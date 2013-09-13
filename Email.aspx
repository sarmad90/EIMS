<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Email.aspx.cs" Inherits="Email" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div class="row">
    <div class="span6">
      <div id="myCarousel" class="carousel slide">
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
          <li data-target="#myCarousel" data-slide-to="3"></li>
        </ol>
        <!-- Carousel items -->
        <div class="carousel-inner">
          <div class="active item"><asp:Image ID="Image3" runat="server" ImageUrl="~/img/for-students.jpg" Height="300" Width="500" /></div>
          <div class="item"><asp:Image ID="Image4" runat="server" ImageUrl="~/img/students-around-laptop.jpg" Height="300" Width="500" /></div>
          <div class="item"><asp:Image ID="Image2" runat="server" ImageUrl="~/img/man-with-laptop2.jpg" Height="300" Width="500" /></div>
          <div class="item"><asp:Image ID="Image1" runat="server" ImageUrl="~/img/college-students-using-laptop-on-campus-lawn-295x200.jpg" Height="300" Width="500" /></div>
        </div>
        <!-- Carousel nav -->
        <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
        <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
      </div>
    </div>
  </div>
  
</asp:Content>


