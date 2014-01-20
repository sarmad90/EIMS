<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="_Default" Title="EIMS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <asp:Panel runat="server" ID="AuthenticatedMessagePanel">
        <asp:Label runat="server" ID="WelcomeBackMessage">
</asp:Label>
    </asp:Panel>
    
    <asp:Panel runat="Server" ID="AnonymousMessagePanel">
        <div class="row">
          <div class="col-md-8">
            <div class="Image-Footer"><p style="font-size:30px; padding-top: 25px;">Education made organised.</p></div>
          </div>
          <div class="col-md-8">
              <asp:Login ID="Login1" runat="server" BackColor="White" Width="400px" CssClass="Home-Login2" DisplayRememberMe="False" Height="200px" TextLayout="TextOnTop">
                <LayoutTemplate>
                  <!-- Login !-->
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-lock"></span> Login</div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form">
                    <div class="form-group">
                        
                        <div class="col-sm-9">
                          <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                          <asp:TextBox ID="UserName" class="form-control" placeholder="Username" runat="server"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        
                        <div class="col-sm-9">
                          <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                          <asp:TextBox ID="Password" class="form-control" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                          <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"/>
                                    Remember me
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group last">
                        <div class="col-sm-offset-3 col-sm-9">
                          <asp:Button ID="LoginButton" runat="server" CommandName="Login" CssClass="btn btn-primary" Text="Log In" ValidationGroup="Login1" />
                        </div>
                    </div>
                    </form>
                </div>
                <div class="panel-footer">
                    Not Registred? 
            </div>
        </div>
    </div>            
                </LayoutTemplate>
                <LoginButtonStyle CssClass="btn btn-primary" />
              </asp:Login>
          </div>
        </div>
    </asp:Panel>
    
    <div style="float:left">
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget leo condimentum, suscipit sapien a, cursus enim. Etiam dictum, orci sed aliquet auctor, nibh nunc elementum lectus, eget mollis urna eros pharetra ipsum. Ut nec rutrum sem. Nam vitae sem magna. Quisque eleifend pharetra massa sit amet auctor. Sed leo quam, congue et congue at, fringilla id nisl. Nam vitae nibh suscipit, lobortis elit in, sagittis nunc. Pellentesque hendrerit, lectus ac condimentum convallis, nisl diam ullamcorper risus, non sagittis quam tortor non ante. Ut fringilla non diam at vulputate. Nunc arcu est, tincidunt et sollicitudin nec, luctus non est. Sed posuere nibh quis mollis placerat. Sed quis ultrices leo. Pellentesque ut orci nisl. Suspendisse potenti. Vivamus semper justo et nulla accumsan, nec tincidunt mauris auctor. Aenean at libero quis odio commodo rhoncus vel ut turpis. Nam sit amet tortor nec odio luctus scelerisque. Suspendisse mollis sit amet orci sit amet malesuada. Praesent accumsan elementum sapien, sit amet aliquet massa tempus et. Maecenas venenatis elementum mi non suscipit. Praesent sollicitudin rhoncus arcu quis posuere. Phasellus justo tellus, pellentesque eu nisl sodales, tincidunt ultrices lectus. Curabitur ac vehicula eros. Donec et gravida odio. Donec consectetur, ante porta consequat ultricies, velit mauris suscipit felis, et porttitor elit ante ac sapien. Duis vestibulum ultricies risus non semper. 
In consequat mauris in nibh luctus, nec dignissim ipsum rhoncus. Curabitur sed ipsum dui. Duis dignissim turpis a orci hendrerit, dignissim hendrerit quam placerat. Etiam interdum, libero eget ultrices volutpat, nisl dolor dictum lorem, et tincidunt ligula ante eu mi. Curabitur congue aliquam nibh, in sodales ligula. Pellentesque ut justo eget dui aliquet adipiscing ultrices quis turpis. Nulla in dapibus nibh. Suspendisse interdum luctus ligula, a faucibus massa tristique nec. Sed ut nibh eget tortor ornare sollicitudin. Vestibulum interdum turpis eu iaculis vestibulum. Donec rhoncus mauris commodo erat accumsan rutrum. Maecenas aliquet lacinia ornare. Pellentesque semper dapibus semper. Nulla facilisi. Duis imperdiet sed nisl eget imperdiet. 
Etiam dui tellus, bibendum vel leo ac, molestie porta mauris. Cras vel facilisis turpis, ac rhoncus nulla. Mauris sodales metus urna, eget sollicitudin augue iaculis ac. Cras rutrum auctor lacus sit amet viverra. Proin sit amet orci urna. Aenean risus dolor, gravida non urna nec, blandit dignissim orci. Vestibulum pharetra tellus sit amet velit congue, interdum rutrum lacus laoreet. Integer sagittis, arcu in pretium gravida, libero libero sagittis lacus, a mollis mi mi sit amet risus. Pellentesque ut urna hendrerit leo convallis hendrerit. Fusce adipiscing erat urna, pretium dignissim mi consectetur suscipit. Integer accumsan luctus orci non accumsan. Sed ornare auctor mauris, quis mollis sem sagittis eget. Nunc feugiat, est eu mattis commodo, sem erat vehicula tellus, euismod ornare libero neque rutrum lectus. Morbi mattis, lacus nec imperdiet malesuada, sem diam facilisis lorem, vel fringilla leo est a massa. Mauris ac augue quis orci condimentum aliquet bibendum sed quam. 
</p>
        </div>
    <p>&nbsp;</p>
</asp:Content>
