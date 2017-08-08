using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace DevEx
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            BindData();
            gvData.StartEdit(1);
        }

        protected void BindData()
        {
            var list = new List<Product>
            {
                new Product {Id = 1, Brand = "Apple", Model = "Iphone 6s", Price = 550},
                new Product {Id = 2, Brand = "Apple", Model = "Iphone 5s", Price = 650},
                new Product {Id = 3, Brand = "Apple", Model = "Iphone 7s", Price = 550}
            };

            gvData.DataSource = list;
            gvData.DataBind();
        }

        protected void OnCallback(object sender, CallbackEventArgsBase e)
        {
            if (e.Parameter.Equals("btn"))
            {

            }
            else if (e.Parameter.Equals("btn2"))
            {
                var list = new List<Product>
                {
                    new Product {Id = 1, Brand = "Apple", Model = "Iphone 6s", Price = 550},
                    new Product {Id = 2, Brand = "Apple", Model = "Iphone 5s", Price = 650},
                    new Product {Id = 3, Brand = "Apple", Model = "Iphone 7s", Price = 550}
                };

                var grid = cbPanel.FindControl("gvData") as ASPxGridView;


                var myPanel = grid.FindEditFormTemplateControl("myPanel") as ASPxCallbackPanel;
                var cb = myPanel.FindControl("cb") as ASPxComboBox;
                var gvEditData = myPanel.FindControl("gvEditData") as ASPxGridView;

                cb.TextField = "Model";
                cb.ValueField = "Id";
                cb.DataSource = list;
                cb.DataBind();

                gvEditData.DataSource = list;
                gvEditData.DataBind();
            }
        }
    }

    public class Product
    {
        public int Id { get; set; }
        public string Brand { get; set; }
        public string Model { get; set; }
        public double Price { get; set; }
    }
}