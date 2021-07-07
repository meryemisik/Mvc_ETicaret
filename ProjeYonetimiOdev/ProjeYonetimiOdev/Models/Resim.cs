namespace ProjeYonetimiOdev.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Resim")]
    public partial class Resim
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Resim()
        {
            Kategoriler = new HashSet<Kategoriler>();
            Markalar = new HashSet<Markalar>();
        }

        public int ID { get; set; }

        [StringLength(250)]
        public string BuyukYol { get; set; }

        [StringLength(250)]
        public string OrtaYol { get; set; }

        [StringLength(250)]
        public string KucukYol { get; set; }

        public bool? Varsayilan { get; set; }

        public byte? SiraNo { get; set; }

        public int? UrunID { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Kategoriler> Kategoriler { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Markalar> Markalar { get; set; }

        public virtual Urun Urun { get; set; }
    }
}
