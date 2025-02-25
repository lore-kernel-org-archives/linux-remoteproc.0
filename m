Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012065.outbound.protection.outlook.com [52.101.71.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F81266573;
	Tue, 25 Feb 2025 10:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740478782; cv=fail; b=YEQyq02fdLZLDJ20SjJd0hCm/GPoLCHl76FRcqegcQCVvqELGQ6GRrzQoAHz3UmmQxanFEZst+ts/4VNFeUVifFVWBkI2KUUkCzt2DFcvV1nCV19PCUnpjM/dqSh4T8XK2SyhMBZJxhLTdL6CyEuAM2hqGsP1bO0BfelH1F7Qeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740478782; c=relaxed/simple;
	bh=8JmryrET1x8qbMhfAbS/9YEve+16Uh8f+BAkgDNNO/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C6AFIgsuuwsXPCH/RRkoTUUlYV1i3w4qIRZjJYIjTvPEAbhHjT+Ev776dOfFhjZyb8zfQh+RonXcSiBC1kY5Dgc8vbm0192TqQ+oS9s04CwbsckhJwbRcm+OSXCL04EMNOtmp6NbQgimdYIqA2Ieap4CdKYC/3CwIohxnmAV4vM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gPjAhGvu; arc=fail smtp.client-ip=52.101.71.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gPjAhGvu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgSnt7CmZtOR7F3NsNQ7+zZXxW6nCxHpFUrB+nUnh9ZVQb/iUhrj5dhrZvzNDnnBUwX4TJwX0yRcXAjSY+7nXNoN4XU4ffNxXUoroRZdZxXYWG6SzBuTPl4C9xfvWcH/dqc4XG1cUrome8CZwSlMqGG/uxUs2lmUw/xfeGl9Sa3CK7eD68juUH+jOS17W2vhX2NFrz8sKqvhAtOvLgA1OvqXh4LiE7Bwlw3DOU9dvx1nfRM4HnkqhlQxJlCoWjYgn5iMDxv8PDcHAxtF0JTldBaiBZVc/hwMScoT96NJYR1qbJrRZQy7I0XIepTPUV154QasXe9cTDwjyzwNf/QKsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLNjwhIQlU5oEka3Bb9nIe/4mmk+QIcZmHyjn7Y3CAk=;
 b=Suf/6lZqy2XOcCnxRQE1enSdqJ/8rH3Swp6QpDwAAejlDormjcEhQzMFGa8ZaBF5WgzO87hN5KmQEXLyphY+jFTD/AXhdeifqGX/l5CGA8S31RdWuQKlIttwpGwy1ojNszyJzj1M4BhwoEVgVVweYPNZ19lKGAXHusQX80ND+GdbIGPzkePvL4VIevQqV8/I4SqVff+TLaeV1KYg5PunF/a/bCvtjeCZUVAVY/T680GbHSeD+9ItYCimkmABRcRjLXzMcq+AK/0jIEFSQI/qbO+0x9dvHbbOtqmmfEH2tv5M9Pj0DRnW8M3VBNtDpfxvsHoqL8vwKKeDIsjFcGms6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLNjwhIQlU5oEka3Bb9nIe/4mmk+QIcZmHyjn7Y3CAk=;
 b=gPjAhGvuB586abmS+dNCjh0CsQEjBLGC8QAbqgtfIf7t9SyftdjU3qhFMPbtB5e9piXZpNgHwtPfz5p2Pe5rh8wwC1aMnK0kKxgITJX4cA5lkSbnmPNsdy53txWyEJ0HE1Gy/91viACruR0ZzlWQwGdjM23UI/lad8CgOfY5JoA5dJXTMq2Lb5142vddBAmIwqFEq8qooYKjdjlPrdJi6A1zsgBNhO5qVaexw4f+yHCWpbUsRKtkkhDXjmbFw5aTCsG5wH/zyMAhv8xyCxWpQ9dT7dSY8J4plcPTHnlvG4ErKzNU1uHCIqec76P9dqCBGZQ+puFcTT4s+SO0z7FldA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS1PR04MB9504.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 10:19:38 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 10:19:37 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	shawnguo@kernel.org,
	mathieu.poirier@linaro.org
Cc: conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	andersson@kernel.org,
	Frank.Li@nxp.com,
	peng.fan@nxp.com,
	laurentiu.mihalcea@nxp.com,
	iuliana.prodan@nxp.com,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 6/8] reset: imx8mp-audiomix: Introduce active_low configuration option
