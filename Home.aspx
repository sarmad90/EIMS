<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="_Default" Title="EIMS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <asp:Panel runat="server" ID="AuthenticatedMessagePanel">
        <asp:Label runat="server" ID="WelcomeBackMessage">
</asp:Label>
    </asp:Panel>
    
    <asp:Panel runat="Server" ID="AnonymousMessagePanel">
        <div class="row">
          <div class="span8">
            <!-- Carousel Start -->
               <!-- Main Area -->
                <div id="main_area">
                        <!-- Slider -->
                        <div class="row">
                                <div class="span12" id="slider">
                                        <!-- Top part of the slider -->
                                        <div class="row">
                                                <div class="span8" id="carousel-bounding-box">
                                                        <div id="myCarousel" class="carousel slide">
                                                                <!-- Carousel items -->
                                                                <div class="carousel-inner">
                                                                        <div class="active item" data-slide-number="0"><asp:Image ID="Image8" runat="server" ImageUrl="~/img/man-with-laptop2.jpg" Width="650px" Height="400px" /></div>
                                                                        <div class="item" data-slide-number="1"><asp:Image ID="Image7" runat="server" ImageUrl="~/img/students-around-laptop.jpg" Width="650px" Height="400px" /></div>
                                                                        <div class="item" data-slide-number="2"><asp:Image ID="Image9" runat="server" ImageUrl="~/img/for-students.jpg" Width="650px" Height="400px" /></div>
                                                                        <div class="item" data-slide-number="3"><asp:Image ID="Image10" runat="server" ImageUrl="~/img/155124579.jpg" Width="650px" Height="400px" /></div>
                                                                        <div class="item" data-slide-number="4"><asp:Image ID="Image11" runat="server" ImageUrl="~/img/college-professor.jpg" Width="650px" Height="400px" /></div>
                                                                        <div class="item" data-slide-number="5"><asp:Image ID="Image12" runat="server" ImageUrl="~/img/Latino student group.jpg" Width="650px" Height="400px" /></div>
                                                                </div>
                                                                <!-- Carousel nav -->
                                                                <a class="carousel-control left" href="#myCarousel" data-slide="prev">‹</a>
                                                                <a class="carousel-control right" href="#myCarousel" data-slide="next">›</a>
                                                        </div>
                                                </div>
                                                <div class="span4" id="carousel-text"></div>

                                                <div style="display: none;" id="slide-content">
                                                        <div id="slide-content-0">
                                                                <h2>Slider One</h2>
                                                                <p>Lorem Ipsum Dolor</p>
                                                                <p class="sub-text">October 24 2012 - <a href="#">Read more</a></p>
                                                        </div>
                                                        <div id="slide-content-1">
                                                                <h2>Slider Two</h2>
                                                                <p>Lorem Ipsum Dolor</p>
                                                                <p class="sub-text">October 24 2012 - <a href="#">Read more</a></p>
                                                        </div>
                                                        <div id="slide-content-2">
                                                                <h2>Slider Three</h2>
                                                                <p>Lorem Ipsum Dolor</p>
                                                                <p class="sub-text">October 24 2012 - <a href="#">Read more</a></p>
                                                        </div>
                                                        <div id="slide-content-3">
                                                                <h2>Slider Four</h2>
                                                                <p>Lorem Ipsum Dolor</p>
                                                                <p class="sub-text">October 24 2012 - <a href="#">Read more</a></p>
                                                        </div>
                                                        <div id="slide-content-4">
                                                                <h2>Slider Five</h2>
                                                                <p>Lorem Ipsum Dolor</p>
                                                                <p class="sub-text">October 24 2012 - <a href="#">Read more</a></p>
                                                        </div>
                                                        <div id="slide-content-5">
                                                                <h2>Slider Six</h2>
                                                                <p>Lorem Ipsum Dolor</p>
                                                                <p class="sub-text">October 24 2012 - <a href="#">Read more</a></p>
                                                        </div>
                                                </div>
                                        </div>

                                </div>
                        </div> <!--/Slider-->

                        <div class="row hidden-phone" id="slider-thumbs">
                                <div class="span12">
                                        <!-- Bottom switcher of slider -->
                                        <ul class="thumbnails">
                                                <li class="span2">
                                                        <a class="thumbnail" id="carousel-selector-0">
                                                          <asp:Image ID="Image1" runat="server" ImageUrl="~/img/man-with-laptop2.jpg" Height="86px" />
                                                        </a>
                                                </li>
                                                <li class="span2">
                                                        <a class="thumbnail" id="carousel-selector-1">
                                                                <asp:Image ID="Image2" runat="server" ImageUrl="~/img/students-around-laptop.jpg" Height="86px" />
                                                        </a>
                                                </li>
                                                <li class="span2">
                                                        <a class="thumbnail" id="carousel-selector-2">
                                                                <asp:Image ID="Image3" runat="server" ImageUrl="~/img/for-students.jpg" Height="86px" />
                                                        </a>
                                                </li>
                                                <li class="span2">
                                                        <a class="thumbnail" id="carousel-selector-3">
                                                                <asp:Image ID="Image4" runat="server" ImageUrl="~/img/155124579.jpg" Height="86px" />
                                                        </a>
                                                </li>
                                                <li class="span2">
                                                        <a class="thumbnail" id="carousel-selector-4">
                                                                <asp:Image ID="Image5" runat="server" ImageUrl="~/img/college-professor.jpg" Height="86px" />
                                                        </a>
                                                </li>
                                                <li class="span2">
                                                        <a class="thumbnail" id="carousel-selector-5">
                                                                <asp:Image ID="Image6" runat="server" ImageUrl="~/img/Latino student group.jpg" Height="86px" />
                                                        </a>
                                                </li>
                                        </ul>
                                </div>
                        </div>
</div>
<script>
  jQuery(document).ready(function ($) {

    $('#myCarousel').carousel({
      interval: 5000
    });

    $('#carousel-text').html($('#slide-content-0').html());

    //Handles the carousel thumbnails
    $('[id^=carousel-selector-]').click(function () {
      var id_selector = $(this).attr("id");
      var id = id_selector.substr(id_selector.length - 1);
      var id = parseInt(id);
      $('#myCarousel').carousel(id);
    });


    // When the carousel slides, auto update the text
    $('#myCarousel').on('slid', function (e) {
      var id = $('.item.active').data('slide-number');
      $('#carousel-text').html($('#slide-content-' + id).html());
    });


  });
</script>
            <!-- Carousel End -->
            <div class="Image-Footer"><p style="font-size:30px;">Education made organised.</p></div>
          </div>
          <div class="span4 offset1">
              <asp:Login ID="Login1" runat="server" BackColor="White" CssClass="Home-Login2" DisplayRememberMe="False" Height="200px" TextLayout="TextOnTop">
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
