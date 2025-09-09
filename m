Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011031.outbound.protection.outlook.com [40.107.130.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513871AE877;
	Tue,  9 Sep 2025 02:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757385737; cv=fail; b=o1QqaL+L8BInOCM0m/mfYNfa/lLMnDmPoJYOqUduyEcG9Fq1BfLywgLAh9x22v5XrYc+426qA3RCgZoOtK7nenGFeMtHoENxFgN7JEj7pX9rInlfTMMIv8R1QasVMcD7zRnlE883khbTzQeeyI+pAZCmIPXF4XQzSTrdVzu+FPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757385737; c=relaxed/simple;
	bh=i1wMlu9XA/1IzCcgZkF9IkYv15BW2cBnro92Q31+1FI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kLtizaaa/kzwXRqVCxAimpvaOXhIbpf3rzBG+CL0K/Kd+UhF1oyuYH0Z7Q6nfmZJUIX7TAYW6vwyKIL/roUu7PFZUnqFGcNrPqSz9TWZ3qN8jiOoTMsmaDU5Om/PMmUcfGs6dhGxQ3KraKZSS15zuC5hUGspi/rHS/MJnWKUJ/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BwHcwm2i; arc=fail smtp.client-ip=40.107.130.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BwHcwm2i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LHvyg4vZ2nEcH8ycfVsFeS8UL5Q8PaJZ62WKCN+E96SZxUJE6ErOQ7IuvYMlOw1DIY+P2ZmSpCGRhIwBwhtcDmWlEMDpZdZHDxkpCXEK3O64QsV+WC+iAhP9ZLFLOEPx6O0DHMBK5Jn1H3urwTDIesy3qmd9GOYTpnwJvaCewVEwWS5ZJkqXUJkroE3q+6R/fZQaV7AFtW4hDq9m0PTQRJ0+I4RDdrHwm2rRrHk2ae6R09Y3/cm+8YQ90wcSom4ig98v0VEPnqGJ9vRPsr/CQg/vIadailVMGWM3B0HtVttSbElw0bQxGg3BEHi52S3dabdYEhgG3cjjXSzwvd2wSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1wMlu9XA/1IzCcgZkF9IkYv15BW2cBnro92Q31+1FI=;
 b=tYOrdmT4HQLguVNm2C6NBya26OuyvLCV9UMySZkY5bP3H+jWBsVjgO9NguoS7m54sv5wKb99CrSxXaStutW8MHA1uwMoTylFLSh5hiXO+pGeMvOJEz5FkvnurNl2Xro0bX5vMv0uZUthjHpNyhttIbRGkQ03QoOIY9ORjYPz8TvH/T+ZsQiQwWTd0k+sB9T3HMjQoq8jqtdLHFbde1tVRT75bs5h0owIjDjKe2ALQwsRe83/E3wDqfLrCVP85etdgdNb0XmpFxS/0HKtKgm4TngRr33lQmlDTtp2TZKVl4MxYbVIV5q8JcK79SLw2pZnm+GY4MVV349uPrqUSiVDOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1wMlu9XA/1IzCcgZkF9IkYv15BW2cBnro92Q31+1FI=;
 b=BwHcwm2iqh7kpZd4byJT4jsym9Hww5wdUSQ5FDZqUJ4AS7ls7kTtTWtl3tn0bMsja09O/+pSGHy3o4qxEJJK8Ab0UnDc2UOMpqyCB7TsVzUIWOtWCzp929CtwonYr+Yz9P8tikPYbKtJMM4jl5ohKtsSzWUA0vyqsAxCAltQ7fFX27ZOpCF8wY4lS224stZGCFcmo3fIG6zX0cNqLoVwpLkjg5X3ojuOwFeIzCFXooGTfnz7VGzrNNFQzAgB+AGT4Z0FaAdlice32joid2qY2GAg2Wyy1rBC/gvbUM8hVR3XNm0iXl6cwRv6GB1glK4CgTaw6v0OZX4IzJp5zb5twQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB10693.eurprd04.prod.outlook.com (2603:10a6:10:588::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.14; Tue, 9 Sep
 2025 02:42:09 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9115.010; Tue, 9 Sep 2025
 02:42:09 +0000
Date: Tue, 9 Sep 2025 11:53:38 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] remoteproc: imx_proc: Simplify driver by removing
 the switch-case
Message-ID: <20250909035338.GB20475@nxa18884-linux.ap.freescale.net>
References: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR03CA0110.apcprd03.prod.outlook.com
 (2603:1096:4:91::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU4PR04MB10693:EE_
X-MS-Office365-Filtering-Correlation-Id: 6318a352-df96-42aa-8d94-08ddef4a78a9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rYDxqNp+Pt2WnpsAaNysk7MfjwrjH3wPdyLHka9FQW8Nfx1Q4b/xUv9ixqCq?=
 =?us-ascii?Q?AuF4OosUFLp8dh9WsntmcjXT/XJFEy3xCBjTiQbUMYVOZiklQgsYL9+yVxcl?=
 =?us-ascii?Q?rKZaxJUlIEs6TWNFmyvThTPh+f3Rgn1N42ZUJKw6VjGWhi7lznQlVk+D0/w7?=
 =?us-ascii?Q?Q3bC0z/CP96OygjNVt3cgpuT8sJvG3UPM5SoJkFWJclq4ACJyyfmUjdqsCi/?=
 =?us-ascii?Q?PGJgJR/2TTn2b2zk+Fp0u1g76tEeGoYpUt7tQhxy6SHI0dlHGkR4bjkngIVy?=
 =?us-ascii?Q?EqKYfqluBS5E5YvFN0uhvLumlSRfgt2Smc49rJazTpO4s8TP3hSTCI/DmqFI?=
 =?us-ascii?Q?PjuAPAkOwYfBN6+T9kFYaN8HsVdB2FziI4/VQ2SQdXKwtfD4VoH+fMPxE8c6?=
 =?us-ascii?Q?g+y2KhX78EHGyas6/KtVgc95DbcJphoKG5NHMLCPqQr8D2zNRmVM++MpMD1z?=
 =?us-ascii?Q?2a7KPpFGHhhAV2Ylx5zkDLsRsBhpk2VtKxHSdoBZuRf/6zt0He83eqJYjFCq?=
 =?us-ascii?Q?xqnw5oNNGkdTmrZMoudRjwghxXFaKmUvAWav/G7loQoMj5Z6KqFSwV33jbRg?=
 =?us-ascii?Q?OaO406Zpjm8QfsC58i0LT9vxbVCUcXOmYixGDlAvpx+FOsWUKssfs3XZZt7L?=
 =?us-ascii?Q?3qhokOT4Ijj4AAF3XPop40zem+x3umqjGYv2kxG4/n38Bszm9y9U6TGgc0e/?=
 =?us-ascii?Q?r9uRFGpstIIdxm8IRk+R9adh6f6ejThFThKcXWnsuKepXrWKiEyfcaamsr4M?=
 =?us-ascii?Q?TDkA4BCUwVsJNdplj8ydt6AG/pOL7i9AJwLQvCqtmE30h+uaVekAdqzyn/2j?=
 =?us-ascii?Q?fiEdJz3t/+FREiCe6h5d3UPhfKaKDffnMyjXTV05gYMoX3DPcJjh59YKjX1t?=
 =?us-ascii?Q?YTtGdN3W/eZ2mwtOkuxCDOQVs0g7G9yPXCNN9iISXjaPgbuNl2ftpXpVawmV?=
 =?us-ascii?Q?zmnevB+ht54IkdPqFRznApar+ebdFx6yjGFoCl19Ht7ezca+gCbOO9ZbYPuY?=
 =?us-ascii?Q?8062oKcNupTu2UGOMHPfiEUYZGabE/unmC+RGeoZ1vpDH8OQ8WnuHbNb8DwM?=
 =?us-ascii?Q?5B/FMbRIRNa0omucR5/g7qjq2c4pEd1xpJBLbuvJI7MEFpfsRJGp60lT8PF6?=
 =?us-ascii?Q?6K59hyKV5V/j5a4dhb+vD/89wXIQLTJ6lz0FfIEbHMa787PHeakbZhGcj3dy?=
 =?us-ascii?Q?2TGYx9xv7Sv+4xVIwQqjWpaBhIgvGHj3SRk7RcUexMdPLhhJFhpLSNoHTMUO?=
 =?us-ascii?Q?E1j3JwHpPN+r9oS4cnRDf+JHHecb24FL4QTbD7fECWre//KPuMMLGbJzfLzF?=
 =?us-ascii?Q?prpHCJKTqG7HpB8J/OaB7qYFChDTCtTGD0ZbZscu00cdWZmNsqh171aLrik1?=
 =?us-ascii?Q?dqnHY+ciD9RmHXPP+rzQ7C0nCvhDSIT/E+izwXacAZncHLAq0W2eeXwaegkW?=
 =?us-ascii?Q?NDvLmvb1rXUTEWJHoDGGLno6L6D7xR0oxC+Pam5ewDHJKHwx0Rh95cnhWEXM?=
 =?us-ascii?Q?FwJ+7rFif7IvfPc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CabtJ6NyCPfFm3NFx91mSwFll04ag4WFpkhM1NcQPhM1v4DzTnxUZI8xB52h?=
 =?us-ascii?Q?S+sz9WoR1tSfwdNVZx5yOGOKmmnC9FHQZGQV/gc7dT1r+pJsgRlF84visZ7n?=
 =?us-ascii?Q?IeKMkxFxcPC0F2Oi2UfI9cyVBHyFQnus0zN3mpjHKhNHL99uf51CV+XdQqvU?=
 =?us-ascii?Q?ugnBDxbkVb69zhiSCdfd+MKHyGK7+Tdo7KAr/ryUmVRQ0I7hl8Gg7loh1j1m?=
 =?us-ascii?Q?uMzPCeUUfBz3zX0GnP0GdPr4Lbq7Ac6fIGrURsbVZftPGdtTedB/LVQu9PLd?=
 =?us-ascii?Q?yiGAMtUf3Vuk9x1Yv2Dtc+T7AKuliBZnhVxqn9RpN7VF7Q8dNZvr1zGXB/RZ?=
 =?us-ascii?Q?DsLcghWwXkkwfSzB0yjaq2DDLdmgJVtVJuFPCi6HUSs25JJ7pA6OTf9+zTkk?=
 =?us-ascii?Q?FaNzgGBZdU4BI/ruVtFEXhZQAYqoSgym0oyI4J4II/1+ts5/Uk4beXf/ULhE?=
 =?us-ascii?Q?xHy6QWHqVUjTGiwqlbXEqlO2GC4sDFwDcCqqizd7qZdAex42ije8jczygsJp?=
 =?us-ascii?Q?ncPO3ApVZgKlSEBYi/+XWjnPHHacV/rG1idV+zsx2k2c+hfZKQSoaArWaBrW?=
 =?us-ascii?Q?KHAcRUcpFUfluJ2/vL86/Wgkp20kBibcLElQl7JjN91zIkq6jRS0tz0T6IKs?=
 =?us-ascii?Q?TCJNQD9/SDoFHo4phWC1YBsZTRitOaUChEuxhavojyxVuzxMSS9ME2tdfV6z?=
 =?us-ascii?Q?fsayW6Lo5eisJrmeKXoiNd33gF2FurZTHeF9UuLRZ3wTx8ndbfd2hoxHEi3B?=
 =?us-ascii?Q?15/CVXwSgR3FDvD3KmGhzVpqclZED8Q9+GH/QciJQ/58edzaUQJ5hxnGC5kP?=
 =?us-ascii?Q?zN0uvsNQmH5L+Gx8MGaSaWkvuGFl1b1gfpKgo7xGcmM2YetQ42xhPAK3BSz8?=
 =?us-ascii?Q?LSJlfVKAcEm6lvlXwWFpHrK6liwiFFAEFLlXhH4PBMZP4ywZcWB8ISj9Qmj+?=
 =?us-ascii?Q?tBoqP9z/djgH84VVwvWm3u0q9h67OGfgp7ZR49ztMDULTshaVvUX1eoa0oRs?=
 =?us-ascii?Q?rW7lNaILdwywzhq0eTg+BEMJVwm/uzZja+HdzvesErvs065+4zcu8stejq1N?=
 =?us-ascii?Q?VsmXlSy5eMLm6zCHa1qiiHINwRhlRDsk9i+7tBJBnXBT/jRMfRKxHU8pGhlb?=
 =?us-ascii?Q?iinojA05vtLNcz2Xdj0t84XoxIjq9sNaR2lpZd79RzSQp14adFNMmta2RTQB?=
 =?us-ascii?Q?Fxdp0xjpgPgmg+TL2U4VSBRRDZegPYx8YiRBYqazxR9ABK4YdDbagMk8G5qA?=
 =?us-ascii?Q?UyiI86zu2mEMcfQHWRfRkFG+VbFc8m/bWPFqYci9/xmjeeGQ8z618J5SBWCu?=
 =?us-ascii?Q?te0T7qP/H1zvEj3554ZGBuSGpAZT1d1N/yo/ai6uyCHEHj0M8oQ7beLgGP5N?=
 =?us-ascii?Q?FRdTXMqX6jN5Fan4Cr+pqeTPDNCIzg6Dwn9YmRrhqzptQ5r4ALvQWhmIXe5W?=
 =?us-ascii?Q?G3ftyQ2gf7aBN6RBc/37Ncif8YRSggQACo40mGJmaAsoUR6E32u/wGlilqBT?=
 =?us-ascii?Q?OtyQC66Wmmn2PHiW/reOEIiDdj9sRqp1HijK04jfnsAscssfUHwiIzvfCxzy?=
 =?us-ascii?Q?2Q47nGXBnmG3CqG/ZlGsbbf8TdJ49ELSwZVRwZQ2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6318a352-df96-42aa-8d94-08ddef4a78a9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 02:42:08.9507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B++VckQ+O2Zfyaj71NIOZeFtZW8gsTqacSYvnfGTJrNYcbicAEjSE1aGnK1RQvX3wZy+Y7GWMi6k3ZBOQrRP8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10693

On Mon, Sep 08, 2025 at 09:07:33PM +0800, Peng Fan wrote:
>This patchset serves as a preparing patchset for i.MX95 support.
>
>The current code logic is complicated, with mix the usage of switch-case
>and if-else.
>
>To simplify the code logic:
> Introduce struct imx_rproc_plat_ops to wrap platform start,stop,detect_mode.
> Each imx_rproc_dcfg data structure is assigned a ops pointer.
> The common imx_rproc_{start,stop}() directly invokes the plat ops, no
> need the switch-case.
> mmio/smc/scu_api ops are included.
> No functional changes.
>
>Thanks to Daniel and Frank for the help.
>
>Test on i.MX8MM for MMIO ops, i.MX8MP for SMC ops. For SCU-API ops,
>I currently not have a setup at hand, I will give a setup and test
>later, but everything should be fine, no functional changes.

Update: tested on i.MX8QM-MEK with SCU-API ops.

Thanks,
Peng
