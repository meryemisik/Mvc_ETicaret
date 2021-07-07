namespace ProjeYonetimiOdev.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Urun")]
    public partial class Urun
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Urun()
        {
            Resim = new HashSet<Resim>();
            SatisDetay = new HashSet<SatisDetay>();
            UrunDetay = new HashSet<UrunDetay>();
        }

        public int ID { get; set; }

        [StringLength(50)]
        public string Adi { get; set; }

        public string Aciklama { get; set; }

        
        public decimal? AlisFiyati { get; set; }

        
        public decimal? SatisFiyati { get; set; }

        public Nullable< DateTime> EklenmeTarihi { get; set; }

        public Nullable<int> KategoriID { get; set; }

        public Nullable<int> MarkaID { get; set; }

        public virtual Kategoriler Kategoriler { get; set; }

        public virtual Markalar Markalar { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Resim> Resim { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SatisDetay> SatisDetay { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UrunDetay> UrunDetay { get; set; }
    }
}
