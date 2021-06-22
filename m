Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D055C2B9F4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Jun 2021 05:28:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00B3760FE3
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Jun 2021 05:28:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbhFVFax (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Jun 2021 01:30:53 -0400
Received: from mail-eopbgr20078.outbound.protection.outlook.com ([40.107.2.78]:38845
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229873AbhFVFav (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Jun 2021 01:30:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1+ZF2VTsB/7lEPjF2wv/7edT5bcyqrrLEAXlQGsBEt7scCdnaxEAgww3Mb/14MfX0qoZ4Sk7a9YtOwg9B5mAmTS8Hzx47auEnAItCF4d+txL68+iyJ1k+/QpC6ojXGaVxYsZ8jGojdz4r09BTLQ/QQ2Hg6nXw+oOGkDA/5TuxWIclQW/axQ+Q9gLsQXedk8pY/Y1M0fLTEonv0SRBbZd6Fs7gW04doaa+cAsn+aHZW3ZWC8tEqeTdJGwB5DCuK0Rbzb1pvXUww3GIjmNRF0Keik/QRKc709kgUGkiNlj3YvXILNImMDOvEMM7FdLJcOVasOegnGbW36JrYpx88zGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6LcrYlHUUy57grtv113HTQzAhM1n7uKEIUTGYEoOrs=;
 b=EZ0KVDVqWAzk7I+VxhhWfrS9rlEKwy9DtyQWV2JYs/svhI7bt7U1KXYPNKhXVTOrWDzDWMqvseTTkVPgALQeQgXbMKosIAWsuAFzS6PBSj7kY0twieqvCMXN3zXnVkLKwj5WL9dC65iVw0uJOUYhFTQMuCGrI91BShFplr9jLpTcG5IaDQkix9DhiWKmydz5gtc3az3uKMTWgvXl8kLCMgjOkqFAKNUp2FlrNUykkJgeTix1eLTz6B9/1t7IXM35oYj+IN/JSpxdTDMX0eqQlLJe/W54O6+oLbGj7gUjCsHcYXVe3Zmt0KeTPJRBvHrMLQR8TNjhMcPmPxCrV2zdRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6LcrYlHUUy57grtv113HTQzAhM1n7uKEIUTGYEoOrs=;
 b=dWPATqFoB9mMIWd7pCvBtjHnilk0DFez24HngUcrXOHoiRSJ2yEbNJG+fnUhL7jcZPGld31lNUzK+0QIcoWNAaGHRSjSvg1hkLSAAzlmkzAlKxCppzamhNHvKIxcXmQP/P6en0V7BqMqVNE1f1OExjdmIruiU7t+CyMDmknLNis=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB3PR0402MB3659.eurprd04.prod.outlook.com (2603:10a6:8:5::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 05:28:33 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd%9]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 05:28:33 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 2/2] remoteproc: imx_rproc: support i.MX8ULP
Date:   Tue, 22 Jun 2021 14:01:48 +0800
Message-Id: <20210622060148.18411-3-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210622060148.18411-1-peng.fan@oss.nxp.com>
References: <20210622060148.18411-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR03CA0133.apcprd03.prod.outlook.com (2603:1096:4:c8::6)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR03CA0133.apcprd03.prod.outlook.com (2603:1096:4:c8::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.10 via Frontend Transport; Tue, 22 Jun 2021 05:28:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14a1a86f-cc8d-41de-b4ac-08d9353e93d9
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3659:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB36596B7EDB7576D4EEAD4CAFC9099@DB3PR0402MB3659.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GIqtncSCntHab9U2i0uobresTHNrg6ztF1Xd6XCCoEL5fHRs7A/DFMQpzC2N8QWc5mkUAoH1EXShv1rZEUn0UGAfQU9fchXc7BK5PHC38Nye9lrvIbmGdigK3VCgzD3uw2SjdPNjYRUUuokyoD3UDJRXP2rL39kAIZUlv06jtL6FvZ6MmnLvuxmAy5qwqE59X8/07kxMDWs4V5CyP4gANj7qwYBRmzwZzjOJfAgBY6xGxvWqVT7zE0svIqKBE6kIhQBKNZcBojQwUs4UBjFvvSjwuwNJfSrBOXlkwEnRrxE6wGtKJRzpj9+v5dmT1Kj2lS0U8+yQCDMsb+8LQPuAluEOtoaXIzg2am4t+U+ru+L/OcizVpLcfPx/mFOiyQkLO2T/fQSQ41f6zzjRYQbvqhgP1h4D0wE6Sm5PN+LCV1PxH34Z7HdQMS+vQFwSj68L7aaz7Vzh+m3Vs4dlkR8RELZwWdRzAlaZVpdS+110n+3pxsvLM8dCrFfzMBVGtjHE/nqXCXYLTVki0PI0NGPArwBvX3LUrzsDLsPTu2DvqFZHSw5/tvdmh7SA4iLs4Oo+aYDVurDhw/VYZ5SawL5FPLp75IZa6+ornW3Mg3WC88XvOWvk2iXvDnS/q/Mo60XgUOG/yFjkY588m7T1OcG0JQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(5660300002)(52116002)(38350700002)(38100700002)(1076003)(6666004)(7416002)(16526019)(6506007)(26005)(186003)(6486002)(4326008)(86362001)(478600001)(2906002)(316002)(8936002)(66556008)(8676002)(66946007)(66476007)(6512007)(2616005)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jVrPtGmWceoh0PlSczT8lQCFLuhDXvMxH7olFFaLqJoU6iq1wYVYiJn26fM9?=
 =?us-ascii?Q?S5pHnv7qXNVY6ni+o2at69IhA/iGf8GuNn7Ea3u3o3WkClSI0y3pavP1Mg2t?=
 =?us-ascii?Q?nyPzwZqzsJd9deFm4W8EoZYpa7DCb1adxychtmzsIFHIPqwbrbN5QVLgypRR?=
 =?us-ascii?Q?nJsRa4wEeSnBK3YURWK8tAyjXRCkE1nKubxivn4d7HMDwYa8deZVUfpulzqw?=
 =?us-ascii?Q?Z0BoyMSEObdApnZ/cvl5aaKR+OYz8CZZDpLqgxHI0kzhmQRkQLanbqhgW7+N?=
 =?us-ascii?Q?76baxHLEARyqxDThAzhVHGAZ1q1sVOmTfXxCNAlGG3cJhWMEcnTVIkI5xisg?=
 =?us-ascii?Q?pt7cq4wmKqq3DYnH5Xph4wQVGXm0xNtHLOWsaSeqc6WQL0iQv+z8YSu3eYqW?=
 =?us-ascii?Q?Gv/S5nGYESq1c3R/dmin+gyR9PSJ4RRgR1HNLNP9+959KfFsgwLJgoKrlc+I?=
 =?us-ascii?Q?+D+ryTlTCC23D8+5ZH/V700e7QI/wjZm97p2yNi+ftYb7yzizNmU/RYmHdOc?=
 =?us-ascii?Q?rCVfbKUHJ7DyvkQH5enIy3SdwN1qbyRxoo2yORz2mRJdQ2jvv8ExCmORrhVZ?=
 =?us-ascii?Q?7uzbzOZcJe91tJMxDHTTiY7mzDzxTCz0YswVoDo6urSEqQF8Zvks558sNsHV?=
 =?us-ascii?Q?wYvUOB+Z4ZuYZyWoCvpp9gBK/NtH7Br1473CIaXuqMeAudLe7qf0MSmCGtkl?=
 =?us-ascii?Q?f7tbcV76KIE8wd4eHhq/VkBKyAdTc1uBGiFeb4VwmyE9uaO3m4cKx4mLsZYn?=
 =?us-ascii?Q?NurNv75H0V1ijkYLYirgEb8jpSetJBKkN5E3O+xxETT1zdG8QHXusR2J5Z7h?=
 =?us-ascii?Q?3QydKodHO4NiqER7Lo4tS3cQLFT8pBE1rZcRtNtDa7eyxEub7kHJhkB+KwmF?=
 =?us-ascii?Q?j2yhqD0BUgBWVcs5DUh9fh5hAIwk4HDPNHrR20ZOlHsX6lIJAyCCDA91ffO6?=
 =?us-ascii?Q?EOd+Y2kmRiOnWN/TCQeMr4MSKuxRpPXLii3+ruNXVWWI4bn71YLoWmi8BdFW?=
 =?us-ascii?Q?v8pOjn92bm9sLCf/vnW4tcFopseXNE6TogX1U/KnMyTAuIrYUnK+xWPnzOLk?=
 =?us-ascii?Q?IsALLcDsrovkrgsmhLD/kmB79j16AbBNKbOhGScOKpyeDw8Iub6fzyoVNp6Z?=
 =?us-ascii?Q?ejV+7pBsdTeroyR72pKDVnP9kQiCpK5g9khm0TK0LJTZ7o9EZyyGG9UrAkZP?=
 =?us-ascii?Q?CCcwgLw3nlGXZ6vt3L2V60iWWt6wOXAeKP/CUFhWUoJky41a0WtFvUfXbefi?=
 =?us-ascii?Q?6ccD8ux0e7cQpASt3omAWrf98OX+d9d5dTANgegrxIEur8+7dyCKz8zcazZl?=
 =?us-ascii?Q?sfR+cRil/JIxilKjA8uDfDYC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a1a86f-cc8d-41de-b4ac-08d9353e93d9
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 05:28:33.6497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7epfd+4ypAVxqpg2IwNpW7W82oC8aLn1zIPtn3sYCNWKyRpDu5j6twU0iNxSw3gG7SVsULMuNnMV7YlG4KfjKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3659
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

i.MX8ULP is a new SoC with Ultra low power support, it has a Cortex-M33
core and two Cortex-A35 cores. We need to add new configuration because
it could not reuse the previous i.MX7/8 configuration.

i.MX8ULP M33 core is kicked by ROM, it is not under control of A35 core.
So need to mark the method is IMX_RPROC_NONE.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 7cc0cadea1cc..d88f76f5305e 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -172,6 +172,12 @@ static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
 	{ 0x40000000, 0x40000000, 0x80000000, 0 },
 };
 
+static const struct imx_rproc_att imx_rproc_att_imx8ulp[] = {
+	{0x1FFC0000, 0x1FFC0000, 0xC0000, ATT_OWN},
+	{0x21000000, 0x21000000, 0x10000, ATT_OWN},
+	{0x80000000, 0x80000000, 0x60000000, 0}
+};
+
 static const struct imx_rproc_att imx_rproc_att_imx7ulp[] = {
 	{0x1FFD0000, 0x1FFD0000, 0x30000, ATT_OWN},
 	{0x20000000, 0x20000000, 0x10000, ATT_OWN},
@@ -246,6 +252,12 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
 	.method		= IMX_RPROC_MMIO,
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8ulp = {
+	.att		= imx_rproc_att_imx8ulp,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8ulp),
+	.method		= IMX_RPROC_NONE,
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
 	.att		= imx_rproc_att_imx7ulp,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
@@ -824,6 +836,7 @@ static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx8mm-cm4", .data = &imx_rproc_cfg_imx8mq },
 	{ .compatible = "fsl,imx8mn-cm7", .data = &imx_rproc_cfg_imx8mn },
 	{ .compatible = "fsl,imx8mp-cm7", .data = &imx_rproc_cfg_imx8mn },
+	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
 	{},
 };
 MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
-- 
2.30.0

