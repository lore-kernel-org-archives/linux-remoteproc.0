Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE872C433E6
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Dec 2020 03:04:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8284222227
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Dec 2020 03:04:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727629AbgL2DD4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 28 Dec 2020 22:03:56 -0500
Received: from mail-eopbgr50055.outbound.protection.outlook.com ([40.107.5.55]:14917
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726558AbgL2DDy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Dec 2020 22:03:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D7U0aSEtZmOk1ATGpULLi0MQz29RiQb2/vpMdfRiDkQBeMN3Mg5lygk0rQJK2oVSF6yYgL7ddGYIqVWYxqHAINc1LlC+v0kmH56J8CPxyW20wZXPpRMhwbkktX02DekMo5d4ONeNTBFoPp+Zc6qQNgeI/UsT4XXGdDablsgtms1P88X7J6EJmodjy03r/vRj8lz80goCFY7kHxjXE24wnuM0c6w2fEnec0VhE8MYM3JoACc0ayVCfC/428OITrWAEjkWfKOd1AiBdYC53HoAu74t6S6XTq4vevGDFZxo/NR7fd9CaKOE+efA2I1KnCmgIxwZyTA6QGuJBVxpYWeHnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LG9BDPRqMs/013Xi9CMEXxbg2o8zx/tTgq02hZ2QeiE=;
 b=gZQs8NdVbDThcmvTvd6sieG21Xj56ILR+IEmRxEHC5eeWMSYzc9GL/ArxChhPLIE5HVNtrmL88HSMIGrJ225IuNBfxn1iS4R0gzHwyVtEIADm/NWTo4AzTpyPBnb7BqoPrSPw6/v8K67GhzGY4qp9DNNHi65LKwJ02zjtUdcYp0oasaF7CVJaDbHafhPViAbSeOOdXvrhdAheCatMl5tgENCBjW12lKIx7My9a4bPh7KVWsMsJx1q7ywe6TjFccdabr2Pt6YyzHP844Z1l4dYGhlL5UBGVLIIZNls0bnTagZLISQkFz+QD+YPkUZgflEUO9F7zQGa1mQ3ReycmXTYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LG9BDPRqMs/013Xi9CMEXxbg2o8zx/tTgq02hZ2QeiE=;
 b=cXKuDoXgQSXQZ0IdRmB+V9cYiTfMNWzm39Vxylo7ae8TYHFE8CpLreE2RsN9fRaZ6wCzpyUojjLs0LXrWPbLETfYamR3hbhvsna9/OiJjpC3rquvqO6Rez02/g8Gx+bPBB19p6gqVargVjMCVHXFNpCEs91bIHua7Uix5LuXULI=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB7178.eurprd04.prod.outlook.com (2603:10a6:10:12e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 03:02:13 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 03:02:13 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH V5 5/8] remoteproc: imx_rproc: add i.MX specific parse fw hook
Date:   Tue, 29 Dec 2020 11:30:16 +0800
Message-Id: <20201229033019.25899-6-peng.fan@nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201229033019.25899-1-peng.fan@nxp.com>
References: <20201229033019.25899-1-peng.fan@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR06CA0178.apcprd06.prod.outlook.com
 (2603:1096:1:1e::32) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR06CA0178.apcprd06.prod.outlook.com (2603:1096:1:1e::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 03:02:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6f7d9410-7ec6-485b-db1b-08d8aba62460
X-MS-TrafficTypeDiagnostic: DB8PR04MB7178:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB71783423052DDD8C0695E7E488D80@DB8PR04MB7178.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0zyYijDgWpyRroUplTKKduaTjGOh7cgADxWuldpMIYR9G//1M3MDnNbhWPzzt16BlJCY5PSfKVFEnOElbEzfa8Q84nJc1VwjRa2NnmASjXXyvmvWO/sW2AKy8OMtovOIBZu/UNZKIuR5SgFWCTYoiWQ+Oh7ZYdnA6347p+Anig0WhVfQhT4+NJVjjn1qvFRtveuALo9QoJtUfKNYa5H9Os5rLRiaNvSwk8LcDtQV477VROAv/t9QGzi/pHSFB2boXkjR8g2zuvMfHdbuFEQbj8uaGvDs5NVnXtEvBpmXKs6Qfz88jTiZWN54cydNUWNLadZCW/sNfsyp/XzFf/HaDdbqiSjDc7IIjZVO+H1p1ZVn1nAjemAyHG0l8geitAUzoySsctTCd4wBuFcY6KhUNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(36756003)(66946007)(16526019)(9686003)(2906002)(7416002)(2616005)(86362001)(956004)(54906003)(478600001)(83380400001)(8936002)(6666004)(52116002)(66476007)(5660300002)(66556008)(316002)(26005)(6486002)(1076003)(8676002)(186003)(4326008)(6512007)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QjHoHt2ldb6wH9Jfhp5UWahP4O2muJoJwrshtbqQyt4UbB0PJD1efKvzIRfr?=
 =?us-ascii?Q?GKZFpCHU+c1lMBDGZt7zzw5kRdypZqy4/ieRv9He/QM5Pc/9Dy2OXJMig685?=
 =?us-ascii?Q?+X57XqokC75feYfF8a2NRzdRi54Mxy6qjDgNID5AqiITUWc8cQxH1aE8pFsj?=
 =?us-ascii?Q?kI7wgpE7Mgs6BjtcpFLXUe6+KwN09xb1vb0auLsw+dr+W8jLMHLlHrfzoIZK?=
 =?us-ascii?Q?kcbUl5i63zN4VAcs3X0+urPRp14573OKdhx5/o8scTqZfAnjoJKKmPTAqlyl?=
 =?us-ascii?Q?Zjxe0dQg+77wMw6DG6Dk3mF6ezrVRwokl92sdpV+ujxg/tM2syBgjBWolbFN?=
 =?us-ascii?Q?NO+msJQ05m9HXVXAfp7BRKwK55xJkbX2/h8jK5JQKYuD4T92PNIg1ID0WKuE?=
 =?us-ascii?Q?7bYyIEkiKrzCakhFsaC97YJ5HlV+pMt6C2bsBisOfKbamgQ7yjbmoKlDhhb5?=
 =?us-ascii?Q?FOzf5ci9PUir+RVLOeyW0I4G3Fk9GSxtK8h2wQlcj58U+hRZ9RMNqMRd2dgx?=
 =?us-ascii?Q?kv/qoLcatl3rwTSU3YDTpKEPLLLGZR6sVWdz1DVMcgzUkq4Z1/4MSYJUEGBA?=
 =?us-ascii?Q?7ViasjZfVpx9+i5gsykwLPJ4HycT5AZdn3rnv54mmdQbzYLhA1UYd4LpMWND?=
 =?us-ascii?Q?eJJU6pgsf2jB0Y5BnjLVftsRfHbCIguymbqJTWaf0P1vBBiB0BKNXfj/8TFH?=
 =?us-ascii?Q?gbi/P4689TIToq442Q6jx6FALCOpLlvOj57XelWT6aYKBzWqm8Ze94hoWRO7?=
 =?us-ascii?Q?GKzT4hLt/wQ/XZHZ5OLsT4tr0EYehZzCncilqQFCAPI/9s1HeHhQ4GeARCu3?=
 =?us-ascii?Q?DHUbhoB8Fjgc6QNYvssnP20JjrvjgTwBNcvGvv1zUef/RmSQuU7FwHSudtFf?=
 =?us-ascii?Q?lRSOIvlqEoH0kegNRmmStu0DoJQnLbWJ4WgDLUnase9u4zimVCcF8MXedrAR?=
 =?us-ascii?Q?NGBE/z8f668HOC9oFlcgBadG3KCG8ZGAWLb7VdxipDQkNkJFJ+0M9GiC3E9z?=
 =?us-ascii?Q?ZB1A?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 03:02:13.4963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7d9410-7ec6-485b-db1b-08d8aba62460
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AyfzE5WkG4QyXJG9OeX9L5xwJHDNc1Y/Kvsm9Uj3SJOT4BjyzTnxLMtKpwm1HIv4BuOl+Yhk2IIhtxm7HJ716g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7178
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

