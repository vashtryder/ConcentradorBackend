USE [pg_wowperu_db]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 27/05/2021 6:10:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[DepartamentoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	[DepartamentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntidadFinanciera]    Script Date: 27/05/2021 6:10:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntidadFinanciera](
	[EntidadFinancieraID] [int] IDENTITY(1,1) NOT NULL,
	[RazonSocial] [varchar](200) NULL,
	[NombreComercial] [varchar](200) NULL,
	[PathImagen] [varchar](200) NULL,
	[TipoInstitucionID] [int] NULL,
	[DepartamentoID] [int] NULL,
	[TipoDocumentoID] [int] NULL,
	[NumeroDocumento] [varchar](20) NULL,
	[Direccion] [varchar](200) NULL,
	[Telefono] [varchar](20) NULL,
	[Correo] [varchar](100) NULL,
	[PaginaWeb] [varchar](100) NULL,
	[UsuarioRegistro] [varchar](100) NULL,
	[FechaRegistro] [datetime] NULL,
	[UsuarioModifica] [varchar](100) NULL,
	[FechaModificacion] [datetime] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_EntidadFinanciera] PRIMARY KEY CLUSTERED 
(
	[EntidadFinancieraID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductoFinanciero]    Script Date: 27/05/2021 6:10:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductoFinanciero](
	[ProductoFinancieroID] [int] IDENTITY(1,1) NOT NULL,
	[TipoProductoID] [int] NULL,
	[EntidadFinancieraID] [int] NULL,
	[Nombre] [varchar](100) NULL,
	[Descripcion] [varchar](200) NULL,
	[PorcentajeTea] [decimal](10, 2) NULL,
	[PorcentajeComision] [decimal](10, 2) NULL,
	[PorcentajeSeguro] [decimal](10, 2) NULL,
	[Observacion] [varchar](500) NULL,
	[PlazoMinimoMes] [int] NULL,
	[PlazoMaximoMes] [int] NULL,
	[PlazoMinimoDia] [int] NULL,
	[PlazoMaximoDia] [int] NULL,
	[TieneFondoSeguro] [bit] NULL,
	[UsuarioRegistro] [varchar](100) NULL,
	[FechaRegistro] [datetime] NULL,
	[UsuarioModifica] [varchar](100) NULL,
	[FechaModificacion] [datetime] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_ProductoFinanciero] PRIMARY KEY CLUSTERED 
