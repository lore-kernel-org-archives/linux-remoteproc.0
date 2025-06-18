Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011052.outbound.protection.outlook.com [52.101.65.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C671D20AF9C;
	Wed, 18 Jun 2025 06:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750228129; cv=fail; b=IK/ZY0lwDu/tKfAXKx9LKgFyWW8qGq9diWVry1cnagzAdUjZ8Ki7/ISwQQVNuQwTcXkBw7SFW1lh1Bt/g1qVwmBRkEFLpvj+oDOLqdfhi1JvEg20HmtqWJ5YaUIdzlgUrTp2MGKt78yJ6LocC1b0/gQ9uDnAK7Mv/6HRV0Mbwus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750228129; c=relaxed/simple;
	bh=tWHohfkSdQK1cpXj1e9k+4/nxytHntP3fV/ha1i+RpQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EG8RjfvbQmbsnH2gxEQYZTsUjO1ieiTw79kNtZ9NuiRGsmSncWqVhqsDhoCNzmTg+xxH5ADYvpPMbcMBM6lEz5x5jOeZOJ5NpGKP6OMFdISfuN54f03Igp+rIRwbk3ENAjhGuDFHFg76ZkyTs8gnJGNhXCdcidBagBaZ+qEKTJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jalSbIJc; arc=fail smtp.client-ip=52.101.65.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jalSbIJc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZUwQF9WRnMk01tXPWqEO79WnyLJLP41vlOBPk5NvvIa0K689363NZx3IoEIQj4qEai54tttM7/lRRBNAGJ2F1aIfpOQKiYZ0wf6LrQBeKFiaPRa/hwVc0IS9yQSoLPZsGw1c+7WbxxG+v485CUTRTYasR5WvOo36NU1oJ72KVH0VBYgKR/lSdV8y2/1febAlrf5HZTCMZXWCaIBLyq/KQxLUShSoncBe4P6kcqbV4AWd5/c4jeWOLCtVlfnaInCGEGel9FdefeGpw56GIGnZ/gBcC3T4KtFMGPcWhMilWCL7GnP5HMPPqshPcOy0kQ2eBsXEJxwfN1hHJGin5gh0NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9MNVGDKIBTrUTFb0HogncI+wuoY/cdNmFaAgmBnMAA=;
 b=RQVfZJQiTpP3zIIljwHHSU9+6EjeFNbp83uLQSM9FAP0j3ki3WfzsftRvyiry/Q+JW/Fz8o/t3eKjoSWKuC6TBfmlLRvfm+fQwsLorXmJqtG0s8QqqxUPfvsNa+e4Uy7rWTFD99Dgt5zNhKPNxfIq/F8sFs7MCx4u5+BDTqFn4pWLL12bAMi6JFINEWHwKDvCkTHlbIu0uz+EcgQ1H4nK/dfMb5kN8V9o+aXsabmFzjkyeeCOHaG3sG/2ACDE829er7HtjbR5JvB7fCcP5ZlrVq+MRDwO9AnTcZisBUW+t5FX+qsHZM0adfprKaa94hx9MYFDGHCfyqWLHqssCELwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9MNVGDKIBTrUTFb0HogncI+wuoY/cdNmFaAgmBnMAA=;
 b=jalSbIJcTFqkUd/Rmgm1lZz3jIRpgDqtmvIC2aIukiI40iAuQ/TtMrXQa/kPhykapYMKfa7WHjaqIJRRurRW3uSS5buIooIFu1EpPLsAJ8cZkUq16JXZeEi+vhF4w6GKiimnDR6zC7eZxKZomHeC7zZX5yi91xc9iFnRXkEHZ/9lcLoMiTcC3M05WDr48zc9da5S231VQVoc6p7Iyf04jOOUlUGHnySrHN0Q+m51S/xdzXh2M1adZZMho/uLOdwISpuCjEg3TrxXDkIuJmN33K78UKy7cvGJPIqOuP20dNP+pv3jpQh+t7OTCzeiM4/rFwlEII5qZwh7hmiYBdZBQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by PR3PR04MB7356.eurprd04.prod.outlook.com (2603:10a6:102:8d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Wed, 18 Jun
 2025 06:28:43 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%4]) with mapi id 15.20.8835.030; Wed, 18 Jun 2025
 06:28:43 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] remoteproc: imx_dsp_rproc: Add support of recovery process
