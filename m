Return-Path: <SRS0=jP1a=IE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83542C43332
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Mar 2021 11:39:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FF8E6501E
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Mar 2021 11:39:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbhCFLir (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 6 Mar 2021 06:38:47 -0500
Received: from mail-eopbgr80044.outbound.protection.outlook.com ([40.107.8.44]:18564
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230472AbhCFLiU (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 6 Mar 2021 06:38:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bUxkuCG05aZAdGJnPkywPHeSeMQ2SlnQUN4v8YigW/XcOd4YhPGalqwAgCcGeTZtl3/kgQL8VnNBfjiHy11HESXXkFLtQHvGTFJqWrcYMIBudOE862bgpHNQuwQ11zHeTXkDHt97pP1ARxFqs3wPyz+nyBPYpw/xTQvDxR+iP1cJxR4C6oPdVujoQtrIw10ADkZyctYZK2W2KfoGDIVRN9pRvoSgxoLi4rF48GX6IqPRICv65ZjLQ7Xv27R8a2cS9LTWfffq05rUzTpxAcQ/LGz7X8j5YlaJvCYdTo/7ZxV+g42ADieoBl2icYvJiYcSl9UKcefpysdgI91etDNiGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wO90q2o6bhxpdxSyK+I0HmaAKEautFRECt/1AuiEMOA=;
 b=NW67Rao0UOr3DYb2C+INfjatJ4P6V8EbgOMEr0EkkO+Z7K6NkolxY+cOtrkpb5+vskD0GOsLrQvnS2sLbTiPy3aF3zbECXOvUNSHquNAhWj9yHQ5NMtozy5r77o3SI0OwJYHk8tFFllZ3xqQeeX9qJvQCkRI/5PyIb6jIBi+/upYRVMQxOG6Pv1FKvpWaCSXUN59b+CxZ3JOA2iFO3zfugbprUwnyFQJyV0bM6IciqUU3jxGh/VvMj1rXpd+3MddLyTApxJrSw6oEP/EAcWKAOej4Vs/EmPgSRvdriSk9JiZktLix5pTED1OFYB1TuQjmoTKQGVjn9ANWftF0Hirtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wO90q2o6bhxpdxSyK+I0HmaAKEautFRECt/1AuiEMOA=;
 b=QLfBA1SIAQy1OVXc/EEs+AxshCRy41M1+sYY9HEQGCZ2Or53cBzpwhcMc9lMBsqlPPl/v6PJJAIN3egJvrr9tP3E8Yzmcx0g9XbbW9OBxf/jdYQ9XHxAbLogXyszoQjev/X0ayWu/wFrt7rdVXccC2yJpjCe/B4T4Ll5G5aUSu8=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR04MB3016.eurprd04.prod.outlook.com (2603:10a6:6:a::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Sat, 6 Mar 2021 11:38:17 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.054; Sat, 6 Mar 2021
 11:38:17 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V13 07/10] remoteproc: imx_rproc: add i.MX specific parse fw hook
Date:   Sat,  6 Mar 2021 19:24:22 +0800
Message-Id: <1615029865-23312-8-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615029865-23312-1-git-send-email-peng.fan@oss.nxp.com>
References: <1615029865-23312-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0047.apcprd04.prod.outlook.com
 (2603:1096:202:14::15) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR04CA0047.apcprd04.prod.outlook.com (2603:1096:202:14::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3912.17 via Frontend Transport; Sat, 6 Mar 2021 11:38:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dddfb550-213c-4e16-6ca1-08d8e09455ce
X-MS-TrafficTypeDiagnostic: DB6PR04MB3016:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR04MB3016159180AF0CC9509DAC88C9959@DB6PR04MB3016.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CTPNw2W19grU3KcEFeZwknr+HdP77oC0Do0aastxH9rwNt4Ukx4MahB5JZzslD4CuGYYkMYf7rJlWEbpm3nL+1tEmNQcGTRjn4zRA8yBiKAC/wxtCd3UvgKruV3bn4idTA8vvj8qJDdJt0Ri7z2gE2Cj6KV3phIHR+KdNJjDV4SVimQMNhqccF4sCPjFKLtoHa6jp7QRwWWgWgaNniUmelC1vIEoyhsllVzZMsqHveQujg6kGXEwYoQt4sMxGM+vzie1zcaXLK8CKVTwGpuyPV3qSHqZPwKjXUKbLFDAU18GO5N7rR/hzoUJV6I9i9w7KZO3muX0NJF3St0B0ELqTC7XlFFi4pb3MIMHnbz0IIS4+tok/MF+UT7hn2dZw+sKmDgtiDtUjSoPhMwd0u4G9wPdRWvSg/wgvxDAw3VnVWkK82co29NGkdJCvNCY7Hh4NdzxS5ScHCAfzZ2tBxqnOgX+CztsyDrzCgXyhJDbayvqqEeluseWf0FZyVY2FWPq7zCJ6LQK7n3w1/x2iVI0zgwd7NyK1BQ6tEv1060cKjik/sI4uzk726BuH+4aqoqqaGmYrodp/1ykgvz/LlQmDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(83380400001)(8936002)(69590400012)(8676002)(86362001)(6666004)(52116002)(956004)(478600001)(5660300002)(6506007)(66946007)(26005)(2616005)(4326008)(316002)(66476007)(6486002)(6512007)(2906002)(7416002)(16526019)(186003)(66556008)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?09TBn+foinMJxE6AAVzCuli4PT7q5n0AcSVSN0HPsUKMXXRwxl/Fyor3Xvgt?=
 =?us-ascii?Q?nF0DxaodnRKs1hOyYN7pje4R8CwgP99NjDO90xGvrMP0BOqrcRerjOllpSrK?=
 =?us-ascii?Q?8aD/7YHM2RyrPJqbJRaN1yWQywm+VuagLjgausS7k9uUhpVgwyX9HhYTk+uW?=
 =?us-ascii?Q?ewyi33d+uLVhK0qO/kIkOHMKoG2UVVusNT1snRo6utqtqImw59fZ6aBBWC2w?=
 =?us-ascii?Q?6lyvX6ByyRc+FajHf4IJWL8k279gV7PnMU7ktTtIDrLTT/T4QpQ2F+eY2YuE?=
 =?us-ascii?Q?it80vH12SKFPEM2pkMPiNvppyqsGHSeYsUiedxYJL58LH0vNLNjd6LnHxy0s?=
 =?us-ascii?Q?KVHqwmmFt7Sh+NaQj0cQjX0T6fm1sa6bMXmmcZQT2ufEpslkGHARXHwGJHNZ?=
 =?us-ascii?Q?hhjzUt7Ur3BfcvaDgYKFbEj3P8U75fhmuMnOhPO6bjCZhnyL/s7weckg5GHS?=
 =?us-ascii?Q?EDQX04GlIG8gooFYL1o2kW/uFIEBOi5eEXJnI476TqBcgXsFD2NHWx+Qyihj?=
 =?us-ascii?Q?tau3H8G0C9ZRbtCQN47wYJQk2n0VUWn7LiifvbXaTzf0UhVzPY83UOIHRfVP?=
 =?us-ascii?Q?fUbnin7X9LQER5VwkZQhsFLP2w2KVxKv/kz4kPYInBcNLQ1oGnIQGYae9L/c?=
 =?us-ascii?Q?0UdpR7BgcCuITv98IzKXnhb1/0NHHv1CYDWEWn4VQYk5iencl5J8QhOTmovU?=
 =?us-ascii?Q?KT9IcLJvLYO1MzbyvgBrLJR6yhMiYSIREvii0EkCpR8Sb5JRWqUmHg03QSQL?=
 =?us-ascii?Q?FWPzE5+ThzCBoV6aPP9fO/2QTsOzdJvT9TrsO2kTkiqH11KD5z3unMrA84qP?=
 =?us-ascii?Q?rDZYgkKzWm4uG06tSmFSW+tM4OAB67o+U4ma6Q/OzZp5mmD0z7gv2bCGp1IU?=
 =?us-ascii?Q?0gN7yZyK2/IEEsE7UNZV0rXAdL8h5j2Yrg8maOYlmWbpnIRGc9wr/v4C3BO5?=
 =?us-ascii?Q?UwXgj7KbT4ZNAGsq8d7wtDp2o5gUdZH8uW9WEC/D3ga36NuqZ9yvX+ikcONN?=
 =?us-ascii?Q?R6EJ9qqu3F/lYYFytDGjgTZfF8eUq0brtulnLrg+AiLtzFt3aDk37UopVQzH?=
 =?us-ascii?Q?oy2/VKXuWZjK24h8XXhoxRynPq54nRe8OxaO0MT+Gf5Sd1LhnT82Rs80hrP3?=
 =?us-ascii?Q?GCwL3cVlcr/+aYRAEHj98wp6gPdbxleJER1LTaoYqhcRzfwKLzZfILiKzf5c?=
 =?us-ascii?Q?bAv/f6LukJrFXauiPR9msC5bIecYgVOYdPBoBRNMCHI7UFSgO9yZJDXQAiT0?=
 =?us-ascii?Q?g5CdRUB2R70crEkcWGzlnfc6rlA7zEjGj+6GJjMkxH7XtpFJMfAl9JUS7p+M?=
 =?us-ascii?Q?MhNviC2t69yJEi0Z7F6R0lHt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dddfb550-213c-4e16-6ca1-08d8e09455ce
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2021 11:38:17.4217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNk/Q64s9wA8YhfRbWaZZTuv1gEm20UlmmpbDOOirWHoFw7gKMqgMcUo7p93c4rU7D7XWcJxit9mdvaJkJhG1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3016
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