(
	[ProductoFinancieroID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleProductoFinanciero]    Script Date: 27/05/2021 6:10:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleProductoFinanciero](
	[DetalleProductoFinancieroID] [int] IDENTITY(1,1) NOT NULL,
	[ProductoFinancieroID] [int] NULL,
	[TipoMonedaID] [int] NULL,
	[IngresoPermitido] [int] NULL,
	[MontoMinimoPrestamo] [decimal](10, 2) NULL,
	[MontoMaximoPrestamo] [decimal](10, 2) NULL,
	[MontoMinimoDeposito] [decimal](10, 2) NULL,
	[MontoMaximoDeposito] [decimal](10, 2) NULL,
 CONSTRAINT [PK_DetalleProductoFinanciero] PRIMARY KEY CLUSTERED 
(
	[DetalleProductoFinancieroID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parametro]    Script Date: 27/05/2021 6:10:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parametro](
	[ParametroID] [int] IDENTITY(1,1) NOT NULL,
	[CodigoPadre] [varchar](10) NULL,
	[CodigoHijo] [varchar](10) NULL,
	[Valor1] [varchar](100) NULL,
	[Valor2] [varchar](100) NULL,
	[Descripcion] [varchar](200) NULL,
	[Orden] [int] NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_Parametro] PRIMARY KEY CLUSTERED 
(
	[ParametroID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_consulta_entidad_producto]    Script Date: 27/05/2021 6:10:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    VIEW [dbo].[vw_consulta_entidad_producto] (ProductoFinancieroId, TipoProductoId, TipoInstitucionId,
    Producto, PathImagen, MonedaId, Moneda, PorcentajeTea, ConsultaEntidadProductoId,
    MontoMinimoDeposito, MontoMaximoDeposito, MontoMinimoPrestamo, MontoMaximoPrestamo, IngresoPermitido,
    PorcentajeComision, PorcentajeSeguro,
    PlazoMinimoDia, PlazoMaximoDia, PlazoMinimoMes, PlazoMaximoMes, Nombre, Descripcion,
    Observacion, DepartamentoId, Ubicacion)
 AS SELECT pf.ProductoFinancieroID,
       pf.TipoProductoID,
       ef.TipoInstitucionID,
       ef.NombreComercial                AS Producto,
       ef.PathImagen,
        pa.ParametroID                    AS MonedaId,
       pa.Valor2                         AS Moneda,
       pf.PorcentajeTea,
       dpf.DetalleProductoFinancieroID AS ConsultaEntidadProductoId,
       dpf.MontoMinimoDeposito,
       dpf.MontoMaximoDeposito,
       dpf.MontoMinimoPrestamo,
       dpf.MontoMaximoPrestamo,
       dpf.IngresoPermitido,
       pf.PorcentajeComision,
       pf.PorcentajeSeguro,
       pf.PlazoMinimoDia,
       pf.PlazoMaximoDia,
       pf.PlazoMinimoMes,
       pf.PlazoMaximoMes,
       pf.nombre,
       pf.descripcion,
       pf.observacion,
       de.DepartamentoID,
       de.nombre                          AS Ubicacion

FROM ProductoFinanciero pf
         JOIN EntidadFinanciera ef ON ef.EntidadFinancieraID = pf.EntidadFinancieraID
         JOIN DetalleProductoFinanciero dpf ON dpf.ProductoFinancieroID = pf.ProductoFinancieroID
         JOIN Parametro pa ON pa.ParametroID = dpf.TipoMonedaID
         JOIN Departamento de ON de.DepartamentoID = ef.DepartamentoID
GO
/****** Object:  View [dbo].[vw_consulta_movimiento]    Script Date: 27/05/2021 6:10:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    VIEW [dbo].[vw_consulta_movimiento](ProductoFinancieroId, Nombre, FechaRegistro, EntidadFinancieraId, NombreComercial, PorcentajeTea,
    Moneda, DetalleId, MontoMaximoDeposito, MontoMaximoPestamo, PlazoMaximoMes, Activo) as
	SELECT pf.ProductoFinancieroID,
       pf.Nombre,
       pf.FechaRegistro,
       ef.EntidadFinancieraID,
       ef.NombreComercial,
       pf.PorcentajeTea,
       p.Valor2                          AS moneda,
       dpf.DetalleProductoFinancieroID AS id_detalle,
       dpf.MontoMaximoDeposito,
       dpf.MontoMaximoPrestamo,
       pf.PlazoMaximoMes,
       pf.activo
FROM ProductoFinanciero pf
         JOIN EntidadFinanciera ef ON ef.EntidadFinancieraID = pf.EntidadFinancieraID
         JOIN DetalleProductoFinanciero dpf ON dpf.ProductoFinancieroID = pf.ProductoFinancieroID
         JOIN Parametro p ON p.ParametroID = dpf.TipoMonedaID
GO
/****** Object:  Table [dbo].[Opcion]    Script Date: 27/05/2021 6:10:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opcion](
	[OpcionID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Descripcion] [varchar](200) NULL,
	[PathUrl] [varchar](200) NULL,
	[Icono] [varchar](100) NULL,
	[Estado] [bit] NULL,
	[Orden] [int] NULL,
 CONSTRAINT [PK_Opcion] PRIMARY KEY CLUSTERED 
(
	[OpcionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prospecto]    Script Date: 27/05/2021 6:10:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prospecto](
	[ProspectoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](200) NULL,
	[Apellidos] [varchar](200) NULL,
	[TipoDocumentoID] [int] NULL,
	[NumeroDocumento] [varchar](20) NULL,
	[Email] [varchar](200) NULL,
	[NumeroCelular] [varchar](20) NULL,
	[DepartamentoID] [int] NULL,
	[FechaRegistro] [datetime] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Prospecto] PRIMARY KEY CLUSTERED 
(
	[ProspectoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DetalleProductoFinanciero]  WITH CHECK ADD  CONSTRAINT [FK_DetalleProductoFinanciero_ProductoFinanciero] FOREIGN KEY([ProductoFinancieroID])
REFERENCES [dbo].[ProductoFinanciero] ([ProductoFinancieroID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DetalleProductoFinanciero] CHECK CONSTRAINT [FK_DetalleProductoFinanciero_ProductoFinanciero]
GO
ALTER TABLE [dbo].[EntidadFinanciera]  WITH CHECK ADD  CONSTRAINT [FK_EntidadFinanciera_Departamento] FOREIGN KEY([DepartamentoID])
REFERENCES [dbo].[Departamento] ([DepartamentoID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EntidadFinanciera] CHECK CONSTRAINT [FK_EntidadFinanciera_Departamento]
GO
ALTER TABLE [dbo].[ProductoFinanciero]  WITH CHECK ADD  CONSTRAINT [FK_ProductoFinanciero_EntidadFinanciera] FOREIGN KEY([EntidadFinancieraID])
REFERENCES [dbo].[EntidadFinanciera] ([EntidadFinancieraID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductoFinanciero] CHECK CONSTRAINT [FK_ProductoFinanciero_EntidadFinanciera]
GO