Date: Wed, 18 Jun 2025 14:26:43 +0800
Message-Id: <20250618062644.3895785-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|PR3PR04MB7356:EE_
X-MS-Office365-Filtering-Correlation-Id: 05a9de2d-fb6e-45be-2b82-08ddae315e04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Dzo/kkNzgT4DMsXYrM7ucHBzjIQ/As3JwLpL5qy0p1AKt6JChzjQ2ARoaMs7?=
 =?us-ascii?Q?n2tGynlPKei4ZzMGvkm/KwkEpC+o2gD0fGxxlGN/lDhLRJoq98tN9qiu5iOJ?=
 =?us-ascii?Q?/LHcke1Je86G1vDP+DuFfZQ4r6Z2becc0BWXSX7I+FHYD9iqS/tFV9SqPVxb?=
 =?us-ascii?Q?WuchqNp+v5Q5TOPutKXK7rM0yOJk6nbygXpVjAvG3XAspn3s3rbcKvkNpeHw?=
 =?us-ascii?Q?w2Duza39Qkol47VGqjP0+K4VczNc2zFIB8LXrihsb79BO70+ELG6wlhv4x3B?=
 =?us-ascii?Q?oP+yc+ZzuKXQmsvhlgLqsWOdQuxmOLwfZZUONyMAbZGeLWG+Ry4HXJOjJwyB?=
 =?us-ascii?Q?/v69TD/GREsx7Sgxw58P/r+q/UpUAOgID2T4nPZa9OQGYV1Jy7jaluZ5DJmZ?=
 =?us-ascii?Q?c1NOmh8X/KoewnJF6kRyp+YkLGdTs395god/Tv97YVrxGnllIUp16NYXSQO7?=
 =?us-ascii?Q?X4IofZO+6vmfnmCnXcMSnyBMj2Bfgi9iMifv9HpLS86ATNgPS0dhMAZ6v96K?=
 =?us-ascii?Q?98RTko5NqgsYXb37/Us3HAetwL6i2n60czh1NuOONGGvcoYP44UjINimq4hf?=
 =?us-ascii?Q?AJ9QAkB2iUTSBrpllgN/uhnM9D4Ty+abd08kF1D9FnL/MAUdxw8KDvaZ5fWz?=
 =?us-ascii?Q?y7pX9FOcuKS9mz4b4q5+taRYxSlupvQYGZkaPANoxAlagTTqkFvXL0Gp++s3?=
 =?us-ascii?Q?sXe5/bS4tyRxGIG7eXAIgoOjjrinOMQN4fCxDJ6SFkxJd4c7UKD7pZbVhFRB?=
 =?us-ascii?Q?hZJDN1JgFvYtI/oEcGHdwEfJRnd4XbvWZz9d+tDfFG8jTl3sg+zkPq0piGEd?=
 =?us-ascii?Q?l0LSigQNPDEcKCqj8csHx6a+hXi4Qp8wQzfX4j/YmzcEF99AW1+YEQL/au/l?=
 =?us-ascii?Q?QbGXelSZvtd+Xyc90MX4xTSuWMbORTuZ6B4s04edqDD8H4K597Ouk1hznqPT?=
 =?us-ascii?Q?I6sZfMdpavY7KlqGsMYB5OeCvTfYwsBS00EezooMogThLOg06DjSfNTCMvV3?=
 =?us-ascii?Q?E9TfKtsHMANbiaR5w765Xnnj0dK7qrYEGGdTPtzeSEcptbCdRicBYLHmEjgg?=
 =?us-ascii?Q?wPCp/5utPeXtbwdvOzZpGBIW80CgjcQwFoF9wnZQ9nAs4ckjCfCrX3a80Yel?=
 =?us-ascii?Q?U1f043/xl0n9Ma+OEAOxtnci02X9pODvdALNNXsDD9wW/DkdR1Lo0nia3Rtn?=
 =?us-ascii?Q?aWUKRq6jKuF+exdRkNozH79jHbRmRYbfqcS0rygH8p1eppxKqdSDiPp/S7Dr?=
 =?us-ascii?Q?Yo7u6kp0jo7P7/sjlMB/XNF0veXWt9AbInbJdIxRycwht3U4LlH2jJKig2vm?=
 =?us-ascii?Q?d9UO9lzumAJCMnCnn3G8d2sEmhRUZbN+PraJiy/o/ym/gb6n4Of/n+O77zbV?=
 =?us-ascii?Q?SZpglL9MhnaZJ40WhVeuUzC9H2TqqhppT81mNtSqxE1FiIfu5pHZXx+JWEB9?=
 =?us-ascii?Q?UqRLPV07mi/TFfZiRjdFyaxO2GQ8E1YBGDFy5QM6zk6QjOE6K3B2X7hAclBu?=
 =?us-ascii?Q?rLBz23s/vodWbgI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m/aPiEhvQcw+MFadHTGCaJXN4BloA4DnVzqVZc1gHqoq5J5Wt1GWAZ2cq0Bd?=
 =?us-ascii?Q?qxNJeKfKxcta2g/JPIp8o7fMh9xPDNiKzL3aMXrlnhY+joxz1s6DlkJyPdaU?=
 =?us-ascii?Q?nFs/Fq5afNrf8BOueHe2p1zpWdB6J44HhtUEOeCUxvRSFRNW9N23CEtFmmlT?=
 =?us-ascii?Q?22uIq/oyfFQtwAiW3j4YyuF1RzbRen+gKZUSDDLo7iaiDxdltqhLNuMlNgUS?=
 =?us-ascii?Q?3eAELzfeR1xO05Sp8hsSXVa6FQjViBp09cHRphjE+oYy4ZOgMbFowW3PgIc/?=
 =?us-ascii?Q?ki5kTXj3V1WmUpJymH38iSpMdzUxISQ74HmLyNlEokM5BTI+IjASYecDXT6L?=
 =?us-ascii?Q?N30RIIZ+06h5d4Ug3HKvb7oVTr3TWyGfVk0d4DTunrn7sBvMfdvzO7TrWMsr?=
 =?us-ascii?Q?nh9ABVHCjkRS2jeittyxnY7xLPC9ju21kqTI9wAL7VvOBX1dT9wRFC6nLOMY?=
 =?us-ascii?Q?paH2m+OMrurWpEAqTTMtNvbYXiRaJf0PXy9KKnFDDcYzjk+/ZVr8j47NoO71?=
 =?us-ascii?Q?CM48T/xTYQuVY1ZOcjoELmHZCS55UxvmBWoA0AqBb79GXeCcor8DsoEugbZH?=
 =?us-ascii?Q?qETFe4VlGpBTRQPfKps7gxg69jtaF8GTkQGOgkzewaZbyEIIruxm7q5OU4GC?=
 =?us-ascii?Q?aiSYMZU/H4xro3NBnz+lwf+4zSruL/ZuRL9NNm5Sp4i0Dn0DyHpkEQPWLgH/?=
 =?us-ascii?Q?vRIolomyUAJlJB4B9gtwWCHhVtyq94YKNjHAMh4R0qa/pUPqqiZh/8AqdNLU?=
 =?us-ascii?Q?3Gq/H+PG2ajn3i4nFAYOmAmIKDeJDirQPxCpOV7M6kMebY0vGOMVjS00C1c0?=
 =?us-ascii?Q?qUTQRE0XQ6+pXvJ0scLKl2GggR1gBpEOmoXmUw9ieMxhPvgO/DBKhJEtNxmu?=
 =?us-ascii?Q?XAOGruHFHg547VdFAq/hsYClmqYHNkmIqBz1WfB9yHp1lSt6N9QGqqJd2Bix?=
 =?us-ascii?Q?GwfwU7By3oFgUkVrZZnV6Jqlqedm3CAAT8K2b2dodP16xkFd5p/JdOW6+6Wg?=
 =?us-ascii?Q?8qC745CPPDEOpvhvxu3YaYQ6tM6ssmc0sFwBFvcgEsI/kziN5+t7nY+xysEU?=
 =?us-ascii?Q?gvngdWHjz8m3UdItUHr19KI5lSBwtu/uEtJ1hDzDOnSgxpepYGnFSnwlrjyo?=
 =?us-ascii?Q?47Fw/0d8RA8Zh1TpIUjRTeQhVmBKsZZzPlQdzJ8feF99vMslNeKDNwdirsGa?=
 =?us-ascii?Q?fRY/o+JrQ3uxiklEgP2tLP4Q+IpBrmlT7f2PgRYlq8povk80tY/6uWYsUrfW?=
 =?us-ascii?Q?KXa/HK5TxtDWMk4JgQKltjjS+VwMrzbmOAB+GXyLcRTpH2bcN3gCP9fh9mxS?=
 =?us-ascii?Q?NBz32BLOy9V7okliLlESSh/axL6zcerjDccPqoF9JGP5zw99mkY9/OZllW31?=
 =?us-ascii?Q?Ofgh/B73HHaxATZx4RyFBsrhNZa1LgQwzj84HKlUAKQmRwZ2turwxlWY8ca6?=
 =?us-ascii?Q?D34/l4v1e54XfYQ0RHs7S2h+xgS3uJgmnxmAMDVu3vm71EYOEn2w6Qr4/ert?=
 =?us-ascii?Q?MpENW8YOT3TtC0Br5wh55IV53VD32tRT6XSInneSxItDfUmdXAGmth0o1VLX?=
 =?us-ascii?Q?plE7z8vhop+c2FI9Npe/b6sJGD02nQp4ktnggFnZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a9de2d-fb6e-45be-2b82-08ddae315e04
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 06:28:43.0764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4JpAjlV5vXegkVXwvXGVNellfNhCMAHHFZYjh9U+D9lI1d3T1DRfhU0Yb6keFO+4ATImNJtJcd8+NPbFigBYog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7356

