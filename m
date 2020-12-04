Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8465EC4167B
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Dec 2020 07:14:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58B4922583
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Dec 2020 07:14:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728663AbgLDHO2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Dec 2020 02:14:28 -0500
Received: from mail-eopbgr60041.outbound.protection.outlook.com ([40.107.6.41]:50414
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728473AbgLDHO2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Dec 2020 02:14:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fytxTk15GkaboMUPFKXD4LCxqU/6KCes9ALLgjZXRnMS40tPb5094OHTIsqSgCW27144pA6iBpBy5lftG16eXVnFQel12dtaia9HjaPri9l4fklsGBzAO1Jw3LpsfAdyc+m2yiQAUQ/jQI8uU9KUzdgOG96kxgCuZ2i9pw6MpmIzAROJZRdAjQTzQolrtwxQ2XwgGWR8ZujfTT3XOz8qRB85x4xOy2vHER1U9mGnTOd3eBCgzCub6Ed3dwTfcr6Y6xire/yqv9HG/cMjrv7B+FSGKsY8rT9LLswndrPXBTopNtC1dffHaZDZa7o0ql/LFXDtmv0Ml5liTjA1aVFPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rGywZqaua3hhIAQ7LwptTy7EG5pyguMPLg3XWoT9gU=;
 b=NjhtRZ3axlF4v6RbSspMLXl1cyIiU08vzG+Fi1EQrnhPcgeriiPzUq+FXVt+0tjNdMHIufRIiHiW8cu2quyFuDpHiGtNeftQCL37i4FcXLI5KhddyOpBIcByY7x9h9kOm+otxDoM/ljAkPI2nupq62B4zNL0bgP7tee1DhfxBBJpzRGi/sRypo2EB0IOXeOwzizrfQBl4g1QRnayPbbFikTKQ3Y7fJXAx2F6hETI2ROvLGKH4lBP0eQH7dCB8WMlwV4JTvBhriEHIFFlW44ziVpIHRSY+QnCaHbATcq1+Osmq5wi65Dk1VL/eQZ06ipdcqw1oihnDLvmHh38xxKziA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rGywZqaua3hhIAQ7LwptTy7EG5pyguMPLg3XWoT9gU=;
 b=UlEbmJZWwCk9dIu6JMe6CBUhp2sp5wI8ib7Fnn5YW6xd8dHSkBCAqRcWQsyIDcPT2t6wvUwwI1PpK1Ed44Aq69PL84gl93BH1myolksx6AbPojBmX8uqqBdJjUlyLiW3l3r54BRNZ2OIrfXFXAwGD9Fck+/wcsA5NhL+lmiPA/A=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4633.eurprd04.prod.outlook.com (2603:10a6:5:36::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Fri, 4 Dec
 2020 07:13:06 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3632.018; Fri, 4 Dec 2020
 07:13:06 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH V3 4/7] remoteproc: imx_rproc: use devm_ioremap
Date:   Fri,  4 Dec 2020 15:40:33 +0800
Message-Id: <20201204074036.23870-5-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201204074036.23870-1-peng.fan@oss.nxp.com>
References: <20201204074036.23870-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: MAXPR0101CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::31) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by MAXPR0101CA0069.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Fri, 4 Dec 2020 07:13:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 318385cb-7359-47e9-3f56-08d898240bcd
X-MS-TrafficTypeDiagnostic: DB7PR04MB4633:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4633ADB4CF4D0A984AD50493C9F10@DB7PR04MB4633.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FlDt/nLfunDqC8xFA6y/EZSKdERmqcTKeadVb6xPnqq4Hj0WPrOqzJsM0KPkxDY8V6idBN3NLbUfXiWcbmSl6EeVWNSEbARH2XRMnvW2HCpHJ/xoqw+UaI3PWZ3Nd1EaWhctiFjw5GrvL3Xas9bczjU9PWHVRo3Tn/ENJpJraghw/QzmVpMb7/isDxC25swH13bJ8PN85/0i66Jwk4iiIgIulud2auNoR5zzxt3z8mRqQvpnVwL7s6l6YYSfV1oc6WRw1JM9z+zCKQZX8OQWJFapcBNsUBETOItEfqM+8NdwmKoahb/MVZtsAZNdUAA1E6RnTbEC6phnxVjWsUHL+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(2616005)(86362001)(52116002)(6512007)(7416002)(1076003)(83380400001)(66946007)(66556008)(66476007)(478600001)(316002)(186003)(16526019)(8676002)(956004)(54906003)(6666004)(6506007)(2906002)(26005)(6486002)(8936002)(4326008)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WhtqXjTY2a8lPhvEiH+L4yZaD38eHzQEVlh0UKZCvacK5srR7Rrqom6JMn45?=
 =?us-ascii?Q?9NY4ML7noyRpNkLq2tE/T4MrgaFShn3cuZQJ1j22OtvIwrDPgraDL4rAAECE?=
 =?us-ascii?Q?1WQe67GSyCChCxL0DNv9qrvBQi8Dfuz4HNjAtMTDDeoA8oLcnuXmuKHo3EQ0?=
 =?us-ascii?Q?e+6lYsKoNeJHyfxW1uQnyQ6J3AJ8+Cg317z84Mwcwu+jCCOE+TSHV3pSMU9w?=
 =?us-ascii?Q?tMgJBAq7RGZ/I+YQZZRjEx9VSFxhrhrj2nYwS1CQn8pfIHCovM/8m8edfAj6?=
 =?us-ascii?Q?FhEjvWFysvyY18SXOa+zK9zXh3FHz9z+Fv7xJgPoLkQ4C9hVOeHTo0xatQ45?=
 =?us-ascii?Q?9ul8vllluC9jty3G19TlO50b73VVfa7MqJXVEUDQRXtUqBtiQz7Iv5vlNGNv?=
 =?us-ascii?Q?VibH2k9eiPtGJ0Ie8r9emSpFIpvvPpdwqqxnPWYGwdCr5WwX+VQYhmJcKSxX?=
 =?us-ascii?Q?xRDn+P/ekL7tvSR+ZyWjE7tldAQN8l6YarvD1rTIpslBpe1gBAyW0vou5K+o?=
 =?us-ascii?Q?kDITcd6Z2DKV9x4ajhvHzE44s2KB3nE9AZFKqDj28sz7479VJIRFqVTDwuo5?=
 =?us-ascii?Q?1YYsw0bkq6bdRwAP2fopiEnN7HnuiGdZcKun3VEiUSHzNGs1MU6fuVBG6/n3?=
 =?us-ascii?Q?k9Hopn8thb6yAg7Den2gDGEJx4+R08yS5pzQdMvh9hAwPRioOeqwsuMSr2ko?=
 =?us-ascii?Q?fNBFDdjPrUJUU0zxzNdxA+v5Hh0e0FuYnEhbqI8EKlDu5Q33RUXTtsmUuubM?=
 =?us-ascii?Q?hnAoHNIYW9pU/JBeaEm6syqIF91Fzo4uh4GUSOQNsEKOMzckt3oXW6I3jep8?=
 =?us-ascii?Q?/1i/1vsQ+Ivg2TdBUk2yDgw6nhFWYhqorspYuiiIh07uwoVWjRlHyldIaim9?=
 =?us-ascii?Q?5MxXsemUG19/2gcOYEHv3aw45cTZfnuW4q+HArVY924z9zYzDXZwN9rTI6El?=
 =?us-ascii?Q?XvUHaeJhHHHsSpqAVz5id5PF+tYWkRcj8BYmtTujuOHXI/RtAYeAzUjyCX9t?=
 =?us-ascii?Q?G8KA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 318385cb-7359-47e9-3f56-08d898240bcd
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 07:13:06.0348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RRXTZLXxvM8P/Dj56cDbvkke1u6/ILx575iuXeT27qmhdZDMXRUAn8IyURFmajnCoaitX/R+1BIDOHRA9qkokw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4633
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
---
 drivers/remoteproc/imx_rproc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index aa5fbd0c7768..15c7baa480d7 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -298,9 +298,10 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		if (b >= IMX7D_RPROC_MEM_MAX)
 			break;
 
-		priv->mem[b].cpu_addr = devm_ioremap_resource(&pdev->dev, &res);
+		/* Not use resource version, because we might share region */
+		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev, res.start, resource_size(&res));
 		if (IS_ERR(priv->mem[b].cpu_addr)) {
-			dev_err(dev, "devm_ioremap_resource failed\n");
+			dev_err(dev, "devm_ioremap %pR failed\n", &res);
 			err = PTR_ERR(priv->mem[b].cpu_addr);
 			return err;
 		}
-- 
2.28.0

