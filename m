Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5ABC433B4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 04:25:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4A94610E6
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 04:25:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232542AbhEFE0H (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 6 May 2021 00:26:07 -0400
Received: from mail-db8eur05on2044.outbound.protection.outlook.com ([40.107.20.44]:18528
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232073AbhEFE0B (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 6 May 2021 00:26:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QyVbu42Ikd6NX9nuT7o5gG6tB97kzcPy47MRP7Za7W5296fBhOQJMlMXKOzrINqsfY1nNFq2ctbimNqn6zFOWowjqtyt2nFkxOhB/ocbHZ2lC1jnlODS6PGxw+vIG2UZJP20KFb159+JkdM05cENNs7OD+VPpQ0zDf58296IPWNyJ9/18RlKbsDHW0GcEEwVIDdZRFbyU5Tly793XEI6AOmWQ8T76gi0+lpR1IRnrKCI3zuHqaD/DrsrTT+lIwlA0OKKnbujI4DMhc+3Pomv2wVdfbN5WZw52/AiH/5AavfMWUNy36Id7Q4aEWzkMKZWta4v4/OvjkrD5l1Hyc0xwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCRqmt83T7B1ZPemzgBrJCr2tq6gUaG7vIPBCP5gj34=;
 b=U7Zp3BTOPZHGpdghamFnhp+wn1qDmRzK+xHzOP4EG9wipX+eEfJyz6MlQOMzKcrZAF323+esbh4orUybsMo14Zd8niIKzZDCEesna9Y5+OPh8F41fiF520zni0X17HWeotkvzXSPlIupAiA135FywpZmAFrRo/RAp/Jbuwk8CHBR/4GfHW666xSS2PipRBQBbc3ieVQhWo21oR6xyb4U6p2R5A93VPR50/mlzUTEu4IVzzQbbNouhRqGxIN+LRD3CVTkCL0SJv7r+6P2hrCO5c0HXz83jkNTdBDVNPsmsIFiPFEnyymqP+ECec7V71tWtSTmFXBItcFQ6ERL69gaWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCRqmt83T7B1ZPemzgBrJCr2tq6gUaG7vIPBCP5gj34=;
 b=EZ8JI8+XnDd12orV6PPmjVhm+g+z1K6se37YaNeIbqthOuOWnwwtVTZlWpMsNiiIbC5JhGlxy2hJc+Sc+p5cD5OWuMFC/+RXXDy+OdVJUfyiKySlqYBtSJbz9VwrgXDxKFgG3eBPiKrBmfoVoY3no0DzxPaPfkVN8VI/XOiJYAI=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR04MB3126.eurprd04.prod.outlook.com (2603:10a6:6:7::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20; Thu, 6 May 2021 04:25:01 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4065.039; Thu, 6 May 2021
 04:25:01 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V6 2/8] dt-bindings: remoteproc: imx_rproc: add i.MX7ULP support
Date:   Thu,  6 May 2021 12:08:37 +0800
Message-Id: <1620274123-1461-3-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620274123-1461-1-git-send-email-peng.fan@oss.nxp.com>
References: <1620274123-1461-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:54::19) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0055.apcprd02.prod.outlook.com (2603:1096:4:54::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 04:24:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79aed0fd-d6ba-4f0d-35c5-08d91046ea33
X-MS-TrafficTypeDiagnostic: DB6PR04MB3126:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR04MB31263792015DEB6F005A38BFC9589@DB6PR04MB3126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FMp+9mSqW1QZmuRb971XWYBV6MO++7IFXTpjpD71zOJ1+cwoS6CDb38HYGaN7M9AXmTvFJiSftscTt+x8bji/ER9IkLMC9ULLnR+93rafZSQNSiDz7TaU5/iu4gw1+HwrtqsxY9xLhHiabFnrnJ/ntAan76X68wHyu0Po99CH08YLx/5ZI5370JataoBoUbNXKDYHxw9B4M/viUgJ/sHhhqVDW0WmBs0wIvrCMfLdwQ7yxHUB2vLu+OqFIKOp702wGOvgQedSYjVAyquTfvj7cfI5AGHN3bde5FXAI335fTbHvlF2ASz1r0F7ovyOdehgKsvt00G8eesGe/q0n6ELNXCPPqMO41Nu5k9BO1eMCEQscLfA5haKVAkY6lorLkZearb/ttarKzer+N7y0TDh5nODil16Nxi7R+lKMXnwldsqE/8JG4LfZ7TQsQFVpOo8uA8nAxT+V/BnbFhTS5F4g8XprqwISPNqqx55+uSpgi6c/nGIVeBSes72cwlZZIbMWsVkMaOFjc8yj6FnaOjTRb6CAdjaUy4AxJAya+z0Nklsy2cRePPPFa1rSNyPCRGrsq/F7QtgMiTv1Y1Fq5vNI8dAqIk+a5MoWzO97MvviRVFOZbKtsYsaXRXZkLeqpu4eUkBXa4IBEKI152VrUWnnx1chWlV/hNwD3si7fKS6ctVVnirFddqur7FPMXu93D
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(136003)(396003)(376002)(346002)(26005)(38350700002)(52116002)(9686003)(2906002)(66946007)(6486002)(8676002)(6506007)(16526019)(7416002)(5660300002)(6512007)(38100700002)(186003)(478600001)(2616005)(316002)(6666004)(86362001)(66476007)(66556008)(956004)(8936002)(83380400001)(4326008)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GPC/LluSEPAIF/1v0nQr+PVyP3a5UiDZeVL4gqPizcgHUah53AaaGhc0zVA1?=
 =?us-ascii?Q?ZfWtapvsz9uqtUJqv9pMCYqD08qcbhxp23DEfFXHy7TwoAqH2ZxH8GlEmnll?=
 =?us-ascii?Q?9fBuN/NQElCKKsQP9plmlDtRnUnIl+o9iJlHC7mbFjRfDmx2tLByLKLKd5BN?=
 =?us-ascii?Q?DdEr+h3/a2bE3x5bXptRc/NnwTVNgK21met9Qx45agE8V7t6Ko7Y9oBdJg5n?=
 =?us-ascii?Q?mZAibMBZpSYbqHOt2PveVd8mH2U5jvzSLwnjLkGCDE3kX24dXPWeKWZWTRHA?=
 =?us-ascii?Q?fqBly4sryS/lxFweujcuFlabPVKq/c138liPJlRlH56FinrIvGaMPY9oHdtH?=
 =?us-ascii?Q?rPxusGoAswyJPPpYMgWUyGa0bRqawBK5ZUjKIkiafLoiQatc348lRoLOua38?=
 =?us-ascii?Q?+A1aU/ZwkSjQv4juw26ycitH1zcC/3eyoul7xguR0gXOc0P8sSNxLuHsNxzB?=
 =?us-ascii?Q?AANsd1z+4iMG6bOV5s8dq8oxCVR0kAtpiwAHNKK7Ye/B+K1dow0OP00O6MQA?=
 =?us-ascii?Q?mKXsII2/f1edUT/lDg+wK9HJ9+DAghZMHfA/kYR3TT1cQHYbBfvB2t5TJf0F?=
 =?us-ascii?Q?6UzHt7FjXF4keXkR8raFK5AGNp4qjU3xxDTCIvsySahRZ1N0ExIBVz2qTPnF?=
 =?us-ascii?Q?/p2TSAiu3WMrGfsaUdN6r/MF7jtt/7ZbcN2bpJNH9JvG6XI4s/wa1aysuSRE?=
 =?us-ascii?Q?LOGa2uq0dn5WoBuU9Zaxx1WwUPQC+C2VLJNPMiVJdQDoQpxr27nkb0kLM/nh?=
 =?us-ascii?Q?q12i2QOiKfzyx/47DW4EQitRQ8VTLIZF4mvL2eWMQ7UKfO1u/wqW1lONYxiC?=
 =?us-ascii?Q?+1+OoPr5GFl329Y2PTkxCZKy6FEJ/pkBj1x7YJvLMZv3LPtO3OZmEb/xPMkN?=
 =?us-ascii?Q?8n0nRe6EDdCfGFU0giZ7AR1GtUY+YqRi4A+ZP0ZotvGHm4Pfsh2oIyCli29M?=
 =?us-ascii?Q?x5LaNVYDM31DD5zbc0B56Qkutse04bJK4zqdqgQYq9HTEOynqVSgT+SDQHHT?=
 =?us-ascii?Q?bCukFkI+CNqGhM+N2ig4N4J99pPfJcxAGgHSORtloTxGA2oT2AdAJdYFz2K7?=
 =?us-ascii?Q?fJ+eY+BeF/JKuCeJvpOaGMhg0lLG1YSwrtw7n4BaHSYcJCdXdwlmk/xPBRjf?=
 =?us-ascii?Q?vFOVPTEhbAEKukyHKVIebT/CMwAcJv5dgujfvxodHTetyfrpC22GUKbc30Da?=
 =?us-ascii?Q?ASwIXigWEjPF39jYYwU3L36ctD8RKp3nhPKwdFfDbCyXVi8zWlRePUevgPln?=
 =?us-ascii?Q?5VEdkJzrGw4z0gXnYT9SSHhT0dGhd2BqJ7CRhqtlHSMUDifzTK37B/denoO9?=
 =?us-ascii?Q?X68AgXPcFBpSKP9Ccek2tcQ1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79aed0fd-d6ba-4f0d-35c5-08d91046ea33
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 04:25:01.6154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVmCnU5vdwjwXhbd5QvEvbS5c5vPzD9oRpco6cu64Qix2lM5rVU7rFXRglHp/CPzlU5X8AFQqIUNQCmNVXb2Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3126
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX7ULP compatible.

We use i.MX7ULP dual mode and in which case i.MX7ULP A7 core runs under
control of M4 core, M4 core starts by ROM and powers most services used
by A7 core, so A7 core has no power to start and stop M4 core. So
clocks and syscon are not required.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml          | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index b13bf8d70488..58bc2a23f97b 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -18,6 +18,7 @@ properties:
       - fsl,imx8mq-cm4
       - fsl,imx8mm-cm4
       - fsl,imx7d-cm4
+      - fsl,imx7ulp-cm4
       - fsl,imx6sx-cm4
 
   clocks:
@@ -57,8 +58,6 @@ properties:
 
 required:
   - compatible
-  - clocks
-  - syscon
 
 additionalProperties: false
 
-- 
2.30.0

