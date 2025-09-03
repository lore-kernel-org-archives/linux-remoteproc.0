Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013057.outbound.protection.outlook.com [52.101.83.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EE02D0C66;
	Wed,  3 Sep 2025 03:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756871103; cv=fail; b=p9tZO6by6YDyk2Yp0YcNoYyVBVeISg9jvZ9JlqcsirEjbcMr914n544wnEHHVYpMsW6azKzGp1lsW4mslt5JgB7atlTTXhXQA0pfImbBfuRs/tAs0GCzUdZqhzmV9E1L4JLObeL/iHqIg2ZmlL+Ez7d+ZrCbzG12NR7fqVbRIbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756871103; c=relaxed/simple;
	bh=H54AwvH3AhW3PzEcC9qAYBGwyGMdscb/G1vJa+YUGXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QB00pS2NS8Mgbcq3gHy7AvIVDKd1neMVA4TPO442rYeBxF2GT1FksrD61lXMDW7MTj/mSz+DRL6Q36jmGruHuzQVyohAck1VmomCbHOAlRf+mEEz5aeksy0faY2hTx9SZXKssSs4reNOe0RqyZcmdjq2vqXCJVYyPkHkCWq14hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bJ2SnAyD; arc=fail smtp.client-ip=52.101.83.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bJ2SnAyD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y1LdEgBAjoaNdwaXCsZ6/AF0/ylofZZ2JvcPJTtZrj57EtF8zKlEEYuFNAwFcVIOKNV3ITTChPhQ+DvyohhNRcPoc+/WW8fePINl3kS9p32yb8zW2ez1dYtTX9/Ogj20C4veMwIE3WejYyeoAXUJuhFbjDp11mnuWs3mye4AEgm4o7GiL5LwgEH7edbbRsT6x6xiV6xbLyftLStGSx64D1xSgmVNoq0ulypj2HAEdgcSLl6N3UvrFQfQKilACAszTLexTl1X017c9tPgdDthmglKhD/IjZy70h+A6rAIhIXe0Wbq0Q80H0ZrfGKgqRtiKzbvsnQvBJ+l4+KQ0psSmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cii7xv2Pm3IouyS6Q3Wu9uoZyh0EUee75T4B4tK79ew=;
 b=UJw7+cdIQc4zxY3ZytfHDcijcT/0gCEs9/4mvQShl7CjgzQobi4qqGhLqpBr/wWr1BXljeMLqHd/flF3KoIuG9lJgS3SAr0NphJRer3bZWTynN1xtbg0etzoQsFyV+dpZOcfTOsQVwSLJFPSkzqxFbHsp3ShaEHyNXeArG+s83D21tQNgaMFsNqCx4r4eCrRNNO47Isv2nGVjaB87PVPxKXX/V5X1O41lBLUakSYvgEJY0qsxTx/KKr/EizMaiv5kiV+irGvEFvFZrGKj4TVJGIjAPO3nyaNhTSIBb6AUzx3aO900uwI+JUIi2APcEoTLewgI9w2NVExrXQpTvJCtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cii7xv2Pm3IouyS6Q3Wu9uoZyh0EUee75T4B4tK79ew=;
 b=bJ2SnAyDvAfoDUdu/S1PHfhLoEqG67LhblU5SOswd22M9L46MQVU4ZLIfo7/vnRZ4UlXh+ZVuv3hGzO94Tv6HP56IT+/Hzl32GfwoeM3yCqSUeyiE1dvpRvdPsbeX2O452Sb1ncdb5+yT/h2xaE4gCGjE/UnYAPoykuPeYLm3Ntsepw0aaFo6OejQXko+qXJNW6nF3ii11sROU7HQ7BHqJm8c7lnOI6JKpU29KnGbQLyNkSIr7S7wkU2C3LAUTpHPQazww84imYttVZV0F6C5f7tnOflltK9Vz00FATfl4qmw01CJfNiVCa14vTwt5jFPbN5MqBxfeqTWkaPi1pFqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8290.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 03:44:56 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 03:44:56 +0000
Date: Wed, 3 Sep 2025 12:56:11 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <20250903045611.GA8860@nxa18884-linux.ap.freescale.net>
References: <20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com>
 <20250821-imx95-rproc-1-v5-2-e93191dfac51@nxp.com>
 <aLHOhKpAQbVCC76-@p14s>
 <20250830125208.GA22718@nxa18884-linux.ap.freescale.net>
 <aLcdmY-gqd5cFOYc@p14s>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLcdmY-gqd5cFOYc@p14s>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8290:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b045f0a-a452-402d-31d4-08ddea9c3f86
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VjfAeVqgS1TJLYqxwVUI6KiQGjGBem8RlxcgWcgqG8/2ZbAdJpLCcLZpcvTt?=
 =?us-ascii?Q?S8GslJmGh/Pe3zean7W6wmoCLpecpww6bYCVcphlO24J2NqkIJXbibeC7xq8?=
 =?us-ascii?Q?rPIAJems6ygPEwCzDhXqkjvRF6FVB6uApiZMnVQWzJhixRSX6NA1PgtwkTGM?=
 =?us-ascii?Q?C8PnO9AzRDq8nszcnxksXntTkrsW2SVfZ9XwdRRnmx77qRXUgLs+Ay7s2M87?=
 =?us-ascii?Q?8yTflLRM1ELWx4Nz/M2tztEJfeadZdsDaVC1c5TbF3bWFR7P0JpSiHyqqGVg?=
 =?us-ascii?Q?BR4amwgakRkGDC120dmNDqmunHnUaQQoVjBHaCNoFUxcfS4S6ndW0wcQgPg+?=
 =?us-ascii?Q?2bLYKK+dMzhQoolLmlTasjp4FNhIM4fPuev+bTbdr1VRTrSFbjlg2QeeCldB?=
 =?us-ascii?Q?A9Z1BijNGN8pznWRSG1IgUAIbVOb+ePZOkzlfd21ZV85TdPqVlbwLE15ZxZd?=
 =?us-ascii?Q?HeuuXbF1CPa69TAf3XTLxHL4g2NZt+oCrkxx0ghUgknTH+A9jZorrytdmSWL?=
 =?us-ascii?Q?ZYWPBBQyc4CUTv5CS6sr8F47rvzaFiAGFIUV3cEe6ogutCzaCTBBRs6R4a4w?=
 =?us-ascii?Q?O3txUIetzsojTauDZoDR5NaY/dGP9Jy9/WHpz4jywJU/8A/2+sEFKJvl3OyL?=
 =?us-ascii?Q?ajvaDHAa/8bNSRufKmPZrI1z+alqk2HMrS/UCBNzK51xKnuhMoaJtExTF2A1?=
 =?us-ascii?Q?Zqgk+J3tOOTlL99CdGEiPuyynh8RW8XcSX4favp8StG5PQK9r+C8dB8CoELd?=
 =?us-ascii?Q?XHjbMhb9zcRrdKdXlSh06ypZ5+B3fgu4eqczvqdW8/RpPT2VUIx7sqYlKRcX?=
 =?us-ascii?Q?MJPdLjrEfot/aCX6vYmunY+tGgf7rx9db8L9hGeh1IUwMlUDvmdYWzuYg6bd?=
 =?us-ascii?Q?5v8ujsyrVSTMJhiX33xE30TZdhqoo6bxe9S+jpdo7qVo5Sw5YC/w0SKI4jRS?=
 =?us-ascii?Q?oipP6ATjhA0PLyyF/G0DgVoNWej9XT2q0K3XjBU87Kn5kCJxCHvny9VsKw7y?=
 =?us-ascii?Q?xbL++qyn+saAmMvy0T4+EfAD+1thMWieb4HFDiuwwNuMilQEot+mAzxSpmMl?=
 =?us-ascii?Q?2L/w/OKJag8uzSfyUDwXaF4Sl51wbTn8ZgKjv/kWTfgAzmcP/Gtj5pbXM65W?=
 =?us-ascii?Q?I0xllhOvljInvAa8S68rXcl38qschH6PpAooYqMYHwRmPyF5p2sSmWttKvBL?=
 =?us-ascii?Q?Nh0aWQT54X/JRg0pDuaDtUKHubqRACURekJ3K/Gk+V54qoJgGxDmog09+Q7D?=
 =?us-ascii?Q?eH+B4YHYcAEVcEuDm+oAppOQmEjUGBZ6zHsx2rcHAJjm7bKwblx3d/R8pRrF?=
 =?us-ascii?Q?ACaFS/oeJStl4v2DO2+FS9v099sUcXLwIHaR8bHeLK5Uuo7j9VACi1YU2+EM?=
 =?us-ascii?Q?awp1dIeJHB1CraqXH/zCKcWOh/WnlXvyNi+KE2Hwd+FxIpazUfmjmCb3X06x?=
 =?us-ascii?Q?S9UuhHxftOMPY33tVf0rDfct895ZUbvlR9sA9LRdRjLDKM9Fu5OgD+jaPMpA?=
 =?us-ascii?Q?LXd6xLu78e3RYq0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hYzFnU92x85JzqO5TT4E3fGmNGF6NhNsrQGka007Kf+wZrXvOUmint0+7FsD?=
 =?us-ascii?Q?FidnmF8zn8vvgQrGjwaQtFPNR+1xk/Y6ZGdp7zxOwLH694d6wwFvcCxT0JKB?=
 =?us-ascii?Q?cEbpPztAm8LaMZbwuJf9CSUpsj0erko+ZS9H8O7aY533691sQSd845GC1rr4?=
 =?us-ascii?Q?RLPLKUWfF2skOZMzBjIQn5c1i8DIbIUhoAcm0v+IzQNCjZOVv8AGhEbSuBpZ?=
 =?us-ascii?Q?FdLen4RtyQ7ixNdpowHJS4ZXnLeoRf7SMxFfYXm3z+/LxwLUeAaHVtdrBeQF?=
 =?us-ascii?Q?vI0uRzdC0/4fc0KgVyO1LGokhImz7Jy5cg9DqQYew1trDBWFhkmNsHaIQrYQ?=
 =?us-ascii?Q?cAOEbkZISYbMfKKZzbVEX85/a0X1FZeNNZdQ5dfYVuxnVtpXyeRdD4XeUWC3?=
 =?us-ascii?Q?Xej6x9ZiqtlozjgrlONZ4iGsStrePHph+pNeMS5DpIhJyCxeVhNS/Kx3JN/y?=
 =?us-ascii?Q?n456PXF48yI027MFAm3ti4/IovQmVPbqkyuT8SA/qvZ8/wdBLFa+J/ROKQ9E?=
 =?us-ascii?Q?IeJu32VlTddkR30VyCcJdVBsQL7ErbOr7BmqpPhXjSa0Ia4/S9XIFHqQ43GF?=
 =?us-ascii?Q?msTl6OiKvVFAeWSqUt/3pS4z+lzmzAYf8FwyJEd4RPIeOAEdZOx006NXBUd/?=
 =?us-ascii?Q?l50JJ6OVThq1dLIEbEb8JFvAQ6Ly2EB7+6uI6rdcC+biRQIn7VlUKJADrQld?=
 =?us-ascii?Q?0HhN0U/ZBcMc06FrdpoddCfm5sWrIPrD46ZPxQEmJtxIT9gh/hH5gOn6H7CI?=
 =?us-ascii?Q?U/dCI3R7mKyry8ZaH86k8ihWke7xIDg52lLP216SG4q71rva7BWeG+E2f2Mn?=
 =?us-ascii?Q?8q5dkJmtky492SBYCpHAZiMuLmFPcmrjO4UZUmNybaB458d9DJ5khrLlPz/W?=
 =?us-ascii?Q?3EuSaeTAeJUcw2lV/j/4ed6eXAGMPDjWWIsdt+A5aHH+1M+Ogj+yvwsdBaJx?=
 =?us-ascii?Q?lTq0LgtDxuBtcDc+CRqiYRzGJcTDiYPOsB94ZufKdoWERwJWTzi45vt1kKky?=
 =?us-ascii?Q?Ck1nw/EZm3wXlWd0yy8tuXlFCU+YvpMFQLMaodQ8jGr1WtUqYlMXaERN2Vac?=
 =?us-ascii?Q?uT85wCReWGbdERDdzYnGGQCwJUrIsWGwema7fZ3xwVGlP9zDwxw4HNKtpvMG?=
 =?us-ascii?Q?dA/5/AljA/IqPB8V72SsETmCJxB51eb8HoD6PvZUkKGHbaq5bvEC5+WowHQW?=
 =?us-ascii?Q?5yXma9n13wfmkJpJyN24LqDMqSfptBbmd/g/b/Hz8Fx/IjmPVVuYI/60RsZL?=
 =?us-ascii?Q?ZnLzhIdAluJqxTGjh8gE0VECzZid6bjE2cfhXQx4ac/QpFQQNDlDiYKqMU0D?=
 =?us-ascii?Q?5q/coU6dVeyjmj8agciJWNeXoSjSc90CWtqlEKXHLxR+5AiOypL+kN8oLV19?=
 =?us-ascii?Q?Pxyw6NSImVVPXJWh2Dvv9hEEnW0vpBh7tg+AHIMbfdlAsKoyi3XiJdanWcni?=
 =?us-ascii?Q?7p3wT+qrd6HzrvPGibgZXVUy2klVMlUjrCF6H8bENQ/DHI3pVGtteSSz8gmA?=
 =?us-ascii?Q?lVrQdYXy1Y/WtSUM4LrAwZ1JMAsjFBYFztDK1d2PuMY8ow14++g190ARdTlP?=
 =?us-ascii?Q?NDgQqZYJoHWJgTTG97GGNVw5px5jcCqgCylStl6C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b045f0a-a452-402d-31d4-08ddea9c3f86
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 03:44:56.0959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Js4UiKtKN5i/pFKUkpJEXZQRbyvIaojWFudmw7d0m8/Zz5nMwsDp5NHiI5oo4oPiHnDeORoPagT7wbfksEot7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8290

On Tue, Sep 02, 2025 at 10:38:49AM -0600, Mathieu Poirier wrote:
>On Sat, Aug 30, 2025 at 08:52:09PM +0800, Peng Fan wrote:
>> On Fri, Aug 29, 2025 at 10:00:04AM -0600, Mathieu Poirier wrote:
>> >Good day,
>> >
>> >On Thu, Aug 21, 2025 at 05:05:05PM +0800, Peng Fan wrote:
>> >> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
>> >> one Cortex-M7 core. The System Control Management Interface(SCMI)
>> >> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
>> >> Manager(SM) includes vendor extension protocols, Logical Machine
>> >> Management(LMM) protocol and CPU protocol and etc.
>> >> 
>> >> There are three cases for M7:
>> >>  (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
>> >>  (2) M7 in a separate Logical Machine that Linux can control it using
>> >>      LMM protocol
>> >>  (3) M7 runs in same Logical Machine as A55, so Linux can control it
>> >>      using CPU protocol
>> >> 
>> >> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>> >>  - Add IMX_RPROC_SM to indicate the remote core runs on a SoC that
>> >>    has System Manager.
>> >>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
>> >>    is fixed as 1 in SM firmware if M7 is in a seprate LM),
>> >>    if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
>> >>    protocol to start/stop. Otherwise, use LMM protocol to start/stop.
>> >>    Whether using CPU or LMM protocol to start/stop, the M7 status
>> >>    detection could use CPU protocol to detect started or not. So
>> >>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>> >>    status of M7.
>> >>  - For above case 1 and 2, Use SCMI_IMX_LMM_POWER_ON to detect whether
>> >>    the M7 LM is under control of A55 LM.
>> >> 
>> >> Current setup relies on pre-Linux software(U-Boot) to do
>> >> M7 TCM ECC initialization. In future, we could add the support in Linux
>> >> to decouple U-Boot and Linux.
>> >> 
>> >> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>> >> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> >> ---
>> >>  drivers/remoteproc/Kconfig     |   2 +
>> >>  drivers/remoteproc/imx_rproc.c | 123 ++++++++++++++++++++++++++++++++++++++++-
>> >>  drivers/remoteproc/imx_rproc.h |   5 ++
>> >>  3 files changed, 127 insertions(+), 3 deletions(-)
>> >> 
>> >> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>> >> index 48a0d3a69ed08057716f1e7ea950899f60bbe0cf..ee54436fea5ad08a9c198ce74d44ce7a9aa206de 100644
>> >> --- a/drivers/remoteproc/Kconfig
>> >> +++ b/drivers/remoteproc/Kconfig
>> >> @@ -27,6 +27,8 @@ config IMX_REMOTEPROC
>> >>  	tristate "i.MX remoteproc support"
>> >>  	depends on ARCH_MXC
>> >>  	depends on HAVE_ARM_SMCCC
>> >> +	depends on IMX_SCMI_CPU_DRV || !IMX_SCMI_CPU_DRV
>> >> +	depends on IMX_SCMI_LMM_DRV || !IMX_SCMI_LMM_DRV
>> >>  	select MAILBOX
>> >>  	help
>> >>  	  Say y here to support iMX's remote processors via the remote
>> >> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>> >> index a6eef0080ca9e46efe60dcb3878b9efdbdc0f08e..151b9ca34bac2dac9df0ed873f493791f2d1466e 100644
>> >> --- a/drivers/remoteproc/imx_rproc.c
>> >> +++ b/drivers/remoteproc/imx_rproc.c
>> >> @@ -8,6 +8,7 @@
>> >>  #include <linux/clk.h>
>> >>  #include <linux/err.h>
>> >>  #include <linux/firmware/imx/sci.h>
>> >> +#include <linux/firmware/imx/sm.h>
>> >>  #include <linux/interrupt.h>
>> >>  #include <linux/kernel.h>
>> >>  #include <linux/mailbox_client.h>
>> >> @@ -22,6 +23,7 @@
>> >>  #include <linux/reboot.h>
>> >>  #include <linux/regmap.h>
>> >>  #include <linux/remoteproc.h>
>> >> +#include <linux/scmi_imx_protocol.h>
>> >>  #include <linux/workqueue.h>
>> >>  
>> >>  #include "imx_rproc.h"
>> >> @@ -92,6 +94,11 @@ struct imx_rproc_mem {
>> >>  #define ATT_CORE_MASK   0xffff
>> >>  #define ATT_CORE(I)     BIT((I))
>> >>  
>> >> +/* Logical Machine Operation */
>> >> +#define IMX_RPROC_FLAGS_SM_LMM_OP	BIT(0)
>> >> +/* Linux has permission to handle the Logical Machine of remote cores */
>> >> +#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(1)
>> >> +
>> >>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
>> >>  static void imx_rproc_free_mbox(struct rproc *rproc);
>> >>  
>> >> @@ -116,6 +123,8 @@ struct imx_rproc {
>> >>  	u32				entry;		/* cpu start address */
>> >>  	u32				core_index;
>> >>  	struct dev_pm_domain_list	*pd_list;
>> >> +	/* For i.MX System Manager based systems */
>> >> +	u32				flags;
>> >>  };
>> >>  
>> >>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
>> >> @@ -394,6 +403,30 @@ static int imx_rproc_start(struct rproc *rproc)
>> >>  	case IMX_RPROC_SCU_API:
>> >>  		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
>> >>  		break;
>> >> +	case IMX_RPROC_SM:
>> >> +		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
>> >> +			if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
>> >> +				return -EACCES;
>> >> +
>> >> +			ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
>> >> +			if (ret) {
>> >> +				dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
>> >> +					dcfg->lmid, dcfg->cpuid, ret);
>> >> +			}
>> >> +
>> >> +			ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_BOOT, 0);
>> >> +			if (ret)
>> >> +				dev_err(dev, "Failed to boot lmm(%d): %d\n", ret, dcfg->lmid);
>> >> +		} else {
>> >> +			ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
>> >> +			if (ret) {
>> >> +				dev_err(dev, "Failed to set reset vector cpuid(%u): %d\n",
>> >> +					dcfg->cpuid, ret);
>> >> +			}
>> >> +
>> >> +			ret = scmi_imx_cpu_start(dcfg->cpuid, true);
>> >> +		}
>> >> +		break;
>> >>  	default:
>> >>  		return -EOPNOTSUPP;
>> >>  	}
>> >> @@ -436,6 +469,16 @@ static int imx_rproc_stop(struct rproc *rproc)
>> >>  	case IMX_RPROC_SCU_API:
>> >>  		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
>> >>  		break;
>> >> +	case IMX_RPROC_SM:
>> >> +		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
>> >> +			if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL)
>> >> +				ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
>> >> +			else
>> >> +				ret = -EACCES;
>> >> +		} else {
>> >> +			ret = scmi_imx_cpu_start(dcfg->cpuid, false);
>> >> +		}
>> >> +		break;
>> >>  	default:
>> >>  		return -EOPNOTSUPP;
>> >>  	}
>> >> @@ -546,10 +589,48 @@ static int imx_rproc_mem_release(struct rproc *rproc,
>> >>  	return 0;
>> >>  }
>> >>  
>> >> +static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
>> >> +{
>> >> +	struct imx_rproc *priv = rproc->priv;
>> >> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>> >> +	int ret;
>> >> +
>> >> +	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP))
>> >> +		return 0;
>> >> +
>> >> +	/*
>> >> +	 * Power on the Logical Machine to make sure TCM is available.
>> >> +	 * Also serve as permission check. If in different Logical
>> >> +	 * Machine, and linux has permission to handle the Logical
>> >> +	 * Machine, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
>> >> +	 */
>> >> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
>> >> +	if (ret == 0) {
>> >> +		dev_info(priv->dev, "lmm(%d) powered on\n", dcfg->lmid);
>> >> +		priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
>> >
>> >Why is setting this flag needed?  The check that is done on it in
>> >imx_rproc_{start|stop} should be done here.  If there is an error then we don't
>> >move forward.
>> 
>> The flag is to indicate M7 LM could be controlled by Linux LM(to save SCMI
>> calls. without this flag, heavy SCMI calls will be runs into). The reason
>> on why set it here:
>> The prepare function will be invoked in two path: rproc_attach and rproc_fw_boot.
>> When M7 LM works in detached state and not under control of Linux LM, rproc_stop
>> could still be invoked, so we need to avoid Linux runs into scmi calls to
>> stop M7 LM(even if scmi firmware will return -EACCESS, but with a flag, we could
>> save a SCMI call), so there is a check in imx_rproc_stop and this is why
>> we need a flag there.
>> 
>> The flag check in start might be redundant, but to keep safe, I still keep
>> it there.
>
>One of the (many) problem I see with this patch is that there is no
>IMX_RPROC_FLAGS_SM_CPU_OP to complement IMX_RPROC_FLAGS_SM_LMM_OP in
>imx_rproc_detect_mode(), leading to if/else statements that are hard to follow.

There are only two methods as written in commit log.
one is LMM_OP, the other is CPU_OP

>
>In imx_rproc_sm_lmm_prepare(), if scmi_imx_lmm_operation() is successful, return
>0 immediately.  If -EACCESS the LMM method is unavailable in both normal and
>detached mode, so priv->flags &= ~IMX_RPROC_FLAGS_SM_LMM_OP.

No. LMM in avaiable in normal and detach mode. I have written in commit log,
There are three cases for M7:
 (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
 (2) M7 in a separate Logical Machine that Linux can control it using
     LMM protocol
 (3) M7 runs in same Logical Machine as A55, so Linux can control it
     using CPU protocol

>
>The main takeaway here is that the code introduced by this patch is difficult to
>understand and maintain.  I suggest you find a way to make things simpler.

You asked Daniel to help review this patchset. Daniel and Frank both help
reviewed this patchset and gave R-b. 

You also said this patchset "looks fine to you" Jul 21 [1].

Now you overturn these and say "find a way to make things simpler.
What's the point to ask my colleague to review?  What should I do,
redesign the patchset according to "make things simpler"?

Please give detailed suggestions, but not a general comment.

[1] https://lore.kernel.org/all/CANLsYkwZz4xLOG25D6S-AEGFeUBWwyp1=ytmu2q90NyEpkoX9g@mail.gmail.com/

Thanks,
Peng
>
