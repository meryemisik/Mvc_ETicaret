using ProjeYonetimiOdev.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjeYonetimiOdev.App_Class
{
    public class Sepet
    {
        public static Sepet AktifSepet
        {
            get
            {
                HttpContext ctx = HttpContext.Current;//sisteme giriş yapan kullanıcının hesabını tutar
                if (ctx.Session["AktifSepet"] == null)//giriş yapan kullanıcının sepeti null ise sepet nesnesini oluştur ve return et eğer kullanıcının sepeti null değilse  return et
                    ctx.Session["AktifSepet"] = new Sepet();
                return (Sepet)ctx.Session["AktifSepet"];

            }
        }

        private List<SepetItem> urunler = new List<SepetItem>();

        public List<SepetItem> Urunler
        {
            get { return urunler; }
            set { urunler = value; }
        }

        public void SepeteEkle(SepetItem sepet)
        {
            if (HttpContext.Current.Session["AktifSepet"] != null)
            {
                Sepet s = (Sepet)HttpContext.Current.Session["AktifSepet"];

                if (s.Urunler.Any(x => x.Urun.ID == sepet.Urun.ID))//any methodu içindeki koşula uyan bir kayıt var mı diye bakar varsa true yoksa false döndürür
                {
                    s.Urunler.FirstOrDefault(x => x.Urun.ID == sepet.Urun.ID).Adet++;
                }
                else
                {
                    s.Urunler.Add(sepet);
                }
            }
            else
            {
                Sepet s = new Sepet();
                s.Urunler.Add(sepet);
                HttpContext.Current.Session["AktifSepet"] = s;
            }
            
        }
        
        public decimal ToplamTutar
        {
            get
            {
                return Urunler.Sum(x => x.Tutar);
            }
        } 
    }
    public class SepetItem
    {
        public Urun Urun { get; set; }
        public int Adet { get; set; }
        public double Indirim { get; set; }
        public decimal Tutar
        {
            get
            {
                return Convert.ToDecimal(Urun.SatisFiyati * Adet *(decimal)(1 - Indirim));
            }
        }
        

    }
}