when recovery is triggered, rproc_stop() is called first then
rproc_start(), but there is no rproc_unprepare_device() and
rproc_prepare_device() in the flow.

So power enablement needs to be moved from prepare callback to start
callback, power disablement needs to be moved from unprepare callback
to stop callback, loading elf function also needs to be moved to start
callback, the load callback only store the firmware handler.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 58 ++++++++++++++++++------------
 1 file changed, 36 insertions(+), 22 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 5ee622bf5352..9b9cddb224b0 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -122,6 +122,7 @@ enum imx_dsp_rp_mbox_messages {
  * @ipc_handle: System Control Unit ipc handle
  * @rproc_work: work for processing virtio interrupts
  * @pm_comp: completion primitive to sync for suspend response
+ * @firmware: firmware handler
  * @flags: control flags
  */
 struct imx_dsp_rproc {
@@ -139,6 +140,7 @@ struct imx_dsp_rproc {
 	struct imx_sc_ipc			*ipc_handle;
 	struct work_struct			rproc_work;
 	struct completion			pm_comp;
+	const struct firmware			*firmware;
 	u32					flags;
 };
 
@@ -211,6 +213,7 @@ static const struct imx_rproc_att imx_dsp_rproc_att_imx8ulp[] = {
 
 /* Initialize the mailboxes between cores, if exists */
 static int (*imx_dsp_rproc_mbox_init)(struct imx_dsp_rproc *priv);
+static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw);
 
 /* Reset function for DSP on i.MX8MP */
 static int imx8mp_dsp_reset(struct imx_dsp_rproc *priv)
@@ -402,8 +405,24 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
 	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
 	struct device *dev = rproc->dev.parent;
+	struct rproc_mem_entry *carveout;
 	int ret;
 
+	pm_runtime_get_sync(dev);
+
+	/*
+	 * Clear buffers after pm rumtime for internal ocram is not
+	 * accessible if power and clock are not enabled.
+	 */
+	list_for_each_entry(carveout, &rproc->carveouts, node) {
+		if (carveout->va)
+			memset(carveout->va, 0, carveout->len);
+	}
+
+	ret = imx_dsp_rproc_elf_load_segments(rproc, priv->firmware);
+	if (ret)
+		return ret;
+
 	switch (dcfg->method) {
 	case IMX_RPROC_MMIO:
 		ret = regmap_update_bits(priv->regmap,
@@ -446,6 +465,7 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
 
 	if (rproc->state == RPROC_CRASHED) {
 		priv->flags &= ~REMOTE_IS_READY;
+		pm_runtime_put_sync(dev);
 		return 0;
 	}
 
@@ -472,6 +492,8 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
 	else
 		priv->flags &= ~REMOTE_IS_READY;
 
+	pm_runtime_put_sync(dev);
+
 	return ret;
 }
 
@@ -774,7 +796,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
 	struct device *dev = rproc->dev.parent;
-	struct rproc_mem_entry *carveout;
 	int ret;
 
 	ret = imx_dsp_rproc_add_carveout(priv);
@@ -783,25 +804,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
 		return ret;
 	}
 
-	pm_runtime_get_sync(dev);
-
-	/*
-	 * Clear buffers after pm rumtime for internal ocram is not
-	 * accessible if power and clock are not enabled.
-	 */
-	list_for_each_entry(carveout, &rproc->carveouts, node) {
-		if (carveout->va)
-			memset(carveout->va, 0, carveout->len);
-	}
-
-	return  0;
-}
-
-/* Unprepare function for rproc_ops */
-static int imx_dsp_rproc_unprepare(struct rproc *rproc)
-{
-	pm_runtime_put_sync(rproc->dev.parent);
-
 	return  0;
 }
 
@@ -1022,13 +1024,25 @@ static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw
 	return 0;
 }
 
+static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+
+	/*
+	 * Just save the fw handler, the firmware loading will be after
+	 * power enabled
+	 */
+	priv->firmware = fw;
+
+	return 0;
+}
+
 static const struct rproc_ops imx_dsp_rproc_ops = {
 	.prepare	= imx_dsp_rproc_prepare,
-	.unprepare	= imx_dsp_rproc_unprepare,
 	.start		= imx_dsp_rproc_start,
 	.stop		= imx_dsp_rproc_stop,
 	.kick		= imx_dsp_rproc_kick,
-	.load		= imx_dsp_rproc_elf_load_segments,
+	.load		= imx_dsp_rproc_load,
 	.parse_fw	= imx_dsp_rproc_parse_fw,
 	.handle_rsc	= imx_dsp_rproc_handle_rsc,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
-- 
2.34.1

