
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/18/2018 23:40:57
-- Generated from EDMX file: C:\Users\Reinger\Desktop\Тестирование\Program quality assessment\Program quality assessment\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [State standard];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CriterionMetrics]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MetricsSet] DROP CONSTRAINT [FK_CriterionMetrics];
GO
IF OBJECT_ID(N'[dbo].[FK_MetricsElement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ElementSet] DROP CONSTRAINT [FK_MetricsElement];
GO
IF OBJECT_ID(N'[dbo].[FK_FactorCriterion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CriterionSet] DROP CONSTRAINT [FK_FactorCriterion];
GO
IF OBJECT_ID(N'[dbo].[FK_PhasePhaseMetrics]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PhaseMetricsSet] DROP CONSTRAINT [FK_PhasePhaseMetrics];
GO
IF OBJECT_ID(N'[dbo].[FK_MetricsPhaseMetrics]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PhaseMetricsSet] DROP CONSTRAINT [FK_MetricsPhaseMetrics];
GO
IF OBJECT_ID(N'[dbo].[FK_CriterionClassCriterion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ClassCriterionSet] DROP CONSTRAINT [FK_CriterionClassCriterion];
GO
IF OBJECT_ID(N'[dbo].[FK_ClassClassCriterion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ClassCriterionSet] DROP CONSTRAINT [FK_ClassClassCriterion];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[MetricsSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MetricsSet];
GO
IF OBJECT_ID(N'[dbo].[FactorSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FactorSet];
GO
IF OBJECT_ID(N'[dbo].[CriterionSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CriterionSet];
GO
IF OBJECT_ID(N'[dbo].[ElementSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ElementSet];
GO
IF OBJECT_ID(N'[dbo].[PhaseSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PhaseSet];
GO
IF OBJECT_ID(N'[dbo].[ClassSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ClassSet];
GO
IF OBJECT_ID(N'[dbo].[ClassCriterionSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ClassCriterionSet];
GO
IF OBJECT_ID(N'[dbo].[PhaseMetricsSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PhaseMetricsSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'MetricsSet'
CREATE TABLE [dbo].[MetricsSet] (
    [Id] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [CriterionId] int  NOT NULL
);
GO

-- Creating table 'FactorSet'
CREATE TABLE [dbo].[FactorSet] (
    [Id] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CriterionSet'
CREATE TABLE [dbo].[CriterionSet] (
    [Id] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [FactorId] int  NOT NULL
);
GO

-- Creating table 'ElementSet'
CREATE TABLE [dbo].[ElementSet] (
    [Id] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [Expert] bit  NOT NULL,
    [MetricsId] int  NOT NULL
);
GO

-- Creating table 'PhaseSet'
CREATE TABLE [dbo].[PhaseSet] (
    [Id] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ClassSet'
CREATE TABLE [dbo].[ClassSet] (
    [Id] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ClassCriterionSet'
CREATE TABLE [dbo].[ClassCriterionSet] (
    [Id] int  NOT NULL,
    [CriterionId] int  NOT NULL,
    [ClassId] int  NOT NULL
);
GO

-- Creating table 'PhaseMetricsSet'
CREATE TABLE [dbo].[PhaseMetricsSet] (
    [Id] int  NOT NULL,
    [PhaseId] int  NOT NULL,
    [MetricsId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'MetricsSet'
ALTER TABLE [dbo].[MetricsSet]
ADD CONSTRAINT [PK_MetricsSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'FactorSet'
ALTER TABLE [dbo].[FactorSet]
ADD CONSTRAINT [PK_FactorSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CriterionSet'
ALTER TABLE [dbo].[CriterionSet]
ADD CONSTRAINT [PK_CriterionSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ElementSet'
ALTER TABLE [dbo].[ElementSet]
ADD CONSTRAINT [PK_ElementSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PhaseSet'
ALTER TABLE [dbo].[PhaseSet]
ADD CONSTRAINT [PK_PhaseSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ClassSet'
ALTER TABLE [dbo].[ClassSet]
ADD CONSTRAINT [PK_ClassSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ClassCriterionSet'
ALTER TABLE [dbo].[ClassCriterionSet]
ADD CONSTRAINT [PK_ClassCriterionSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PhaseMetricsSet'
ALTER TABLE [dbo].[PhaseMetricsSet]
ADD CONSTRAINT [PK_PhaseMetricsSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CriterionId] in table 'MetricsSet'
ALTER TABLE [dbo].[MetricsSet]
ADD CONSTRAINT [FK_CriterionMetrics]
    FOREIGN KEY ([CriterionId])
    REFERENCES [dbo].[CriterionSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CriterionMetrics'
CREATE INDEX [IX_FK_CriterionMetrics]
ON [dbo].[MetricsSet]
    ([CriterionId]);
GO

-- Creating foreign key on [MetricsId] in table 'ElementSet'
ALTER TABLE [dbo].[ElementSet]
ADD CONSTRAINT [FK_MetricsElement]
    FOREIGN KEY ([MetricsId])
    REFERENCES [dbo].[MetricsSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MetricsElement'
CREATE INDEX [IX_FK_MetricsElement]
ON [dbo].[ElementSet]
    ([MetricsId]);
GO

-- Creating foreign key on [FactorId] in table 'CriterionSet'
ALTER TABLE [dbo].[CriterionSet]
ADD CONSTRAINT [FK_FactorCriterion]
    FOREIGN KEY ([FactorId])
    REFERENCES [dbo].[FactorSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FactorCriterion'
CREATE INDEX [IX_FK_FactorCriterion]
ON [dbo].[CriterionSet]
    ([FactorId]);
GO

-- Creating foreign key on [PhaseId] in table 'PhaseMetricsSet'
ALTER TABLE [dbo].[PhaseMetricsSet]
ADD CONSTRAINT [FK_PhasePhaseMetrics]
    FOREIGN KEY ([PhaseId])
    REFERENCES [dbo].[PhaseSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PhasePhaseMetrics'
CREATE INDEX [IX_FK_PhasePhaseMetrics]
ON [dbo].[PhaseMetricsSet]
    ([PhaseId]);
GO

-- Creating foreign key on [MetricsId] in table 'PhaseMetricsSet'
ALTER TABLE [dbo].[PhaseMetricsSet]
ADD CONSTRAINT [FK_MetricsPhaseMetrics]
    FOREIGN KEY ([MetricsId])
    REFERENCES [dbo].[MetricsSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MetricsPhaseMetrics'
CREATE INDEX [IX_FK_MetricsPhaseMetrics]
ON [dbo].[PhaseMetricsSet]
    ([MetricsId]);
GO

-- Creating foreign key on [CriterionId] in table 'ClassCriterionSet'
ALTER TABLE [dbo].[ClassCriterionSet]
ADD CONSTRAINT [FK_CriterionClassCriterion]
    FOREIGN KEY ([CriterionId])
    REFERENCES [dbo].[CriterionSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CriterionClassCriterion'
CREATE INDEX [IX_FK_CriterionClassCriterion]
ON [dbo].[ClassCriterionSet]
    ([CriterionId]);
GO

-- Creating foreign key on [ClassId] in table 'ClassCriterionSet'
ALTER TABLE [dbo].[ClassCriterionSet]
ADD CONSTRAINT [FK_ClassClassCriterion]
    FOREIGN KEY ([ClassId])
    REFERENCES [dbo].[ClassSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClassClassCriterion'
CREATE INDEX [IX_FK_ClassClassCriterion]
ON [dbo].[ClassCriterionSet]
    ([ClassId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------