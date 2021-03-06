Return-Path: <SRS0=jP1a=IE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D07BC433E9
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Mar 2021 11:39:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF0636501A
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Mar 2021 11:39:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbhCFLiq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 6 Mar 2021 06:38:46 -0500
Received: from mail-eopbgr30086.outbound.protection.outlook.com ([40.107.3.86]:58510
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230458AbhCFLiR (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 6 Mar 2021 06:38:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLa4VmYqrWoVCGkcEGEopF9j0Jjn3dXjVxWKmetfYDvMdpZNZinOe2wlC89DkiMN1AyHiB7mU49GEF1Pp602PUgbEw8IIFvIzSfonbZVflvxI55h3PxbUknYXAasPUHGaS6bFGo+zrP/T9ookzDvNmmbdfswcC5YgR3Xmt49gyDc0UB3Q5/e8pm7bcvMjaaE3bsD6g2RvPgPinE/Rq8gBCZop6O/M0QTEK02iO3CnP9Fl7WGvtQXWChreTokTpmvbipUEJRhpwuJ8vOLwfokApmAPDNJ/aUHQd2REpL9/0RuE7DdN6gqW7Z8T/eOghkwvdc7fz8HuQAmrUE4H3lucQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJE0Ov249gPUdtT6ZeB+lf9+Z+9T/yJFkeTd4I25VJs=;
 b=mfIaMJ805RdFGw4UlDfAKf6ChBFBw9YSv6IJhYCx9e9/DNDwZPomZVAkE+Nb0OXvF1BxFIiORRvO8rw8wlujSsgNLrqsXpfPY7SdMfJ4WR56C9picG6SBPxuc8xeldANgK/ccoT+rDSbADo2xGWU9bvpZOXhn1vCScvoBx+5Stxl/geujGs6QpQyRDcgdDuSboIvD8I/3NXJUklUCuJSff+4DKJcdIvSa4wT8CqW6vU3KZNnkR02zpGBsmJ7xp+/numEKSdfJ90/n2Ty3nx6+G8A8ZqUDKsWORWdlZ4GGTNfcu4i8mEnS5Fn6jUCpWkam4XRDsSEA/tjb/nXy1V3jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJE0Ov249gPUdtT6ZeB+lf9+Z+9T/yJFkeTd4I25VJs=;
 b=gt4GVwrkM0Q1JXS+2YNh/YAduEbOml7p9lYbgnPVdtGDmCt39IQIbPPCeDQ7FRxiAyJ/JeOqZ2NjNj9vGOg/s46wukgjxSYlvInuhbGbozjSJgerCghfKe/gGC0o8lGMlCG5gVhAovcJ4eof59Cedtbkog8PSNCwtOua+Gkt7SE=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6618.eurprd04.prod.outlook.com (2603:10a6:10:10e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Sat, 6 Mar
 2021 11:38:15 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.054; Sat, 6 Mar 2021
 11:38:12 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V13 06/10] remoteproc: imx_rproc: use devm_ioremap
Date:   Sat,  6 Mar 2021 19:24:21 +0800
Message-Id: <1615029865-23312-7-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by HK2PR04CA0047.apcprd04.prod.outlook.com (2603:1096:202:14::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3912.17 via Frontend Transport; Sat, 6 Mar 2021 11:38:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d0927e6f-c1b3-43c7-ac9e-08d8e0945284
X-MS-TrafficTypeDiagnostic: DB8PR04MB6618:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB6618EAB3FB821735263428E2C9959@DB8PR04MB6618.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fupdrjoj6yyVmMMGc51CoOkknDKF409cPtLVuqCpbiqanEBN0dAxtH7H3Y16MOvUxtgXDGHTs3MHKgREMVOdnGzvHYqgJPXGDBGosM1UFzsQYJbi/u0XZYJ7I9kKR5QYavmfMl2OaNzxR3Bu2MGE7mc3Pt/XGuqvfFRahck84Iu4LkyOL1kccBjtaaXWJgVLNuhQY6Hi8M7M/Ie/2Ga19egG31zIm+n1ly18E2uUXNe/wHpx37x6xARINPMqhiSfzwtNhD+iSEhUXRKwgD6iFKEc3Jt1W6TTdMbtGggc368V1r8Tz5Dyy0ZGers2G5gYvYNdpuskAmnssEXvT+ZGdL65c/UVlK3X5AMUMikywj89pxWjwzZXrEXZoMpOTqU9/BbH9+LQ2hRaCiTAhOHXh+tbALsR2s7Rp5whrNCYnYnsQsTo59XhN5bBhbm2uAHZEYRyFqGWHr5Q7M+av4Tw52UaO+YcXryuKy/UUnI4FwGY6oEwxhm8Z51SLoRZ/pOtBEOuTIOQSx/x4iBJVK2XDAeJ8/CYjZMTfifzp/ETig9iDsj6Q4XHZyjpL37SUbeT3nY2/RDpW0gWzSLx/5Gc/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(83380400001)(6486002)(9686003)(6512007)(2616005)(956004)(8676002)(6666004)(69590400012)(86362001)(4326008)(66946007)(6506007)(7416002)(2906002)(52116002)(186003)(16526019)(26005)(8936002)(66476007)(66556008)(5660300002)(316002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?zEEUYS7EuPYq/uBuiMd7Bx7OI9ZaComeVXz3o+pn6FVv4mob+W3sPuICJ0ez?=
 =?us-ascii?Q?VzN9eOJQ1zWtpzi/e6OIzml36qnuQ4+WxRq/PpU39wzgmIjR+Gdte0AdWt+e?=
 =?us-ascii?Q?cgUT2bpYNp6RHvcFu9DzMryw4xz8VteiJwTAnOekt8XiLSghDJ5yx7wIJTMR?=
 =?us-ascii?Q?IMPpTDFdWu4tIDQuCschrK3Qm9WicApDj3Rr564/SJXxRzzOVGwl7BW3rLgm?=
 =?us-ascii?Q?fdi38aLo7eJ3Q99zCei79w7KIM6h81KtlURoTz7oiALN4UnSXnqtqFTQBugp?=
 =?us-ascii?Q?JEC6vkMTkPuOPKxwwfcJ9Wu8elkKvZ6Wl2ie7B6pcpebKh6mw0NZP+updQRq?=
 =?us-ascii?Q?DegPfXVnI4wtLMtQD+LY8SfxeRSce3E74+6XPQw7+uLGwmRtQuI1qLWTK27n?=
 =?us-ascii?Q?lz/StATY6lIFbzVBLGVvfOJfkUoGKr8V23L+i1uXOit7B1BGMnVkyzdPZ2gX?=
 =?us-ascii?Q?51NUq/Kbr5AFpiePnDnJQK0Zx6jzjqZT12vuO5kvIe+oeKEAb7KFmZlZ2G1z?=
 =?us-ascii?Q?tQdizOGhsFV5qfkerfTL7mkvcHPyepsKCLoNE9S8OgyAgaOzjbLQqmj1VeHz?=
 =?us-ascii?Q?iuWvyyd2tu9gPjdi490dDuK4JLgLyOvUq1zi3RiQKysYBaXKJP0hmz04G35m?=
 =?us-ascii?Q?p8tvcAiIP1W4EKIyDnppEuSI0EwApbbrN9XL4G52x75KRKuFcwKMRdUYnBfM?=
 =?us-ascii?Q?V9s+Eyj7GN2W/yICQS4faNhV7H5gzYLD9+7kuRw27SEB9OoKaMxnNxEGXchy?=
 =?us-ascii?Q?h5JEjrHam5NLt6Osf0XErEf/7V07zkVRxOD8/+nO34owOgK9COvnQQnl8MVd?=
 =?us-ascii?Q?E9nVwEGMTlz9TxSW15DMHSEcpwaD/2Xbkb5ZplrX6Bil4q2IGqtDE7k9Mczw?=
 =?us-ascii?Q?Bqj0OiZYdnKEY5dsiY7l6PRghC/oKVhNZ3U4ACYJ4BCaz/tBkGHjaWdotTwy?=
 =?us-ascii?Q?GG9YY/SqTNTa/U6aaDav+CLv3fypwDxDD5jYJY/OCXJ9a8x6Vk/ViQ5OmXsP?=
 =?us-ascii?Q?toRskgEnTptUMC1hmv2udWS0uorLdmzLGGUs9HyaOTgHzlVb5I6JtNAy0Bg5?=
 =?us-ascii?Q?F7zvbfCK9tmFRI2CtIsNlUrZ07i9A6qmGqEOlwE+3Bpl4A2ON5kcQEvE8dBb?=
 =?us-ascii?Q?G3B7twXEdjJnJcFtLTF8fzMegLBitpqn1LmAunvW+fVIyzESxkksRtUt+oNX?=
 =?us-ascii?Q?4Q1XZbdmGgDYZ7ZY/9FCO9buNlSteB2cSYaAgy/6/oSocEUrapafMByvQHjl?=
 =?us-ascii?Q?e/fYB8xidJs/C84n9JRLjCGZiUUCpM/0lIu1qYCAFOUgOIP8F9uPKnfCAAPa?=
 =?us-ascii?Q?JkYTM2SDUMEbpZjripJrmjtW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0927e6f-c1b3-43c7-ac9e-08d8e0945284
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2021 11:38:12.1151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYMaM6x1Qn6wsQ1w7gPmsd/oKgEwKNx2X4L014e2wSgKELgELYmtgqSYGv01UHrYPrgRWbxLjU/PToSc2C+J4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6618
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

We might need to map an region multiple times, becaue the region might
be shared between remote processors, such i.MX8QM with dual M4 cores.
So use devm_ioremap, not devm_ioremap_resource.

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/imx_rproc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 2a093cea4997..47fc1d06be6a 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -296,7 +296,8 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		if (b >= IMX7D_RPROC_MEM_MAX)
 			break;
 
-		priv->mem[b].cpu_addr = devm_ioremap_resource(&pdev->dev, &res);
+		/* Not use resource version, because we might share region */
+		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev, res.start, resource_size(&res));
 		if (IS_ERR(priv->mem[b].cpu_addr)) {
 			dev_err(dev, "failed to remap %pr\n", &res);
 			err = PTR_ERR(priv->mem[b].cpu_addr);
-- 
2.30.0

