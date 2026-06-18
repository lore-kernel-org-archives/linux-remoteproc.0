Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011066.outbound.protection.outlook.com [40.107.130.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0A840D57D
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Jun 2026 01:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781747230; cv=fail; b=dJBbrS6ClOtoD6XkpZNfA8BuLR1DvIiSWp9nYvhk1xs838bYUIdY8IdqR/q7C7wnzWEWehPlLCBAZ/J15jkkQGgvg2gCYdgWjJLDyOycLemv0pN1GW7LmYtTaTNXQIVm1cbQlzJohqX00pnwlQQ//DhCA8b4hEiXNJyaxEqg57w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781747230; c=relaxed/simple;
	bh=kTiG9OxbK+xmV5qjJiM0UsFqqx5D5+9pT+PjLLI872g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WR6flQcp7TU1mlxLxSWVf3t2OqanDBbyY2jJBfPpA2l9e+3jHyT9TwPb97606kRHc2LsqsUV4/4wbOc3RYzH/hKY0/rAmZdLmKdiLXQGEl7JtjohBHKklXLZA3xlC3+J8ltE0XBb7ucj0h6d/0XkompsNIgCtRnKazdV8zpuRF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mj9AaE2R; arc=fail smtp.client-ip=40.107.130.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mj9AaE2R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZwQRzAUQ6h2XQnp/VMvCnEvvSqsrLfcO/oooA0xErmggSd2sTMWrvLke/tr24o3Udq758qFk3u+d0894F3ZGHGj7RrWNW/fpgVwWPVBqPHxpHb4mqT5TN8l35XYLzDZm5PhN6cjT53FpN3DY3RHLAJTMHR7EffDVHCK/wJ4KcuO8ysj5ZtD1ZCTB3FPHjjRAzlGGhW1oRNhqnkWI8PcUjB4g7IPER9XQfEKRAoWLrZjIK/g1ACzdgJ9xuLf0rmGce5NynrmcHVhrC8BUEWjth8YZw3gX0GJRIOMI+vvPsB8tlgxzYyE0+DPh6o9HglTIPosIdk+0SjdtM7Y89ivkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7gPrBbN2yrpbxEZ7yko9tWgrGq/4P/LHKseGwGS1lY=;
 b=xjKqG0+1WO/Id1QiNBVCnT406P+lkA7rk1WN+GnXIUHzLm1UpfN8QTcaGJ2EMp7VR/AIpDjXeO4P44VSd9oLXLGMsjVYt81SA/inNMF56nV43Ge5BKh0rkX9NbUrMvr+ZMInSgcPK7W5d6Dt1oHefHiXsVZWXbNLGj8FPyqhanDkdCgFYOBkeJaeN3SrqHkStLwh8iPF2JXFjA3CQHpNEt2RbQKovR9JAMk15I2htulpnl6QvhuD7zcApgXgpscZ4TsaZek9IZUVOgkRZNYn45B+6EASZePgCm66gKOrUgfz4mj6Rp6UkQvpNB7ymc6HwED0M5/Ik14sipF18m5q6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7gPrBbN2yrpbxEZ7yko9tWgrGq/4P/LHKseGwGS1lY=;
 b=mj9AaE2RPktgvcjJ+Ug/h0In0wu9xqMuL4+Rcm0LB1yxBUGvBW8DbqiJBLsjOXAkl0P8qO6BcbWoQJK46BIbs+yHA5HrZy1lMXemoa3FyLgIUFCAezsLzn5Oin1hEV84e7Op0K6sTEoEuylOVCj3jkMTcZI0FwxqwK9TzT1uuYA5z9d1epb1HIB5WXiOCiQRkMpYT3JlwdiFRRE5e2av97ckLrFBMJhv44ln57jIbpZoNU6HWDwPyvyTQw5NKuEIt5cfoO0+QHRzAn5z5iqGkL2xR/hJYRwPQX9XLKXHEE2s4jBpm4SYQdV1p0MGrtD+FNVc9KYTznrJfOpAaZAs0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by VI0PR04MB11070.eurprd04.prod.outlook.com (2603:10a6:800:264::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Thu, 18 Jun
 2026 01:47:05 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 01:47:05 +0000
Date: Thu, 18 Jun 2026 09:50:20 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v3 01/10] mailbox: imx: Forward the timeout/ error in
 imx_mu_generic_tx()
Message-ID: <ajNO3KSZV/elWONW@shlinux89>
References: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
 <20260617-imx_mbox_rproc-v3-1-77948112defc@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617-imx_mbox_rproc-v3-1-77948112defc@linutronix.de>
X-ClientProxiedBy: MA5P287CA0231.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|VI0PR04MB11070:EE_
X-MS-Office365-Filtering-Correlation-Id: b5020b90-f481-4e40-99c5-08deccdb7fb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|19092799006|366016|6133799003|4143699003|5023799004|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Wwk14kUDNr6HZ+NrOaEbXasn4UPVfumooVl7FGZDBMrwDx+z7qnQoZoALV8jlPbSb7fLWP74v87VMsX407C+KaimFJcrqcx9wjLlm5vEs7EaTj5vlE8TfypURRZRYpOXYV0p1qqFsXTM8F67DU7MgpGFkzJO2yKUt8ygR8I+Bws9oXRiQ4xHXgXxfyLcHCkdJAGJDSz6OMn7Ckg1kDQrwqWOAiaV2azFMuEq9fL9ZFr6c3pMx+s3b3wht2nTzjZ1LJv7tSrXY+5x6VDmxjdZA6yIuVrBsMpGOU90e9d2EbHJlMLSkTYl+IxX47EVIFBLNAWAuhIo+xs5lIuinY5k22P9bGPAOuD0QJZaZnc1pcfeC/ueOzAR5XJmtJwKZz3ffoE0UwG7/uV/JRh3gKArJSyffZf6SxydYwVNCboqK6YrJlXqL3MptycZF+tLSrwjq2QsdaYTwBicUYOvuIItsK7lCysdvMt1geubWs4f2x/Fd3h/U4+yWl4WHc4n/3n4w47L9RyYUX7qGTrXlol14T2nQOY7wJYvc9jyuO6QqXsVlHFmKwR/qCh9C2W/v60TDKyY9D+syUxta1ydcMfml29gJ471b82gwCri13/gNgsZdiy3pjzFSN/Gw73+Kf3+yuv10+b8mtS1KocDOtMYoabcpHphnX+/sGugcsDahdN8yEFvAbJQcwlSthoAH1se
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(19092799006)(366016)(6133799003)(4143699003)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DGDnXoNynBWHKIzC20Kb1JCKQjjP5PE8m5PZu9eLuKp4h0ycpRd8yGQcfca5?=
 =?us-ascii?Q?4+YZlsdIx5h3kFhMFCMV53D0i7//AOEFBktaMl2jbJLP3v8G9uKX4hDd/E6J?=
 =?us-ascii?Q?ugGAsY7nbVGGke8SlP7GusLrkn5sP5nGWDQEm+VJFrS+q/jr1DwZYqf6a8mz?=
 =?us-ascii?Q?3BeLC6bapjSfNiksuLgc7h0N0+Sgo9oUZbEwH4FGGDj18RW+NhOiTf0G6e9b?=
 =?us-ascii?Q?vdjWys9Y2djx6DxZ3nCkzSgOg6oX6Pj7jDAqIYwj67uy89/AvH9aP9yS32TY?=
 =?us-ascii?Q?OKa8mKoGL8qhJYVaGnzgxGADnmy60i0G6KY6PWO7hBFyiztpyxH1NYwtHIIq?=
 =?us-ascii?Q?yaXlwAQ8CRopuXgmc94+YcsYXxnxpOctWYucEMN0Ez3O/MnomgswMujHw3LP?=
 =?us-ascii?Q?X4cNTJahlzKzdDdQnN/d0dkk2cG74tY6L59+XFS6HQT8DupQ9UFOl0JDVumt?=
 =?us-ascii?Q?40jN9yUyOKpTEgF71sKSrNfTTBg7q43GlQIVr9ka0JK1YNWSDTFyHATZ3l5p?=
 =?us-ascii?Q?6QbHd4UEVi2c1arzdK8DQK2lQuO3TuesRHmNBvxmIF+x7JGHT4vAnG5iF12u?=
 =?us-ascii?Q?dpt9SoH+nloGq2Ua1uruT4UJK3z+1D3BfgqrN7nYDeL3y/Bo46XL3btYgDX/?=
 =?us-ascii?Q?I1QqEwaK1KEfvSPHGswOfn3sCIoayAVmahfedAyDdsRcWgkvkkLEeLOhGSwc?=
 =?us-ascii?Q?3oYOlwsJUnsfnktMeXeDq1fhvkL8StSscv1WVDGMBHBQhGxKMKglmZOO20F1?=
 =?us-ascii?Q?2/6wGQQ2BtjogVgFpgfhLoQNRtYxUXlDUk6rM+q1OvV9OhzXkREbnawIZfyI?=
 =?us-ascii?Q?eDn64x4nI8C5+mEh933WgMZNSkaR1OQ8no82xeBhmGekbTkM9Bj7B0E4ek6K?=
 =?us-ascii?Q?jQrrrcnE46jEhu00rRM29Y/PT981DS8ri+iA1KahLcIDi3JSI3WZv1nb3/sF?=
 =?us-ascii?Q?NcFOwDjy7MzURs9MS6v1S+IpQ3wxVJPeiNXOe+jEZmWTIK8rak95bKCrYylx?=
 =?us-ascii?Q?ZEnBqn/ZJ0zz4FAvbTMrCQhj7Zz7gOps0gTi+NcyS0Y1Dz0iH3f8TSsJzcBR?=
 =?us-ascii?Q?o+YdFtP1lvIYli1x57PEkLlLFmrJ2MgR90lKnYin0SJynfxSKrBjdAXZ8ora?=
 =?us-ascii?Q?Y6FRBmcGyIAScXWPmyM2Wd3ZlZH2w9zg9cz1oaVYNqzB5s2QWoZlV80KHefW?=
 =?us-ascii?Q?uVD898TWYwd453MnnWbz7Eus2LnIAqMGwH1TLvB9mfdso15It2VBysSpi8Ny?=
 =?us-ascii?Q?GyiVWG3nydbeljLz8tushG5r8/puPk93lAUiQbpz6Rg9weRuGc5PG5NBNKfc?=
 =?us-ascii?Q?6oYg9CfY4p5x1/+B8wEsWleTiu59iu1tYcXELcSRmabA8hXEYHMwnowRHPhE?=
 =?us-ascii?Q?O+4179vhISdNt+shl+2cvziYFFP2Ee3aCj8Ma5L2f0wZK52bmg60UmoZMkl6?=
 =?us-ascii?Q?sa8p30ppLbJqX6tI6SR39QeRA1UD/dD2yQTOqXr2B7+X/3w6Tsqw7wBoqoYj?=
 =?us-ascii?Q?81O5MlTs4FmFD1fSGxnWYt0mN4g9CexeFfMdvxFNMlNFJa2lXP82BSYgWN4m?=
 =?us-ascii?Q?RudAcYob+ksdAeQ76ZSO1N7C0LXUX1MciOBIrlbUnejctyvHNrH0I75MTpEy?=
 =?us-ascii?Q?MxgAYR/rlo8Y996XlqtSi17AO3ZzZqyyvBmVQ3M+2TsfOg9Osx8gfhoLcaiB?=
 =?us-ascii?Q?wHCoOVN/m3BrZtAmbIYhUXLU5EvTRBz26ZVZOLtIswML0l3CktwczhGcHiR3?=
 =?us-ascii?Q?Gx9tM3i1g2k5BbfJjMtH5JYG3hEr7Eez1vfG51bP/HZXucrOAfnf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5020b90-f481-4e40-99c5-08deccdb7fb2
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 01:47:05.1204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GTl1N8AP2hHuNoBp4Ta5bO9Cg8JDvuoer+ALlb2q0rpDdK1JHY3tP/Wo2YYYqs6uJ3CjausRqGtwreGRnlG1yNrLLXEZcHUPzZbD94NPWrC+3cDHQzgPpmZbA+SsgTmP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11070

Hi Sebastian,

Thanks for your patch.

On Wed, Jun 17, 2026 at 08:55:26AM +0200, Sebastian Andrzej Siewior wrote:
>imx_mu_generic_tx() for the IMX_MU_TYPE_TXDB_V2 type polls on a register
>which may timeout and is recognized as an error. This error is siltently
>dropped and not dropped to the caller.
>
>Forward the error to the caller.
>
>Fixes: b5ef17917f3a7 ("mailbox: imx: fix TXDB_V2 channel race condition")
>Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>---
> drivers/mailbox/imx-mailbox.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
>index 246a9a9e39520..0028073be4a71 100644
>--- a/drivers/mailbox/imx-mailbox.c
>+++ b/drivers/mailbox/imx-mailbox.c
>@@ -227,6 +227,7 @@ static int imx_mu_generic_tx(struct imx_mu_priv *priv,
> 	u32 val;
> 	int ret, count;
> 
>+	ret = 0;
> 	switch (cp->type) {
> 	case IMX_MU_TYPE_TX:
> 		imx_mu_write(priv, *arg, priv->dcfg->xTR + cp->idx * 4);
>@@ -259,7 +260,7 @@ static int imx_mu_generic_tx(struct imx_mu_priv *priv,
> 		return -EINVAL;
> 	}
> 
>-	return 0;
>+	return ret;
> }

I just rethink about the logic here and rewrite the logic as below.
error code is propogated to caller and poll timeout are removed.
Please see whether it looks good for you or not.

[PATCH] mailbox: imx: make TXDB non-blocking and avoid polling in atomic context

The IMX_MU_TYPE_TXDB_V2 path currently writes to the GIR register and
then polls until the bit is cleared using readl_poll_timeout().

Because send_data() is invoked under spin_lock_irqsave() from the mailbox
core, meaning the polling loop can run in atomic context with interrupts
disabled. In the worst case, the current implementation may busy-wait for
up to 100ms, leading to excessive interrupt latency and potential soft
lockup warnings.

Moreover, the TXDB channel implements a doorbell mechanism, where the
sender only needs to trigger the event when the channel is idle. Waiting
for the GIR bit to clear after the write is no good with polling.

Fix this by:
  - Checking the GIR bit before issuing the write
  - Returning -EBUSY if the channel is still active
  - Removing the post-write polling loop

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/mailbox/imx-mailbox.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 796ba983db29e..ed53bcffec673 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -241,7 +241,6 @@ static int imx_mu_generic_tx(struct imx_mu_priv *priv,
 {
 	u32 *arg = data;
 	u32 val;
-	int ret, count;
 
 	switch (cp->type) {
 	case IMX_MU_TYPE_TX:
@@ -253,22 +252,14 @@ static int imx_mu_generic_tx(struct imx_mu_priv *priv,
 		queue_work(system_bh_wq, &cp->txdb_work);
 		break;
 	case IMX_MU_TYPE_TXDB_V2:
+		val = readl(priv->base + priv->dcfg->xCR[IMX_MU_GCR]);
+		if (val & IMX_MU_xCR_GIRn(priv->dcfg->type, cp->idx)) {
+			dev_info(priv->dev, "channel [%d] type: %d busy\n", cp->idx, cp->type);
+			return -EBUSY;
+		}
+
 		imx_mu_write(priv, IMX_MU_xCR_GIRn(priv->dcfg->type, cp->idx),
 			     priv->dcfg->xCR[IMX_MU_GCR]);
-		ret = -ETIMEDOUT;
-		count = 0;
-		while (ret && (count < 10)) {
-			ret =
-			readl_poll_timeout(priv->base + priv->dcfg->xCR[IMX_MU_GCR], val,
-					   !(val & IMX_MU_xCR_GIRn(priv->dcfg->type, cp->idx)),
-					   0, 10000);
-
-			if (ret) {
-				dev_warn_ratelimited(priv->dev,
-						     "channel type: %d timeout, %d times, retry\n",
-						     cp->type, ++count);
-			}
-		}
 		break;
 	default:
 		dev_warn_ratelimited(priv->dev, "Send data on wrong channel type: %d\n", cp->type);
-- 
2.50.1

Thanks,
Peng

> 
> static int imx_mu_generic_rx(struct imx_mu_priv *priv,
>
>-- 
>2.53.0
>
