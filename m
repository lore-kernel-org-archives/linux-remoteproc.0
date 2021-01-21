Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA6AC433E6
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Jan 2021 01:19:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E4B123719
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Jan 2021 01:19:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733130AbhAUBTc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 20 Jan 2021 20:19:32 -0500
Received: from mail-vi1eur05on2053.outbound.protection.outlook.com ([40.107.21.53]:30528
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391700AbhAUBQy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 20 Jan 2021 20:16:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhNGYgUE6yKFjlt5SQ+ybUOqyAAg3HKNJtO7LZCdlADXxxl+YAGD2qkOLPnXtjqNTKZvKgRbFgWriVHfA3d0kybEv6SjUQ767idzdui0dTkYPVgIvpK945G0iD4nFInQLDov8k1IcSRSquDFzk45Z4k18csV1MTaQGtbWU/p14Xsf3h5sYmhJUsXo+0u2IsXxroeit5/PdDQWvZyK85khwjfhTk95KKjR1PyqrhAiD4BLI9AR/nd3wrs3gpRRaaypajOR9Zi/IS2xUO9+oO7gf4koUUIZzO5XK1ouRXV9VpNHGSRV/YvdppHUHOtlYDzDr0Pgxt8f0JwLMvz8Ed02A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPFDy9u0V0n4kcoaeuDH3f4yuir3vLJ07Nxch5aSlRA=;
 b=VI4TnN0taJeVDxWKvrGtO6qgF4QMGn00rAqGT7YjyxWyJd+RF1ZAvSVSTQHhFteBsB5BEQ0PZH4sQWgDYXJEghjpirZBE2PTOvhfwP3Ajo0nRW6b5I53H8ZkWtoAMRDiofN+Lt0JzBco84po7wpNVwneUtGTGFwT+M22GNJMce3Dsr8vypZj8DzB2wqSs+06SG+gL7slBCHijrkCZ5aY/9zQCFz1Wx3QyeaKrOa3LJ40RzZORAy7Z/IH+JgGGi7lKYMY+OHYx1vOhnxmxAPqA1QNSFtWHffzYKPmrC/51AaTh+UjdxKPbWbyRLX/Jpzu0NyWysYCeMwJF/o9SkVrRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPFDy9u0V0n4kcoaeuDH3f4yuir3vLJ07Nxch5aSlRA=;
 b=USnf2eVz/cQMOIcp+YP/o8h48knJhEg3mlLpgQ86AgCQHp4riNm5DQzi0xePbJh0BBMqZe7nEAx4DuTsBowqTrBVQOiP+rKMmrHHE4kl1pAnLXt6iwojDHrG5Hj3p3Ej6zzEJssOMW9mcNsPsv9MKguemdKQsEwyWuldA+LFomo=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7948.eurprd04.prod.outlook.com (2603:10a6:10:1e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 21 Jan
 2021 01:14:51 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 01:14:51 +0000
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
Subject: [PATCH V9 07/10] remoteproc: imx_rproc: add i.MX specific parse fw hook
Date:   Thu, 21 Jan 2021 09:03:32 +0800
Message-Id: <1611191015-22584-8-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611191015-22584-1-git-send-email-peng.fan@nxp.com>
References: <1611191015-22584-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 01:14:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c98ed1a6-b0c9-4996-46e4-08d8bda9f3c0
X-MS-TrafficTypeDiagnostic: DBBPR04MB7948:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB7948F0F29581646C43867BCB88A10@DBBPR04MB7948.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ozKuZvdUoyR5qiIlm4Qy+Jk9kMqrDpIfnUhgHZoRW1fKcVSsXlUFdasoY5HSBOdu9u4LjeDI9CBZjS6L8sAf96VeiRtbvEofyPq5aIIZaIBaEz2ed8FC8UR59H6jATWgcNNoOqdf7o0j/dpvwb0Thjz0izVRgCmssmUzbq2pJPnntN3fHyi8NpEBdVki3vyZgIoLV/2DqP+92ezqc3xvhkF7k8ScSnxe3jg+tIwRtVuxc2u4pSe5F+vGX0TK12CFXBw2fXR8ndGwbvvS2LGDWWgMBbTDsudWLrURTT8ltfx/8PXU5d4FhHctLRCC3PfHzdvoDxcBLHo4B3HaBTDlgoPWKLJvbYW5JtRFk/6YQrhpi//875j4uh3tJEmqzoRmciVJTBwzSXHHlh0B2cKtb4Y6zItiSlDQ+BN5e9pwTZv1zt3rmxRlO04RDyGL3WG2Tlyi++S/+utQ2YbxFxI0lw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(69590400011)(66476007)(186003)(2906002)(6666004)(52116002)(2616005)(4326008)(7416002)(5660300002)(83380400001)(66946007)(26005)(16526019)(956004)(36756003)(316002)(8936002)(9686003)(6506007)(8676002)(478600001)(6486002)(6512007)(86362001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KMYh/pyh8LCIOgLD60QCWa9pE9YbXfwS+jf7NML99o2NC09jjnvFpOxb6I4F?=
 =?us-ascii?Q?dXtFgoUeV+l7+zpi60hdIMMvF3ai7Sw2/OHQxinE4zhpO9OZ11Bzk151DUbC?=
 =?us-ascii?Q?b/zOJfyvfLRpuGDkHqcuHuiuqvYoON6f2wJisCxOrhRsByt/hxit0eUQqOfJ?=
 =?us-ascii?Q?E16WB/0ikfjR0hn0OxXSEspkpISFSmP6PbcNtnJzhVNDRIFtIWWDS3LKUR45?=
 =?us-ascii?Q?uTbUgHg8GiFl/viYKIZRdFW485zUVen0sIodsSY6++wKQS47zr568paUbdSL?=
 =?us-ascii?Q?xh9dabwM/xIVg+79RCP0PK/5umVbqYPpHcH/FHUAVUZ2waOEOza5jl1HzxKb?=
 =?us-ascii?Q?FrxbEPGAYUHtIOWObvCZPV8liJUEyvxjfiSTzouhKFv0ZTLkminzVMafor0h?=
 =?us-ascii?Q?cQqAmcsDt/OVuq5oEZLh0BydHnymiigm3OyXGbGHc3lN8+61dz1/zcL3y3/1?=
 =?us-ascii?Q?oP/fKurMfsGAM/6keF72+fysX05aJiWoe/IBW5txIHHPKKWAFeI7U8XlV00h?=
 =?us-ascii?Q?WVZCmSb04RPcw5pOELy8xZVmSEhKMIgUoY2fLxGvLHYHbs38l6ISbawynjp5?=
 =?us-ascii?Q?6S2qpuM1DqvnUAouvDxNe92zYvEpvam3q+KNAjV86jSfZMj/lW5dFYxq6HFZ?=
 =?us-ascii?Q?p2Z96R2GPp02thEF6N/OcktD3L9EsuEHbDW3FcnJfz3TJ+/6GyWAc/eG39cA?=
 =?us-ascii?Q?2ooLoYySafW8UO8XvnnxS3ncg0rkOX9pLvHDeYuN4dINTZFs9yMW+Nx80ypl?=
 =?us-ascii?Q?y/W4guWcWbS3idL4D/yBORj+obJVTCDXIaMnHB3m/Xs9UfQUGfKJd/JFnYpd?=
 =?us-ascii?Q?TBHBUzJ7SB/s0HgEm8xSmAaVFpFVbJuiPGthj8wuFWV0Qvja6zavZpZamguB?=
 =?us-ascii?Q?IVx1UrUAYbZ9rkTp1EJmbKaxSp6x3LfP6VzDvBvh421BdxOPyyDCYp3joA+H?=
 =?us-ascii?Q?B1RxsowTAeZwLtQBeV6snaApowpgn+t0btrd1poS+vopXQbya1GjUS7j6gBP?=
 =?us-ascii?Q?mH4e?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c98ed1a6-b0c9-4996-46e4-08d8bda9f3c0
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 01:14:51.1571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OvsV+FQ2QzOF7wG8qLnIUYkaQtB35yuPQBTWufNUeUX2lUfYYPRz4qjA4YkYYrmeIgjIJkXemEI7MzjopZCrzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7948
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

