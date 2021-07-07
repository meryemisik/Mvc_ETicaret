namespace ProjeYonetimiOdev.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Markalar")]
    public partial class Markalar
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Markalar()
        {
            Urun = new HashSet<Urun>();
        }

        public int ID { get; set; }

        [StringLength(50)]
        public string Adi { get; set; }

        public string Aciklama { get; set; }

        public int? ResimID { get; set; }

        public virtual Resim Resim { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Urun> Urun { get; set; }
    }
}
