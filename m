Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D67C4332D
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Feb 2021 01:39:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2603764E58
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Feb 2021 01:39:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbhBRBjf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Feb 2021 20:39:35 -0500
Received: from mail-eopbgr80089.outbound.protection.outlook.com ([40.107.8.89]:51809
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230018AbhBRBjZ (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Feb 2021 20:39:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Znzy71pIPRqd9iJvi8b/Kf9y8GuMI7bq0f03v0NDw8rafSnT6zyGGPy827N7kHlzWVfi6jW2tY8kvptl+1oI1bRFJbXPQwx5DNf+qYWfrbpuXBgy7NB0IC20tyNSSDuLob78q53PJh2RByQ34XyS6oOv0sm+P+acHv30c9q46MN89caO17ScElTU508tzc7mheJ9XyTpDXIo5EeZSKozG4+Y1FxcBYhQT5XXK9gCBADbkdqKN/4NPEN6hSa11rnjGTioYkSBeNSyHjJmMkIbiwTHV96m5IuEzCl6JqePX4kfioDut8Oad7fTevZdnKmUVaNvPrFqa4GXSjHJMN4GnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wO90q2o6bhxpdxSyK+I0HmaAKEautFRECt/1AuiEMOA=;
 b=hUN1T2uIikqKXNE/3zWeVZGARyTh4SVjH8izMzOln8vMe3WjRPHYwdPVhzlK8ZBQETiPeZj1mZ4+oN7WBZiXQTV8Qe1dMjx2LRro9NzD21QGeppE6xCYIvD1aHJzfxq+Oh2jtUaOnkCHzUY5lMP3ts9ZwIgT2zMx9VleC8DaVel/fCcN1/8AxJ5ecIGfiCOhp+RNsR3Eht5GmwCTJgOVCO7JiQ26WrwvEew571OD7weVZSyXl714oQv3jvbp6++3UFESNA0wT1/+p5ev0seu2t2sV/amkX7FgbHiFr+nnFnjJRYRujGyc3w0N6RrpH65mkCp+hQWQJs21cuLYwDjrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wO90q2o6bhxpdxSyK+I0HmaAKEautFRECt/1AuiEMOA=;
 b=UkzzNgZWz9rOUxR7dfYg/wW25awJf2YlOLEp8ISU58oFNpaVuSdFGi23PHePNkS/eVGKI7FQs6VGiZuDGZ4nQYmtUlNFjEuTOXiTvStVP4xlwM54KkURB/ffIbulf6mq41sgiu0EN8yBCyohk6NuF3bS6YOAvEqthT3x5vUbVzY=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBAPR04MB7285.eurprd04.prod.outlook.com (2603:10a6:10:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28; Thu, 18 Feb
 2021 01:37:34 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.043; Thu, 18 Feb 2021
 01:37:34 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V12 07/10] remoteproc: imx_rproc: add i.MX specific parse fw hook
Date:   Thu, 18 Feb 2021 09:24:57 +0800
Message-Id: <1613611500-12414-8-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613611500-12414-1-git-send-email-peng.fan@oss.nxp.com>
References: <1613611500-12414-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0401CA0005.apcprd04.prod.outlook.com
 (2603:1096:3:1::15) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0401CA0005.apcprd04.prod.outlook.com (2603:1096:3:1::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 01:37:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 52b43212-d7fd-4d0b-85f7-08d8d3adc394
X-MS-TrafficTypeDiagnostic: DBAPR04MB7285:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB7285196770780E1495C55853C9859@DBAPR04MB7285.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RYpuyeP7vKVKD84PLwPJqwv6A7gdfC9ssvv9HbWcQQUDoznPoS+U2f5T+cRW24cEnWMhWRao6zdLaWornmvtb5qHjED+/i9dS6PnZXEUEFzt2FLiQ9lEyh7nIYFkoAcCbHPvQayybnM5QXF4LUiM6PgiUakkJ2nLSpI+9Ft1bEAN1WXSiUDeLX2VIvQvi4XuTC6uzI+BCemWGZ1rX0+ahhP3swZFyGSZpSVTk5HS2VhAa7lJAZzo71eDO/1m77+GPeMoSUUgHuLR9+kYBf2U6jDiWhbH7YnykWkGnrnajWmMISlNEViGlvK5dwYlA/eGs3DswmRjgFtDL5y11nTt/CfH6NJ3k70YTBWnEnUUnBCl6tMvQFc7rUH1aQYJA7nA74D/xRZe+TumWGMBpKm1qnlokrkrhRWGTLKTT8ZfCl+Ms1iFx+8Yc5Ognni2XmdHqvzsQnzUWZU59oMDR+UvdVTyFbI5sHiUUWZtZMcuqXyjJlAX1yIB+Vqy3OpqAQOAlmWsvMn8xHfHxsaeHKoxof8o28uQWrTl7LTf8ANIZS5wRbakCATTTFR9GRl9hvIumyzAUhi6bodKVI2NKFGZ1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(6512007)(9686003)(16526019)(186003)(26005)(5660300002)(83380400001)(6506007)(69590400012)(66946007)(66556008)(2906002)(52116002)(7416002)(316002)(66476007)(8676002)(2616005)(956004)(6486002)(6666004)(86362001)(478600001)(4326008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pUU9Y0KUd00s7bsqQH6Vbbfd5aCl/gM/PHu6aw512onsbgsOwnMbXWtE8SsM?=
 =?us-ascii?Q?JU+U1cHtsMLjQMWRJSlqEDkhvGpTQkBuyq0zqsPI2I3HJElGb7Jtu/KyEYvX?=
 =?us-ascii?Q?UsF9SVAXDb1bKJ/yqDatpoRrwuRZXj3O7Y4J+IzDTCfJqwOilUs1W9+xai1c?=
 =?us-ascii?Q?zMjOz2Yq0Wt8H9e4HzqWUW2yNo64SrCWA0+vyfwzMexhIFXvtw5c96FNlF+L?=
 =?us-ascii?Q?bl+1mgkXktRhwh/I+rv288QWvEMRJNVC5bSAjj0SBmO9CwYVS7wjgYRpJj5m?=
 =?us-ascii?Q?Gkd5o+eqpBF66TN7DiBek5H8TUI2KTxmhkdhtG+RuBivSLz0bt2Yjw9zLp33?=
 =?us-ascii?Q?y0+q25JwFPGzH6633gL7L77/rE+goJCpKJK+JvZ+WScMO8wBalxAoqNz+had?=
 =?us-ascii?Q?LOLwchgl8ZuD+nKOUYWYhZAIy7eNuiGe87eEUaiQD2UvlruQDTNeE/pZDRRv?=
 =?us-ascii?Q?AnhEOKN+nn3NlKXrfawHy8I2FdjksZE3yDaGGpx9nb55bKfUpx4277wQ6bGP?=
 =?us-ascii?Q?ZDP4oe68qKWTwnKtmcnVlqYy2Bv6seFZn4qGpsMcaZoW3JqoPxgewgm0rMKd?=
 =?us-ascii?Q?PMxbrR92kESacvXxKhWhl8vUjB7Wuub+Pbj5KbKGrgxanz2M99JTnBxX3ZHf?=
 =?us-ascii?Q?2xcEPapn18rhFz87qcDVb3yJ/QCcn6rt66XMvjL8clxLWqXznwAZD0FLR9kR?=
 =?us-ascii?Q?wLxxVbXKQWI7NSMBPZ8vCSwhe+Bd5KG92ka67jPKKARvGGbc3+y7QKSqSeq/?=
 =?us-ascii?Q?xOZ5ZqHRC/xX5SEx6QXgfHuGVQNvocp+ee1wmFabfHJ62GFRxe1EJNArKOWE?=
 =?us-ascii?Q?dWQX3ggEcGAurO/FbDuaXqI/usA40WdIPG8X6PKD/q6e2KBuk3MyoH0vIEjM?=
 =?us-ascii?Q?/pLRidiP1Hh995kCoWGqTNusZmpW/3wWaQbUeuwUlwxxIkAWZQeO/l9XYQy3?=
 =?us-ascii?Q?g/IC+EBGuQAIKp8P92Zkti9C8oDhnEBD/+Y3rplPChugDzIkjcl1CNsKXnXF?=
 =?us-ascii?Q?HIYL9ptr5Ora993LA1+mrSZwWJJhn0d8CGrqzrpUFhyG8HKEUwmthCojz/6X?=
 =?us-ascii?Q?fTIdEyYe5+J4QL6L7NPnGh389oOsuAIRh0na7rvhwM1FUPD09NHNxBnoCbCN?=
 =?us-ascii?Q?ZZPVF9NLU0DusW5eNdQBbyCyvaQoD84BELBYkzkV6GJUbBScoiViofdoebaM?=
 =?us-ascii?Q?t0erXX6koTzcK4OIRSMWUujjXcQhAa48db5nG/jl1jcmqByy+rGPO2xHgQVn?=
 =?us-ascii?Q?siojPmbpt4QHkqOQ4x8WMLbtxDQ+jsSGf5/7fl8S7VWSOl8RO+vPa0VGt7/V?=
 =?us-ascii?Q?c6ahmeBlUU16cgH7NWCYTzX1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b43212-d7fd-4d0b-85f7-08d8d3adc394
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 01:37:34.1236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qq4HwmpZ5wCaOOQObABwOo/A4XBDTROnvoJ4/ZTslaCK/Y0jyQc59xyTIZZLLgDO8ZUAvgrljh4n3ktHq2iXWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7285
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

