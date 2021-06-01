Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF64C4708F
	for <linux-remoteproc@archiver.kernel.org>; Tue,  1 Jun 2021 09:56:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38CCC61263
	for <linux-remoteproc@archiver.kernel.org>; Tue,  1 Jun 2021 09:56:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbhFAJ6a (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 1 Jun 2021 05:58:30 -0400
Received: from mail-eopbgr40065.outbound.protection.outlook.com ([40.107.4.65]:45121
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230170AbhFAJ6a (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 1 Jun 2021 05:58:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WD0Je6QyEp1f4TwUa8LplQL1ofHciYSrLkqaJd7PMErRZdZD9feNo8P7+T9Ho5eelwW6YlGmi87fdwPRtXoLqXwOvQYvI8UnyNo36htmxeB33Cc5WOOS1xyXmE8vdTcQVXXhjnkDmGstUfHanqTkKjhOdcsQjA+SVcs5wQ0ysIG6WyyPq4M20QhSj0OLCaMMvnUCEP8cxT7bwzrphKpzBgpJoZPUKsPE0Wmv6fjXmxGC9ShzKrfK1eMwGw7x28dFJbOeEJqUrwaTirtSux5WJtq4M7d/jnXVVpJHu49Gw1HTl6xk6zJOsMRvtxOJSBJeWgq4ObH5NUpW4DXFLT8XxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TE4mdJX2M4RwrAbs9ZQ8tgL2TeZZ/gzW4g9SBYyW9Ts=;
 b=GhUq/c4GwANk/o8jelMDXqQwZ5DV4wTn7Y468Ly+AbbbsduPmkDvCTeUMSY6FOO8a1pzPWrDyZzDqmPRC01ID8fGacKum2qEUy34vdP2GKOBBfMBIF3r22SrmbTAqIX0FeUlaCGe5rU0I2OHoKW0RyczhG7hcrCAr3jz+bPExSpLjGoIgTUDagiy34PFPVM94bTZFnoAken/EwDoqCzqYoq7+hhJa8t/TF43Gy3b7LIsRnxMVpEPx65SzAVQqCOEARZZgZBRy3TiOJTEalR/UEI26vcDF67u6qeM3CPhfYO12JHurWLaBDwxQ0tE7gMbhT3zBk10uBxnfAQl0u3Zmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TE4mdJX2M4RwrAbs9ZQ8tgL2TeZZ/gzW4g9SBYyW9Ts=;
 b=NSug01YaHFyJpJKrZlO2nMffqCnSp2OtqDXak456QbCc9r2JqLyZMfUDlLqTpIvfFZhFIiAtLi2kkIaN8bpoHxac9SH2cXMO9RcVcYehvrwvVvv3t+DMHFkPV9LGscCr172I5oASc6g7cZ2LxxiJp36c/v+46qog4X14xjlUSCI=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5993.eurprd04.prod.outlook.com (2603:10a6:10:8d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Tue, 1 Jun
 2021 09:56:44 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 09:56:44 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] remoteproc: imx_rproc: correct firmware reload
Date:   Tue,  1 Jun 2021 18:29:39 +0800
Message-Id: <20210601102939.16139-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR0302CA0005.apcprd03.prod.outlook.com
 (2603:1096:3:2::15) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR0302CA0005.apcprd03.prod.outlook.com (2603:1096:3:2::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.9 via Frontend Transport; Tue, 1 Jun 2021 09:56:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4b16314-8488-4c69-49e4-08d924e38fb3
X-MS-TrafficTypeDiagnostic: DB7PR04MB5993:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5993D3BA755B41D65A30A673C93E9@DB7PR04MB5993.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SCNMWp3NaKYiBBHVnI2eVYdDLItksBF/d7uGsJBmYK+/OMN2G+9IK6TCnpSDp0+t2wnEM5xc1ufN/m1dIyhxbHO8SPpuRGHXg8MPIr1kL6aroZ0Blq1APk0ZDSXZM6JoCpKw62vDFtS9V2C3kTNw6jx3jF/tyEOEdGmuFshrucEqdz8vM9Y5REpF9WJ9a2KZMpi3ZgfF8UMLecHgJ+h1zDZjJIC0C1v+ashVCFvCrfCnyJaBLqpmi1M1Q7qfZ9FTUIb/J9EJXX7R1I4mIEnIrR/wEcHw0d5MmSkzLc4mq2WBekZjmkEuxIL1GMqCUdv43yNtYiPbXiGzJHay1J9Q4c94VJIxTweb6A5mA2DCI3svhrAEhqEINpE4GoJSeqDfATT58rgCF5Hn0xePSfQTFLDfp0N2Hb3KJSYPKRksdPpKMdo6h0MzzNT1EmpOVjXHNzS3qTjIq24if+nX1ZoQSby9XPsj0afy/HYEg4RMXQJXD4ifZFolwRd3ouyAk3xUJ75scOCC3WnQGMLMlsWp3ZZ2vdos/Gx72Kg7zvt8c4RHoMjv+jtxMAhDcv90EYEo2/pj0AU5V7gSFAyu9EuUiJN7NH9gtVAnKjdsP8JUB2H+brXNMM/IS6Tuy9n/NemgEOjnuLz9/Qm7b/JWGDg+OGw0pRUAoMyG1UQJ60lcbdMeEe9+sYbOce8OUgGlomym5zjDczzWoIdpys6HdZUS11pVNlykyaUH9oN9BbqeWPtAWyD2AzqjekbVba3UQsj2ShSjZX6mvqaan00y5NiJXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(6512007)(4326008)(66476007)(6506007)(66946007)(956004)(8936002)(52116002)(8676002)(38350700002)(66556008)(83380400001)(2616005)(6486002)(16526019)(86362001)(186003)(966005)(2906002)(26005)(1076003)(7416002)(5660300002)(498600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ow6OvskxD5QhyAqbIv3v4zk8igwm5JI9bjcSw+MvdaWTa/PPU6+t4Fewx2b/?=
 =?us-ascii?Q?ngO6AZD7grwy95Je5bvqv6SFBkbEQ/0Hvi3JI7Rb9toZ6SwSjd5kOOyY0UVf?=
 =?us-ascii?Q?YV7j8+ZR5Nhw2+4pYBgigXXTVxRYspY5kkcRgrSznHrnshGHCsXpKrPT4yCF?=
 =?us-ascii?Q?lbRgAlaHhEuRrUuUkBspfXWFgcpabfuVBzmmxeYzTslTnFfBkjBvq1YlUJGH?=
 =?us-ascii?Q?3TJaDpDYiNoGenXqZGT02By8RdyfFC51FJpr3eNb1/89x+VH93XQkdl3X/xs?=
 =?us-ascii?Q?i/zxwUrPyh6dEQrySQN2+xD5V+Lhtae4rwYZeZmdFLhH68KVdP0P2Mc05Qt2?=
 =?us-ascii?Q?AkeBdlWoeQpo/21L4+Vj0TBDcguekREEJBfgd6xMIWzrwXiznlIjYxlidsMu?=
 =?us-ascii?Q?OtURLdZZLrgMQd3tsUSSB4ycjz8Bxuo2kNW2ejrttn6ZUTyuqZExCO11jKj3?=
 =?us-ascii?Q?h1O9QHug7lYcghhtism7DmyT07FWUeXXf580CXJjG9ROTlN2m1R8205qIFX4?=
 =?us-ascii?Q?NW6uHB4suFyBA/ITOKzzPTKiu1RWsaQvIujtCpnJBkPkWBVv8DS7iu/v9f7a?=
 =?us-ascii?Q?0Na3/Yo3OXuGnbJNgT5+gBeh0wDxD3RENzglf/AtFKcOFchnl0Bn0TqgRc3v?=
 =?us-ascii?Q?+Xv0NU/XJTlobL2LNNnDdER8FgPsBjYgZSQn8aRwTJW60yR5siasnqhafUs6?=
 =?us-ascii?Q?ASOfEDQic7w9hoWLLFZdGwr2ftXst+Y9mbu+cZrAQCfVbZdlUDPcG3MhYxe2?=
 =?us-ascii?Q?jKgxPsSSJNyGuM8fqV3EfN31H42ORL28TKytnMKhTmWxrY3pc76fb2jJe30/?=
 =?us-ascii?Q?6xK/a+0B3OhD1DtGXNh7EPmRI+U/rFt5PO+Lb0OX68dcK2e0VkHK/nvQITXJ?=
 =?us-ascii?Q?U/0N7tfj4oz0k3DJp57uJJENxorHAr8XoX/M1rS4rkyu+UO0cZP7bKnJCalH?=
 =?us-ascii?Q?8Vfxlksu5wb8OQJZeZ77UE7Jfy9bkeQev+XWvFOASJVXhZVxnxdSjeGrJuOV?=
 =?us-ascii?Q?g9HWO9V1wvdHwE0n5YmJI6lsusB7mOSqQXBUK3mIlS54cRKJXu0sAprOrLVF?=
 =?us-ascii?Q?XrsiP0YVPjXL/rtKxMdYLBlbwFrfkZ59ij6bJ56OdUMaGd9ANxzkajcgi8nW?=
 =?us-ascii?Q?Y12BiC9OXChNzsQaFWVhJ3N+peEbLYCKahTrXBLNw9Xl3uqAxTeX5ZN9F4gV?=
 =?us-ascii?Q?FZSHVs/DapxmK6M1P6QmiPW1MBjQvFyoEG4NPyEZm4IrH7bpdfv82RozZdlz?=
 =?us-ascii?Q?NJiNVfKH9JvNm1LT3uSdXU32nbKSJLdN5RBGo+6VEQ2lYKqORQXGzld06jhf?=
 =?us-ascii?Q?1SeEpqnQ3utKnGRXn3jZqw7jZHaGOqY910XM/KmExzLfPA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b16314-8488-4c69-49e4-08d924e38fb3
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 09:56:43.9542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEvuIUmMHtOCx1GU89lU8bjCKxduxBeLlmSZwhBEyv3KIzYS4X0nf7Uh1JDfRco1uCqwwR74zop+FdeRROqDCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5993
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

ENABLE_M4 should be set to 1 when loading code to TCM, otherwise
you will not able to replace the firmware after you stop m4.

Besides ENABLE_M4, we still need set SW_M4C_RST, because this bit
will be automatically set with SW_M4C_NON_SCLR_RST set.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V1:
 Although this is an fix, but it is not critical, patch is based on
 https://patchwork.kernel.org/project/linux-remoteproc/cover/1620274123-1461-1-git-send-email-peng.fan@oss.nxp.com/

 drivers/remoteproc/imx_rproc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index cd2ca96a30e5..ce2ce42bee91 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -33,7 +33,8 @@
 
 #define IMX7D_M4_START			(IMX7D_ENABLE_M4 | IMX7D_SW_M4P_RST \
 					 | IMX7D_SW_M4C_RST)
-#define IMX7D_M4_STOP			(IMX7D_ENABLE_M4 | IMX7D_SW_M4C_NON_SCLR_RST)
+#define IMX7D_M4_STOP			(IMX7D_ENABLE_M4 | IMX7D_SW_M4C_RST | \
+					 IMX7D_SW_M4C_NON_SCLR_RST)
 
 /* Address: 0x020D8000 */
 #define IMX6SX_SRC_SCR			0x00
@@ -44,7 +45,8 @@
 
 #define IMX6SX_M4_START			(IMX6SX_ENABLE_M4 | IMX6SX_SW_M4P_RST \
 					 | IMX6SX_SW_M4C_RST)
-#define IMX6SX_M4_STOP			(IMX6SX_ENABLE_M4 | IMX6SX_SW_M4C_NON_SCLR_RST)
+#define IMX6SX_M4_STOP			(IMX6SX_ENABLE_M4 | IMX6SX_SW_M4C_RST | \
+					 IMX6SX_SW_M4C_NON_SCLR_RST)
 #define IMX6SX_M4_RST_MASK		(IMX6SX_ENABLE_M4 | IMX6SX_SW_M4P_RST \
 					 | IMX6SX_SW_M4C_NON_SCLR_RST \
 					 | IMX6SX_SW_M4C_RST)
@@ -691,7 +693,7 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 		return ret;
 	}
 
-	if (!(val & dcfg->src_stop))
+	if ((val & dcfg->src_mask) != dcfg->src_stop)
 		priv->rproc->state = RPROC_DETACHED;
 
 	return 0;
-- 
2.30.0

