Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC6FC43470
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 01:59:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C4EE611BD
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 01:59:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhDHB77 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Apr 2021 21:59:59 -0400
Received: from mail-eopbgr140053.outbound.protection.outlook.com ([40.107.14.53]:16101
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231133AbhDHB77 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Apr 2021 21:59:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+L3xi6c6zHXIZtq9NQklB8+WlP8+HTcFrjHkD191NlDtqeaugxx0MCeOB96p17n8D3D1lcYZwxvDS214TwezNWUSBzP/aDyIvDP5N9hk3Udj3dxGgnuSD39eNg4kt1AOKweJyl1fcgDTugi7lzaVdaE4IhqQRxMN/rm7/Gw8GUO6ROdPdXTmQJj18k+9SnRHI8PJsPDIXTRnYt4PHtUJkMM81yvg3vR4bKjQDSZlghmf7FoZQZMX68jr8EehsMjl6GF2OA5xrxPN1y4c0kHi+pDgjAIcPd5Erp+CuJjMVek8sBrVHt9fGScCQcawVYzZiwuiKYnfHk8Clcs1kEHmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qusxCsXs3I5Z0PqUbPNaGiJihqojpiGAZRdBw6OAFX4=;
 b=K8a6x9GYdgcwuJtisbzlFpi+6fXzZC1T7e54M+C2g8/mP0mhopthaJiqohxc9oMviX8ZDqdNi9d7gi1H8xfdJc+Kw8IyE+Xew3ebKUspN5SUEQRkoTcFsu91ekJ2VyLL3OYQrkLrGona1fsfIOow6xwORUkd9fBD+mqdhUYn/aVlklhSHGQHCODPML4ltMSEHxvpcY6HET8QFCX2EoKRhFXJt7pX9dMN47s7V3ss/pGdZX0u5Um0g1L5PzRqXlpsAEt1vRr4MKpbGaO0MakpTtorv+0pRIy8vWu2VMtsTDlrPCYhjGRm0Rk/pRYardHrg8HU7oMgmcSYioImGgdNXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qusxCsXs3I5Z0PqUbPNaGiJihqojpiGAZRdBw6OAFX4=;
 b=DjBnzIrD9jPXBlWy1ryO0DbG/jLniZvT285XARy0OUzPq00yK3sVjKmLYV+eNkB7FdsoKhG1NiY9a9lQtUMvt3EnqsROxkY/E4rLnkqL1BbmLhcfKPs0RJPBqy+Jg9o0SrIKpbTIxKJWyuLjPAU5aAHj3j31ntshhiU87HrvTwU=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB9PR04MB8140.eurprd04.prod.outlook.com (2603:10a6:10:249::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 8 Apr
 2021 01:59:42 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 01:59:41 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 4/4] remoteproc: imx_rproc: support remote cores booted before Linux Kernel
Date:   Thu,  8 Apr 2021 09:44:49 +0800
Message-Id: <1617846289-13496-5-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617846289-13496-1-git-send-email-peng.fan@oss.nxp.com>
References: <1617846289-13496-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0219.apcprd02.prod.outlook.com
 (2603:1096:201:20::31) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR02CA0219.apcprd02.prod.outlook.com (2603:1096:201:20::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 01:59:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99d6bd1b-c1d2-45fd-0bfa-08d8fa31f964
X-MS-TrafficTypeDiagnostic: DB9PR04MB8140:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB81403EB2D6C4C4D631ABBBC2C9749@DB9PR04MB8140.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m8iyl+utLrQsebwBe2b0114s3EzPZIj+PGKDdNw/Jtmb5Np8HqKZIjnrw131OlM3/RjLFwxdISasfq6zXrb4lkE56ixBgrRz2PKZCkFs7Ahc2+BXsneLFyamrdSjHbEQJAMOGDKrfNX7Vbm0wuc+3FB4NDijXNqin0Wj82wtz4zsSOmIPN5CbymM6k75/V5r2VZLj88RI8paNc85KiFqzzJoWe5usidJ/6b4d5bexrUnUC0rcc9lH0ek/Ljeab5BsFp99kaCw+Zx/uNKsCiS4UaIYmIyEhCzjbe9vnKhB1UjQKdlxGxi06zGcQZspZujeq2vy3Bg6pwBHYV0AgJyDk+F71WkBhO9N8YSlloFpylRua1rm49kQ8YkcPr/k9T6G5iLR9iq7UJGkxXXG4r128q9AQaF0jyvd03Rc+zqRJepiMS9EJRVY+O4jPRsZk6vdLrJTadREWAFF6TiZqmKn3HEb5CRyNDrnAT18vUrJniUwB9070+gCJjDqCqtbmM2Y3NA8m09Th+6khXSUShttxk6iyZcwaVGEjWyyu/ClB+4/4HYb30Ie9AoP0P7NPCfhRSz0XaGNvflOcQgpJ4sY88a7JlZBo6/pW+8HFRLngwrWmZs3hbP/E4JG0BcaMRGi7x0lk5i4CFEEPAnNZhPs0KWZKbcDNrylYnwswn4ZLje+yYpasxhiZQUY5k/KTOaazZz3OJAj7NW4Ewy6bi2TmU3cLTYSQm5LHLeE/FZr+0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(956004)(2616005)(4326008)(83380400001)(8936002)(86362001)(6486002)(316002)(38350700001)(5660300002)(66946007)(52116002)(6666004)(8676002)(6506007)(9686003)(478600001)(26005)(7416002)(186003)(38100700001)(16526019)(6512007)(66476007)(66556008)(2906002)(69590400012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?L7FBPpbeMcUdXjeyC6aH67OIHbFTkgR2GCWZZ0J0lkYUuWGUD9uLVLapnxUj?=
 =?us-ascii?Q?TQlOYwvgBUJUVhDoiEOKY371A3aml1Z+ZiLFF40JR4ta2vcHbLlCnjEqUcAY?=
 =?us-ascii?Q?9v6GtTI1lBtECA/ubE3Uvju4b9a0W48kg95pNgRRbBeDCNDWoDVWW7fBAiw0?=
 =?us-ascii?Q?U4A6Hl6wxjWAZV2QbImsRH4db4RNICE+/d5quLA0xFd3okICg7K7jihTDndz?=
 =?us-ascii?Q?yBFzkm/A7BCRARY6LA0UJK9F3UFEpbJYONTOZBxbJpFe8WOezPC1ZdBOM7ZA?=
 =?us-ascii?Q?U/hJbN61vjVzBshciXW46RiQKNqBwQFBbB1JyQyofKiDH/5N3cq6/vbJgru4?=
 =?us-ascii?Q?TJjkp4sVCq/7jnzdhd5u4XpRSkUOzSr8UfwsnFTnqGiyPNMfiOVdy54+C9as?=
 =?us-ascii?Q?TtVGRuSHAME9+eVIaUllrPP+tOCzjQ7anknHcZoXLMni5BBX4IwWGLWdIJh4?=
 =?us-ascii?Q?ETKnG+oVUl7PG43X9e2WgxoT3T2mzgg2afxFImgU6JnJKcHGAB4zX2RpdfkI?=
 =?us-ascii?Q?1er6PVVAELgB4tLIH/oLh9NKg8CBrs1Sa5FOlycGrtKkGODwkjqv2P2GGuKW?=
 =?us-ascii?Q?7PfHFAGMIc2yRHiFTyEmFZv9H4ULD+PJZl/6LTG3jji+ewQhqrVtHHBkfwYF?=
 =?us-ascii?Q?LQ7qkw3UY/HtLw4G4OuC1sDg+bZ5nhZm1NoguqecIhMjZlm+s9Guf2HP9fgz?=
 =?us-ascii?Q?XJ4HSqhemSKBmx5JzFl92umYjbkfefB1Is0h5NoGrcPbOL7lbx2l2bKc9SG2?=
 =?us-ascii?Q?6yosIe0BY/l6K4m6h0jOMIovzn1PmhrhVz80fgvYt7SUMSpG/XT3D795KPOs?=
 =?us-ascii?Q?WgL7DRk2g03gh5hb1UKjq8RylX3PAM4pYtA8CUzAClYzTeaBnGIevMLr0FeJ?=
 =?us-ascii?Q?7hOlrG2ayZdku3TIqSjJlZ1nqIpRJkMFx4j2TLT2My1BwNktbL6b49t3ilJn?=
 =?us-ascii?Q?Ofq81vqRMwXXwh3FOU2s8q0RQY+iHGX29Hv2culQa6QrjImZxJQvveJn7i3M?=
 =?us-ascii?Q?M0yZXbO7pyrSdIb+gogivihP6j6Umv11UhFgWqTxGxnwTr2id1KPsLVijtOE?=
 =?us-ascii?Q?/zW45LTmbQAQRsO6gDN82pDrHoNFT3qL3WQ5Oz9pyeM0wbpVHRjr3cFyrwm5?=
 =?us-ascii?Q?DbWiNUs70yMdg8H0GWWcMK5oYaR51uF79CD1GNGq5OflB6cIpy2Ag6Dvsu7N?=
 =?us-ascii?Q?1WQeDQdGu+h9SyozyFMgEArGu/L9PnwoD0AoaVx6gz/j0nzCCqVvxG7fGJ9H?=
 =?us-ascii?Q?nSDS/4VKrE2r4fT6AJbOMQpRzFsqp7qevs4/iDQtLC2A+IBxUtDrcYTv7ql5?=
 =?us-ascii?Q?J5j4hb2g+X2bRd1L2Chi+RHGHDfWkk0A6WjC4sgGH07Euw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d6bd1b-c1d2-45fd-0bfa-08d8fa31f964
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 01:59:41.9109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qaf2SM6Jj4elG9MtiDliUrGQNe5KIxLfH/fQNN3cEeECH3neLUmL6Pzv+BCJUsHdfZY295Bmw1uylgczEDVUZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8140
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

 - When remote cores are kicked before Linux Kernel, we are not able
   to get resource table from the firmware elf file, so we need to add
   rsc_table to hold the resource table published by remote cores and
   imx_rproc_get_loaded_rsc_table is to get the resource table.
 - Per remoteproc framework, add attach hook for processor in a detached
   state.
 - Add imx_rproc_detect_mode to detect remote cores' working mode to
   set the state which is required by remoteproc framework.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 45 ++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 7cd09971d1a4..d6338872c6db 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -95,6 +95,7 @@ struct imx_rproc {
 	struct mbox_chan		*rx_ch;
 	struct work_struct		rproc_work;
 	struct workqueue_struct		*workqueue;
+	void __iomem			*rsc_table;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
@@ -395,8 +396,26 @@ static void imx_rproc_kick(struct rproc *rproc, int vqid)
 			__func__, vqid, err);
 }
 
+static int imx_rproc_attach(struct rproc *rproc)
+{
+	return 0;
+}
+
+static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
+{
+	struct imx_rproc *priv = rproc->priv;
+
+	/* The resource table has already been mapped in imx_rproc_addr_init */
+	if (!priv->rsc_table)
+		return NULL;
+
+	*table_sz = SZ_1K;
+	return (struct resource_table *)priv->rsc_table;
+}
+
 static const struct rproc_ops imx_rproc_ops = {
 	.prepare	= imx_rproc_prepare,
+	.attach		= imx_rproc_attach,
 	.start		= imx_rproc_start,
 	.stop		= imx_rproc_stop,
 	.kick		= imx_rproc_kick,
@@ -404,6 +423,7 @@ static const struct rproc_ops imx_rproc_ops = {
 	.load		= rproc_elf_load_segments,
 	.parse_fw	= imx_rproc_parse_fw,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
+	.get_loaded_rsc_table = imx_rproc_get_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
 };
@@ -470,6 +490,8 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		}
 		priv->mem[b].sys_addr = res.start;
 		priv->mem[b].size = resource_size(&res);
+		if (!strcmp(node->name, "rsc_table"))
+			priv->rsc_table = priv->mem[b].cpu_addr;
 		b++;
 	}
 
@@ -536,6 +558,25 @@ static void imx_rproc_free_mbox(struct rproc *rproc)
 	mbox_free_channel(priv->rx_ch);
 }
 
+static int imx_rproc_detect_mode(struct imx_rproc *priv)
+{
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct device *dev = priv->dev;
+	int ret;
+	u32 val;
+
+	ret = regmap_read(priv->regmap, dcfg->src_reg, &val);
+	if (ret) {
+		dev_err(dev, "Failed to read src\n");
+		return ret;
+	}
+
+	if (!(val & dcfg->src_stop))
+		priv->rproc->state = RPROC_DETACHED;
+
+	return 0;
+}
+
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -590,6 +631,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		goto err_put_mbox;
 	}
 
+	ret = imx_rproc_detect_mode(priv);
+	if (ret)
+		goto err_put_mbox;
+
 	priv->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(priv->clk)) {
 		dev_err(dev, "Failed to get clock\n");
-- 
2.30.0

