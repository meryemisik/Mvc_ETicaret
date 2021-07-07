namespace ProjeYonetimiOdev.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Ozellikler")]
    public partial class Ozellikler
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Ozellikler()
        {
            OzellikDetay = new HashSet<OzellikDetay>();
            UrunDetay = new HashSet<UrunDetay>();
        }

        public int ID { get; set; }

        [Required]
        [StringLength(50)]
        public string Adi { get; set; }

        public string Aciklama { get; set; }

        public int KategoriID { get; set; }

        public virtual Kategoriler Kategoriler { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OzellikDetay> OzellikDetay { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UrunDetay> UrunDetay { get; set; }
    }
}
