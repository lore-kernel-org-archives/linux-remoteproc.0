Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7794DC433E8
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 09:28:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5353D619AA
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 09:28:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231842AbhC3J1r (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 30 Mar 2021 05:27:47 -0400
Received: from mail-db8eur05on2058.outbound.protection.outlook.com ([40.107.20.58]:3936
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231803AbhC3J12 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 30 Mar 2021 05:27:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLr8Cko5D2A7LxxXw0ZiFzuqQNm4GFPEyLEIgzCwUEO1pgp/FUGbsZ57cA1nx09g9fKmkh0NxCrOjgL26d+sj6Ot5/I6lgObRKYuyLQ7opEICQTXk+hnqnt24niwxM0EqUZdb8gPyG0SrH+e+Cdw910tQyNerRyVRI/0UdvjfTLbEuGJU//2YFA54Wfdgl2PABywerDBXHOgcHeVN0n24AuMsldZOvsvgraHuH8oxyfx2dvV/rssGYRiDmNF8H0GaWTIX80dgU2pzaBfizHoeJ83zc1r/SAupb6IW/EVgYR6oBzm3i5+pwCPJPyFN0A/fLtETrvZy6L774RylCiU/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lrd3+a3w5VU5RkFSHvyqw7S/H36dGznhA87ifuQCLOA=;
 b=Km8G9VZIGm0CLI6W5ZrIHRU2lDktujl2txZtaHE+r4XYGmtDqLHwjyV+VOKCRvuvu+eY/8mva/ITKl9u4qsmwB3GCzwc3edD1atQdS9Ut2yZFG91siFxlKRZ6Pnb3OyoBm0KeTrJNTuwWy6hSPBxht3O4zPZlq5ejPlIxoIuVxREiw7ib1jYXTjSLwRnwANmNiijyIioBHhHEgLl+L/4+rvrSexby7yiVk8UW2wW6r+tCv51ZE4UK3PqMt8YYedO6tXmXVLPTDy2agzDOtrnQMCnAwDPcvyT5BKfrdlZH7DMeHEU8OC+ZfG8qAgNKUtPfNNqaS7XUIufRKl9qcwV2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lrd3+a3w5VU5RkFSHvyqw7S/H36dGznhA87ifuQCLOA=;
 b=IH5jMcFeDmTBlpiS++pZkogpSSB0nxloik6yEGI8kl2eIFT34WiHq7wE2AZwDjGVGsIztX1E54tFqYNaERJlVjUsFv77zB5OfvbKdaKSKLVt5XSRcCehqAhMszwDvxPVPib00O1+9Nqa21epxlVfDcuzcOl3cnrzUybeCsA8rew=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7595.eurprd04.prod.outlook.com (2603:10a6:10:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 09:27:25 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3977.033; Tue, 30 Mar
 2021 09:27:25 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 5/8] remoteproc: imx_rproc: parse fsl,auto-boot
Date:   Tue, 30 Mar 2021 17:12:51 +0800
Message-Id: <1617095574-6764-6-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617095574-6764-1-git-send-email-peng.fan@oss.nxp.com>
References: <1617095574-6764-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::21) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4020.0 via Frontend Transport; Tue, 30 Mar 2021 09:27:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0c9a6f22-eb9e-43ac-df59-08d8f35e07c8
X-MS-TrafficTypeDiagnostic: DBBPR04MB7595:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB75951339B408EEAE1454A1FEC97D9@DBBPR04MB7595.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4v0S90nUrW7BluLmVOz3GeEYQh/tFtMyP+nPcECxfRqSLO2xHsmvb1goQ7Cx/2BwLTU8EUQ7dDveccBatvVsDt6v/PQylL7Hwl//tyvE9cF8IEa5m0KjjlpWn8QwWBoqFdh5my+5WHnJZPUIW5KRdcN2UtrzbonZgG2MSm5n8w17T3S1uruxxBHjmPtRl/QSbegrj+qrSGLBfvL1P8XjHReiQ1eB7dWc3mt0PzzWkhJ7OMm82O2QpaSxXyrOk3rhldVGwDIt4pm7PFsuYpsDchOxmftCE1mN/CoVgRtMsIxVNLALlf/6x3ZmasQgOImDBCp0z9yi/x8VMOSMiPf4t5FGhelZW2QtmxMD3RlE5RZHcWTqD6Q1TnX7bV3fuoNO3wPStwD4z2n8CK4tliP9S+8dYn48+S3NiqjcCT/a57l+48I9bRmEdfKLL/q83nT3yuppkHAibKHwCWluXd1xTBbBJbAot7Ptm+Lzmhp/a6Qq3v5zpjxXWswKBP4Hzi6fXT7M8ukJI5ihL12PeX3TvDFlK+mZNEGAUhC6HMZbGVO1zvoPTnS9+0P28bpzHuclxpklKWCNTWcy77urhNvv6hAPvCH6dKVen9YT5d2pXJoGJgHwihxhmwVoPhZZfylt3adFDuiawtaVCTgmeu4Lyo2DC+EBU+l6OvXQyaeshPI0C/r4YDN4fZuCbO9KD9rn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(9686003)(66556008)(2616005)(86362001)(6666004)(6486002)(52116002)(956004)(8936002)(66476007)(38100700001)(26005)(4326008)(6506007)(186003)(83380400001)(16526019)(478600001)(7416002)(6512007)(2906002)(69590400012)(5660300002)(316002)(8676002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bCCUfO0ZRvwbRmHbQHM5SCqZV+TiZdLDR3ema6VOBPoOIjKTrAN13Tgit9ZX?=
 =?us-ascii?Q?Qagwq0OhbtNrsVs7a5Y5G4nOG1LbuThw9iURlsDZI8SAHquOPslcv0XkrsZ/?=
 =?us-ascii?Q?aqYGA9CdG1ovda+QQaQvN4w8H6K+z5veu65GKB2Mk6C5YG+Y5TAsVHxDhxI1?=
 =?us-ascii?Q?7q1VdYuFJlyVa7+uCieChMQa+ngIJokc5GcvUKvIa1nQIV1E0mNI2TJVt/EY?=
 =?us-ascii?Q?s+XIjWHeNzqaUgsMPnKuAiTy8NcivMsdBficV7zmjkH7UIvvOFxJsV/kpdWu?=
 =?us-ascii?Q?ZNrzp6SKbBEBg6n5Oo5gCLhwHmooEnVV+OKw57R8ZTHejpVJXZ+5/0/bZsLZ?=
 =?us-ascii?Q?vUEETezdzD09F5zcuAkIg7BdEFIpwuSqibJHrW/yhq0kQ6w9EteodD0WP3G/?=
 =?us-ascii?Q?G/OI4FQw7/HmxwokiKq35916hPL70h6BbELvLE9wWv6/z1P3mnptLMXpCDhJ?=
 =?us-ascii?Q?vdqg6pX0F16Qx5lae4abUOaogkO3+V0vGJjK9EyPhwhOMQVzM6v7vZtihjT2?=
 =?us-ascii?Q?A+KMDVWDH5ZAqi4PYGZjYnH68Xpsr5zhcmky2VN/Bn7j2QISEP4fSraX3Tbl?=
 =?us-ascii?Q?4sHjyGaqgbf2VVrUALytfs0uig0SUTpgwUIo6AOubkuKsU3Ud46A7B4H7ilI?=
 =?us-ascii?Q?QCgX33dl4ugNz14O6iDpZxA67TZ0paoW4a1quPObi1DbbP/namxiUvY5asSs?=
 =?us-ascii?Q?LyBzivCwcUvdf/Cw+4bjWfolXysLY4Uc8t1SkQBj6WTiNnYoMX/YC5i56KTr?=
 =?us-ascii?Q?p6Z2j5vKo88oY0nkcmVIrYwdxXw8bCg69cMkyWYBUE60pt5Jc1fYswvm+Wuh?=
 =?us-ascii?Q?1rmLkA22tOwU4lTl7J/xvGSSs3iqJKA0v7u6jIcD1Yy2v3mQ5HpA4nPEl1JN?=
 =?us-ascii?Q?rS6RW8fuhHw84r8ouX3kunv+EEo84jh+AZkpknjfjgsflR2U49v8F0AUW0JA?=
 =?us-ascii?Q?obKPLvwya3nNnfF4cT3ppHLbSIF1cKULK5Kow8m95k5lnZY+doEQGbedFKAY?=
 =?us-ascii?Q?EPgMTlG2VGCARf9vePZhZhq8/mrU/IpWBWvJEmiOAofjDx6sh670p4agN1KE?=
 =?us-ascii?Q?Gy0DtEioANEDZEtvg+aucwUmaL3dsDoekfD0R7lMvWEEJ+E1/tnoCxgEKbZe?=
 =?us-ascii?Q?n80XHzTNr6y0E5Pg3K+b3s8F2FYbO6QjIOz1zYzTcnqeB9CHkXyyt/W6BIcZ?=
 =?us-ascii?Q?XZuURhdusqJI+EwFK8aTAlIeDBp6PEDGw8f9PdfX8DU0mK6PGACPcNyKBwor?=
 =?us-ascii?Q?29+b18S8lcviwJ/w43YEdeXaZLf7oolq7LAjhG8c/se3yRC49/VSkWjKQX5d?=
 =?us-ascii?Q?wSt/ytpYeyA9isdKLms1YINk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9a6f22-eb9e-43ac-df59-08d8f35e07c8
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 09:27:25.7804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bt+SzpOgTUas5HVsGLumpfkpOMeIyPOaeRhF+HXncH2vHV8zXpu7wy9Gx9QWBPv9wReKlnPZLk+yqzkY5cpXHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7595
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Parse fsl,auto-boot to indicate whether need remoteproc framework
auto boot or not.

When remote processor is booted before Linux Kernel up, do not parse
fsl,auto-boot. So add an entry to store the working mode of remote
processor. Currently only IMX_RPROC_NORMAL, IMX_RPROC_EARLY_BOOT.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index ca17f520d904..c576e12d3817 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -83,6 +83,16 @@ struct imx_rproc_dcfg {
 	size_t				att_size;
 };
 
+enum imx_rproc_mode {
+	/* Linux load/kick remote core */
+	IMX_RPROC_NORMAL,
+	/*
+	 * remote core booted before kicking Linux, and remote core
+	 * could be stopped & restarted by Linux
+	 */
+	IMX_RPROC_EARLY_BOOT,
+};
+
 struct imx_rproc {
 	struct device			*dev;
 	struct regmap			*regmap;
@@ -96,6 +106,7 @@ struct imx_rproc {
 	struct work_struct		rproc_work;
 	struct workqueue_struct		*workqueue;
 	void __iomem			*rsc_table;
+	enum imx_rproc_mode		mode;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
@@ -565,14 +576,18 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	int ret;
 	u32 val;
 
+	priv->mode = IMX_RPROC_NORMAL;
+
 	ret = regmap_read(priv->regmap, dcfg->src_reg, &val);
 	if (ret) {
 		dev_err(dev, "Failed to read src\n");
 		return ret;
 	}
 
-	if (!(val & dcfg->src_stop))
+	if (!(val & dcfg->src_stop)) {
+		priv->mode = IMX_RPROC_EARLY_BOOT;
 		priv->rproc->state = RPROC_DETACHED;
+	}
 
 	return 0;
 }
@@ -654,6 +669,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
 
+	if (priv->mode == IMX_RPROC_NORMAL)
+		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
+
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");
-- 
2.30.0