Date: Tue, 25 Feb 2025 12:20:03 +0200
Message-ID: <20250225102005.408773-7-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225102005.408773-1-daniel.baluta@nxp.com>
References: <20250225102005.408773-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::13) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AS1PR04MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eb3d027-3f34-4bb9-7927-08dd5585e85c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cmK996/7anHH4yOOCoQkrj5n5CreXAiX7EV447DjJIFENIt5Uv+D5uqgGsM7?=
 =?us-ascii?Q?6C50DmNZ8BOopKrC53uZ3kreqMIPbVnV2e9rCmktvAhyay1dMtNFUZ4zcpEv?=
 =?us-ascii?Q?1Rn304N81sjo4HOeytgsrPfZujsq/SjemMUExu4Isgy058g0pawnFm/vygsT?=
 =?us-ascii?Q?8x1CVhnVRDuf4Bn9ifN8Y5INQXoXJnbSAxSn+rMmHNIImpSAZl3gRmuNfwYn?=
 =?us-ascii?Q?ES4pJqOQwV1zYs3LQZ0U95kp/NIoLp1i1N8E0ZQkM+gQvF/5x3PHDLe4pRpX?=
 =?us-ascii?Q?OQJyVztAL+npisU04NQbaErAxBThOpJDHneUjnwq+khd1fSjbUj4/XePpcVP?=
 =?us-ascii?Q?AeP38wyi+Wehf7w7myGpBAAO2mbDa5AWXhiK4iTW6DrJGT6KGguQ2oF16uIi?=
 =?us-ascii?Q?e+VIYiQHNJ7N2ARgnGD5SAwI5KC6GnI/ovJV9amClhK0d1jU+cXeOy/dBmkp?=
 =?us-ascii?Q?gk6MIfqa5sfkEFvkB/r0Vas6aztY8Sq7dO+X91RDU5WAGF3lv1UU6IH2056w?=
 =?us-ascii?Q?64TJD1cvFNUbxKv0m5SjAbzTQdm9UR4HZOsXD7ti0OkMmoVZ2P7aP00Jo8rk?=
 =?us-ascii?Q?D9uyrKyJADaY++Kkm85VwHhyW+imfaSEax/Dd8xvw/+1XZvjk+K+rV99q/8d?=
 =?us-ascii?Q?aPdL8yUId5TJKnEAhHjOfvAP9pCVXnjU4v99R7WcjDVAerA6WGavIuahriTJ?=
 =?us-ascii?Q?IKy0LsWY4ESub5HV20BixfbbseGT4Xn/EbSjKDb768z8mYcITVvvANLCxVNs?=
 =?us-ascii?Q?+YGJJe1DpBSJ+IqwLfJy/PYsDajK9DmOKRBU+K6l8cG017sJA5RI6xoWShDF?=
 =?us-ascii?Q?UKLbp6kFEYqUjBaDTFKxoM8dIpyDc5WxVQOYV20fHw18nKsiWMuh9lssFcm+?=
 =?us-ascii?Q?a7qfnTUTiAZ76IhcBo5C1gipMu01TESwHk1a0/UkHAg72h5uSurbCOt/2HuN?=
 =?us-ascii?Q?tqemAbvwZKjz8G73Woc6IkTA8FqwVnZJfK2si8bP84D7U1tLqKZf+UAwNMpj?=
 =?us-ascii?Q?Yrq3bkriywRIiFqwW/cwmNdjKHW+wR+ChbZ44siIg6atwb3vQJt2ULup1MhB?=
 =?us-ascii?Q?10DrY5OKaeF8FU/woi3KNbaLfUyNELkoWE6+I9OFZjWbUd5xnV46/7b64x6e?=
 =?us-ascii?Q?axdWgVL1MaTeu1S+rvzx1mRButwrAnjk4bbJXKQtRbODRawjZjV0yCpz69sR?=
 =?us-ascii?Q?YsUQ3k9GcbgxILsMzsEeNIu1z0u6tZSXtaivNPbWFuVbi8CVYaQISvlL3Br0?=
 =?us-ascii?Q?z1UfyciJQemGDnnohVrBwt3T9RXDE4BLhlcqSIpZxzrxHF0q5WQD0LZBUO8w?=
 =?us-ascii?Q?frw9CIUgrRv4ipxojEqpFigNnZtyrDsHPuEXZHU8Z8lyyPqc00SZf7Bq+Y93?=
 =?us-ascii?Q?9n6XlcwoZIL2Q//Tjg4U2qCsOdK7WH9cRPBOG1ex5GvtxMfOwH+pGXx2Ekvn?=
 =?us-ascii?Q?vt4GRxdeWnWbw5XKLloZCSP+ReQ1roUf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fZy3QDcBBLSaodxa0K4M/U2v9TotFq91FXgtSqkbAaRlHE9o2Ckb84NH2ZP/?=
 =?us-ascii?Q?OPBrCAaPnTG5Em/4ZhZ/QE6i1MiGaKxMvRC6ZHQdWl4v1HL7FPzBWDFNP6QC?=
 =?us-ascii?Q?3bgbEcR7Foy8ZXyVxzrb/f5FDJpKLXijrakIRa+dT7HsitK3nYu49R8Agv2N?=
 =?us-ascii?Q?KVtz5+c2Fndu0vF5emnNAR+BCPlFB0nurUr3qJ4UzjJ1+b0MghNSjO5UVFLX?=
 =?us-ascii?Q?DHZ/gNOXp3/xI6mPSrkMsLoeOP/R1S62xGMHSkOdaoAQ8bF5WiFe6vPxsu6U?=
 =?us-ascii?Q?i3rX3QEIXI1CUSFSDffk//bIrurNWoXFiphGhI1u7vD0xcer7pJvxuuuyZeb?=
 =?us-ascii?Q?RRg8aHEhLXZMv3prtN2D7o8fTzrE0RXoIOafcZNJEvwfPG5AcBQEP7ube/rH?=
 =?us-ascii?Q?vzHLP+pYDH+nJp7ihGc98RPOP+HCqW7cN2q14tQOrN45lFhe+TUkP8/sViUo?=
 =?us-ascii?Q?dCGDRWqsznf/5VNlIbLdPCtDlI+qcuFoua6mAvQ42vbkY19/PeIAo8B9I97U?=
 =?us-ascii?Q?JYph5zTvssldoFrT/PyUz8qC2B0PeSMIPoa0fHgluWrHUxWXoSzTNNjbjgTP?=
 =?us-ascii?Q?tEtohwJDhdA7s6W8djS+ovWr+ww0wKr9407KiLjv/RXYg/8DX5uFG3QU3bCc?=
 =?us-ascii?Q?OFQQcpDsWwVJYbEOtnFhLRR64gK0hg94PojhFXWzX4tA9q6N2WeHd6h/YwKW?=
 =?us-ascii?Q?XdPKMa0CMvqkhw81iJynZ7w95CfVW6UECeQ4QTAnzFQdwqmSMcVJF6EOojIl?=
 =?us-ascii?Q?zYfBN/yVMQExB6de9hx3izm7qyO3p4Fo5Q5lkjGCiu9dKQhPOJYGMZWYsu7A?=
 =?us-ascii?Q?2/sq71omdzFP5/XovDqMmc2hicZQt6DQbuUy8Ckak8eREVi3aS4O1USmsXiA?=
 =?us-ascii?Q?VA9zQxZZpcxTxdKJjKsLWF72zaFRodlS32szeRuqyzKA/Z805pnYWLf6Bama?=
 =?us-ascii?Q?S2HFZZp0kpfd7yJqMB2wW1zLkMlVtbBT14YcCQY6VSu/eTfw5AQARZjcaboG?=
 =?us-ascii?Q?svjF1dKKyRbZ6OpugQwLBF2uVw0jqsr6x2I9lhv7Ch5X4x2BH+/IgbHwo9Ji?=
 =?us-ascii?Q?FYtTD/qizKIBoDjGRfEO/Vbbnzs9s81TTxM/qmy9qiEw/Cd1Eh2Hju4yhg+E?=
 =?us-ascii?Q?Jjm74f9/2TyhZQmbjcYER4+7R/40mnwUh3bENmtUC4adW4F1aCpDbvcdn1U0?=
 =?us-ascii?Q?erfw/AX6jKoVK3cyE8o7z5agu8k7rnOj+rIw8pj4CrlBy4zOYJohdENBiB+i?=
 =?us-ascii?Q?jzn/3HUkkR/uXoDkCv9z8g5/L9Zd75cf4UfW1wSGpPWgVCKoHsaGtF5VkvcO?=
 =?us-ascii?Q?pDURNpGna8vB+Zv27BJtnWaW9KDp8Mis2q9n4pIJMWbeaYvG9BEvWlWVvZYa?=
 =?us-ascii?Q?UEM2MP7+ydUYiNXeDa4Kv/zEtjzRJQ59kix10h6lmUsZ5nwWLZzXHkKzNS7a?=
 =?us-ascii?Q?2aNi7FM6NHaCi8zLXftj+OdU40fxJbYDC4t6ufjRT1DKLedHJ5Cuv0duR4Oq?=
 =?us-ascii?Q?mBiNWrICjw8v7t+HnAMELazgsV0Y3r8LSU8SyORvGYOmxWl/8j83zzGkLV2p?=
 =?us-ascii?Q?6cXUTrmXHAPZuir4bn+bCyE9eEkeJ4RfNNkKb0wo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb3d027-3f34-4bb9-7927-08dd5585e85c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 10:19:37.7442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIjmFi3Gma67t/W/iWS7HbrcuLmwoIl2nZccmjlJVPS5zQnTylxcEFL5ZpCeY+m/a7sJ0xBkI889eWAiuPc4yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9504

