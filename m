Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADA9C433ED
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 02:10:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87738611BE
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 02:10:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhDHCKK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Apr 2021 22:10:10 -0400
Received: from mail-eopbgr40057.outbound.protection.outlook.com ([40.107.4.57]:57183
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229958AbhDHCKI (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Apr 2021 22:10:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/oHGp9kbfWc6F9ydEXXtcwC4hXNq/zbAySQKBuXq08OQOoEi11a2EFAJy/tTC20V4dlkqBfPdbHFZ3AFUAdBvSBsRKyaXG9mG8WajszZo8m7N2z2QBaeS8QthSP5vKBoGHc0WZwdwVSOK2UYoqteU2x/JHJvhUdXvsoSZ3CU3/NGFxDzh6qH3QKNRdFlD1aOoGZGWVMPf3cfOIDXvi2b3jKkc34Gl7rECBqKyHfGyn95zW6mp01622zzjotpSLhknfSN1roGp92AJUeVhYRRQWMRovHhPDZh8c1nYQq9LV8a+58fUp3iZnBJ7n3VuDktPWTGTnUKRgS3Or9pKzDWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5r2YS1IJ7iZGrBoTfdGtwCXcI68fncREV/Lm1YGhqas=;
 b=SVX5wYIgMmfc1EdHTQHFqoss+wDRmK+rwJRbq5ieBvAhIUKoDOeEOXA/N1oWlXdfPfC033eULfQIH5aE74aNOxUAwAj/w9HsUieTYgi3hfFPdvRkoBTXS0P9xI7WST0QjxLKt5PRPqofVz0v41gfFyB8EmAMUgqlMkgGEHwg/5+GtdyBSHGtlikSHrxATQcQF18g03RydU/DLr9GdyoSZplEQpk2FrrZCVst8l1wwaQixynY5boPSFxZdAh5gKNgQ5wwHxA+d4fTyXZBi2AFBaA24AbiE20hd6sIxiyExxRpm/at64aiWed7rsE/dwXjlr11rSKTGY3zHOpOfLgx1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5r2YS1IJ7iZGrBoTfdGtwCXcI68fncREV/Lm1YGhqas=;
 b=hnHcJmarxq5BZNpUC0xs4V/PH0m03c//suZTLSrU/N1/MtxDm5u+mdtysnGM+s1Fic2IayVWbL7766U9hkLwLTizB2ghxl7TPQWfsmapGAJUPK7ZB1S1uWOe1U8ptgHVIylJnLp2ljW49mhxdQINNdItzC5g8pR6bZd6eL/OsDs=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR04MB3128.eurprd04.prod.outlook.com (2603:10a6:6:10::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Thu, 8 Apr
 2021 02:09:56 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 02:09:56 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 3/8] dt-bindings: remoteproc: imx_rproc: support i.MX8MN/P
Date:   Thu,  8 Apr 2021 09:54:53 +0800
Message-Id: <1617846898-13662-4-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617846898-13662-1-git-send-email-peng.fan@oss.nxp.com>
References: <1617846898-13662-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2P15301CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::29) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4042.4 via Frontend Transport; Thu, 8 Apr 2021 02:09:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51d119d7-05f6-4dce-4d4b-08d8fa33677e
X-MS-TrafficTypeDiagnostic: DB6PR04MB3128:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR04MB3128D83138A00AB71E6C7603C9749@DB6PR04MB3128.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gv3BN5WS1Yz1E6r40Ahe2Nx6dX1NtOH47K0zizN8dYyItdOLq6n5edFBWO9K0gfu+FsTHP3Ahi76yANG2uZ2P/Hjt+Q+gr34fHNou7nvVXKw92IMg1/frpXNDxUbmRbkNw8ceAQKRG+X4IYot79SwjGSfjRmT7gKyvarTJj1GcsDEr9wZQeW28VgsLsNyk1zoxLVqovyvzah22pABPQBUs/LrgQFv3tymOGqNK0W2KuRUJWKf1Bb2pzZ3g6EruiUzF2JCDJVAZkytSdTCk09pWNXyOwhbutQqJnIHuTvXpJ4DsjGcS46tbNiF2MjLcV8ehoI23O+Cgv6TGpP42Mwp2Qsdjn47OT/fqs9e7G4g5dmtlofo+Z8hJt9ytW5SF5JWXtO/6bX80keYBKSC/EpKxzxDtGeGa8ZvjYpcZvlV69Se3T9MtyTTAfR9BuH5wbQsiR3XhOhFs4ltCjlyhxEttZ3lCUQdIJ9wLwVqDU+k9Qpr0qVT50suLnHa5RUBEnDaaJBrOs/sjoXR/dzWGHP7sPFHsCWaUfX+uNCikxCm8qY2rXJw6BhfgO90bwqHa7w8QlzUPXzJhbhRilpfiTrS094mkZxgfEfPSFJ4iPrjA+W/4yZOvATbpBHYkDkoJHpi7kP5WOWq6Pi3LtIKC6z9Sc7LkNQQVHxs+IFurkksuKlimMPZCBHL3sGBqV93++sleGjYeSKh8fN80155l/IQeBO06vsMcncC7Db7fX6qY8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(6486002)(4326008)(478600001)(8676002)(8936002)(26005)(4744005)(16526019)(186003)(316002)(52116002)(66476007)(86362001)(2906002)(9686003)(6506007)(66556008)(66946007)(7416002)(38100700001)(2616005)(6512007)(956004)(38350700001)(5660300002)(69590400012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dJ0u+c1B5+uvznPafKl6zdinqMs42z2r58//HC64imrwXnBmklzDXpuzJ537?=
 =?us-ascii?Q?jY8iLVLGGkHR9oRkDJRFrH8uZW0Zbk8ocTGThTFdCEixkfr5eVI+Vk4DQBsl?=
 =?us-ascii?Q?MMQxyw5+ymkn2JwMioz6lihF168J/zpNiVAfFvB2h5sEV9IDmiu3i8cI8jwG?=
 =?us-ascii?Q?u+651wdsUqXJ0S3O/5bsWnCDre7+G9dKvYo1ATGWDkcoAwpvmY4Rz/yelTAO?=
 =?us-ascii?Q?of1X72+OE7CxwaR/7K1MIEQVYgjnXSoz5z6Ueyezx4jQHh9NiEd5gcG7Qbxb?=
 =?us-ascii?Q?ncMcbPuYysWechHcsdSMSHtjyTgg3mwSOlIYBnDe2QfzwJJCrbZ841ZNa77X?=
 =?us-ascii?Q?CSnCWl1BQMlaY5loSMY77hVIeFV9k7ey0P6TW/xs6qvr0fdehcpFfRTTKUP/?=
 =?us-ascii?Q?+qPSvy7GUjZ+I/Yd5goWAZ9S1kTSAAIOiP8/gHoSeFI5FLCOiiZS/1phVTQw?=
 =?us-ascii?Q?jcofNSoAzXRZjaZxz9ThxCJj7TLeuZPomMNiDVcgbjOQj8zXSZ5IfGlhycoG?=
 =?us-ascii?Q?q1dOvyTrYTSj9myoUR7MocojYlE5fsikzEG1hHS/KJA/yL9IK4a69NrfxD3d?=
 =?us-ascii?Q?LFT096Td57qlJYWAPgvWQ+6pn0OvsIBWN3Qsa6fSqIrrbvlP430+CZJgaGhH?=
 =?us-ascii?Q?YOHHo3hIcbvR/EIgJrpaGch0TB2lP4dxG3LgW/FZSphMahMx14MyCRyO6ALo?=
 =?us-ascii?Q?vBDyo0YzUyQwgCqSuqu/1i9s6DzFm4rC5/eLF2ohCe/p7gQUvCi+gzK0VCoR?=
 =?us-ascii?Q?DOfdf0kkH7VG0YkUMmjFR5Kh5PuZ6j26VKIsyDJevWyF5zN5mjs1n3wdS1BS?=
 =?us-ascii?Q?3iIXeu/Z1CYQveToJOOl/GD0nJyoB3FzjwZIa6RezX8oahNRx7leitnxKUM5?=
 =?us-ascii?Q?VFIec7/QCvNy2Nvh4LixjW7y8tiGOdaTKv4KvcOdMJXD8Oe7IFbeeSbVq8Ok?=
 =?us-ascii?Q?7Jntx2/rLTEehutzZPLZS6M3hi522ZYRa7IIgey1BP45d/19wqwa64y+uEVe?=
 =?us-ascii?Q?ys+Kd7w2FVZ5hCwVvNYdkbF1QgMQ04JZTxW7+lWwR/B4+RrAsVLMJ0I0NcnD?=
 =?us-ascii?Q?0nxDLBKoCO5epDw0WZuBEjpp3l9c+WxSSjTVBtdBNxw24DkEJmfAPVrkU5qm?=
 =?us-ascii?Q?I53NVruVqo75e3aQ1CltxkjZC6djoKJELgmOEL40VIxJMoD0EFAwx9+i0Byz?=
 =?us-ascii?Q?cw8NGoVjSC1tE3TPSjba0RU0VEalC2AzPEB4Le/IP2AAT7eSmvix32ISdbv+?=
 =?us-ascii?Q?TVMR6+bLuQlTCW5W017fIXVwOh0qbqx3UVGjh30qNKkzba5CA66I47G9qE6P?=
 =?us-ascii?Q?rfQYJL8Gb0PnyxVfqAyL3oNX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d119d7-05f6-4dce-4d4b-08d8fa33677e
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 02:09:56.2950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /atEK6pPOBPrLVPsBJIX63B9P0pQ/oFPu5z1K9JV86NPUwLHUtQOJSUd5Q+iOlFVzI3jug8wCTV5hfL4LBnrKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3128
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX8MN/P remote processor(Cortex-M7) compatible string

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 58bc2a23f97b..1dc34cf5a4ea 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -17,6 +17,8 @@ properties:
     enum:
       - fsl,imx8mq-cm4
       - fsl,imx8mm-cm4
+      - fsl,imx8mn-cm7
+      - fsl,imx8mp-cm7
       - fsl,imx7d-cm4
       - fsl,imx7ulp-cm4
       - fsl,imx6sx-cm4
-- 
2.30.0

