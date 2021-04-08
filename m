Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A683C43461
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 02:09:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAB9D61245
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 02:09:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbhDHCJ7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Apr 2021 22:09:59 -0400
Received: from mail-eopbgr40052.outbound.protection.outlook.com ([40.107.4.52]:63557
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229505AbhDHCJ6 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Apr 2021 22:09:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZegNIAkK5qir9DLhmlGqwvdgo/F0xL+QDd4n+GGAeTOIuK/4+p8wwMyeUs2oJcyRDMexH0xKe0O6NP7w390Yoe7O+6Y4RRVlcC8Q/g4p1xxXXsPZUZJdcJ8NPrnDE32aq1cfiithVtyO8mtKBLs9sDOtU6x1I1A1YI3fFJNz3Pf+aoH+xXN4SYqcirJLC0kHQJrCqHm5lqMsspnHmMUTE7S+BvMPX/vm2XmpHRQ5NgAxLbEyw5Sea5ifqq27BtecUYgdf5p9UOwcMFRK7AHNZ1uYZx7NX0rq+DAlj7gMziN24/gc3qjiADaJacTSCseB0/D5YcRJwvAhXyVkoVaaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwXlKefmrLgWHF+p/zEssQIWV36skW01SSIYJ4rTNLE=;
 b=PmDfEawO9mcpXGv7o29W4VdWTiVNlYWjdCBDSz/nq5gCo1N4L2F/D2jAiO8joRZH4VRF0bfkdgBc2fNK5RDtDU5yVUJi1H7WjfWHLKFFTU0U3K+hLOwJUUDcPZ4FNZK2DYSYEfn8yuVhKmI4msMEYBjzyowN4PTrJdROn4WGyn+5alqi6o8M1PruXWBtYWfTyGK8SLezHtKtKJ+Nku3nuf6PtmKmlWCXXFa9Gpa/BoSCJHLV6Jk/PR2tL5vd2hMGz72aunTIi24Ud6si9vm2mAspdS3TzDqC+TuY87pjSpmpebWU5wBkYSitv/nACAR7L7PyZmSBA1ilS4aiTpoc/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwXlKefmrLgWHF+p/zEssQIWV36skW01SSIYJ4rTNLE=;
 b=BAUQwXT90fn2Uq7NVTLUZpSDEduk/dl3BRa9WZtEfdG6m7OJDcui4FG2am7wq0BESM1hFslQpXAVH5HR/zNfo5mEo3Rb5j8z3rOpFkE7bkIrcsKOIAEKyzgai60OF10zKY6YuSCbher+W7s7ukZtSXq1QYChax4MS/1lXXT2Bmg=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR04MB3128.eurprd04.prod.outlook.com (2603:10a6:6:10::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Thu, 8 Apr
 2021 02:09:46 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 02:09:46 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 1/8] dt-bindings: remoteproc: imx_rproc: add fsl,auto-boot property
Date:   Thu,  8 Apr 2021 09:54:51 +0800
Message-Id: <1617846898-13662-2-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4042.4 via Frontend Transport; Thu, 8 Apr 2021 02:09:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92bf2f24-c55c-43b7-a532-08d8fa3361c7
X-MS-TrafficTypeDiagnostic: DB6PR04MB3128:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR04MB312853683C55A4A7164823BDC9749@DB6PR04MB3128.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zQGPRfkv27f52Tm722infUcT7IIJOzaSwgYnHHx2Q2Zun2kHeSbmKyf7aJs56CGFXILEvk0MwqMfSiSVEI1IUx7nYOxOm5zrUlInHU2OeHWaz0EETfEeHSRpHGLhFHf2o+8PKycdFs/lkRpx3W2h1TOP4+o2gtlIYgsHu55hQEyC1ZzbjRaFZPklbeWpkgEKUM6XWc3DG21QftiYVnFEIxjlrJR+1i80HMUszPBjwot5c5L+5ViFd7a0o8WhVN4yMTgLCGy2ElFCFk/SA3XVMj4s494ADAM77Jx80waRRS9RlZZKtOK4OO6h6eDgaD1PLkxZDTOSXkZsbENGeh3NexAduo5gusPHy8REi3dNrqIzXLCIwn4vO6CUnz4bg9ODJq7x8OQzFGTQOWjwTnP0PSzBx+CAeGOTHbZm+ztGukRPxeNYgbnhZ+HAltWN+CMZZ2M4jBeC50KuwTBtTubnHC1epNxFO7IUJ8IycznL1hRNggGp1jPPwOidXX+QcbK79lV/F6mkqr5OGCpRLjZ8cJF5CbtJ75JhwHW8dt5IgH6DVDIR/hWX6W8g9tD/rykfbqq6zgeb4cgeLMNS+L4X1k4rijL+K5F0/bo+mwN4KSGVhMNWv7RbGISvP5OSg+Zbgfbg56xjsko4VOt39Rh8DdJCkwj9yQYVJXQV5gG9bKLngC82/Q/mMRsf3gBNK+CUtC/IgdWi/6a/43g1hfN1E+53kOtEeSV8CqVCbfB4nLQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(6486002)(4326008)(478600001)(8676002)(6666004)(8936002)(26005)(4744005)(16526019)(186003)(316002)(52116002)(66476007)(86362001)(2906002)(9686003)(6506007)(66556008)(66946007)(7416002)(38100700001)(2616005)(6512007)(956004)(38350700001)(5660300002)(83380400001)(69590400012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?sOEENwsmcyqDIlNO4piAcxAOOFLFdJIC4BQq6BB5vhZCNxRSlS7LsJf58QI1?=
 =?us-ascii?Q?rU5NTdreibVkloJRAYXQA8rD1bGunj/h1pSVLLZJzl1BOOCqCQbIc2SqUVL3?=
 =?us-ascii?Q?CXQjsxBHFy5IDF9sCs5+E674/7UqlIcygM6WoCIfuncXRqsOeP8NDuWcfKa6?=
 =?us-ascii?Q?iUHSVF2afTOi7SMHIfvRugAmBtyrH1rBSJWfh8yNccyY58q095OwjoTlwsi2?=
 =?us-ascii?Q?fxlNSHSprnNFBH/zDrMEfjSZ7mWzT+/xTnkVzIxLuYiQn2n0XNntIWW+1y2D?=
 =?us-ascii?Q?l1wpZZp4VPzE60iaOmFglDl1P+MKHCbdV51Qhmx62aqNFaf88k++5Y/ke4Ow?=
 =?us-ascii?Q?sqbSGiGZiHGcKgZIRPQZ62+YqIi/e4KgVuj6FxKqqwqi/SsmDSWfJ0P6qsKh?=
 =?us-ascii?Q?AMVzKUImpm7sAG6cBVxppHbQoMt/WzlagAVEyb6dTrW8wY4T8j9eWbiZ+0Cx?=
 =?us-ascii?Q?pKvpiD3AKxpQxGIoEuMY9eBBfFawcF7lmtq6zT2equWI+xiQj8EJegwHSjje?=
 =?us-ascii?Q?TF8OhPq5unifdLYcu93ui+8RDG+gAnI/rxHQsIvkYxq547AERA7+k49DCkqI?=
 =?us-ascii?Q?w5QBsS0HAp4nv+2hwvTq8hNoLvUYXLPQnz7Td895y9UGOcX8UD6n4FL1jaeF?=
 =?us-ascii?Q?yHAYXnCFJ98DRGHzNzmgLoJaNyCPcpM7FHWuYVX3pbEYhhm1R+vN27oEJSbb?=
 =?us-ascii?Q?0KhR0hs3ZFbZ/fNsK76GnROQCXjNGGQMw2gW6wgFIOC33mCvpgcM2itthZPm?=
 =?us-ascii?Q?zIF+u64swowm6Lw8L+tjUSqmebz7kQgYdpt9OOEids/HcF40ZN+md4LSVlvW?=
 =?us-ascii?Q?oBGNAPn+0/NXHkMDeplHGMZWFgytAcThmKlj7Hs7v5hQvEsvBJ6EXiOJ0ncR?=
 =?us-ascii?Q?8VgSZwpIjAzEjRcnb100I+OGEfO3L1lepgAVfEZ3H0pA+eKmiQGF0gCyKyv2?=
 =?us-ascii?Q?/KuAi6hzXJLuZdrLfoeSOJn0WvpKY+FFlQq4J6dYmS8LhGJ2lE4Of0tYDImQ?=
 =?us-ascii?Q?eId1lgaxt9vrNCvx7dQsMkhi69ZOnIPPONGWoJzFXWnTLie/FjX1oeeHIRUK?=
 =?us-ascii?Q?Gu7QG1SfznjLpRyoiRohvtsr7NkzlJKTaPOy6u97s4iTAjQDc00I/nGFpn0r?=
 =?us-ascii?Q?SapvHV1FTiXMwnTdJ7Yu+5RN2og00AuwnGGsSc2YGb9P+BJo9+Nva+D+f8Ig?=
 =?us-ascii?Q?vWvKDffq/MWQHIUAmUb6sOtei7uw2Scmuoha0LrMQb2+pG1usrypPuISxOBN?=
 =?us-ascii?Q?OOMpILMmDhC16lOJOsEn8g0JElWEPXkPshP9p5gZ2ESuF1NisIimnEF9vBxy?=
 =?us-ascii?Q?Q6L5XM3rH1JbBTQ+kC2LfMQhHDrXWv1b4UrJeT+/FLI4ig=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92bf2f24-c55c-43b7-a532-08d8fa3361c7
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 02:09:46.7173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VtrIz2sh8t1yGNJK12YVSkhBNlNreGm8rMBNVIeOTXoG9S+Z3VtjznV9+612rZ2d3Aj2KJR4u9Ke8glMUNuuqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3128
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

