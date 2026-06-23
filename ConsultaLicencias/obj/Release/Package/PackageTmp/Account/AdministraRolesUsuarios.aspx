<%@ Page Title="Admon. de usuarios y roles" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdministraRolesUsuarios.aspx.cs" Inherits="ConsultaLicencias.Account.AdministraRolesUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <%--    <asp:LoginView ID="LoginView1" runat="server">
            <RoleGroups>
            <asp:RoleGroup Roles="Administrador del Sistema">
                <ContentTemplate>--%>
                    
                    <p align="center">
                        <asp:Label ID="ActionStatus" runat="server" CssClass="Important"></asp:Label>
                    </p>

                    <!-- HeaderCssClass="accordionHeader" -->

                    <h3>Agregar Rol</h3>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar Rol" />
                    <br />
                    <br />

                    <ajaxToolkit:Accordion ID="Accordion1" runat="server"
                        HeaderSelectedCssClass="accordionHeaderSelected" AutoSize="None" FadeTransitions="true"
                        TransitionDuration="250" FramesPerSecond="40" RequireOpenedPane="false" SuppressHeaderPostbacks="true"
                        SelectedIndex="-1" Visible="false">
                        <Panes>
                            <ajaxToolkit:AccordionPane ID="AccordionPane1" runat="server" HeaderCssClass="accordionHeader"
                                HeaderSelectedCssClass="accordionHeaderSelected">
                                <Header>
                        Administrar por Usuarios</Header>
                                <Content>
                                </Content>
                            </ajaxToolkit:AccordionPane>
                            <ajaxToolkit:AccordionPane ID="AccordionPane2" runat="server" HeaderCssClass="accordionHeader"
                                HeaderSelectedCssClass="accordionHeaderSelected">
                                <Header>
                        Administrar por Roles</Header>
                                <Content>
                                </Content>
                            </ajaxToolkit:AccordionPane>
                        </Panes>
                    </ajaxToolkit:Accordion>
                    <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
                        <ajaxToolkit:TabPanel runat="server" HeaderText="Usuarios" ID="TabPanel1">
                            <ContentTemplate>
                                <p>
                                    <b>Seleccione el Usuario :</b>
                                    <asp:DropDownList ID="UserList" runat="server" AutoPostBack="True" DataTextField="UserName"
                                        DataValueField="UserName" OnSelectedIndexChanged="UserList_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </p>
                                <p>
                                    <asp:Repeater ID="UsersRoleList" runat="server">
                                        <ItemTemplate>
                                            <asp:CheckBox runat="server" ID="RoleCheckBox" AutoPostBack="true" Text='<%# Container.DataItem %>'
                                                OnCheckedChanged="RoleCheckBox_CheckChanged" />
                                            <br />
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </p>
                            </ContentTemplate>

                        </ajaxToolkit:TabPanel>
                        <ajaxToolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="Roles">
                            <ContentTemplate>
                                <p>
                                    <b>Seleccione un Rol:</b>
                                    <asp:DropDownList ID="RoleList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RoleList_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </p>
                                <p>
                                    <asp:GridView ID="RolesUserList" runat="server" AutoGenerateColumns="False" EmptyDataText="No users belong to this role."
                                        OnRowDeleting="RolesUserList_RowDeleting">
                                        <Columns>
                                            <asp:CommandField DeleteText="Quitar" ShowDeleteButton="True" />
                                            <asp:TemplateField HeaderText="Usuarios">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="UserNameLabel" Text='<%# Container.DataItem %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </p>
                                <p>
                                    <b>Buscar Usuario:</b>
                                    <asp:TextBox ID="UserNameToAddToRole" runat="server"></asp:TextBox>
                                    <br />
                                    <asp:Button ID="AddUserToRoleButton" runat="server" Text="Agregar al rol" OnClick="AddUserToRoleButton_Click"
                                        CssClass="boton" />
                                </p>
                            </ContentTemplate>
                        </ajaxToolkit:TabPanel>
                    </ajaxToolkit:TabContainer>

              <%--  </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>--%>

</asp:Content>
