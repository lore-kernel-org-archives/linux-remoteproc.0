Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81A4C433ED
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Apr 2021 02:35:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8373361413
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Apr 2021 02:35:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234678AbhDUCgZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Apr 2021 22:36:25 -0400
Received: from mail-eopbgr150071.outbound.protection.outlook.com ([40.107.15.71]:54838
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234679AbhDUCgY (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Apr 2021 22:36:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Az57CVCYDGhcPNYGx2UEyWwF6NCEaQsMXPHd3Z++fwj13b2X061YthAEkLjunjzgUmuQA9+jIsvbFxTFXnqKoYOkREJeT1QlFOg7l0aS3AN4MxUUJodi0CMqzKMK/doo+c0ZyC8+yGtzydcfTqA1GKtTCftCz7J7Ta7Oy3Vmp+uSlMDj+MtHOeoAwsVGC5kK+rDHClDVOcmlVWqpwpHjmNb7Yx33uACrEWxDAtxZ0In+gjKlBu7GO6oNsjjplJVyZsE/tz1tZKXne2eBLfKWtM4djApP23w4Q2+Ey0QiXiB9CHeGSNDJx4jzUZh9vvRWJSzjkI2v/7Z4CsZdrdw5Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwXlKefmrLgWHF+p/zEssQIWV36skW01SSIYJ4rTNLE=;
 b=amn7EN+mWyicU2KXV0mAolGcIEa2VrrcB/tzVbnIJ61ZZIc65i42hcCQMDfhNuilQ3zJXa8J4X3ugunEmzfj2N8VKiHywFokuCesIDVNHJPxe9r+4O1oWZeeXgqK5SU9ONIEMm/tx7dmOCf5IdVPkza1ZAWVgTm9kJhKHF92mOk1Hi3P52waZB6NdmfwRA2+mgvuXAY3EDsGNFJqPY4mnOhVztom0VlvpfA55f2s2psEIi6ucw9rFC64TzsQVWEBIfozdjMWSd+JjKYGnmn8pnrtaeT0pPztBabDaD0b77Xt4zOBHWogjpm2c7n1w/rHOPIMr/LMZ2+zQPczhpRxeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwXlKefmrLgWHF+p/zEssQIWV36skW01SSIYJ4rTNLE=;
 b=Dm8P5n2zktGEoMgy75esLkCKkspocNyqfmq8aHKam2ygFXVss2Qh5NU/KlzhL1JA/eVAFQDy1vZxOKUJRRIylAcNVJkuLA8iJlUMFD9/cwzxImAQAYvVa5djSUH9XMZf7+DUwDnt11K8UCa+s8nyISLC1z+AhEwktUWV2SKE2N0=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB9PR04MB8313.eurprd04.prod.outlook.com (2603:10a6:10:241::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Wed, 21 Apr
 2021 02:35:50 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4042.020; Wed, 21 Apr 2021
 02:35:50 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V5 1/8] dt-bindings: remoteproc: imx_rproc: add fsl,auto-boot property
Date:   Wed, 21 Apr 2021 10:20:15 +0800
Message-Id: <1618971622-30539-2-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618971622-30539-1-git-send-email-peng.fan@oss.nxp.com>
References: <1618971622-30539-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0204.apcprd02.prod.outlook.com
 (2603:1096:201:20::16) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR02CA0204.apcprd02.prod.outlook.com (2603:1096:201:20::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4065.20 via Frontend Transport; Wed, 21 Apr 2021 02:35:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a27eeefc-c9da-4443-ef66-08d9046e2ce2
X-MS-TrafficTypeDiagnostic: DB9PR04MB8313:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB83137A1322A68F0C8C5E0AD0C9479@DB9PR04MB8313.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ES+Ipqfq1JG7miC4Wcaj+1G4tdYgXq0NI4nv7hKz3Jq0oZgvbyA+rr32jELNvtryqjMVlEAbkGxm3ReqQMwBYKuL4AMiKQJkDuRDTj/GK9EuOoTy7gQ7CI6Fg6FB9mISN1DVDdh5FQxtjvaJXefXsJVN30511Ko/sIgpkkVDBz9aKmfFGYNwC/zVk+HSuPjs/RxPRKdMQ60ESi2RHrXeXJY+Ve2EWOUwRl2EaOOss5E3VH6tbXa5Ffw5enG9cCGHTive/6xbPRz96gVD8MVtYGKDV5dRB56XLXzZyw0tcoor5pZD5IICZhcK6j2yfGwtIbPCI65zFJkvFwOjjh4SoMkRfjb9tCrELYITyB4qAzL9RR2xPR5yVJQ6vUmpFTnkldQJWLzYZslmVKtNIKfFJLZZ9BUHM2kpEaYHHkkXpXqSwuf4dxuz2Q9VogCKJomm0iq6ia9KoEhpfsYbFw2K0fgN0NIPXhQRJCSbVjolf5UOLQgydr1DvFj57v0W60LUVXyTOI/u3fkBt65f+oSl/k7S94XAvwFao+HLtQu8nOuSqz2++Ug+w/tj36IQ8AXZ+3KN/bcdYdb+ddVtQL0Fvd3VVFuzh46P3FUsXJWScORsQD/AXvMbB3ZflLrRIdQd7TI81DPnxm+Ab9WMRb7eMmzoYQfcAUAhY1ldMs3BJTkUXhrorfo08ANgtpP56Ote
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(38350700002)(26005)(186003)(38100700002)(66556008)(52116002)(5660300002)(956004)(4326008)(8676002)(66946007)(4744005)(8936002)(316002)(86362001)(83380400001)(6666004)(66476007)(7416002)(6506007)(6512007)(2906002)(9686003)(478600001)(2616005)(16526019)(6486002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?q0pABtDIkf2WnGyfeqYmcpHKB44wXeS1j84XA2lqCR5MYEV6RVZebUPpWYxJ?=
 =?us-ascii?Q?DbMYiTZTniCg5IpjwZB2s2SeNmTgPatQsp+Lb6/RB4VHtx6SP5/hv4VVaSyj?=
 =?us-ascii?Q?68nlfOGDU9V2hvg7+fdRqw7VCgztHx6fWKS1VfzAErLzeEWRSFNNvlR/2vYh?=
 =?us-ascii?Q?WAoy8ssNlszm1zFV469ENmFYLoRnICM2JV9yDp8Fm2jPvEmE5TGfXnYew2+C?=
 =?us-ascii?Q?P2yPIVgdPjl6yzRUTq1Vs+MRQ0b/vsq86NkMzTSi+CbgQzFuoYwKnIJ0KvDg?=
 =?us-ascii?Q?j7AEY3S6Zj0dtBl3SxTw/ocCgwHmRZFshRJtMoKv32jXMOJ+q1MRqj6wMvgp?=
 =?us-ascii?Q?mb7fnqAzZhQv0rmP+YO7UlKMeCSdNnSKQEzUFkRrqsyFMb84ObK0s5RYMof9?=
 =?us-ascii?Q?dIEK+rvspd6zMoM63ZxwnrLlpt6vnVHKzXq6iqP1p6Y+dDBk1VDXkZD7IACT?=
 =?us-ascii?Q?An7hYOQUNVu/iJM0J9izdMA0+8J3W/LoWO6K2U+LcoMnM+lPUKN6C794oeYn?=
 =?us-ascii?Q?GkcAiykSEFjtIKbWFBSjn2luVPgY8VfzotTUrjJ6pXKvNC1wQOLMN4J6dYDT?=
 =?us-ascii?Q?ooxwkJ+0UBHEF7dkd9NzWbbUQYA/sCHqzZb91T5oIBzib1oQql4ySmMdOwpq?=
 =?us-ascii?Q?3QxU9cAyOiLtzuhvBQm5Xs4A337Sl9B3/YV2VuysP5YAdqByeiZ2+PpU8ySs?=
 =?us-ascii?Q?gKv7gS3/WHuYFtPrr9I5hACpLhj15sHALR2prC/wyWEgLned75MGfm6i2A6P?=
 =?us-ascii?Q?v7AwIdwvh51+PjFoJEkKXjylb8J7QNUy505LkUCyqbY38QcFu5FCxtHEs9e6?=
 =?us-ascii?Q?J9QGOkreDTCGk1Wm3diaFkWVWdEe5QXbFuPl9fJNQ4dMPyUoMVV8NC0xk2yc?=
 =?us-ascii?Q?LcEQv2b0001XKWlC6xrE0LduZddi7980vjp+HK+nNlz1mIxCGddoQ7qsgSue?=
 =?us-ascii?Q?0PG0x6w0LLOBvQbhP8KahDrJQXdE3Fc6NujKj3JX+WuokqFEv8TuY5F5rb4w?=
 =?us-ascii?Q?nZL2A57jH2YSPam2CjY4gRDcwUUYOPqfKrec12XGaYk79DZSweooWj4Y1fE2?=
 =?us-ascii?Q?jCgT+aSGPm/zHKIPQUhk3lTUUWFVwtTaiaPLmGRde63qL/gVj/OIcCbWz7ib?=
 =?us-ascii?Q?uPOJ3oCHCMwiAmjUgKJUi15mVqPglWRSRXSrFhw0ZPdgkEcoJt6IAWQYzrhn?=
 =?us-ascii?Q?VJdMQBEb7aFfgn/Pvg0F6US1D7MBfmKleBULN5+Z+DWYTzHzv1ZwjH6iBXOP?=
 =?us-ascii?Q?LRjaNjf0oNch8YBWZT1jGRCxG8q34/cE9BpifruUCvuBC5MJgBes++UhIdnG?=
 =?us-ascii?Q?Zwl6CdcXTdaMqyV0lC2fAO8b?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a27eeefc-c9da-4443-ef66-08d9046e2ce2
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 02:35:49.9467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qHTuiJVGJpbsX3TdcuWLoqB5vdlAi6dWLf43qwp+8lnMEclPjBKsfXg9bOJ4HrFTFp2BxyMZNoTuL9x++JTamg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8313
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add an optional property "fsl,auto-boot" to indicate remote processor
auto boot.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 208a628f8d6c..b13bf8d70488 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -49,6 +49,12 @@ properties:
     minItems: 1
     maxItems: 32
 
+  fsl,auto-boot:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Indicate whether need to load the default firmware and start the remote
+      processor automatically.
+
 required:
   - compatible
   - clocks
-- 
2.30.0

