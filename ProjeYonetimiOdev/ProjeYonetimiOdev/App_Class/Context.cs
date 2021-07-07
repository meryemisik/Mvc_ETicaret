using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ProjeYonetimiOdev.Models;
namespace ProjeYonetimiOdev.App_Class
{
    public static class Context
    {
        private static Model1 baglan;

        public static Model1 Baglanti
        {
            get 
            {
                if (baglan == null)
                {
                    baglan = new Model1();
                }    
                return baglan; }
            set { baglan = value; }
        }


    }
}