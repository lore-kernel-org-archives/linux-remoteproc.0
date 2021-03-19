Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B04C433E0
	for <linux-remoteproc@archiver.kernel.org>; Fri, 19 Mar 2021 10:17:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEDB064F1F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 19 Mar 2021 10:17:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhCSKQZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 19 Mar 2021 06:16:25 -0400
Received: from mail-eopbgr40059.outbound.protection.outlook.com ([40.107.4.59]:40287
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229720AbhCSKQX (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 19 Mar 2021 06:16:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lP3B2q9gaYAtIENYOp0u3/uBjIVXt3ZMEEbUGTwzMbbr082KE9oVfnSd/Ubjz5KPF5W44OY6Sdi47eMgmTpWRwo+lBHBAh6DDOGayjXN4fC7KOHdzS8et7jhOlAyhiLSWeAQAcYvWsqqaJexQvqzAw180K/nwblTQ23XW7X0dfKdyNp4+MNDQVkrarSvgIMr45LuY+CC5bXhKLseojacP5/xzr0DDc+oYvA9nsdkHxug9Vb/IaGGEfbcUHNNf11DPOj677PQwlpfojT6dzX8fws/7JzsdJafO3jLX9cHK3HTpwD/0f47NmY6nY/kIGNvDxMwexB8G0yNHyMr37GU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuCPuN4VdnfXo8onp4yP3064s5vYqLa1xQpgmgwj6Mo=;
 b=nnSW2eHQaJOJw7WluPIVlugwqUovZY6vFUPX3LuOM1gk499mHR0I7WqPyK1xx6GnawN4xncROcru2iF8cIlQE5gNGfnUplFNleoyYF2jjCrswx7/Abw84tVMGExdntnf1seVR7x47vSd45RIjbr5zSFVWjT87ciRmG2boSkQfDrs3YaiYsF04iNFMoxHX6Z5tyaiBZVHr9EmR5Gvmlyo/eQfWpCBemaC4TgJ9xecV5BLf43GVd4x4rBGNaUMRiIF4k1dzQuAuS8vQxlGqqWbt0ex+UVSi5QO75znj4UdXO4b28xmYC8dYM8bLR5JX41ZCOSvyVWnxCWQ3LFM+/S42w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuCPuN4VdnfXo8onp4yP3064s5vYqLa1xQpgmgwj6Mo=;
 b=GByoDAkPwSppuiKd20yJhWJuaHbhOWqrJ23Eksi0GDSNguwItOaQu/PHoYl1RX2rSBQOaBlP67i4ZsBsxmHvmAtU+Dw2BKmO3ZR+Nm8/AK92WFmUVQwqbOF4n4ZkcAstbFmIozdiKdqWqrEZc1OwT16D0E4T5Z3iYtMPctEZDE0=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB5803.eurprd04.prod.outlook.com (2603:10a6:10:a9::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 10:16:18 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3933.032; Fri, 19 Mar 2021
 10:16:18 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 2/2] remoteproc: imx_rproc: support remote cores booted before Linux Kernel
Date:   Fri, 19 Mar 2021 18:47:08 +0800
Message-Id: <20210319104708.7754-2-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210319104708.7754-1-peng.fan@oss.nxp.com>
References: <20210319104708.7754-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: MAXPR0101CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::16) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by MAXPR0101CA0030.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:d::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 10:16:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a7231efc-144f-458b-ec24-08d8eac008d1
X-MS-TrafficTypeDiagnostic: DB8PR04MB5803:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB58030E14231A6D1C11BA65D5C9689@DB8PR04MB5803.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z029hehTRuS5LOX9CeoDvQ8g2vBn0NZxL+e2MPveegxnR5ciT0rUiKZSb4rN9fo8TXsB9AzWrJvj8SqUdoE6TW0fp0Z/7QgAXfqDPjCDtT0eCIlb4Jspv8rQBC8Ey93ZIZX/JK83ZWJNTCb+Ir0uC6gJXYEqCEzm8qsZ9It4TqPxvzVdYJnM4x46eeXMW/23MO33m/jUbkhL57RQdl0hWTXcJtm/eYEPi/Un2vLxaCSGMSK7r6O9hD577hezSUIwWs1QL0OPYlDf5AeGMwMnzUD9x2GE2bXHyvn/LCFFr20hv9byZIarTD55PU0Pdx4EdVBRhvYEDLgG7V3dTGbmhZyYtJHNeNEpzfumnCdoJM4M4RK1+XVqT9afMNFOcAZvhGcXAquWL6EK6EmDsrPOLbt+Dpjm3yy0kltIbWi+nMIykgZYMtA/Wh1RVtvxxgIZst3vYDgOUrRHegL7lBlXyReaNG02qAgiRw34TRRzeQHt7RlTVBF422xKAYKK4GStmuEPSqgna2E38KFYMBkpZJ2MDGCbqHgs7AreOPdywybVqPt+nT3g61j3uJn15elAA7ECsTIZk8XSpsAS+/kQBOzGJl9oVeytt76kSTH1YQU4xD1RORQ8LftA9jNarNzJ0dzYRskCDK7wedTGz6CUT5KY8qtw9+zYAk6e50eaOBg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(2616005)(8936002)(316002)(956004)(26005)(38100700001)(8676002)(6512007)(7416002)(66946007)(66556008)(5660300002)(52116002)(6666004)(6486002)(2906002)(6506007)(186003)(86362001)(66476007)(16526019)(83380400001)(478600001)(4326008)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VDCLPtd34M9+oZ6QhKo3KzvKfkWrBGkY7vrUtgnZbAWZuScuxyMKuG2x0WbS?=
 =?us-ascii?Q?Di4p1k2aWhgATNRlcTscgfyljr7M0zmPKqmFP4TZR5iapxnjdqfIyfZHN1sN?=
 =?us-ascii?Q?ItPDoTO7ML/D9P6YvqSDR7028RoC6rOVPiV4W/eqAKuCC720eChuavky1+A9?=
 =?us-ascii?Q?CC2Vz973M46GyDW671BNcBxTSQl+eupVozBUBGT+9F6yzpIJ5cnMr13ZVxwM?=
 =?us-ascii?Q?UCdaayQEIshRQVXrVC/Rlo3hZo242KlXIOJAzVhSYVV7hl7Ro/Pf7LMIk4eP?=
 =?us-ascii?Q?acGwCUEb95oQ38hF/I7l3UwtGbmV0ASrPSxIsvGgY77KLXbsGlR0K7Waycle?=
 =?us-ascii?Q?RGUto7ribi0Bxr0NNsYDlVaiCa/bGp20mzUgest/PeT+2WZ2iYauxmGnh7ja?=
 =?us-ascii?Q?ntvjd3sH/ZP5oygNV2BDmnTh9eaR4JhErhDzWsrDloIEVw42Ht52SrvL4I4w?=
 =?us-ascii?Q?DR7f//1wJdkzx0rnqd5D+pw9YDSj5rkZFRW7+jBwaNovMArBiJdOnZC0+E8G?=
 =?us-ascii?Q?rVkRYvLjMjU9CNVHhUyUBd2vvi5zsYm2quMDGPD53J2B7ah58fvgPi/TrIR0?=
 =?us-ascii?Q?ipA1KXwc7LJCfEG50gPSEU4QCM4hHevppiO9MxcuDLGjHs1CGpULAdnVZ5E7?=
 =?us-ascii?Q?7RLL1OIqHHDwGgvl1PRFnZs8yAvAM35P0O4U3zOq0W9Dp+sU3kblFLQEHww6?=
 =?us-ascii?Q?fKz6o8vi/Y73yHFUvoPfCKx+EP5xK4+T7sR8vNC1piGi6VtlhAi2SVbglEAn?=
 =?us-ascii?Q?t6+HIVkC0d7pXg/kSsjlPYaAdwZljroMQkAFW9Wh3s7UzmM7IG2WDDi2YgIP?=
 =?us-ascii?Q?AAc2CVnxosWj9jyYTLc4ZWrCcDZmEmsWxxGI0XUQZQgEVXk8SKjnJ38cjZbR?=
 =?us-ascii?Q?txS0MVl6AWUIazVfYejXWPypiKG4ceEeXCTPejtzZrTeox/9XvOXKjAVLYy0?=
 =?us-ascii?Q?MCXmKe7163amOMMJkf8d3GIqSKGGNpTf6Q3fjyfLuBJqEkqPr8dQfXA9pb8f?=
 =?us-ascii?Q?KtCzj4dCnbVUc6n9u/GcnxvmBELsetlx5RZslTCBCbLmwU6qFroQqzP5yObO?=
 =?us-ascii?Q?hkNEbXHjeoGoc3kIIINFrGFeBsFzV3Y8Xa6mnMO9kdEOBHH9F2XL/K6I3DBp?=
 =?us-ascii?Q?ZvJwwlmcM9AeWqxI5EWE9okGGJmC1qHvqYo/Zuqj0lDAkLsEyMjezFIcRXTw?=
 =?us-ascii?Q?7+7mOsC69Iu+cIV70IdbFI12d/gjqgh2NC44yIP0AWj7pnc1AV8wt1u/zbf2?=
 =?us-ascii?Q?fp/eJvKfFqK6T4gQa5ZdUrMXp1yCZfeGP4RIqo39/C7BhZ8Rk4eGSMV2TVy5?=
 =?us-ascii?Q?6dQhCfNc2MS7YljajoldZQ5K5yttWdS9LbMCbzYFQ6slMg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7231efc-144f-458b-ec24-08d8eac008d1
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 10:16:17.9019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVvQDP6fWR65GyoiRuPnTMqRvXMlYuOvNzLaolBN4v24s9gUz/0E2N5zcqwckYLDjBORft3RXJfykcw7MmOITg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5803
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Support remote cores booted before Linux Kernel booting.

Add rsc_table to hold the resource table published by remote cores
Add attach hook
Add imx_rproc_detect_mode to detect remote cores' working mode, and if
remote cores are booted before booting Linux Kernel, parse the memory
regions and initialize the table_ptr, table_sz, cached_table.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 64 ++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 24275429a7cc..fdaaf7599cc8 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -74,6 +74,16 @@ struct imx_rproc_att {
 	int flags;
 };
 
+enum imx_rproc_mode {
+	/* Linux load/kick remote core */
+	IMX_RPROC_NORMAL,
+	/*
+	 * remote core booted before kicking Linux, and remote core
+	 * could be stopped & restarted by Linux
+	 */
+	IMX_RPROC_EARLY_BOOT,
+};
+
 struct imx_rproc_dcfg {
 	u32				src_reg;
 	u32				src_mask;
@@ -95,6 +105,8 @@ struct imx_rproc {
 	struct mbox_chan		*rx_ch;
 	struct work_struct		rproc_work;
 	struct workqueue_struct		*workqueue;
+	enum imx_rproc_mode		mode;
+	void __iomem			*rsc_table;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
@@ -229,6 +241,9 @@ static int imx_rproc_stop(struct rproc *rproc)
 	if (ret)
 		dev_err(dev, "Failed to stop M4!\n");
 
+	if (priv->mode == IMX_RPROC_EARLY_BOOT)
+		priv->mode = IMX_RPROC_NORMAL;
+
 	return ret;
 }
 
@@ -398,9 +413,15 @@ static void imx_rproc_kick(struct rproc *rproc, int vqid)
 			__func__, vqid, err);
 }
 
