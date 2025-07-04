Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013064.outbound.protection.outlook.com [40.107.159.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F48F1FE474;
	Fri,  4 Jul 2025 05:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751606876; cv=fail; b=MoiamCg4BqLvaiXFtajnZTlYtxAZwKwVYxz0Ame2v6SCrF5Sgvnzd165Yd4yOZDAstDWa/Zz9x4cbSgP34ebEcT43XGCBKj3XI84trP2lfvMVUishtL0Yqx9Q7JNZtueKQpCqpZ7y5McSJYzg19LDl2zwcUA5zTTAQ4SkNcPGdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751606876; c=relaxed/simple;
	bh=QwNAP4KHXgWX7qd1O0HhjqPdzQmI2E6s2k87VmalOwM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t5Xeor+YBd/tapJtDhpV3jjWtz+pnVjZ3CNpzPX6KMzZr90c73Jvjf8AwbMnIni7PnWDBMV2PvZU5NRswvpIdK+3kl9ZCgoorqahCY5bVTtpqzaDfNMTacAFccaQ3Vt6FX1ZIoGyPlUjkiQ1uYMAL/2LjMtvAJQKB1HaHAQJkOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Nw3oW/6d; arc=fail smtp.client-ip=40.107.159.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Nw3oW/6d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mithRvsYFNbHd2ZdbXgIU5tqg2/KdSKmQkMgAJ2xtJknCqpXcXaWDTN95D7dsLaz3cT74YTobZKwP3rWMWU2rT0BIjhJivzsJhpfUNABKax/8RYeNqDREe8zQZefHGirAl6emSQzv4grAfPZlzBw8izN+X/38cjcVs4f2W38HzL62JG5FmhfeTKQDU2FG4Q5E3aHar9TBJMvU0aa454KjF5d2ks8qSS8UsjgBRn7tKM5qh206MJnirc1XJxh8fkLo7M8NAcU7tKC3erEnbXJ/j1G1mrhpAv6R74N7mz2bJNa3r4tuO3/spY4fZJVtpLX1BOy3B3y9lsdrRzm8OvnSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmhzKn7wTIyOm2409lmHOF4NK/ItxwWYa+FX18nzZW0=;
 b=qktAOjCFsE0dNdLm5QuQKOOMbV7QO/A6S1xtda3kqj4mgN8YMpty4c+dq5SARHFMKkFZBBSvAFpUKNtTiKPw+netDBNXAdYWSa+0Bicvoc1iO9d5pXCjNF9gP644+BxLulxTRdYpkQJtwOCzz26prfVVMyDWn14roe6jcNE+hGS/ZA/WN9m+t2Xyta4g5cbmci2T4X1cAaXbgJEvNAqyGINezSVdFeEGYhUOEIQI4++n1hu0Rp92A6q6di7iUqEr5UcrnBO8a1uYoqFI0EBoNtbTegsPVul7nbKSYOdF5T8kqoIc715G4GVuvHYQ99jX0p4wMiE1cbVWlmU9P9Umuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmhzKn7wTIyOm2409lmHOF4NK/ItxwWYa+FX18nzZW0=;
 b=Nw3oW/6dOxrBHzJkxYQFw14R+eOowOlCjZ9UaxHXGHxKIqCQcLLoUp3dJ4V22uBrWaLCEdgHy+J7MwKnVQWzk1MG8Hhj7Xp5Q7jBO3WcuDkp7JaLiUoNCkywR3IVioiEP7ntgNf2RKVNxmgEvZZPpm9DYOL4+EGKrZjHR1yK+7bxHzOJJ1wtuXfoXGG4BwhYOjvt3mzCuvMBxDo1LGH1NWQzLEj2Wz9M4DsHY7VgUZa3HexfjtMYrCuvp8FHvF6Rkmum4+H42UylIjGUpZqBz9jIPWS+Hi0LL1CDevhIA9NM+EjHQtaoG89RQh8m+SmsU0Lbuz87H9Zka+gVMQO4cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by FRWPR04MB11197.eurprd04.prod.outlook.com (2603:10a6:d10:170::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 05:27:51 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 05:27:51 +0000
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
Subject: [PATCH v2 1/2] remoteproc: imx_dsp_rproc: Add support of recovery process
Date: Fri,  4 Jul 2025 13:25:28 +0800
Message-Id: <20250704052529.1040602-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250704052529.1040602-1-shengjiu.wang@nxp.com>
References: <20250704052529.1040602-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::10) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|FRWPR04MB11197:EE_
X-MS-Office365-Filtering-Correlation-Id: bb07db0e-d3e3-4190-ff82-08ddbabb8519
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|19092799006|7416014|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qtPY8SNjkEKtGGMgufijz68TpoWSzlYXF+NSXib21dsGKv5tXkldhnxABTGM?=
 =?us-ascii?Q?jzxZWhMt/JRJOjYwKpomErigYBj35AX/s+FkH5sswiPK1Tbs4OrYelZ5xagm?=
 =?us-ascii?Q?l2WduGyWtiEio7fu7aK3iC2uJTmYcbpkuLNCj3IldxCEqq/IQ8FbpqWaNQlO?=
 =?us-ascii?Q?lIbwUqNVwG+7AkpQzwnAy7VWuLAVmiNGiOUGKqfm3KNuZCm2Eun21mRF6eiB?=
 =?us-ascii?Q?QfZYVLCgm3ybUIb/v5oiQ6k+yQTcakNsP2FIAmE6AklDkNF7TWO0aoJnbX39?=
 =?us-ascii?Q?yJPj71UoqUD8eMqbZNJo/PYqQwcTPygnXA3529tT2x8iztMcvTgGb5z9Szjk?=
 =?us-ascii?Q?y/oKk9foGfsSqXrWkvrXWBgRiUv/HPcly7Cb1wsiBWk1ZzgYlk1lcng/pcTh?=
 =?us-ascii?Q?vDfMZA3+NVg3PauGOUYaNO2TyxBYEjNz/NAJADOI0BnJX8vrfxpo8coIVF24?=
 =?us-ascii?Q?zK/XxkXsotSkoS1qg1Wia909Zux0qCuuNvFlY7v02acY2Y4O3i3mnvM2bPuQ?=
 =?us-ascii?Q?3WHFstAL1cZhifJ2apsLm5FtAtGqxLCdh8SnLDvBU6U4JgqiptUTasJskf3r?=
 =?us-ascii?Q?pGk/T21q7GN/pBhAKy+ploUM/ayByEEn/i2KRI6OfSeetMsmrG5YTS9XFRZG?=
 =?us-ascii?Q?Ln/5Eqyho5NxwqRlgeuX9enjx/Cmb7tkqcLXzeyd1G6OBUGxpG3+3qGvqsaP?=
 =?us-ascii?Q?tvJMpY8944kR3qiEaOvNlm1cc3qyxyJgZ3vU9sgvIB4Bf2g1KR9pwFtS+F64?=
 =?us-ascii?Q?7BFgfPToBO6v+hSKGF/SUchO0whNkuq1Tffoqpiy+3vcIcG71DWFGj4Aug9+?=
 =?us-ascii?Q?J+x8DJrilzxbsBalpb0e6WM0pAQ1vW6dpUvEvQhIf4RnBNyuPhTsKdQokvFg?=
 =?us-ascii?Q?1Ehffcl7+qIgdUDhcG86i9a70qsUi3GgkVzXyF+9LALo6siFH7CCu1wLWdj0?=
 =?us-ascii?Q?6m2fKtWEpdAi9HMo79m5D27ZYZu+593wnjFQP0uWLORWEbIrW9Rh1MfmNn4n?=
 =?us-ascii?Q?99UObstC7dGGo+36ORvuP5mg1UU+w76RIsZglKTwIAQCiBswd1LZRdS2dFtc?=
 =?us-ascii?Q?+4iUx+6oNPaA6IB30sG3CPdNJAj0eGQgjIWjmwPOc0wV0BkNWsVYH2ltNMb9?=
 =?us-ascii?Q?X2oBbcvxHehP/G3aqnMi/gr5epxUiwRrTjFbpQRsygG6ccaL2ao7CZxFWgVW?=
 =?us-ascii?Q?hxrwSL+if3zri7dJNaKf4cOnrHx8hTmC0a7BuN8xWobC4Gg3ZXRyXvQKVlDd?=
 =?us-ascii?Q?UNj0YE2LwiNAb/S90rLgy9a6xTPeMuCf7OJB6ewLpVFkXgHs0b7wpFHJulnw?=
 =?us-ascii?Q?AdjANvUlghXkVN4h18qEYnhafg2nF89DIWY4yFhqKsHDVuvJry+NG0KJdClR?=
 =?us-ascii?Q?9W2LjtlK9XSmsyweBp2AMiq61yJhcyMBBaODJBi+4ROocBQ57hrIiFwH2C8x?=
 =?us-ascii?Q?t7a5se0YeG1N8695CI5UTlNCGZv0RfCp+e19eHs6yNFrJ9omO95EgxTgaruX?=
 =?us-ascii?Q?Na8Tz7jpr6CEi9M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(19092799006)(7416014)(376014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y8fzcR5C4VOCi1405nMFaIekwZFKbU6aLJdPF6bJ7p5vYutycIehLzulntvv?=
 =?us-ascii?Q?sn34/1TKAgHnNK79ctqD5V6HRuwa5qRPka4/h7qbISif3cF30q216DXMhn7s?=
 =?us-ascii?Q?HYFCKnJlt2bre4EsnmO3CxthrRGEoU6MCTxu/W2pC17T+WzKNNYRiim6dnXP?=
 =?us-ascii?Q?peHYv+SdvrscFsZqKfDAqa2O61k5m9ctKl5/qIQygeK9MWgfuFoDW9rS+4Zt?=
 =?us-ascii?Q?aUTsKzKePWXIqIjlSnveRdIIeuLA1xZaJFLpjg7EhobD7a1PQniNJUPr/IQC?=
 =?us-ascii?Q?bTM1naLkvWDMe8mdlCFc6fyGYKBE5ZvAXv8cIcu70QEj3pjqBy6k/+efsS0t?=
 =?us-ascii?Q?iQhYgWZeCcIGBNeG/qm/WHPILfRPD/kP0RrSHP1nNfbWJdJ4U1qci3EGZRL3?=
 =?us-ascii?Q?1+XLw8QwcCSeBSCFvcud+dc/0lkKZBq8eozXsEyVWI9jFwsG/fnox+5i3Uql?=
 =?us-ascii?Q?glDZ74zt0T3kLEa1vo5UEoXDJ1yEqPDjdlmraFunoQ8qeMLkBd6eQXLcQJIg?=
 =?us-ascii?Q?S2vCJeGWgtG8JCmlPtIi6wlknn3/fjGWpWE9WwRu3HwwyrVPoayVVmVmf4iY?=
 =?us-ascii?Q?t3VCJ3iB2zyvQwKITBvo9PJoXX+VkdXQYDFCoNX1PDASdVcmhSV1vx6OmzTA?=
 =?us-ascii?Q?itoBtRDdFmgDjwUncmvR6smw4+2JGgLs8dQdFsSA8oavRFkehqNCbADwQKuw?=
 =?us-ascii?Q?Dzpcz9c7Urol2p2bw/4gC2p1z8duKEeQSRWao8wPaiSddK6YKiUL5FjZy9Pe?=
 =?us-ascii?Q?lgeI4WG374LslXPrOyfW/ZyNxrjInbEBGe0rgK5X+EW4mVN4cvnDxET32nwi?=
 =?us-ascii?Q?bMoEOZThiQTJfBPXtlcRBActpNKdm7ZS9flaQ9muglLceU8XOmdzikZWO5bA?=
 =?us-ascii?Q?q8cE8swLE9CsSnyWW0rgyBgvvMk8ib2C7Qjw5ok/8JCHnnYdMyAbX743vNjh?=
 =?us-ascii?Q?C2TW56Rnm02oXM3BrP9ARTq7QPV9qIgqtPzZ14YtvEWSFLzc+LOhwgI5Y1UF?=
 =?us-ascii?Q?cUsg1NJjKDo5Tj2cWcvIkv9Awx9bFcLyBUskCpzBC57sRU7lPMPonWTvwVZN?=
 =?us-ascii?Q?WPb5MNtdf3eKMDfuuh/uXa53UACObtoOCUu7lvOHCdXBIuDOmlIBamTAb+83?=
 =?us-ascii?Q?YqEqrKmBBrOfwlkHiuY6RzjZG/0ksWJNvIRUyC+Cdmk2T00khuCgphQQ9FxI?=
 =?us-ascii?Q?7XGuC/KKxrTs2x0dpMt0/cOdvCZhd6sLs4Okdh95KIil72CYg8eChgBrQD+p?=
 =?us-ascii?Q?ygC9aaGUlc+6prW4G3GBfXZU9ZTSaM4vFbwgLlMk2++ZkX5WBahpfyb07ii3?=
 =?us-ascii?Q?swM3ee+A81B8grD7MIRaReGYearhAMA8QCVKbM8Y7DrlHZGO4104rZBGiUBn?=
 =?us-ascii?Q?ua6N0lvEvBFe/0048gaPIzyZ3cmv84srWHObLkDWFyOhK6iV39CtFuXpuxIA?=
 =?us-ascii?Q?x157IvSK1HfY/aqH5I5HgtRetm/WD94HSnqdQdZBDbspcsJHS5rU3/maC51O?=
 =?us-ascii?Q?zP19pCJLe/yI1kEGFWtjFPXWoE8msSpi6/7kUcZCbEEuJ6/OvSO0NM7sjEry?=
 =?us-ascii?Q?NR2Ci163aZ3wkHEf6IaelR3F1jq+UGPICV5BbhAI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb07db0e-d3e3-4190-ff82-08ddbabb8519
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 05:27:51.3478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXpzAS/yntKWvYIw80W30jqVJE/fY9gYbh3Xso1UCaR7T2nkZkF2YgPldVHujpHFuiPaDb72dOwP+QjS+RzqJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11197

When recovery is triggered, rproc_stop() is called first then
rproc_start(), but there is no rproc_unprepare_device() and
rproc_prepare_device() in the flow. As the software reset is needed
before DSP starts, so move software reset from imx_dsp_runtime_resume()
to .load() to make the recovery work. And make sure memory is cleared
before loading firmware.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 43 +++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 5ee622bf5352..ba764fc55686 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -774,7 +774,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
 	struct device *dev = rproc->dev.parent;
-	struct rproc_mem_entry *carveout;
 	int ret;
 
 	ret = imx_dsp_rproc_add_carveout(priv);
@@ -785,15 +784,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
 
 	pm_runtime_get_sync(dev);
 
-	/*
-	 * Clear buffers after pm rumtime for internal ocram is not
-	 * accessible if power and clock are not enabled.
-	 */
-	list_for_each_entry(carveout, &rproc->carveouts, node) {
-		if (carveout->va)
-			memset(carveout->va, 0, carveout->len);
-	}
-
 	return  0;
 }
 
@@ -1022,13 +1012,39 @@ static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw
 	return 0;
 }
 
