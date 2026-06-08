Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE032E1C4E;
	Mon,  8 Jun 2026 05:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780895297; cv=fail; b=Ewo1xRIZjPAa7lPKRkY1CY06mpa0ihbSukomz548CrqcWkxuomXCGpADjBeruXnp0knkJ2mTfW24olvzpwR/OYmLEZAFZSX0vCuV+FvoCrjeDGorHlkpGxaclyznNw3F9kWux4XEQE8potJ7dXjiAiKrCrjOJD0AcXgVhe0m/C0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780895297; c=relaxed/simple;
	bh=NDzspWdlIMuQUUsJnIDxdPOKUZ0RsYzLJWVGmOiNvUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DIKi7mwWc5bzM9mjwqxV/DZy/r9EpClBodXk5m6NLMTM/iLoA7wVAJj6Z4C9KNrsH3I7UQqanByrovsbbv5aeqNAxyCROQVtqPmmoO+kV6BKk+BsYGO1R44loTzurpjQRgPVJRhqve8OxOHcEUT9lZAMpeea/sTYNHlW2Bzq7QY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FfkCkOQa; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FfkCkOQa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=coRYsrximUYbO1T9ub78T4Oc3nVyXhJg9k//riOBrijB5G9XeckR0fFSanK7ii7FrzN32Kl3etFf+jcGTVygP6+2qEzkTSP8xuyrj2n/fRQC1SVlpj8XDbcGK7oW09pJANRtfk56WZjZvmIjg6fPhxRC9neM4K7YHbqlXQCscK+351bViaDcz+QTHyKxfrc47GgPTeh8o1IfCfWv3g+8cCmG/Lfk+jIQyjX5IhTf5RF360iPE8iumsDXveUzL81KY/kqwr9+rHLxbHciIPL+5nHQT6jykCW1z4ltSI35o+Nbn/PFKvsuA5etnHPgzcmDbv9tJs7WHozkfoHXeJhoDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDeJSsHrRjQtJp6ycKol/euYbmeudI5R6jjBJIXN0KU=;
 b=RpPyRypw4RWFuQ7ersYgaJ7Z5CcgXjhN6RbgDgH1Y70u9NByBuzK61IHYogTAwvKCwWZ0HXi9vGsAU4w0rESzRv2oC/fQuamJpUKRcHou1Qytqu5TqxH15s8N3kVX9Y0pC/NGWTHsIOw3OL368D018O6zKlNvSxNhixDF/bJmknK0Tm20co5LPAlxgnUYIn4ypAvE7hMIAsqPA0M3zQ50RYKlkne2ncHC3uCuAQu4jchXbYSwn3VLUxY7f/ujQTr0hOuRefbNwT63E6Ss4s7XRmber4sigYVIRAGUxiA0G44x9fP94QOMAK2f3EPQ2SP7hyGqTWA9huqVsS7f4w4lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDeJSsHrRjQtJp6ycKol/euYbmeudI5R6jjBJIXN0KU=;
 b=FfkCkOQasyR5R0HS2MA8yNgpOsIt3CVWYD8ikYCDTrnWeWfyqBMRC05qxmBoEAez3XxUpGN8lWHG3xh1iHvd5HeIKg9u1WsIX2o/g7ZHa8ibvfvELvlb9uo6YodI+Xphix4JtQlHtBm6sm2ICr06LnMxHidd4lhj3zuBKtJvKY4wo1Pq9dy5EaWop/nyTH6D9FM3ZVDunUYJzK3E2oIsFS8a0NfvKBKJYU8vHreCid4KcKW7gqgfa6Jumj9fUSBe1O8fRAARP951Ir2ff4OPCD7yY2WRmwYwjKCaycuKdmaEGNstooym+I9vfwlUc0dVbUzM4xIB9BxUk5yxXMERBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by MI3PR04MB12439.eurprd04.prod.outlook.com (2603:10a6:290:74::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Mon, 8 Jun 2026
 05:08:13 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0092.010; Mon, 8 Jun 2026
 05:08:13 +0000
Date: Mon, 8 Jun 2026 13:11:18 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 4/9] mailbox: imx: Use channel index instead of zero
 in imx_mu_specific_rx()
Message-ID: <aiZO9rf4K9Ixzw0Q@shlinux89>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
 <20260603-imx_mbox_rproc-v2-4-a0059dc3b69a@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-imx_mbox_rproc-v2-4-a0059dc3b69a@linutronix.de>
