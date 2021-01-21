Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3677AC433E9
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Jan 2021 01:19:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2B3A23719
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Jan 2021 01:19:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732657AbhAUBRf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 20 Jan 2021 20:17:35 -0500
Received: from mail-vi1eur05on2042.outbound.protection.outlook.com ([40.107.21.42]:16097
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732475AbhAUBPy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 20 Jan 2021 20:15:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKBf2iby7JRI8X6EDDD2UtPdrnzFy8w5c45Q3xZuNbadat85Xw7x9ye1KgvX3aLUaUea5CcP3pGnOUThULPiRxJ/NomTdBYFfJiRN+bu16PhR3W5bPVawF6G7Lg4jBPD3i1wjfZiNbZVQvIEgLuSawzB2qgA7ap+wO8uwSXqdGSiBhzkHVBgQhzZgszr3vpBmbbTSG6lsa46q+94aAhv5iXj6Gjt3oXz9xtg0k+iDYB1eI3UNT90/OSzGxKH9aCJmDRGFzFn/N3T/2Z3lUx6vx3+A/eYoWOys+4WFXnErI+xKFOqzdzb665yicDsXOnUaZu7IsrzP9JqGfRSQOFr/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJxrdlT8+OTygEs/swp/bhTTRjULeT1DvjELEua7HdU=;
 b=J9uYCzKjU25nIZoMFMAHbnsG/ghSdIjeRXekvwuwMWmxAyQDQWr4aIkUEMwhbwvCQyeJ+xY+II5c/8UDs5WwPltWdwvEZ+Wo+A8muz9TKt6NiyFkCRMJO8RzbluBBJ+dxNi5Ln4uCXYY2DzONHxKqsfSr0b57pzUrbfELogmbncowe0yg4KJFLhzLSj37wmzMoMcgIdl5BDTFHBhkk5jFF58kCvSMtzPj5vd+zUEhK6M1HNF5RGqWBxFfLYHAxhLw4vFFUby09H68vJzPVHD3b5hQtObsOaAB9KBW9IG3zdkSgbPxW6EwkT7v6or34lgVujNlr2wUgCxYaX0RfXxaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJxrdlT8+OTygEs/swp/bhTTRjULeT1DvjELEua7HdU=;
 b=sDnnSs76esMHBoYC+nLwiXQcS6lMeCepDrnYl+ubU6O4muw+Ab0hkJRKxU9qz8/jBAEje0FlvS4hb/bv0+oVSvJM4sBPaTr7yuuibuuMLJrmVp+s9Vcp+aoJ9M8aOPgrb3dJWDuUwzGGHNGsflTX1TxTcYpNS6sYX6BXzm99b8Q=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7948.eurprd04.prod.outlook.com (2603:10a6:10:1e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 21 Jan
 2021 01:14:39 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 01:14:39 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V9 05/10] remoteproc: imx_rproc: correct err message
Date:   Thu, 21 Jan 2021 09:03:30 +0800
Message-Id: <1611191015-22584-6-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611191015-22584-1-git-send-email-peng.fan@nxp.com>
References: <1611191015-22584-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 01:14:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cda70d68-dd2b-4afb-b5a6-08d8bda9ecb8
X-MS-TrafficTypeDiagnostic: DBBPR04MB7948:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB79480E228EAE1BA1A81F518B88A10@DBBPR04MB7948.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4yNyVSLxeTad60rHzetOQrLVsZUIttJQv+Ys8cjMHGRRa1s1XpOFE88ZgNuUrgdwB5JfExRLqbjS1ZgAXPBnP9WNi7QTokQmVEWg749bGQzqIl9PL8Gby7/k8j58F777IADllBvuckVcma+7uGVCbldabRUfHt6H0dkATDjfmDCEFteLDGHFsIucGhuYbkEmFoxDBgqdENJSuScJTbVJP3MS+LaWIp3pEjYTeHw/Std9oyjutjk2IIhFJMpTOrkmipaBo06JNpYUYfXBjRwUfkCeXvqFIsDXZwp1ICZTEZ/DMEWv/oTtTOZpyN3eAvTUIMUEr8CbDEXoxvkNuhm/gDadl3qxpmHaxHM+rjhw7ZOjLBNV6ccA/P1FE+WJuuPkVEx6s0xpZntHNPEF2LWt0o574OjfIT2srdMh/rULQhDgDvU15dAHVOrUvBEyNlOV7VtJEzNFJ+WPSoYDQ00TDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(69590400011)(66476007)(15650500001)(186003)(2906002)(6666004)(52116002)(2616005)(4326008)(7416002)(5660300002)(83380400001)(66946007)(26005)(16526019)(956004)(36756003)(316002)(8936002)(9686003)(6506007)(8676002)(478600001)(6486002)(6512007)(86362001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?sfN+kaXE6gqqW+i7YtVHtZN60cHRXlQ9lH5P7tjGiA4m3HA8relUyVE4xAXx?=
 =?us-ascii?Q?PDk2K4IyrxLoNEZ6Ew5D32IkwPZjsp6t1vssMfdN21i84187iUh4cbJOSC3L?=
 =?us-ascii?Q?NDlncaF1qUCERVMaFLZpxXUhH28fNgTqWJlPBjMJWM2SMt7DngaE/PK6jTsC?=
 =?us-ascii?Q?SDuKoOP9gzccLWbYVHVGmV5iDeBfqGhV1ZSScl1n3B2BbIP2/zzvkOaEw5bg?=
 =?us-ascii?Q?32K1u53WLh106vHM0Nmba+Ng/fLYy4gJtPCL0Uat8+k0Gc/Yx0Gl8G0bz+8Z?=
 =?us-ascii?Q?UXwFkqp5RfFJ21/pxTRbWOb8/8bCB7RgJlZnVZJ1B7r5w+0C37XOG5GV6Gwa?=
 =?us-ascii?Q?jmo750xgJeaKj83JaunqroeTqYSJb08RdmJ87Hzycn+oAi1lcsCzbH+Vgoxe?=
 =?us-ascii?Q?f0nHzxTVlB6JETNpgZAWxaypBpNdxPq/avtzwyY2yY1djBTs760DZTeaIsDS?=
 =?us-ascii?Q?Xqeui5IqwrlTE7X9cS9WpC5j7Qxbj154+RYzNJ15nFBbXbo0uzgsnGYBvXrB?=
 =?us-ascii?Q?OJs/u1VBIV19/MZbvV1jcB3Bj1SKlmC1hHLvAdS667I9dz8ETd50ok0ynsaJ?=
 =?us-ascii?Q?LoeyCH4Ojn2N5Touu1emVDv3Irk/b7sGMdxjhBhlbfLDG83f5ZSOXaRPC20C?=
 =?us-ascii?Q?KSRYBC6KMJvHOHar0JTbE1/c3tl0t9dZuX1DEcPXV5tpJmxrzJubz8cLet2j?=
 =?us-ascii?Q?l3d8iBwtP5IX980FzIGqhQk3oIfmr3esMoRfXC+Az0Lg9gGlDuaw0q+rvOAt?=
 =?us-ascii?Q?FSSEtDHblEEnOW+NONwqUSpZrI/nv5yfTK4Yyk0vO3XqQ1DAHEuGsg88FLnN?=
 =?us-ascii?Q?l46flQH4wWajwAg53TsVElkuZTWjLz4tDDsWvgm7hgmDpMPNwHX1l+39NYTk?=
 =?us-ascii?Q?yTvMhb6+HHlp3qhMXRU2kuEVTBWPLNGUoybvQjPbwOYa3+PiUk8DpFVdI5mD?=
 =?us-ascii?Q?gkuJpvnKj5ZU7YGQkYMeWLAs+Zs3KVZDklnpzDv0t7VK9Tf4gctKZ1poEZhX?=
 =?us-ascii?Q?iGl8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cda70d68-dd2b-4afb-b5a6-08d8bda9ecb8
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 01:14:39.5584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Db0KniWb+09Ic59mZzhI996qKlOwAN9d6OlVmXD3bX8XDRPZz4OB+aqX7ww+NylpjXJfsxXwkT/tYJJ3GZwsJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7948
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
2.28.0