For EARC and EARC PHY the reset happens when clearing the reset bits.
Refactor assert/deassert function in order to take into account the
active_low configuration option.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 41 ++++++++++++++-------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index d632bd380053..558da232ed8e 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -20,16 +20,19 @@
 struct imx8mp_reset_map {
 	unsigned int offset;
 	unsigned int mask;
+	bool active_low;
 };
 
 static const struct imx8mp_reset_map reset_map[] = {
 	[IMX8MP_AUDIOMIX_EARC] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_OFFSET,
 		.mask	= IMX8MP_AUDIOMIX_EARC_RESET_MASK,
+		.active_low = true,
 	},
 	[IMX8MP_AUDIOMIX_EARC_PHY] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_OFFSET,
 		.mask	= IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
+		.active_low = true,
 	},
 };
 
@@ -44,42 +47,42 @@ static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_contr
 	return container_of(rcdev, struct imx8mp_audiomix_reset, rcdev);
 }
 
-static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
-					unsigned long id)
+static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
+				  unsigned long id, bool assert)
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
 	void __iomem *reg_addr = priv->base;
-	unsigned int mask, offset, reg;
-	unsigned long flags;
+	unsigned int mask, offset, active_low;
+	unsigned long reg, flags;
 
 	mask = reset_map[id].mask;
 	offset = reset_map[id].offset;
