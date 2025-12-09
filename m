Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012047.outbound.protection.outlook.com [52.101.66.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911032D7DD5;
	Tue,  9 Dec 2025 14:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765288940; cv=fail; b=Gca7cqmuYG0IQSi9d3HncsrELTDt9rviyqXbsehSGOYd2F/OpcLrHS/jnfNNIGpWwmR7DOMki0Qwq9too/WyMKQNrFWSoGOTSaAvBLZeELAYwsI9WbyiIMCerC2ET0dwW1WJz2ufWJc+AamldpVfEVX2JSZKawRNOy2T4ZsypSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765288940; c=relaxed/simple;
	bh=jGdF2jfBMcTDFlYmPK0+ZZyG2vMlPOOZDFhzH494FPk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aZILeVyrH4rRJ2dV6dYGJ7bXK8xqJsPA++orlCP91pCqdc2+8Wrz/11HyUUcixlsyp6IKdLuFMo+7HQszi9Kf00j2cSgD0myCLMpg/UvZMnT5oojoFbVByaJiRnYQ3ZC4TvqPOz+9GjrZFqn6BvnMTC1IX3Y1VH7jEsevPNHIts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KW23XrEW; arc=fail smtp.client-ip=52.101.66.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KW23XrEW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUBhdigYT3yWkfIte2ziR0f0D1AnqOaf8OUSAz3nG0xU2/pZcH5QRPPzJCgg4oDOJqRmsECWPKDdDTvGsdqMhjbb41WyUAqD3/blPlNWoLbCejMoyr/dEQWJDPzRTTe0SBzByJ8SdaBTcbK2dMd+SayOOrcU68VAGwBcGYckRX8FQpIM4uVdHrxqC2swLBGXd6pY3LHBiQnww8oggpkiy2R3rlh7DsFWMaD9AQx4tbkbNRSEgiHuqOR1kOpVCr8vQmN03xt7t2hsGMD0CI9yzQp6KYtdmR0G5GJGCYOIllasm5kaOYNF71xA/o4nSc5SPLlEyywsUEJmUSXqNl7g4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+beOob4ganCiHyxhbAtVtcHPd3DfFZn82OPDxW7YBU=;
 b=XduBGHrZS3hqe4Ew64bBW11s3+EGUwkY0SqOMwac/dY5IRH8U6AhEmX9bcutD53PeVUq5GgPitAKajVELmT/Py9jAoYqP5eEvOxj7uVkKih6SeWsECM/u+EksyP5/ksPwikn6+WRMwzCnI+kDnLC9VrOWcYRfj8+oh9VIodNoUX6iDGU/+kf+3r2k3o1wJSHjv1IMI+SA9nwFDynk8HdwvmCsL1EjsbsV+KRebCwomGZt2NqMAY5vDQKCYL4a9n9NtZgVDF1WSaTLg4a8jeombF5sg7K4VlQCXRTMPVXlOgzlDGM9efhwSe9Hnss01NqwnjdIAfDZ4ku30kEfX7/cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+beOob4ganCiHyxhbAtVtcHPd3DfFZn82OPDxW7YBU=;
 b=KW23XrEW8dTc0rWAXSJepKRBIfCvVcc9g/vgI7OjKwk9KGiWIsyjz40PDopMnQYoHIxZhrBAmXEzK096/UNXxh3j+wnuVWWKvDTGtBly9lyii85d1nGmPAezZlC+CfvdH1kmkJpfXHfO8E7uP6muZoQUvuJLzD3u1B2c6Sm7X76iey7aH1l8Q9T582hWlTEoOQnCXkWi69Os/FJAlotPbqaHaMa0/FfB4/mKtThyzowyTpHX1qnhidU+1ZTdcwnFDwbvNfR7dOXLaA4VHM2GTNMO/IAjGH9mqSlq8XNCtBIkMfyz6IOVZXuY9S7esiaHhaJASgzU38XLfj73EjQbAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by GV2PR04MB11093.eurprd04.prod.outlook.com (2603:10a6:150:278::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 14:02:13 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%6]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 14:02:13 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: m.szyprowski@samsung.com,
	shawnguo@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	arnaud.pouliquen@foss.st.com,
	robh@kernel.org,
	geert+renesas@glider.be,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [RFC PATCH] remoteproc: imx_dsp_rproc: Fix multiple start/stop commands
Date: Tue,  9 Dec 2025 16:04:25 +0200
Message-ID: <20251209140425.766742-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0032.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::15) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|GV2PR04MB11093:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c625939-fb33-4fcb-5ad4-08de372b8d80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F2Dqvo/8KiIFzpNPveNK6NZlma/c6J2gjsmeeRJ6dXHlvNVXYDlYSZXKptfS?=
 =?us-ascii?Q?cJfj6TQTP4UmpWXUSXspWHjxzqMPLeekLUf6DbOUk+CdepJJ5QmWuppcKyu2?=
 =?us-ascii?Q?KhUIMlIeykvFxC/IN/Q6RBEaei2f6LSyH2zf4xSnVv+onaQgvu36Zgv5yJ7e?=
 =?us-ascii?Q?tQecx9F51WZsEzIdDSqdPC4RlJKEXYePWD9uuXWFBU0M+k+B+c5v5MXnHK2l?=
 =?us-ascii?Q?M0rkMGUX7fhYi6SK+7ldOOQkZkextYPpsHJWzUWN7/DbJV117dyYu2KPuGWb?=
 =?us-ascii?Q?5EtXg/M3kl47R9ZTxQRY/KpBb80HGm0WDpIggDAGUsC4ZIwb3G+SoEIPRZFY?=
 =?us-ascii?Q?2dt//XIM+SgBiKn2TlcHT/s9cI7e2T7egb2nKhNE7UUPYldCY2J5b5GY6M6t?=
 =?us-ascii?Q?9NPK8D1OX1D7X+6eSSmRgrBT3W4H6vI/JCtfNe97F7+caJVhTPtOL3Nognye?=
 =?us-ascii?Q?Hxz8fAVLVTPNMxKU77Pn0i4vnmAsrYG3eEVklwKV5/z9KjxJYcohpLCc8xjk?=
 =?us-ascii?Q?RXOZAHVUJIsBy9F/umO9JAOoykGnKNDNfi+z+/SSvLM3iTXrCfinXIUVcU1o?=
 =?us-ascii?Q?dLm0rWlGnXqgr7sck4U328lLClf2RY3vn2rX9ODwNi7LfUFEHvFpTslp1Xji?=
 =?us-ascii?Q?hBSDiEK53TXk1Oe+VB4buIqgqlNO0MjJWxNbbr5NaJZzDrlHcfPUZDxA+TTN?=
 =?us-ascii?Q?w6tTPW2/zISDiJ5v4pxpQAweF6JgVObcLQYYGFAECKSCEqlEINDrTU8eWZk/?=
 =?us-ascii?Q?xcYIBtNmszGm0uxROLymADKo/fy767WeznUdH1PpbQSpxIpzUzGJ0YJY2jBj?=
 =?us-ascii?Q?aoTHhDSonsmaTC1f9GZm/ULfrjxnk8DT2DoaVfgmtfwJIb19wLiTfnHlemay?=
 =?us-ascii?Q?qeoEn6LWgE9fJ9DorCnlofU17vCZKeuXyDz3O3yr9fB0Az323FBPNUROQ6kX?=
 =?us-ascii?Q?FZUGziwtw1/RiaVthevLgvYiH0rFn/yseGfx1kaf5R2o2Gt8bhASNURjdu7U?=
 =?us-ascii?Q?XWPxBXRz/dZtYII+1HESPOg3UBKXJ6mTVtZ+iifLzm6jWfbPQ9BkJnvonvl8?=
 =?us-ascii?Q?vQOkQi3SIV3ptmXS9Cb2cOxE2bBVuBlmIB1Mn3yTUVWILK6daREzBLUfkHEO?=
 =?us-ascii?Q?b/dCq4ukFV6MFtIxdlWuZEWhYZiHRjS6/PokZTHIx6Wm9yAUUSoQ1lAFKa46?=
 =?us-ascii?Q?H1g3J2iC0z8SxhH8DIhrII6bjc5nv3pKEWePkqWviBmRTACzutQzM9Oks4v4?=
 =?us-ascii?Q?dc1ANp/A0OrcoWpeKjVjD93L5iJn84dfiU9n6uVu7mBSEUme0sGFGK8tHKlR?=
 =?us-ascii?Q?Fkpj8B9Uh+enI6s4xa5uJjDYxKsb5gcKFY6oCMs2TMAJIy2HR+mlv6lu8Pi7?=
 =?us-ascii?Q?xkh8IvxzwJCRsl3BkUn6MP6eJtpjjcdL3HZKcrE2UUu15F737kYUuC9YNGmL?=
 =?us-ascii?Q?cDuDVI4mgqle7iPQlKX329AN2KhMW2Txj4mEHLZH4kA1ws/U/Hcxg2eNm7UA?=
 =?us-ascii?Q?3CchglvPRSLbS6BcThMB+rs8sfIDROzRlTLG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B1S3If/P/lLQuJa6Iz0tJvbYkJa3xt1XtJQvKq2MpbohKVmKhE0H4BZXXKTg?=
 =?us-ascii?Q?VZP9Xkz8Nc5RVMH+4Ewwb8HIPjkFalsveWiwdlyYK4ZkDdqhtufptnO8dlJX?=
 =?us-ascii?Q?ga54lHiBrGtEng/GyiFJZLtNU4CBXug60MDq4IuIl8uAZv6ennzy681qH2+k?=
 =?us-ascii?Q?9+G6RnMm57T+Nl1uan+v0rjfTyqyb2lZtOoXllc3vHE8+PcrYDy0xnMK20Vj?=
 =?us-ascii?Q?liZt7JeeoyaWiJvaTApJQKkCaW8/5niEZWu1WwEQqkel3u+p1GYtqdCgnOkR?=
 =?us-ascii?Q?pG63ROqtKEJA+AZv2AjIGCvT52IiDA9F1hrGu10fzW6SxB+gEKx7tQcOTF5N?=
 =?us-ascii?Q?gEuFAI2zRgENx3YU+6XiAS/O6f/PtMVtliMIglkOW1URWHTISctTrA8tXYr9?=
 =?us-ascii?Q?+t5IaPzONnRsVPdd5xAU/tMGcHX2pGAvT2Pq52cIvEmJ4VU6SVCYhRsHFHaV?=
 =?us-ascii?Q?S86e8H9nzEiF6k8DRC140XGemYmzZSoFMRSF3rf/sRygibuYkhvt8Er5YFk0?=
 =?us-ascii?Q?46fVG4NIoOL/lh8JrbuaVVOP0M2kivN1YFg8hVSBZMsN/sEN5IFYctP241Mx?=
 =?us-ascii?Q?zuREFsSFdi/eiGUKVeAYd58xbcibEhCLumvJxh01f+5UMSNYpZHukA3qmLGS?=
 =?us-ascii?Q?4Od4qdRC8LkiAXEpOhov+1StoTXrfSv8l50qUcrVMdD8WmX0JG8TZwBoG3KS?=
 =?us-ascii?Q?BzovNayMUTK9soz9Z3HMiv+N86jVvaIrl3uRhXwwL73qLKZ+EnIri+iMPqpS?=
 =?us-ascii?Q?QK16x2caN2g9GMLAwdCMPW9Fv6B7dAcK/6ngIYjf5fxlWynvoqbl5Byy11fH?=
 =?us-ascii?Q?G2chbYlnT/cgrQaQ290yIshIBg8aU931tKz8MoB+fyR0rkCAa7bozE+oiTBk?=
 =?us-ascii?Q?vXz3x37MplSYsliN9dV4/k3ZbnDt9BwWrX8qAOpTUvEm1ZA1AR52SKvrdt3g?=
 =?us-ascii?Q?jhj/YDyZ4SRehjoFzCNJtnKsnXVOjmOR6HUXcyOK5/CO7kvNscGlJNsBfeUi?=
 =?us-ascii?Q?4Joe84NOIcB4v8zoWyA6/PtqnhFJc6qyxankkL6y6QoFhjReNr/D450GpK81?=
 =?us-ascii?Q?GTkHTSypEjOVLJCWDNaM6KOat10dp1WUh7AhY943BqPWg/diBwm1WEzxKn5E?=
 =?us-ascii?Q?vwRk4fPxi3MfoQaBNwCf/4wOd9zS6H6YxEGtQ5+Grq4U+IfkJBFcJj9h6hNS?=
 =?us-ascii?Q?PVNl4pvLawT5qNORG9BASIMZLwDYNfG+zUi8s6FVd2ny2iYg2vZ3DMSbdaXs?=
 =?us-ascii?Q?VgYo+UY9vc8sY/kA00aF4vy+T2mv3HMwk5uyKGhjIOTVhbOP6qQ7amGKglAi?=
 =?us-ascii?Q?u6/w3LcGPbO2vUM8Yxm7VmkGwJhshDGNczApsiv3NP4TQIzcICw1EGwfaZ5j?=
 =?us-ascii?Q?1xQOi/8+p14yuLRrXfPspwE3h1A93T0Z0myzb6sT+h+aHzy5RBJe3ZV9i2Z7?=
 =?us-ascii?Q?yE5N4PF7ysyJgK8JvBbwbSK11ELopPVQGLUrsX49qzBzVJB2FWPidHHNL9HD?=
 =?us-ascii?Q?jTUbp8Tlz4wuOLqOimlbzQJix93jxk1nkY+1cSIROteZtpKS2t6NYiGF+Mm2?=
 =?us-ascii?Q?qBt8xQfxlI9HNldpT4j/rmNXcRVgZAMWbtSZZ6Uf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c625939-fb33-4fcb-5ad4-08de372b8d80
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 14:02:13.2890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x4Wcv7K7JompWah23rksSJmkixmCk/VjVysUUVj6jlEmd288ydts6q4JMQ0K9otBvuPF97wNZAkGGfBJAige6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11093

