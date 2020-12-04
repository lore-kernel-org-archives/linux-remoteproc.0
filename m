Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5584C4361A
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Dec 2020 07:14:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73C5020639
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Dec 2020 07:14:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728676AbgLDHOp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Dec 2020 02:14:45 -0500
Received: from mail-eopbgr60075.outbound.protection.outlook.com ([40.107.6.75]:2951
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728473AbgLDHOo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Dec 2020 02:14:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCDO8BZrLqgpUq5M9hZxGaxlaCjMMc9bauKSX15ZYQSfN4TkHOaJW8dYJAoJFj0jnedBe5PpEFExiQHTIiPLfyxT3Gw4KS8cB3HtvO/Q0eZ4f2S3XY0oGIAOqm6Ps9jMeNs/spDQ3ShzuHZb02XBJA2aJiD0jriqUsD3qgbXfwjk8ETSa6L3qhQFITY6lbH/oMrHho1rHjgFHnMfI88UysBpySlbw5PkMgLAHUC8+w4dFVmhPUxV3FuexywceTHi0ZI4tdu1t5B52Onq8BfRTPoczrhu3CGilkj2M5kToUdnaZmFxhFHb3MO9yol3CACZspzQqhjoJfkK6I5ZLWy+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69mDimMzLu3IO5s4RcOT8U6CJdzR21tb+dih4rXAJvQ=;
 b=NQR3pHt9kCK6Z4Qwoul53lgoHfzQf6eXahpVqQlV9KceCbc/jLVNaWJPqw/LlHpFMmi0wAwOMELRbOmXSve4vreGMxyICVV8yeYquF8vCYZkjUSThXgJMq2OtfNZfng+SNUS7LzVt61yqhd6ljGL1M6A3PgxzqYQDFC2sivpVOarBEcvXiGjBGhG7nVkwGPZTSVeaKAiCumyRsFjfwD7HmmjOzyJS21+yACNFycwTTNDBsJs9IP8Pw2GB88RUxTvCwdhx8yUVmY3I905VnKpGxjDnNKhuKmHlgyAHTbVxIMJJpblyOQje5hdOXItvEni4xBSwHiu/R6x3GH8MGLxCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69mDimMzLu3IO5s4RcOT8U6CJdzR21tb+dih4rXAJvQ=;
 b=Zeu4uW7J7t1enBkxtrgueQz3yHRWZE1ZJxBIk3w4iSHC/BvLVR+8kif9En/6Zz2wMH40ftKfKcFHod1Y09LupWyJQYigvshm7hcG2EktXOqTNsVCSaTcrRRIJHeQNmeU8l5aXREG3tEy8nEjNjcL978TNTlDjeQ+LAKvBh82ZTw=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4633.eurprd04.prod.outlook.com (2603:10a6:5:36::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Fri, 4 Dec
 2020 07:13:11 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3632.018; Fri, 4 Dec 2020
 07:13:11 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH V3 5/7] remoteproc: imx_rproc: add i.MX specific parse fw hook
Date:   Fri,  4 Dec 2020 15:40:34 +0800
Message-Id: <20201204074036.23870-6-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201204074036.23870-1-peng.fan@oss.nxp.com>
References: <20201204074036.23870-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: MAXPR0101CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::31) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by MAXPR0101CA0069.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Fri, 4 Dec 2020 07:13:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4401f702-7dee-4b3e-057d-08d898240edf
X-MS-TrafficTypeDiagnostic: DB7PR04MB4633:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4633219336D0CC87E0091A38C9F10@DB7PR04MB4633.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lwEhT/1CZAmB4FULKZYBlrsBwexy5uhWObDAu40/QWmOuDJG2h3b1y6TKpp+mjbCzNMBRFzrKwImMOqoXVfXsbstBWnG0PRvG644pvaquG4njdTM2KwsPduN5ojf9Ni2dUPdmGio88TY5mG2oXdK5WRNNSmJ83Xq1sgtthX+8uc1QmkINuRw+Y3/NXfc4iiwGntF8a/oNHtKlGHOC3cHgWFBMe7lJJQ4flbAvPDGztHNLX3gNH+69co9AFbqQZqU2+iL4IxN1UkMk+xd6mMaZVhXj2zqC10HEz/ajRi3tzsdkKpsupppDAM5besy7izlTYdajxIjOm7JnnVq50c2KA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(2616005)(86362001)(52116002)(6512007)(7416002)(1076003)(83380400001)(66946007)(66556008)(66476007)(478600001)(316002)(186003)(16526019)(8676002)(956004)(54906003)(6666004)(6506007)(2906002)(26005)(6486002)(8936002)(4326008)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OQjwKrhHaPDLjwGzgU0aL+HtuFpjlSAdLEN/48Z4MbvHD0YkEvl9i2S/i7eg?=
 =?us-ascii?Q?W9fRSn1qa6kT4aKTgkWhvprtQPLkPgLeo4yPkCW9dY2eR9uFMkm3UA6VisZa?=
 =?us-ascii?Q?lpXI0vcUkCA6UaVdq9DzYEH8ppcnHGrl+t5JulsW+jWUmx8cp21Xv4mJAEd5?=
 =?us-ascii?Q?rG4T9gjgCzf1r/c1DaYd/EGdKpGzAZMzc5Vk7bWLUCrqPPCIbmyVPeDZZsX1?=
 =?us-ascii?Q?t4VNMB7v6+pKH6ON4GhgJATjrlvNr2IGmvNeBzYVMZTe+EkqPwcgl8B3Tu8m?=
 =?us-ascii?Q?jzES3knjcDdD+G8W4xPgidaK7NmDBBy1JoZRWJDN+X5ffxWAtNQupsolSnJR?=
 =?us-ascii?Q?BuOiXZA+Vwb3IPoT0ZsKf0D9xPmwSwTnsWcl0Zopj0x6OHaWxbw3uJthduvX?=
 =?us-ascii?Q?/k7awyxYp6Yop5IrY4O7ksB465jn94bzto+H0VKUFBNTQVMuy4u2RjcegmEO?=
 =?us-ascii?Q?tCh8pny3EB6vAH4VODtQ/ZVvmWamKFjOJCtdBdu5jBKXXrMJvYbLWEJg27Bs?=
 =?us-ascii?Q?XGISOIDW0CL6mAscipz1dj1zLoy0Qp8bOWJfkrJHAGHzlicCO+KwtjJUPdXK?=
 =?us-ascii?Q?y0SwxW+uUa+F7FvCUNhZQ9MDhpxAqQNb80QlOKxV224YvvYbkb69X83BU+2S?=
 =?us-ascii?Q?KTjUzsErlTlCPIHhlz9XcwPX5GUksE2olpbNgt97Wwz+UlEruNAKLVj6lc42?=
 =?us-ascii?Q?qRcQxWdtbNSnm5GLlP6pXUVq+WoQ7SftDU8V81Or4rCMDZp8/1woBLBftJKb?=
 =?us-ascii?Q?NvBWA+gNGrBYqmf/YsjVP6g4FhmMhOWTMTNNKJD0uzrIxo9AuaYgz1Kuer6A?=
 =?us-ascii?Q?pWekHMxGMwsFPzcxYplGG/TIc1gCZcJR5IoLvZqkJ9uQuJ4MwuwSaQP/9caT?=
 =?us-ascii?Q?Q/agbcGvpJzI31HGOxA8Dy1bfHuYeICsw+z1fFaKIoba8tZ5RtGbKpb0E7qw?=
 =?us-ascii?Q?fdlMGWWcOXqryqWnuYQr4lc5R6cd6NM825Efl1TuFc7Cni/5Yw1z1WQTyhr5?=
 =?us-ascii?Q?fLw1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4401f702-7dee-4b3e-057d-08d898240edf
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 07:13:11.1995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6EqkxG6qqdC2O9T+egeM49jbxHTlf/91EKt7VAtlR87tw83BErdeF0qRPcBlh2nwo2brNGnB3Q1a0iFX0KdG0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4633
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

