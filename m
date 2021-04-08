Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8741C433ED
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 01:59:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0C0D61182
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 01:59:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbhDHB7x (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Apr 2021 21:59:53 -0400
Received: from mail-ve1eur01hn2249.outbound.protection.outlook.com ([52.100.7.249]:27621
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229558AbhDHB7q (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Apr 2021 21:59:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/Z9kAh9ygCcEcN5DCaZADddtsyOg+l0kmukdnL0gLPN2/5pOWeIk/Ng9qMDTgFdcW+EUHqD9hCsuDbx5QmZh31BptFhV3BF096Ohm+ukTZXMAhOw67MIo6LwbLCqvHaDjPfrbwLGxA9iEqahLWFKWm6PJOauvzFAE5KliAprEP65hAhVl1SQ03ypHFMBLHh/V0m7L/PRIH8F1fx4uwKmsc7oAt2LdB3t0eFKbjaSV9c3n65Pf0OdjutfnVKTwkYjyWvBIZLcDfajlTfICROlQPurVj0a0c4kz15Om4UOCrO6Nw+Ld6nm6k4lhraPe3yGqsZlLqlWb5zPf5eLkbSDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9w7J+aWzGVngM3dEmxCQzurZ7ny8hTSneaNZC6Rtvg=;
 b=S3l0Cuugd0xiigiEtvOS4s0oVQS4XRz3ad00pnBXzVL1ZaLDLds+sbolowcaOajN5ae7HyypkMNUkmu/en0q6WksZbUR9rjS9mw/XEHm5msDMRemqWZqE3QS9ZDeRNmPlYXq682U5OikLiGgeqXpSZY3lqy2XyxoP/FrCsmrjQiow8Gz67nx4FibATSRShouuuH36zEi5T2e/EyXb+yAiH4jlzF9P2UZaVpJ7kLrQkrGve/YRYlTe404EGlBk7XW3zYiXG+XuXRBuoHrorCGEHnLQFBelWoxPm4lubEqjuU3VyP/EIWU/OfN+Zv1I/7Csv8PAfv71rCAeeVexqf73A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9w7J+aWzGVngM3dEmxCQzurZ7ny8hTSneaNZC6Rtvg=;
 b=IdeVR8zgE04gd/iSwOx4FFHu/Yfd8N6TU+ulp/43mvHzQRpMijp7f1TWcBNUf3RDDI58Dfnews3hkHM+YTlj9oFJ2YZaILM5xDDQPI0BEyOLbS8KNSk9RCKGJ4NeW9o+CxKIM2xki3PIkz7ajlBRfmFBK7vwyuAaoYUTlUE+UTU=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB9PR04MB8140.eurprd04.prod.outlook.com (2603:10a6:10:249::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 8 Apr
 2021 01:59:33 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 01:59:33 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 2/4] remoteproc: imx_rproc: enlarge IMX7D_RPROC_MEM_MAX
Date:   Thu,  8 Apr 2021 09:44:47 +0800
Message-Id: <1617846289-13496-3-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by HK2PR02CA0219.apcprd02.prod.outlook.com (2603:1096:201:20::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 01:59:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89573ea4-378b-4fd4-2cb8-08d8fa31f480
X-MS-TrafficTypeDiagnostic: DB9PR04MB8140:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB8140090025B684B27E425E7CC9749@DB9PR04MB8140.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I+RGDtgOjRb+YijH+1a6TbnGTQaRV12EgplsWXqSQaW8Gd0Nuf2FtRWvDpXN?=
 =?us-ascii?Q?fg1ofz4VihxVoZuksczscz3YQD46gkQWBvN/a8qqHnIm1N8RlMnNnExFMYap?=
 =?us-ascii?Q?z0IBaIzD6i+ZiIyx1Z8oCiI+QLTXzEXz0SiwFPn4PyhzVq9WuWniFGcH+ubU?=
 =?us-ascii?Q?TWpCjQ/2KAUQjIXk5HCPwvsOXu5l+gW6nUyXY8E1oIg+ncWfTg3t8MdJWDK8?=
 =?us-ascii?Q?IZsBif2VZrpXoRQzORUH/IIvwgr67zXsZmzkYU8AwOvp2J3SLyJQ726Y3fIP?=
 =?us-ascii?Q?hDVCrHcvoHOEkK1KSU8r2TUpxEfIM73t82f+QYTX1ldEG803sSyUVKyrjmGj?=
 =?us-ascii?Q?Tv33KtiahO27NaQ9QHK2i/Xj4693Z2nm3xFstzfKyUUg7Dw8nTnz8lVg2CPz?=
 =?us-ascii?Q?EwvH940KCj+adrrLttsLz08j5N+Rf4CFKacmVAVKsMIepJAK9Ohe5OhuKa+T?=
 =?us-ascii?Q?KEPvzyHnrHS7WsmzHRfYXYBWZwmDe1/XwmNk9Xf1jR0TpUtUj14M4aDLt7SL?=
 =?us-ascii?Q?BBb6ND80U3yL1DVAz219T5Xcn8/fljLJ5nC7LW8SVCe26iejtvkkQPbzlFbF?=
 =?us-ascii?Q?B6mBVhNKzAnElxe3vowdPnK0Ll3S5jK/doH4gwRaIoqRGj9UpLAyHpjlAD6d?=
 =?us-ascii?Q?Rml9dChcAPVhi8Fukl4sN/2e8Vvm8jeGelLYtC3CW3u5vI6soe7V+cTrp5AP?=
 =?us-ascii?Q?XNJ8uP2rkihFF9F0vQqfTPcvvux2nZ/2KQ3DT4uHE2Ba34kfytKsG1u0NVl1?=
 =?us-ascii?Q?CwIDucPIwm0X+hw07Yrllwa+G9qLWV34CS/2zKKK6E1fouCz6Cx3jlhr2Hei?=
 =?us-ascii?Q?cSQk0gWNyEflTv5NoFHIYOi01vyEuTVdn7TMMOnvJ51rm4PIXpo1yCgCYw4S?=
 =?us-ascii?Q?MKFQYtEJfwYS/iMcQUM5YiP0djY8i4pBmOWAiacADG6ZJE2FS0iyxxNYMHEO?=
 =?us-ascii?Q?U+hsa8EDdMunWEUdO+LeZlycIouT72qiefoycyTkz6lL7YzzJourbPYZwL/O?=
 =?us-ascii?Q?KECCQlRcEQ/ij+ZBOjIzWTislRSHB+9gwH9mWHu31Hfs1MvQf2ItcPoF18/q?=
 =?us-ascii?Q?WHQhy899?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:OSPM;SFS:(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(956004)(2616005)(4326008)(83380400001)(8936002)(86362001)(6486002)(316002)(38350700001)(5660300002)(66946007)(52116002)(6666004)(8676002)(6506007)(9686003)(478600001)(26005)(7416002)(186003)(38100700001)(16526019)(6512007)(66476007)(66556008)(2906002)(69590400012)(161623001);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?auC6TsOCofnFqSEB7MijjDjVzKFVlHy+lnQ7XoDZ+BFsQNpic8PK3mn16veV?=
 =?us-ascii?Q?GYlO6er2L4Hai/EFWDtfN0+DAOuc1StPDRcXT9NrTEtIKuUtjgs8QBZRyrrJ?=
 =?us-ascii?Q?0+GApWMBuL1etlKF3hp46LZ5poxS93VU7MY+lt2PUJbS3ZkUlJyCCnW5fmAH?=
 =?us-ascii?Q?ESE2mvGxnueJ9kZdnyFiMDm/is830dDIMD90YhZ2mi9PbGP0MGUwrxS8G+xh?=
 =?us-ascii?Q?aB5xBYqEEyoSUuScadQC79kEUjlYCqZu8IgEd7QYFjyYCT8OIFNAZVOGNFLy?=
 =?us-ascii?Q?WSs3Mmxei3/Rhgvq0A8O0tGHHpCpaiqPkdsSxvR80CCugpsLpBfnoUNnOh0s?=
 =?us-ascii?Q?Lp1/+CHe311h7VBpoLBRV4khYzFu+1+cxxH9bm3s4gGtWYcaiW/L8YjUJpWr?=
 =?us-ascii?Q?lDJ833KWTFEBV4K5UFjEpmqQgTd1bSBmaPM7Tz6WyIgSMjttk/NvsMgSbtIy?=
 =?us-ascii?Q?bDpkbU40fPZkZHxTVvH+tyDD+YyT5QQ955BO1XHl2vH1Pc20j9E8ehvTBTvn?=
 =?us-ascii?Q?d803VT38mW89w2767zALtRioxWfXTUVZEeZFAUQLDs/D/mw25JBc1BSIGOzL?=
 =?us-ascii?Q?7ZR+OZT5uh10EIcNc1OxLpBZmqSp7Ps1inNXcV9oQwua1Olfhpyz6AoiVZv9?=
 =?us-ascii?Q?TjcPELAPriNlfEiOj3DO1Fe6byXo8G2dNHHIuxQbLgARoyDlUF6txRCduZSS?=
 =?us-ascii?Q?96g2EJId3i13gReWwG6wYB1SB4uGx9hakpOGgqBLioEU0isLV5PsOb3Tk+lz?=
 =?us-ascii?Q?7aay8OzvXx4VWvPfu84kg+TL0qdiY3dYKJsJukWs8M5jcEznY5hryN57oWaL?=
 =?us-ascii?Q?jY3nAXo+GtTxBBddsEONjmcGYhXTVtgQi3HLUrl4YwQBv2q8zjxmBcZR7jDv?=
 =?us-ascii?Q?Y4qVDfppORjN+DIWfPdUN6L/ac29U3uEZTb3CLfpypbam/pUsIvnzai3Kr64?=
 =?us-ascii?Q?NDg/2pfId9TkDHzLx5FrdECUq1//IjGu3XQA8G1OXiLxoy14pJqidmHLQY+t?=
 =?us-ascii?Q?wXPUTEyV55YxAvYzlm9BXvrpqG7Eix1yqS5Bk7jb0oIqMpjQtljrTEMnz4h5?=
 =?us-ascii?Q?FJWBmo605D3x4GhvELiwrGCrVh9Y0uIFbbhxJ68/+aPvz6X3cr1F8iIJqjYQ?=
 =?us-ascii?Q?eudxJgQvVogxtKBWBQD6hkaSfjktxBzPeXMlnkCRtdyM1rdzuakzSVXBl3cc?=
 =?us-ascii?Q?85YH1QPMEWtwid4RLAHb2epe5JZ7PGukVdTXU8HIHRRT+6aj3raLUe0Ir+sh?=
 =?us-ascii?Q?fwplWGEjgVdBv++InXC0LVKg8zhBTV5Jde16jG/PJ325p40xm0owPrYoRgqH?=
 =?us-ascii?Q?DSBvUSgrOcwvtQ+GtdhFBQR4K+UHWb9xDZVK86EO6gte8w=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89573ea4-378b-4fd4-2cb8-08d8fa31f480
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 01:59:33.7336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRkQnNFVvbz71etXG1YyHrRmg9Zv1976PeXZ2pkXl6inDGPxvRjaXQiK/rPxGVCx3VhEDQexKrJH+DiAIqNdRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8140
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

8 is not enough when we need more, such as resource table for remote cores
that booted before Linux Kernel, so enlarge IMX7D_RPROC_MEM_MAX to 32.
And also rename it to IMX_RPROC_MEM_MAX which make more sense.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/imx_rproc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 077413319f58..b05aae0ad7a2 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -48,7 +48,7 @@
 					 | IMX6SX_SW_M4C_NON_SCLR_RST \
 					 | IMX6SX_SW_M4C_RST)
 
-#define IMX7D_RPROC_MEM_MAX		8
+#define IMX_RPROC_MEM_MAX		32
 
 /**
  * struct imx_rproc_mem - slim internal memory structure
@@ -88,7 +88,7 @@ struct imx_rproc {
 	struct regmap			*regmap;
 	struct rproc			*rproc;
 	const struct imx_rproc_dcfg	*dcfg;
-	struct imx_rproc_mem		mem[IMX7D_RPROC_MEM_MAX];
+	struct imx_rproc_mem		mem[IMX_RPROC_MEM_MAX];
 	struct clk			*clk;
 	struct mbox_client		cl;
 	struct mbox_chan		*tx_ch;
@@ -272,7 +272,7 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
 	if (imx_rproc_da_to_sys(priv, da, len, &sys))
 		return NULL;
 
-	for (i = 0; i < IMX7D_RPROC_MEM_MAX; i++) {
+	for (i = 0; i < IMX_RPROC_MEM_MAX; i++) {
 		if (sys >= priv->mem[i].sys_addr && sys + len <
 		    priv->mem[i].sys_addr +  priv->mem[i].size) {
 			unsigned int offset = sys - priv->mem[i].sys_addr;
@@ -425,7 +425,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		if (!(att->flags & ATT_OWN))
 			continue;
 
-		if (b >= IMX7D_RPROC_MEM_MAX)
+		if (b >= IMX_RPROC_MEM_MAX)
 			break;
 
 		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev,
@@ -461,7 +461,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 
 		of_node_put(node);
 
-		if (b >= IMX7D_RPROC_MEM_MAX)
+		if (b >= IMX_RPROC_MEM_MAX)
 			break;
 
 		/* Not use resource version, because we might share region */
-- 
2.30.0

