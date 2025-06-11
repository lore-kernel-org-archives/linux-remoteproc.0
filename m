Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013049.outbound.protection.outlook.com [40.107.162.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483BE21FF4B;
	Wed, 11 Jun 2025 05:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749620631; cv=fail; b=jlflHGcd/C8kuJ1jWtePUk28ugVBe12gRS0CWsL4sHGFcym9HqUhUlFJhQGUzxiQegKJMTXAPO7TpIOJPSi9OfPGEMYYY0d4K3SzIU8pceg1PqY1EEQN+OrAyaghYgpNhxwqzR20XdJ1JnDYmJ9kN+F+EBKXVe8CwrkSrSpiQ90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749620631; c=relaxed/simple;
	bh=5Lji/VmQ0T0HunEk3bqCu/b8akdi6uxBG2f4X+IUju0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gYLyihnBydtxzq9n/pxzhWFO9A72htJ/RThCMgAp//U4237CQxKS5PGqQ80BefJc2cnMND5CQplKO21sA8e+x7tCLchMHgtLRlDBxTIBRS3Or7tbe/0HZuc3tgKqVIfG+bHm/SjSDTj1/JZN4BmHinvJqf9rweHN2ETU4QMIGrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pC+F+yKN; arc=fail smtp.client-ip=40.107.162.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pC+F+yKN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yB+IGU1XXWVEKPjH1uOyyM1YWxsBHezaHvt8oKL8Yf2vGVdkC30Crd+wXM9JoeuRRjYXFbGQiiBngiXl1UCfGQNhk81yoOjFlFC1qG2gspKrKel534MrS/ASXvK8PSSABGzV8lW49wsQ0F6e0EOYaQy+xjsn59XpjOYhffstafVcraLkG9VcenDImupaOU53l3VfuT2XERQXbM9fTcFHzTHn9jedJSKu+HMFlNH28F+7vIWU16TPF6XuPn99u20pWjVsUwak0rhaXcFbot5wk8Z5ZZk72HRhtpHRD3SgUpRTWkPQWCxQrYYkmHCF2cEB4FUK/SI0Csy885UysNTvXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Lji/VmQ0T0HunEk3bqCu/b8akdi6uxBG2f4X+IUju0=;
 b=iCn+3dM+NyFILYh/t2fHRFx4tfs+LkYloU/3cvopuGozskQspPonLD/S7feMajyaelOH9jhoMp/oT4+/KmI6dtHVTrRAbagaBKmZfvzTMaveWyXBHeX9WyxIA+cwWhqh+NUAJ0YK43ezhPBgZ7n2vJ7F03mwsmhsAcSiKfocnPRVvVmveqTYvNUZc4bdiecvfl97lPPbPUHs1W/QMKbnhf0Rga/QPV/yEcbqagzr9n/6iyESgLH0Ttln+w+Z4o/TeEbLLzV+xvDA/8OJPSZObyJFvN6P1jn/ENU4AB00BiSHCUdDTdAktIJfpZhGjashkUQLnmMRPccaVmg/oe2gQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Lji/VmQ0T0HunEk3bqCu/b8akdi6uxBG2f4X+IUju0=;
 b=pC+F+yKNHk5Z8cLue0SkqTSp0xBGpkbIH2bhQyAIOM6AQEUb6Q/1RvUJWeyS6KTHlTcwenx1E6QX8eieKak/BCejXH302qyDkNE+MVBhrAIKq6VvHwYJ4romAZ1ER/ZRtssBv+A7w7FK/P3TG0CJSDDS9dBcUihfHuTMhrAjL0T9jjXhrHAeyply6L4jK97tYgsODBYZlwUZJfkfqWwuheaEkVSNoAWpjJ5nEKudIIlGWjHWp/raTxFicSSa6SIVf6deY0ZxO0MWPv8GrS1t9By8bZ+pVU09PbWJFb9KCIi3xju6z52Pa0VLNiCAtFPAt8m87RYqno3IfIaepofGVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6957.eurprd04.prod.outlook.com (2603:10a6:803:135::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 05:43:42 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 05:43:42 +0000
Date: Wed, 11 Jun 2025 14:53:53 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: xlnx: allow single core use in split mode
Message-ID: <20250611065353.GB9120@nxa18884-linux>
References: <20250610192738.3095247-1-tanmay.shah@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610192738.3095247-1-tanmay.shah@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2P153CA0054.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::23)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: 75e7d8fd-2533-477d-467c-08dda8aaeca7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3ukrMsEJa1eLfN2KCVzP03tLZVR1lXdr89e9phTbv7vzeHbngSkHIVkpzYDT?=
 =?us-ascii?Q?8zUdVW+Jw4KyqO8IAWcfWVmhXPOSQ9VM1xgOcDm5wtbCSDa4KqYWXmsBmoDz?=
 =?us-ascii?Q?OuMjNGlSeXssQePi74O/+MH5v7Sk5ZXJk3/DnQtg+byyrM5PqxxIm5QftG4E?=
 =?us-ascii?Q?+c0tpW9TGkB1HW9M0h0MyYp8dmX4rlFPiFGMTDi7AWIaOfMcn9iAN9Jp0k7z?=
 =?us-ascii?Q?Or2tPfq1CAydwLjfUuEQ4lsForQG396DzYCG1mCcVkgdjbjgFiKciOKDG+4C?=
 =?us-ascii?Q?V4DV2NxuTspBy6O/iXzZ/GjfSVPeNJYr4ubzQ7+PooRy62FEDx0bmk+k6M74?=
 =?us-ascii?Q?DbpRf3duhc+gY4kaYhVw0/ODVvM67mk+YVxA/9SJfDMiisOE5JoGh8ei2OaA?=
 =?us-ascii?Q?AeM5mn2HD7PHfsD/zJFY84VVThhsQuptHWSwoVgmP2vMzPENavjlr1MHkQfl?=
 =?us-ascii?Q?KR0SveoqLi4T1wprGfzCzXCpwrdnv+p3++/3LqHU8ZmrJm7JX0RQ0gVmg1vJ?=
 =?us-ascii?Q?MYc7jBbry1QOVM85JelS1tUeKBHzaroZRjkUTEm3d7TyZ4BW8z0zR6jNvYyr?=
 =?us-ascii?Q?7F/4dtCz1M/AfuOXggwvUIIBttNeOXuOe+EscAilwzHvIfP07KOF3ymAQap4?=
 =?us-ascii?Q?d1x/u5H+K3xaaLR0VaA4V6USfDbky9r/QZkVWVwcsO90htPmTu2KrQK6QT0Z?=
 =?us-ascii?Q?1S036fYEAJ04CS9WKpjg2SSQeOGxh3Ia0Ayn/HsN+qGzedNfejjSssSCjDYN?=
 =?us-ascii?Q?wgts2XvLqKZS+4nfE2Pe+MDY07NsirQy874dvBg+TRkwb6pzupcsHmwv/WQj?=
 =?us-ascii?Q?L4YpIDSZGRHgy/W162gbZNl/A9PR2ycs2AaMB5NASBJvfPdKctBR8Gu55FXx?=
 =?us-ascii?Q?VyQs8oIOhCgf9v8mRWS8rmNdcz7ED8CeA2ClBuYyaWz886DoEyHNZC9aLzp+?=
 =?us-ascii?Q?RuIpXC4c4hUFCol9qDXFk47Bbv0tpaaIO5nPd3Qz+djx05dqsc8W90ibPKsg?=
 =?us-ascii?Q?hxQC5sfUHiSiqOltw7EQzzWXVmCuGPSbRSzQejBRtjVrWxNgwgLYhZw5H+30?=
 =?us-ascii?Q?JLVLxxmY4EjBk1DUWZRAe4zKtIqPwj+ANCll0N0kh4D7NOuebukkqUZqaFs7?=
 =?us-ascii?Q?3C8wZULrWmvsIQs38lutznnbdAOpJiXbVRCFm2OpVMc6yM9ZzqQ+klv2yKEc?=
 =?us-ascii?Q?6WKyxEFG4PVyb4Yvb/5BXkGyKT62exyxpXDFGu+g0J/XFgd6WxX2wmfG77b5?=
 =?us-ascii?Q?LEgbAlIHGbW7kqEZiUTjpBaMym2wz3f7dK9v/YkFqqN2b/0z44q7D5UWJr4i?=
 =?us-ascii?Q?b0+rhtx8KoOmZo/A8GG6AAai73b4UmMG/urxOLtHVXmsp5uL6qEBfivbutsu?=
 =?us-ascii?Q?aI1oXrbewNwNgRo2e5tdfc4K9p1Nak/4Yb+cveqpoD/PX8pGNOipgAqDrMJG?=
 =?us-ascii?Q?/NjrufC4GTgh2QLQ1sWqg6kWrCG2v/Vsr4YIRuCisjpGG+mfnocHAg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KKRZtEJJZyEoCCMJj0Ms2vagJTzmnF4Ts89/B7A8Uhi6vjDOucklH7/Q+IDB?=
 =?us-ascii?Q?1QRh4vHYfM/SREZGlr88iT0+pOAaYMqxA3PhEpj3wtiejtbyp8RtLqgFLOQx?=
 =?us-ascii?Q?Z/6+R37AVYiZAHYoP4hIEDbGBde+HJuxG5v1HAp3+K5MZ26DubWXV+L7p6Ss?=
 =?us-ascii?Q?Y9HZzuNwGpxCjqsoD96mYqD3/SlyRHA667zhwILATDF+N+uaOUfcKx321ZUF?=
 =?us-ascii?Q?4vNm0ZxCFU5LWf3CG/HJCb4tkhmkB4y0ev2Z0gtguKjzPMnquYFDR+J8ItwO?=
 =?us-ascii?Q?tZx9Hnv/K/VpTROtp40bPP0/VdBQ5u3M+hYYPiJ/PKalnSqqigKNICzAjQqp?=
 =?us-ascii?Q?9WEP49nF1E6eh0swqO5DpTNWnwLwaYw6nOCMn2IkgBlmW0dvZI6tbLyq6kfj?=
 =?us-ascii?Q?+VmEOLx1kS7ryB01W36t8nQ9bxHW6do1cTbTtqPQBjfy94cPqx2Q4cpYb3to?=
 =?us-ascii?Q?Z2Tg0bmGFUuC4DyRXv1PbADdLoLui5oc8nYhMASSCM9WT7M5J85se3uNSPD6?=
 =?us-ascii?Q?0R8ZnvChqBydmy3TB32msbAVeAdRUhRMxHWQPtLfFm3q71SWlUoDSPxiisTx?=
 =?us-ascii?Q?kchX49YOVwS5khL8ChM+E+FG32pjbavBXF31Fj59ZN+KPH7wHYBiamWRZPeF?=
 =?us-ascii?Q?pF+RIAuVrvzkvyVXiJs7BHzdj0fpD9FUZuZYgj/7elHgDFsL3Or3loapTh7T?=
 =?us-ascii?Q?uk+jvlaFljd8t2IM+kOGfKwtNs4vIDyX6bk7oTt2z/J4t6WN6tdGjcdRrqoq?=
 =?us-ascii?Q?MsfVBbqyP7U1gOC6HvyeHOJ3FvzfIFZArzFp/EHU7drYXPiIIIKMH5+KdAUn?=
 =?us-ascii?Q?34UjHBim1eyW1jRPD4VfRPwqNr2EMb9vGSo8VQhI0okoUXs/dAuCU1xH8hN6?=
 =?us-ascii?Q?oQR/PSqJRq1xve18Kg70DtUghrXZJGY0iQ7n0fsqEyhUFnD0RgF95FjuwYx1?=
 =?us-ascii?Q?MTDoglWwQ/VkNqExA3HwfOlLe3Ax67OFdtWiBLXPkeKV5vwhPSFwR0mdnCuV?=
 =?us-ascii?Q?etWols7gY9vYiP0fxCtckoEgRzlRh2JG/4jF6ruuj22X7tEhkO89iaAr9gN7?=
 =?us-ascii?Q?Eqtarx/e4fraLYwqatrr6PX1uRIM+6MfhOn8099ctciLGrvNP/ximzEZZhO3?=
 =?us-ascii?Q?83Ag7pwM2h30EzDS/9yUYmkOGsNbmfnkDqcCoZxFfoA3rdCyCrev2LqCjTyA?=
 =?us-ascii?Q?JxXY9/Z4ytTGXkHHmkaqwx6jinyhJhNeV9L2o6rWX4pkhyGSgyn0XAoSYNdX?=
 =?us-ascii?Q?EDcRInkO5TQaUDi2y+xAKINhAm/R56+7IgF4Fd+I8sMhhWY1THPJsS5l+VDQ?=
 =?us-ascii?Q?/d/Z3Tb3mA1L16OntxpFQpE1CnI4Xexvvj6PR+FYtFtMWjni2XZw1xynCfZ+?=
 =?us-ascii?Q?jJ8R/hWpAPbPzKYxAEFVT1LwcU9HZ5n9jYv8rurNZtK4C7ogRaFWpwg58XKW?=
 =?us-ascii?Q?tSMW6flAwR78CEkhIl6FsRjF8EK+nfpQFkRtk9f3TLY5c3P1i2ESRJlfAIge?=
 =?us-ascii?Q?QyxxrTY2ud9mMMa4ZRcHGsX4AD4WBkOeuBta014CIi1/5xIznC+sEqRIvumu?=
 =?us-ascii?Q?FYVBokVZBen/0XVivitU+tLbKPLqwBNfu/aYsPr+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e7d8fd-2533-477d-467c-08dda8aaeca7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 05:43:42.6820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7bLYsMddQ5+5qKcGF32YS7jDU5cYF7c0F4HlbDDOyTL7oV/CF1CtoAKwrFrjCPISiWF1qHkMoIz2i3sfNkVTWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6957

On Tue, Jun 10, 2025 at 12:27:38PM -0700, Tanmay Shah wrote:
>It's a valid use case to have only one core enabled in cluster in split
>mode. Remove exact core count expecatation from the driver.
>
>Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>

Reviewed-by: <peng.fan@nxp.com>
