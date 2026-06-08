Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011020.outbound.protection.outlook.com [40.107.130.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952BA3254A8;
	Mon,  8 Jun 2026 05:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780896590; cv=fail; b=SNY1I8sMlpRpr1WgcsBbx4VNmh6oYfRn85eirGGD/nSkihmRFsBRhYz1AnGI9jiqdKWI2uulI14ismOwiBuTrEcALtGuzqG/+SGRSvgLrzVUzk6uUuYzCADrpWqzUpdA1Od+LtnH4XvkHIjPHy8YHFWcz89t0Kcsocvd66u82d0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780896590; c=relaxed/simple;
	bh=4KiGY+1Gll9DPqzKXvKFmLFL0EV44t48Y58sCaiCeTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NuCQLRe/oPR2Wgy8stGvDoF7Ea3QhrM81TLYRPQ9WFuyM1mJtAAWi9OyWItpCcv/n7FrABjmwzcZ2D18bPW5JdKDLxfsyGPPobaIEI6FihrvkW3undgK5lAZ4dk5CP0b9OX3UGTu2ts/bJ8air1ObqNcLYSRj8bSGcklYnymUkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bCu9CkRn; arc=fail smtp.client-ip=40.107.130.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bCu9CkRn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SeBZ5hgszy5IgU71XAn9Ram24RpnHjNtS8dkv6AF01XQQLW+9QFuH0obfNB7f8nrcveE/wUmOMtsjfOoX608icstS5l1o/7RKvhxBnLraI7GHYg+Cx1FIMypdteDii6zA+kjZCV8Su0l0oe0nQbQx4sctIpjElCOhSOEN9y3G5/Tg2v/uxdReka3sx7B06vVrIUGr2vjvzf+lTIxautxAWzEmWD7OgflL1NFmtMXc5DU3GOZtjSwBbjBRQhj4anQhAN9PeBaMnrlc3tn3jVofJGypSP17PoqntyIT+B56cnOIu8r6eIdP3SWkOKZsTx2FvUw3R0cU9gGrtVDRQO0Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUhAuLoGrHSlYgqGh9alravQQWfpMZJjZW+NI04pdJM=;
 b=PYNIlpFt1GTNw7knf7AUH5TKYNJOJMdP+w15bTTNafFBGuwg6Lv30Vqo15A5VrMF+FTGVHIQg5KpaiTfHLXyBPDCR/1pQLvc1Tc3C+0NLTlHZNBB7Gzz5DhM2cj8vHINi+9fJxCT052l/OXuVjByhhPEvvmbd/TOCHdKzt5uazw1XSA0WFitDhgpU6JCto7klM+FN6Y16TAV5mTBvnc8HK84Km33Ly9INHo1f5bibB5wSaoYpVOr3J2qnCfiWONrpq6T20GzP4rKgyqg/sGSx0i3QWDG62wZkRp0+uzAmMyOsetJ+MVIq+Tljb7HBImsellBJJ0ZqwC0HIH0Fa0Z6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUhAuLoGrHSlYgqGh9alravQQWfpMZJjZW+NI04pdJM=;
 b=bCu9CkRn6h0t+iCOJuL31ekwH/FEvkcvT+3QJUEYCfvobN9/fovGhbCdt4ad7v+9UzGDiX8M3BXNT/IZTgKcOU5lAWCDs+wnWerDkaYA14rTq99D0vipXzSt5dEGlhiiy3D7DCh54lTzr4cBSVZregB2nhB3WEOlr0y9LTjXEevkFfJS3yDa6V2ZyGsRlalr7hOs83Sw6GqZUpV2ceW23SHbbg54BP5r7m7T9fy15GNjar8Nx5CfZfcLR8ezWcnfmwCYWOfxcWzhmKwDKpk33HgctyGLr1j3ZLiY+yfTyxzDWXubrwit6TrcZpFHYyELW4Vl4P5DiGLC8CI3XI9veg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by AM8PR04MB7315.eurprd04.prod.outlook.com (2603:10a6:20b:1d4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 05:29:44 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0092.010; Mon, 8 Jun 2026
 05:29:44 +0000
Date: Mon, 8 Jun 2026 13:32:49 +0800
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
Subject: Re: [PATCH v2 5/9] mailbox: imx: Start splitting the IRQ handler in
 primary and threaded handler
Message-ID: <aiZUAdrwhFn63a2a@shlinux89>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
 <20260603-imx_mbox_rproc-v2-5-a0059dc3b69a@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-imx_mbox_rproc-v2-5-a0059dc3b69a@linutronix.de>
X-ClientProxiedBy: SG2P153CA0021.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::8)
 To MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|AM8PR04MB7315:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ded7d41-b951-4eee-aa74-08dec51ef2aa
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|52116014|7416014|376014|366016|6133799003|22082099003|18002099003|38350700014|56012099006|11063799006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info:
	ID5AxEcIPWE8Ppb4XH1pvgwOPggDYpnxZmlsv6d0E936prc2E6DZe3cPe1YoMpREprMZVS2VAYK43s1XQeijcGpTYqtXJxEMd9dobM7wZ8NT9H0pe20YQJNriD6tm3ca3kNy76G91Fihdol3Vpqd8IuRWZCRM48ByxY+7SB4u0VIcUCDEsRoHFdM3y7qxdnOPHJD+Rzvq4sfmuuXiKT3yyarSXgGygftNfO96Jd5CvIkb4/xcUjD4MiuzOAcdVck/Z17Pc/OZBqfH2Eje6ub/LxUhuem0kqs92qu4nb3YFRpU1cHw50EDST+IdFXRBdoXlWZ3UFouFzznEk0oECF3uCDCiBuxdZrAzS2rSjLGU/u0rVmVPhkcaa6vFMvFtWUiv05dHJiAEkn9jLS/Chv18iwXXyqknoeSzEeMZmIKAoYqyvhhhto+O2H63637GNj9s6+jn3blxQuinKTYeUH77J3sNzSx8tg7oAqhIK10OFRi9WhRlhrRNo0zqe/YnCuaHUldoRKyh+50rK056SoDCNwS9s66tochpnoX1hy46uJtjTEXSQQD1tuiC+OFAdL4WvewzOnndyCPLzmtblegM7qsBOgXbaMsCSuoriuI+W/weO5jYEo/Fh+5lv/74YZwSfCLOJhKee5MhBqdSoBxBHeUdNRD46jAOWgGtL5lQtxAu6QUZIQJoQreD/lssURJKWdQvNu0R6CB9gtI0l3oCgZrxo+HdCUJuF4Ng97g+dbkOB+1BLiLEBt2iwgv8qO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(7416014)(376014)(366016)(6133799003)(22082099003)(18002099003)(38350700014)(56012099006)(11063799006)(5023799004)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7iG4crSgKMY6BWOrN0QLpgrLhybHmqypU8lGz/F4acg8SJ2fv0C0AWuaLhN9?=
 =?us-ascii?Q?CTYRRt0ciDgcKklXpfoGAT/0z7HxmR2+7Ois0wQVbvOesexWKLcxRdhPfAdB?=
 =?us-ascii?Q?yCK/dHpm8w+1SL77PzFgzMGJ7RP84Ritee1nOxfY+zXiOOTHgYFv3QyClbIu?=
 =?us-ascii?Q?M2Jz7IESkFkhfizQRlBwb1+l4OxoGjaeM4ON6xxndvR7Qniha5xkMJWsPstJ?=
 =?us-ascii?Q?4DA6Lr3dJPA8fyDNtyTAOVDu7WaDrmFDT99sMivvbFxMkAQbZ2NmVyjxUZwL?=
 =?us-ascii?Q?KdSx9PYFMjCCYgWDP3bs4zwpwQAYZzYQXaDWQaBxSN2fUyN9LpaDLKPlYIgo?=
 =?us-ascii?Q?Zadb0/1wUYf6+cgMdUySS0R1Cvu+Td0O0qsMvQxLR8Veke3fFU9HEf0tLQyU?=
 =?us-ascii?Q?h5HUURBgb/9hHmuRd/N+CcuioD0ZFGy4V8+mQSRCubcIVf1h020avXvmMJ21?=
 =?us-ascii?Q?klsWTAu4i8tdEpe4w8rzXkLFBiqVUjPUrEUNzTNC9pflHFpjFKn9MyShwe2R?=
 =?us-ascii?Q?Uf7dgxR/nHgJFsp106yWvmXC8EviJygtSc1pvzUheYou2W6g6+vUdSFU4v4m?=
 =?us-ascii?Q?rywA73dYN6ZNWt0bB8rYiZ3kzZIZ1TNr6KZD2zolD0rzngpHlcWFQm4M6j5r?=
 =?us-ascii?Q?ioGvgoA0opzkSw050uBC1zPQ5v3dQUMfaPOJO8KgL7pDbIPFarHOCXOI24tg?=
 =?us-ascii?Q?SWxO93Fl+Xxn7fXyPi450Uif7UcoQv72GWM2AtWD4LIIoVbZt2xZsVDgGV1k?=
 =?us-ascii?Q?ZzSMmnNlvn3SEyieud3v34QHmABM4GGAMrx6D0WrgCAt65705aEn+IEhKuDn?=
 =?us-ascii?Q?M3ojhV7ROio5BunZfLpABn7RyIFal893g8wR+scc374OHIOvjcQ9ftuL8EXO?=
 =?us-ascii?Q?VBgqwpoi5BUeGZjRjfkvYVG4dBm+i2oPHqBOffES0iPGnB+BD19n7bIzoKiD?=
 =?us-ascii?Q?hpS6OAVEbl+iWmwhK+wExgGatHOSxrDxHzVkdiT6qr1m70mtN/cgp1mK/Dlo?=
 =?us-ascii?Q?WnKnQTNv8IUImrfv9Z/ry1k9DlVf7V/OnyfYnQDr2E+YYWQHuGSkqk0QuYla?=
 =?us-ascii?Q?c/qd4owtReW1aiaTV54PDAyVllXs9T/3XkvJdS7vvgvSkGyfxFsheCPAfYmF?=
 =?us-ascii?Q?3cL3yHHQLoIWtpyqZ5yNS3b+f9YVKw7uCrpzlgppRpfgNZ9hFY7bHsY/uvag?=
 =?us-ascii?Q?Xy2N9UgVF3pA76y/cxFPnQDOOPvSn9M/Och/+L8tyJbw7Xk9q1wz3WbkaEhN?=
 =?us-ascii?Q?LcbMk4IvkrQw1RMG2MG6wyMjwzGXEI0RBni902z7wpFESt+OItIB4uM1HpiY?=
 =?us-ascii?Q?GrQYT6t3Bs6sJXTcE65du1cZuKPpyfFuu3uQotQSuuXcnHqJrd35EON67X3P?=
 =?us-ascii?Q?UQitiTjJMKJd9fqbIVnSuU1Qg4L4bPpu2kcIKZoo5epbmxLHRRzHN/Hxkf4Q?=
 =?us-ascii?Q?pJZMDCM5wmAa8PkaBTRukr42hr3RR9BXDxGQGrU8q2tBvizOWcJFmPybLwVl?=
 =?us-ascii?Q?Mlgpubpr9rN47M1l1Z7KRqVPR24QhaMx0KBi2R/Te1F4OJt+UX6OlqjOPnn1?=
 =?us-ascii?Q?nOG9+8dc+OFNatA5hgRBCqIt5Mu9MbKKVknls/uW8BcmZse1vVkB/T+lZOK7?=
 =?us-ascii?Q?pQ17G+6JJGlBjv06OP5uZWaQQAYX1gR6vinXZJmDNr9ESW0F0nScrbCtKAOa?=
 =?us-ascii?Q?bDWYZZ4fRAs2WEcDrdXYVeITuUhP1rFMMDzYNbPRiz5YVhBNR2Io+05Nemoy?=
 =?us-ascii?Q?kpzoP7Vzjg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ded7d41-b951-4eee-aa74-08dec51ef2aa
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 05:29:44.5051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IbiZtCJtVUx4gBSMMXg9sSaSPLqU6/XMCwt8111yWNrDc9hwgJaP4QqIRJUQ2hIo1/PGc27w4ul0hrq89tSgbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7315

On Wed, Jun 03, 2026 at 03:05:08PM +0200, Sebastian Andrzej Siewior wrote:
>Split the mailbox irq handling into a primary handler (imx_mu_isr()) and
>a threaded handler (imx_mu_isr_th()). The primary handler masks the
>interrupt event so the threaded handler can run without raising the
>interrupt again. The threaded handler can invoke the actuall callback in
>preemtible context.
>
>As a first step, prepare the logic and move TX handling part.
>
>Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>---
> drivers/mailbox/imx-mailbox.c | 33 ++++++++++++++++++++++++++++++---
> 1 file changed, 30 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
>index d1de07cc0ed62..006aa76b74b62 100644
>--- a/drivers/mailbox/imx-mailbox.c
>+++ b/drivers/mailbox/imx-mailbox.c
>@@ -81,6 +81,7 @@ struct imx_mu_con_priv {
> 	struct mbox_chan	*chan;
> 	struct work_struct 	txdb_work;
> 	bool			shutdown;
>+	bool			pending;
> };
> 
> struct imx_mu_priv {
>@@ -539,11 +540,35 @@ static void imx_mu_txdb_work(struct work_struct *t)
> 	mbox_chan_txdone(cp->chan, 0);
> }
> 
>+static irqreturn_t imx_mu_isr_th(int irq, void *p)
>+{
>+	struct mbox_chan *chan = p;
>+	struct imx_mu_priv *priv = to_imx_mu_priv(chan->mbox);
>+	struct imx_mu_con_priv *cp = chan->con_priv;
>+
>+	if (!cp->pending)
>+		return IRQ_NONE;

Is there a chance that cp->pending could be false here?

Regards
Peng

>+
>+	switch (cp->type) {
>+	case IMX_MU_TYPE_TX:
>+		cp->pending = false;
>+		mbox_chan_txdone(chan, 0);
>+		break;
>+
>+	default:
>+		dev_warn_ratelimited(priv->dev, "Unhandled channel type %d\n",
>+				     cp->type);
>+		return IRQ_NONE;
>+	}
>+	return IRQ_HANDLED;
>+}
>+
> static irqreturn_t imx_mu_isr(int irq, void *p)
> {
> 	struct mbox_chan *chan = p;
> 	struct imx_mu_priv *priv = to_imx_mu_priv(chan->mbox);
> 	struct imx_mu_con_priv *cp = chan->con_priv;
>+	irqreturn_t ret = IRQ_HANDLED;
> 	u32 val, ctrl;
> 
> 	switch (cp->type) {
>@@ -579,7 +604,8 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
> 	if ((val == IMX_MU_xSR_TEn(priv->dcfg->type, cp->idx)) &&
> 	    (cp->type == IMX_MU_TYPE_TX)) {
> 		imx_mu_xcr_rmw(priv, IMX_MU_TCR, 0, IMX_MU_xCR_TIEn(priv->dcfg->type, cp->idx));
>-		mbox_chan_txdone(chan, 0);
>+		cp->pending = true;
>+		ret = IRQ_WAKE_THREAD;
> 	} else if ((val == IMX_MU_xSR_RFn(priv->dcfg->type, cp->idx)) &&
> 		   (cp->type == IMX_MU_TYPE_RX)) {
> 		priv->dcfg->rx(priv, cp);
>@@ -594,7 +620,7 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
> 	if (priv->suspend)
> 		pm_system_wakeup();
> 
>-	return IRQ_HANDLED;
>+	return ret;
> }
> 
> static int imx_mu_send_data(struct mbox_chan *chan, void *data)
>@@ -629,7 +655,8 @@ static int imx_mu_startup(struct mbox_chan *chan)
> 	if (!(priv->dcfg->type & IMX_MU_V2_IRQ))
> 		irq_flag |= IRQF_SHARED;
> 
>-	ret = request_irq(priv->irq[cp->type], imx_mu_isr, irq_flag, cp->irq_desc, chan);
>+	ret = request_threaded_irq(priv->irq[cp->type], imx_mu_isr, imx_mu_isr_th,
>+				   irq_flag, cp->irq_desc, chan);
> 	if (ret) {
> 		dev_err(priv->dev, "Unable to acquire IRQ %d\n", priv->irq[cp->type]);
> 		return ret;
>
>-- 
>2.53.0
>