The hook is used to parse memory-regions and load resource table
from the address the remote processor published.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/imx_rproc.c | 93 ++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 15c7baa480d7..de44b7d6ae63 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -11,6 +11,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -243,10 +244,102 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
 	return va;
 }
 
+static int imx_rproc_mem_alloc(struct rproc *rproc,
+			       struct rproc_mem_entry *mem)
+{
+	struct device *dev = rproc->dev.parent;
+	void *va;
+
+	dev_dbg(dev, "map memory: %p+%zx\n", &mem->dma, mem->len);
+	va = ioremap_wc(mem->dma, mem->len);
+	if (IS_ERR_OR_NULL(va)) {
+		dev_err(dev, "Unable to map memory region: %p+%zx\n",
+			&mem->dma, mem->len);
+		return -ENOMEM;
+	}
+
+	/* Update memory entry va */
+	mem->va = va;
+
+	return 0;
+}
+
+static int imx_rproc_mem_release(struct rproc *rproc,
+				 struct rproc_mem_entry *mem)
+{
+	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
+	iounmap(mem->va);
+
+	return 0;
+}
+
+static int imx_rproc_parse_memory_regions(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	struct device_node *np = priv->dev->of_node;
+	struct of_phandle_iterator it;
+	struct rproc_mem_entry *mem;
+	struct reserved_mem *rmem;
+	u32 da;
+
+	/* Register associated reserved memory regions */
+	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
+	while (of_phandle_iterator_next(&it) == 0) {
+		/*
+		 * Ignore the first memory region which will be used vdev buffer.
+		 * No need to do extra handlings, rproc_add_virtio_dev will handle it.
+		 */
+		if (!strcmp(it.node->name, "vdevbuffer"))
+			continue;
+
+		rmem = of_reserved_mem_lookup(it.node);
+		if (!rmem) {
+			dev_err(priv->dev, "unable to acquire memory-region\n");
+			return -EINVAL;
+		}
+
+		/* No need to translate pa to da, i.MX use same map */
+		da = rmem->base;
+
+		/* Register memory region */
+		mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)rmem->base, rmem->size, da,
+					   imx_rproc_mem_alloc, imx_rproc_mem_release,
+					   it.node->name);
+
+		if (mem)
+			rproc_coredump_add_segment(rproc, da, rmem->size);
+		else
+			return -ENOMEM;
+
+		rproc_add_carveout(rproc, mem);
+	}
+
+	return  0;
+}
+
+static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	int ret = imx_rproc_parse_memory_regions(rproc);
+
+	if (ret)
+		return ret;
+
+	ret = rproc_elf_load_rsc_table(rproc, fw);
+	if (ret)
+		dev_info(&rproc->dev, "No resource table in elf\n");
+
+	return 0;
+}
+
 static const struct rproc_ops imx_rproc_ops = {
 	.start		= imx_rproc_start,
 	.stop		= imx_rproc_stop,
 	.da_to_va       = imx_rproc_da_to_va,
+	.load		= rproc_elf_load_segments,
+	.parse_fw	= imx_rproc_parse_fw,
+	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
+	.sanity_check	= rproc_elf_sanity_check,
+	.get_boot_addr	= rproc_elf_get_boot_addr,
 };
 
 static int imx_rproc_addr_init(struct imx_rproc *priv,
-- 
2.28.0

