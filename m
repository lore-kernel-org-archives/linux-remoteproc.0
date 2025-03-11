Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EE7237172;
	Tue, 11 Mar 2025 08:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741683433; cv=fail; b=HAySBdEsjJjgmXzPlpo8RzbuPx0F04VPd+1aXAD/3SopM2KsOHNv/f/pRXJWUQXuy0WuOu6JmT6dL3HZx4UUdfkym3H6O5w0x1IGRCQSBUBevF33pzhpbN0Vv8soFYUFXcZBUgL5jWniHmRQFbG/ASXje/yILE1r/kHCyJDY2MA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741683433; c=relaxed/simple;
	bh=C6CObQ20S2bL8rK0CXqBcWBs6rdo2Vbippk/sFCdEAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tXsdS4iSMm51xl/aBXP0PbOYiPUIny4Xsdh1FtT4QjMyDhtYDprDWYoqZ9z+0hv929nY4dO/T8gFXDQ3kinX6kEVBT6HheaOXMI2Hd7Vq9gTlakAYrWrQCfJA8HeDMT67qwa9n6MqR4hvQAqu0lT+NfFZx3RlcjfKQBvrS9vClg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=md62/gpd; arc=fail smtp.client-ip=40.107.20.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="md62/gpd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DjUYDnygnFvQ9/9m9+I2teg+Dbs3n0Knbv3P4qQiH2hb1/sydnkkFP/GiLzblMxeTOsngzJDqwgTneiunTT+9fxIVNU8Z6AslcWpxUMx7TuqRxxYHh/1+Pr30aPKnsxw3s95sM9EJMU27sMvWU8g32Ib8266nBEH9Ia6Kn4c4VoBFiPpauphP6htuh1/z4Wm4f+2/+E428MUM22WAf7Psl4z6fKpZIkPMmy07TTFBA6GmdNgKRnC82s7l+Bs3i7urOMD9o8u/DWj1oYB2Vl0ZOIxJLGdFG57UkKfCo7JgBq4hadqqCgNaukhyZK3hK7xP20EvsN6v6GEgqQDJesTww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UoWerf/Floya97PLnucqOzprD5LnjvQTcTSnYM0OHRc=;
 b=pZvMYrWmXmGYo2MF0qzFV2swEq8lMVCyJ8X+bWbGI1rYj54DEK5AcbQLB99hkWenJfYVOm3fBAaG9ObGSfdi2sMpeiOo8cDYaz4HDix+5KSR6B1fIDsXREwM4gdqurJQnR48m5+gxAf6Akbsct9wj33L4H+WVP6WZR6gpuP+2uSPdRlNW4no4CyZIfQ6yiZRdZ0cqhTPy3Fmx5A43HfrIm1aBkAMf/kLIyWo6O+HRhmpH/uVitUD/aRhXBPLDg7WIHB1zDaS9EKg3IaiyEfRrhGTK/AWzLACnnXVxROahsnH7UCgkDBtcvSPoSDRABMG22Sa1xiE6S/pHO9MZilZ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UoWerf/Floya97PLnucqOzprD5LnjvQTcTSnYM0OHRc=;
 b=md62/gpd719/lQEF/UH41kumYA7eCWaO1WnenvQubv22/CQmTak0ElqeKMlJz02P2sFEjnkuPrLM7AHDTd+byZ0b8yImk++TlcNAVrG1gePprc4daEIOqDC7mdy7bKI4Elvv2VaZ7XegBdk+YwUdWWlfYOTCquwnbroEqwwCsgKvo6egUJMrGZJEihRdMyusWdFJm9mM5JycEmmAiShNwh/BOq4KcFvl5CtdoXqHe0Fg3UvWH6xBkTTPx4YmOG9J5K7SjwPSPDFaxFkz1CP+tLDgj8wxucknPKyKutcev4j4k429gGZpWJWtxzq4BGezji7+gxcUn+bcR06a0JneyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DBAPR04MB7431.eurprd04.prod.outlook.com (2603:10a6:10:1a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 08:57:05 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 08:57:04 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	shawnguo@kernel.org,
	mathieu.poirier@linaro.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	andersson@kernel.org,
	Frank.Li@nxp.com,
	peng.fan@nxp.com,
	laurentiu.mihalcea@nxp.com,
	iuliana.prodan@nxp.com,
	shengjiu.wang@nxp.com,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v5 6/8] reset: imx8mp-audiomix: Introduce active_low configuration option
