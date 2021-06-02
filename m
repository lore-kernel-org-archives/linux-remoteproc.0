Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90A8C47083
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Jun 2021 06:09:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B715F61027
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Jun 2021 06:09:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbhFBGKz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 2 Jun 2021 02:10:55 -0400
Received: from mail-eopbgr80048.outbound.protection.outlook.com ([40.107.8.48]:48887
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230264AbhFBGKz (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Jun 2021 02:10:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sp7t3s8G3wxA2Vr3+b6Ergt8GiR1k1R+d7T1KxdqH+wO5jbESbFLLctThKQnp08dyGC4vbKkoG9jDcr2Ve8w/k8idLh668/UlM8tPbxQ06hLQ9kOZyHPsVdqk4uMarAuJ8eybpiJd/NZDcuaY9kswexF5LNX5aOcWOC5ivA123bho7sZp3bUVRycuImW3jXz7hzF8lN/d8ynJrcsm6GVSHnrQny1oDBEtwu7GR/cwxixB7tktorRqWMg6dchpqMVpWGLtfkRYq6QfCJwOMjdmgDGhmRkMEuCXAM9b9qEzy60mDCLrBt1nLOSHY2Z2XLASpJk8bkRAEEt5NCpmDOyFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/AcDNJN517cG2kgGX16lmGs8uxty3sGmytvGZ28XUY=;
 b=RkvDrJyPsJSLiFvaIEXQgTtYw5VzRbrlQEm+9EWnPlND3EsfN8ItChdX3M3uWBTkxUWiz4UMhvlh0Ywqs+jSonWZxx3WmdGBjFdx30ykvQkyJW0bcynA3d6889gnQTEEqKKIrs1ZkVlHY1a1GM5y2dvwu9Ow5MPc+J3GZJO4S7pCVxS9Cd9O7qTD0mMwrp4U2vld5BPQgRmLWh6P+tZiPHrI2vf5yStB6rT+m5OEqnzvsKQgVjzY+uoPm2rXSH/lzrn9SjPWvPAAic6xrw03TVLk58iJhgVReAmbh0C12BtbEtN/WLwFPpbhAolAMgbWcXzj8723wC8jL41lY0CBxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/AcDNJN517cG2kgGX16lmGs8uxty3sGmytvGZ28XUY=;
 b=Yd6bVbu3dD0jjrEdd24r1FGgma/VyxFKsCxrWmbDLif88AIUiNZkuGzm0pOIBb7uvDAFN61K/n3MFPmxW76V4KquZ4kAvVa6GmX9Mggv9GNbIzFZrw+eDpgco3aZNUq5Sc8OB22gh1glQyIA52gl0g/mhHoLIdMnTHL6WZwtXsc=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4235.eurprd04.prod.outlook.com (2603:10a6:5:22::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 2 Jun
 2021 06:09:09 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 06:09:08 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2] remoteproc: imx_rproc: correct firmware reload
Date:   Wed,  2 Jun 2021 14:42:06 +0800
Message-Id: <20210602064206.27004-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR0601CA0021.apcprd06.prod.outlook.com (2603:1096:3::31)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR0601CA0021.apcprd06.prod.outlook.com (2603:1096:3::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Wed, 2 Jun 2021 06:09:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbe996c3-6840-4c82-2de3-08d9258cef04
X-MS-TrafficTypeDiagnostic: DB7PR04MB4235:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4235D05EFAD30B847FD74960C93D9@DB7PR04MB4235.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1rgUPe0oR9Aibzr7ONPuhNeMRMYI4HL23bfyqefLB6rUWggeP6SkW8B0fv43r/857qxEpOkE9q9zE7z25tGZP36gEPcJoujecusk1Fzyzy6BSvHa9KISp8rX/rLdvLLAYd2fRf2CiwZhOUbOEV1apfM3sld3Ns6mwTSup7vV9POme5im/RvHevIU6v/feJs8lKnOAJUMUYi7qXOni1P4Q1qOEpFkObc7bDwS4DdVKHx1ZQ4WqmjKenHLg598hZxeeinw2k/1XNrS87KzUVqsqzNFuQdRF/yho8wTuqoH/cwoyFSOtBGkhjj8b9/htMZ1d2skHoPXl0V23NmwSWjasVSvK0SaykglfBsYkAqJB3dSdLP3lNw2v7YQS2X8ljlmy/ZnyU18h0ZBroHEYccJvsPnKhPHyyO53wJ7bAv4upAoTFX//oXkSoCrOD8PVNhv6P6o9ueNMl+5NFIupvUhmaS3lP8H16KwwV3pc2tAk9wo2j04JQPp45XuX9GIEOwiZ39OlyE3qu0NdKcN0eG2m3O/kLnf61tW8Rm8j9kmmE+le9xSpNSU2jdK13DifRuT5lldnEO7J4ewt+LmoaI9TsDd5N071edfsTVWHqeHNolhDKx98EcXYaSFpH/c8nQEfpmMGE9fGfrEBU5r+w8fgzxO0nrzbLNe03JZGFUWr5jIuf4ZtlEVLsIY8HRcdZ+2cl9zePP/dK2p70RwwI9U9mbu0L5KnmnwzWNhNGYnXDiJb4vZ8tL6wBdB8o3hv2ga623y4ypmvoIk4ZEeDREbZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(52116002)(6486002)(956004)(2616005)(5660300002)(26005)(478600001)(66946007)(6506007)(66476007)(966005)(66556008)(38350700002)(38100700002)(83380400001)(6512007)(8676002)(7416002)(4326008)(2906002)(86362001)(1076003)(316002)(186003)(16526019)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IrWG8vT/5DArfM5Wc1OAPGlermsZq+jPAzjsCuFTaO9KZyD01wt1p7k3atpJ?=
 =?us-ascii?Q?njidCakVh6VgXgfO1nXq8kAAIcFFxQO2YUPUkmiKICt+izgLcV61v21KZOlO?=
 =?us-ascii?Q?fmOpkfxp/OYVe1XYXv1YOukSfxmr5ES+JrQGfkZJnUZZTa/9ENpxAG+VO5VZ?=
 =?us-ascii?Q?PPdivxiHGvwj7Ssmay0D00qDqESWojQ0gFbGUX2F1aea4n/LJv0wf82sgx7L?=
 =?us-ascii?Q?fBwXtF/UytzzbenXq7GiXjhrryMr7sMpl6n53xTNZ9C78nKTEEmPEutbXEnM?=
 =?us-ascii?Q?biP+YXkLAhH8eMn/O4cCW9KMWUcRNnA8/QBX89rx6ZSgHmUEHsGHVMc6g8bA?=
 =?us-ascii?Q?TV/npZ8infGgeQADFQffjwPpN4/Jnour2kaFQ8YcgXksnGfUC1kQv5EJsdEY?=
 =?us-ascii?Q?yIp+0cHcubMVJ03DrRwN+a9xYeZh84lI+CuQocSseqYeC3oI3whNtjLaV9Bq?=
 =?us-ascii?Q?DVyuDZ6y8WoMwgj5DyS4yWxLsUBoKwn7hFmm9nVk661aERhhx/Tmm2xxByjM?=
 =?us-ascii?Q?V2PZ6aVuEEmvr5qz2MwTC/uwAurHK1cSDrKFQ2j3pa8sSKSRrecx97ZGIQc/?=
 =?us-ascii?Q?515AL7nMto4IggjchR28AFcaSUrhs8DIoa2S5Ze8RTFIlr0/XI6nSOWFiz8j?=
 =?us-ascii?Q?EqBPIOgeBgLTVXMlQF4hWbXPowYse0vpVdYMvcwUu+Gd+DdDIQV/NJZ+oHpY?=
 =?us-ascii?Q?9JB0Fj5nD3QBBR2Y9yuMbL6hfnphKMQf6BfaFQcXGNjHUCYCFXv6R9uW23dg?=
 =?us-ascii?Q?6TIDY/E+B7NqO6ZeIHxLF/R/S/5gzQRyv5D85MXQgHWp7MizH4+HE1tjzfnk?=
 =?us-ascii?Q?onWawyIav99XzOi33VCwQulqUFwkI8Q/Q2hDMBdKzyGgNoUnX1OImq4XPGo1?=
 =?us-ascii?Q?LZDPP5DmAZPDOaPx6x4+wXxhGf2pN/iJt3njMmAz830kGOsZIxDhddg4O2mU?=
 =?us-ascii?Q?ONdAUv1U7USSMLyuZPq2Kzqtl90REBKiQJUacg5OOkoN0CJ9LDXqXSsdPVex?=
 =?us-ascii?Q?GPbaks6YMn/ljD9ZVJ3x8DR2sMdvHXfj5kG14Za1JYdhHMZ7V/Pj4NqjrpNa?=
 =?us-ascii?Q?kbrYCCzLuY5/ctmiUrnEQ4j5WR4ikj3FFD7qA5bclrgAZkKoVou+UPO8MbA2?=
 =?us-ascii?Q?S9i4pup26QL7c+GjovB+VLbe69ybxdD3hg5JWtrKhbWcPnkm1JhLcyMDSv5n?=
 =?us-ascii?Q?nm3hkjPIVpdH8u2pnL93AUU1tl8lVRjFEhPBUsQIm0Ecj1iTaVnONWGnSdM4?=
 =?us-ascii?Q?zCSQO5NyF4fJu1qkyAsyyh6xiDHRVjmw7THqlFca7BYGLYdFuOKrFWVYKVqr?=
 =?us-ascii?Q?Tlc+Ypm4nXykcXHoMJiVIF5g?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe996c3-6840-4c82-2de3-08d9258cef04
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 06:09:08.8212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wxd69p91lGF7js/AxAAaLG6LCg4+n8it5GBM6ZiWtwjqeEcjGDmYkORFmtI1ay+SHZlau5U1gJ3KWWSPQpX3mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4235
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

ENABLE_M4 should be set to 1 when loading code to TCM, otherwise
you will not able to replace the firmware after you stop m4.

Besides ENABLE_M4, we still need set SW_M4C_RST, because this bit
will be automatically set with SW_M4C_NON_SCLR_RST set.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V2:
 Add R-b tag from Mathieu
 Rebase on remoteproc/for-next
 This https://patchwork.kernel.org/project/linux-remoteproc/cover/1620274123-1461-1-git-send-email-peng.fan@oss.nxp.com/
 has been merged in remoteproc/for-next, so not mark here as dependency.


 drivers/remoteproc/imx_rproc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 7cc0cadea1cc..ce2ce42bee91 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -33,7 +33,8 @@
 
 #define IMX7D_M4_START			(IMX7D_ENABLE_M4 | IMX7D_SW_M4P_RST \
 					 | IMX7D_SW_M4C_RST)
-#define IMX7D_M4_STOP			IMX7D_SW_M4C_NON_SCLR_RST
+#define IMX7D_M4_STOP			(IMX7D_ENABLE_M4 | IMX7D_SW_M4C_RST | \
+					 IMX7D_SW_M4C_NON_SCLR_RST)
 
 /* Address: 0x020D8000 */
 #define IMX6SX_SRC_SCR			0x00
@@ -44,7 +45,8 @@
 
 #define IMX6SX_M4_START			(IMX6SX_ENABLE_M4 | IMX6SX_SW_M4P_RST \
 					 | IMX6SX_SW_M4C_RST)
-#define IMX6SX_M4_STOP			IMX6SX_SW_M4C_NON_SCLR_RST
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

