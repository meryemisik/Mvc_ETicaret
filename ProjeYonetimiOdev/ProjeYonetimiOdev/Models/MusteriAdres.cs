namespace ProjeYonetimiOdev.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class MusteriAdres
    {
        public int ID { get; set; }

        public Guid? MusteriID { get; set; }

        public string Adres { get; set; }

        [StringLength(50)]
        public string Adi { get; set; }

        public virtual Musteri Musteri { get; set; }
    }
}
