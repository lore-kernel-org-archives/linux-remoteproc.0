Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6CBC433B4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 02:09:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E083611BD
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 02:09:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbhDHCJz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Apr 2021 22:09:55 -0400
Received: from mail-eopbgr40076.outbound.protection.outlook.com ([40.107.4.76]:9601
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229505AbhDHCJy (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Apr 2021 22:09:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YF5G+DH+3tHXsUS2ZGK5p7Qr4fE1QKLA2+IgGetUt8L+5rs7eIuGCKENws1/br7ktUTT1cY6BCP0ImADXdfbkNA95/xMTHUlCiRggxxjPp16C9k11JrwKcao960lzrHR2IE80V+78i+RhiHKQ0ASRyud/nOal9KHusoHmSfRwVJfxsvaKCspC5vfegxGwLjQ7G/5Xf0WJrUPSHFuUJ+rHb2LgCHursd2ws+12cTH+IKhKn+0TjtqgmbEvkJPlO3HZgqSPpwMpEAUoyYFdfpKBfs75NuBna2/q5sG5K8vvBmEDDnelkSeQvomlo0Cr0E8szDTdP6K3DXToibBlGXIJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGebRVhJLo7Axy1v4E2uejbKQ1JhyRJN+tD1L+44xBE=;
 b=MSEPZBkFFi8gpTzD/+e1OgYwJBdt5/z5xaIL46CQb3Xh4YFzMzDOeWcLH90V9PEoy5Sup7xwyU2qrMtee8adc9yTof3IuB17BF1nXuyzrcfACiOF25r96ZemE5ayx+h6e3lghMi8HqKF/jLOyM5mZl39e3LTiNx7FCuUENN0/2xuhhAdrJlDYV7l7+IAU2iaFmhl2+43pLKXNSmYhu/Ad97h2jMAK5ryVvWkp6+Ha1X5H/OKbfGZlpOcvCwbiAmfd2CWBSd/rxH6hEf6b/bu61Q2qTk9O49A/7zLvnEznEWukdsnRx8qUVIHEG/MJ9JBIZ87vHf89d4ZmnQ/1Vdqxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGebRVhJLo7Axy1v4E2uejbKQ1JhyRJN+tD1L+44xBE=;
 b=TozvyySffzd7Jctt9Tnb9qpaBWnm7Z4Vb85vIAVblsauk0Pxtztus+F4IxVGHDAiL2b/A2oYuApb2K533NlMOPQPadTJOd9Jf9cxFPJMpHU1F33FvE7uHWA4chNrtm9BBL/tAKVgQOgRospvh7NeVRmqOfuFQFyniIE2WBd5+II=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR04MB3128.eurprd04.prod.outlook.com (2603:10a6:6:10::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Thu, 8 Apr
 2021 02:09:42 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 02:09:42 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 0/8] remoteproc: imx_rproc: support i.MX7ULP/8MN/8MP
Date:   Thu,  8 Apr 2021 09:54:50 +0800
Message-Id: <1617846898-13662-1-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2P15301CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::29) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4042.4 via Frontend Transport; Thu, 8 Apr 2021 02:09:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e06edce0-b1d1-4a75-6168-08d8fa335f08
X-MS-TrafficTypeDiagnostic: DB6PR04MB3128:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR04MB31285A2C15D16E4A039FC5CBC9749@DB6PR04MB3128.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pGMgm78Bjkh8s8ZU7naloxPYTNtxs3JJpqoVdBuumMIVY4FbjoR89XNPqEo08bKtAFRP0ShJVCRNiTZq0j1Ob80zn3UwieSIOFWuf5iGxPcDb6hxH8G4rSUoXtZuMinK401n9uXdC7oJzfm6hUsmYX+nvrwDiShGGRnXvG3NfnSLtS++LJQAQzTtRIgzmG1upUg39bZv1bY7HYYGgSqGA5qSy4h7ma+snGUtUgF8n4GBTTyoBQBBBwa5WmeqRKiaFD0EcPHXeeAWgmTCQd8WXU/y6ihdX3WOntQJuDGiySH6JCO6R75zJb1NJNqPtjWaGbj8D7m5MTwEJYXD6o2o/ZK8D6zhGDcNX9VfoRTGOekxg9AEtzgy2nQoThxsrQd8elLyHFzfTXpAl8bYdTY0oTI1QGDfNdw+mtOs4/QBeaHHZEOnp219VRkSoWHKICDQuxjjrZSGEgwVElptdx02HsUR6aVpXSeBqMiGs7Ujn8sczHCFnhAoPJ/dI/NrFQcrMCQovhnW7/GYAZmNdEO/ZdFtiV1seoQdba+2th4waw05R6HR6mX1WefArAzxaVm//nNmuhgawx5tdgvD9OVXs+mYURS1FZjloHx8xxEIxeA2zPAFkrzHg0kx7IQpkZG/dsMVqNx4z0zz417BaHJYrYoAiZcdQZuLXuvU7nGWkhS+/et++FsfGYXMhqIxmBTpFNNWLtAHepOc5rZ5M3v0Q6qXUim3J3kaeuQ6CmXVjH40xoyW3Q0lUQkSxdCdewfzHOY+PtUKkTV4XN0x7Pc3NjDOy0bo5h943cjsK81YHb0/OCyr0L8Trflv0tRZ1yGU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(6486002)(4326008)(478600001)(8676002)(966005)(6666004)(8936002)(26005)(16526019)(186003)(316002)(52116002)(66476007)(86362001)(2906002)(9686003)(6506007)(66556008)(66946007)(7416002)(38100700001)(2616005)(6512007)(956004)(38350700001)(5660300002)(83380400001)(69590400012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8ZFsxMMEhJbpYhFTvPJ6eAg96isFqnq+uQX9bDIsf+/Hi9srUe8vMFW3QlWW?=
 =?us-ascii?Q?lGevEQFel29pvCxostTQo3jzulo1Ly+Zd+2/Y28EKsmtalMTpktv9KGsRvXA?=
 =?us-ascii?Q?Qy9EMEKuJaiPFhOdpbO/XxW1Stse8TI8QG/mn+9AeP34XBmkajUIB9IJFroj?=
 =?us-ascii?Q?6ZqtBzpGbXIeOdULrPRXztKYwHXzAKWbl0jUjW2Tj86+ni5IgidcZXl0Zaif?=
 =?us-ascii?Q?hSK6ZKwnwdANszZUk9wMcIafI/UFOTY+2QpF918IZ4566Rs+nPyfjKMLMst1?=
 =?us-ascii?Q?VkhRT4+vXJMgNnhNX2RnH7e6LvSV3OyS/1SMIZfQjHlFxrHqc4nRGk+522gW?=
 =?us-ascii?Q?WkA1VVzob5aYl055QS0bQZo04Aga8l/fjOM1BvfcTjEVDRNtiaA7HH+8cvff?=
 =?us-ascii?Q?X+5BF/bWNz2BHs17Xyd76/JwSWc8+qu6xeScOK/Wok+zf8ktas3W3D00XaPd?=
 =?us-ascii?Q?eWzZDG46AC2zpcdUAgW+WtZhRsagE7b085pww4DiGzezmwvfmWOUPvFiJ1hV?=
 =?us-ascii?Q?2pJ6r85YNvCXU76qcmMp5T2uEsCk+spHfpstIpC+C7yCqjNuerj8oAjkASgv?=
 =?us-ascii?Q?pX4XA1SH1/UOivQHCluTTIzyCKbHa+dGqzPIrGZFNfD26yTlVOqiM7mZITe6?=
 =?us-ascii?Q?hn7TlVT1a4j8lGWM+gA0E1/qZCp2hCX+QK+PXEikRdCy8xzFJmw0cZXTclmR?=
 =?us-ascii?Q?xZcnVCIH36HxoerT1J0047xKTpW8n+8VWIzLhAaqOZ8U8ZJLKAzznzbDthsz?=
 =?us-ascii?Q?Zc6lawP6J0zeF72TsiuwYMscmJmAP0yhx/M5roE4cK7JkB6PFGShfzo8m7Nq?=
 =?us-ascii?Q?wkfd0mg5vRdVaIkQlmq9G2udAflm29DTlkyif3A8e8zSSwJ1y+t0JGLCoxBZ?=
 =?us-ascii?Q?6xGumjz5wXf6BqBrBZMYQcTbqC2Awe28kVMBQszKMf5Ra8DsLvh6fJz8FakU?=
 =?us-ascii?Q?8jiMNW2qEYK06lJitp0kVU5lJ0Q5j6oJRVXGw00zdyQq0VnkO3UhcQOBeod/?=
 =?us-ascii?Q?4uDApbEzpbcPeUZiet/nMCgI5G2DrYJ/nvwBt4bh/r9w4vBlvhTcSvWANqFo?=
 =?us-ascii?Q?35VK+iU8+rcTrRkbXzCZpqkiaO0FEOzizwjyMVL+hN0WO03GNgP+1StmM9C/?=
 =?us-ascii?Q?JiwB55WHvZlJnbSvFp8n1qvmTKjyCE5wNaRb+ZKu1Q1Uqxm4eh9ktUB1kL7r?=
 =?us-ascii?Q?h4vW1vwQrE9Pm74EvAwXPVUSChEYrp192NM6z1AZUUJ3ay6gReGG8wYVrWhU?=
 =?us-ascii?Q?u2yl3eOt7Mvdpdl7vJ3kDWYHQmnheIgq0GZMxzOJJXNocMLTpnS0UKBbUSwP?=
 =?us-ascii?Q?1tqS/QBEl4qbxd0UQgM4ywM2zCC8bltnRqxBpRWX/OLtmw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e06edce0-b1d1-4a75-6168-08d8fa335f08
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 02:09:42.1704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NpzPJgkXHBYzbKRNy36LVpFTRVbNGH8JGVvzoVKt+/A639/pFKDc36Gs1k5DI8P58RhJO4Iisk/+UK5Q8vmIXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3128
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

V3:
 Add A-b tag for Patch 1/2
 Fix the checkpatch warning for Patch 6,8

V2:
 Patch 1/8, use fsl as vendor, typo fix
 Because patchset [1] has v2 version, patch 5,6,7,8 are adapted that
 change.

This patchset is to support i.MX7ULP/8MN/8MP, also includes a patch to
parse fsl,auto-boot
This patchset depends on [1]

[1] https://patchwork.kernel.org/project/linux-remoteproc/cover/
    1617846289-13496-1-git-send-email-peng.fan@oss.nxp.com/

Peng Fan (8):
  dt-bindings: remoteproc: imx_rproc: add fsl,auto-boot property
  dt-bindings: remoteproc: imx_rproc: add i.MX7ULP support
  dt-bindings: remoteproc: imx_rproc: support i.MX8MN/P
  remoteproc: imx_rproc: make clk optional
  remoteproc: imx_rproc: parse fsl,auto-boot
  remoteproc: imx_rproc: initial support for mutilple start/stop method
  remoteproc: imx_rproc: support i.MX7ULP
  remoteproc: imx_rproc: support i.MX8MN/P

 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  11 +-
 drivers/remoteproc/imx_rproc.c                | 170 +++++++++++++++---
 2 files changed, 159 insertions(+), 22 deletions(-)

-- 
2.30.0

