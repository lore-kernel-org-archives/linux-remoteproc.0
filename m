Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54871C433E9
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Jan 2021 07:53:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E3692311C
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Jan 2021 07:53:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731251AbhASHx3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 19 Jan 2021 02:53:29 -0500
Received: from mail-eopbgr40046.outbound.protection.outlook.com ([40.107.4.46]:22240
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730749AbhASHsp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 Jan 2021 02:48:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCdr3HNzoilZaWLwane4A02G2FerTape4He3C01habW0066/175d9iLDNYT3iFjjEMl5VH4Nn+iKaP2Y9gTv8Zu08j23sWmKDfFo2Md+RApDdCEB03EteRA+BjrjV21phuGHHltjE9zObiUVZfBDyZPr/PuQmNbINxsHWHh6z7uEZXUdnzT/6u62YD4LVbJ/lyBytEPyVKt3GvYkSDWfDzYTgWt+gaD+rHcQplGVe6WwIoPlZr5GMmrIoM6JYm8GxLVvzzdhArfmwa6pzDY79pdLJpUz893Jr9PVCzOxdEZkx3DMpYGbMRozjp4+S6ZydCTwh3KlfcLqmneEwsfPEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPFDy9u0V0n4kcoaeuDH3f4yuir3vLJ07Nxch5aSlRA=;
 b=I/4zXpMFUIdiwNUqCf3b3rTQM1xzH3S0dS+fbzXEPtDQE1kS9/YChG6E44oA/USAc0Ff323bHrSfRQ5LAC0LQxHHkRGIC9z4vybqoS88KpcdDfxmzFemHQsemL9x8noDC+UfZfk4YwE+ro2/z7CPpOjqVgVgwLP9nXi0xtc4ep00ztC6p6WNkSIZ8dhSA7Gh8oA94XKOjcyzGWY+XR+7rKbsseqzbLA/s6fXI5a62dyaUZ6/mONVAHIwmMTKJ4wvI+xHwhP4oT20UJEZkoJOpnw+KRYcay2ZFWY8hXHqCIHgZqi1wdX2CSty7gZzfANDd56RUCTS8pdaarUH2XsG6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPFDy9u0V0n4kcoaeuDH3f4yuir3vLJ07Nxch5aSlRA=;
 b=eZslOlrZVnjwUOrVg4vRM7ZZZW2izG7NrNheZi0oy58MX2p9P87XHa7GC1jIp3C3ae1a2h45Vag88pDydklbV9rlISVGR7t05z4Gxpcz5e5xatQX0H1WCZ/UEtSWHCzXqhxcDA+OZeLaPzx9SdU6/iHtTmWjssysJqnPP5hLUb0=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4492.eurprd04.prod.outlook.com (2603:10a6:5:39::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Tue, 19 Jan
 2021 07:46:16 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 07:46:16 +0000
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
Subject: [PATCH V8 07/10] remoteproc: imx_rproc: add i.MX specific parse fw hook
Date:   Tue, 19 Jan 2021 15:35:08 +0800
Message-Id: <1611041711-15902-8-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611041711-15902-1-git-send-email-peng.fan@nxp.com>
References: <1611041711-15902-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3763.9 via Frontend Transport; Tue, 19 Jan 2021 07:46:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c60b7638-442b-452d-eef7-08d8bc4e4d38
X-MS-TrafficTypeDiagnostic: DB7PR04MB4492:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB44928823970458D6700426A988A30@DB7PR04MB4492.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ILBtxdOMEtsQf106kcSZ6XWUGeh2ox5ScN7RZ3lRvy8cNpsABISWk/nR33aqiXVGorgizlxaG+79xbK6Th56cxwplSnggPW4k5rrTK8S9HmRTP0JrT6z/ZpAd8LiWcMvLiLPFsk1JzbW8mSaNxYq/AXDRT/ddZRJs9idTds1P90cQq0pUi5yeS5ya9gJ5NNlmolb/CqHlNOjyYbEVeMw8/KVxSh+fOCDqD9rbgYM8vE+p3c55ybg8F7N+e0sZutXVrBBW09z7QRYjMbU10SKRjoFAVL3psboLuxPxR9GdeZ7i04pVZ/cE76vtsooNVKRCGWJ+iom+8wP+3rU+2GZ3mWyDp4z8Efno5evSvWcOjzWykY3BuuXq1b/7KnWCoXIgZmpyoZclO8GKksjt6q+OMWkrsw3s5/TklCpPFytgEt4OmBrLXLS0YfRHhw/X0D+jvnxwMsTE2asw5VbkITVEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(2906002)(66476007)(26005)(69590400011)(4326008)(66946007)(186003)(83380400001)(6486002)(6512007)(2616005)(86362001)(36756003)(52116002)(8676002)(6506007)(498600001)(7416002)(9686003)(16526019)(8936002)(66556008)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6ElLOM1AjJ9VIA7rIMViRfsMZKk3i8zIRoVmGdtla5XvK98xoGZhncHrhi/8?=
 =?us-ascii?Q?EKs5vUADHvqi/r4UER+x1ftHZh1Ig+M62+46KuBtzJXidgETnMZ4xHcEgHyM?=
 =?us-ascii?Q?OEn6Co5iJ8kOU+FheJFiL2e/11E4dZ7rlW9ir2MYNrdlqrJwozpDLegw8mnK?=
 =?us-ascii?Q?/9omJjJ+a9SO9qJLire7R0pScR9DrHggPaQFtpDT/kjCn21o6mJiySaXQ7+j?=
 =?us-ascii?Q?tqaNyRYpkAISqih68u7bTFSD8zWK5vJn+oGEU98wzoxs5k8koFbgXwyA0Utb?=
 =?us-ascii?Q?cE89n8HIh6a/DMfhrosuovlZegWI9VpMogFC0R7CdRJ38eCfgoyGqo96zkUI?=
 =?us-ascii?Q?IUj5OK/Dcn5kyJ35btFsjfSThwCLJ1p34OiXUMUTQNO1gxauPUc69ifGpbwm?=
 =?us-ascii?Q?WLm0zvoY3IUWqB4S+aiWBgKE7pf+C3fLh7bCJln/S0bCYVx0qOgt/jL0oHEZ?=
 =?us-ascii?Q?acCYFeham+L+wJpV7tEpj+A8zUC9UK+s0K38sqP5Xl5b/mPAPhBfz+tr02zy?=
 =?us-ascii?Q?8O/Xfpz9A6FORm5XOVdYkwxLiA5NhOxzc59JXDjSpSQHx/U0rY5jJbdaoLnG?=
 =?us-ascii?Q?/10oO1K87g3OcdnY6Ls1nxbAbUE8TCiboWdeveJWT5VKeNYsJl7vbQDOXMHN?=
 =?us-ascii?Q?/xW0IIMWicY4URZBQ+dzFHQeu9UmpBAuR9H2rEnGLsLaFoSihsdNYAaD8JUa?=
 =?us-ascii?Q?9gTbPVAtUZX28T0SILlRkpSRsA8PxtNN+Y09YOd1fgpRRfVL31AI0yMKULJQ?=
 =?us-ascii?Q?gwqbbbPbeNyKp5H3MOmkymFrv0V8nBckz5UmcmA9ZBn8+sR1Yy4kYFh7C86b?=
 =?us-ascii?Q?wKJuag/m0oIILjJ4ADf88TXWtIaGGx1ybVkV3pOp67qYOrZUSssOXyMWCFUn?=
 =?us-ascii?Q?uG1iGqClW8vDpFq9ZSz9+m5pyUmL92qcW7t83ljdaG+IfeSAZ8i12WB7uMFT?=
 =?us-ascii?Q?yAqiCVodhOPoyLIwqxjMrTg91kA6VhPGmFHWfZEb00HcL4FDUXkAkNUuDs7n?=
 =?us-ascii?Q?jhU1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c60b7638-442b-452d-eef7-08d8bc4e4d38
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 07:46:16.4411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /WjyT8Bu3muiOXA81fUlxMMJEUmYQpJoVbDXkONyoiF+ZoWRnpYCrkxRmOerIAzUqLQST+doXYEau4U+lnIYcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4492
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

