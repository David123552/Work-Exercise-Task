<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="MyWebApp.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<asp:TextBox ID="postcodebox" runat="server"></asp:TextBox>
<asp:Button ID="postcodebutton" runat="server" onclick="postcodebutton_Click" Text="Submit"></asp:Button>
<asp:DropDownList ID="ddlOptions" runat="server"></asp:DropDownList>

<Script language="C#" runat="server">


    async void postcodebutton_Click(Object sender, EventArgs e)
    {
        string inputValue = postcodebox.Text.Trim(); // Get text from the TextBox
        if (!string.IsNullOrEmpty(inputValue))
        {
            
            string apiUrl = "https://api.getAddress.io/autocomplete";

            using (HttpClient client = new HttpClient())
            {
                try
                {
                    // Make a request to the external API
                    HttpResponse response = await client.GetAsync(apiUrl + "?input=" + inputValue);

                    if (response.IsSuccessStatusCode)
                    {
                        // Read the response content
                        string responseData = await response.Content.ReadAsStringAsync();
                     
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
</Script>


</asp:Content>
