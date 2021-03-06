USE [ETicaret]
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 7.07.2021 14:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationID] [int] NULL,
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[LoweredRoleName] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_aspnet_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_UserInRoles]    Script Date: 7.07.2021 14:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UserInRoles](
	[UserID] [uniqueidentifier] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_aspnet_UserInRoles] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 7.07.2021 14:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationID] [int] NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[LoweredRoleName] [nvarchar](50) NULL,
	[MobileAlias] [nvarchar](50) NULL,
	[IsAnonymous] [nvarchar](50) NULL,
	[LastActivityDate] [nvarchar](50) NULL,
 CONSTRAINT [PK_aspnet_Users_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kargo]    Script Date: 7.07.2021 14:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kargo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SirketID] [int] NOT NULL,
	[Adres] [nvarchar](max) NULL,
	[Telefon] [char](15) NULL,
	[WebSite] [nvarchar](150) NULL,
	[EMail] [nvarchar](50) NULL,
 CONSTRAINT [PK_Kargo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 7.07.2021 14:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](max) NULL,
	[ResimID] [int] NULL,
 CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Markalar]    Script Date: 7.07.2021 14:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Markalar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NULL,
	[Aciklama] [nvarchar](max) NULL,
	[ResimID] [int] NULL,
 CONSTRAINT [PK_Markalar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Musteri]    Script Date: 7.07.2021 14:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Musteri](
	[ID] [uniqueidentifier] NOT NULL,
	[Adi] [nvarchar](50) NULL,
	[Soyadi] [nvarchar](50) NULL,
	[KullaniciAdi] [nvarchar](50) NULL,
	[Cinsiyet] [char](5) NULL,
	[Email] [nvarchar](50) NULL,
	[Telefon] [nvarchar](25) NULL,
 CONSTRAINT [PK_Musteri] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MusteriAdres]    Script Date: 7.07.2021 14:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MusteriAdres](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MusteriID] [uniqueidentifier] NULL,
	[Adres] [nvarchar](max) NULL,
	[Adi] [nvarchar](50) NULL,
 CONSTRAINT [PK_MusteriAdres] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OzellikDetay]    Script Date: 7.07.2021 14:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OzellikDetay](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](max) NULL,
	[OzellikID] [int] NOT NULL,
 CONSTRAINT [PK_OzellikDetay] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ozellikler]    Script Date: 7.07.2021 14:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ozellikler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](max) NULL,
	[KategoriID] [int] NOT NULL,
 CONSTRAINT [PK_Ozellikler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resim]    Script Date: 7.07.2021 14:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resim](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BuyukYol] [nvarchar](250) NULL,
	[OrtaYol] [nvarchar](250) NULL,
	[KucukYol] [nvarchar](250) NULL,
	[Varsayilan] [bit] NULL,
	[SiraNo] [tinyint] NULL,
	[UrunID] [int] NULL,
 CONSTRAINT [PK_Resim] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Satis]    Script Date: 7.07.2021 14:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satis](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MusteriID] [uniqueidentifier] NULL,
	[SatisTarihi] [datetime] NOT NULL,
	[ToplamTutar] [money] NOT NULL,
	[SepetteMi] [bit] NOT NULL,
	[KargoID] [int] NULL,
	[SiparisDurumID] [int] NULL,
	[KargoTakipNo] [nvarchar](20) NULL,
 CONSTRAINT [PK_Satis] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SatisDetay]    Script Date: 7.07.2021 14:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SatisDetay](
	[SatisID] [int] NOT NULL,
	[UrunID] [int] NOT NULL,
	[Adet] [int] NULL,
	[Fiyat] [money] NULL,
	[Indirim] [float] NULL,
 CONSTRAINT [PK_SatisDetay] PRIMARY KEY CLUSTERED 
(
	[SatisID] ASC,
	[UrunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SiparisDurum]    Script Date: 7.07.2021 14:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiparisDurum](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NULL,
	[Aciklama] [nvarchar](max) NULL,
 CONSTRAINT [PK_SiparisDurum] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Urun]    Script Date: 7.07.2021 14:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urun](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](max) NULL,
	[AlisFiyati] [decimal](10, 2) NULL,
	[SatisFiyati] [decimal](10, 2) NULL,
	[EklenmeTarihi] [date] NULL CONSTRAINT [DF_Urun_EklenmeTarihi]  DEFAULT (getdate()),
	[KategoriID] [int] NULL,
	[MarkaID] [int] NULL,
 CONSTRAINT [PK_Urun] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UrunDetay]    Script Date: 7.07.2021 14:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrunDetay](
	[UrunID] [int] NOT NULL,
	[OzelliklerID] [int] NOT NULL,
	[OzellikDetayID] [int] NOT NULL,
 CONSTRAINT [PK_UrunDetay] PRIMARY KEY CLUSTERED 
(
	[UrunID] ASC,
	[OzelliklerID] ASC,
	[OzellikDetayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Kategoriler] ON 

INSERT [dbo].[Kategoriler] ([ID], [Adi], [Aciklama], [ResimID]) VALUES (1, N'Bilgisayar', N'Açıklama yapılacak', NULL)
INSERT [dbo].[Kategoriler] ([ID], [Adi], [Aciklama], [ResimID]) VALUES (3, N'Telefon', N'iletişim', NULL)
INSERT [dbo].[Kategoriler] ([ID], [Adi], [Aciklama], [ResimID]) VALUES (4, N'Televizyon', N'süper hd kalite', NULL)
INSERT [dbo].[Kategoriler] ([ID], [Adi], [Aciklama], [ResimID]) VALUES (5, N'Kamera', N'açıklama yapılacak', NULL)
SET IDENTITY_INSERT [dbo].[Kategoriler] OFF
SET IDENTITY_INSERT [dbo].[Markalar] ON 

INSERT [dbo].[Markalar] ([ID], [Adi], [Aciklama], [ResimID]) VALUES (14, N'iPhone', N'iPhone, dünyanın en güçlü kişisel aygıtı', 20)
INSERT [dbo].[Markalar] ([ID], [Adi], [Aciklama], [ResimID]) VALUES (15, N'Samsung', N'Açıklama yapılacak', 22)
INSERT [dbo].[Markalar] ([ID], [Adi], [Aciklama], [ResimID]) VALUES (16, N'Huawei', N'Son teknoloji telefonlar, tabletler, dizüstü bilgisayarlar ve daha fazlası ', 28)
INSERT [dbo].[Markalar] ([ID], [Adi], [Aciklama], [ResimID]) VALUES (18, N'Xiaomi', N'Xiaomi modelleri uygun fiyat ve taksit fırsatlarıyla Aldın Aldın''da.', 30)
SET IDENTITY_INSERT [dbo].[Markalar] OFF
SET IDENTITY_INSERT [dbo].[OzellikDetay] ON 

INSERT [dbo].[OzellikDetay] ([ID], [Adi], [Aciklama], [OzellikID]) VALUES (19, N'4 GB      ', N'normal    ', 1)
INSERT [dbo].[OzellikDetay] ([ID], [Adi], [Aciklama], [OzellikID]) VALUES (20, N'8 GB      ', N'orta      ', 1)
INSERT [dbo].[OzellikDetay] ([ID], [Adi], [Aciklama], [OzellikID]) VALUES (22, N'16 GB     ', N'açiklama  ', 1)
INSERT [dbo].[OzellikDetay] ([ID], [Adi], [Aciklama], [OzellikID]) VALUES (29, N'i3        ', N'düşük seviye', 2)
INSERT [dbo].[OzellikDetay] ([ID], [Adi], [Aciklama], [OzellikID]) VALUES (30, N'i5', N'orta seviye', 2)
INSERT [dbo].[OzellikDetay] ([ID], [Adi], [Aciklama], [OzellikID]) VALUES (31, N'i7', N'orta üstü seviye', 2)
INSERT [dbo].[OzellikDetay] ([ID], [Adi], [Aciklama], [OzellikID]) VALUES (32, N'deneme', N'deneme', 3)
INSERT [dbo].[OzellikDetay] ([ID], [Adi], [Aciklama], [OzellikID]) VALUES (33, N'13MP      ', N'açıklama  ', 4)
INSERT [dbo].[OzellikDetay] ([ID], [Adi], [Aciklama], [OzellikID]) VALUES (34, N'64GB      ', N'yapılacak ', 7)
SET IDENTITY_INSERT [dbo].[OzellikDetay] OFF
SET IDENTITY_INSERT [dbo].[Ozellikler] ON 

INSERT [dbo].[Ozellikler] ([ID], [Adi], [Aciklama], [KategoriID]) VALUES (1, N'ram', N'geçici bellek', 1)
INSERT [dbo].[Ozellikler] ([ID], [Adi], [Aciklama], [KategoriID]) VALUES (2, N'işlemci', N'işler', 1)
INSERT [dbo].[Ozellikler] ([ID], [Adi], [Aciklama], [KategoriID]) VALUES (3, N'anakart', N'açıklama', 1)
INSERT [dbo].[Ozellikler] ([ID], [Adi], [Aciklama], [KategoriID]) VALUES (4, N'Kamera', N'px', 3)
INSERT [dbo].[Ozellikler] ([ID], [Adi], [Aciklama], [KategoriID]) VALUES (5, N'Ekran', N'110 ekran', 4)
INSERT [dbo].[Ozellikler] ([ID], [Adi], [Aciklama], [KategoriID]) VALUES (6, N'64gb', N'hafıza', 3)
INSERT [dbo].[Ozellikler] ([ID], [Adi], [Aciklama], [KategoriID]) VALUES (7, N'Hafıza', N'Depolama', 3)
SET IDENTITY_INSERT [dbo].[Ozellikler] OFF
SET IDENTITY_INSERT [dbo].[Resim] ON 

INSERT [dbo].[Resim] ([ID], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (20, NULL, N'/Content/MarkaResim/44bbb86b-0c5e-49ab-b7af-bd461d463250.png', NULL, NULL, NULL, NULL)
INSERT [dbo].[Resim] ([ID], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (22, NULL, N'/Content/MarkaResim/75343c23-6813-451b-a6f8-232bf80c0e8c.png', NULL, NULL, NULL, NULL)
INSERT [dbo].[Resim] ([ID], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (24, NULL, N'/resimler/apple.png', NULL, 0, NULL, NULL)
INSERT [dbo].[Resim] ([ID], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (25, N'/Content/Slider/99a370ca-c2df-4622-bb4d-75339471800c.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Resim] ([ID], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (26, N'/Content/Slider/1e51aa5e-d6a0-475c-b6d2-1e5722ba9e23.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Resim] ([ID], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (27, N'/Content/UrunResim/Buyuk/59c7e2a4-abb6-44e9-80ab-6afcef142538.jpg', N'/Content/UrunResim/Orta/efee7730-5dc0-471d-854f-2e5bd582fec9.jpg', NULL, 0, NULL, NULL)
INSERT [dbo].[Resim] ([ID], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (28, NULL, N'/Content/MarkaResim/3c392899-b230-401e-9ca9-873ae6f10fb1.png', NULL, NULL, NULL, NULL)
INSERT [dbo].[Resim] ([ID], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (29, NULL, N'/Content/MarkaResim/957ca465-ea6f-472c-87d5-e4de53e65212.png', NULL, NULL, NULL, NULL)
INSERT [dbo].[Resim] ([ID], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [UrunID]) VALUES (30, NULL, N'/Content/MarkaResim/4800db11-f1cf-49ce-80eb-209bfae65cdf.png', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Resim] OFF
SET IDENTITY_INSERT [dbo].[Urun] ON 

INSERT [dbo].[Urun] ([ID], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [KategoriID], [MarkaID]) VALUES (29, N'IdeaPad320', N'ürün hakkında detaylı açıklama yapılacaktır', CAST(1500.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), NULL, 1, 3)
INSERT [dbo].[Urun] ([ID], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [KategoriID], [MarkaID]) VALUES (30, N'Apple X', N'adam gibi iş yapın yav bu ne arkadaaş para kolay kazanılmıyor asgari maaşla iphone nun şarj aletini bile zor alıyoruz!!!', CAST(8000.00 AS Decimal(10, 2)), CAST(9000.00 AS Decimal(10, 2)), NULL, 3, 5)
INSERT [dbo].[Urun] ([ID], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [KategoriID], [MarkaID]) VALUES (31, N'samsung s10', N'orta kalite', CAST(1800.00 AS Decimal(10, 2)), CAST(2200.00 AS Decimal(10, 2)), NULL, 3, 3)
INSERT [dbo].[Urun] ([ID], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [KategoriID], [MarkaID]) VALUES (32, N'xiaomi redmi not 7', N'kullanışlı', CAST(1800.00 AS Decimal(10, 2)), CAST(2100.00 AS Decimal(10, 2)), NULL, 3, 3)
INSERT [dbo].[Urun] ([ID], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [KategoriID], [MarkaID]) VALUES (33, N'huawei p40 lite', N'Açıklama yapıacak', CAST(2100.00 AS Decimal(10, 2)), CAST(2400.00 AS Decimal(10, 2)), NULL, 3, 10)
INSERT [dbo].[Urun] ([ID], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [KategoriID], [MarkaID]) VALUES (34, N'Oppo reno 4 lite', N'Açıklama yapılacak', CAST(2400.00 AS Decimal(10, 2)), CAST(2800.00 AS Decimal(10, 2)), NULL, 3, 13)
INSERT [dbo].[Urun] ([ID], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [KategoriID], [MarkaID]) VALUES (35, N'Xiaomi redmi not 8', N'yapılacak', CAST(2800.00 AS Decimal(10, 2)), CAST(3200.00 AS Decimal(10, 2)), CAST(N'2021-04-30' AS Date), 3, 3)
INSERT [dbo].[Urun] ([ID], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [KategoriID], [MarkaID]) VALUES (36, N'Xiaomi Redmi Not 9', N'yapılacak', CAST(3000.00 AS Decimal(10, 2)), CAST(3400.00 AS Decimal(10, 2)), NULL, 3, 18)
SET IDENTITY_INSERT [dbo].[Urun] OFF
INSERT [dbo].[UrunDetay] ([UrunID], [OzelliklerID], [OzellikDetayID]) VALUES (29, 1, 19)
INSERT [dbo].[UrunDetay] ([UrunID], [OzelliklerID], [OzellikDetayID]) VALUES (29, 2, 30)
INSERT [dbo].[UrunDetay] ([UrunID], [OzelliklerID], [OzellikDetayID]) VALUES (29, 3, 32)
INSERT [dbo].[UrunDetay] ([UrunID], [OzelliklerID], [OzellikDetayID]) VALUES (30, 4, 33)
INSERT [dbo].[UrunDetay] ([UrunID], [OzelliklerID], [OzellikDetayID]) VALUES (36, 7, 34)
ALTER TABLE [dbo].[aspnet_UserInRoles]  WITH CHECK ADD  CONSTRAINT [FK_aspnet_UserInRoles_aspnet_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[aspnet_Roles] ([RoleID])
GO
ALTER TABLE [dbo].[aspnet_UserInRoles] CHECK CONSTRAINT [FK_aspnet_UserInRoles_aspnet_Roles]
GO
ALTER TABLE [dbo].[aspnet_UserInRoles]  WITH CHECK ADD  CONSTRAINT [FK_aspnet_UserInRoles_aspnet_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[aspnet_Users] ([UserID])
GO
ALTER TABLE [dbo].[aspnet_UserInRoles] CHECK CONSTRAINT [FK_aspnet_UserInRoles_aspnet_Users]
GO
ALTER TABLE [dbo].[Kategoriler]  WITH CHECK ADD  CONSTRAINT [FK_Kategoriler_Resim] FOREIGN KEY([ResimID])
REFERENCES [dbo].[Resim] ([ID])
GO
ALTER TABLE [dbo].[Kategoriler] CHECK CONSTRAINT [FK_Kategoriler_Resim]
GO
ALTER TABLE [dbo].[Markalar]  WITH CHECK ADD  CONSTRAINT [FK_Markalar_Resim] FOREIGN KEY([ResimID])
REFERENCES [dbo].[Resim] ([ID])
GO
ALTER TABLE [dbo].[Markalar] CHECK CONSTRAINT [FK_Markalar_Resim]
GO
ALTER TABLE [dbo].[Musteri]  WITH CHECK ADD  CONSTRAINT [FK_Musteri_aspnet_Users] FOREIGN KEY([ID])
REFERENCES [dbo].[aspnet_Users] ([UserID])
GO
ALTER TABLE [dbo].[Musteri] CHECK CONSTRAINT [FK_Musteri_aspnet_Users]
GO
ALTER TABLE [dbo].[MusteriAdres]  WITH CHECK ADD  CONSTRAINT [FK_MusteriAdres_Musteri] FOREIGN KEY([MusteriID])
REFERENCES [dbo].[Musteri] ([ID])
GO
ALTER TABLE [dbo].[MusteriAdres] CHECK CONSTRAINT [FK_MusteriAdres_Musteri]
GO
ALTER TABLE [dbo].[OzellikDetay]  WITH NOCHECK ADD  CONSTRAINT [FK_OzellikDetay_Ozellikler] FOREIGN KEY([OzellikID])
REFERENCES [dbo].[Ozellikler] ([ID])
GO
ALTER TABLE [dbo].[OzellikDetay] NOCHECK CONSTRAINT [FK_OzellikDetay_Ozellikler]
GO
ALTER TABLE [dbo].[Ozellikler]  WITH CHECK ADD  CONSTRAINT [FK_Ozellikler_Kategoriler] FOREIGN KEY([KategoriID])
REFERENCES [dbo].[Kategoriler] ([ID])
GO
ALTER TABLE [dbo].[Ozellikler] CHECK CONSTRAINT [FK_Ozellikler_Kategoriler]
GO
ALTER TABLE [dbo].[Resim]  WITH CHECK ADD  CONSTRAINT [FK_Resim_Urun] FOREIGN KEY([UrunID])
REFERENCES [dbo].[Urun] ([ID])
GO
ALTER TABLE [dbo].[Resim] CHECK CONSTRAINT [FK_Resim_Urun]
GO
ALTER TABLE [dbo].[Satis]  WITH CHECK ADD  CONSTRAINT [FK_Satis_Kargo] FOREIGN KEY([KargoID])
REFERENCES [dbo].[Kargo] ([ID])
GO
ALTER TABLE [dbo].[Satis] CHECK CONSTRAINT [FK_Satis_Kargo]
GO
ALTER TABLE [dbo].[Satis]  WITH CHECK ADD  CONSTRAINT [FK_Satis_Musteri] FOREIGN KEY([MusteriID])
REFERENCES [dbo].[Musteri] ([ID])
GO
ALTER TABLE [dbo].[Satis] CHECK CONSTRAINT [FK_Satis_Musteri]
GO
ALTER TABLE [dbo].[Satis]  WITH CHECK ADD  CONSTRAINT [FK_Satis_SiparisDurum] FOREIGN KEY([SiparisDurumID])
REFERENCES [dbo].[SiparisDurum] ([ID])
GO
ALTER TABLE [dbo].[Satis] CHECK CONSTRAINT [FK_Satis_SiparisDurum]
GO
ALTER TABLE [dbo].[SatisDetay]  WITH CHECK ADD  CONSTRAINT [FK_SatisDetay_Satis] FOREIGN KEY([SatisID])
REFERENCES [dbo].[Satis] ([ID])
GO
ALTER TABLE [dbo].[SatisDetay] CHECK CONSTRAINT [FK_SatisDetay_Satis]
GO
ALTER TABLE [dbo].[SatisDetay]  WITH CHECK ADD  CONSTRAINT [FK_SatisDetay_Urun] FOREIGN KEY([UrunID])
REFERENCES [dbo].[Urun] ([ID])
GO
ALTER TABLE [dbo].[SatisDetay] CHECK CONSTRAINT [FK_SatisDetay_Urun]
GO
ALTER TABLE [dbo].[UrunDetay]  WITH CHECK ADD  CONSTRAINT [FK_UrunDetay_OzellikDetay] FOREIGN KEY([OzellikDetayID])
REFERENCES [dbo].[OzellikDetay] ([ID])
GO
ALTER TABLE [dbo].[UrunDetay] CHECK CONSTRAINT [FK_UrunDetay_OzellikDetay]
GO
ALTER TABLE [dbo].[UrunDetay]  WITH CHECK ADD  CONSTRAINT [FK_UrunDetay_Ozellikler] FOREIGN KEY([OzelliklerID])
REFERENCES [dbo].[Ozellikler] ([ID])
GO
ALTER TABLE [dbo].[UrunDetay] CHECK CONSTRAINT [FK_UrunDetay_Ozellikler]
GO
ALTER TABLE [dbo].[UrunDetay]  WITH CHECK ADD  CONSTRAINT [FK_UrunDetay_Urun] FOREIGN KEY([UrunID])
REFERENCES [dbo].[Urun] ([ID])
GO
ALTER TABLE [dbo].[UrunDetay] CHECK CONSTRAINT [FK_UrunDetay_Urun]
GO
