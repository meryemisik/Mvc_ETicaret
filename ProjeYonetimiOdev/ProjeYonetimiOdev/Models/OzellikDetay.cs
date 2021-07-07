namespace ProjeYonetimiOdev.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("OzellikDetay")]
    public partial class OzellikDetay
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public OzellikDetay()
        {
            UrunDetay = new HashSet<UrunDetay>();
        }

        public int ID { get; set; }

        [Required]
        [StringLength(10)]
        public string Adi { get; set; }

        [StringLength(10)]
        public string Aciklama { get; set; }

        public int OzellikID { get; set; }

        public virtual Ozellikler Ozellikler { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UrunDetay> UrunDetay { get; set; }

        

      
    }
}
