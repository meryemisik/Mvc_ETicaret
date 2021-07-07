using ProjeYonetimiOdev.App_Class;
using ProjeYonetimiOdev.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Linq;
namespace ProjeYonetimiOdev.Controllers
{
    public class HomeController : Controller
    {        
        public ActionResult Index()
        {
            return View();
        }
        public PartialViewResult Sepet()
        {
            var data = App_Class.Context.Baglanti.Satis.Where(x => x.SepetteMi == true).ToList();
            return PartialView();
        }
        public void SepeteEkle(int Id)
        {
            SepetItem si = new SepetItem();
            Urun u = Context.Baglanti.Urun.FirstOrDefault(x => x.ID == Id);
            si.Urun = u;
            si.Adet = 1;
            Sepet s = new Sepet();
            s.SepeteEkle(si);

            MiniSepetWidget();
        }
        public PartialViewResult KategoriList()
        {
            var data = Context.Baglanti.Kategoriler.ToList();
            return PartialView(data);
        }
        public PartialViewResult Slider()
        {
            var data = App_Class.Context.Baglanti.Resim.Where(x => x.BuyukYol.Contains("Slider")).ToList();
            return PartialView(data);
        }
        public PartialViewResult YeniUrunler()
        {
            var data = App_Class.Context.Baglanti.Urun.ToList();
            return PartialView(data);
        }
        public PartialViewResult Servisler()
        {
            return PartialView();
        }       
        public PartialViewResult Markalar()
        {           
            return PartialView(App_Class.Context.Baglanti.Markalar.ToList());
        }
        public PartialViewResult MiniSepetWidget()
        {
            if (HttpContext.Session["AktifSepet"] != null)
            {
                return PartialView((Sepet)HttpContext.Session["AktifSepet"]);
            }
            else
            {
                return PartialView();
            }
        }
        public void SepetUrunAdetDusur(int id)
        {
            if (HttpContext.Session["AktifSepet"] != null)
            {
                Sepet s = (Sepet)HttpContext.Session["AktifSepet"];
                if (s.Urunler.FirstOrDefault(x => x.Urun.ID == id).Adet > 1)
                {
                    s.Urunler.FirstOrDefault(x => x.Urun.ID == id).Adet--;
                }
                else
                {
                    SepetItem si = s.Urunler.FirstOrDefault(x => x.Urun.ID == id);
                    s.Urunler.Remove(si);
                }

            }

            MiniSepetWidget();
        }

        public ActionResult UrunDetay(string id)
        {
            Urun u = Context.Baglanti.Urun.FirstOrDefault(x => x.Adi == id);
            List<UrunDetay> uos = Context.Baglanti.UrunDetay.Where(x => x.UrunID == u.ID).ToList();
            Dictionary<string, List<OzellikDetay>> ozellik = new Dictionary<string, List<OzellikDetay>>();            
            List<OzellikDetay> degers = new List<OzellikDetay>();
            foreach (UrunDetay item in uos)
            {
                Ozellikler o = Context.Baglanti.Ozellikler.FirstOrDefault(x => x.ID == item.OzelliklerID);
                foreach (UrunDetay uo in uos)
                {
                    Ozellikler ot = Context.Baglanti.Ozellikler.FirstOrDefault(x => x.ID == uo.OzelliklerID);

                    bool kontrol = false;
                    foreach (var oz in ozellik)
                    {
                        if (oz.Key != ot.Adi)
                        {
                            kontrol = true;
                        }
                        else
                        {
                            kontrol = false;
                        }
                        if (kontrol)
                            degers = new List<OzellikDetay>();
                    }                    
                    foreach (OzellikDetay deger  in ot.OzellikDetay)
                    {
                        OzellikDetay od = Context.Baglanti.OzellikDetay.FirstOrDefault(x => x.OzellikID == ot.ID && x.ID == uo.OzellikDetayID);
                        if (!degers.Any(x => x.ID == od.ID))                            
                            degers.Add(od);                           
                    }
                    if (ozellik.Any(x => x.Key == ot.Adi))
                    {
                        ozellik[ot.Adi] = degers;
                    }
                    else
                    {
                        ozellik.Add(ot.Adi, degers);
                    }                   
                }
            }
            ViewBag.Ozellikler = ozellik;
            return View(u);
        }
    }
}