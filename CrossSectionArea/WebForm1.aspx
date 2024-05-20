<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CrossSectionArea.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script type="text/javascript">
        function toggleInputFields() {
            var selectedValue = document.getElementById('<%= dataType.ClientID %>').value;
            var uploadField = document.getElementById('csvFileInputPanel');  
            var manualInputField = document.getElementById('manualInputPanel');

            if (selectedValue === 'Upload') {
                uploadField.style.display = 'block';
                manualInputField.style.display = 'none';
            } else if (selectedValue === 'ManualInput') {
                uploadField.style.display = 'none';
                manualInputField.style.display = 'block';
            } else { 
                uploadField.style.display = 'none';
                manualInputField.style.display = 'none';
            } 
        }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        #inputPanel {
            width: 50%;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
            border-top: 40px solid cadetblue; 
            position:relative;
            text-align: center;
        }

        #inputPanel h2 {
            position: absolute;
            top: -50px; /* Adjust this value to control the vertical position */
            left: 50%;
            transform: translateX(-50%);
            color: black;
        }

        #inputPanel label {
            display: block;
            margin-bottom: 10px;
        }

        #inputPanel input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

    </style>

  

    <div class="container">
        <script> $('#myTabs a').click(function (e) {
                e.preventDefault()
                $(this).tab('show')
 })


            $('#myTabs a[href="#profile"]').tab('show') // Select tab by name
            $('#myTabs a:first').tab('show') // Select first tab
            $('#myTabs a:last').tab('show') // Select last tab
            $('#myTabs li:eq(2) a').tab('show') // Select third tab (0-indexed)


        </script>
       

        <div>

          <!-- Nav tabs -->
          <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">River Discharge Calculation</a></li>
            
           <%-- <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Messages</a></li>
            <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Settings</a></li>--%>
          </ul>
          <br />
          <!-- Tab panes -->
          <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="home">
                <div class="panel-group">
                    <div class="panel panel-primary">
                    <div class="panel-heading">River Discharge Calculation</div>
                    <div class="row">
                        <p style="margin: 15px 36px 10px;">Enter your data to quickly calculate the Cross-Section area and river discharge.
                            The provided data is used to perform calculations for Cross-Sectional Area and river discharge. 
                            Cross-Sectional Area is likely computed using methods such as the trapezoidal method, while river discharge may involve the application of hydraulic principles.
                            Users have the option to download an image of the entropy graphs, allowing them to save and share the visual representation of the data analysis.
                            This could involve presenting the raw input data, intermediate calculations, and final results to help users understand the methods and processes applied.
                            A sample visualization is provided, presumably as a reference or example for users to understand how the data trends are visually represented in the entropy graphs.
                            <br />
                            <br />
                            The latitude and longitude coordinates pinpoint the exact position of the river basin, allowing for accurate mapping and navigation. An extended view of the river basin refers to a comprehensive visual representation that may include the entire basin area, its tributaries, and associated geographical features.
                            It provides detailed maps and visualizations of the river basin, offering insights into its topography, land use, and hydrological characteristics.
                        </p>

                        <div class="col-sm-4"></div>
                        <div class="col-sm-4"> 
                        <div class="panel-body">
                        <div class="form-check">
                         <asp:RadioButton ID="radiouserupload" runat="server" AutoPostBack="True" GroupName="x" OnCheckedChanged="radiouserupload_CheckedChanged"  />
                          <label class="form-check-label" for="check1">Upload File</label>
                        </div> 
                        <div class="form-check">
                          <asp:RadioButton ID="radiocharts" runat="server" AutoPostBack="True" GroupName="x" OnCheckedChanged="radiocharts_CheckedChanged" />
                          <label class="form-check-label" for="check2"> Only Charts Visible</label>
                        </div>

                        <div id="uploadform" runat="server">
                              <div class="form-group">
                                <label for="email">River Basin Name</label>
                                <asp:TextBox ID="riverBasin" runat="server" style="width:200px" class="form-control"></asp:TextBox>
                              </div>

                          <div class="form-group">
                              <label for="pwd">Type of Input Data:</label>
                               <asp:DropDownList ID="dataType" runat="server" onchange="toggleInputFields()" class="form-control" style="width:60%">
                                        <asp:ListItem Text="Select an option" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Upload" Value="Upload"></asp:ListItem>
                                        <asp:ListItem Text="Manual Input" Value="ManualInput"></asp:ListItem>
                               </asp:DropDownList>
                          </div> 
        
                          <div id="csvFileInputPanel" style="display: none;">
                                <label for="file">Upload CSV File</label>
                                <asp:FileUpload ID="csvFileInput" runat="server" accept=".xlsx" class="form-control" style="width:60%"/>
                                <br />
                            </div>

                          <div id="manualInputPanel" style="display: none;">
                                <label for="manualInput">Manual Input</label>
                                <asp:TextBox ID="manualInput" runat="server" style="width:200px" class="form-control"></asp:TextBox>
                            </div>

                          <asp:Button ID="processCSV1" runat="server" Text="Calculate" OnClick="processCSV1_Click" class="btn btn-success" style="margin-left:60px"/>
                        </div>
                        </div>
                       </div>
  
            </div></div>
                         <div class="col-sm-4"></div>
 
            </div>



                <div class="row" id="charts1" runat="server">
                    <div class="col-lg-12">

                        <div class="panel panel-success">
            <div class="panel-heading">Cross Section Charts</div>
            <div class="panel-body"> 
                 <div class="chart-container">
                <div id="container1" class="chart"></div>
                <div id="container2" class="chart"></div>
                <div id="container3" class="chart"></div>
            </div>

                <script>
                    $.get('CrossSection/Interpolated.csv', function (csv) {
                        $('#container1').highcharts({
                            chart: {
                                type: 'line',
                                height: 300,
                                width: 300
                            },
                            data: {
                                csv: csv
                            },
                            title: {
                                text: 'Cross-Sectional Area'
                            },
                            xAxis: {
                                title: {
                                    text: 'Distance from East Bank, ft'
                                }
                            },
                            yAxis: {
                                title: {
                                    text: 'Distance from East Bank, ft'
                                }
                            }
                        });
                    });

                    //chart 2
                    $.get('CrossSection/x-y CrossSection.csv', function (csv) {
                        $('#container2').highcharts({
                            chart: {
                                type: 'line',
                                height: 300,
                                width: 300
                            },
                            data: {
                                csv: csv
                            },
                            title: {
                                text: 'Cross-Sectional Area'
                            },
                            xAxis: {
                                title: {
                                    text: 'Distance from East Bank, ft'
                                }
                            },
                            yAxis: {
                                title: {
                                    text: 'Bank Depth, ft'
                                }
                            }
                        });
                    });

                    //chart 3
                    $.get('CrossSection/xsArea2017.csv', function (csv) {
                        $('#container3').highcharts({
                            chart: {
                                type: 'scatter',
                                height: 300,
                                width: 300
                            },
                            data: {
                                csv: csv
                            },
                            title: {
                                text: 'Water-Level Cross-Sectional Area Over Time - 2017'
                            },
                            xAxis: {
                                title: {
                                    text: 'Water Level'
                                }
                            },
                            yAxis: {
                                title: {
                                    text: 'Area, ft^{2}'
                                }
                            }
                        });
                    });

                </script>



            </div>
    
          </div>


                    </div>
                </div>

                



            </div>
            <div role="tabpanel" class="tab-pane" id="profile">..e.</div>
            <%--<div role="tabpanel" class="tab-pane" id="messages">..r.</div>
            <div role="tabpanel" class="tab-pane" id="settings">..j.</div>--%>
            </div>

</div>





</div>


  
    <script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

    

</asp:Content>