Date: Tue, 11 Mar 2025 10:58:09 +0200
Message-ID: <20250311085812.1296243-7-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250311085812.1296243-1-daniel.baluta@nxp.com>
References: <20250311085812.1296243-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P195CA0009.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::14) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DBAPR04MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: eba5ece7-5960-456e-95e3-08dd607ab181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6bwiKqFeKNE4E2ZUMAU81FzS9NsaB5Us/EP9z8YGNerMmq45AMCQR1rAcgAR?=
 =?us-ascii?Q?1pKgk5xr14Pc55/DlpNiFWQL82ujmlJ0QJxDy1qjYxBdOhqUULosFoB9tOri?=
 =?us-ascii?Q?RO5M3BoEF2ZvVlRAZ6dC4LSHdMeC4ro/diNO1gtKl/2OqjBbNJZxiyNDBiSA?=
 =?us-ascii?Q?rIjDJkoKsOJBBNxDlzzT5eNV6gnYuWDV+D1nZJGskc0FtDOcumve5kG6BVJb?=
 =?us-ascii?Q?BHQe5uYQGFQCfsb+FCB9bDo7fZJcfrd2XJl7fveuCkjkk8IkDYpJXvIii72X?=
 =?us-ascii?Q?XyfJJdTvp66g+EJ98kovKDx7giUdKLisdFDwdWjvMlKLXGJcA/yTp3HaSqA6?=
 =?us-ascii?Q?Uf++sUudfwpMzUPiNASl/lYSbIP2oBC7nfrcD4owPAjwiAJBJq/79DEGcSml?=
 =?us-ascii?Q?aNnZGAispv6bk+ks8vyq/7FIwuMCHprN9qh2q+HYsti5k9gHuDZ+v0smWsvM?=
 =?us-ascii?Q?9nNhaQi3jok0dEf8ycXPNePQuvdC3Nx/OCzP0ta2dwduLOoAKi0rA+sYf7N8?=
 =?us-ascii?Q?EcdG87R4WTiR8lb1fsKkxDftKzMIMob4hqQmPqYI2JSlAftWHjLfvJHjIvoa?=
 =?us-ascii?Q?75Y7Y9m16sBTF0SFZ6b6QL24F6C5dwrBGLYQQJ9h5R3Ym5jRLiFFaY6r+oZG?=
 =?us-ascii?Q?hd+G7HB/BQlhOwGM2KRISyNeBqj4yGG7UO/eCptSQX26/IyebiTf/AccHyZt?=
 =?us-ascii?Q?0jCD4thWPLKBCUBrTiK9f3OnoJyoyyra7LplzRLvSQv/O9LzRxsFTWmKTlUg?=
 =?us-ascii?Q?Hh8oehR/pWpnhzmTXJnHGG1waMZu/Gpliw2HKzszDRfuhBYSorePXYOqQOX+?=
 =?us-ascii?Q?EFa6T7fdwcHckpCAe2wy79Ru+tVXHpqIV9MEXEtz9hKGdM2mrEkFlB8JAL/e?=
 =?us-ascii?Q?dB4Ps1MS6A7JTOlOTJaPN5D/nGDj9zSxSSwzI8KHshtU8wkPenIaGot+RbMI?=
 =?us-ascii?Q?Jj4szJYcAp6UgslIDsgO/zH2Wc4eNdb8uvR4f8L5FzqaS9h0qy7rlOw9BvG+?=
 =?us-ascii?Q?YqjDQtJsd0MtAGhDK4R1Mp11jR8PDNqCx9Ic5rulKYInsU7n2g8sjJrdif2D?=
 =?us-ascii?Q?IMYH66O3Ty5AoTwKegP+yg+3pH8Mda7pHq+17KdDxfxBWGCo3BqDPXpIRVqc?=
 =?us-ascii?Q?mXGHMC9ctikjLFHGAaJyZAdMn9JVMC4kLcsYE4jmV0eFy8/t3TyQYliLvlc0?=
 =?us-ascii?Q?ZleK09U/2Dd4e3DxY33LYI+OfQ90mlkPMQl+eTaq0H/naR/JOT4k2TkZZ9+M?=
 =?us-ascii?Q?Dv9JjkxADWJB73w2/VthM4qrLKB9P2zbwIViYY4BjngEdmzCaWu0cduj4JP6?=
 =?us-ascii?Q?+F71m4vd89p0maLTFJc3cu+nRKl/DOiGBdbx5r18+XI3se8nwv+UDs+kW2Tq?=
 =?us-ascii?Q?CyeifUKl/Lph/mHGGvkxzq+J4aN3+HV88asZe76oOhxzCn8rlf+S5ZlOi4aI?=
 =?us-ascii?Q?Eo6LxsDyzmwDWJ5nKqK88UYytKwXmqPZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HilXpleEoacBi4ckGdH5jGThrNXRM+1TWTRb8wWVBu1OBHeCrUFKjIsJvTX3?=
 =?us-ascii?Q?QLmuCRnXU2Ba0qKHkZ4V5EElfNe/+iuyxRf5ECFn8VUHXb6SPqQKbao1b5bY?=
 =?us-ascii?Q?bFRUA7aqOm3+O6t/kCiGGI9wgSUl+kMG99EPwMkmx0fbOVkPX+zI1Nd7vQ7/?=
 =?us-ascii?Q?eOIWfe0argLKPSGN6pW4TcwyeuknEzOL6EsRpf1EVldToWYeeAoAW3SB8cfY?=
 =?us-ascii?Q?Mp8pvefKfeVte4IHZcBKt6uzw2N7yfyDkKBzkGsg3foXPYiTykr6J/L6aCl2?=
 =?us-ascii?Q?YiAT3uEegQwAoFa16NgjokRrS08Ju2GA3GK5d/z7U+N9lvgxNTa10euFUaDo?=
 =?us-ascii?Q?ZnpxH1OPF+h449E2jf1s8Dvz2KrnPyxk43HLHKB6cYVCqnZotK/HNglBljKf?=
 =?us-ascii?Q?coaWqk0k7B5U9PjqfXDJ9hF83wvQ4DzzYhWaQWulGl6ApS4/xL/N1Evv7WsX?=
 =?us-ascii?Q?d56E4mJ1PzCsCUhQ2fQv6kCGGsi9UI0x3dPZHEN9rAwUWzNWaqPo6HouEn6x?=
 =?us-ascii?Q?e00jsfk3eCz2K8kOdQBhU2WmA6CaO+n60C5alwfKbLrMJv1+jBFHRrqkru7O?=
 =?us-ascii?Q?61oYpRDt2LEl3VT+9C4FQ1Wu6/VnO1ShaQATxCTZE5k8xYVAkemJnozEXDM5?=
 =?us-ascii?Q?0TqiySYE0qxd/SjQ20yrnKkoBYpmcbUJxqhIbHt6PJw/mgsac2qKyIhcE6BC?=
 =?us-ascii?Q?G5P/kbJbyF3P4WQvm8Tm9BUgl5mEW2/tsgTt+3UCRij0JkWrdIhcdlDo/QJ8?=
 =?us-ascii?Q?oZIij9TpXcVeRHLfwf7zAXRNsExd+wR6BVzXkYA/3ZY/7crv9iUwocKq5Zsm?=
 =?us-ascii?Q?FkB3b0MM1O1HQRqHpv0U64iLffbV2o7W7Qtc2JZFaT7iv+BSw0eibpaqKrrW?=
 =?us-ascii?Q?RB3dQ/QCPzXV2ynGgmw3+nERwJRjrzKd90yMZBtmm1KzG75rGGhdj+SiWYKM?=
 =?us-ascii?Q?cWUb7f0zAC8b9xI7iUbWp+CH7QjTfTL+qJc8iImHa+Fb/VvzfzIFkFusFP8d?=
 =?us-ascii?Q?vW8ojI9eXK9l+VByOYnTv8UiikdUsi5zAwnfvoJuaXdyWdlLt/YihsABivuA?=
 =?us-ascii?Q?w2NTSkDmp2fD+sktl6uWH+Lw/XqBwqvE5wtHRU63EpWACvQaDwGhykG/9N2e?=
 =?us-ascii?Q?GSbsMpJcS7cGZsHcd14yLYr4R7ronQhK3kzEg7Y2cs2Fx1byzWxhD0k1fvbX?=
 =?us-ascii?Q?ZH3SfUXvnB5509XevP3h59PKEzBOapwOEy6Wf1IBIsNkSvlxfaEDXY6jSHC4?=
 =?us-ascii?Q?YduKbJyj9ctPhmR24mHtCr9DObb2y/omUDJvIzS/oxTE96BXRKEu99uaF9uZ?=
 =?us-ascii?Q?kWPurpRzNprL7XANAkHlFj4ojMyEzvO+SJkwt8Cm7jsdG2CYW+WU+D0+J0od?=
 =?us-ascii?Q?9hy6BG2nnIJgUVGcEL9lDBnq3Yu8scwyTVvz6VVsgel/XSWwjnOYjFFB16P/?=
 =?us-ascii?Q?XbKeJS+Iky5ZNybyPUv+zckS7LqHR/Jd6cU1FdiCC2O4TjlmceuHrDZh14sY?=
 =?us-ascii?Q?C17iEY0/r17/MRNiBA33EJWKC3tMY3n9RaKKdHQ6lpu7Uv2SlddRYQkziJmy?=
 =?us-ascii?Q?ebgjmCNMiQGYBpoAPu1LsAkAw+JNYjeYJm9KHMKM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eba5ece7-5960-456e-95e3-08dd607ab181
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 08:57:04.1548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRPpGpSqCQ35wE+oYhvJendnhBqgsTha6ogVwuo6pFo1VIs4npJOq1IOUMqe5BoYbH65XR0q8Om1ODGZeFgOMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7431

For EARC and EARC PHY the reset happens when clearing the reset bits.
Refactor assert/deassert function in order to take into account the
active_low configuration option.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 41 ++++++++++++++-------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index abef6d768e62..04ad27aca806 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -20,16 +20,19 @@
 struct imx8mp_reset_map {
 	unsigned int offset;
 	unsigned int mask;
+	bool active_low;
 };
 
 static const struct imx8mp_reset_map reset_map[] = {
 	[IMX8MP_AUDIOMIX_EARC_RESET] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
 		.mask	= IMX8MP_AUDIOMIX_EARC_RESET_MASK,
+		.active_low = true,
 	},
 	[IMX8MP_AUDIOMIX_EARC_PHY_RESET] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
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

