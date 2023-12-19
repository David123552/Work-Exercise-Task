using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyWebApp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void postcodebutton_Click(object sender, EventArgs e)
        {
            string inputValue = postcodebox.Text.Trim(); // Get text from the TextBox
            
            if (!string.IsNullOrEmpty(inputValue))
            {

                string apiUrl = $"https://api.getAddress.io/autocomplete/{inputValue}?api-key=HM26jrnc706LzgCJdibTtw41275";

                using (HttpClient client = new HttpClient())
                {
                    try
                    {
                        // Make a request to the external API
                        HttpResponseMessage response = client.GetAsync(apiUrl + "&input=" + inputValue).Result;

                        if (response.IsSuccessStatusCode)
                        {
                            // Read the response content
                            string responseData = response.Content.ReadAsStringAsync().Result;

                            //Processes the response data. I know that it isnt comma-seperated, it is just a placeholder.
                            string[] options = responseData.Split(',');

                            // Populate the DropDownList with the received options
                            ddlOptions.Items.Clear();
                            foreach (string option in options)
                            {
                                ddlOptions.Items.Add(option);
                            }
                        }
                        else
                        {
                            //Error Handling. If it fails, itll just say that it fails
                            ddlOptions.Items.Clear();
                            ddlOptions.Items.Add("API request failed");
                        }
                    }
                    catch (Exception ex)
                    {
                        //Supposedly handles exceptions such as network errors, timeouts, etc.
                        ddlOptions.Items.Clear();
                        ddlOptions.Items.Add("Error: " + ex.Message);
                    }
                }
            }
            else
            {
                // Handle the case where the TextBox is empty
                ddlOptions.Items.Clear();
                ddlOptions.Items.Add("Please enter a value");
            }

        }

    }
}