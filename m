Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639FEC433B4
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Apr 2021 13:42:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 215FB611AD
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Apr 2021 13:42:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbhDONnV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 15 Apr 2021 09:43:21 -0400
Received: from mail-vi1eur05on2070.outbound.protection.outlook.com ([40.107.21.70]:15552
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232954AbhDONnU (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Apr 2021 09:43:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFOPjhr9OHpBOwP9ULF5sIk0JbqLqRZ4HQjJE8P0zsRlDe64BKb8iuEcv9Kv0gZJ35uEP6lIDRFei3R1t7QgK/t5qdIqtHgBXFX8xTCDuK2jnQEmIKJm4O+ZaBnhwXA0c/eFnxyfzWbrqnc7ohob8i2Ox/mGyFnhlRsTJeyt+HlUT3GwpaIrI9o60NAr6wToKrEqGWCJdVOInZGm6tMw/UUvxNGVCt5uwORHfWVu/BHY/ODF4QcNx5cym4+jWmiZHL73fJbEvL1Hp9rg7Y3xWf8IwFLK3uu9f3aVU4IkwuFq9BuXraPNayNbCqKIpDfhQiTL3DIfyAfPfnUmwNO7qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlD88/0c9ab9quV+OK546f4LXfr8I7iAGXLdNQxGNmM=;
 b=Q6ot3KqtEPHKwFdv1cb93FRrM2RiIa8O/2oFI+oeyQyL8/d0fptnI6M+mkotk+gn7s2TSIlyGtuEufNFuqR+wMKBWtmiLAuF/UxiAreBHlGZCjg529YPOlmUk4nHznLqK7+7t0txakiQT/0OCEgA3FnhRperAaUyRD8CNClmwxxMZ/H2CA6iijC9jc7Cxpqq//PCdJbMIx352QJk5YimZNx+KbhH6fmbe+ONs+gjTNRJPky3otXO44gONbg6iAZavwWV6veGQ3Vg8SYXvsRgMPad0ksXhYt0h2wJdvuT//QcS9AzsL7k2WiXJWFT4USqT8Sv8uCoREJGkB5Dk8xnaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlD88/0c9ab9quV+OK546f4LXfr8I7iAGXLdNQxGNmM=;
 b=k8ig9/iaIv+e2Cw+9cc4WeFY5zOVvxTcpgc/GJB9mlA6vr2O/89DUoif5yN8zusW7ZUTirCuHURUBQza8S+GOOhzK0KhxqY3s5v3cvTK1pI9lV1hQqczQzZg2FSwdhNNqBg5PE//X/igPozhVt8d1kzaM1FsvkkBYH77Cgbe2/M=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5241.eurprd04.prod.outlook.com (2603:10a6:10:1d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 13:42:54 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.037; Thu, 15 Apr
 2021 13:42:54 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V4 2/8] dt-bindings: remoteproc: imx_rproc: add i.MX7ULP support
Date:   Thu, 15 Apr 2021 21:27:35 +0800
Message-Id: <1618493261-32606-3-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618493261-32606-1-git-send-email-peng.fan@oss.nxp.com>
References: <1618493261-32606-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0132.apcprd02.prod.outlook.com
 (2603:1096:202:16::16) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR02CA0132.apcprd02.prod.outlook.com (2603:1096:202:16::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 13:42:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 194c3196-8778-4c10-3566-08d900145ed7
X-MS-TrafficTypeDiagnostic: DB7PR04MB5241:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5241D55956AF61F400234C32C94D9@DB7PR04MB5241.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pMsFu/UlRLKTzO/VfOr19TN47FQ++MM6NJHxO59wUumMtZ/cm4Mrlmj5+uPAsNBdCRH1WaNzjCgoASTu31U2aAWMhZRCH4BXwQ9fTNkhvEvzRTBk0ZvJNncBM0Oc0nxONWvCbYoe3HP7deD4EOFDsgBW5iRSPAko8wgO5UitT/CfpPFrajadnlwxxq9e/E8o1KsCBz2aBglYyjYYzSpWn1zE6+Gp9mmKb9vXWWex1sg1Y2cviNJaCf0/qPT+hWQgnFQT8qcq6UA9f7LB+voPNDVGEz2JWaHf0oOr9XXRgg3q9rKVU1NFwdtbo7DubzY12uAAzGTfJdDozUxaooZyCU3kHuYSs9Nuzwo5NYXbu+9M1kN1F9AgtBOn3R/t2Ysn6PTKyMzWL7RZUx09pB3uiTaHXmlVdEbwGrljBpRG9y/8kjmu+2RM4BSH9cBcS/pzDWgyv6vhwd66HfrurV/LcsQ+s0MmodIu791KFbAqJKs5irDfqi5IOjIuaszj1dg4r119WsXj90lPpetC1Zeuc1s0YItwYUdk1PatMl0txTTW2K9Ij7vpBtmqF5EwLhOkCYyzu0mlKnIYt8eSsmddhfwPlBGngphmjXqjxDKno08M+7SO7l0btEsRjgf40hen8/Yu5DMnsI2IdmfKPMUBh0ovcSPKEp6KiV8rZU25zH6/jj2L/cSonbusA0+uAidC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(6666004)(6506007)(26005)(956004)(186003)(8676002)(16526019)(6512007)(7416002)(2616005)(4326008)(38100700002)(38350700002)(316002)(69590400012)(86362001)(478600001)(5660300002)(8936002)(52116002)(66946007)(2906002)(66476007)(9686003)(83380400001)(66556008)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?l/xUQl0hsclXJW03Q7EoNCGrZE2yaa1loGhhwmllAQoponACDZgHE93/mbZg?=
 =?us-ascii?Q?tKeGtVrcnnzbQS3wKNfNE1h7y7h3CTJrdTwmSSHzUN4LLRBFwCkxMeXiSc8z?=
 =?us-ascii?Q?hfQ+RCPX7dW8vmPuGqdFr++foDzf80nGpf8BCuPHO6zmSnP2bwb/pNWpV3Ls?=
 =?us-ascii?Q?LjBFMfkgw1Ky0JuY8WFBxwC1Lz7I/2sfX19kUu/AYjq1SkOda6kAFwyWFOTW?=
 =?us-ascii?Q?mglM5hExFlwgIwyb4IOUGdxaqwJglMZu77vXlFEre9+Alvu52euZ07PLRxz3?=
 =?us-ascii?Q?eYM0XgLPPmZcOUhACkEgpJjGpXme1cfhCkVzTGdg0pjr+svBVenu/xuUhylq?=
 =?us-ascii?Q?As4UtdaCy2yRvrPLkp+Wg9MOTMR3QhXnQBzesn6Sta8+79g56Ho17EWstkXX?=
 =?us-ascii?Q?NR8Ad5Wg8Bww/unjNQqoIli/NrcQtPcvK68ZizIk/N1r2R6gZcMU87rc8OdA?=
 =?us-ascii?Q?Bb1u2gwlJol2O1/0295zT0GEIVnwJrOnb5i1FTcybLOTHRWHBDlOSL7L4lTU?=
 =?us-ascii?Q?L+QYpI1jII2aK6+J8Do+m3BZhmqHpKft+iODkb1eE75SMfRXIQLovZ2SFAh/?=
 =?us-ascii?Q?jZ9QK4Uvssvf7Q+tPBhwyn55FNt5mkcCUQM/9LUNPEGPDhXRjCufAOm+On25?=
 =?us-ascii?Q?i2UOSg4W5JknC2p52JUconqahL/w9XZOAkMY4JaDLrCKOn/8ezWgHBwIWqXi?=
 =?us-ascii?Q?ukOa8/tYpoqDPOkDOV2mHUw46o8dAaODkIED7/frh6AviSAROhfkbpgwW2ms?=
 =?us-ascii?Q?TQITmXi7Gyt439PMSezwyZR356heLQh2Y3MO8b/eODhGpuWTCWVciY16NkqX?=
 =?us-ascii?Q?TMQOyBbWNon8YIsUF4EJTzPQRkCnl3T0BGzlg0NREgh0u9QTWqRhvPBHETKW?=
 =?us-ascii?Q?gzuuHcmMmwAhBBGmaUn2eflp0NUPUNXmFgXi6OZ31+UvHkYQzdVrR2FHkK+W?=
 =?us-ascii?Q?BG1ofN4bAC3RMoLXkwby5CwxDxHGLWL4IDvHtpx6lOMTgFLgC3of1NNat5uQ?=
 =?us-ascii?Q?jRkoiX8Iev6ujhFAHDcuePQVsp6lV36idPeScR3KpHvzAe9w7IiOkmh5WnJW?=
 =?us-ascii?Q?IJw2PpZD85/iC1wkassAMXBZMRc23kQZSt/l7pw2o/LyrwXCxjq3nXSqeSqf?=
 =?us-ascii?Q?vIyNFzYytIag+PcmjgNyfvo1dptvjQens6jRKOhFJ5guwtcCqV/Mmmu6fnNm?=
 =?us-ascii?Q?DFyQZ3YgfSucq8QpHwRxbyMmAzPrLJaKSynpq2exxsVAaVfywvLL9sxDxavR?=
 =?us-ascii?Q?OFCV6igXVXBpFDgUklpEr64tjyWC+WKU1/mPvV+jjSNagNQBwg63hI1Zezsl?=
 =?us-ascii?Q?GKDf/wkGSXW+Jze65QGUj03Q?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 194c3196-8778-4c10-3566-08d900145ed7
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 13:42:54.3832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hj9E9Fc0Fm+LHWuPhg5Cxm+lMbQdW40wMiX9cK/AMlsGQvM6by2IC2FccuKgQ6B04SAsqUtGuWRmKoOPByYauA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5241
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
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index b13bf8d..58bc2a2 100644
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
2.7.4

