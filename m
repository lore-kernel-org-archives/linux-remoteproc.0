Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B86C433DB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Dec 2020 09:55:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71A0E22CB8
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Dec 2020 09:55:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgLUJz3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Dec 2020 04:55:29 -0500
Received: from mail-vi1eur05on2062.outbound.protection.outlook.com ([40.107.21.62]:55112
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725775AbgLUJz2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Dec 2020 04:55:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8NggErQCJkC+z4QW1wSWFQgmUa7FRMvKD888KQ1JGrjxJM1ciB2ZgZZ5JDESlTvfSx31N0eCcKK8X9zMYaTxb+wT4+v9vgqX2e4+1n7ZuD07wPs3zF7XJK/1f/wTQrLIl5iH8ER+61Hcevo+Cf/L9banHN/YUKRKgxLlTYsT9yY5SZc5/haFiCHBa/mTvn9viOGQEtFFaXDN8rqROE2yLdf/1CRzUZm3JpHb9e4cOZv4H4RruktTEhdx0KyiDg+POkNol5XnKm88xtJHJkGIyF7hs9hdoZffEDkTuGZOx0F1Hmu6vrsFX7nTg+wSMI0GE70hyUSVXdM25lVCV7+XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCrwUW+aX0WNrz3js7nxK32GXemgaJzd5e2vwmVvuYY=;
 b=Sr56Ds2rMPRpNa4/NfCnZHs9AH4O5qKK1B+ctoUZ0q7Tj7ZDDid2QPbo+GHffV9SUHfbgEc9Ae6qJnmkGY+pinUs6zJUg69GPWY45Kg75fmW9f4+4jSeXpDEPOVQWiBQz8vCVMvc47iN5RWL5sMtjmB4qEi9yZx/G9UqhFK8VGjvWfxW3mP/+s/Mx7RGWA9na6M8yZK6ia5PoSJU1qMLdPa2cErLs7gwZC0hSwnyR1Tj08LOzBWX4jzYdBTUzPNseOH7DHTI02iy8XVooGQYOFjsICp6jplTl1mBJL3yDKWYy//PDB733228JRjbEpMNToW2BwzlUMopFq4g5Yg3/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCrwUW+aX0WNrz3js7nxK32GXemgaJzd5e2vwmVvuYY=;
 b=DI22UH1MUfjr3QIdSG+2AnkIcrtioZ5+OyXwboTNv/R6tqLgFKeyLkkAs95PfTHvhdKAnjntTk9Urc2MgXEF8qyVj5g/rBwEsEHHEh2gBUyeBAYSLmkL4gD/7VQ5nNRTlXediq0T+F17pAmmSAlOdVB7/hx1PS+7jOuRvQK94uU=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4633.eurprd04.prod.outlook.com (2603:10a6:5:36::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Mon, 21 Dec
 2020 09:38:50 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3676.033; Mon, 21 Dec 2020
 09:38:50 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 7/8] remoteproc: imx_rproc: ignore mapping vdev regions
Date:   Mon, 21 Dec 2020 18:06:31 +0800
Message-Id: <20201221100632.7197-8-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201221100632.7197-1-peng.fan@oss.nxp.com>
References: <20201221100632.7197-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR02CA0110.apcprd02.prod.outlook.com
 (2603:1096:4:92::26) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR02CA0110.apcprd02.prod.outlook.com (2603:1096:4:92::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend Transport; Mon, 21 Dec 2020 09:38:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ca25a53b-b9f9-4ec5-2c2e-08d8a594394e
X-MS-TrafficTypeDiagnostic: DB7PR04MB4633:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB463364F636FE80BF67AB9AAFC9C00@DB7PR04MB4633.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y9HfCRro5/AnGrXa73uuhWKFs6ij+o7rWFlQHVULcW9oWvnJbkeVR5HCtZ/AQOkneLDJ+GMj4JCJcvdEp0COE/3hPquVVlH8B7ve2aqgoNDSmp/gzoHlt73viWRZkdj1b6zLBAUUBl46H6sERNyBnEKJIxKGEYNK8Kjl/NgvC74pIHbv3ddJI14jgKdP2m6obaXof8qUNEqG8Ltvn5kvmMKNs9b/B0e+tAFB83czilfwlnih/WFnLdhErCpougTbiRexqRlFk3j2z+UqDVUOZm21M7qPKblzctJmq76jv6Mba/b5/aKy0YXv2H6SG4iMQKiQLtORGBY/UYWwagrca/d9OO6oC/9DhBsmpCLMeh9T2MECT9ZMMr/Tjs40uGPLcCMa/23zvYhLO1rtuUYoNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(66476007)(2616005)(4326008)(66556008)(16526019)(86362001)(956004)(6666004)(5660300002)(6512007)(316002)(52116002)(6486002)(66946007)(6506007)(7416002)(478600001)(8936002)(2906002)(4744005)(8676002)(186003)(1076003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yzev8UgSwtVsYR+MJyBRqY24iET6Ty0IvT3cvFiSu32Ku38m87OFuOaGUnnt?=
 =?us-ascii?Q?DLHyvtITdJKj8R2kWmBiBiR3op/HQVBRORfqLevudTajm8z5nyDBsRV4gYuY?=
 =?us-ascii?Q?IZdIQaSrm2FXTGgXUr76shvZPH1UjB9W6iIeRuRQdQqCdOoZ4Wpjstb2k3U0?=
 =?us-ascii?Q?RYqijAYZ9a2CwKFAtouiBYvsQsLre04FyBBhURUeI9MtvCIGjvR9oZegGcX4?=
 =?us-ascii?Q?vMT7Tga5EFX1ik8ES+qNHNjdfVhnxE2A+PjXSWIYwEnuBN5pHyV+2vLPLOBX?=
 =?us-ascii?Q?KKqvljs75lK8r8D8ZaGslqRt8beaNlwTLYx9iEKp6DnSWHJDJGq/lrWqAkhu?=
 =?us-ascii?Q?TczpOiMigCPE1/mJd7O7m5QximrwQYA17pCIx3njwK5/WwfoEwyHsZdY1X70?=
 =?us-ascii?Q?vqz/f3Jr/KbCQdzcVad/ruGu0fyOVWBqEiEMIYDfxvBqkIp0Hy3v79s+3aBi?=
 =?us-ascii?Q?3FLX6LZ4PdKEfoov42RWSEVHdq78BAMr3Dp6AZFt8LJqhX5R9mGe0f2/tpY+?=
 =?us-ascii?Q?FhLH6Eb/b8bJ1wlw/WCG2torzem1CsD5SqkhdRjCgkiu5TMjqcEHGeBArkXB?=
 =?us-ascii?Q?F3HgEDWK/yhLxPusVJGPFAKghTwjSzjg9rkGyzdyQGou9cIihbpEvug1bvZW?=
 =?us-ascii?Q?yEolnfDuMHj1oEnCunn/+dS/fZZzJ0kXXk3S3bur1sPITGBmrdKk9mHDbGVA?=
 =?us-ascii?Q?TxShT6qSYmECN9rnoLXo/UJ1inEL3KL+/llc1060uTg/WkuNrtflFiki+aW8?=
 =?us-ascii?Q?3nqxpgxN3U3yBIrEy63QXeI0J04RvYPGCFQj1mDqj4hyNQ0rx8TlHf1EcUA0?=
 =?us-ascii?Q?Ifq7nMedUf+/QxPXy/k3PS9ohWyOma6onTichkpinnsXRTbTFykD2zz5cDb1?=
 =?us-ascii?Q?IugLUxXnMrlnWeVk/cuc/z7GP4m3dq25m6LLSy3uJ4c3KR10o/bNO32zRkyx?=
 =?us-ascii?Q?hDMInknkuS1dl0oRk4hxelV9FSWIXNzJIrQzIOPQD6Hl9Af/IN4opL0gHIyz?=
 =?us-ascii?Q?btF1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 09:38:50.6513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: ca25a53b-b9f9-4ec5-2c2e-08d8a594394e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZ6MmOIpv9OyFuRAQXRTdbK6DMakoTQ8s0TASdkAvjaOxJiZA9nX7AJavr/cG+fteIWMRVJVpiXm7rNFcD9s0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4633
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

vdev regions are vdev0vring0, vdev0vring1, vdevbuffer and similar.
They are handled by remoteproc common code, no need to map in imx
rproc driver.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V4:
 New

 drivers/remoteproc/imx_rproc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 9ba996e5001a..fab191a485b4 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -417,6 +417,9 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		struct resource res;
 
 		node = of_parse_phandle(np, "memory-region", a);
+		/* Not map vdev region */
+		if (!strcmp(node->name, "vdev"))
+			continue;
 		err = of_address_to_resource(node, 0, &res);
 		if (err) {
 			dev_err(dev, "unable to resolve memory region\n");
-- 
2.28.0