+static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
+	struct rproc_mem_entry *carveout;
+	int ret;
+
+	/* Reset DSP if needed */
+	if (dsp_dcfg->reset)
+		dsp_dcfg->reset(priv);
+	/*
+	 * Clear buffers after pm rumtime for internal ocram is not
+	 * accessible if power and clock are not enabled.
+	 */
+	list_for_each_entry(carveout, &rproc->carveouts, node) {
+		if (carveout->va)
+			memset(carveout->va, 0, carveout->len);
+	}
+
+	ret = imx_dsp_rproc_elf_load_segments(rproc, fw);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static const struct rproc_ops imx_dsp_rproc_ops = {
 	.prepare	= imx_dsp_rproc_prepare,
 	.unprepare	= imx_dsp_rproc_unprepare,
 	.start		= imx_dsp_rproc_start,
 	.stop		= imx_dsp_rproc_stop,
 	.kick		= imx_dsp_rproc_kick,
-	.load		= imx_dsp_rproc_elf_load_segments,
+	.load		= imx_dsp_rproc_load,
 	.parse_fw	= imx_dsp_rproc_parse_fw,
 	.handle_rsc	= imx_dsp_rproc_handle_rsc,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
@@ -1214,7 +1230,6 @@ static int imx_dsp_runtime_resume(struct device *dev)
 {
 	struct rproc *rproc = dev_get_drvdata(dev);
 	struct imx_dsp_rproc *priv = rproc->priv;
-	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
 	int ret;
 
 	/*
@@ -1235,10 +1250,6 @@ static int imx_dsp_runtime_resume(struct device *dev)
 		return ret;
 	}
 
-	/* Reset DSP if needed */
-	if (dsp_dcfg->reset)
-		dsp_dcfg->reset(priv);
-
 	return 0;
 }
 
-- 
2.34.1

