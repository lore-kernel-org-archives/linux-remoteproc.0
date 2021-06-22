Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5061EC2B9F4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Jun 2021 03:40:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 245E561164
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Jun 2021 03:40:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbhFVDnF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Jun 2021 23:43:05 -0400
Received: from mail-am6eur05on2079.outbound.protection.outlook.com ([40.107.22.79]:27904
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229904AbhFVDnE (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Jun 2021 23:43:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6F3vjWNswjDTYvQrgITuHe3hP1Wnzh013euCh3fTfk68m064sn0D7GxdFrX59fd7VpwEbi67emtxL7G+JB8uSWCudaInEaz1Ye9biI1WlchTU3W/AH8bRFi0yrSEPaZjZXWT/aAYlqdgxZonU6sqG1V9RWJTq4JbsL+HZk7t9kI+tr+gR9db5nxNyknrutOhLVmcSEspOUUPzCMJlNlGvJ/AaGQhkZ4NHLodHZQGB/yU5TrqeOWIbpX1ra0j+dHtN6nyQe+ZCRiVCyLT15v4/mwRwR3nzk1VU8HlmXg0ctfEmFAoFSpH4iy7IDr6/iseWIB3LzXLJPt54kMLn3nJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veTEjqituPkFbd9cYbKv9MoCYiQlCndkm0MxCB4K+Vc=;
 b=T7kDjQGXZNIKmRql+tXbiaqimrgZDgdRYMUGL/alFqw/WZ+ssC02vBFmJ7rkAFtSjt87ghbRzg30PmutjrABL+yfOz+aGOYtTXDWZdmizYGduH4+1zwYJdzz/OKXDQ8Fi6hCYZ1dfth51Q7XFPZNymWr9eKoKvGqPe1kalbfU0hp+o+gIbbAuAI7WnK2e6VBGZzbHftQbttodaXYcEw/zQWIkggQpoKl72oj2w/LAaqLRlvkgkET/BUQtF1uEdRxU2WZoAAYiT+E3up1GBpdFakwO1nqLHplTe0JjEUGxLDGTaKwNCjstkac+M+K52yu+ulijVZ6KH5+xSmvWEqRAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veTEjqituPkFbd9cYbKv9MoCYiQlCndkm0MxCB4K+Vc=;
 b=a1PHhJbJMcZCmAYU6TcNJ/IVm7Ja1ZTpwbXsVz71eS/yTmkebUwOLVfqJJakFLBn4x47QJ+rbkm8ljz73naQpzFMo/DFjsObTqkp5eOra4G3K3nzv8e2INdAZthdprxpuuLP3WckiBi5NaxRXf/PsMnbGy1y9yrZMWIDk2PsBEk=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB3PR0402MB3913.eurprd04.prod.outlook.com (2603:10a6:8:3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Tue, 22 Jun
 2021 03:40:45 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd%9]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 03:40:45 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 0/2] remoteproc: imx_rproc: support i.MX8ULP
Date:   Tue, 22 Jun 2021 12:14:11 +0800
Message-Id: <20210622041413.16992-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR0302CA0014.apcprd03.prod.outlook.com
 (2603:1096:3:2::24) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR0302CA0014.apcprd03.prod.outlook.com (2603:1096:3:2::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.9 via Frontend Transport; Tue, 22 Jun 2021 03:40:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0234bfbd-ea0d-4018-8bae-08d9352f8415
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3913:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB3913B24161D20D43A5DDF591C9099@DB3PR0402MB3913.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ufbWpCGnDkqLlNX7fuHf2ESfx3l4Jj5I6MJn/dqdb3lh2Qn1WN1P5foL80VWnaqsWpC80XnG5faR0sIVLcMYJGAYPYTiQpDTOHYcBaYCXIWHxxGn1FItArA9I2HQiFGFWSitx4Ic0P7qdeW4ASRpKVW2yKe7rCf/sTCMXQ3XK6PfmJ83wC7fzvyLPRuuyGRXrGNzRV3yu+lX+SatdGgR90BdT96/fLH9HA3RRmVlI21cmWj6ZXBvZyXcWbRjfrgnDNZxZqYinsrIORBYkYH3MOSzgRRnMnF2bsED3IRZEU/cxHgZR/iXPZmhSkAw9UqZkORvqtF2FQyxayurpgErddjDFCGNqOb5Q3fyM1VZtaSFSAJ/ddR2AOmy0cqa0Dt3kPjQKXRsy1jQxvwdEmbWfmvJgxftaYMjPlbIyWq19dWDrr+/43fTBgEQDzV3Dk6iEwrKARMbM05wqtOfIbokISl1G74+fPfBu6EmJRmEEXAgwUPC7LWRdhVzUImPTBCmzLBxlxGX6YKZqTYJhyGwGHkQ0Ehi+G/nc6xHVe6O2TskEjQ5nZKk4QLs9HymBRxNc6ouKbhkBcK2bRC4hTuY/Gf7RxUg8OhKJBR+aOOq98lWRabM5jvVA4O+9xk5kXAX7uPa04E+jMAtU5FbdX7WqE+TXGC/nYpy60yWXD7CGeo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(66556008)(66476007)(66946007)(6486002)(8936002)(956004)(7416002)(8676002)(2616005)(316002)(6666004)(186003)(6506007)(52116002)(16526019)(26005)(6512007)(4744005)(2906002)(5660300002)(86362001)(4326008)(478600001)(38100700002)(1076003)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3vQ9m/LNrfwdqAJSexcobd/erkNcYeN/0IknXYRchg+mJa4G1rGA1ddI1OPe?=
 =?us-ascii?Q?G1iqYT1gYSf7XNLbmg7AWuZxRm1/Xp5JRjIPXhIL2xas5rJe1kD5QZtGaqyl?=
 =?us-ascii?Q?EHGqBT7h4JjFeAw9RXs+OZ8FbUCehTqLumfCIjNBRzr3N0KH1mPpdJzcSO+2?=
 =?us-ascii?Q?TL4jXQmYLridgTWO+Q9FniqCbADw0vK29bgmsh7chCLwbWGId63ylmOvWnwc?=
 =?us-ascii?Q?jhbRebK3JgNZDhTg69uUCKQb5NBhRwvQy6GK6zrlCnewJILu1QGSLlQ5+An4?=
 =?us-ascii?Q?ukHmKWfQszk1QPCVOtdMVNRHtugch3f8xACQvpdg21KRQc2WwOXoW/0+qLmS?=
 =?us-ascii?Q?0VTW+mIf2DYO91kt2PYuPV0yOSwpEVHfj2zY3uYi00qxbA0/PrX22Kz+JnHk?=
 =?us-ascii?Q?pbCY02a5c9z+p4FTTKm1/2+BuFRGqwnZil4pJj7qGmRLeDW52tat+EpdGd0D?=
 =?us-ascii?Q?J/DbC7XOwcnhNpxjoXbylB7GVjUCJOiUv5iJmInri1rtt2lWJWUWMXSkCANh?=
 =?us-ascii?Q?jaTh4JMoKbZ+W1tqjc3kmf6/8cM0nihYfElNeOb0PeoFmEx1lCCHbyG0ToZh?=
 =?us-ascii?Q?awEB03vgrv1d4gZELscdB521Wq0t+KYob5IOJhVMxwS1ahS3F0o1nLmgaZkx?=
 =?us-ascii?Q?ocoPhajwR75QiW4hSwvh1IhZcmq48vYy54j2qwZoR8v353Re5z4sxY4Xeouv?=
 =?us-ascii?Q?PTYYVbOcsqPABlPmlaOIzMN/rwt2rM3L4MyG1kq4sba66c2OCoMKkwGhRlxk?=
 =?us-ascii?Q?kGKlcIK8iikMborE/+5dWFmdPAp99iojZNl1o5u2Ipe9LvFu3Q6PQETTIxT4?=
 =?us-ascii?Q?9rx2rvmq5e58JvV+hozgsRexSwka181ZcIFzyN1L4qNO9aVA+CfGvg8g8CLm?=
 =?us-ascii?Q?cymUHnixH8/4BIzScLKU0l/ZPBnDU8ORSr/n3Y4abVW+TygGniojateSsDmq?=
 =?us-ascii?Q?ZDJTidOcf/N7ihkgKLmcEWSxqkwc4MkqG7kYYsmKtG/m1ow8npg4FHTGT5Ab?=
 =?us-ascii?Q?vY4DpyhYrbebF5M+CEFR69di1leEsWc6OGc7vOXDoAqHnOuWGTgUXkVASwsq?=
 =?us-ascii?Q?KnAovvZj9nviH1BpOSBjylJWNYewunDQp1MmUBAh2jFy7mS3Y91i1vMDNJeH?=
 =?us-ascii?Q?Q1VbqgoUUD9B/ld20ThjAHlmTepIVpF6+kyPDuhtYDG26e4ceZC9tanL8t7N?=
 =?us-ascii?Q?crfeTnV/Lk0HUv9GgUEAm/IXl0ah/iHQx6ByjhAiBhGkubWma8jaGFOJMKII?=
 =?us-ascii?Q?VEao1H6OIYrOGWbsWCQ5D2uDXh/ISIlxFwcxdwCBgn9O4rU3GSR0soMJ2PiD?=
 =?us-ascii?Q?ZJ7AlhgwessJUOIuk+D9MxhKbOeh9JHdI7GESzRn51ptyw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0234bfbd-ea0d-4018-8bae-08d9352f8415
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 03:40:44.8583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wi46EGvGgAZJq8jh43PQL8WYEr4NoyhIGSEAApPUxwM6PkN5JI5UmtwPSfM9+b9oIuLIBfkgopcLKi4jojCXPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3913
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

V2:
 Add R-b from Mathieu
 Add Rob in Cc for dt-bindings

i.MX8ULP features a M33 core + dual A35 core, M33 is kicked by ROM,
so like 7ULP, A35 only communicate with M33.

Based linux-next/master 6-22

Peng Fan (2):
  dt-bindings: remoteproc: imx_rproc: support i.MX8ULP
  remoteproc: imx_rproc: support i.MX8ULP

 .../bindings/remoteproc/fsl,imx-rproc.yaml          |  1 +
 drivers/remoteproc/imx_rproc.c                      | 13 +++++++++++++
 2 files changed, 14 insertions(+)

-- 
2.30.0

