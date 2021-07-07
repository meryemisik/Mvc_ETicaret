using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Drawing;//Size kullanmak için gerekli kütüphane
namespace ProjeYonetimiOdev.App_Class
{
    public class Settings
    {
        public static Size UrunOrtaBoyut
        {
            get
            {
                Size size = new Size();
                size.Width = Convert.ToInt32(ConfigurationManager.AppSettings["UrunOrtaWidth"]);
                size.Height = Convert.ToInt32(ConfigurationManager.AppSettings["UrunOrtaHeight"]);
                return size;
            }
                
            
        }
        public static Size UrunBuyukBoyut
        {
            get
            {
                Size size = new Size();
                size.Width = Convert.ToInt32(ConfigurationManager.AppSettings["UrunBuyukWidth"]);
                size.Height = Convert.ToInt32(ConfigurationManager.AppSettings["UrunBuyukHeight"]);
                return size;
            }


        }
        public static Size SliderBoyut
        {
            get
            {
                Size size = new Size();
                size.Width = Convert.ToInt32(ConfigurationManager.AppSettings["SliderWidth"]);
                size.Height = Convert.ToInt32(ConfigurationManager.AppSettings["SliderHeight"]);
                return size;
            }
        }

    }
}