+static int imx_rproc_attach(struct rproc *rproc)
+{
+	return 0;
+}
+
 static const struct rproc_ops imx_rproc_ops = {
 	.start		= imx_rproc_start,
 	.stop		= imx_rproc_stop,
+	.attach		= imx_rproc_attach,
 	.kick		= imx_rproc_kick,
 	.da_to_va       = imx_rproc_da_to_va,
 	.load		= rproc_elf_load_segments,
@@ -470,6 +491,8 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		}
 		priv->mem[b].sys_addr = res.start;
 		priv->mem[b].size = resource_size(&res);
+		if (!strcmp(node->name, "rsc_table"))
+			priv->rsc_table = priv->mem[b].cpu_addr;
 		b++;
 	}
 
@@ -536,6 +559,43 @@ static void imx_rproc_free_mbox(struct rproc *rproc)
 	mbox_free_channel(priv->rx_ch);
 }
 
+static int imx_rproc_detect_mode(struct imx_rproc *priv)
+{
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct rproc *rproc = priv->rproc;
+	struct device *dev = priv->dev;
+	int ret;
+	u32 val;
+
+	ret = regmap_read(priv->regmap, dcfg->src_reg, &val);
+	if (ret) {
+		dev_err(dev, "Failed to read src\n");
+		return ret;
+	}
+
+	if (!(val & dcfg->src_stop))
+		priv->mode = IMX_RPROC_EARLY_BOOT;
+	else
+		priv->mode = IMX_RPROC_NORMAL;
+
+	if (priv->mode == IMX_RPROC_EARLY_BOOT) {
+		priv->rproc->state = RPROC_DETACHED;
+
+		ret = imx_rproc_parse_memory_regions(priv->rproc);
+		if (ret)
+			return ret;
+
+		if (!priv->rsc_table)
+			return 0;
+
+		rproc->table_ptr = (struct resource_table *)priv->rsc_table;
+		rproc->table_sz = SZ_1K;
+		rproc->cached_table = NULL;
+	}
+
+	return 0;
+}
+
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -590,6 +650,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		goto err_put_mbox;
 	}
 
+	ret = imx_rproc_detect_mode(priv);
+	if (ret)
+		goto err_put_mbox;
+
 	priv->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(priv->clk)) {
 		dev_err(dev, "Failed to get clock\n");
-- 
2.30.0