X-ClientProxiedBy: MA0PR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::13) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|MI3PR04MB12439:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c4b697-592c-4419-a997-08dec51bf125
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|7416014|22082099003|18002099003|38350700014|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	QR/+NlHWQwf+ofq/cgCLcYHLaELCRmN54U5SLwj3jv0mXKBuX1WkU77jYun8thAhJPZZ7+ssRUbQY2Ww1DNUACXx5qQtwHPMjJrwvlu93wsmqZhTPn+MPJxWGixb/hBH+Nt6pUCFFWGXad/mnYFBlBKOUtMKEiC6nKphTxHx879zd0LL/3X54LxMEZ/E6sTtckQTT+IIq1an++GaCgDaF7PIC6oQO2CAfxJkHSSr8fIvjH2+JexvOJMXIeYmWhQizm+JpBw1tTfQlbWu7XqlKA+pkvvvfv73yLXGJ+j8Y1kR4c6dT0HcLnfzIMQiCSuAN4dB1ucmjLvB0K019gIRjIpJa4/ybb0l+fRI+as67HuxQqGlXLWkZARJz7hYcAhIoCqC4X37a5yH5o/ZTGsGdGZdrzZLYbRNr0WdjUYSdVa65z/T7kQXkSV3Z8jKpzQIFVZkxwjT6i+SYpSCc9KNM0nCgy/6bOTqJDB2P3NhD1x9vJJWXWqcrMRR8uXERm9VyxpmS7gLvVEM+g8ZrbWjeOdRGxBz4PPaYLANfbPd3D1czz9qmoUfG55CUK2QlKmbsHkndN0e6hNcxU0vyu1/p5qDntciBy+pZ4aJwwrBKke5B4lTlUXEjBWFQukzMPQ9iFoEHSp30Lly2Dx7xQ1A0l3l3jRlN+ry5E9MhGAuxqKZu/dDbm6Fo2mdso3mMoQ9HYSC7x3K9+uWd+dEZOKJyjaBt+VehBmXXZaudshC+5trK+Veif71Nn7kFPzVIHyM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(7416014)(22082099003)(18002099003)(38350700014)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cARLmjs1w+pMhLgRSmMZ1cJXBuiUDTF4am0QazfcgA+ozE/uQIj4l8sP8SRE?=
 =?us-ascii?Q?6AiW4XIGWV0NcYhTHQbyZi5mLuqSdhyhFLNgGEdey9WjX8HtCUvGv8km1LRD?=
 =?us-ascii?Q?EESA48Fmqlje3bJZcnqvAThAdaP2QR4Pe874RyxuSzf4eYPucR9uXh5jiWU0?=
 =?us-ascii?Q?oYLP+IFzEJp+YDRF7PP7JxQUc9dKyYqiIRyQzdPVjYFLRjm57GXAveH4TVZI?=
 =?us-ascii?Q?3+oLOygogDpYg+X7YttPFs8CVW0LojQWhRMcY5xNrBq1JNQhbowYBdUZ17So?=
 =?us-ascii?Q?WXkMq6sqDRnA71z8HIuLqVBv7dZi+rSLwzkFnu1ZxTUKAMGCWozEmwHpyMJU?=
 =?us-ascii?Q?bELae85014xSQfOgStVCztuhE7jdcuN5mXp/Vc9q8tCMirDAdNQUxoio4Vn9?=
 =?us-ascii?Q?ADWOagu/VPrWPZZqHYMIKjG9xQsrJpK1QOkDEbOgXUz0v75gO2HGEvb5wy5+?=
 =?us-ascii?Q?EZbFzWM4YDL+bfv9qWSS6XJ1b6Qx0FhDXx0YxaDWLJ2+UzGU8ReG6EF5GqN/?=
 =?us-ascii?Q?ukQv/RrQv/UWEhSW1ehgv5fjx8SaWm0olulgciaIeO44M2LQQ6oZcn1r3eBU?=
 =?us-ascii?Q?z7CtcRShLeA9xgh1f/nqFluukPlQymfzpu2YVUXlgOEpLumcfreHTBxyBDFk?=
 =?us-ascii?Q?UwpfvaMogjMk1JUa3yYcqyO9N35ACTjbwpRZM0SJI9imR8Cl1/C+l0IkNea9?=
 =?us-ascii?Q?81KTlbrcuJSvqtAwv9Kbr9t+GUNWMYWoJuE7AHm6MLitCoRDZmFQb6QN711Q?=
 =?us-ascii?Q?B26f5qaGaqXGy0NyODvaWHCMHeHC5T/7QsxcwglzU8kNSSaZNc9zTvsf+qI+?=
 =?us-ascii?Q?4OJ0n5nZsOFRdzf1MxiZLOhPo5vduCpvXBSyYJgeUVxAUlanpCSNdR2w4Asf?=
 =?us-ascii?Q?RybHcTri2FNQsRXa4b2mxclvyheAgSznzUv0zlRPPOLFgSy21SjeegYNUy2q?=
 =?us-ascii?Q?lKo4+F8jw/AIK5CeQLc7yOlZzo8WSbvwbPs6shXJRXY21gMJ5JO+nHnGTRTn?=
 =?us-ascii?Q?uHEb5Z18JwNYFyG6P+I4AfTAWnBG74kbB7qSi6S7okgE8D48Ywyaw9IWp3gi?=
 =?us-ascii?Q?tpr6V3MI2ijepoiW1lM2KkLr8shJjrtWi/kdItPUU6ozxbnGS32TUmA+mazQ?=
 =?us-ascii?Q?jSDlP7FElMKICIrr7tplnoHEqA9BAStss9aOvf4uHTmGccN5HxT1bxYcXhNm?=
 =?us-ascii?Q?qoXI4nSptI7vxoqJBafaymvYkyqyxxjPe39rtWKqAJ76Z3eWsQlGYngCMdD+?=
 =?us-ascii?Q?i/X2Mgtc6PDSH52u3QzSBiL666ztph9sPyAxqzlTNUTIwDu8vq0PdGfKrnIi?=
 =?us-ascii?Q?4mEVanSQUWjozk4UWm0fSbeCi0nfbZ2WWnO/rEKV5dxw74dsquuTA5z3wyFm?=
 =?us-ascii?Q?fmLti2jFZe+og4Cz3076PvJoJsp1kM2g0TT3U4tD5QJP0vYPEtIbcf5WkVik?=
 =?us-ascii?Q?ukU+lHA9e0z6oNO56VuWQjDJE4JIOkBX1HQv7TCVl6HRXeRzEsghpwHBCv4X?=
 =?us-ascii?Q?TiB4sEEYIBWXqle/zBIqtwc7qXatWGzEux4pDHu/oXAjFMBUei8Dy4BG/QV7?=
 =?us-ascii?Q?fO/AxzXylHvUSFhr/ZH+AHDO8DAKmAFE6CzW8iZ00+q3I9nZ01XHtW1nMWPd?=
 =?us-ascii?Q?wmP36jfbx0hK+m/AgQqzZ5uC8IjRGWbvHibVmKfG1IM2Mvl07WxsE0p5jjEP?=
 =?us-ascii?Q?jYW+XgD5KrT25zsMGiQ1QLd/N/rjbApRUTaA0RD1pijDLkhTb9CDVgUlIlYv?=
 =?us-ascii?Q?1FphFQ3MkQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c4b697-592c-4419-a997-08dec51bf125
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 05:08:13.6066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNBirgCJFF7bJgD/+flb+fV+VG2kTo2tte1rRUrGk/ukhKRpR2WUC6QuwpPDUBVVcknHfzBvw8/azKTCjLZM0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR04MB12439

