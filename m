Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BFBC433B4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 02:10:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FB25611BD
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 02:10:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbhDHCKU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Apr 2021 22:10:20 -0400
Received: from mail-eopbgr80087.outbound.protection.outlook.com ([40.107.8.87]:53176
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230305AbhDHCKU (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Apr 2021 22:10:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPkxL8LC1xvdbPvUzUIkI5GSASen6xzR4XwwNfzYY4F0fx6AfTX4CZo7u+SEHCA246MGSyD5lJL6OoeVcFgZp+B7H87zvIdIT6+2LFr4P+IjfPShbhkcEzO90olTX6AYfWfH/2qyij7Rk1NrcVGqDknnbE5lknp0NwJmKhisAWMYtCz0KOqTIJ/81m16b/xUYHhjgOWbk7m2QaipAfn5JhrXJBfX9h/OyHCqUPX8+TI4RUtXWKNevFpDYW0qMuhd9+jtPn97NRdb7aViB8JvE/yTORQt0Gr60peAd4wDDuDXHz5uIVhtt4YJml5Th3AvxRy1qShAMAIX1dbpj9/iEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lrd3+a3w5VU5RkFSHvyqw7S/H36dGznhA87ifuQCLOA=;
 b=RPdDR/GZ6LF1Fn1l7hdP17KqJ+pWyOy8r0n/eT5QSx4uxfdUc1ZVmzD2hSbK646+JzHyLxi83U1UxCXT3JNEBIdPmjfUl1WElg3uCw5eNy+kMy0G3YQSGzGmNCcDoE7MWOUTHtdUMrKJHawRChssAzAOz6XpLNKXGuoMadn2v6NGYF/WOFKeY6V3OviTmG4POhepFjOKvub4Ry0dH1DX4HUdVeHOfsrYIpkCWLlEb+zNdRNXopdKEsLTpoCt3KSGgqd0C3qQCiEZCtrTG9fWOHOFEUGExwg8JAqvwMV7aQlgMdQeWDW91Y7uO1cfUx+MfIYI1R5qmpdyfymJ82MgxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lrd3+a3w5VU5RkFSHvyqw7S/H36dGznhA87ifuQCLOA=;
 b=P9fLYYumcMdAt1AI9ejdZ3285DPSvM+RJeYnRG2wa6V4j5Fip632WaMvJbsy0BbmnDLlMstz+TBL87shCTUzdLrB63bO4GX2+p6eOHwlEfkZ8m1Dl1oxk/1dkDGh/zcSeLR8rUlXrwyCHhYCpfHuvS3QWF0sl8XMGJhD4dbdvbQ=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6857.eurprd04.prod.outlook.com (2603:10a6:10:114::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Thu, 8 Apr
 2021 02:10:05 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 02:10:05 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 5/8] remoteproc: imx_rproc: parse fsl,auto-boot
Date:   Thu,  8 Apr 2021 09:54:55 +0800
Message-Id: <1617846898-13662-6-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617846898-13662-1-git-send-email-peng.fan@oss.nxp.com>
References: <1617846898-13662-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2P15301CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::29) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4042.4 via Frontend Transport; Thu, 8 Apr 2021 02:10:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e16a9c6-3a66-4e0b-1ee1-08d8fa336cf6
X-MS-TrafficTypeDiagnostic: DB8PR04MB6857:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB685729FAD19FA40895A346B7C9749@DB8PR04MB6857.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ugYIUX4TxZmay6Zm8XQ5MyPkwlugO2jAxmgpXcTXYWiRiHlyGFEJSmjZm3pcIedb68FFGH5N4yEeoO+naEY/rWlqOLtiZCHbWmEymiVYSioZn3kpwKq46KSdnjtovkPV9pRMzLveWTipgW8A93Wek5hj7ydo8LtGogkTj3qtnn5krkrdCVkv0FknmQgtvMgkYTAE+J3himXGNUreegmeQOZgnxCsLT6uYWjf4rpEtkwgAlPYnM4wdH8cs4icppsm6CreLUPALE6L1Ybnqu8cywyHEA3CYfNx9/hKXR9rKC+jxQj6lnfrp/kLRhNtqgnSX9nH4oly9VIrAPSXT1cN83fnEfv3HbOYNhBPVPVUKf8lzyjBwyjfGGKqU/ArSZiRsvtP7w5AFUemP7c6LF1JfNIQEhaFlitPAhrXdoSTomKkKgb/cELKPGAkROs0qidR5YRGDllyifrKdHZNqgW78KVTWfUC3QnUEWWZz78fCSRPeU7aZ6f8VJh2aYI5yeQOGLuPsEQ72rgN7EZLKyrJ5cLXhrpMTNmW43RadrfXBFB60275IhdqgadyFqPnlelJ6i28X2V2nnOwPaGyZvhgh/9lRwKe3zjKjCSSq/Se3UuxmiW/LYx5/Z3A90tdJaekZn25ko3gJsnU8fuhb+Qe2Cc4rZqE0MPN9JTBFzTEmvnUBCJA7wTWbcj5LzfllbSviz7NroDhYzbgozOaCE/V2I86acxjyuH71J0jv+M+eQM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(38350700001)(8936002)(6486002)(4326008)(6506007)(52116002)(9686003)(6512007)(8676002)(2906002)(316002)(478600001)(86362001)(69590400012)(2616005)(7416002)(956004)(186003)(16526019)(26005)(6666004)(66476007)(5660300002)(66946007)(66556008)(38100700001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/8Z4FAhpaEaGGdmWVhcmXEqsu53IfbXGxIS8KJ1X/ZJS3bCIRHGgiC1tZNVy?=
 =?us-ascii?Q?OvCQ8wdrC6wwAe6W7i1PVQ0vdcr8v1WaaLoYIaUt7tU3gkfT98spErdCD9ke?=
 =?us-ascii?Q?gdA5pHdUhvD5m+xrB2vxJLMqn9zQy0Aona3lGc5oTBgTs3S3q4G7VSOioVJ9?=
 =?us-ascii?Q?nSF15BrXjKp2N1Q/rSy+Ul2LjsK/sSbMNswkIYnheF6qHVC6RhJzpiUVvdm2?=
 =?us-ascii?Q?lwOtwgwMFqi3dTZOcvM3t01gCeh5iilHeaYjLa5/kAOSDA1PtNXKeI0G3IT1?=
 =?us-ascii?Q?nrfXlDqBLzsnNynK8b67PHeaDlc/6SVbHJGQdGosDADusZdfn+zLbl6iQtJz?=
 =?us-ascii?Q?pVymmSzijvUO1lWSUiMv2EWn6Tq01B/dzz5b1hrfIw56ITugd+P2/x3yppcF?=
 =?us-ascii?Q?MexCbthM6nz13TO87USVyupsUX5Ocyy8nEkXLLt6v/GBD32mE41Dk+l88nk+?=
 =?us-ascii?Q?Kj5tI3GkQacZAIKlD4t+YeZuN1hy+d4A/iUpOMKmhimEqq9HyTXIkxP4VMe1?=
 =?us-ascii?Q?BB8ZvufpVZlhurp321n4st0AhlYf/zZlVIUBXVAgEm71Iu30L540tmy8rSQl?=
 =?us-ascii?Q?3i7CUmFgOjcZV7ogC4oWn9UHBgv7tQ3BvkV6fl8ybzGxIH28R3eaFp6waFEq?=
 =?us-ascii?Q?p4y0KPzaGk0VCMq0ViWP2qLHgeSAYjts7dfTG/wHUZERJVG2p6SGIKjb6lhz?=
 =?us-ascii?Q?mpXPythdLZZ08naDVe2CX1cFj9t8HpHeUVsPIWfw8rCCMA31KIAYCLUlNJJq?=
 =?us-ascii?Q?b1v+R0tSh4W+QnwhmJN8GpfGapanxmgSyjqHDR4rwKA2xUGlQb6e+sbRgJhp?=
 =?us-ascii?Q?i+jf5hLnadIl0hySUn+MwYFyV+HIpUfdGa9XKC4EvXy4uPJ0fiZXJM3Cjrdm?=
 =?us-ascii?Q?DHuuHGbMRsGOIwKeI9y38Z3k9/eRi3z9788qSx6y2Y0tHzw6tuXbt5HTi9FB?=
 =?us-ascii?Q?qJWOmpJ/72QR55GxjbkO7cbHGV5PJnfmO+pb3pC+fhTJdEek6mg6hIw4KIwW?=
 =?us-ascii?Q?3V7fGqUk9sC2P0fsMqdHlmjSrpeI35KuTFPbWOUZZEwcFR3p/Hpz7N1gXkbT?=
 =?us-ascii?Q?jotKVrK/DkmFChoG0P8iIs+Jiw1x8kUvUp67Io9wXdoPDWndXhUC0xQ99r7b?=
 =?us-ascii?Q?/vUl/7nrjQHQfzFM+Lz8cnRY5lUk6pbRKHNj+H5iq/7QsFVw8PNuhJQbAqkL?=
 =?us-ascii?Q?RzHBQVXJHMcJ4MLrRv1WUdvjR9FIzIldqowEcVFWOB0ANMRnnqriE0Cxl6wr?=
 =?us-ascii?Q?h4NFyQ46hQl+3rluA5uuYJCbes86Bm37LQmA775Cs31+nRwbAIrQY6aIV1WD?=
 =?us-ascii?Q?/Tlh/S8HCwlge1TOH9ZX78mWUVXarapjX8uMt/4ts8ekVg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e16a9c6-3a66-4e0b-1ee1-08d8fa336cf6
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 02:10:05.2749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rOrdlihMWJ/2qnEd8YNfqLYyPCiIMAaOmwWN6P1Gbqdf8tE4I1s1/Ow3pMvLqgyI63kXdClEd5VkN6pnhCKjRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6857
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Parse fsl,auto-boot to indicate whether need remoteproc framework
auto boot or not.

When remote processor is booted before Linux Kernel up, do not parse
fsl,auto-boot. So add an entry to store the working mode of remote
processor. Currently only IMX_RPROC_NORMAL, IMX_RPROC_EARLY_BOOT.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index ca17f520d904..c576e12d3817 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -83,6 +83,16 @@ struct imx_rproc_dcfg {
 	size_t				att_size;
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
 struct imx_rproc {
 	struct device			*dev;
 	struct regmap			*regmap;
@@ -96,6 +106,7 @@ struct imx_rproc {
 	struct work_struct		rproc_work;
 	struct workqueue_struct		*workqueue;
 	void __iomem			*rsc_table;
+	enum imx_rproc_mode		mode;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
@@ -565,14 +576,18 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	int ret;
 	u32 val;
 
+	priv->mode = IMX_RPROC_NORMAL;
+
 	ret = regmap_read(priv->regmap, dcfg->src_reg, &val);
 	if (ret) {
 		dev_err(dev, "Failed to read src\n");
 		return ret;
 	}
 
-	if (!(val & dcfg->src_stop))
+	if (!(val & dcfg->src_stop)) {
+		priv->mode = IMX_RPROC_EARLY_BOOT;
 		priv->rproc->state = RPROC_DETACHED;
+	}
 
 	return 0;
 }
@@ -654,6 +669,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
 
+	if (priv->mode == IMX_RPROC_NORMAL)
+		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
+
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");
-- 
2.30.0