+	active_low = reset_map[id].active_low;
 
 	spin_lock_irqsave(&priv->lock, flags);
+
 	reg = readl(reg_addr + offset);
-	writel(reg & ~mask, reg_addr + offset);
+	if (active_low ^ assert)
+		reg |= mask;
+	else
+		reg &= ~mask;
+	writel(reg, reg_addr + offset);
+
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
 }
 
+static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
+					unsigned long id)
+{
+	return imx8mp_audiomix_update(rcdev, id, true);
+}
+
 static int imx8mp_audiomix_reset_deassert(struct reset_controller_dev *rcdev,
 					  unsigned long id)
 {
-	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
-	void __iomem *reg_addr = priv->base;
-	unsigned int mask, offset, reg;
-	unsigned long flags;
-
-	mask = reset_map[id].mask;
-	offset = reset_map[id].offset;
-
-	spin_lock_irqsave(&priv->lock, flags);
-	reg = readl(reg_addr + offset);
-	writel(reg | mask, reg_addr + offset);
-	spin_unlock_irqrestore(&priv->lock, flags);
-
-	return 0;
+	return imx8mp_audiomix_update(rcdev, id, false);
 }
 
 static const struct reset_control_ops imx8mp_audiomix_reset_ops = {
-- 
2.43.0

