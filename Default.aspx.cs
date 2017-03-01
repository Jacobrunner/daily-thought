using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{   
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
     

       bool  item1 = CheckBox1.Checked;
       bool  item2 = CheckBox2.Checked;
       bool  item3 = CheckBox3.Checked;
       bool  item4 = CheckBox4.Checked;
       bool  item5 = CheckBox5.Checked;
        if (item1 == true )
            {
            Justice.Visible = true;


        }
        else { Justice.Visible = false; }

        if (item2 == true)
        {
            fire.Visible = true;
        }
        else { fire.Visible = false; }

        if (item3 == true)
        {
            Primal.Visible = true;
        }
        else { Primal.Visible = false; }

        if (item4 == true)
        {
            shadow.Visible = true;
        }
        else { shadow.Visible = false; }

        if (item5 == true)
        {
            time.Visible = true;
        }
        else { time.Visible = false; }

        if(item1==true || item2==true ||item3==true || item4 == true|| item5 == true)
        {
            NumSS.Visible = true;
            Calc.Visible = true;
        }
        else { Calc.Visible = false; }


    }

    protected void Calc_Click(object sender, EventArgs e)
    {
        double J;
        double F;
        double P;
        double T;
        double S;
        double Sigils;

        if (Double.TryParse(Justice.Text, out J))
        {
            if (Double.TryParse(fire.Text, out F))
            {
                if (Double.TryParse(Primal.Text, out P))
                {
                    if (Double.TryParse(time.Text, out T))
                    {
                        if (Double.TryParse(shadow.Text, out S))
                        {
                            if (Double.TryParse(NumSS.Text, out Sigils))
                            {
                                double combined = (J + F + P + T + S);
                               
                                JusticeS.Text =((J/combined)*Sigils) .ToString();
                                FireS.Text = ((F / combined) * Sigils).ToString();
                                PrimalS.Text = ((P / combined) * Sigils).ToString();
                                TimeS.Text = ((T / combined) * Sigils).ToString();
                                ShadowS.Text = ((S / combined) * Sigils).ToString();
                                errorj.Text = "";
                                errorf.Text = "";
                                errorp.Text = "";
                                errort.Text = "";
                                errors.Text = "";
                                errorsigil.Text = "";

                            }
                            else { errorj.Text = "Re-enter a number or zero for justice textbox"; }
                        }
                        else { errorf.Text = "Re-enter a number or zero for fire textbox"; }
                    }
                    else { errorp.Text = "Re-enter a number or zero for primal textbox"; }
                }
                else { errors.Text = "Re-enter a number or zero for time textbox"; }
            }
            else { errort.Text = "Re-enter a number or zero for shadow textbox"; }
        }
        else { errorsigil.Text = "Re-enter a number or zero the number of land slots available"; }

    }
}