using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Drawing;
using ProjeYonetimiOdev.Models;
using System.IO;
using System.Configuration;
using System.Text;

namespace ProjeYonetimiOdev.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult Anasayfa()
        {
            return View();
        }
        public ActionResult Urunler()
        {
            return View(App_Class.Context.Baglanti.Urun.ToList());
        }
        public ActionResult UrunEkle()
        {
            ViewBag.Kategoriler = App_Class.Context.Baglanti.Kategoriler.ToList();
            ViewBag.Markalar = App_Class.Context.Baglanti.Markalar.ToList();
            return View();
        }
        [HttpPost]
        public ActionResult UrunEkle(Urun urn)
        {
            
            App_Class.Context.Baglanti.Urun.Add(urn);
            App_Class.Context.Baglanti.SaveChanges();
            return RedirectToAction("Urunler");
        }
        public ActionResult UrunResimEkle(int id)
        {
           return View(id);
        }
        [HttpPost]
        public ActionResult UrunResimEkle(int urnId, HttpPostedFileBase fileUpload)
        {
            if (fileUpload != null)
            {
                Image image = Image.FromStream(fileUpload.InputStream);
                Bitmap ortaResim = new Bitmap(image, App_Class.Settings.UrunOrtaBoyut);
                Bitmap buyukResim = new Bitmap(image, App_Class.Settings.UrunBuyukBoyut);

                string ortaYol = "/Content/UrunResim/Orta/" + Guid.NewGuid() + Path.GetExtension(fileUpload.FileName);
                string buyukYol = "/Content/UrunResim/Buyuk/" + Guid.NewGuid() + Path.GetExtension(fileUpload.FileName);

                ortaResim.Save(Server.MapPath(ortaYol));
                buyukResim.Save(Server.MapPath(buyukYol));

                Resim resim = new Resim();
                resim.BuyukYol = buyukYol;
                resim.OrtaYol = ortaYol;
                resim.ID = urnId;
                if (App_Class.Context.Baglanti.Resim.FirstOrDefault(x => x.ID == urnId && x.Varsayilan == false) != null)
                {
                    resim.Varsayilan = true;
                }
                else
                {
                    resim.Varsayilan = false;
                }
                App_Class.Context.Baglanti.Resim.Add(resim);
                App_Class.Context.Baglanti.SaveChanges();
                return View(urnId);
            }
            return View(urnId);
        }
        public ActionResult UrunOzellik()
        {
            return View(App_Class.Context.Baglanti.UrunDetay.ToList());
        }
        public ActionResult UrunOzellikSİl(int urunId, int tipId,int degerId)
        {
            UrunDetay ud = App_Class.Context.Baglanti.UrunDetay.FirstOrDefault(x => x.UrunID == urunId && x.OzelliklerID == urunId && x.OzellikDetayID == urunId);
            App_Class.Context.Baglanti.UrunDetay.Remove(ud);
            App_Class.Context.Baglanti.SaveChanges();
            return RedirectToAction("UrunOzellik");

        }
        public ActionResult UrunOzellikEkle()
        {
            return View(App_Class.Context.Baglanti.Urun.ToList());//urun tablosu listelenir
        }
        //kategorilerin tiplerini listeler
        public PartialViewResult UrunOzellikTipeGore(int? ktgId)//null olabilir
        {
            //seçilen tipe göre veri değiştirme
            if (ktgId!=null)
            {
                return PartialView(App_Class.Context.Baglanti.Ozellikler.Where(x => x.KategoriID == ktgId).ToList());//seçilen Id ktgId ile aynıysa ilgili verileri listeler.

            }
            else
            {
                return PartialView(App_Class.Context.Baglanti.Ozellikler.ToList());//kategoriID null ise tüm verileri listele
            }
        }
        //seçilen özellik tipine göre ozellik değerlerini listeleyecek
        public PartialViewResult UrunOzellikDegereGore(int? ıd)
        {
            if (ıd!=null)
            {
                var data = App_Class.Context.Baglanti.OzellikDetay.Where(x => x.OzellikID == ıd).ToList()
;               return PartialView(data);
            }
            else
            {
                var data = App_Class.Context.Baglanti.OzellikDetay.ToList();
                return PartialView(data);
            }
        }
       
        [HttpPost]
        public ActionResult UrunOzellikEkle(UrunDetay ud)
        {
            App_Class.Context.Baglanti.UrunDetay.Add(ud);
            App_Class.Context.Baglanti.SaveChanges();
            return RedirectToAction("UrunOzellik");
        }
        public ActionResult Markalar()
        {
            return View(App_Class.Context.Baglanti.Markalar.ToList());
        }
        public ActionResult MarkaEkle()
        {
           
            return View();
        }
        [HttpPost]
        public ActionResult MarkaEkle(Markalar mrk, HttpPostedFileBase fileUpload)
        {
            int resimId = -1;
            if (fileUpload != null)
            {
                
                Image img = Image.FromStream(fileUpload.InputStream);
                int width = Convert.ToInt32(ConfigurationManager.AppSettings["MarkaWidth"].ToString());
                int height = Convert.ToInt32(ConfigurationManager.AppSettings["MarkaHeight"].ToString());
                string name = "/Content/MarkaResim/" +Guid.NewGuid() +Path.GetExtension(fileUpload.FileName);//resimin kendi uzantısını almamızı sağlar
                //24 basamaklı eşi benzeri olmayan harf ve rakam karışımı isim oluşturuyor.
                Bitmap bm = new Bitmap(img, width, height);
                bm.Save(Server.MapPath(name));//bu uzantıya resimi kaydet
                Resim rsm = new Resim();
                rsm.OrtaYol = name;
                App_Class.Context.Baglanti.Resim.Add(rsm);
                App_Class.Context.Baglanti.SaveChanges();
                if (rsm.ID != null)
                    resimId = rsm.ID;
            }
            if (resimId !=-1)
            {
                mrk.ResimID = resimId;
            }
            App_Class.Context.Baglanti.Markalar.Add(mrk);
            App_Class.Context.Baglanti.SaveChanges();
            return RedirectToAction("Markalar");

           
        }
   
        public ActionResult Kategoriler()
        {
            return View(App_Class.Context.Baglanti.Kategoriler.ToList());
        }
        public ActionResult KategoriEkle()
        {
        
            return View();
        }
        [HttpPost]
        public ActionResult KategoriEkle(Kategoriler kategori)
        {
            App_Class.Context.Baglanti.Kategoriler.Add(kategori);
            App_Class.Context.Baglanti.SaveChanges();
            return RedirectToAction("Kategoriler");
        }
        public ActionResult OzellikTipleri()
        {
            return View(App_Class.Context.Baglanti.Ozellikler.ToList());
        }
        public ActionResult OzellikTipEkle()
        {
            return View(App_Class.Context.Baglanti.Kategoriler.ToList())
;        }

        [HttpPost]
        public ActionResult OzellikTipEkle(Ozellikler ozellik)
        {
            App_Class.Context.Baglanti.Ozellikler.Add(ozellik);
            App_Class.Context.Baglanti.SaveChanges();
            return RedirectToAction("OzellikTipleri");
        }
        public ActionResult OzellikDeger()
        {
            return View(App_Class.Context.Baglanti.OzellikDetay.ToList());
        }
        public ActionResult OzellikDegerEkle()
        {
            return View(App_Class.Context.Baglanti.Ozellikler.ToList());
        }

        [HttpPost]

        public ActionResult OzellikDegerEkle(OzellikDetay detay)
        {
            App_Class.Context.Baglanti.OzellikDetay.Add(detay);
            App_Class.Context.Baglanti.SaveChanges();
            return RedirectToAction("OzellikDeger");
        }
        public ActionResult SliderResimleri()
        {
            return View();
        }

        [HttpPost]

        public ActionResult SliderResimEkle(HttpPostedFileBase fileUpload)
        {
            if (fileUpload != null)
            {
                Image slider = Image.FromStream(fileUpload.InputStream);
                Bitmap sliderResim = new Bitmap(slider, App_Class.Settings.SliderBoyut);

                string Yol = "/Content/Slider/" + Guid.NewGuid() + Path.GetExtension(fileUpload.FileName);
                
                sliderResim.Save(Server.MapPath(Yol));
                Resim resim = new Resim();
                resim.BuyukYol = Yol;
                App_Class.Context.Baglanti.Resim.Add(resim);
                App_Class.Context.Baglanti.SaveChanges();
            }
            return RedirectToAction("SliderResimleri");
        }

        public ActionResult Siparisler()
        {
            return View();
        }
        public ActionResult Kullanicilar()
        {
            return View();
        }

    }
}