Return-Path: <SRS0=lozc=DE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 856ABC4346E
	for <linux-remoteproc@archiver.kernel.org>; Sun, 27 Sep 2020 06:15:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 337A8221E5
	for <linux-remoteproc@archiver.kernel.org>; Sun, 27 Sep 2020 06:15:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="eUdISZ/W"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730341AbgI0GPg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 27 Sep 2020 02:15:36 -0400
Received: from mail-eopbgr140040.outbound.protection.outlook.com ([40.107.14.40]:38062
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726382AbgI0GPg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 27 Sep 2020 02:15:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FiUWoq0dwgHdRLcadbVTIjAlHwoUlaZ77zhcbRfsb98m6YKj5aIswqqiF4In/3C9YlScnqg0NM4dv8GfGuptdxW9JRCoTnT+Nh/jq5tvIJ44NAc+bARmzLNww47hYsKFRmQ0rWrv3jawi/o7kMS1L3W3xyosgQ9Xo4bVdNLg9PTQHpcHFx5oSn5WS9xH5Y7xy8FeRKYOgxHbJ4dqp9aEuNbhdE5ChtbXXjZ7HIh85BtZKYWrVKJL/XIXMr3qFuepsBcwTtKh57p2vg9fGXSoWWWYMe/1VBU2WxiapP9NQkFd29soFEwJ7r/75hQpggPLXgdvEIQFf+z+1GpkFLWa8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1ufFCrXLohwqXvo9epGDFyJ+Lt3G1kTh9Y1fPu0SPA=;
 b=c6uAVmpmMztp/yfJAyOksa4FRdk7/6gb2muhfvp6HdKsYP2MUjXK1RiIto2ngZhd5s4ata1faTTlek0qESMwz0KhvSbuJUMW3JWLHtzLl4zYHU2KV1lAKGg6waYAX707SHac07eyUZCF4B/PveSVGv4Tq+D85kSwSKARYrq6c3E5N+bokTLv3wpn+Q3zne4KFksc7yNGP3v8thQJxapqsw6/VdvId3RjavsCzevG70bxCptHBuTTmJFL5vmwH41D7HFZklVwm+Vmn+ytJlUdYECCiSOrxSbt42ZFztCtd91VC0YnFOzB1CpZmido8bUjZTLIbYmOTKXOwYmF+TMvdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1ufFCrXLohwqXvo9epGDFyJ+Lt3G1kTh9Y1fPu0SPA=;
 b=eUdISZ/WdjuyH5EkViFl8FtGnXloFWFoVfxlZD5Lz+NF83tzmheOKxio4V0kheW1WSNPZ5L0L09KjfhPqw/5+DNe1ZoPMO/P9aA6sg7cCDNk3rvyOiXYxtw0sBCKmeQg4GGMGhZa/txqFPgDdnKGn3QQrZxccru4pldtEbYKnZs=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4633.eurprd04.prod.outlook.com (2603:10a6:5:36::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Sun, 27 Sep
 2020 06:15:32 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3412.028; Sun, 27 Sep
 2020 06:15:32 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH V2 2/7] remoteproc: imx_rproc: add elf memory hooks
Date:   Sun, 27 Sep 2020 14:41:26 +0800
Message-Id: <20200927064131.24101-3-peng.fan@nxp.com>
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
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR04CA0178.apcprd04.prod.outlook.com (2603:1096:4:14::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Sun, 27 Sep 2020 06:15:28 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ba938894-6fcf-4f6f-d7cc-08d862acbd5d
X-MS-TrafficTypeDiagnostic: DB7PR04MB4633:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4633149AEE1682F9556224A888340@DB7PR04MB4633.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Oek+gZLAMG4FTt/wKOwduDC494YzEAyo7dwr16sinwDJfqj01J2u8VU5dxPUz9jnBRNtDwtvlXsjTDVonths8bP+yS2AW5STcJNJR2+UhD1ruvWSQ+8uscQ7rrYnPmXWSUw0ecOCviTAJdEmq+nDrhdT5zUlNmyrPkWuNQ+QdB1ZnL0rEp0Ot6j2k1hjBpAc4VGFLU9bD6xB4w81Hvy8jcrfINj3PAN3SNo9DRkGb1OgwntI2IrWQk+FWQCHFZzcS50D2zyjAWNT2EWFl9mcjDJe3lfppIZrKyarDVmNlajXgKj1TLLGh7VEHvnjgfeUtQdkytawFC2ycKbPw/ATAEOlZH2dCDpACdIxt2wBbR/LoI1C1Z98hdjBcOa6nnld
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(16526019)(186003)(52116002)(7416002)(6486002)(54906003)(316002)(36756003)(1076003)(44832011)(5660300002)(4326008)(8676002)(2906002)(86362001)(26005)(956004)(478600001)(8936002)(66946007)(6506007)(6512007)(2616005)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 0ade2zpT9vV6Yq2Te8jBbyNxPh/VT5QFxOg3kJxyrnHVb3U6Ld5CAQ+M54n/u26OE2zNuKTvsgBUhbt8qVULbzBHdomVxQumvnI6I/XWlmoI3YErgaeymMnbnru1Q9t+0P3Phb2j9Q1oKNIt55EGQOazuXcYDEqbM5rVyBUu5kJnLV83dbU7dKVTkFoGf/zX8lvrPZdFD5gjvRHnZETG3B/HRJBS/LE17eo/sm0ah0iJVfu/PGvsJUSRcpaj+SBOTYe9Hmn1Y6UN49IYg2899c/hW2ANTu4ubevMCdmfQNBTc/rgyS8kt3W4sXyvPC2R2atMRu3m1CzqlAX6eYaCt0d3trHwks6Ys75o4xIZvspddrrSHn1HVF25sDLNTAAcdH8jybe5k+CRnIL2A5so2KPzCJqGejhDHMp/JDh36CkjK1AWsFXGG7F+EzuY/TZiCsA76hWNh1mKy5HzaotzQZi8HI6XsXn/BK8Plkye/E9LUAozRFd+P6NwdmKJyQTeAFUT4pSw5GyPXIbt8YdsMNmk3cX+4r7skRDdRBncEpkkHPJJzSqdlhnGVRh5O5F/sKtiVT3woTcPFU2hmY14PECBACqi8hGcxqCOomecITtkw8l1ipE65kzj3Pfq5RPnEyw5vKOXekvfU2bLph9Y1g==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba938894-6fcf-4f6f-d7cc-08d862acbd5d
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2020 06:15:32.6005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKg62lxt9bFWpNqnyPJXAKDEjXxakOlC7k4JAIyGZqHtrxJq/CWLcNzSIKnRxmsyI7g3DQziNu7JDR6LR/s5DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4633
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add elf memory hooks according to elf_mem_hook setting in the platform
configuration dcfg.

Acked-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 8957ed271d20..d1abb253b499 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -6,6 +6,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
@@ -76,6 +77,7 @@ struct imx_rproc_dcfg {
 	u32				src_stop;
 	const struct imx_rproc_att	*att;
 	size_t				att_size;
+	bool				elf_mem_hook;
 };
 
 struct imx_rproc {
@@ -310,6 +312,16 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 	return 0;
 }
 
+static void imx_rproc_memcpy(struct rproc *rproc, void *dest, const void *src, size_t count)
+{
+	memcpy_toio((void * __iomem)dest, src, count);
+}
+
+static void imx_rproc_memset(struct rproc *rproc, void *s, int c, size_t count)
+{
+	memset_io((void * __iomem)s, c, count);
+}
+
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -340,6 +352,11 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		goto err_put_rproc;
 	}
 
+	if (dcfg->elf_mem_hook) {
+		rproc->ops->elf_memcpy = imx_rproc_memcpy;
+		rproc->ops->elf_memset = imx_rproc_memset;
+	}
+
 	priv = rproc->priv;
 	priv->rproc = rproc;
 	priv->regmap = regmap;
-- 
2.28.0

