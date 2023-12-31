
USE [CardGameDB]
GO
/****** Object:  Table [dbo].[ActionType]    Script Date: 12/12/2020 10:18:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](15) NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_ActionType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameHashTemp]    Script Date: 12/12/2020 10:18:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameHashTemp](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[HostName] [nvarchar](max) NULL,
	[GameCode] [nvarchar](25) NULL,
	[GameHash] [nvarchar](max) NULL,
	[GameCreatorId] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[IsEnded] [bit] NULL,
	[IsOnlyInvitees] [bit] NULL,
	[IsLocked] [bit] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[GamePlayerHash] [nvarchar](max) NULL,
 CONSTRAINT [PK_GameHashTemp] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameLog]    Script Date: 12/12/2020 10:18:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GameId] [bigint] NULL,
	[PlayerId] [bigint] NULL,
	[Action] [nvarchar](250) NULL,
	[Created] [datetime] NULL,
	[Amount] [bigint] NULL,
 CONSTRAINT [PK_GameLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Player]    Script Date: 12/12/2020 10:18:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Player](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PlayerUniqueId] [nvarchar](150) NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[IsActive] [bit] NULL,
	[SignalRConnectionId] [nvarchar](150) NULL,
	[IsConnected] [bit] NULL,
	[GameCode] [nvarchar](25) NULL,
	[CurrentGameId] [bigint] NULL,
	[PlayerSno] [int] NULL,
	[IsDealer] [bit] NULL,
	[IsCurrent] [bit] NULL,
	[LastActionTime] [datetime] NULL,
	[IsFolded] [bit] NULL,
	[IsSitOut] [bit] NULL,
 CONSTRAINT [PK_Player] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerAction]    Script Date: 12/12/2020 10:18:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerAction](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GameId] [bigint] NULL,
	[PlayerId] [bigint] NULL,
	[Action] [int] NULL,
	[Amount] [bigint] NULL,
	[BeforeStatus] [nvarchar](20) NULL,
	[AfterStatus] [nvarchar](20) NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[Round] [int] NULL,
	[Hand] [int] NULL,
 CONSTRAINT [PK_PlayerAction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerCard]    Script Date: 12/12/2020 10:18:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerCard](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PlayerId] [bigint] NULL,
	[GameId] [bigint] NULL,
	[PlayerCardHash] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
 CONSTRAINT [PK_Table8] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [RecurringGames] (
    [Id] [bigint] IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(256) NULL,
    [CreatorId] nvarchar(256) NULL,
    CONSTRAINT [PK_RecurringGames] PRIMARY KEY ([Id])
);

CREATE TABLE [Memberships] (
    [Id] [bigint] IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(256) NULL,
	[Description] nvarchar(256) NULL,
	[Month_Value_In_Cash] float NULL,
	[Month_Value_In_Token] int NULL,
	[Annual_Value_In_Cash] float NULL,
	[Annual_Value_In_Token] int NULL,
    CONSTRAINT [PK_Memberships] PRIMARY KEY ([Id])
);

CREATE TABLE [Assets] (
    [Id] [bigint] IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(256) NULL,
	[Tokens] int NULL,
	[MembershipId] [bigint] NULL,
	[VideoTime] int NULL,
	[LastMembershipBillDate] [datetime] NULL,
	[BillingPeriod] int NULL,
    CONSTRAINT [PK_Assets] PRIMARY KEY ([Id])
);

CREATE TABLE [Transactions] (
    [Id] [bigint] IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(256) NULL,
	[Tokens] int NULL,
	[Description] nvarchar(256) NULL,
	[VideoMinutes] int NULL,
    CONSTRAINT [PK_Transactions] PRIMARY KEY ([Id])
);

CREATE TABLE [GameInvite] (
    [Id] [bigint] IDENTITY(1,1) NOT NULL,
    [GameCode] nvarchar(256) NULL,
    [CreatorId] nvarchar(256) NULL,
    [InviteeEmail] nvarchar(max) NULL,
	[IsJoined] bit NOT NULL,
	[Date] [datetime] NULL,
    CONSTRAINT [PK_GameInvite] PRIMARY KEY ([Id])
);

CREATE TABLE [AspNetRoles] (
    [Id] nvarchar(450) NOT NULL,
    [Name] nvarchar(256) NULL,
    [NormalizedName] nvarchar(256) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
);

CREATE TABLE [AspNetUsers] (
    [Id] nvarchar(450) NOT NULL,
    [UserName] nvarchar(256) NULL,
    [NormalizedUserName] nvarchar(256) NULL,
    [Email] nvarchar(256) NULL,
    [NormalizedEmail] nvarchar(256) NULL,
    [EmailConfirmed] bit NOT NULL,
    [PasswordHash] nvarchar(max) NULL,
    [SecurityStamp] nvarchar(max) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    [PhoneNumber] nvarchar(max) NULL,
    [PhoneNumberConfirmed] bit NOT NULL,
    [TwoFactorEnabled] bit NOT NULL,
    [LockoutEnd] datetimeoffset NULL,
    [LockoutEnabled] bit NOT NULL,
    [AccessFailedCount] int NOT NULL,
    CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
);

CREATE TABLE [AspNetRoleClaims] (
    [Id] int NOT NULL IDENTITY,
    [RoleId] nvarchar(450) NOT NULL,
    [ClaimType] nvarchar(max) NULL,
    [ClaimValue] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [AspNetUserClaims] (
    [Id] int NOT NULL IDENTITY,
    [UserId] nvarchar(450) NOT NULL,
    [ClaimType] nvarchar(max) NULL,
    [ClaimValue] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [AspNetUserLogins] (
    [LoginProvider] nvarchar(450) NOT NULL,
    [ProviderKey] nvarchar(450) NOT NULL,
    [ProviderDisplayName] nvarchar(max) NULL,
    [UserId] nvarchar(450) NOT NULL,
    CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
    CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [AspNetUserRoles] (
    [UserId] nvarchar(450) NOT NULL,
    [RoleId] nvarchar(450) NOT NULL,
    CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
    CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [AspNetUserTokens] (
    [UserId] nvarchar(450) NOT NULL,
    [LoginProvider] nvarchar(450) NOT NULL,
    [Name] nvarchar(450) NOT NULL,
    [Value] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
    CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);

INSERT INTO [dbo].[Memberships] ([Name], [Description], [Month_Value_In_Cash], [Month_Value_In_Token], [Annual_Value_In_Cash], [Annual_Value_In_Token]) VALUES (N'Free', 'Save Game History', 0, 0, 0, 0)
INSERT INTO [dbo].[Memberships] ([Name], [Description], [Month_Value_In_Cash], [Month_Value_In_Token], [Annual_Value_In_Cash], [Annual_Value_In_Token]) VALUES (N'Basic', '1000 tokens/month for in-game purchases. Enough tokens for 4 games with video each month*', 14.99, 1000, 149.9, 12000)
INSERT INTO [dbo].[Memberships] ([Name], [Description], [Month_Value_In_Cash], [Month_Value_In_Token], [Annual_Value_In_Cash], [Annual_Value_In_Token]) VALUES (N'Premium', '2000 tokens/month for in-game purchases. Enough tokens for 8 games with video each month*', 24.99, 2000, 249.9, 24000)
INSERT INTO [dbo].[Memberships] ([Name], [Description], [Month_Value_In_Cash], [Month_Value_In_Token], [Annual_Value_In_Cash], [Annual_Value_In_Token]) VALUES (N'Deluxe', '4000 tokens/month for in-game purchases. Enough tokens for 16 games with video each month*', 39.99, 4000, 399.9, 48000)

CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL;
CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL;

GO
