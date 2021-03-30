Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A379C433C1
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 05:46:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C81261935
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 05:46:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbhC3Fp2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 30 Mar 2021 01:45:28 -0400
Received: from mail-eopbgr20089.outbound.protection.outlook.com ([40.107.2.89]:59207
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230339AbhC3FpE (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 30 Mar 2021 01:45:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4EPv5AkFI7agWhEy8224ZmyN+QauzN+rt2Wb6F8LoM5m56bPnQYT8O6sBL+eCYkGhi9GRX4QRLXZWgTTMXGYQEP4gkVLUt3TYpnZoileg2yTyl/OUzgMi11sihesVvM/pFtexEiOWbLR5CKU5PKLnWheN9AZno8m++aIW5mY+0syMPlGmOQLE9ZjoXztJMbQivwl9UqrHTHVFpO7m4BOHGyFzTi+F60jKNA+X8OyuyV54ZRIBjhg3ZvyjjDyC0Uo6mFNUDPIB25H4kewECR2Q5ODHuIYqF/ABYJz38YKAY90E/ndrANMpKiIlI3XMcU2lAuFgwAjr8eC73hbbIwuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQ/Ce9/BCtNp7zfaw76f0potwJPpbeCzONI2lDH/WoU=;
 b=Yvcu+X0881qS/wCI05zzVbcovck6eqq/eYv/XHM5mUucuuvuTRY+IemfBOakpyZh2xrv+0jKkZ6MgAIJDBfVAn60ngEjnUGItQjtVC0glI/+42ai/ROxcHyaYAGlS688aAVleF+Se/XDG2wMLNYLRK2E5vVkJrqcYSTLz5pzD0eYgjiddGElHwzGe0y5BJLICnGdGkvTh68KPYFQsuCn0jEbkkh0VBU2vvj09H5wThAgs4KOWrvDnHt2+rQyf5HFR8MiVob9VTNvww9HkDKniSmheWkD4jPvajn8FkkjuZmwxRxMf5HgYU6lxznxutz15qGSXAUUoitF6v6Zycqs+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQ/Ce9/BCtNp7zfaw76f0potwJPpbeCzONI2lDH/WoU=;
 b=h0MJsiQ8aKMpl8el32rzBVR+nq4P87MgDZ3k/tG5ETIiSR0LBvkkLNz8W8ZwpGH4eCjiOcqSCcKJ52fDUaTHTt6jfK0BxZHce4D5iZEJz76SkIeh2RuIPmWnzRMf9JECJZYzZCecX3KZGW2mVQ2mb+sVG41mUFs/pfuAop1pCP4=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4489.eurprd04.prod.outlook.com (2603:10a6:5:35::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 05:45:02 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3977.033; Tue, 30 Mar
 2021 05:45:01 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 4/4] remoteproc: imx_rproc: support remote cores booted before Linux Kernel
Date:   Tue, 30 Mar 2021 13:30:35 +0800
Message-Id: <1617082235-15923-5-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617082235-15923-1-git-send-email-peng.fan@oss.nxp.com>
References: <1617082235-15923-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0055.apcprd04.prod.outlook.com
 (2603:1096:202:14::23) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR04CA0055.apcprd04.prod.outlook.com (2603:1096:202:14::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.25 via Frontend Transport; Tue, 30 Mar 2021 05:44:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f44fd180-980e-4ad0-c9f8-08d8f33ef637
X-MS-TrafficTypeDiagnostic: DB7PR04MB4489:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB44892DE08EE07EBA96807725C97D9@DB7PR04MB4489.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /3uIE13ZpzilmPG6637h2u4sHA+KvIUNpJWjWcidn8hQHW+qValx3AZ7xeVRl6nfuTDeI+Np/9Du4cmtPR+4hMZTqtvtziGh1+oBi0rtR8kq/XoX3UsNzGhSS9S0NmJ62pBcn4L4HFwBMygIt/zHXNZkv1SU004W47f2gt79MRpmZ6rRwZroFKhRTS19rb/URsr087rdy/NlEYnLIx0Wi8bztzSl4WQ6TYglh33Z3HhaWTOLAaS3a7Mdqd1OZc89488ch7CB2ticmLzZ7SzAT5TDFa3SYRckQkJM6cSXF/P2ebT1lk/11tebGRJt7qUINtzm7z+uBfGe8LtjD1qDZcIZS1Vw1G927vm4sJjtWvVcwrCfoemO7u0frkyWOHbWKYK0wfcW5QsX7L3i+c7+Tm5vRihvDqpyZhUk+IvHE+JSsTDUYc4uox3LoYpp74CBLtgb72quhovj5nX042rIn/Msz2gcPDliy9bv9qc49Yr54ZXduvfHz3PR3JXSuXbIdWND494/7sY9rKEdJouP4q2cavk8w2InpYAFtdV4+pR9tqzMTMOnpzeHJs8jjjN4RHMACHbyitoAyiQHTuJ7TjRyzzJYy46cmT4JsLmy5cl6wx0puOHj3262vgH8U7QvECo9luNBikztTOckt2vpgQADoUO33b2s362xA96NPniVT4MRSuBEWkEg1otOIant
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(956004)(2616005)(86362001)(66556008)(2906002)(6666004)(9686003)(6512007)(6486002)(26005)(66476007)(66946007)(8676002)(186003)(69590400012)(478600001)(4326008)(6506007)(5660300002)(38100700001)(316002)(52116002)(8936002)(83380400001)(16526019)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NEvrRqJLNxPYJ9w598/UMR+7RztHiDGG9PC7Kaodlv6lSnIb9XkAnrM0hC3s?=
 =?us-ascii?Q?ufbX7Wqm1hTGsTr8j9PSKXlfwRHgG/ZfbM1AwMF0vVA8bqHpDaL5nLX+kMkO?=
 =?us-ascii?Q?uZCDmYxnHC2KBM0S9JLxifFRCuzZtfGsATlYLkxhkpxE/gdVi8AaFofc6RLR?=
 =?us-ascii?Q?PFdO8Gk4rgTZVTiA7XuNtFV7rS2hjwsJyEfGhsyAsshTF25CS4I5levXCv5g?=
 =?us-ascii?Q?3P+B0LgVUeewaFefkRoCuUeAVnCjabHlorrV3Awm4qHzco0PO16tyxhVGVGJ?=
 =?us-ascii?Q?PCOVzkaO4a6gpNJkepxdS8jxXYKkbtppUmX5YVA0VRnna3wiaC6SPMVgmDbe?=
 =?us-ascii?Q?nldkbKg5QrRXXj0MFVGrRE93JUpi+MtAmJYlk+s4l8ELXj1tu7Du1k9gDXbX?=
 =?us-ascii?Q?AUQLjW7wnlFTjNhJ7Z8EVIptAgMhFIRRPE22FZSACe9qFPe3/xaX2O1koSkJ?=
 =?us-ascii?Q?si61suvBlixKTsUVdkwwfI+GtoYN/0gITmMVTx47odHaM11RJtYkfJwgv3Sx?=
 =?us-ascii?Q?qblMp5Gn521JkTVwuXPSQG/JVTAnIPsIWp7C1oRzTXUH030eOVnmC6F548vT?=
 =?us-ascii?Q?EaALFS6WEIqT8QhSytFwiWXU50LCIPth4IvuNBjYUvJXMnd6mU2LMBPP0XsM?=
 =?us-ascii?Q?FWkXCETXRWwysJBb8tEkjZYuYOxgZ/pKIT7Q1JPnyZlHI1EDD/io3EHNW9xi?=
 =?us-ascii?Q?Lzlx4cGv+XreyBrhblWOLXmEXgDQB/2bLwwbkKgdkccOXSG/pKKH0SufEbkM?=
 =?us-ascii?Q?5t8HfqL1lCnDsfYtU4UWec/DfnkzPqUbybEtajaJPNZ3VA4zFVzmS5nfasaB?=
 =?us-ascii?Q?SoNed0MSc/0QvE6yifGduMPBlqUE06ablmkl8zts0fa75LVX1h5YxvACQ4Nl?=
 =?us-ascii?Q?cSYT2V2yLne3jtwBRrvkSYqfQal4wTo7bCZUa3EwSQyf8QZ+2PRA8xsDaLOK?=
 =?us-ascii?Q?kZ+U5x/B7XLaj/H8TN0HftcEeJ53fOWBUZ9CMkNfFGRXsT3FK0afMXtUg3To?=
 =?us-ascii?Q?EqeCkIyoDl79omEmfdQVgW5XRL8BMK7vS/wM9jQBtjWXOZK7WJOZ1KuGP0zV?=
 =?us-ascii?Q?I79jqzXxD5BqGSFUV2we15WTbOYjE3DoQqAcUFEPOjNIZQWswnppwRLRVBTg?=
 =?us-ascii?Q?6ksgoSju1RzG+OkAhK152m1FCaTcP/KyLfwYxSFj1YALc9b1ddF6Pi25fSzo?=
 =?us-ascii?Q?NpiNYvfgeoklW6G8hahH3tKsB3Gx6h6HCtI3U6LGnawZZxAiaY8wfu+ry6ET?=
 =?us-ascii?Q?bkxMon7KOH4P+OnpbbEt3OmbQ+l+gDYZSAvo91fLO6YXJkzuW1+mCi7D02QB?=
 =?us-ascii?Q?tHrMmXfqXJ9CdAy64OBFZHzhYRN607mYe0VbkKi5RqNEPw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f44fd180-980e-4ad0-c9f8-08d8f33ef637
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 05:45:01.8897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/2HgjTCV44zJd98bavPaVmTMyiHXzNNYDFEesadKjCgbg0Jpbvhn7N87omljGMcp+YzOGz32027bQrcaijt9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4489
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

 - Add rsc_table to hold the resource table published by remote cores.
 - Add attach hook.
 - Add imx_rproc_get_loaded_rsc_table to get resource table published by
   remote processors.
 - Add imx_rproc_detect_mode to detect remote cores' working mode.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 45 ++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 7cd09971d1a4..d6338872c6db 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -95,6 +95,7 @@ struct imx_rproc {
 	struct mbox_chan		*rx_ch;
 	struct work_struct		rproc_work;
 	struct workqueue_struct		*workqueue;
+	void __iomem			*rsc_table;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
@@ -395,8 +396,26 @@ static void imx_rproc_kick(struct rproc *rproc, int vqid)
 			__func__, vqid, err);
 }
 
+static int imx_rproc_attach(struct rproc *rproc)
+{
+	return 0;
+}
+
+static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
+{
+	struct imx_rproc *priv = rproc->priv;
+
+	/* The resource table has already been mapped in imx_rproc_addr_init */
+	if (!priv->rsc_table)
+		return NULL;
+
+	*table_sz = SZ_1K;
+	return (struct resource_table *)priv->rsc_table;
+}
+
 static const struct rproc_ops imx_rproc_ops = {
 	.prepare	= imx_rproc_prepare,
+	.attach		= imx_rproc_attach,
 	.start		= imx_rproc_start,
 	.stop		= imx_rproc_stop,
 	.kick		= imx_rproc_kick,
@@ -404,6 +423,7 @@ static const struct rproc_ops imx_rproc_ops = {
 	.load		= rproc_elf_load_segments,
 	.parse_fw	= imx_rproc_parse_fw,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
+	.get_loaded_rsc_table = imx_rproc_get_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
 };
@@ -470,6 +490,8 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		}
 		priv->mem[b].sys_addr = res.start;
 		priv->mem[b].size = resource_size(&res);
+		if (!strcmp(node->name, "rsc_table"))
+			priv->rsc_table = priv->mem[b].cpu_addr;
 		b++;
 	}
 
@@ -536,6 +558,25 @@ static void imx_rproc_free_mbox(struct rproc *rproc)
 	mbox_free_channel(priv->rx_ch);
 }
 
+static int imx_rproc_detect_mode(struct imx_rproc *priv)
+{
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
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
+		priv->rproc->state = RPROC_DETACHED;
+
+	return 0;
+}
+
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -590,6 +631,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
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

