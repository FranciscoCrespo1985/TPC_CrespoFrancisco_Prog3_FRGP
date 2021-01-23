
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/26/2020 13:57:00
-- Generated from EDMX file: C:\Users\Paco-PC\source\repos\Club\Club\Models\dbClub.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CLUB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__ACTIVIDAD__ID_AC__300424B4]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ACTIVIDAD] DROP CONSTRAINT [FK__ACTIVIDAD__ID_AC__300424B4];
GO
IF OBJECT_ID(N'[dbo].[FK__ACTIVIDAD__ID_PR__2F10007B]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ACTIVIDAD] DROP CONSTRAINT [FK__ACTIVIDAD__ID_PR__2F10007B];
GO
IF OBJECT_ID(N'[dbo].[FK__HORARIO__ID_ACTI__33D4B598]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HORARIO] DROP CONSTRAINT [FK__HORARIO__ID_ACTI__33D4B598];
GO
IF OBJECT_ID(N'[dbo].[FK__HORARIO__ID_LOCA__34C8D9D1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HORARIO] DROP CONSTRAINT [FK__HORARIO__ID_LOCA__34C8D9D1];
GO
IF OBJECT_ID(N'[CLUBModelStoreContainer].[FK__INSCRIPCI__ID_AC__25518C17]', 'F') IS NOT NULL
    ALTER TABLE [CLUBModelStoreContainer].[INSCRIPCION_SOCIO] DROP CONSTRAINT [FK__INSCRIPCI__ID_AC__25518C17];
GO
IF OBJECT_ID(N'[CLUBModelStoreContainer].[FK__INSCRIPCI__ID_SO__245D67DE]', 'F') IS NOT NULL
    ALTER TABLE [CLUBModelStoreContainer].[INSCRIPCION_SOCIO] DROP CONSTRAINT [FK__INSCRIPCI__ID_SO__245D67DE];
GO
IF OBJECT_ID(N'[dbo].[FK__LOCACION__ID_TIP__286302EC]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LOCACION] DROP CONSTRAINT [FK__LOCACION__ID_TIP__286302EC];
GO
IF OBJECT_ID(N'[dbo].[FK__SOCIO__ID_SOCIO__2180FB33]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SOCIO] DROP CONSTRAINT [FK__SOCIO__ID_SOCIO__2180FB33];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[__MigrationHistory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[__MigrationHistory];
GO
IF OBJECT_ID(N'[dbo].[ACTIVIDAD]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ACTIVIDAD];
GO
IF OBJECT_ID(N'[dbo].[ACTIVIDAD_TIPO]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ACTIVIDAD_TIPO];
GO
IF OBJECT_ID(N'[dbo].[AspNetRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserClaims]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserClaims];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserLogins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserLogins];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[HORARIO]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HORARIO];
GO
IF OBJECT_ID(N'[dbo].[LOCACION]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LOCACION];
GO
IF OBJECT_ID(N'[dbo].[PROFESOR]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PROFESOR];
GO
IF OBJECT_ID(N'[dbo].[SOCIO]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SOCIO];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[CLUBModelStoreContainer].[INSCRIPCION_SOCIO]', 'U') IS NOT NULL
    DROP TABLE [CLUBModelStoreContainer].[INSCRIPCION_SOCIO];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ACTIVIDAD'
CREATE TABLE [dbo].[ACTIVIDAD] (
    [ID_ACTIVIDAD] int IDENTITY(1,1) NOT NULL,
    [ID_PROFESOR] bigint  NOT NULL,
    [ID_ACTIVIDAD_TIPO] int  NOT NULL,
    [FECHA_INICIO] datetime  NOT NULL,
    [FECHA_FIN] datetime  NOT NULL,
    [ESTADO] bit  NOT NULL
);
GO

-- Creating table 'ACTIVIDAD_TIPO'
CREATE TABLE [dbo].[ACTIVIDAD_TIPO] (
    [ID_ACTIVIDAD_TIPO] int IDENTITY(1,1) NOT NULL,
    [DESCRIPCION] varchar(255)  NOT NULL
);
GO

-- Creating table 'HORARIO'
CREATE TABLE [dbo].[HORARIO] (
    [ID_HORARIO] bigint IDENTITY(1,1) NOT NULL,
    [ID_ACTIVIDAD] int  NOT NULL,
    [ID_LOCACION] int  NOT NULL,
    [HORA_INICIO] datetime  NOT NULL,
    [HORA_FIN] datetime  NOT NULL,
    [DIA] smallint  NOT NULL
);
GO

-- Creating table 'LOCACION'
CREATE TABLE [dbo].[LOCACION] (
    [ID_LOCACION] int IDENTITY(1,1) NOT NULL,
    [DESCRIPCION] varchar(40)  NOT NULL,
    [ID_TIPO_ACTIVIDAD] int  NOT NULL,
    [ESTADO] bit  NOT NULL
);
GO

-- Creating table 'PROFESOR'
CREATE TABLE [dbo].[PROFESOR] (
    [ID_PROFESOR] bigint IDENTITY(1,1) NOT NULL,
    [DNI] varchar(15)  NOT NULL,
    [NOMBRE] varchar(255)  NOT NULL,
    [APELLIDO] varchar(255)  NOT NULL,
    [TELEFONO] varchar(70)  NULL,
    [EMAIL] varchar(255)  NOT NULL,
    [ESTADO] bit  NOT NULL
);
GO

-- Creating table 'AspNetUserClaims'
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL
);
GO

-- Creating table 'C__MigrationHistory'
CREATE TABLE [dbo].[C__MigrationHistory] (
    [MigrationId] nvarchar(150)  NOT NULL,
    [ContextKey] nvarchar(300)  NOT NULL,
    [Model] varbinary(max)  NOT NULL,
    [ProductVersion] nvarchar(32)  NOT NULL
);
GO

-- Creating table 'AspNetRoles'
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] nvarchar(128)  NOT NULL,
    [Name] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'AspNetUserClaims1Set'
CREATE TABLE [dbo].[AspNetUserClaims1Set] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL
);
GO

-- Creating table 'AspNetUserLogins'
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] nvarchar(128)  NOT NULL,
    [ProviderKey] nvarchar(128)  NOT NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUsers'
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] nvarchar(128)  NOT NULL,
    [Email] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [PhoneNumberConfirmed] bit  NOT NULL,
    [TwoFactorEnabled] bit  NOT NULL,
    [LockoutEndDateUtc] datetime  NULL,
    [LockoutEnabled] bit  NOT NULL,
    [AccessFailedCount] int  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'C__MigrationHistory1Set'
CREATE TABLE [dbo].[C__MigrationHistory1Set] (
    [MigrationId] nvarchar(150)  NOT NULL,
    [ContextKey] nvarchar(300)  NOT NULL,
    [Model] varbinary(max)  NOT NULL,
    [ProductVersion] nvarchar(32)  NOT NULL
);
GO

-- Creating table 'SOCIO'
CREATE TABLE [dbo].[SOCIO] (
    [ID_SOCIO] nvarchar(128)  NOT NULL,
    [DNI] varchar(15)  NOT NULL,
    [NOMBRE] varchar(255)  NOT NULL,
    [APELLIDO] varchar(255)  NOT NULL,
    [ESTADO] bit  NOT NULL
);
GO

-- Creating table 'INSCRIPCION_SOCIO'
CREATE TABLE [dbo].[INSCRIPCION_SOCIO] (
    [ID_SOCIO] nvarchar(128)  NULL,
    [ID_ACTIVIDAD] int  NOT NULL,
    [FECHA_INSCRIPCION] datetime  NOT NULL,
    [FECHA_BAJA] datetime  NULL,
    [ESTADO] bit  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles'
CREATE TABLE [dbo].[AspNetUserRoles] (
    [AspNetRoles_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers_Id] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles1'
CREATE TABLE [dbo].[AspNetUserRoles1] (
    [AspNetRoles1_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers1_Id] nvarchar(128)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID_ACTIVIDAD] in table 'ACTIVIDAD'
ALTER TABLE [dbo].[ACTIVIDAD]
ADD CONSTRAINT [PK_ACTIVIDAD]
    PRIMARY KEY CLUSTERED ([ID_ACTIVIDAD] ASC);
GO

-- Creating primary key on [ID_ACTIVIDAD_TIPO] in table 'ACTIVIDAD_TIPO'
ALTER TABLE [dbo].[ACTIVIDAD_TIPO]
ADD CONSTRAINT [PK_ACTIVIDAD_TIPO]
    PRIMARY KEY CLUSTERED ([ID_ACTIVIDAD_TIPO] ASC);
GO

-- Creating primary key on [ID_HORARIO] in table 'HORARIO'
ALTER TABLE [dbo].[HORARIO]
ADD CONSTRAINT [PK_HORARIO]
    PRIMARY KEY CLUSTERED ([ID_HORARIO] ASC);
GO

-- Creating primary key on [ID_LOCACION] in table 'LOCACION'
ALTER TABLE [dbo].[LOCACION]
ADD CONSTRAINT [PK_LOCACION]
    PRIMARY KEY CLUSTERED ([ID_LOCACION] ASC);
GO

-- Creating primary key on [ID_PROFESOR] in table 'PROFESOR'
ALTER TABLE [dbo].[PROFESOR]
ADD CONSTRAINT [PK_PROFESOR]
    PRIMARY KEY CLUSTERED ([ID_PROFESOR] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [PK_AspNetUserClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [MigrationId], [ContextKey] in table 'C__MigrationHistory'
ALTER TABLE [dbo].[C__MigrationHistory]
ADD CONSTRAINT [PK_C__MigrationHistory]
    PRIMARY KEY CLUSTERED ([MigrationId], [ContextKey] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetRoles'
ALTER TABLE [dbo].[AspNetRoles]
ADD CONSTRAINT [PK_AspNetRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUserClaims1Set'
ALTER TABLE [dbo].[AspNetUserClaims1Set]
ADD CONSTRAINT [PK_AspNetUserClaims1Set]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [LoginProvider], [ProviderKey], [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [PK_AspNetUserLogins]
    PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey], [UserId] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [MigrationId], [ContextKey] in table 'C__MigrationHistory1Set'
ALTER TABLE [dbo].[C__MigrationHistory1Set]
ADD CONSTRAINT [PK_C__MigrationHistory1Set]
    PRIMARY KEY CLUSTERED ([MigrationId], [ContextKey] ASC);
GO

-- Creating primary key on [ID_SOCIO] in table 'SOCIO'
ALTER TABLE [dbo].[SOCIO]
ADD CONSTRAINT [PK_SOCIO]
    PRIMARY KEY CLUSTERED ([ID_SOCIO] ASC);
GO

-- Creating primary key on [ID_ACTIVIDAD], [FECHA_INSCRIPCION], [ESTADO] in table 'INSCRIPCION_SOCIO'
ALTER TABLE [dbo].[INSCRIPCION_SOCIO]
ADD CONSTRAINT [PK_INSCRIPCION_SOCIO]
    PRIMARY KEY CLUSTERED ([ID_ACTIVIDAD], [FECHA_INSCRIPCION], [ESTADO] ASC);
GO

-- Creating primary key on [AspNetRoles_Id], [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [PK_AspNetUserRoles]
    PRIMARY KEY CLUSTERED ([AspNetRoles_Id], [AspNetUsers_Id] ASC);
GO

-- Creating primary key on [AspNetRoles1_Id], [AspNetUsers1_Id] in table 'AspNetUserRoles1'
ALTER TABLE [dbo].[AspNetUserRoles1]
ADD CONSTRAINT [PK_AspNetUserRoles1]
    PRIMARY KEY CLUSTERED ([AspNetRoles1_Id], [AspNetUsers1_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ID_ACTIVIDAD_TIPO] in table 'ACTIVIDAD'
ALTER TABLE [dbo].[ACTIVIDAD]
ADD CONSTRAINT [FK__ACTIVIDAD__ID_AC__300424B4]
    FOREIGN KEY ([ID_ACTIVIDAD_TIPO])
    REFERENCES [dbo].[ACTIVIDAD_TIPO]
        ([ID_ACTIVIDAD_TIPO])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__ACTIVIDAD__ID_AC__300424B4'
CREATE INDEX [IX_FK__ACTIVIDAD__ID_AC__300424B4]
ON [dbo].[ACTIVIDAD]
    ([ID_ACTIVIDAD_TIPO]);
GO

-- Creating foreign key on [ID_PROFESOR] in table 'ACTIVIDAD'
ALTER TABLE [dbo].[ACTIVIDAD]
ADD CONSTRAINT [FK__ACTIVIDAD__ID_PR__2F10007B]
    FOREIGN KEY ([ID_PROFESOR])
    REFERENCES [dbo].[PROFESOR]
        ([ID_PROFESOR])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__ACTIVIDAD__ID_PR__2F10007B'
CREATE INDEX [IX_FK__ACTIVIDAD__ID_PR__2F10007B]
ON [dbo].[ACTIVIDAD]
    ([ID_PROFESOR]);
GO

-- Creating foreign key on [ID_ACTIVIDAD] in table 'HORARIO'
ALTER TABLE [dbo].[HORARIO]
ADD CONSTRAINT [FK__HORARIO__ID_ACTI__33D4B598]
    FOREIGN KEY ([ID_ACTIVIDAD])
    REFERENCES [dbo].[ACTIVIDAD]
        ([ID_ACTIVIDAD])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__HORARIO__ID_ACTI__33D4B598'
CREATE INDEX [IX_FK__HORARIO__ID_ACTI__33D4B598]
ON [dbo].[HORARIO]
    ([ID_ACTIVIDAD]);
GO

-- Creating foreign key on [ID_TIPO_ACTIVIDAD] in table 'LOCACION'
ALTER TABLE [dbo].[LOCACION]
ADD CONSTRAINT [FK__LOCACION__ID_TIP__286302EC]
    FOREIGN KEY ([ID_TIPO_ACTIVIDAD])
    REFERENCES [dbo].[ACTIVIDAD_TIPO]
        ([ID_ACTIVIDAD_TIPO])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__LOCACION__ID_TIP__286302EC'
CREATE INDEX [IX_FK__LOCACION__ID_TIP__286302EC]
ON [dbo].[LOCACION]
    ([ID_TIPO_ACTIVIDAD]);
GO

-- Creating foreign key on [ID_LOCACION] in table 'HORARIO'
ALTER TABLE [dbo].[HORARIO]
ADD CONSTRAINT [FK__HORARIO__ID_LOCA__34C8D9D1]
    FOREIGN KEY ([ID_LOCACION])
    REFERENCES [dbo].[LOCACION]
        ([ID_LOCACION])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__HORARIO__ID_LOCA__34C8D9D1'
CREATE INDEX [IX_FK__HORARIO__ID_LOCA__34C8D9D1]
ON [dbo].[HORARIO]
    ([ID_LOCACION]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserClaims1Set'
ALTER TABLE [dbo].[AspNetUserClaims1Set]
ADD CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserClaims1Set]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserLogins]
    ([UserId]);
GO

-- Creating foreign key on [AspNetRoles_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRoles]
    FOREIGN KEY ([AspNetRoles_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUsers]
    FOREIGN KEY ([AspNetUsers_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles_AspNetUsers'
CREATE INDEX [IX_FK_AspNetUserRoles_AspNetUsers]
ON [dbo].[AspNetUserRoles]
    ([AspNetUsers_Id]);
GO

-- Creating foreign key on [ID_ACTIVIDAD] in table 'INSCRIPCION_SOCIO'
ALTER TABLE [dbo].[INSCRIPCION_SOCIO]
ADD CONSTRAINT [FK__INSCRIPCI__ID_AC__25518C17]
    FOREIGN KEY ([ID_ACTIVIDAD])
    REFERENCES [dbo].[ACTIVIDAD]
        ([ID_ACTIVIDAD])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [UserId] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId1]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId1'
CREATE INDEX [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId1]
ON [dbo].[AspNetUserClaims]
    ([UserId]);
GO

-- Creating foreign key on [ID_SOCIO] in table 'SOCIO'
ALTER TABLE [dbo].[SOCIO]
ADD CONSTRAINT [FK__SOCIO__ID_SOCIO__2180FB33]
    FOREIGN KEY ([ID_SOCIO])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ID_SOCIO] in table 'INSCRIPCION_SOCIO'
ALTER TABLE [dbo].[INSCRIPCION_SOCIO]
ADD CONSTRAINT [FK__INSCRIPCI__ID_SO__245D67DE]
    FOREIGN KEY ([ID_SOCIO])
    REFERENCES [dbo].[SOCIO]
        ([ID_SOCIO])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__INSCRIPCI__ID_SO__245D67DE'
CREATE INDEX [IX_FK__INSCRIPCI__ID_SO__245D67DE]
ON [dbo].[INSCRIPCION_SOCIO]
    ([ID_SOCIO]);
GO

-- Creating foreign key on [AspNetRoles1_Id] in table 'AspNetUserRoles1'
ALTER TABLE [dbo].[AspNetUserRoles1]
ADD CONSTRAINT [FK_AspNetUserRoles1_AspNetRoles]
    FOREIGN KEY ([AspNetRoles1_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers1_Id] in table 'AspNetUserRoles1'
ALTER TABLE [dbo].[AspNetUserRoles1]
ADD CONSTRAINT [FK_AspNetUserRoles1_AspNetUsers]
    FOREIGN KEY ([AspNetUsers1_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles1_AspNetUsers'
CREATE INDEX [IX_FK_AspNetUserRoles1_AspNetUsers]
ON [dbo].[AspNetUserRoles1]
    ([AspNetUsers1_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------