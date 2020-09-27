Return-Path: <SRS0=lozc=DE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCB3C4346E
	for <linux-remoteproc@archiver.kernel.org>; Sun, 27 Sep 2020 06:15:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C12F923A03
	for <linux-remoteproc@archiver.kernel.org>; Sun, 27 Sep 2020 06:15:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="itr8EP6c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730379AbgI0GPw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 27 Sep 2020 02:15:52 -0400
Received: from mail-eopbgr30056.outbound.protection.outlook.com ([40.107.3.56]:25733
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726382AbgI0GPu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 27 Sep 2020 02:15:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTAgEYO0lrxl9lmNcL2Vkg5kpKXEz5LcGs/0F/haQqbzfTG2629r0dwwWgRsI0awS+W39UjOW6iUN4rZvQy7QtGI48J/Z2pajg6wvb2U4VjA4sh0QLae4NAebHXKIVkYE1go4uZMY21ejzgy93jzotEe1uYiVAfzGBRaglzdIEMKxc1XfN6EtB4CtfOdTN6QlquTP/QFVOnL+e/fFqAvLsS8SBzYs7Dc1FCTUuZ1EXMRsl6skmcP4iP9V6awrHk2sYBGrvu9/LSJr16MSvDsw52iB+tFV0UM3L47MrQE6uchBjfqjkkBR4CXS5MOeq6I+IR9PD5ZSS00/Dh4z6NU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtKEcLCPQXATmwARlbWInIvBYGuhb7U7HNELcesSE48=;
 b=CZgZVM07/MxpAi5aB4/HrK2qYQWASD4PKThqKrWzlD7V93VW41RLzStsRY/gUTtjnv9ZZJ/WGC+Yw5TzXfLl9ita7TE3DfFoiatkTxxZD2Ntfoa662aRoMdfNYB3s3jrZ8zjDGfbD/bqBrjDUma5+2h5Gt0m3MW1a9oz9EZVc3ozlu/7lm/oUqW/71AOIZo/7rPgHX1kbo/XVU8SQUWA+DB4gqRDzg0NVNzIi+WSFg+S95WbHdCLD2kSmHWZze1oIb4NhLrQknBWs1YtivdMq6yv42OIBkr2Z/NWa8nAQl0RkX8qtz9ezfxZajBh8gmagFfQVGIVe03unjdcMLUNRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtKEcLCPQXATmwARlbWInIvBYGuhb7U7HNELcesSE48=;
 b=itr8EP6cF2vHkWzTzbmCe4uI9/Q56HtKzglhOdSmcNYn3dhFLog0+TKi8Y53Bzoce9/pf9wNZW5mcIQLpz1Jq8wubZfadQq9KneRakxFamWIIx9Cy4g+D2/ff+I5KczC6g4aixvpKyNML/cvF7S5xvW7oMG1mTvczPLRQtn3VwY=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4633.eurprd04.prod.outlook.com (2603:10a6:5:36::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Sun, 27 Sep
 2020 06:15:46 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3412.028; Sun, 27 Sep
 2020 06:15:46 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH V2 5/7] remoteproc: imx_rproc: add i.MX specific parse fw hook
Date:   Sun, 27 Sep 2020 14:41:29 +0800
Message-Id: <20200927064131.24101-6-peng.fan@nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200927064131.24101-1-peng.fan@nxp.com>
References: <20200927064131.24101-1-peng.fan@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0178.apcprd04.prod.outlook.com
 (2603:1096:4:14::16) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR04CA0178.apcprd04.prod.outlook.com (2603:1096:4:14::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Sun, 27 Sep 2020 06:15:41 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 55973492-6fd1-4d1d-5426-08d862acc55c
X-MS-TrafficTypeDiagnostic: DB7PR04MB4633:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB46331ADE5E206C893A291ECC88340@DB7PR04MB4633.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +eep6h6xX6nZ+DoQ6X0qEqh/FbgpjQxptz4476yDrsXGg1pcEWKrphYJyMxTOoeC+8JpfvcmrmrBrFPaXo+RfddRFbilB/cPJyKTkOEGR17K1XRVsur/XLeDGCeFfzgQCHlDmD11mHrD/kJDu88DHTc3r05R//HBFTVlMy1Jg6ptlu5qNgdW1EBiek8skvqxzDJNYpY2menUwSProeGAiHjPEkIgnT1jRUfc/y2cExx2oqnUGB1kBeXabHgcRWp8PxtD99rwg80+2oT/sad8LCkr9UkqHWMUQ2Mi5UVBv2v9lHrH0s3gX7yHlo7lnllbTpp3KeR0z3UYLnsFG7oMSxdO0ougT63XAbdi/M1n9hY44750CWOvtGX0BbTIZJNP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(16526019)(186003)(52116002)(7416002)(6666004)(6486002)(54906003)(316002)(36756003)(1076003)(44832011)(5660300002)(4326008)(8676002)(2906002)(86362001)(26005)(956004)(478600001)(8936002)(66946007)(6506007)(6512007)(2616005)(66556008)(83380400001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: QSbCEMhe3PzwQhpwJBPDBwx9YbvLDZiLn21OLbgTnbiXwrHZuzkGSXfl7rxrIoHkwvqJvsgULb2ab6ux79o673Uyy6QBrh2Qzv0WqcRG0nDwgIqmPywL2DV9W8mnR4DzZ5YXbfVWEt1YI8xh/t2WfE1s6j5e9y6fXqhFS1slXYZBmvIZg6AHkyDsdNMJw9A2gmUzi9yfOTs8c/UWjdpu8UkFXM6msCdD2TstrjiausKlxbHu6H1jagtl5/8I8RIXxrbdALt/Lxjvjrze3jrvzN7FksFnE7+r4vM4wgUIbVF/hxeo73F46lQkiDnK4NJ/b6EyuvQdsfbfAP+VwU4RnBLAqAi5B6ehA2cxp/hHsFuWUu5qM1x9pvdIjLobsPtW8PKXKNyf8vZbfYFMJwxWfWIbuegnwAnYV1Qyt1gB0r9AfGH2+0YHNYK0Ai4CgBu3dusdqgurN9ZL00oDbLB3QAJ4DU1OhEz3xoIa+vhHQqYu6ILaFSTkM9R+W0zwa/cAZhKP9e7mUbPyJc5MEs8S1cCERNCrNJxyvfV0RV2b1wxDTxOpLBPyeRpSVOT8kIhqxDLBlLim7YKaBT9v6n7lphA9/IZekeUM3u/JNTKGm5PvexsFdn+seyO42NdrAvrzySQd7kiBc6/awkYucuwqog==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55973492-6fd1-4d1d-5426-08d862acc55c
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2020 06:15:46.1123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMlu84NWsXqQPgpVJXsL7VGqRzcwX4TYL5LQsZCwv4HjO7eB8ftpwCF6Qbwa49OB4S7Kw+z5ZJbzpWNliYOHMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4633
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The hook is used to parse memory-regions and load resource table
from the address the remote processor published.

Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 97 ++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 48ce09e857ee..bd3a42892b22 100644
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
@@ -243,10 +244,106 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
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
+	int index = 0;
+	u32 da;
+
+	/* Register associated reserved memory regions */
+	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
+	while (of_phandle_iterator_next(&it) == 0) {
+		/*
+		 * Ignore the first memory region which will be used vdev buffer.
+		 * No need to do extra handlings, rproc_add_virtio_dev will handle it.
+		 */
+		if (!index && !strcmp(it.node->name, "vdevbuffer")) {
+			index ++;
+			continue;
+		}
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
+		index++;
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

