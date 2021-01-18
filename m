Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30224C43381
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jan 2021 13:27:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB3C221D93
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jan 2021 13:27:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390038AbhARN1S (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Jan 2021 08:27:18 -0500
Received: from mail-vi1eur05on2055.outbound.protection.outlook.com ([40.107.21.55]:54049
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390840AbhARMdd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Jan 2021 07:33:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqnMUAiOdLsrrMqIQvf511xVp8ROobj1ndnOkoJiRDsfFhhLpdrHIsx1asNNliIdbPCcB4/oRKq/W57m/6zB5vLyaUCQpDjeJAJMPa600KSJE2uAHRcvjYMvcuGgs8+dcU8xv99HBOQ1Sz91R43gYZzxmxwpkHZt26XCTNoBBgdwpf5dfKtJgWnnJVvP3jAx4sr3aA1OqEAWphDdipWnwZ6CPJ5tL2CG2iUPwcOvDZU0aMFBcthOVO09ljYEaOyZAyTb0MgB6IxvxVrcVB2RNH0gspPr+EEJwjyi+VDrxDDNroIw5df+qvpEtza4R4pI9koNWxKK6Qrwy/G5uCuRSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPFDy9u0V0n4kcoaeuDH3f4yuir3vLJ07Nxch5aSlRA=;
 b=QIaipXjk9YUkc93XhUFWcS5jvwswm8YXrQJfT9Jx2BH8nl2GVcCse/h6Y8chMqPz08Lk9G1expNmBGq7+A4TQmXCHIJuAkOB5azExzKGZaACLTY5cVty4zYR1G15CXtj3lUCVaOY8vtGIc/51tdG7GNrQpjgmRFpQz7xrGN3/Yi39Jg6CS7jDvTjTyULw6j8ew8LtJ7j7P2vabEKI9UXmq+Dvq/LZ3Mp2zMyFmMQijTfhyJ9zpvKRwLcE8JD/JT4vGC+ew9zAlaZmYfsg216IquEAcfSLAQgxo2lQEK9C2IWzR5zJmgJNXGboNqEmhDVzpQ+amBoU7edpVPrTZ6uWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPFDy9u0V0n4kcoaeuDH3f4yuir3vLJ07Nxch5aSlRA=;
 b=iQc1PxfKKeAaZPeBftWc2MYlvjxaaihEnHoYWOxO0tIyrN6SHpE0KdInW8ju9hvtdeMTsk3SG+z1ReE4O7oU8tBVw/HIz+BVvM9wKs1xDiEZHumyyU/FBTc5/+agf0bJG+7gHOVftYNeZ/n5AoJd1n/VIwTnJBMuPC1vMlc13GM=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5243.eurprd04.prod.outlook.com (2603:10a6:10:17::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Mon, 18 Jan
 2021 12:31:07 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 12:31:07 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V7 07/10] remoteproc: imx_rproc: add i.MX specific parse fw hook
Date:   Mon, 18 Jan 2021 20:19:56 +0800
Message-Id: <1610972399-28286-8-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610972399-28286-1-git-send-email-peng.fan@nxp.com>
References: <1610972399-28286-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:4:91::17) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0113.apcprd03.prod.outlook.com (2603:1096:4:91::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 12:31:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0175b122-7e25-49be-4161-08d8bbacedd4
X-MS-TrafficTypeDiagnostic: DB7PR04MB5243:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB52437E5F20163C5F5843DA0788A40@DB7PR04MB5243.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RbVGfGWyk6vDcFL+RxZMTws6EkCFmTFm46usYJKvts3eUPhMP82mbxBXAzCdaJ0htko596RnZQQ0v0H0Sb+ooFXAnBVZIHla0oWxSh/o4lOSiKlS8zszb2PGQs0NwWJv2worp3BTK6BybbANBVjB/0CCo6TEz92BRxehMKHWw9hO78+O3XFSXgME4SanBMyUBHjeJuRBVp0gy0ZbIg09T6a2V1EEvqAzuZxbjHSkcXY+0RNlPoO6Ps3mLMd7D5qGkzVvKnsZyhxiAbOBUUHh7reteR5lSrXiwfGS8mPNqbFnKh4mEEa2xZHjVarvv2B3I7KxGm3dgnIsaWdHnMNJBQG/S4rZu8kInSBa+dYn2n+caQDHEmhZwZ0LbhOO4kE7d0aeNsN19b7L871oFSjk68Ei7wM5EaCeOqa/ni5fryCX+KRj3WeT2q9vzauNwDVLhbxzk5Fn2J4lMNTKbJ48pA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(478600001)(6506007)(316002)(6512007)(9686003)(36756003)(6486002)(66946007)(66476007)(2906002)(2616005)(956004)(26005)(83380400001)(7416002)(186003)(52116002)(16526019)(86362001)(5660300002)(8936002)(4326008)(8676002)(69590400011)(66556008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bIBZ5mL6uJO8FG4gYdIDlNw4pNg8X5+PUw6RbqVfNxx7S00/XN3osIBD1YZG?=
 =?us-ascii?Q?nOc+L4TVNWPwymAiIQlr9PxcLUkeDv9vuQ4J2DLXmi+7+Dn/wIa76dkzqtW3?=
 =?us-ascii?Q?JQRGsgy9Ys2u8+hEVQLUTjZF3RT+/lI0umXfTQgXevSvlRsUwDzlG2CDIADN?=
 =?us-ascii?Q?wxYMGiVUBgyCIftvKdEUox9eTP6lj07IuQe54ck1QzOYYP2jITtG3CVWuTo/?=
 =?us-ascii?Q?Bp5ZvYXlOwo44u5DgMKd+yuMPFrmDGf8tTiMwtMBpt/3mb7qGPdpxKbCfeyh?=
 =?us-ascii?Q?YpWTyiOFGAfe3leINa/IOOKsG9cBjKqKmZCSlbiZqWPHGEDrhg/3toDtUNLl?=
 =?us-ascii?Q?e3l/iaU63Txzbk8ZPt7FaCcGgUKytGg1OszJZsa/X7HvAxGH0Vko6BdOUWpe?=
 =?us-ascii?Q?Nh8QqP8LoUFPrRjmiodFjm0yDV2jKLpne1Wf96EkAK1JU7z0zQDkbcdjwCcb?=
 =?us-ascii?Q?lA26JOR12izzfk7fkpwwFWNi7ycX5pNZ+w8IqdrhE7eBZQWnw7y9sAnK6YPC?=
 =?us-ascii?Q?9Oyuo5fth6pn4kpxtQ+8iBN1h3hw/64yVQXvV8I0ghfZNmxLSQJAHDkHfurq?=
 =?us-ascii?Q?QPKoc7sAUGxqQ3r+ZFqsB482f0aY1q2SPNCIZXTGChP+9XLVOtT3JCjVMT3S?=
 =?us-ascii?Q?glQXI6IWPKoj086LDGp/7IZfTj/7QCs+BudberHR3zp4CHEhS59rf7Oru4sR?=
 =?us-ascii?Q?aqO1LEee2XUxzOJ+jBrxJWE3w6PkN71XTRD3eCD/ggI6evHI+LNqBh6wJuUg?=
 =?us-ascii?Q?c+O2TVFDwCORi2R/1dpY7VCZRl87mM82M+e9AckYXseRat6uy9AbmJO3VlSg?=
 =?us-ascii?Q?sHQmrPyRgzS2+VzH6LTL/oYX5ibrXjlt+kKP7swLSo2FOvA2g/33Sr6c2IB+?=
 =?us-ascii?Q?YNVSAcrC8aidauVPwRkvFZLsXUJ5M6yPPaGh9c8tapumRzlnNbQbHNlMPkSt?=
 =?us-ascii?Q?LwOV+bqznBfEBFGuUgEqagqrI5Czj8Eqx7QaNFlXhVs+jao2R6xy7iqtlw7O?=
 =?us-ascii?Q?Vwk5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0175b122-7e25-49be-4161-08d8bbacedd4
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 12:31:07.3703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXk0exAmADW265TayPYSY5/gAc3u7EqtwqXly6xpOEB/9rJH8bLnx5rYI7HuM80GzIuapdd1TdSd/aw4wJPXwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5243
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
2.28.0

