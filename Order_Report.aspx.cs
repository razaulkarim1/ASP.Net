using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.NET_Project
{
    public partial class Order_Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=ElectricsDB;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("SELECT o.orderId,o.orderName,b.buyerName,s.serviceName,sl.sellerName,o.price,s.servicePicture FROM MakeOrder o INNER JOIN Buyer b ON o.buyerId=b.buyerId INNER JOIN Services s ON o.serviceId=s.id INNER JOIN Seller sl ON o.sellerId=sl.sellerId",con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            ReportDocument cryRpt = new ReportDocument();
            cryRpt.Load(Server.MapPath("rptOrderReport.rpt"));
            cryRpt.SetDataSource(ds.Tables["CrystalReportViewer1"]);
            CrystalReportViewer1.ReportSource = cryRpt;
            cryRpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "Order Information");
        }
    }
}