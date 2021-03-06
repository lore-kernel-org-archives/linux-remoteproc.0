Return-Path: <SRS0=jP1a=IE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8248C433E0
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Mar 2021 11:39:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 804456501A
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Mar 2021 11:39:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbhCFLip (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 6 Mar 2021 06:38:45 -0500
Received: from mail-eopbgr30081.outbound.protection.outlook.com ([40.107.3.81]:50613
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230346AbhCFLiJ (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 6 Mar 2021 06:38:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1qOvji5tH5Jsogj70UU9VHrnLSJMMmi5SmNPFH5M/RviMiqENpPAxH1SWleDAmgl+9uUh0RYCqiOd7uRdt5NjvD+gPcnSE5/fOry3ybRvPSatMSze5wkVfzsUQJT6NqVk/NMCC+SWKWSqWApvzEkOJUIL6Zgf8xF8IBUpHYEgSbF3qoW2kLXC7NJ67krQGaD4ShKN8exoUrj4TCnPXgl4+NihIPVp7d1mV0JSDCXGbJdMTXTTv7pg43Fg4wxUlCyeiQ4RsSHtvqClSAB4em/JocdqT7O6SxY+tBk0JZVy30hPANVoQ4wGNlGeL1oKt3ObWC+I6JRqjxOZzZLAhTiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EM9JIC+yeL3C9WIVZhyYz0R6U9vBvka5aiesdeAvSbw=;
 b=hx1WPuyhbBzBCbBvVHnd6giWMgfqePhq8/ZQEmE89ykvDBS6Va/yYKl4xXEFgDKKaxNmWQz0zB/WOThwv13WcAUZtUROIothxfYxkFUULALLSTr96lcSa+UYespZj/7yQ38MK+34+Z/D6YPK2fo9GlCwhPN5jTHLMkeURHNRcuyOMeLI5QpSt4dCQ9SIzor+jeVH2MeNGBNqkPjGOMOv/5kMn0lCGybUtKf0LkgZ0d8lbuNP2jqljYRjNvpxZJ44bJLn/6y+GrL0ZIiCwTGyQawts3GsOoxM9VDCpiaW48sC/jcrpExzF1RgJDOPttjFS8YL4Gdb4Hp+mrEC6GfVQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EM9JIC+yeL3C9WIVZhyYz0R6U9vBvka5aiesdeAvSbw=;
 b=LIFMyJgDvSWUSaUblCn1dVTtLAFECYDwY3bqnUqG+/0qRE2Rvf/6t9fDJrmOi3aQzzCdqVX5OgOY339nvGMKJc8tf+5+01RLEtcYjySmUw2SLBWYNxtP+5XJnnfUWiAC9jufwTfy0Itu1fE51Dn7TAuqTLoKPYrOo3jBW3o6+Ec=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6618.eurprd04.prod.outlook.com (2603:10a6:10:10e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Sat, 6 Mar
 2021 11:38:06 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.054; Sat, 6 Mar 2021
 11:38:06 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V13 05/10] remoteproc: imx_rproc: correct err message
Date:   Sat,  6 Mar 2021 19:24:20 +0800
Message-Id: <1615029865-23312-6-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by HK2PR04CA0047.apcprd04.prod.outlook.com (2603:1096:202:14::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3912.17 via Frontend Transport; Sat, 6 Mar 2021 11:38:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b93f1065-af2b-4fdb-abc8-08d8e0944f34
X-MS-TrafficTypeDiagnostic: DB8PR04MB6618:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB6618C9054470BB1D9E32EDB3C9959@DB8PR04MB6618.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pNJdyIPg124UedVRni8Adv20hpc4Rx6c8Xfkh1dlzlwm+JcaYlSqYI5NhFyzgV5VYpULDm0dMoR9ed7bMO0hSFscCXnbaTmcNj/PhG9exzMHtYOzg1LoTby8g14NBJc/nn7eAEKKepd6cgNS01D/wG2rBxPSutntPgR91e9vvKwLrF9qLg3Jxd38Th9o7aogFiCDsNEvSIgZMFBpnjCPUPe2OOVREg9nAmnQ40Qct6PZpMqh7ZSHtWEdICy511tPa2n/m1xYdfjqo0QEFVnQs3l0ovNRZvS5Sz6alhMfl7V0ENlhkqSOJIwJWKwa0+e9BbnI1tO+JmmWHvZz4mPkpWoYhe4ijruSiINRPkMv6uVKCPtweVcuiOioIHvOO9BAeisjwDVJdycOw8k0Zi2NoIw8NeCfk0Rzbb+idnSV2FxfJRP9mP+saiF6PV4p2k59noF+JXY5XbI6Dz6Dk565zszs8IdWGGGhrwSPYQ5yhytQadi8ziOin1UNvyklzQb8k5OWzZet5sPk75AcoqBuF89KPrPMQKyU7LItlYPqMAXFkUJo6oFX+c26c4ueG4GFoapoxdNRBHTt8aHt1Pw7dA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(83380400001)(6486002)(9686003)(6512007)(2616005)(956004)(8676002)(6666004)(15650500001)(69590400012)(86362001)(4326008)(66946007)(6506007)(7416002)(2906002)(52116002)(186003)(16526019)(26005)(8936002)(66476007)(66556008)(5660300002)(316002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UXrlqeElva/1UXOjdVI1aGbJWRrk31LqIfXfnX74AFHUPLPynLy8jrNW9HsI?=
 =?us-ascii?Q?ryIr7v1ZYPaIcb+PNasLu0KIib2/1XKT2etsUsa4XwQhxKv5UrEe20DxOrE9?=
 =?us-ascii?Q?VLOSAuFBssTeVxdXpohAei5bRDBg9dAMy3Vdj4+6CHI1cBy3og1Nph7NPL+f?=
 =?us-ascii?Q?Tne56HDk6O8AL93Hs2lGGwhoB2oHSTVdbE/okMs3HcIjfXkXMNu/7sSt1Fo0?=
 =?us-ascii?Q?HPcXHgLUNTKyc1ixrovzi9RskAg1mQpt/+aWqa6bzbYrWyWSnyHQrNj5vByS?=
 =?us-ascii?Q?pmpzTEaNYa2rjfBecv9+NknOftJioX+377ppOI+/V/AZW28x3lbvmWAs/4jo?=
 =?us-ascii?Q?UrYCF2YpqV0WURLS3d0/i1btN08N+p5nbgts/7vABq3lTKUYYblmIzX/YKWv?=
 =?us-ascii?Q?9k7TtefV68Xtyr/3q4+uriCwfpi8XHgUTVlZCE/bmmSSPAUn8ji3ogm0E6Vw?=
 =?us-ascii?Q?rgfS2vqlAyIXPkh6CBOLAyUFJBpkPtIPEz5GGMm/8dSq3dCG/2colysmLVbN?=
 =?us-ascii?Q?251Vyot8Uj+lcS43LATqe3G5gSpcpBQH0yWMFn02A1q0RDscL2LkZGuMeutG?=
 =?us-ascii?Q?49YR/g2440Mf5TsvXxJ2eBMjiSuYVxBwWVkrKw0VUc75wkNFMfQ/6FFHVR7m?=
 =?us-ascii?Q?LtyQTTy2wN0itlVtzF3M3TmA2XkCD4UQwYWaEVR/FC3BGlkXzUE+D1odw35Z?=
 =?us-ascii?Q?kJPq8oKGOAbpyQAGF54T2GZKtoS07iDFhj4YQyBpJiC2CMvs/VFpY6RFGMVU?=
 =?us-ascii?Q?I4SNDnZcidzbxRaU2wUbLeXnmh/TWW37D6Wp2pyTDeT0dF0AorORpS8nqgrR?=
 =?us-ascii?Q?teUzeD4BkLtCXG7TELtf0MnR1dS6bph4yU7QiIoy0iv5eTyf1rzYA+Fdfnr5?=
 =?us-ascii?Q?qR2SVb9NY8eSr5QhpQ02RXrpzIngK/yRAf3jzY5eisU8cjHwflNz9As8JIfK?=
 =?us-ascii?Q?01Srqvn0udBpJvTW1eiWeLscgx1JHDuZvcby577MfOa59urCjmjFhcvTF4Wp?=
 =?us-ascii?Q?WTc3VG61qK4fia3LyN1oAxJQt/91KV65AyCgJpjj9EtT5AnLnhnPQFisll+N?=
 =?us-ascii?Q?sDSVlie+hF4xxZ1EawZWT5+XOlHQbcvZNvG8IXDtYB3OclFHKw7fCOAsAjeg?=
 =?us-ascii?Q?JhNK1lcaRDyUkIH9g/hr9RBDcM3vIuQh/AGbUFU9MH5UiGNQbHDxNH5Yn0g3?=
 =?us-ascii?Q?ACFPin8mS/8GRA/O5HixqqgTEjkGmBA1sMRUEouo4LD1Frk4q9JWE44RrIXC?=
 =?us-ascii?Q?aFyWgO5yKDx2Q1L+cmxsru/CODVSNy3ffUAXHD/cn0r5iT1m1k81OggyQg7Q?=
 =?us-ascii?Q?OZDqXT2YrXcnSkKPJFXlhFMH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b93f1065-af2b-4fdb-abc8-08d8e0944f34
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2021 11:38:06.5436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SzZvScTouuo2d8soOwWXTRd1XJSPOX7tJa1A+WqSm2jyhphWLljsiHWSrrtU3o85tgCkfIzLbkyKdtD9vTmIiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6618
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

It is using devm_ioremap, so not devm_ioremap_resource. Correct
the error message and print out sa/size.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 6603e00bb6f4..2a093cea4997 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -268,7 +268,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev,
 						     att->sa, att->size);
 		if (!priv->mem[b].cpu_addr) {
-			dev_err(dev, "devm_ioremap_resource failed\n");
+			dev_err(dev, "failed to remap %#x bytes from %#x\n", att->size, att->sa);
 			return -ENOMEM;
 		}
 		priv->mem[b].sys_addr = att->sa;
@@ -298,7 +298,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 
 		priv->mem[b].cpu_addr = devm_ioremap_resource(&pdev->dev, &res);
 		if (IS_ERR(priv->mem[b].cpu_addr)) {
-			dev_err(dev, "devm_ioremap_resource failed\n");
+			dev_err(dev, "failed to remap %pr\n", &res);
 			err = PTR_ERR(priv->mem[b].cpu_addr);
 			return err;
 		}
-- 
2.30.0

