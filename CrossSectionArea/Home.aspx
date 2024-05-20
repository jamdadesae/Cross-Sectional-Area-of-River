<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CrossSectionArea.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
  <!--<h2>Carousel Example</h2> --> 
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="CrossSection/nih.png" alt="Los Angeles" style="width:100%;">
      </div>

      <!-- <div class="item">
        <img src="CrossSection/R.jpg" alt="Chicago" style="width:100%;">
      </div> -->
    
      <div class="item">
        <img src="CrossSection/ganga.jpg" alt="New york" style="width:100%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

    <div class="container">
  <br />

        <div class="panel panel-primary">
      <div class="panel-heading"  style="font-size: large; font-weight: bold;">Entropy Based River Discharge Estimation</div>
      <div class="panel-body">
          <strong>DISCHARGE</strong><br /><br />
          Entropy theory applied to hydrometric measurements enables establishing a relationship between the maximum and the mean velocities of flow passing a river section. 
          In many developing countries, river discharge is still estimated by the velocity-area method following the procedure established based on the point-velocities measured at 0.6D depth from the water surface of many verticals of flow section. 
          
          This study explores the establishment of a relationship between the maximum point-velocity estimated at 0.6D depth of the vertical located at or nearer to the deepest flow depth, and the maximum point-velocity occurring somewhere along the same vertical which in turn can be linked to the sectional mean flow velocity based on the established entropy theory.
          <br /><br />
          The study finds that the discharges estimated by both the proposed approach and the velocity-area method closely match with each other with the estimated Nash-Sutcliffe Efficiency (NSE) values greater than 0.99. The proposed two-steps approach involving the entropy concept based relationship for discharge estimation enables to replace the tedious and time-consuming velocity-area approach.
          <br />
          <br />
          <style>
        /* Center the image horizontally and vertically */
        .center-container {
            display: flex;
            justify-content: center;
            align-items: center;
            
        }

        /* Optional: Set a max-width for the image */
        .center-container img {
            max-width: 70%; /* Adjust as needed */
            height: auto;
        }
    </style>
          <div class="center-container">
    <img src="wrcr26236-fig-0005-m1.jpg" alt="Centered Image">
              
</div>
          <p style="text-align:center; font-size:small;">Fig. Maximum Velocity at 0.6D.</p>
          <br />
           <strong>CROSS-SECTION AREA</strong><br /><br />
          The river cross-sectional area refers to the total area enclosed by the cross-section of a river channel at a specific location. 
          It is a fundamental parameter in hydrology and river hydraulics, and it plays a crucial role in understanding and modeling river flow.
          The cross-sectional area is a critical parameter for calculating river discharge, which is the volume of water passing through a cross-section per unit of time.
          <br />
          <br />
          The trapezoidal method is a simple and common technique used to estimate the cross-sectional area of a river channel based on field measurements of the water depths. 
          The method assumes that the cross-section of the river resembles a series of trapezoids, and it calculates the total area by summing the areas of these trapezoids.
          The trapezoidal method is a straightforward and practical approach for river cross-section estimation, especially in the absence of more detailed data. It is commonly used in hydrology and river engineering.
          <div class="center-container">
          <img src="CR1.jpeg" alt="Centered Image">
          </div><br />
          <p style="text-align:center; font-size:small;">Fig.Cross-Section Area.</p>
      </div>
    </div>

       
</div>

</asp:Content>
