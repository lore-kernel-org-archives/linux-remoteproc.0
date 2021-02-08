Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BA4C433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Feb 2021 09:14:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 348FE64E9B
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Feb 2021 09:14:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbhBHJNm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Feb 2021 04:13:42 -0500
Received: from mail-am6eur05on2064.outbound.protection.outlook.com ([40.107.22.64]:2528
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231438AbhBHJMB (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Feb 2021 04:12:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhbFAAdMn5uJRUnCo1oFduWayllKCVANitcfOVLB7/S7up6qKI6uA3AYKv2H4zyUKZyyFL1tDlvCPJYkoTO3hSW4w7D4AtAR44Q1SW4HOuOxgesFkYk8AYPmurhnNhNm3CSbu84D5ptjpVx+fq263CtfLi1bor+/E8M76FiBWMvN9FRG6yIy63b2k89WoAsgPFsP6p+1acdp6VFnfPrvY8JSFb5nb7zo6BvReP/LXWvb2O/uM9jBA7i87IXJ7/GmDrtcZZ1wg6Q+0ZRaczMbsQODhSRTvF3kACwOyPlYoSDTCwe2fNNfk1fKstXf9MjWfjta69/ojf2TZrvNyqtraA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wO90q2o6bhxpdxSyK+I0HmaAKEautFRECt/1AuiEMOA=;
 b=hBqDMdboEjcgxyhm+GmoUjp/9ELE9tVLaakYraZZ2hJvT2RebsA/FKOatJlU5z/S0zYMJlxajjSQvITofeh9lp86dOH9xMp5L0ERpDm4x72nCgigm99Ox41rLOg610GfhUhc3DWoGXz4ovfCoqiMwPUZt9VEc36IHFZGWqOWOmRTvH40aMQe4CbGIv1UvS9IAz6K8k9dkHWwbiannhCM24rpnRUx8CgIRgOHBcA74DDyK87uPdZoz1iKKZePpNuFfQCyd5QtDWk5yjnyMHhG3PNkK+Q0iUNeLGt7jG+vOfBrE6Iwxg7g7BVtfIXeWrZ9kH+oBAHKrxW9L1DdBnfscQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wO90q2o6bhxpdxSyK+I0HmaAKEautFRECt/1AuiEMOA=;
 b=N229cZCzuRVlPN/3/+TLHZjztegVfIxrL7EFeI0rF+Qsbdp2AXbtnb0aTjh7ev6DTbShlmw7HqD78lLPnCS0xwrTB35HhhdGM3QXWG7g4NYnoE4/s/zjiFk3+RLOhiySK7tkfUL9eDfq6ZYPsDZ6BI45z/MgIj5gd0kPXQ/ORhI=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2933.eurprd04.prod.outlook.com (2603:10a6:4:9c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Mon, 8 Feb
 2021 09:08:18 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 09:08:18 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V10 07/10] remoteproc: imx_rproc: add i.MX specific parse fw hook
Date:   Mon,  8 Feb 2021 16:56:08 +0800
Message-Id: <1612774571-6134-8-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612774571-6134-1-git-send-email-peng.fan@oss.nxp.com>
References: <1612774571-6134-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0102.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::28) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0102.apcprd01.prod.exchangelabs.com (2603:1096:3:15::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3825.19 via Frontend Transport; Mon, 8 Feb 2021 09:08:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 67dc6435-4a1e-49d0-2362-08d8cc11133e
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2933:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0402MB293360E50EC288486BC17F22C98F9@DB6PR0402MB2933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rYrsh0ABhPCXqvJq2V/ADKkM4shPrfAHOS3STmzq8HnKrrPeMw/x7E5YmyQy4VcHQTlfGnaz24r2kLlg7uo7/ToJm0Fkct0H509+ZTsaH+SQu2W+6nXBCvg0lILkTgQwjA8PBHnBNM7/IGS1GJEkyuMY5YKM+jJpRDI9h2AdDROEXzhyfJrXz3nPzFHaJCopipQ06bol74pDK7lm0t7oxryBqFbfjt71aW38kAChDRSL1uUNBsw1Bz/BnfAb7fT8BumRL74wBvzSr5ERSi9GH9H4C+37Ha+MycQ5VKOYrfQGAYmWhmVaUTU/GipEBj8/9CM0Ntevc5M7Sh2Tt04qprstE/IWeWIX6FYS85NzdP6tfDO35H0dtJxD4lGs3sAa+m87geZl0dg9ZUXwIrqHz2KgsO8zqZi1YKrthQCMaKaQaD+Z9qmEbyj77EAVFjwxcmrFzry90W/5h3PHDD/D9/RgFCbC4JxRNK1LR5rWDur/TKzpaRUUbkTxfLu9LSxKHxFMh0RBo6v7AuZBM7Ait+OcTP7mdFArvgcplfi9+4BpFZAnv0+4c8FyIGUt41KqF6RYC2F4nuSgTCfdIecLAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(7416002)(52116002)(6666004)(316002)(83380400001)(4326008)(8936002)(186003)(69590400011)(86362001)(66946007)(6486002)(8676002)(6512007)(478600001)(6506007)(26005)(956004)(2616005)(5660300002)(16526019)(66476007)(66556008)(2906002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cSK8BqodU1yizEvils5JD4guB3zKEAO78uOYKDXgAN/gQdarPzHYTz3a/hq3?=
 =?us-ascii?Q?rhY04Kof1/Bivg8kuBCgMx4I6DQrsAQOJCRxNtiFQ3IFC1l5QeH2m0GKd3ba?=
 =?us-ascii?Q?Pq2E4SreNgLPqTfJvKCriijqSBAhXC2CsRn4J9cW+nc4JtR9UcTvFFha2cCz?=
 =?us-ascii?Q?k0jJq6E890Ddmy6U2HQH2zHoxStE/koWRPkeNalSwBw/9Y2Xh+HxS7pV5Srb?=
 =?us-ascii?Q?d0r237KNKD863TP46t5M/wJnZer1bfDQILL1GKwsxdEl8CB6fJT+dh5H/UFW?=
 =?us-ascii?Q?NNyIEsLCSmRgPpHkMLt4AaQzjEqxnzBLeDKiws0pIYdyEObbgtjNbke04CKN?=
 =?us-ascii?Q?Dql3uDEcYQd6V1fElLSwyGrG4wh9Znpo+T9ejUbHYpJYckm45hwNRd4KE/Hb?=
 =?us-ascii?Q?a3j2l1+ewUhlOS3Yqn5AeoBxHkH4HU9ONR2emEs6uGyiCWXYGKkQB9eoHt+K?=
 =?us-ascii?Q?ppZpk+TkWGIJotWRiodfiGY+Fm2MoyGV335I3qsXEuLMc2UfdeK25F6WF5k2?=
 =?us-ascii?Q?QY5NNZ+fk6ku92FK1qPben3AAdRopLWhhuQCre8BnwL+KwwxcF9vy215zsXI?=
 =?us-ascii?Q?G3GVopl0Pw4UCDs6jfLnz2w4Lq/xs1Ns2LKTzfNjBJDu7jtwJjqRneI7p8An?=
 =?us-ascii?Q?P+NH9rl6r4c5vWjuZZzpchRzXxtTB+MhFCh9RXuhCWOkzMgHuszaigTdsXCH?=
 =?us-ascii?Q?GAxK+/7Z0VZBsMhr+rgloIy2VH9cQZ7Cu5kZpItaaFOiyLzUkLjQqPsheNK+?=
 =?us-ascii?Q?tr5E7zkgnGTD2I8uYOZGb4RaKpkztWOmLgqLf7RYUiHMNV2T17baSLYQBHK/?=
 =?us-ascii?Q?z6h+23mUGWIK2EW7fQ46NGpDwINB+lMnM6xh1+HGH/ynX2/Ycs61AKOmYRMa?=
 =?us-ascii?Q?s6rb7xrJCMxOFv+Jds8JK4gEbRI/KVSGdjEyz0S6+5l3q+ArhsUqmzKgdB3Z?=
 =?us-ascii?Q?pObORmyN8WPXCgi68oxuwB3WWLrED45BlLK6VhTZ+HEuLx4I9UaHhn4ZnSPi?=
 =?us-ascii?Q?vDIbDB8Av1zumetgXdtdSgQHWbBabgyvkplOy7o3NYpaUNAKfw1P4bioRuC2?=
 =?us-ascii?Q?vJVTsRQb/P41YoKWCS+S207jt2oZszxSlESrfdJInuhCNtzJozPGFzO0F7Yp?=
 =?us-ascii?Q?L6yZWJwrzgBbv4nRiPP+LHTg70w1P71YeXJd4U4vGiewTPSi1KKYwPklPQoD?=
 =?us-ascii?Q?cDHjn8wyPnoTwnYEVP41B2crE/fq0zTqASGCSkAxbUTHcuhbIdCj89ht6lSJ?=
 =?us-ascii?Q?B80mdarVpRgdeS3ggFtShG6DoyspopI8+vvC0/GYfLer4NY7TGOzI8YPjqab?=
 =?us-ascii?Q?IMuUBPnl8gxdd0XNk9oDd63E?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67dc6435-4a1e-49d0-2362-08d8cc11133e
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 09:08:18.4583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8JfsR0QAkOXfghI+CeqsbcT19yXumjrG13kE35ZB8LHM6aAEIfEwz+HceBub1DpYRUUZqDBj18Pd/UuPrKW9wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2933
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

The hook is used to parse memory-regions and load resource table
from the address the remote processor published.

Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 93 ++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 47fc1d06be6a..5ae1f5209548 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -10,6 +10,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -241,10 +242,102 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
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
+		if (!strcmp(it.node->name, "vdev0buffer"))
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
2.30.0

