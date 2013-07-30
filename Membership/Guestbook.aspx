<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Guestbook.aspx.cs" Inherits="Membership_Guestbook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h3>Leave a Comment</h3>
<p>
     <b>Subject:</b>
     <asp:RequiredFieldValidator ID="SubjectReqValidator" runat="server"
          ErrorMessage="You must provide a value for Subject"
          ControlToValidate="Subject" ValidationGroup="EnterComment">
     </asp:RequiredFieldValidator><br/>
     <asp:TextBox ID="Subject" Columns="40" runat="server"></asp:TextBox>
</p>
<p>
     <b>Body:</b>
     <asp:RequiredFieldValidator ID="BodyReqValidator" runat="server"
          ControlToValidate="Body"
          ErrorMessage="You must provide a value for Body" ValidationGroup="EnterComment">
     </asp:RequiredFieldValidator><br/>
     <asp:TextBox ID="Body" TextMode="MultiLine" Width="95%"
          Rows="8" runat="server"></asp:TextBox>
</p>
<p>
     <asp:Button ID="PostCommentButton" runat="server" 
          Text="Post Your Comment"
          ValidationGroup="EnterComment" OnClick="PostCommentButton_Click" />
</p>
    <p>
        <asp:ListView ID="CommentList" runat="server" DataSourceID="CommentsDataSource" EnableViewState="False">
            <AlternatingItemTemplate>
                <tr style="background-color: #FAFAD2;color: #284775;">
                    <td>
                        <asp:Label ID="SubjectLabel" runat="server" Text='<%# Eval("Subject") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CommentDateLabel" runat="server" Text='<%# Eval("CommentDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BodyLabel" runat="server" Text='<%# Eval("Body") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HomeTownLabel" runat="server" Text='<%# Eval("HomeTown") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HomePageUrlLabel" runat="server" Text='<%# Eval("HomePageUrl") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SignatureLabel" runat="server" Text='<%# Eval("Signature") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #FFCC66;color: #000080;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CommentDateTextBox" runat="server" Text='<%# Bind("CommentDate") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="BodyTextBox" runat="server" Text='<%# Bind("Body") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="HomeTownTextBox" runat="server" Text='<%# Bind("HomeTown") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="HomePageUrlTextBox" runat="server" Text='<%# Bind("HomePageUrl") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="SignatureTextBox" runat="server" Text='<%# Bind("Signature") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CommentDateTextBox" runat="server" Text='<%# Bind("CommentDate") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="BodyTextBox" runat="server" Text='<%# Bind("Body") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="HomeTownTextBox" runat="server" Text='<%# Bind("HomeTown") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="HomePageUrlTextBox" runat="server" Text='<%# Bind("HomePageUrl") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="SignatureTextBox" runat="server" Text='<%# Bind("Signature") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #FFFBD6;color: #333333;">
                    <td>
                        <asp:Label ID="SubjectLabel" runat="server" Text='<%# Eval("Subject") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CommentDateLabel" runat="server" Text='<%# Eval("CommentDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BodyLabel" runat="server" Text='<%# Eval("Body") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HomeTownLabel" runat="server" Text='<%# Eval("HomeTown") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HomePageUrlLabel" runat="server" Text='<%# Eval("HomePageUrl") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SignatureLabel" runat="server" Text='<%# Eval("Signature") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                                    <th runat="server">Subject</th>
                                    <th runat="server">CommentDate</th>
                                    <th runat="server">Body</th>
                                    <th runat="server">HomeTown</th>
                                    <th runat="server">HomePageUrl</th>
                                    <th runat="server">Signature</th>
                                    <th runat="server">UserName</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                    <td>
                        <asp:Label ID="SubjectLabel" runat="server" Text='<%# Eval("Subject") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CommentDateLabel" runat="server" Text='<%# Eval("CommentDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BodyLabel" runat="server" Text='<%# Eval("Body") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HomeTownLabel" runat="server" Text='<%# Eval("HomeTown") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HomePageUrlLabel" runat="server" Text='<%# Eval("HomePageUrl") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SignatureLabel" runat="server" Text='<%# Eval("Signature") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="CommentsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="SELECT GuestbookComments.Subject, GuestbookComments.CommentDate, GuestbookComments.Body, UserProfiles.HomeTown, UserProfiles.HomePageUrl, UserProfiles.Signature, aspnet_Users.UserName FROM aspnet_Users INNER JOIN GuestbookComments ON aspnet_Users.UserId = GuestbookComments.UserId INNER JOIN UserProfiles ON aspnet_Users.UserId = UserProfiles.UserId ORDER BY GuestbookComments.CommentDate DESC"></asp:SqlDataSource>
</p>
</asp:Content>

