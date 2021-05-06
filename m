Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFDD5C43460
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 04:24:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1EDC613BA
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 04:24:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbhEFEZx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 6 May 2021 00:25:53 -0400
Received: from mail-eopbgr80082.outbound.protection.outlook.com ([40.107.8.82]:9806
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229622AbhEFEZx (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 6 May 2021 00:25:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUgJqFzXIttvtFZllCAiNF522T1O1eZOvVnUt6iOI6DXzMNq/f9HGKQ2QvZdFuD61NHa7S+fIjnYUr6SPrB3NWzKjFuVyXQKPZqYzYZ4RaTX3XeHi+eo5dZlrrYvMps18EWYoVJ2FvUiB05bIs77XkIC9eH6kx9seXR4QxbJSgrcgDuUKJyHR7N1gsjDilTVi94PBRg+zUAmNkemD/parD8lGCXkChSJFwU9duAKVrFuYxeOx8LEVxZvE6v2HiEL477DHYKmSozDg2cP1BkxJjtZ3uSIYoSum0trUciu0rGZlHgbhQFRk6I0XRH0one3M5M/rhyyoT/VXCQY5UpQlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdgVcs4rOB/8ql6CSDDLwSkqxj2vSEa/x+8Ul1ZGOk0=;
 b=gpBLcYpycqOR1SEzryoS8K7Blt9we/ab0r9hp+RjRcuhCHiKiwLwCUZozYJeiuskKg8fOeclMA/790HwKTZ9k18XgOXjNjzlJyb1MnKTNLDkNemdTiYNhaUtEOFQgL25TUYO/8+P1S7XNdD09lz9xZtSY8N/TXDzJxa/79NAF1m+MCIFP5n/LD07QQHoYFcPf/zK3nppyag03+euFcR46xRV/gD+3kjCSlz/48phrvW0asxHOFNLUeukz4coSeQ6Kg4GKffktuqRkq9Z6nFXzxNQ2c1LLrdtrDhtC5jZUDx+yN0ZXjKZmoOpuF5GdVgZpzDms0HThBA7CR+Wj+GPew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdgVcs4rOB/8ql6CSDDLwSkqxj2vSEa/x+8Ul1ZGOk0=;
 b=idKKhfEAj0Rv6mjib9ef9nCncuO+5DmuQeDc2kGp1BoGiCTqB1zVKKVNut1khZRyB11Xj7nEpDB9K/fN6pHkH8/fkoopNNwVvuJh8GH+u83lR00EK1CyhNNWim7nNBp3ghVQFnEdXMZ/cgF2JsVUZcneDvzAkbAUBAeTz3p7PIc=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4940.eurprd04.prod.outlook.com (2603:10a6:10:22::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 04:24:52 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4065.039; Thu, 6 May 2021
 04:24:52 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V6 0/8] remoteproc: imx_rproc: support i.MX7ULP/8MN/8MP
Date:   Thu,  6 May 2021 12:08:35 +0800
Message-Id: <1620274123-1461-1-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:54::19) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0055.apcprd02.prod.outlook.com (2603:1096:4:54::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 04:24:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01e1a697-2c03-41f2-e85c-08d91046e4a3
X-MS-TrafficTypeDiagnostic: DB7PR04MB4940:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4940253AFC041C8EAA2DD305C9589@DB7PR04MB4940.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ttgKuM4javyv2I28duvJ915cviTubeYrUucZNOVo7UhUovYf7FSv1WjlGCiTbsH0chBHJeUVyAbxmg43AdeLV8TtNjXzZZFU4CgJTukqv5ZvMR1IBZQjBN4z8NAGLGNNaEdGi36mYhc2gjZIqXXv1OxLLhYSuQE3qPSMIf4HOJTqBiq4JFSI2uSHUB92o0iyL8JJMJt7P7jxWB8s1UtSkD0VB+egJQCCEs5T4GybdxDjcP9diJzz5sMLDeIoCwMuO5FtdCoS056yU/6/gZiI+xOmnWjaF5YpgdsY12WLcTBuKYjay71EbU+pWh+LQN+sdkAfBokY+04izUxlX2AAPPq85fBXju50Cx3w+7VcVca8UgF8bQw9IFLjshOMf0IEkIIbnc+BtsKQUo7fcN9M2rh+O6TL4d6jNLAKPSojAQ4h8/SjQwyAr1P3xmEYqvASudZfnOv4h05NZv/0B24acrpKXWnMtnHsWBUAz0u58jxUvPx/i8gZ6db3rEHjdnukkIq9kdtuF4yfGHH2sCnga0hcrQNyet4C9GpYz3E+DCEHbo++p8JVCZ/EtRDigOmD6CVs12XKxRTKg5I6oLUb5Wj17guW8LPIVpMLyITxtNhBmBXnxFxYp3tF4znyo3IRYMCxAY6YzaC7F4pMid0OumrXZrjvAxdYelU/I+WzXfw2K4XK5u4U8JUZJKORZZB/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39850400004)(6666004)(38100700002)(38350700002)(6486002)(7416002)(66556008)(16526019)(316002)(478600001)(9686003)(2616005)(83380400001)(2906002)(186003)(8936002)(26005)(52116002)(66946007)(6512007)(5660300002)(8676002)(6506007)(956004)(66476007)(4326008)(86362001)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5dHc06JVXTCHYxCK8vaz2ttQN0urFVmyIIWUnkRUIvOSkn3gcm4ftG566fiz?=
 =?us-ascii?Q?ZEUDEpkMyeBRXWPVQU5v0EuWTrDFHj2JL93LdrRP1f+MEkkVCVXNFJi0+bB3?=
 =?us-ascii?Q?y7ZApge2PMZqIeB7bi0GqsPECIUjCmjfW9o+TsUIYSibhfLDZQVWWbr2aMFQ?=
 =?us-ascii?Q?FToXNN/hsiwBE25nFGcz2EjPcpjQVQNxTDJUhNwB6eOl+CWf0RR4dnXswlsQ?=
 =?us-ascii?Q?BIJ3FCngSHLsZBt+0RJ5Xilrgwlo/ctudrESOhzfTmrH3mcuhUOl7nFhneW9?=
 =?us-ascii?Q?uSB1YCgAhzjxCWHd/A9r1Grx439PSBqfYZJ+CpwapM9KqGNjNVLh6Qj8Zg6z?=
 =?us-ascii?Q?ax0Adu47rLRwTOh+knhxj6i0fhCGMwQNt671WjSEKjyUeHmkHJZf5wPJEgDS?=
 =?us-ascii?Q?+SmnkmP7U+51FAD5RyIftUqEdVZvILfgSR24k8Tgss1PBKazqf2B/SkPB5Hf?=
 =?us-ascii?Q?C842dV/i3+Y9WX/4LlDhLXvsD7aq4D9AUyuy4QOWlCpwQhJ1l0RYicfSJ3QE?=
 =?us-ascii?Q?TPyQBxFvBHeRAhI1vEK9M0dLJHKxmBpoCypqAcGbmEPZ4s+kR/Y8jUz/8n+s?=
 =?us-ascii?Q?ljErO02PWeXULnZXfI0suOZIvFqd/drPKnYgMaSmfICvoebMIN6cH8anXNCP?=
 =?us-ascii?Q?z77rgXPVAh5PnsWyRCG/GjD1j5ympjEO9R23IYmmWfkPSxHkXqCUD6R8Jxte?=
 =?us-ascii?Q?W5Fh7x4cdkLMzbcx2IP4yIDkwcsQRL6q/H43i91yjZU4PrecQ4suMens3OY+?=
 =?us-ascii?Q?X4fA8L9z0Bjy+Fk7jSuKICZyu+L1/+RxfMh+0tuBmLpXqhEp9/qYZcMohV0P?=
 =?us-ascii?Q?7LryotPCJ9RYIV9+/r9tVdKGpQwW6SHqD7eJ+4IFEzr46+HOufdZRHe8ji/i?=
 =?us-ascii?Q?K180xKmSPuvDcbaovpORoFdOjfok/LPXPOIcGmVFV9EfPXWkjyCeCb8pLYTc?=
 =?us-ascii?Q?unM+FC0eJbDGkmaRIYw6xAtwRYj4utJMIzKGrVXRer+wGl4Rkd+WgTjN2Muh?=
 =?us-ascii?Q?ml+SwcyerfUVRb1mSAzGTkdspkdtSk0H6dmYBFG8kEYJ0yspf9rjPSeSElxR?=
 =?us-ascii?Q?ARJQTYZcu/bRIK0PR4BIL8QOBYnFA0vn1GOZYdMTw87QzY2tFYgHYQLTqKqu?=
 =?us-ascii?Q?PSDlFjdjB0vlgagFpBHqbXanhuC9GwPrxi9hH1GsruvsuFT0whM6+yY7mkIB?=
 =?us-ascii?Q?CH4/63HY/lRDnU6uAVbva1v5Oav6nqxHfrLZkl62OGKenhz+83vvkGTA5Y4M?=
 =?us-ascii?Q?wgkKh39b60stO6W5lvbtrE7+YjdLnzYdjdX5R8/1XlaAvPD3vfV3Lfm0sJVc?=
 =?us-ascii?Q?HCd52i1j2i2mGnVnObOjHyya7Ucf4KQgwlNbToLaZC8gpw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e1a697-2c03-41f2-e85c-08d91046e4a3
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 04:24:52.1826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5YnMl57qe57TORmn3ZyAfS66AhGHerldOyQZuxCGs5cPvCMYE6LxwpeumN0MtN9FdyWyKIZHVvvAx7cifD6Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4940
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

V6:
 Addressed the comments and add R-b tag for patch [5,7,8] from Mathieu, now
 all patches has got R-b or A-b tag. Thanks.
 The patchset could be directly applied to linux-next/master of 20210506

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

The dependency patchset has already merged in linux/master,
so no dependency now.

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