On Wed, Jun 03, 2026 at 03:05:07PM +0200, Sebastian Andrzej Siewior wrote:
>imx_mu_specific_rx() masks channel 0 and unmasks it again at the end of
>the function. Given that at startup the channel index got unmasked it
>should do the right job.
>
>This here either unmasks the actual channel or another one but should
>have no impact given that it reverses its doing at the end.
>
>Use the channel index instead of zero.
>
>Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>---
> drivers/mailbox/imx-mailbox.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
>index 1dda1437b87f6..d1de07cc0ed62 100644
>--- a/drivers/mailbox/imx-mailbox.c
>+++ b/drivers/mailbox/imx-mailbox.c
>@@ -380,7 +380,7 @@ static int imx_mu_specific_rx(struct imx_mu_priv *priv, struct imx_mu_con_priv *
> 
> 	data = (u32 *)priv->msg;
> 
>-	imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_MU_xCR_RIEn(priv->dcfg->type, 0));
>+	imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_MU_xCR_RIEn(priv->dcfg->type, cp->idx));
> 	*data++ = imx_mu_read(priv, priv->dcfg->xRR);
> 
> 	if (priv->dcfg->type & IMX_MU_V2_S4) {
>@@ -407,7 +407,7 @@ static int imx_mu_specific_rx(struct imx_mu_priv *priv, struct imx_mu_con_priv *
> 		*data++ = imx_mu_read(priv, priv->dcfg->xRR + (i % num_rr) * 4);
> 	}
> 
>-	imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, 0));
>+	imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, cp->idx));
> 	mbox_chan_received_data(cp->chan, (void *)priv->msg);

For specific rx channel, whether it is i.MX8 SCU or i.MX ELE, actually there is
only 1 channel as of now, but it seems better to use cp->idx in case more
channels in future.

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> 
> 	return 0;
>
>-- 
>2.53.0
>
