Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87439C433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 12:50:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5030264DC3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 12:50:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbhBOMty (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 15 Feb 2021 07:49:54 -0500
Received: from mail-eopbgr30058.outbound.protection.outlook.com ([40.107.3.58]:27341
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230355AbhBOMso (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 15 Feb 2021 07:48:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TK318kwzqQ4FWwgrA4A+Tc7OzU/PewnZSd0hjQdUtCVRTug+JESrNRDn8vbGm2IwWuaojz2Q5xhpbAJKijgrnD5PKE6no4Ye78igJM34wVpJp6k8GZJB2j5mdnfO5ZL33xNbeYDzqEFpldvBUUNgC36Y2GvLs5d1rtkfbD/GZ7dnSzFhWVCsV7+UMQtqg8o9oA7cCJDalKPkAfyDAEUzCkBlCL6V8nV9DZEq+I+v07IRZFwsF1QbzfhjZZI93BFbEscpgPWhx2CvI5BVbghHzetRGc4N1Fh0nrDoeXjyRRbiN0k/vTjSgLOes0NbJkZ/Ov4monYQIS98rmsD9KnE4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wO90q2o6bhxpdxSyK+I0HmaAKEautFRECt/1AuiEMOA=;
 b=LPqZJNH7mDl3RHUbH+LkDLUlwtEoKR3yMarCu02N1onWJUdVG3Xpj9qu1x3+ETKLHI2eH4fgXuzBV0qcQTXs6i85+Lz7tS8aYgITutvjgBASpi3xN5bwb4s0zCONoF8XxP75z3CDVJn61pUdHRpO8mLpCam6oSz82UjSjlOqrZSl27asv02urxjbjuBgPqpmaLe6zXaJm/KCyEPT9n6IBMKdcvRPdY+AB56RUTEPZAOk4rqgjhSXFOhq/fMubnQXi5Jl+ux8040nxtv0i9ypI4XL8WlTYHvk1wCKQKUC7a+AXqbM47O1m49hiWsCTjTx3iSfVFoJQi6ChD68dNCF/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wO90q2o6bhxpdxSyK+I0HmaAKEautFRECt/1AuiEMOA=;
 b=Xq9S3OWpTMFiGEXMokqoXs7DAmAw3+84GDw0eg6N1rojK0+OUyYsUKUbw8gkZwlJWspEdGQ3KnlcVXkytIPWiysTADsucB6VOM6wk23uqD8lKijPBdFUy7USA1Ondru3laexeKHBP/osO4vRah2YOZMWXZ8Yihi4rnQj0RLHJRY=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4091.eurprd04.prod.outlook.com (2603:10a6:5:1e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Mon, 15 Feb
 2021 12:47:01 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.027; Mon, 15 Feb 2021
 12:47:01 +0000
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
Date:   Mon, 15 Feb 2021 20:34:20 +0800
Message-Id: <1613392463-9676-8-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613392463-9676-1-git-send-email-peng.fan@oss.nxp.com>
References: <1613392463-9676-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0302CA0019.apcprd03.prod.outlook.com
 (2603:1096:3:2::29) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0302CA0019.apcprd03.prod.outlook.com (2603:1096:3:2::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3868.12 via Frontend Transport; Mon, 15 Feb 2021 12:46:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4123f667-3b05-4143-d75e-08d8d1afca21
X-MS-TrafficTypeDiagnostic: DB7PR04MB4091:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB40912D5B987DAB77224B3483C9889@DB7PR04MB4091.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cmLZOguwTef+T//2HJJhlSLfPcKVOlOyFrqHzJDnmrPe9jN+ibEfXd9mfmXrx16wXShFzVOPed1qO9mMKVUMs6RyZ7AknwJ8SD7MZg9B1Wyu6luEP9Eqeyr+AhDVGQLqzJ0bRi7sztyzg/MTCllFB+HwNjbfAuSCiGAQhJyNsZ4vvLMj/MfpIsPcjhirPceJWm9i2vCmDrkadZf0D7nap48pWAQLlJCwn7pmeo04reEokhxlS2hiaV5IvH54TVvTRDIRclARDhpa+giFETcvOYAwE/PAi1C/3yGmY5wfJu1bbeGCXgXhDUHXZSdOrsAdqE1UjBK4ise5WIc9R/eqaNhhn1UPBn5SUgaTSY06O/3qVOkn29g9Y6XW4NhgA+7TBWARI7rd4ZXbjnLLhgycYP/eN5+mqQoTszAYYKUMwlwstlVYcUbffOHin3xQ9gXv8CJBP1bQKndBng7c/gBcFcIhdDJ0c0WAWHxNxKgjJ5XV/2N4NWx5u4FfRHCeNgDvxyPrKAfWUr0v1Dcb6ZJvzU9qnGj9x0lIGTddt8nuC7IkxZlI0rcjj6ncEM7s4Ay0AA+h/2xH99fQPYygRXqUXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(26005)(6486002)(9686003)(478600001)(316002)(186003)(52116002)(6512007)(2906002)(16526019)(4326008)(6506007)(8936002)(2616005)(956004)(7416002)(86362001)(66476007)(66946007)(66556008)(69590400012)(5660300002)(6666004)(8676002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6UGyg8CVaWVzRTY3mxMy2d1cimA6fxuxCwHUOvNKp5J5rfN2My5aE2sE5gwF?=
 =?us-ascii?Q?hiD+r3wVLvtnlDyyTaz7R5vhEudQfsxix+OpWKS/JwlZK8Fdw7BRY6WX2rj2?=
 =?us-ascii?Q?+VOCQT1fI4ow+vOs1qxmL2Kfgrkup822DviGYcD5+2tPXGeocM1GVccmRhK9?=
 =?us-ascii?Q?DKSyfDkzUcwAKFX5QZV1GcDuCwgpuJ5aSUl0hisneumB+4sYebO3m48cFAY7?=
 =?us-ascii?Q?5aP14SHZj+f6nRr4tqHL4TTvBmCa/0BBpig1kSdBmrue8nkHJwADuL1/Rg93?=
 =?us-ascii?Q?nVatG8HG7crfoOZ6QgB6vaIJBDIOGVfO252eOEnuPgzuGhYRiBLHJs5TY4ak?=
 =?us-ascii?Q?HbhzSD8s7Z9kLx7hxAGmP9qIZI676I84aMRaOSiKunV/IL0/nBJYzbw8sQLV?=
 =?us-ascii?Q?si0Fi8baIeU2H/wErLuO543wyZh2h4WGfCGFKt5Gdra1THnPqMwtxu2Gi9jl?=
 =?us-ascii?Q?e8ixmD0smgqkpOS5zR0BkirWtiaE5I5sNyN0YLs8ayKzSVoUTVCOve+/stiR?=
 =?us-ascii?Q?JSp3CG5Z0P4TY/iqFkfB2AKWEbb6xqgmvdp1kSGWXo+xDLQQtfONPz4bIJgJ?=
 =?us-ascii?Q?S+SeTKgK2oJ75dYMkfEPTM4vax8aATbOVoE2JF//Dbax1jXN+jriFvAvVd2F?=
 =?us-ascii?Q?riCWuEYF8uiKrcIsB89GMggPdRRAZ1HtrgVTQO2c+oq07426V33ur5plBXgl?=
 =?us-ascii?Q?DiJuw5C21Lj2t9jHGMqd52emSKuOUDD1nm44xaUE+Hvw42FlD5omLgci5xJC?=
 =?us-ascii?Q?NkvEDZ6Q1vEb0Qo47FPs92WI+p3LDdkwfhLhFzXdL3zVVbfkNi5nUpSzRuig?=
 =?us-ascii?Q?/vZ2LMF5D3RRGf/k2iQhTDjDTiBGcULati4Se0odvAXeOm7Xa/JAzyRrJJDa?=
 =?us-ascii?Q?TuVsIvhFRCSfY1vFebdTUFa8l2hhwXm3enj0ZsjqqnlswWBxYF+pFfZCWCMm?=
 =?us-ascii?Q?8BMUhX+B4gUC7BWHsYdWeVcQ8+sy/qutS7E06dk3H8kzvelH/xQ1Fruzjj8w?=
 =?us-ascii?Q?fgVfu1yMT9HpnRdJFGMIgshoUCJqp5QaV0PNjenE4x9z17CAVTznqv+jMoEs?=
 =?us-ascii?Q?4fKr1NTN4N53o4FFxVN5QjWjl+4KRKRSL/Am4DeTK59O8Ic4FwGGwPS9GmT7?=
 =?us-ascii?Q?UghDD6qA+Bk0Bm3MBBy8hrha/6y0YGzvNDdN/jSIxaVHDXdfVuzndh/Vmmbh?=
 =?us-ascii?Q?t8KkD/9XW+J22YEDHM/ZFw1LPIxZmWvS5WGzDm1XHplNvV8S8f0Jj8993bdT?=
 =?us-ascii?Q?Yqp26MWrTgn674fxyw2lvHWlyfbbOgqCSHPFQa0lEodXBSpkrNzrmHyjpLaj?=
 =?us-ascii?Q?hcA3+j4xkkWRnFNKfqLyUcWA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4123f667-3b05-4143-d75e-08d8d1afca21
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 12:47:01.7031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lELNqQDrKp0IyZWSO/KT9gkSauLoMHPVyAr24gNQ1x9MCtGFkLIBZkjEO+L2H+LjIhw21lmupBT2DnW6aFUt6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4091
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

