﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write("Application code executed using : ");
        Response.Write(System.Security.Principal.WindowsIdentity.GetCurrent().Name + "<br />");

        Response.Write("Is User Authenticated : ");
        Response.Write(User.Identity.IsAuthenticated.ToString() + "<br />");

        Response.Write("Authentication Type (if Authenticated) : ");
        Response.Write(User.Identity.AuthenticationType + "<br />");

        Response.Write("User Name (if Authenticated) : ");
        Response.Write(User.Identity.Name + "<br />");
    }
}