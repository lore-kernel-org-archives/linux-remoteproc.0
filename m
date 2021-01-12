Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBD9C433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jan 2021 09:50:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22DD7230FD
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jan 2021 09:50:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390899AbhALJuv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Jan 2021 04:50:51 -0500
Received: from mail-am6eur05on2089.outbound.protection.outlook.com ([40.107.22.89]:7296
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391382AbhALJuv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Jan 2021 04:50:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R166lXol5CtUvDwPkK2N59NWayZut4D0+uMDDF8oQsr8OXB6m3RWZqXP7i5RQXQrKzzaf1fSkTXzD5MmzQq7yO8SwZfl/O7oIv1Cz4T0DOQWE2+rpXsRT+96YLs1NwbWyLIpuj1WWxWJLGXGNb7HeN03yEechNyFHY/ImdchFqQc0tV09h5sT/i0DUMJJK9bMSK93S6r4ufoIjOYSgb3A9PdMcqXR/MR+L6xdu5w+pAvPMOvrWnHsD7vtP897epZpmgIZxXbjrGH5pcFxY4+cNHHfTRftUGq+p/D6NbV53PF9kqlB3Q3XQlsmWD5+rq12a88cVgKDt4HMARyfe3w9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LG9BDPRqMs/013Xi9CMEXxbg2o8zx/tTgq02hZ2QeiE=;
 b=B/qa7f6unv/MVDKDIH5T71U3TMpR5Di42lUCEGSz1CX/3f7BB1t/ygF3KtxVjb0eNi/8uTBY2Xy326lKNOAfwWODFQqvoj716O9OqiO0li5zDIWhF5ZzfJL233yiB6fkHx53FYlnaOWeGNILN840wAhZj19hK28GKkhCw34M6wRz/13RAoz+uO5QKy+yvNPTtcd86oxBdN4s4GHTS6D8JiqgSM7IXqE+R+4+Di2KaIq9IR8M/RztSYq3wc7AClgNfm6Hm1QYCec0a0qj1OqlH79CNyd5L5C459D9bxhLpavH9LNfhVgzp9p9ut9Z8bcljq77g7/+YdWjlsVF6MKiTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LG9BDPRqMs/013Xi9CMEXxbg2o8zx/tTgq02hZ2QeiE=;
 b=gPsjFf6a750qxAVA8qdIahQblegbjjTiA97M91urmGEOg1VTfYppcoAyUSdh4B1X191/36LxBdbHVb6wQkyJCGhSSilIruYI1g+OFwyeD1nLP+TnLHy1El2rIl9vT0KHBEAeiCBfntKJYJxeeJ49Y1S5S88MNdlZO5F/J+XVGWs=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB3PR0402MB3658.eurprd04.prod.outlook.com (2603:10a6:8:2::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Tue, 12 Jan
 2021 09:49:57 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 09:49:57 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V6 07/10] remoteproc: imx_rproc: add i.MX specific parse fw hook
Date:   Tue, 12 Jan 2021 17:39:16 +0800
Message-Id: <1610444359-1857-8-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610444359-1857-1-git-send-email-peng.fan@nxp.com>
References: <1610444359-1857-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0212.apcprd06.prod.outlook.com
 (2603:1096:4:68::20) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0212.apcprd06.prod.outlook.com (2603:1096:4:68::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 09:49:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dcc5a1ae-b278-4bc5-1e21-08d8b6df6b93
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3658:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB365839F04E192F9391CACBE888AA0@DB3PR0402MB3658.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I9Xpp+fYqOEKeq4+PAjTJanXmmavG12j7Xvjc7ixvEu537cPmnS5aNNmUVDWSgLvs5a6FSdVlkxJY6/IsGczbjp5qh0FMD4srCNPJp93fZaxeYL8Zg2zlgBJnrCV9bBD6KV9WTLvfKoqhyHO6iknZs2F9NbIZZgSqPA8NyuOEWjvTKf6rfqKF5PhcHpfL8+yvVyAMAvYrqehSK6YRtWb/bvGVv/na5DjHTz/MOca52xR+0hT3Oh3BLa7rBXo2Pz/zwZFoCOYbAMteIyDDpD6R8r1AQGbEJqBWhRP9ZSZI3FIcnnhJ/iPHVjclU727bkiDOXFLS8QTTc94wZgtgipVXKI2f0vTgu1pkvn9+KQl/KeAerrpIkmzfQOeHZnui8s5TfWO9Q5Creglznjc0nRec26MPJsOWhhQeH8FBM6osGCQFxyaNocYwqaIdC1yR1sd32Aha8hg2nmtrtVRwMzlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(26005)(2616005)(6486002)(36756003)(66946007)(66556008)(6512007)(52116002)(16526019)(66476007)(86362001)(7416002)(9686003)(6506007)(186003)(8936002)(498600001)(83380400001)(5660300002)(2906002)(8676002)(69590400011)(6666004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?C+gu+02x4hoBVEMox+nhgWk4GmFyy7unwCejdZ/PxK0auGWB+M+L1oDN4d94?=
 =?us-ascii?Q?diDRuDg30mmJmVKyduNpDaCN8rn5245TGw0Dc7ip0GNlgTB18k5M7ewb90tM?=
 =?us-ascii?Q?xc8/FndfNlroVRzJi021V72SayUi7Po4KC8OZrWVlAaXC6R/AFIedoAL89sb?=
 =?us-ascii?Q?wVPl1A1bAKEN9Ja5groajHeuje1rIVIC7aU1rN73FE6mErEpdRozZzrimb6H?=
 =?us-ascii?Q?pw/Llqh8Q886lJwjriz5208x44nC+MpDkQdlM20Nzyg/0IC/rayYQ5/0kZm+?=
 =?us-ascii?Q?nI1nufRX3zaUSKlFD5MxspNeo7sInAe3tFje1YTProygiqqsFu67cgxmHDaa?=
 =?us-ascii?Q?wNShg/DLW75H9BQVqvk+xD0Gm0tQP5wkqLjFfGHuc1Sxmd9rvy9FbNw121pv?=
 =?us-ascii?Q?XI4MuK6+DYyWyA8ldL+nKgFKC7drBHmHrns2P0GvdS0UiAQYtlvm6P716WoG?=
 =?us-ascii?Q?pUXF11rzBupZN6erdKzJNZ1K8Imm7xtKXNMnQX8wU/PRh/8ILTJwcNvXD4pP?=
 =?us-ascii?Q?IieH7PeOzchtsNClIV9PUo6Mru+t1byoCC5yslhNPET3bmafjuqeBZSpUZi3?=
 =?us-ascii?Q?cLUQxZhzM4k+vL7u86fvRGkpB20dGC0O7c2CruzDPefmruMSp5zJ3UYUrIDi?=
 =?us-ascii?Q?oDsdL1twPZ+TTALsvCiF/FZwB6N7I4WXb3ND1drlofySs/wNU6TgzdTpIz93?=
 =?us-ascii?Q?S8RgygYNbPNlJstT/TmxphRT/LAcMtqmliiw9NMnD6qs6MKkjzYLT+pFOFhI?=
 =?us-ascii?Q?+hNV2XIpFghwj5TeLJkjH44HYC6wOntC9zXsMeKiKkk46aCPzorCFGxTR/Ve?=
 =?us-ascii?Q?nHh9EGYUx4/FTF5fsgWCzBrgEbTbGqkhQiQLIVzIZhN74cXhhvtmQQ7gEjm+?=
 =?us-ascii?Q?8fWC/fbIkrudvy9AF5xzqKMmcsr0pxgTOdE3gVIPZiXITfqGjKBGCezm7Reb?=
 =?us-ascii?Q?uVwmc5YVAli2gWeoKQloJ9RNMWsHNloN5MafyCiIA5ssyuJgoHPLYN5Kh0ch?=
 =?us-ascii?Q?35Gx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 09:49:57.0911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc5a1ae-b278-4bc5-1e21-08d8b6df6b93
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iYB72ZzE8ts0Wew5wmtJVQgAHJa5PI2ad61g0b04w6VispUjzJAybiOCxhpGOBmyODFlmTiOkRvaZlAhqqO7UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3658
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
index 47fc1d06be6a..3c0075dc1787 100644
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

