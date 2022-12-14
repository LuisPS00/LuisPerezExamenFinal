using ExamenFinalProgra2LuisPérez.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamenFinalProgra2LuisPérez
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BIngresar_Click(object sender, EventArgs e)
        {
            ClsUsuarios.Usuario = Tusuario.Text;
            ClsUsuarios.Clave = Tcontraseña.Text;

            if (ClsUsuarios.Validar(ClsUsuarios.Usuario, ClsUsuarios.Clave) > 0)
            {
               
                    Response.Redirect("Inicio.aspx");
                

            }
            else
            {
                lmensaje.Text = " usuario o contraseña incorrecto";
            }
        }
    }
}