After commit 67a7bc7f0358 ("remoteproc: Use of reserved_mem_region_*
functions for "memory-region"") following commands with
imx-dsp-rproc started to fail:

$ echo zephyr.elf > /sys/class/remoteproc/remoteproc0/firmware
$ echo start > /sys/class/remoteproc/remoteproc0/state
$ echo stop > /sys/class/remoteproc/remoteproc0/state
$ echo start > /sys/class/remoteproc/remoteproc0/state #! This fails
-sh: echo: write error: Device or resource busy

This happens because aforementioned commit replaced devm_ioremap_wc with
devm_ioremap_resource_wc which will "reserve" the memory region with the
first start and then will fail at the second start if the memory
region is already reserved.

So prefer using devm_ioremap_wc as there is no easy way to undo
devm_iormep_resource_wc manually.

Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 5130a35214c9..79d5c15319f3 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -709,10 +709,10 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
 		if (imx_dsp_rproc_sys_to_da(priv, res.start, resource_size(&res), &da))
 			return -EINVAL;
 
-		cpu_addr = devm_ioremap_resource_wc(dev, &res);
-		if (IS_ERR(cpu_addr)) {
+		cpu_addr = devm_ioremap_wc(dev, res.start, resource_size(&res));
+		if (!cpu_addr) {
 			dev_err(dev, "failed to map memory %pR\n", &res);
-			return PTR_ERR(cpu_addr);
+			return -ENOMEM;
 		}
 
 		/* Register memory region */
-- 
2.45.2

