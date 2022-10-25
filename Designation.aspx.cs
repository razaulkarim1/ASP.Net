using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASP.NET_Project.Models;

namespace ASP.NET_Project
{
    public partial class Services : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            FileUpload fu = FormView1.FindControl("fuPicture") as FileUpload;
            if (fu.HasFile)
            {
                string fileName = Guid.NewGuid() + Path.GetExtension(fu.FileName);
                fu.PostedFile.SaveAs(Server.MapPath("~/Images/") + fileName);
                e.Values["sellPicture"] = fileName;
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length > 4)
                args.IsValid = true;
            else
                args.IsValid = false;
        }

        //public void FormView1_InsertItem()
        //{

        //}

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        //public IQueryable<Designation> FormView1_GetItem(int? id)
        //{
        //    if (id.HasValue) 
        //    return
        //}
    }
}