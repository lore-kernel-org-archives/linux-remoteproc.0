Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF1AAC433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Dec 2020 09:56:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7DD6122CB8
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Dec 2020 09:56:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbgLUJ4L (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Dec 2020 04:56:11 -0500
Received: from mail-am6eur05on2074.outbound.protection.outlook.com ([40.107.22.74]:46016
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726470AbgLUJ4K (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Dec 2020 04:56:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7XG0f/EOnjcXfxVfMhfKy7R4hptpVTieD0XU5OLqHEguwsmbgQ0fmwkoTF9rIHoh5ZO8X4rFxFPC9pAwPP3C2wyEOqQzIj49aIFWz5Kv3M+DT967lNGxysh8k8jTTCkSVCH3Wkulvj2QHkRP3kJfNdYzDQF+4h4tzvrPM2JKEjm1rgS7Kezhwk7JHXq/iU62KHMedQQlKJQDft8u9ypMmQfVPBqFQa2TYoYO+7NKjbUIISAoojHr3A0EuLu+HCaUO50TqJMzH/eqJFROrdA6pxAZtnYbd35WWoWC85rEeVTIaXE44USDJIOgaJWHhvCLUMesbnr5N32A1xyluTxiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWX8RIpN2wrTsUwrPQLmEaLeYDb7l34S0Rgk0mREnDw=;
 b=mJACo73I2vsZl5vmWNrrycSWRAgP9jSipoTdgpH+jbYtDWviqMuio7BHDKToil5+lABifFm8XNKBVEK8hm6h0cSfk3/9ZFolBpXrmSLN03YjQhSIo1j10XycUfJhGNU+jS6rbizyPB2AEhHlkqa/KtvqakDzhumP9y+lbEocPpcjnPg/alKUEX6uzYNHFk7/1EVkGseBqZ1DYvgrKpa3r9rhsT37MgAiOLkrJg78mPF4Jqdh4v3B3erMqssEQeULcH8heWrKwyqC3teai9906hP7J64eJGvi0ubUhBnhzZcdGBvTY1Xv5t+GEtvjioBjulV+HpdMpzRP9D1zRkjftQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWX8RIpN2wrTsUwrPQLmEaLeYDb7l34S0Rgk0mREnDw=;
 b=BtLP2HN9LtVLjuTyX/Erm1OzhSvv+m9g5NpU/2qcGhoMW0p7jhdgLaMWIghW/W+yxo9N7BTal0VsrSdWAqw8cqwrk2hDC5S025CruStcKnM1Hz4yM7eoKwlSvSwokHPpS/eKlhkUJzc9s5ndDSFBAE/f1Co1+4GudjPLlcIQG2s=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Mon, 21 Dec
 2020 09:38:39 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3676.033; Mon, 21 Dec 2020
 09:38:39 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH 5/8] remoteproc: imx_rproc: add i.MX specific parse fw hook
Date:   Mon, 21 Dec 2020 18:06:29 +0800
Message-Id: <20201221100632.7197-6-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201221100632.7197-1-peng.fan@oss.nxp.com>
References: <20201221100632.7197-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR02CA0110.apcprd02.prod.outlook.com
 (2603:1096:4:92::26) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR02CA0110.apcprd02.prod.outlook.com (2603:1096:4:92::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend Transport; Mon, 21 Dec 2020 09:38:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5249599b-865a-440e-144f-08d8a59432b8
X-MS-TrafficTypeDiagnostic: DBBPR04MB7930:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB7930301FD511FB7D0D107E2DC9C00@DBBPR04MB7930.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uk8yp8iAF/Dr0cKiu64YQP78Zo/SqLw2rSkpHfqo29fLaVfTdw4z8FXjK+/q5L0a83Y9Erd6HgkQ227p3VKNarWXJwJKrdttNE3BAIt9C0fj1C5+FuxLQX35m6Rozmrja4sEl9HL15Cq7K1q9oc3VsigYgpWHU6vIjGGv0UXYgXBXeysHfXT9HD9WarC6nGW3+/vKqe01KNlrMj8252wUUipQJo54cT8crGFvvA9tfdyxJKyzLVNYtRUikX3ALisZElM/GYtoiFHAQKoCUJC/PfyvaF/Pma58ec0cHgt1TfUkb3W04Mtlr3Mql3eOpgQYq9+n70g5yV2mkFrkn/Tx1ulAmpbb9sNvXQEYpcGuqW0xoTR+B/aJUn3UsFleHOmxMkNsUUWBqd9Ex8h74iy2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(5660300002)(66946007)(478600001)(6486002)(66556008)(52116002)(66476007)(7416002)(83380400001)(8936002)(6506007)(6512007)(6666004)(26005)(316002)(956004)(186003)(86362001)(1076003)(54906003)(16526019)(2906002)(8676002)(4326008)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vtV8Hk+lHJzazStnFPTqIppUlqVHgIGpK3/Q1ptVLD6NSU7LbznoxlXs5/C0?=
 =?us-ascii?Q?ORh4v3x//9eCzn9IA2LYaqQgRgcKoHdHFqR52htuBDK+gINlc3IZ2+cq18gW?=
 =?us-ascii?Q?WlH2ffUSPbxph//7Wig6HLziY6Lu9D8f0Lkoxq7YkMbUq9293noNA6jEtenR?=
 =?us-ascii?Q?iTvf/QmhAneihw+LsFiGFCJ9/GaQhHNa9uJbHhNWzYdyiKq644Q6KE1F76lo?=
 =?us-ascii?Q?/qiXfn4m8cihsuTURJGAOn2K6ikzuxbSp/qktsLTr3Vkxu13U/6w8gcI1vRL?=
 =?us-ascii?Q?SdVFez5gT+nrQvgfnv11Zk7IztExo7qc5kOfC15aY1e6ctkFOx1a5DYvr2fS?=
 =?us-ascii?Q?fuk9iDI0vLdGKMjih2je9ewkU/D+ugx9N5+2Nbk0n1wy5D2/1AT2OQOgqigC?=
 =?us-ascii?Q?PQlz3A9kHljAyZsIIZCDdSCk/V0MfyyUD7TvwJid+aV+aRG+XBSRw47g0cAl?=
 =?us-ascii?Q?IR3KgC1zifmlfdJjdX2MOolXqwE/mWnYUWORk7XEaRGs4id33EbJwIntVckZ?=
 =?us-ascii?Q?HUFiHY20oQPOA2VI4wcE+zl/jukL+yg6/+Vy2xk31PV+kciEPRfjyXAbZ6tg?=
 =?us-ascii?Q?SOKNdNf+umsECadlkAR+oGhR2JjLvfWfJTVyW95oi7m19EZP0lSSX94KR80P?=
 =?us-ascii?Q?030QBEFYzKiGMwTVVq5Xo0qhbzdmJJDvmxJfRIEZ6+9G6ni8T6SBX5m63bRV?=
 =?us-ascii?Q?PNnxHDB5o90FJyfdQHya09kJn35JlvGR5237hk2MY8HblIK1pFWDG7Ryrihd?=
 =?us-ascii?Q?gfL7WJ6jb81R1L8ggH2kKs8zThZr1lXqFXQAMZzyHj9/YKSNKBMK8rlewm57?=
 =?us-ascii?Q?ahxlatYtdasIKYWfJDrHVGpFZwPJgZ7toy7YK37UaQnBjb/p8HcP0kwYE4px?=
 =?us-ascii?Q?wU3Vjw9eyZ2Arc7a7ejJeqYQWGmxeuzQz8vFTQuSIs9RQiPX7JcgXAdxSAdS?=
 =?us-ascii?Q?usykaxssZEFEKLw/U33T7eTWp0sCfO2K9k5XZqdiQZER3apz3tINE65Dz8nT?=
 =?us-ascii?Q?vNaZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 09:38:39.5983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 5249599b-865a-440e-144f-08d8a59432b8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZA0Cad1qUeJ74NEdzGW+tzgqB04Aq72Tt1Z73MQJ/CEkwFdkNdwyx+HFBlTXAsb2yfADhAM4BTEZSyqnaGA2HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7930
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

V4:
 None

 drivers/remoteproc/imx_rproc.c | 93 ++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 3915c7f5ac47..f7ca7e7954ee 100644
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

