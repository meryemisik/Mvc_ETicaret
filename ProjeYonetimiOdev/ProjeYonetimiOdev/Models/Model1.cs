using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace ProjeYonetimiOdev.Models
{
    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Model1")
        {
        }

        public virtual DbSet<aspnet_Roles> aspnet_Roles { get; set; }
        public virtual DbSet<aspnet_Users> aspnet_Users { get; set; }
        public virtual DbSet<Kargo> Kargo { get; set; }
        public virtual DbSet<Kategoriler> Kategoriler { get; set; }
        public virtual DbSet<Markalar> Markalar { get; set; }
        public virtual DbSet<Musteri> Musteri { get; set; }
        public virtual DbSet<MusteriAdres> MusteriAdres { get; set; }
        public virtual DbSet<OzellikDetay> OzellikDetay { get; set; }
        public virtual DbSet<Ozellikler> Ozellikler { get; set; }
        public virtual DbSet<Resim> Resim { get; set; }
        public virtual DbSet<Satis> Satis { get; set; }
        public virtual DbSet<SatisDetay> SatisDetay { get; set; }
        public virtual DbSet<SiparisDurum> SiparisDurum { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Urun> Urun { get; set; }
        public virtual DbSet<UrunDetay> UrunDetay { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<aspnet_Roles>()
                .HasMany(e => e.aspnet_Users)
                .WithMany(e => e.aspnet_Roles)
                .Map(m => m.ToTable("aspnet_UserInRoles").MapLeftKey("RoleID").MapRightKey("UserID"));

            modelBuilder.Entity<aspnet_Users>()
                .HasOptional(e => e.Musteri)
                .WithRequired(e => e.aspnet_Users);

            modelBuilder.Entity<Kargo>()
                .Property(e => e.Telefon)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Kategoriler>()
                .HasMany(e => e.Ozellikler)
                .WithRequired(e => e.Kategoriler)
                .HasForeignKey(e => e.KategoriID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Kategoriler>()
                .HasMany(e => e.Urun)
                .WithOptional(e => e.Kategoriler)
                .HasForeignKey(e => e.KategoriID);

            modelBuilder.Entity<Markalar>()
                .HasMany(e => e.Urun)
                .WithOptional(e => e.Markalar)
                .HasForeignKey(e => e.MarkaID);

            modelBuilder.Entity<Musteri>()
                .Property(e => e.Cinsiyet)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Musteri>()
                .Property(e => e.Telefon)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<OzellikDetay>()
                .Property(e => e.Adi)
                .IsFixedLength();

            modelBuilder.Entity<OzellikDetay>()
                .Property(e => e.Aciklama)
                .IsFixedLength();

            modelBuilder.Entity<OzellikDetay>()
                .HasMany(e => e.UrunDetay)
                .WithRequired(e => e.OzellikDetay)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Ozellikler>()
                .HasMany(e => e.OzellikDetay)
                .WithRequired(e => e.Ozellikler)
                .HasForeignKey(e => e.OzellikID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Ozellikler>()
                .HasMany(e => e.UrunDetay)
                .WithRequired(e => e.Ozellikler)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Satis>()
                .Property(e => e.ToplamTutar)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Satis>()
                .HasMany(e => e.SatisDetay)
                .WithRequired(e => e.Satis)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SatisDetay>()
                .Property(e => e.Fiyat)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Urun>()
                .Property(e => e.AlisFiyati)
                 .HasPrecision(19, 4);



            modelBuilder.Entity<Urun>()
                .Property(e => e.SatisFiyati)
                 .HasPrecision(19, 4);


            modelBuilder.Entity<Urun>()
                .HasMany(e => e.SatisDetay)
                .WithRequired(e => e.Urun)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Urun>()
                .HasMany(e => e.UrunDetay)
                .WithRequired(e => e.Urun)
                .WillCascadeOnDelete(false);
        }
    }
}
