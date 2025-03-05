Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA0E206F2E;
	Wed,  5 Mar 2025 10:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741168881; cv=fail; b=nvJdqyfxLhnyv6lLxtEOYgUj1B7XNsBjLKEdoXj2UsV1DCJAcqxGgNpL5yG5jkX8Vdzmn4Ya96jtTShBXootGB+U2VnoaO7KCSQELTGxVYGZBErYg2jyLcrf7Bn19IZW/t0v4ETTJHzFurjVVBvElLzFZ3VHuzxaFxbyMmtZcMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741168881; c=relaxed/simple;
	bh=C6CObQ20S2bL8rK0CXqBcWBs6rdo2Vbippk/sFCdEAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CRCyik5I3yj1yWkbs4p0jHBmhoe4+vqUK9z6DsEmeS/HOXrxfvFC9tIcLCeTPj9u4C0PTZzGO07VWDJEsL/X8aSHGG0dqqdqKnQfwL9Y6bfmgHTPij2Bmg41cx9hRzSkFNCBc36mbaR0Z6/a/PZBPoMah2h92q4EgcatPejQ53Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GTR6k6RH; arc=fail smtp.client-ip=40.107.20.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GTR6k6RH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aESmLtErvKKSF9zaXxuYSl856v+/0L18Id84gtac6kouv3XU5YiXEjodcSG66JGfE6SoeH9Al71ReCAJ2zzzt5Kb3L0StI4xdXhGaIpwDulk5cKDij/cEWzkOgWaZu1jkJFJA7kQq4+N+rxNNorC05ykKjcV7XbPcuLeDUSn/Kqymo4BpTBWH5HEGB1sp2ecqk5TDcUtAhrR5P3CtYlI1CrgyQQ/Xz7G5fnE1/rygcasRluEvXjZCeF54JrIhjQXCxqiZx58ljNkj+pyOChnEo3nGRuQ6itWXjrlsyWCxPFNYmiCHLAq8LdEN/9NKUO56FF0j4W+KPT92u6+1Vw4TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UoWerf/Floya97PLnucqOzprD5LnjvQTcTSnYM0OHRc=;
 b=yIT+0tFS6SuEtvs/qwSa4HjS1rhxIf4r8C96B5ux2zsuNnge99xyru/VOLcPyNDRSbhOk9rbhXDgm2YG8XwNU2wUgRwI596Mlfbbm9B0q0hXxE+qG+qhnUxPWBya3g5Sm1Of+7+vnQXVTJ/s7OVzwbgfdPMfNl0W3ACzdbxB4oDwl8lTaqEHpXdxPE/UX4HdOYIxLL6Vx+SMQFLpNlbWdJOmYnkbt7/KsKPcDDc90BcuStOLmQRZe5P0QY1Zx7rdmwz5u3Z6DG6SMpTO9HfeqZFxFCSfYAi+7jp6Yve7r8LXOjMYPR/k18T+IviH95qffgw8Yx9PgiAfNUT+RDZdgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UoWerf/Floya97PLnucqOzprD5LnjvQTcTSnYM0OHRc=;
 b=GTR6k6RH5L21N0GcSaai6jyiPgwbcjZRyEn0EjXRPzDAFuAh0E8SNH+84KjOfuIDHp/SPky+W1rWhWmd/ZZIJ9UbUHpRD6GQ5f/pMozYpfbsqa0tSwKvvsfyvCtqXMwsqGtZkz8lzVTyQxvKyHjwEP1qrY0KpCi6j2AsNMCqE/6dP39lQermaUuxsXfkL+gsrPiN3RIEdRrvSPDanwiq+oMm3JvrFEPK3EU5ZGi3J0s+LYTPNHMWOInzIXlpyZenWegN7hyf8Mw2Hj9QiaOfPbTUkW51JhjZDR2PX3ORpK9pUOS01/1vN5BaLB1vKX5/E0RZFYUmLUpuoKIEztprXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VI0PR04MB10541.eurprd04.prod.outlook.com (2603:10a6:800:26a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Wed, 5 Mar
 2025 10:01:13 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 10:01:13 +0000
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
Subject: [PATCH v4 6/8] reset: imx8mp-audiomix: Introduce active_low configuration option
Date: Wed,  5 Mar 2025 12:00:34 +0200
Message-ID: <20250305100037.373782-7-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305100037.373782-1-daniel.baluta@nxp.com>
References: <20250305100037.373782-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0031.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::12) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|VI0PR04MB10541:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b9929a-3a73-4e28-53c2-08dd5bcca9b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qidBD/hNV6kdRHzKd6KBOv1lDmlIb+9Pi0Ingmr5LQSnics6k+TE7EDZhVWz?=
 =?us-ascii?Q?wS1DL7X8Df10MRmgMy51vtq9KYkLLxqSvjvnUl3lXu/+1HxXY34l2wHbW2dx?=
 =?us-ascii?Q?kdjqHIegLnrm9wN1nEwe41WoJSlgbPtzL/4bshdBcplrs3IxTPd7G472JYV/?=
 =?us-ascii?Q?Thy+gKLIwRxfP8Jb3iKkRRG5qXu7s2n28nDxFiv/AgDUp9Jc+Yi07I4u9GdZ?=
 =?us-ascii?Q?u5ArgF27csfvqPVrYlJBlOjwg2JEd3jKxq+lnXuc9uuorGxRCooou8u12PHI?=
 =?us-ascii?Q?RwsCVxORXUU0YiR68Qb3u17OrFg2CftL9ig7tu5yJmefQ+IzbFwzw57JTSeC?=
 =?us-ascii?Q?nhsObam9yhETN1MHl5AwsycCjDaV6JMl3sGyRVZAoaI5v2vFga4d6e/tcG1u?=
 =?us-ascii?Q?zc9LnwlxNX98jmt9OLJ534vnuQ81FNY7ejtJ4Eo2HHhtfLqc/c3N72eCGj8S?=
 =?us-ascii?Q?FG8OGl5ghmrHHuLonNSOOB+uyk84T/LyDp9rbmQNTcReEISVXKXNNafKzLKl?=
 =?us-ascii?Q?wE57uFUVKp4+XfESiLPQS2Z2JVYoVUDhxK7FYzAsLJUMFUkdT1q1R7s/UCSt?=
 =?us-ascii?Q?aSBTF4ULdFGZ+x7Q7r94c7JSFbUcvvKgENAfDu+hq/qP98qDx6KuYd4SrwJe?=
 =?us-ascii?Q?Zqn0PTBumg+X4BCVYL8IwjABUM15DmWyRjCs7mOKovyl4+NMbDziw4PAxLfp?=
 =?us-ascii?Q?LItu09FNSYQUVCc43unAwGSRRsL4N818mxsbiePaUpHsztArhydrPc7zPOMy?=
 =?us-ascii?Q?nR9Fa88tCIOmdOAomsR774axAqbXXeAaCUIXgVdQDkHGfpvLbxmPnE878JXp?=
 =?us-ascii?Q?IWrA/d1DDFbDu9kZ6gzxHZUv280AhJs0rRXFon07+SiEYg5io/jL/Z7IfUcW?=
 =?us-ascii?Q?v06TDmsEmMDNh13fvYpT8Ckcczj8Y6E3PGhpliGi7KhrjOHUypxjbi5tkFtS?=
 =?us-ascii?Q?NecMgs88A7D7u3iRi67rkzS4rVz/6hy9mMDUj+yRw5AAoeb6fU12xP+pmTLH?=
 =?us-ascii?Q?+gop6MrCunTDjhAbMCXE0I5QR1+Ti563eqqnJ+5nfecoIR8UrTxehjeC6sdc?=
 =?us-ascii?Q?1R6Wxb5SQcMsHwaeGoU9o4D2a+okrJk5CRL4RioIftFcuoZDJpzKbKuCahFk?=
 =?us-ascii?Q?xcb0iK7aaFFlprMuWDTGxBVsYL5inmK1Y/P09QetD5wFsIjUpXkNA3KANcPz?=
 =?us-ascii?Q?JtSbckptGvaq3zQ/4JGk+4aAbtA41j8YQM44gcHyL5G+RsTFz6UVOVGJkOBb?=
 =?us-ascii?Q?yweAceeKfdIP4Ztw3Lv5skNRt2tYGDMYhpkYP8FuppfAXG7WSqPwIk082uw/?=
 =?us-ascii?Q?IHukZS2YdWbl29wXMBqw9Up+pJElPGrQMSCsW1QwDLI6ZNnGku3q1zlulVVt?=
 =?us-ascii?Q?5BVmXq/al6/Y6f2ZS/agPqs/OkwGSTT+eVFsZ5kXv2HNo0O5hMndpR4q/kDX?=
 =?us-ascii?Q?b37mnEbLvZeZJVBby6azLT8q75otK9WH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BlJEH0AhWTXwEomrI/X00xLbii2zD076D3yuccIv2soeWlJqvGq8LoW/et06?=
 =?us-ascii?Q?NxyTXO/VByAZ3ry9Ll7oiVJUU/utXH0ZMFVA2+nCMbTeXuCXUkqH3Y3zFoXv?=
 =?us-ascii?Q?fr07IC45S6t2gM4Dr0gTnDZOL+W8SnW4ZZ5Lu9lGF14wbFvWJgrfTZ9MbCau?=
 =?us-ascii?Q?rU7Ru4/Z1A/X5b51V7twuN3y6CLJ2fXMNAbbn5PaVhWOdDuOjjysuue0Ca8X?=
 =?us-ascii?Q?CMd/9utabhPbL2qbhQzYHm3OgphFfS+jPNW/rCaZeh7FauRF6PLaULhwxWWg?=
 =?us-ascii?Q?gC8ceAc1z7g1ktfOa7xDFTx1PRBExzx8rTyBkcLsB+8Kb04oJT7y1KcvBMEN?=
 =?us-ascii?Q?ncML+AKJPkGQvokXG2Q5l7ZmxysBcnU6Y8SLP4FseE6PpCFHddVdGAXMVwMw?=
 =?us-ascii?Q?JCN/BBWw8gZmH5J4CU1FJaGQ3i0MKr60dckcb1JfonkVsCsX5i8XbuzFoRJe?=
 =?us-ascii?Q?DiL2BO2V3FjH9Zzd8s9m1d24SmDoU3/Nf8/gk1ecpI0faQDvz2vBL/zfba7O?=
 =?us-ascii?Q?Z75UH7Od5Eb8AmWxshUQZKw0M+LVKRGiOsc6Dm9Axz6ip24ZcjeAD747ow34?=
 =?us-ascii?Q?BQHDo/BDJCORbs60BtKbxDL1Z3mY8wfIqtdj77/rjsvXCtHo9c+e+QBpbRyw?=
 =?us-ascii?Q?dikplmlY7u+8roa3m1MtYr62SSZCWNs2DBIMIg0OFbo283hJBX6fetunZACs?=
 =?us-ascii?Q?hAZ+7EaN3zOlAXLcO06LMd7EPX5L/CzWejRXfuN/35MbkphNqMHQmGS57y3E?=
 =?us-ascii?Q?XW1ZhuPIMoND9x+wEIaRO8ZJw49VxWU9sIEjMFMPMrQuTJ5i6H/8tSBen7B6?=
 =?us-ascii?Q?h0S0XVYF78c6+iLcA20PEap1j8pi0t0IFB8udLTnEsJPqtgsAyn1BP9rYdfO?=
 =?us-ascii?Q?JDbWEkF8aRepSv0NhSgEjrTINg3KbGSqPIXC+vxGo8IUhEZkAyWXJliX7BS6?=
 =?us-ascii?Q?EcZlIcpmpPYgQzfjX+dETd65WLZItVahSmQYWlHQk6a0+rUfoW/Di4Q0d62Y?=
 =?us-ascii?Q?0q7IN1KHmAllkUb9p067MkWdatezHzOr6RDoX9uHY5LQSrbydfekNQeolSUY?=
 =?us-ascii?Q?Yi0yeJR62OSLBzLFKS9GundC7YDXbuBQFKMMn6pg0yzYtmWb7+M2ad/RV7cq?=
 =?us-ascii?Q?wc6XEqjD3wrlmM/hCArmB7S9JQjMrWkf7N2NDG1wV82HA+earJmAsvNh2rm8?=
 =?us-ascii?Q?6jX9VUU07XhgEmGkaEaDGL/rB7/KP5tMr46WbSwGFpJIVztULixDNsAz2+jI?=
 =?us-ascii?Q?Dk0bszN5UWSBZ0Y5L8PXzxSxhPCbRzniLNPfjo+l4g3osu2bdKiV7H9Kkkln?=
 =?us-ascii?Q?9ik4hkYLE4Drq8Cswc7uOAZzIrUuZPExMMrNkAWAm1SCDGTFF4tKPnBzni/C?=
 =?us-ascii?Q?52jWEGr9pq/58FvW1jUBuX84gEGHQE9ZMdh+yPJ5wyb0w1x7D5EgoNDU4FGc?=
 =?us-ascii?Q?UrgHfEYJEDZ6SgNonHTbjA5bVLmaBBDtNiLiDQdCeouef00fU6mG1rJpIWvf?=
 =?us-ascii?Q?qDS9GF/6ZfAG/enC+BQoQzIkrCkXLXw8icm3s2/jsUWCkGoteUg/3Q4zzB6D?=
 =?us-ascii?Q?Y5Fcg7OcLDK8UdjUMbHHscQRdgh0PIHhfDsmjN3S?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b9929a-3a73-4e28-53c2-08dd5bcca9b7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 10:01:13.7403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6TN7QPcSFKNn9zEEDs3gFfYxfQ9QWwAp0zdjtxUFFGjyheMmiWXR8rWLVUkcFZQDaavMhK8N9ATkiN/4gD9KKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10541

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

