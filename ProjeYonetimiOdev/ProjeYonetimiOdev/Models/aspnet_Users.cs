namespace ProjeYonetimiOdev.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class aspnet_Users
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public aspnet_Users()
        {
            aspnet_Roles = new HashSet<aspnet_Roles>();
        }

        public int? ApplicationID { get; set; }

        [Key]
        public Guid UserID { get; set; }

        [StringLength(50)]
        public string UserName { get; set; }

        [StringLength(50)]
        public string LoweredRoleName { get; set; }

        [StringLength(50)]
        public string MobileAlias { get; set; }

        [StringLength(50)]
        public string IsAnonymous { get; set; }

        [StringLength(50)]
        public string LastActivityDate { get; set; }

        public virtual Musteri Musteri { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<aspnet_Roles> aspnet_Roles { get; set; }
    }
}
