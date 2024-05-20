<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="CrossSectionArea.about" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Methodology</h1>
    <br />
    <p> 
        <strong>DISCHARGE ESTIMATION</strong><br /><br />
        The possibility of invoking the entropy-based relationship to es-timate the mean velocity of flow using the maximum of the point velocities recorded at 0.6D depth from the water surface at different verticals, as adopted in the Indian hydrometric practices for estimating discharge using the velocity-area method of discharge estimation. Without losing the accuracy of discharge estima-tion, the proposed relationship would be of considerable benefit in drastically reducing the sampling times of point velocities at different verticals across the entire flow section as carried out in the current practice and as well guaranteeing the safety of observers during high floods. <br /> <br />
        The  theoretical  background  of  discharge  estimation  using the proposed entropy concept-based relationship by linking the velocity, 0.6,maxDu with the maximum one, max,Du, to be estimated on the same vertical, which in turn can be used in the established entropy-based velocity  relationship  as  advocated  for  estimating  the  sectional  mean  flow  velocity  by  Fulton  and  Os-trowski and Moramarco et al.
        the river data details used for studying the appropriateness of the proposed approach and its subsequent application to two Indian river gauging stations. The results of the proposed entropy-based approach of estimating the mean flow velocity is made, having many point velocity measurements available at the deepest flow depth.<br /><br />
        Based on the entropy theory, the velocity profile is defined as a function of maximum velocity and a param-eter M according to the following relationship:
        <br />
        <br />
        <img src="CrossSection/velocity profile.png" alt="nih" title="velocity profile" style="width:50%; margin-right:100px;"><br />
        <br />
        <br />
        where maxiu is the maximum velocity along the thi vertical, ix is the position of the thi sampled vertical from the left bank, M is the entropic parameter, ihx is the dip, that is, the depth of maxiu below the water surface, iDx the vertical flow depth, y is the distance of the velocity point from the bed, and vN is the number of verticals sampled across the river section. The entropic parameter M, which is a characteristic of the section, can be easily estimated through the pairs (max,muu) of the available velocity data set at a gauge site by using the linear entropic relationship:
        <br />
        <br />
        <img src="CrossSection/linear entropic relationship.png" alt ="nih" title="linear entropic relationship" style="width:12%;" /><br />
        <br />
        <br />
        The state equilibrium constant M is defined as:
        <br />
        <br />
        <img src="CrossSection/state equilibrium constant.png" alt="nih" title="state equilibrium constant" style="width:12%;" />
        <br />
        <br />
        where, mu is the mean velocity and maxu is the maximum velocity of flow passing the channel section, M is the entropic parameter, Mis the state equilibrium constant and it has been found that it remains constant along a river reach for fairly a long time.
        <br />
        One can estimate the cross-sectional mean flow velocity by knowing the recorded maximum flow velocity, maxu.  the vertical where u0.6D,max occurs, we can express umax_c of this depth in terms of y0.4D, u0.6D,max and k by replacing, respectively, the variables y, u, and M given in Equation as:
        <br />
        <br />
        <img src="CrossSection/umaxc.png" alt ="nih" title="umax_c" style="width:25%;"/>
        <br />
        <br />
        where max_cu  is  the  estimated  maximum  flow  velocity  of  a  section;  k  is  an  unknown  entropic  parameter  which reflects the uncertainty on the real location of maxu; 0.6,maxDu is the velocity measured on the deepest flow depth at 0.6D from the water surface; 0.4Dy is the location of 0.6,maxDu measured from the bottom of the channel. It is worth noting, the parameters k and M both represents the entropic constant. The only differ-ence between k and M is that the former is obtained by the estimated maximum flow velocity, whereas M is obtained by using the observed maximum flow velocity.
        to  estimate  the  discharge  at  a  river  site,  first,  starting from an arbitrary initial value of k the maximum velocity max_cu is estimated by Equation 4 at verti-cal where 0.6,maxDu occurs, that generally is located at the deepest flow depth or nearby. Therefore, based on previous Equation, the state equilibrium constant k is estimated as:
        <br />
        <br />
        <img src="CrossSection/Screenshot 2024-01-22 132531.png" alt="nih" title="state equilibrium constant" style="width:12%;"/>
        <br />
        <br />
        <img src="CrossSection/um.png" alt="nih" title="um" style="width:12%;"/>
        <br />
        <br />
        <strong>CROSS-SECTION AREA ESTIMATION</strong><br /><br />
        The cross-sectional area (A) can be calculated using the formula for the area of a geometric shape that approximates the river cross-section. 
        The trapezoidal method is commonly used, where the area is estimated by summing the areas of trapezoids formed by the water surface, riverbed, and two adjacent depth points.
        <br /><br /><img src="CSAF.png" alt="nih" title="um" style="width:14%;"/><br /><br />
        where b1 and b2 are the widths of the trapezoid (distances between depth points), ℎ is the difference in depth between those points, and n is the number of depth points.
        The cross-sectional area is typically determined through field measurements that involve taking depth measurements at various points across the river channel. These measurements help characterize the shape of the river and allow for the estimation of the cross-sectional area.
         Cross-sectional area is commonly measured in square meters (m²) in the SI unit system. In the Imperial system, square feet (ft²) may be used as the unit of measurement.
        <br /><br />
         <a href="https://agupubs.onlinelibrary.wiley.com/doi/epdf/10.1029/2021WR029825" target="_blank">Further details</a>
        
    </p>
</asp:Content>
