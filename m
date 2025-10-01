Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013011.outbound.protection.outlook.com [52.101.83.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68670246BB9;
	Wed,  1 Oct 2025 01:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759283188; cv=fail; b=m5MCUEivCHbxRG7/ditGaljMtlpBpQnV5MdsYD5d6Utbki+Z1PerHtGpqwL8PbQiH6IjDkwzL8CO9H8LKSrHnT8c89ZkVX0JSlxMeCh5896Rxalswt5si2KqyTnsmyOixGBxNL5eg5iSAiDijqeLU6AIzOKPAY7KeZ0GmKI3ixE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759283188; c=relaxed/simple;
	bh=oDQDPD+O6AILklOfeAq/alq83VifZD9IDFujrRHsOQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t0nl8h6aSOhRh2EaZ92OdDGoKZkx8CtayWRpaD7LZRAfxQV+eZUD6JDoA4r4AUtC2ryDr/fn1F1BdgyouM6Zs/zFft/N3cAnd8w8g9Tq3STDjN+G3u5XxpN5fTUHdw2k+4hsi5QyL5jVcSlJ13cPpMEnCVB4umFNr1HYbfAqYwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bvKgbwyi; arc=fail smtp.client-ip=52.101.83.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bvKgbwyi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omerdC7KEG+OBL14Pxup1c9CMBSBdWFWc5TRKR334EQ4ck/ztwJMp4yvsslK0ZiWAQ7V9XiGDgbsCLK+AzG5TRmWgM32KeuuFyauVTAKm8vBrniBCmIY0if/kcKCfnsPvYG/e6u8LR/yWgvIyquN0yzdMPIkjfJxWYqtVqv+w94dNhIauwmvhGfE9+3S/gZY6HqUhxoHNvcZTx+1m9tBaWpkD1tK8TjCJW2A7ny78Ggi85bdUp7WJtzmbPTx/MaQrmhqWTjOM6V2aWxWI/MirgxN6UAyNvXPICf2KB5nANzb3yfnZ+vfvSFFyt7MTbiSvHUdzQPs1oEFKSmCo93pfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELLJwY7qBs06evhl1hfe3mEo18EswEg/SsezvsXvqD8=;
 b=M6hcmxSMlt9dPSP8RoifQGYel4zRNHNRD+YrdticdNF6NnmSRyZGDxWQKPIv5J5v9anwnArWSzbhrOeHKnFo4hkSgHfZg63KY2jQL6VgVIchAIIjVelto467op+m4WmanltUGdC9A4tX0L7DJL2QlCODqOJKkltT7lPArnyIZ+zXx3zpN79Vf/vYVe36xVd6Er4G33+cXIkebJ9s8cqSJlncuN+UyAwyYM6hkW0yul9akRcCckJfnLxtJNpu5VvwCbTfdf0ZBqK/xCUeqj8s8kzgtj9SYHQEepOsqaiHMjoIimD0f1P98Xfz9WiQbvZny7ZBOsv4VQFXB2he0BSqxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELLJwY7qBs06evhl1hfe3mEo18EswEg/SsezvsXvqD8=;
 b=bvKgbwyiE3hmA9WYbWq1C2yvux8c+zID3TOG6YamL0MXkBxubkVzBcEroIPP4xvCF+TL9KFgOAO74BXB1Xrs7OEB4WG+kM0PaZHuMI6a8YEBjBTf1IfVgc2SWeEI+9zWQXeYRVPNVQdRp1ava4EG6HiBFszOIm+VIjCNg2vyS00v6qfs3V/bw2XnQ0Zj0kXepDj9FB1LyexXoUc2E+rVfi4AZW2E1RRdy1TTgO/Do8RgP0oeFy8AIKZltCpJSbmvAgpJz+R7LOqtqlA01PVkZqyG56wH5Pl+MvUg2lLdsfGKgK8+WmsaXHjIDNc7cV4gHYsKHJaCCvNBrBrmC3boYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AM9PR04MB8437.eurprd04.prod.outlook.com (2603:10a6:20b:3dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 01:46:23 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9182.013; Wed, 1 Oct 2025
 01:46:23 +0000
Date: Wed, 1 Oct 2025 10:58:17 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, andersson@kernel.org,
	baolin.wang@linux.alibaba.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, florian.fainelli@broadcom.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: hwlock:  Adding brcmstb-hwspinlock
 support
Message-ID: <20251001025817.GB23170@nxa18884-linux.ap.freescale.net>
References: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
 <20250929200628.3699525-2-kamal.dasu@broadcom.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929200628.3699525-2-kamal.dasu@broadcom.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::10) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AM9PR04MB8437:EE_
X-MS-Office365-Filtering-Correlation-Id: ae37b3cd-2f79-4b66-d210-08de008c5350
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jRSRAfyuYz2xl93VLnQI2/2v5uJztrWFWEMVdZU6eWxhkyyFiiEFEaUiQ9Wo?=
 =?us-ascii?Q?97z1/gLEWcj6hTJFJ+BoVXg4Y0zLUd4GDpoiDwaGIRkV2zEKbfLfI2FLtXPE?=
 =?us-ascii?Q?RCSxNn0+/kEnznxeMY+1IBNgLkdbiB+TEbjhyHnLzYmC5jW+pD5+8uJdww7N?=
 =?us-ascii?Q?f7g5jj8RCGdhRlprVyWPGokaL1uNTCXbMsUpVqBEL7k67Ki5yFoF0tYorHMB?=
 =?us-ascii?Q?b+WBzAd2zE3PoqEyqO4w59cHPqJyIdcIqiZFUUZ1tbee4+v3hQc2St9K3PSU?=
 =?us-ascii?Q?vOu2mytzo75JxuJLQdr8lkqOCz769kggaqOBzrzHCrEfKmN59VTrk8apVCjU?=
 =?us-ascii?Q?7OBys44mMWkQpaWb42Lg7HC+bG4VKgxw8mSXB99P5Kla8/5TQBT1JgwcV8nE?=
 =?us-ascii?Q?zv18hDpNCaHVQLOzUlNU6S5O70xRYkLhi0mzlDH+BGXsvpfKQgd3eLJy+G00?=
 =?us-ascii?Q?EzXva24gcTn7q1Woi4hb6W0W2W1sB4pWEaJtp9ZpVMKax2RnBsWNKkw5t/x+?=
 =?us-ascii?Q?AzpW8BgQ0E0xlG7pjuY38vKYvHSR4HHwbZSqJmVCcBfQfjEa6oeI5lmg4QWI?=
 =?us-ascii?Q?ZvBkwXL/dmLV1TT76x+GgJKKZe6sOwTUrT1DzTXZWhva0K0iZmmhW/9fcKwP?=
 =?us-ascii?Q?G2492eKjn4bzTFPfRSnxFwffTmvwDTVuwGZ4gQgVcrQwNxjqJPcN2Ld1Bxqc?=
 =?us-ascii?Q?dcjSph3lQ0mfERLqmCxUD/IfGgqJYyS+XCCv5Re4CCKOu+mrY+wR/9mk7pQ2?=
 =?us-ascii?Q?VnL8Z+OoiU2QvyRySRjmELzc2FaeETY3mb16TO/AIsMeZhR6yOn+nMb1sAXu?=
 =?us-ascii?Q?zDd8c7pywwHCH4M1dcJURGfXWRUElkBawb4v9g8fot9L3NtaJylH512VktB0?=
 =?us-ascii?Q?je42924eHUXxRplemZtbY6Hx0x7q0mU1owUxHWUpfchDahyaCh2GzTKseYxX?=
 =?us-ascii?Q?vxARy1xG4JyUDDYsiQiTnchOyYWRgWzLFd8LXyWNqpJPdxFilhIbagAhnJl7?=
 =?us-ascii?Q?ITzvlhWjF4etLx6/F4xJmK3IoS5apDX2NhAhAdslJlJOkj5ESEhSiie2ZHDl?=
 =?us-ascii?Q?RQ4nKDKFeDenpnwbjRphALSaLgpE7+C7iive51L72vFfK+1j3egWGs5re9wD?=
 =?us-ascii?Q?tjP3GYhClW5GQRwVqC6Gx6p/WoChrndps2gpLtVOeKcJ3/u+Qso7f4FW+lvb?=
 =?us-ascii?Q?k59BouMGoFKbYU5GJlHz+0bKsMUMSmbSvsHcxixUyqsgxUgxKkvRQ2MMz1K+?=
 =?us-ascii?Q?eTZu2HrJ4hAzT4YYDpInXfqlVnRG6t0bFtAk2igbSSLJUgIRZtCFiEl7yrN9?=
 =?us-ascii?Q?jbbHB//sYbslozJXWU72oSnX/EJLc4RrDdu4UGwHDofr8pzu1Tu5UUAWKRte?=
 =?us-ascii?Q?kmXp8gSwz1CcxsxNbg6lwgiZbsK70HxmJxYDguQQ2hzhJC1+0sB9bRi5vFGl?=
 =?us-ascii?Q?CeTvo0xnec2WtlVHpml+oNNtMLr/cmlh5MkwD6aZeznC91AO7JCFdoqiHATq?=
 =?us-ascii?Q?tfxgykjzDwuZDsd20FWoSwGynz/X4nWw+ZYG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LlKAw7/dgG8BlVFUWKqe7reQdb11LkXtp4v78galzmP8rykp2al2DugwwRsQ?=
 =?us-ascii?Q?nDgppdhK+XpA1p38M+v8HTIz91UwE2t4LTmwnfFsdIYNIeGCtB7DDd2s+BFR?=
 =?us-ascii?Q?9xQSUPd91VFRrEyH+XGIkJZcI8t4iinLGaW2SusrhH7MTjPCgZKEAOldgzLg?=
 =?us-ascii?Q?7TZ7PB4jEb+TU72GlWhodjXfwPrkC6P6AcwYJ49klFZf0Ncm6/P6XeOmqiTw?=
 =?us-ascii?Q?Kx2nSi5q1dBSNbStn8rk8VV+fMETz2lkqst+TR+4+YqTY4O7dXMpRUaDlQRt?=
 =?us-ascii?Q?6yZg3i/YiK9OzywJ/d+4LxDtJ8DQqhiGElvLt5r9+cMrj2Sv8ITVRnprJjii?=
 =?us-ascii?Q?WhY88Md9xd+SDSqLNuLtR/3PBTd5qokX+TTwvH/q+nut4+SKEg7xqlJHdO7X?=
 =?us-ascii?Q?8BBw3hbJYILZ0CQ8Pqtc3pMJUa4IgFh6MraSlCJ17Arvnp5sRmJqYNwlpWqk?=
 =?us-ascii?Q?sWlc9aog9exmYXb8Bt/PMfsebl63MCUQ9QIPmZUjHugKjv11G6ynTS/aiugT?=
 =?us-ascii?Q?EXOE52XwjauZ0jTvCTVVAgop4aQ2DIcrAemc9wmbnxrPNKetLZDSezCHjGL6?=
 =?us-ascii?Q?Z0zxOMnoB5+7D58VNLVHHWXkJmt8MHhPSdVQPgYHEvrV/Pm//xfvEX1xnEsL?=
 =?us-ascii?Q?UavwZY2Laous63qYIDC+zpymX4j+KZmqqZu1jsAmeGqZv4Y7HZVZN8r78v/V?=
 =?us-ascii?Q?MgzyRfJwNIdhKYGlFThd+z2BtwMaNsrtDz/ljkjkPEOtQTlRk9dq5SH7BXg5?=
 =?us-ascii?Q?CjFJkRkr0RlbTFkzad0EyVbJ84PAhZuPKjFWZ0632eIC2dpX6Nr9hDpDSaTw?=
 =?us-ascii?Q?W0QU/wVks8lyo/bUV7qwVZRWCZybbpWOZiVQFUJ+xbDDjLT4LczZMLzA/n/n?=
 =?us-ascii?Q?6zFbM2TVp8F3y7tglx1Vr4lROv83v/Vh26oQOlmykIT42T7FYzZ2i8wt5wHS?=
 =?us-ascii?Q?W6sGtc/jCC1hRCxGOTeV8R7fsUfSc8wTAdQn94zq8TpgEYUgCLyOQialvPrn?=
 =?us-ascii?Q?yn2h7bE9C/OfyLwkSaqDFWfAzz1ua74QeMdcT+tZAwNalbpcWDQ0Y0o4Csjz?=
 =?us-ascii?Q?+GbzQn3VR+IQYAmpFYWY2jk0kRiVMYhN4038WFgkU+dRBqtlhJu1GpbcRgtY?=
 =?us-ascii?Q?568ikFo1JMmlcmF+n5k4G8B0nKW/jFSXOnHPtkOZ0kOlufrkWedm0tuiUz6N?=
 =?us-ascii?Q?G6kRM9eW63wHgB2/gBJX67OWu1nBq0Y6QOPgH1TmLzNq3b7BlrwUO2rNDlYh?=
 =?us-ascii?Q?2S1ddbF0orxZ+lIclOtUccouP96Y5a3uMosQ48GSdSmZh1QgwK03UDLhRTk1?=
 =?us-ascii?Q?0Pwcpqd/yCo2QpFUG1Z8jsi8Hye1SiMNNup/AQ/+yCQeUMylkZBPMeGOl1BA?=
 =?us-ascii?Q?QrQjAxOJpCOmFuMLlfzRC/Hw5kUZqHYa+FchvoNyPquTtSy/jwkXI/4ulMIw?=
 =?us-ascii?Q?MvXTgPGJmN9e4QhfxvV3f0Gqop/5k0+1PAocP3DzuZANNA2tg6wtEA17tG8N?=
 =?us-ascii?Q?Ubp3Gn4r8VwiXdYVdXgJzlw2014t+a6PPX1Mji4Y1/USRisLyOVeLaopCPDB?=
 =?us-ascii?Q?WiyDDIuoPDyXEz8L+nyb6ju3yyAPmk+VMcrGIZih?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae37b3cd-2f79-4b66-d210-08de008c5350
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 01:46:22.9956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9y3BMrHk+BnBCrWEN7AdG+EoYy6jIDhcr5dkGz2mkjG8oEzlDOx8VPV5T1ZcMsg2xqe8A0Q0C9iUKIgBO/HcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8437

On Mon, Sep 29, 2025 at 04:06:24PM -0400, Kamal Dasu wrote:
>Adding brcmstb-hwspinlock bindings.
>
>Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
>---
> .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 36 +++++++++++++++++++
> 1 file changed, 36 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
>
>+  - |
>+    hwlock@8404038 {
>+        compatible = "brcm,brcmstb-hwspinlock";
>+        reg = <0x8404038 0x40>;

Just have a question:
the base is not 64KB aligned, so just want to know is this module part of
the other ip block?

Thanks,
Peng

>+        #hwlock-cells = <1>;
>+    };
>+
>-- 
>2.34.1
>
