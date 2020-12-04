Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C56C4361A
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Dec 2020 07:14:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DEE120639
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Dec 2020 07:14:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbgLDHNg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Dec 2020 02:13:36 -0500
Received: from mail-eopbgr60075.outbound.protection.outlook.com ([40.107.6.75]:2951
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725550AbgLDHNf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Dec 2020 02:13:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOmQ50YPgEPpFkeWqXgLppNr5hefYn0S7JRx2jU4mPVHnMg7O8ymbR3/2wjGjfe3H0JR6qSji2qluxIqY4wuyMtt+NWbZtwYE1LnBzqXzOVFkZ/wxsXHDekDrq9oVGOQ11cWR93eDG2iH7zjSytyKp2/IvddqozgyK8iuhgb25XYgq/aBre9iNrjz5pMsd+KsNEOV5nvnTUWH374ntvPv/rKM+22h3Do+2aCHX3aBYHtg+YNTN1OjySCBBMTOReiV5R8iY188aCc19JHvbV16mIp2a7LlBGiOrMCxkPBJeeaOJxy6ND0FnzZms2m0g2P3WtGKtscNi6AtzrGVHwViQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqHu5y22V5asq3zuVYCgJv2DOL3bKthyVe5hf/9ok84=;
 b=KNOFS97ZaKvvGLWB4Vnloq6JvaZGG8JzrSLVazSgzeU31bXAPu4O2pemaYVf+cx/nWCHPk9NmoFlUrisVl/Du7os6lgnH1h6bj8MVxQ9bZFBPqeqwHzEcqH3fF4NkA78RjHnScozvBe0AFQxPWHgwhdTb9vbyWzZSulh8dfbQrPaTKCrA/GdVC0cFDv+qI13Fp9Qv9kgC11aovTmt9V0gj9tzBY4EYQs9hGdM1+WWA8JzdjghHLWD1UMPcjy6Wedkp8MPCnIsEbdAzDvNE6w/S3LDl+B6rP0awC7AnOTNdNr+EgT1JRnICJyWRaGvFGcuZ6rcTBSQVuQiGtL/Oa3nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqHu5y22V5asq3zuVYCgJv2DOL3bKthyVe5hf/9ok84=;
 b=GNdOaMOZCxBTN2ya4QGmjfzDQsr0AflHKJqT08NWgLcG7FXLV1t0laZxFbGvNfJcstR98mh/0Jrk/IJvYUGTVzLiXp4i0wKkifX+FGu3OyFFhEtHmEAFrrAuqqWUO+tYnQNjTQhCQ+Kr1BFQsul0F5HbDAGfEGEq+enasBAmRDQ=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4633.eurprd04.prod.outlook.com (2603:10a6:5:36::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Fri, 4 Dec
 2020 07:12:45 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3632.018; Fri, 4 Dec 2020
 07:12:44 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 0/7] remoteproc: imx_rproc: support iMX8MQ/M
Date:   Fri,  4 Dec 2020 15:40:29 +0800
Message-Id: <20201204074036.23870-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: MAXPR0101CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::31) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by MAXPR0101CA0069.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Fri, 4 Dec 2020 07:12:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f7e44ff3-3191-408c-fb5c-08d89823ff1d
X-MS-TrafficTypeDiagnostic: DB7PR04MB4633:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4633D9D646E88D585D86DF8AC9F10@DB7PR04MB4633.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +AIp87Ilz/J5TE5xioLIdk/KeUZ0uAKr5ICTz0p9dZl94Q8rmISIw8Nm+Hn78LnUVbGFK4VZobUiY4lIs3zdKrB1kSxy034BMzkiiO53k4eGcQT+ffF4mwxwRGYjuU/y1XmQnzvHpuTF1PsJsTg/6GLSjiTB/xqY5xxhxwE6Z+WKKihumEZCxbkQvP0wenwNNJ3O/wAlRFRBDFDxsxaRUfQq1mJOU/bvao/wNELIvP3+cGFkYVFuVtVZYli0oov7XWWA0USp9stkgSinRDKR/hFEdceNc9ahtoDzwM05MnwwW34EvuPaxzfprsXYXwEfiKsVKBHpX4M1mI0LlzxkTMLjesJpP98Q6zhrVnHAa594NOHqSQjs7xfp2oUXIwNdw5iE2b2QRn9T3TpdepEDx+T7jzOEOy3K5oLzde2BWO1dMbqyqjQZm/FpqS+5PhuAgJo+DLpqKwn1wlf/28tpcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(2616005)(86362001)(52116002)(6512007)(7416002)(1076003)(83380400001)(66946007)(966005)(66556008)(66476007)(478600001)(316002)(186003)(16526019)(8676002)(956004)(6666004)(6506007)(2906002)(26005)(6486002)(8936002)(4326008)(5660300002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3oCNczuwgeonmdzeua4eHK+SDyse15UWF5RFUrNweIF+xFVBes/m4sUTABqZ?=
 =?us-ascii?Q?K9Oy62CRECUTnXVANUq4YPe9MmEP3cXHgKHKWAlp/y6M1gDnqOU/mU+lNqZM?=
 =?us-ascii?Q?/tLJO4E2uZ+AX+CcVh8lkciTkZT92yOnracuaQwPTnfZReTKnDOht1huBCLI?=
 =?us-ascii?Q?Ng5MYyvRdLmdcL6bwSU78xw2vdtYASxo4PIvoq6q/j5gj4hczL6hZOQk27Qh?=
 =?us-ascii?Q?c0v5aXqFx/UEDTA8UWuqzbZBDHT7hZT6uH4KHemxfcNe9vKi56V2GIBFAyyG?=
 =?us-ascii?Q?kAkbhqvtuHf3D8auTw+Hze2BKswjmAQbUP2ttP22f6J361ni2PBsndFgsFmc?=
 =?us-ascii?Q?nvRWTRuDMd8TXYA2QNrj1681WYzxrmo2QFEdAEQoOwGqICxmjTgnHE69UWqs?=
 =?us-ascii?Q?5WWYP0tScYhzsNIQfZyzXM6P8O4zTRSXxpNdfd7rHTwWyGB30Ll2gUSfoXnf?=
 =?us-ascii?Q?1irxsjmuT/rEzDfac/+a/urM//hJD6wazNVSdYqh9GcjWy7d43B5PhmmUSW8?=
 =?us-ascii?Q?h3ltMgaacbrf29xlOCBNAkA9uaZ/OALwWcRe7SUfK/VwI0mBKqbArJ/uVJ7X?=
 =?us-ascii?Q?fR+rpVar01jxU9SklNHycRmtzQATDoVegpiKOXOjls1Hqg7yg3mg0kEsiOiO?=
 =?us-ascii?Q?JBfLeYTJKZ8IvItJs3hk3VwbIEV5y7IkTVZT5vTB+vxhbFT7aDxl+tBqMmP4?=
 =?us-ascii?Q?/cpZx9Ltz3NzD4xzncD/cDVoyFuMkIDiiESuLGGnRKmAalHvCtJ18ALUWAQ3?=
 =?us-ascii?Q?krZEbTwtvFApriljotqA8Y38TuTElqTC1OF4en/VsqnB2PRvC2ejrvxlStS7?=
 =?us-ascii?Q?zMPD8y7uMJczIXSJKC0SfEQ0/eisLcIPtw2DiPEQu6/UxRXdHiDVj2l8VO3/?=
 =?us-ascii?Q?EmS8/dzMWSGHOnnNGyYNQzFbMh167xh1Nd0AT4gUJ1Pwh3dk3QAJ4ft5QHGr?=
 =?us-ascii?Q?XlcErkuxxxr/Z+vPv9tRrlFY4bIvIB+DtGge4D5T+os+BhSh26nIPNbja7LD?=
 =?us-ascii?Q?pv7N?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e44ff3-3191-408c-fb5c-08d89823ff1d
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 07:12:44.9235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zOpuBE1g6m8qV+PYPVGMTnJgNlsE3oZOaOuxihyiDIV+hbRNKNYyvD3K/AntAtW7QEDDjmUIY1HjUCgOmqdAFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4633
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

V3:
 Since I was quite busy in the past days, V3 is late
 Rebased on Linux-next
 Add R-b tags
 1/7: Add R-b tag of Mathieu, add comments
 4/7: Typo fix
 5/7: Add R-b tag of Mathieu, drop index Per Mathieu's comments
 6/7: Add R-b tag of Mathieu
 7/7: Add comment for vqid << 16, drop unneeded timeout settings of mailbox
      Use queue_work instead of schedule_delayed_work
      free mbox channels when remove

V2:
 Rebased on linux-next
 Dropped early boot feature to make patchset simple.
 Drop rsc-da
 https://patchwork.kernel.org/project/linux-remoteproc/cover/20200927064131.24101-1-peng.fan@nxp.com/

V1:
 https://patchwork.kernel.org/cover/11682461/

This patchset is to support i.MX8MQ/M coproc.
The early boot feature was dropped to make the patchset small in V2.

Since i.MX specific TCM memory requirement, add elf platform hook.
Several patches have got reviewed by Oleksij and Mathieu in v1.

Peng Fan (7):
  remoteproc: elf: support platform specific memory hook
  remoteproc: imx_rproc: add elf memory hooks
  remoteproc: imx_rproc: correct err message
  remoteproc: imx_rproc: use devm_ioremap
  remoteproc: imx_rproc: add i.MX specific parse fw hook
  remoteproc: imx_rproc: support i.MX8MQ/M
  remoteproc: imx_proc: enable virtio/mailbox

 drivers/remoteproc/imx_rproc.c             | 290 ++++++++++++++++++++-
 drivers/remoteproc/remoteproc_elf_loader.c |  20 +-
 include/linux/remoteproc.h                 |   4 +
 3 files changed, 306 insertions(+), 8 deletions(-)

-- 
2.28.0

