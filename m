Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8EBC433E1
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 05:46:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC66860C3E
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 05:46:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhC3FpX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 30 Mar 2021 01:45:23 -0400
Received: from mail-ve1eur02hn2226.outbound.protection.outlook.com ([52.100.10.226]:18158
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229569AbhC3Fo4 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 30 Mar 2021 01:44:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQRY4dYLJjnNKhXftyMLgX++BsCHw8V9qxjxHXmhCza1rtKWfbs70dhDURCMmveK2lxvxUugLnKd/mcGkv5Y9VNEiLc8JCxJWrpAQF5NHjTRI8DXyS1TWfmdP/IJNphcgMfvSojFOJf/Sk8rVE8TGDbW/nf/sH6qGYMkQuxrVPdxQHo7CCwLcyO/s3pgk4FlOMu2oYkxdeKlr5PYvheUj1bKE0WMkyAp+fn8r6UMk2brDQGi2oHgTR65j0EQVXjrRijqq9mgg3SJQiwhBWvnJ1hRIttfBtv919it1Zg/vt7pqsmcfhaN8fGKqypnLZk+SptxaIqjoGRin5LbSmg1RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9w7J+aWzGVngM3dEmxCQzurZ7ny8hTSneaNZC6Rtvg=;
 b=DCuzu08TrV15aHLkuS5+EM6C5N1xEeE8eTPBMjuMdNK2VYy5VHOgQZCtLkd9z2DnrKEQXtC9/lWUin/0Wl4+rUxplHHctUtIUy6/XAMQcnkNFDu+2iTNgVjPgp0b8WHUZOsCqykny4Tx76fAKFMHB5VQe2ZI/1cry3dWSlZG2WjFjT4CzwP/jenwmbMUkQeGZqcm77VivQlzV5g+phErfHU7hKBKAcnRgpLkvICIaEp4EZRrXdGb0D/bCs/RWIZSFCOVGiP0HSb48iCmS40PbM/RrGXO2dgCLk586eE7lTvudmrtAMN1OWZP8Xda6zGEoApXw8jkTg1Nvn4nUVQoEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9w7J+aWzGVngM3dEmxCQzurZ7ny8hTSneaNZC6Rtvg=;
 b=MJ/ipjPQNPEcFnm+VEa0y3wMb1jReq0qXWlD7pM7JcYoWHbd4+2Hd4t3YXEsdpziOZEVKZWMO2YOjxFmYYMEW8Znbtfz3YKYqa44L6uTd1Fyda4UV+CanK8QXVsnVqWHOdXaZPJEbTAtfneQncH2qUwkN48i3rmuWFdk2U06GT4=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4489.eurprd04.prod.outlook.com (2603:10a6:5:35::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 05:44:53 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3977.033; Tue, 30 Mar
 2021 05:44:53 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 2/4] remoteproc: imx_rproc: enlarge IMX7D_RPROC_MEM_MAX
Date:   Tue, 30 Mar 2021 13:30:33 +0800
Message-Id: <1617082235-15923-3-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617082235-15923-1-git-send-email-peng.fan@oss.nxp.com>
References: <1617082235-15923-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0055.apcprd04.prod.outlook.com
 (2603:1096:202:14::23) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR04CA0055.apcprd04.prod.outlook.com (2603:1096:202:14::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.25 via Frontend Transport; Tue, 30 Mar 2021 05:44:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1ca4632f-8812-4b42-5ec3-08d8f33ef166
X-MS-TrafficTypeDiagnostic: DB7PR04MB4489:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4489A21CFA0AF3EBF31771F5C97D9@DB7PR04MB4489.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ejjwuUZsFn4Bdd3TT5EOJvUPb40kC/T0yWAiePDkIEXYiuGWaeOGqQr+cROn?=
 =?us-ascii?Q?h5xv1wFNByQCT8kYSTkeYSZPVVpTcjCBBPCu6uInh57qBW2To0nu5dePg+7G?=
 =?us-ascii?Q?glXiyQRG3/ninKF25kMRWek+tH4XX4dX/siEBZ+nEp5KD9jUpJqvoAO+dMF1?=
 =?us-ascii?Q?yUwkv3UNCYThcq9lmxeoRwufoB9AHEsCbmMOUywLHV+x4hElR8qhYkDbegWV?=
 =?us-ascii?Q?jSG6m1Wyd9DQjCcrazm0K1P3MfWyNncl5ZdLcsl4/lhXcC27FmPszT44+8Uf?=
 =?us-ascii?Q?71yzEqvuPBM1SW0wJaSjaSpjhMHbdf1zrviY+jOi+Zb3dcT7jfLRePh1Adgu?=
 =?us-ascii?Q?gIvVy6WUfz8DIphYLeQEGjaXjyREgEGB3Lx7cjS4KYcppgYGhoIFFEwDrRcu?=
 =?us-ascii?Q?cmwzqaTafcFLCqsAp6fvZQ5LUnF2Inaxkemh35nIQBFwHFTLeME9QCTKZyGK?=
 =?us-ascii?Q?b2DRShBGAvrKcsVzJHU4IB25K2MEKxB6rDqU/gKijdZJWUG4iUg0lG3JaP2F?=
 =?us-ascii?Q?PWGhEqr/ys8WNY4o+vR4GKuhpg63q7AXcsWMoTR8sTJd6IamDhxpZt+1VETS?=
 =?us-ascii?Q?NPiKf4JPv/5MlT5HUNRFSs6C083InyDxLOAKMax0X6QCJDukKY1WYRRVYeor?=
 =?us-ascii?Q?3HzRt+qzIirgFIRblxIxQb39CEMTkvBuFxhGNztbIFMRrA5SBVFSGwe5A7uu?=
 =?us-ascii?Q?Y1saoSTz6kuRNF8okBwwj/edwh/00V1SvJjuKbywhTeGbWNAf1Qd3XkTXCvi?=
 =?us-ascii?Q?hJqmCjyIYYVpF/nXFpqbtyTOGlyeECMfwibctbskcIUlRsq6PfyfmwlqwXjC?=
 =?us-ascii?Q?7eKEXT+BC1pzrLgKVKv8SpyKC6OhkL/52LUyFO8qG81kfLtOT1GjH4M7Ghtb?=
 =?us-ascii?Q?O3MHAN008vC+XSOCtxVUMaSGLtz9f/Jnj88x2S3OEtH+NLpKZDUEazj/yRTf?=
 =?us-ascii?Q?753DWrax6ymf9BLn5lJ6c14rGqoimAL9I2lsGKjbt3KDkpcO5A1TNlGY1Bdm?=
 =?us-ascii?Q?OR6rjS/JntGBxSnkqNHCujeAzg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:OSPM;SFS:(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(956004)(2616005)(86362001)(66556008)(2906002)(6666004)(9686003)(6512007)(6486002)(26005)(66476007)(66946007)(8676002)(186003)(69590400012)(478600001)(4326008)(6506007)(5660300002)(38100700001)(316002)(52116002)(8936002)(83380400001)(16526019)(7416002)(161623001);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JvyrgFd5wTkqzCmhZKyg7VDccJC4dTVlegOaWEcxDw9AUg8CXOvNbPTjByGG?=
 =?us-ascii?Q?F3WNGG4Upmb/ktjPrXb96LVR6XVcvWk/wrddQEOp+OPEP5b+p/L2b15VSXHM?=
 =?us-ascii?Q?rKaDwKjavaJbMzhupRzGWiYQve6Q8KwL2gdvyqKtRmeMh6zedi+aBYVosd4M?=
 =?us-ascii?Q?mGIiXppsT/ZD2B0JkPCmIsI1d0wmR5xYOiGTQJOV2boAXlmHMToEk+yCeC7p?=
 =?us-ascii?Q?jn34jMgLV8OYQJHW3Ei/rLkk2Nn0JdWmDoC08bGNJ8h9mgcxc1pOqzY7HkSZ?=
 =?us-ascii?Q?945KRbSz1L4bRX8zY5yo0QlDlLuI5cW5T16L5MbuG7fQZD9xGrMSZ8z1Gm90?=
 =?us-ascii?Q?Anq3qQ7RvXBN8s2gbTtrXt2dBgSwelWujzdOGMNBR4lr/KEveZ8MVUpUlmgh?=
 =?us-ascii?Q?jH1vSGcQ01wVP/kLL/adWhpp57vneDr4wX/WL8I1mDQuZhk0dt8mgp3OdOqz?=
 =?us-ascii?Q?/0eF0eqN/x+9/CPiDpAo5IKSEwXbi5wK4Y4zPw+njE4XrTL3TDmyRbEyPDUK?=
 =?us-ascii?Q?hXFc+6eZCtqySvCJYl49wl2QUHSSD9ZwTaj0N4WFeUpKyIg0+PqT67X30ABG?=
 =?us-ascii?Q?e9Ox7By4gJmCUT9LtH8sqGSwNLZJir9n5xewW4HIr3lxmY51yyW/E2R1MOqm?=
 =?us-ascii?Q?aP/Xkf49J0Xz6IdHBY4FYdPChulwTLQxW9xpT+VAj57aGy96OZAgqO/USEJh?=
 =?us-ascii?Q?gm5fTPeFLuSQ0KeSMGKzOY6Z5ZekM+PcWPAZcFVPelUuTIbJPwZQRMTiiEeu?=
 =?us-ascii?Q?vdh8BW4ZtsdJ5CW3lYXHcyiVI8bwh/h0DG1c4cQ0oDXzcqN8+5LEgZ01Bd4o?=
 =?us-ascii?Q?sRYk4S2euKRy1WFsBAT4RFXMsCUc3eOyXoEM8DyfsgQheyUwAI/U4kBviFd/?=
 =?us-ascii?Q?9LVhUsoVL+yZ+RQDxRxLrSf6TBQS1lP/Sb6Ldgh4Frnx6sAoz/EujUkWMtj9?=
 =?us-ascii?Q?Z0TDdMqqRfo8+aYA3SRMyeKBZj4N11ZxSjGn2VcJ9VQsDMkpWIbTn/xq8zsh?=
 =?us-ascii?Q?SqkI47fyRM3MramdxwggtBRDXxe8LQax9WZUHSHqc7Gm/2vrsXiGheAp/yc+?=
 =?us-ascii?Q?brKKdHDYglZcmDpwnuoss7tY+reV7mZGS8PixAV5EZaueREBSpN4EbFzOR1Z?=
 =?us-ascii?Q?7ASVL6tLpUTxu1Y6a6nUc8Zc91P0xdd+cYkV6FLIaG1cTsUDYkvURkgChMHq?=
 =?us-ascii?Q?YqDtbuRKTEUTNXZx5Q0vrpKWz1KJRrmq+z0WHF96iaipzXPjk2CidRERh+tk?=
 =?us-ascii?Q?ZmPMM85qMvbGXwRiSL1co/0W+72UlTjmEA2AGy+9OccvcemIWdP8xC4ZRyAT?=
 =?us-ascii?Q?n+/su2OB8nO9zP9Nyg6vB0SMm1eVRLiVfSAgKq1CYdE3fA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca4632f-8812-4b42-5ec3-08d8f33ef166
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 05:44:53.7814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6Z/ef8BemmkLjxc/2/tAFWPGXU/7QtpdIKpFaFmBQ0zqQZhfrhee6kUK8en01+dIDGfbj53ymCmK4uHiiScEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4489
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

