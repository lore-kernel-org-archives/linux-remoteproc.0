Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96A9C433B4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Apr 2021 02:35:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76F31613DE
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Apr 2021 02:35:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234634AbhDUCgU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Apr 2021 22:36:20 -0400
Received: from mail-eopbgr150040.outbound.protection.outlook.com ([40.107.15.40]:9030
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233939AbhDUCgT (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Apr 2021 22:36:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QePhJknhxIc1qiz5PfIHZvsaS+xmIWmSgQ5clumSKxzzeYL2uAdwQWax6+rtoAGWsJGBH+kB+H78yX7ZWmGnH0KQ7IbtCvx7qVtKDB8r0dlVngLwqVADeq6oz8YRq/P/4iJ0BunL+lML5KY3N7CNvw8iD7/bDmXC0TvVuMXBfqGl86Li6LM3Jl5izDAEsND607bN4nRO1xBLtPkWP5GZ8HKXmp6gOouYYrlUb0kBea4T3T7oCeUIIdWXrW2ytGUeLXzFhyZRYFygueq3dYlRTyGxX2ue83//uSkKmZnKJlsdx8kVqG2dE7sZ44u+ffz+SgPaMTOl8MUcIaasz/+Eqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wauKtxitTzJAgFvAGmLr1zGQdsrsNY9o1uVZjC4OEKs=;
 b=EtaM2aWtLRZIeeNnCMNDaJb/ZHeq6rQ9qqm56fiAC/UTJA7dWVtFsTMOFcs2VNYqbY+iwBXC4U8JwcwBqtIT6HrcuudHeYr8UvKcbdvnB29jWN1OW7IuXZet4uF1gm2a5G3wwZPScd4vbAvU440+4+SkOi0iDDa9ctPsiAwsSqvNBrq/cUYvIkf86oXU4TqU/9r5yC9iKQvy2UeS/uKpRhOZjlztPw+BqIMq5DNKc47kuROJqsSkvoHrI3miiD7HOE/FrrHmo6AIw8uBhUq6yCUcCTxFQWR8lhJs6h2E/qLwOql8NGGjKOCA5q39LK/DkrbTb2yxIDRwnpkNMmWW0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wauKtxitTzJAgFvAGmLr1zGQdsrsNY9o1uVZjC4OEKs=;
 b=GrNvsCRWddpVPtCAx2hcBXneIeWX4v6CpmzOToBhjaH7QDhmODwBc7UyRUs/zJvidbphaZX6/QfWsz2a6i/we3Ez+I9rn6Qkm1hbyV/CFfOaVSF1+sLzsSQsrcrIF0iacSNw7teuGOiBP/BgVJecVpOpZZsCMDbv4Rid8oBRJyA=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB9PR04MB8313.eurprd04.prod.outlook.com (2603:10a6:10:241::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Wed, 21 Apr
 2021 02:35:45 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4042.020; Wed, 21 Apr 2021
 02:35:45 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V5 0/8] remoteproc: imx_rproc: support i.MX7ULP/8MN/8MP
Date:   Wed, 21 Apr 2021 10:20:14 +0800
Message-Id: <1618971622-30539-1-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0204.apcprd02.prod.outlook.com
 (2603:1096:201:20::16) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR02CA0204.apcprd02.prod.outlook.com (2603:1096:201:20::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4065.20 via Frontend Transport; Wed, 21 Apr 2021 02:35:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c397cc5-41ca-4e4b-5439-08d9046e29cf
X-MS-TrafficTypeDiagnostic: DB9PR04MB8313:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB831385C3CFB908BDE13CBE93C9479@DB9PR04MB8313.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5n31hZ19RvtONGtFF1jRBD7o9/yYO6c5d/n6xu8jFZMdCBASeyG6CVu2i1xuyxE3w1j42c3R5/EbZ/4ybGGO10Tw3ruwkY0lTIYNAvDPW464EFkr51f4GEY1M6q+GwfaGx9XfhlRdjlqrIwWhryQlWt42PHgn+6GEZNvUoB/fDIWOf8x3d2rAlgd/+q3l20b0k0B7beQTpTzsqWrXWQXw7x8lae6bwA9wv7fTZw97Sicazi+K+thK6qBwwsXlSWBUe1Yr27vG15MvlIsATX2KujB0bIo4oaJkm63hQn0ysewMlSWTlrSFhaCdhoRGt5sUI1djfsOJ971Isi6VFFIv5H0oDEhx9k078rYUkKJneUZSC0O82806lfuQgOJLL3tNDKcXbxvB0eCSJMDrJOV2hdjE9Q0dM9Hg0nfZnodyDDPD+QQICy7/8noRIalnGVmcLVUP34G/5Q+PL69hqb/tHoxk3Yr1fbgsGmi5Bscw0c1VncyYBVpjJkYL1DGWpTz+BJu1PrY73m3pLWXI5DgS/zVYMIO9X995V4Xrn/1j8ymVGa0HhI920Xnq8XpvelUW+GQM1SA6EmstbPMQtvl4ZuGrU4vbQitr6PQfzARyJgOZgmomqNJAtqcvs8l2LhmToZi7bHjqUP0mQa5daF8ByAMVHbj8XsExxN2D3iD00hzQX7DKa630gBQABc7g0Cs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(38350700002)(26005)(186003)(38100700002)(66556008)(52116002)(5660300002)(956004)(4326008)(8676002)(66946007)(8936002)(316002)(86362001)(83380400001)(6666004)(66476007)(7416002)(6506007)(6512007)(2906002)(9686003)(478600001)(2616005)(16526019)(6486002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?F5dN4cbjZteax6qo+aLA9yw6iziT/I7BlRUzcg/2Ts1ScfkOOO4XjfeIz0S3?=
 =?us-ascii?Q?tZhGSwqFugy+WGoayKeCGV1YxUgdlOM14vaX0EcAo+ejTRqVBQQQrxNna7gm?=
 =?us-ascii?Q?cwicn9G0JZLFzXuefsMuBM+8JafDLMlGY/KLu3okL3kd7k3yRXbN/rFNPjz4?=
 =?us-ascii?Q?Yf0nCB2IpVaaCRQm3cB+ktJHyuZ0x4GRH3TYrBzhDvH94ZpEArqrcYetlyrf?=
 =?us-ascii?Q?BUtjjLqZsLnuhUd2/+LKKhiJxK7gpxd3gcFH3f8L6c1JAsyXkUH134X/ZEeU?=
 =?us-ascii?Q?Qn8NRkx6RPfhu2ZRe6Nb8YUWlC0eljz6AJTce/cs0WaKUduGEyjTUM8TrqLl?=
 =?us-ascii?Q?2EKnX+RnoJw6hRNhSq5/4qBPk7h+uweO9e4rf6rWDHmKGMIWM4r+nPED06oq?=
 =?us-ascii?Q?BSJfChhuOyPF379PH7mRHqUE/uNlZwjH6j9p4WGdpUJCEsPLiUCW/q/nv7Ur?=
 =?us-ascii?Q?14PZd276d2vc70Wn8avipSO/AEYqY0whYqECZZWewRe/2HWxpRBzeionoi+B?=
 =?us-ascii?Q?52ly6iEw4MDALxckcYvtnUPOAQNilFPAcLHRaCxM8obsRpKzA0Bmx7Jh+roS?=
 =?us-ascii?Q?voH1JoSNAr36dYgRUT/Nb+KYJwVUBcIl8zZaP1NeBnVylBPkNmCYs9sR0TqQ?=
 =?us-ascii?Q?nS4pACYNA2klTsiXc8wGfCq2OpvlMIT/FIvgSAU1NYZ9sGkwhKENYst9EHIc?=
 =?us-ascii?Q?I6DOSKXzuqf7s+5vC5QQaLRR3EDf8+4ZsbcPk4vRp2Qp5R7fbbRqnwPUiWle?=
 =?us-ascii?Q?O7+VYq/cHiAYFJvWIwNdC4hZfzGd/KsdyHnB5Gru0c7zYCwFJACCqYykw+Wt?=
 =?us-ascii?Q?apr9YGF+o8tqFGGHxkBtTxzCSmuzonH+1Ig7uYHfqzkMxFDTGN8tOzv3xRvZ?=
 =?us-ascii?Q?zMGteJUtDMTCqoUMYLVOMeRDROSJCk0zgw/bUAC3eDwmVKT8qX+QHKcBEmak?=
 =?us-ascii?Q?UvhLAgbpy0R3KuYKBp/+P0/ArtxiWaxw63EOvWUErDN3dzNHgS/4/+PsjyoJ?=
 =?us-ascii?Q?qTxYrUMEN3z50XEBFQ1ferpDqPLUJhwP7kmMDKu7riWlOvG1p2XNeYPMcWEj?=
 =?us-ascii?Q?6HoeBdsh4CziGi1oP6M/loGTsXYjSgjCJvg68oouJJcX5JuuS0k37iSOrdw8?=
 =?us-ascii?Q?LckbmVc+NghR6atUs4jxJ/WPOjF5WB7wXg9YFNQZ8YNpiKzQC33UdrV2arZF?=
 =?us-ascii?Q?arNNeuF4OYPV7lFhiNHhiGsStKg6ptnXXIYPX70V7Aq2MM2UoI/yVO6MWtqN?=
 =?us-ascii?Q?Yc+mVYcfAkh2lOinRQBPatCyK0Ia34i5zJzhM5jAdOx9Sxdywy9xUSECFww0?=
 =?us-ascii?Q?kWGi2zMPcyPvEHoi0QQKmkco?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c397cc5-41ca-4e4b-5439-08d9046e29cf
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 02:35:45.0519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RAqmRbknqBOeIxuZZwHuvsSg5z5JOXlHeGaDLy2L2xbijUSDpT94gwcWJogSOMOWR2EyBBFbos8EVgKszWzrjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8313
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

V5:
 Add R-b tag
 Move the change in detect mode of patch 5 to patch 7 Per Mathieu's
 comments

V4:
 Typo fix
 patch 4: take state as a check condition
 patch 5: move regmap lookup/attach to imx_rproc_detect_mode
 patch 6: add imx_rproc_clk_enable for optional clk
 patch 8: use switch/case in imx_rproc_detect_mode
V3:
 Add A-b tag for Patch 1/2
 Fix the checkpatch warning for Patch 6,8

V2:
 Patch 1/8, use fsl as vendor, typo fix
 Because patchset [1] has v2 version, patch 5,6,7,8 are adapted that
 change.

This patchset is to support i.MX7ULP/8MN/8MP, also includes a patch to
parse fsl,auto-boot

Peng Fan (8):
  dt-bindings: remoteproc: imx_rproc: add fsl,auto-boot property
  dt-bindings: remoteproc: imx_rproc: add i.MX7ULP support
  dt-bindings: remoteproc: imx_rproc: support i.MX8MN/P
  remoteproc: imx_rproc: parse fsl,auto-boot
  remoteproc: imx_rproc: initial support for mutilple start/stop method
  remoteproc: imx_rproc: make clk optional
  remoteproc: imx_rproc: support i.MX7ULP
  remoteproc: imx_rproc: support i.MX8MN/P

 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  11 +-
 drivers/remoteproc/imx_rproc.c                | 196 +++++++++++++++---
 2 files changed, 173 insertions(+), 34 deletions(-)

-- 
2.30.0

