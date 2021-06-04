Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA9CC4708F
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Jun 2021 06:50:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3273261419
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Jun 2021 06:50:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbhFDGwA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Jun 2021 02:52:00 -0400
Received: from mail-am6eur05on2079.outbound.protection.outlook.com ([40.107.22.79]:62439
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230208AbhFDGv5 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Jun 2021 02:51:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PE4s2ltoKRN86aXrY6VzAYWEy+8j30ND7Q8hgTmSNUAfCl6mn2LcGOBeVkVRuNYz3yzEnqKVLdC5puTWajJM7r6UMpylTePNa5TfVPOpE4CpjX4H8PIG+wlKL3GDD/Dlk1rzPc0fnJ40+wcyvMiIwlLhkOjlkq5TXNGwsFgM79uZn9/T/TsxxL67uHDhEJt2ZTtouG8DANY/CQQxYNo3DWVz50+bJwLyexGPz43DiTsdlvPFF9JnoaiZRGpll5Y3LKStvdpkNoCk9Z7nAJ7ivaeDyf9pnyplmNnWi8bj0t59YdocErOdZa4b9alx4ZKXxXI4IR18047ewWLcf7+Blw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjgg1mVoLAN2pTOnWV6oPk1K9AQ18DCHhRYUtiYuN60=;
 b=OBfhiVyVwpWZ1gjt9fEGMvci4mNcs/nY1I/jPP4yL1l2m/33sschCZ7QUhIn8xrjDtnLEvKSNVz5rtlQusVHZLwjWMhy5aCXKEt1eNqdDH8MMR+W6679v1eSfXAGc1A8IT9eHJz+pGa3Fi+ayC9dKT5z6r6oyK7D1tv//ZnlKDBhUWaMWlfTGDkFW1BQj+ktqtG+JQ0OozuqtAwJHOqbGpuHXKYjH2SI9jtB2Nq9PEn2GSKcyBmhOW1QKyuhej+517oKD1bF8yx8bOWKuQPYF+rWTNLzXswCM1y0HNSxa+Qy8TM4bKSPRJO/gMmCrr9+CtI9QNaDnq2wGo0E5FITzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjgg1mVoLAN2pTOnWV6oPk1K9AQ18DCHhRYUtiYuN60=;
 b=VnO6BVIG/LW479RplXAmP09CZ6aa3RjyZtZ8ws1M6MU0c6J0IF380JKQ9RwNfSW81afcKFMnJReuq2hoyubG12TWWVnOnSymjKnUKXHbJf0aN3FtKFD4GqWU8T79NRBO4X3JJbizFFDz3fRGYHOwIopX6WYyr6xbFkpjwH5EMVI=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4236.eurprd04.prod.outlook.com (2603:10a6:5:27::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 4 Jun
 2021 06:50:08 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 06:50:08 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 0/2] remoteproc: imx_rproc: support i.MX8ULP
Date:   Fri,  4 Jun 2021 15:23:09 +0800
Message-Id: <20210604072311.9186-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:3:17::24) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR02CA0012.apcprd02.prod.outlook.com (2603:1096:3:17::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21 via Frontend Transport; Fri, 4 Jun 2021 06:50:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9735624e-f2f7-4670-88bd-08d92724fdae
X-MS-TrafficTypeDiagnostic: DB7PR04MB4236:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4236968EBCDF26B26B155B29C93B9@DB7PR04MB4236.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cgI2oi+lUtp2cDKKCxK+l6A3AHX3Y+cix5GWp5zA1sro8dbsixyEnzPD7lrf+CGHhWU3JL5XT5zwCz3VCS0Z1NcTqoCf9sjiEwFx/V9HQsxK53PXy8gqu+r86RZoHXSENwEkZ7D9WETp1X450y4OXjPltRryfMtCG/NNldOvlgbeUU4MfSGl8RO3QngXQoSavwGmU6yFHsxXhqBJnbu+LofrsGJVRa7HUQ4wlYSedVoA0nPKRgeW4eMhNOovKScnmz+zDC6jdCpD3+Z2NP5D3V4Szwd8LmXnQRCx6SWzu/4/3yva7Kow98mJ8wj+QN03Kr103++gMyHUqUHt1+Ujz5cp5ngGzGXToNIjCYrjLM2yXf9LwmPtzvlRYIgxkY4ncBYAHWftsXva88hJqEAg1A7y/UrTIg5J8HbkaI7c6fJba1ZCzwFuFfSBGMho/695EkDqnCklE4Iid0vwua0mZCcsCj3wMA6l2O+Vt+ligATsnV9ca0QFhQhf6WqJU6FpuGwbP6p7E/TZJOj647r8JAgFH/588vnfJ2KwWZrSS/aVZqSC5DYwQNJSk6/NkdLFjNBbG2V24en+yGiPKSLD1Sjc4/Jk+Dtbw5nClWGB3u0QPRCTLkBLKk3O9CFRPZCBZJgyCrH09LZRH0L7mt98/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(6486002)(6512007)(8936002)(4001150100001)(4744005)(66556008)(5660300002)(66476007)(66946007)(8676002)(956004)(316002)(478600001)(38100700002)(38350700002)(52116002)(7416002)(4326008)(2906002)(186003)(16526019)(6506007)(86362001)(26005)(2616005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Y1IeFMOnj0PLGR4GrfF6iHzSlHNreEUx4wpib4a8UUN1gt57kLPEld1bEdGb?=
 =?us-ascii?Q?grgwUYR/t2WTPeA28wqKcTmrC39bSDmTJ5deSmpB0Ohct18Mu8pPjiKU/faO?=
 =?us-ascii?Q?Z5zRphD1NY9Ww0aPOtMgzncx70OP07OpP85n4UrIKdSpMvybAB5MgQjjFSvC?=
 =?us-ascii?Q?B27b3HcFXAq01x3rN6Bn0GUaSDBuCCLCWrISozIGSdJXOT7jyaEYFqvKhsp5?=
 =?us-ascii?Q?YX/YQ+ceGvOD2JEyOw08Sw2aRU1G/U5CTCTBbKAz5rHh2haUdRVPAOF48F7T?=
 =?us-ascii?Q?1Ate/Uc1Hs9z/VqZJbCIWTwn4Q42vxdRDE78fzNsywHKuBob+FyZa0JVKb2K?=
 =?us-ascii?Q?jUG4GkIfSpPcQnv86TC12wgQ/p7sD25SBOM8ggHlqW+9qgZDtysD47kY8ZW3?=
 =?us-ascii?Q?OHXAmKxF91Jl/msIy0Ky1oEfy5Euy+XXWgQEdr5AAiIIivkJGbzZ/JuBtTlc?=
 =?us-ascii?Q?7Q4xKSi2jj8DKErqXaWXcJGaNLiioOf33dK8+IgqDCIOO61CT7r37pSeGM1l?=
 =?us-ascii?Q?xbwh8kS9m9vL+pAPx2EE93vgjVQOnIXDDex7zaWk5Wc5yDKsSYWx4TiLmNxh?=
 =?us-ascii?Q?3AytCgGZHU1FTq1QDwHyoD4THhe/dqIryJzoBM1VTh/Wr4egmQ87QqAD0U4r?=
 =?us-ascii?Q?FXZuJ6RDBlR4ricHmde9Tao/WNgwMsSrj5ZMKGQ7yOkabT4PJ0PGy2OwpKxq?=
 =?us-ascii?Q?iLto18BwT4k5okJSgAGenhNGQ65I0IFlOWAbjVbgSNKfOeH9e3hAQJ6YkGQz?=
 =?us-ascii?Q?yiI6ffH5Mi28gO5XcKvOyhG9MaQ/7H4vRwfdebD3RZd9xAvjYaghj2cyux43?=
 =?us-ascii?Q?2c+u5KAnl69Jo4q7lreMLtnosK65HIC+aagXi+8gvF5nO7ZkIg22QMjK6S5S?=
 =?us-ascii?Q?EyaR0QBKWTc+Aa05l2QbN0AAGFTiSVNGZtawZ+EvRS2nApRKf1MXL7uKMvzr?=
 =?us-ascii?Q?ev1JGjP04CVcY2PGwyLlUNlKZqweRmbFPVoOmREGpMmig8Ixau8jYY9OOuCu?=
 =?us-ascii?Q?jd+8C1tXuYWGWygZEewypVtQpBWxYAJkpyLkZ9k0+Z4WoKD0cy1x58tiW/jc?=
 =?us-ascii?Q?58x0DQi89/NJR8A24dUFcM5knOw0GzsFqkRkrZkp51e/mCCOC8PrlFFgiMh6?=
 =?us-ascii?Q?fKH9WtFC/+l068cWj2crrW20xmJHwDKMH5HGxEXwo3kyXQhAakktV4PCk5gp?=
 =?us-ascii?Q?LLutSDh712g5t72RuLmepIviQqWqUIRwCorlelJ5fM2C3leJwe3saoEnh8YR?=
 =?us-ascii?Q?43nedecAHgaQ5rfKfaYIQJaXSmaioylOiLcvAhjoR69XixM6mJ5m4t/KVbZt?=
 =?us-ascii?Q?GT86V3j+qa1pJInkMIQm7NCG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9735624e-f2f7-4670-88bd-08d92724fdae
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 06:50:08.1963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1e8EjhWeocnr5gokNPFae5DDdiXPLLWJarkzGxY75p805YUTlgZKmUiUfXcbgzK7QlvlkTZICj3IFSJ1RfxP6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4236
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

i.MX8ULP features a M33 core + dual A35 core, M33 is kicked by ROM,
so like 7ULP, A35 only communicate with M33.

Based on Linux-next/master 2021-6-4

Peng Fan (2):
  dt-bindings: remoteproc: imx_rproc: support i.MX8ULP
  remoteproc: imx_rproc: support i.MX8ULP

 .../bindings/remoteproc/fsl,imx-rproc.yaml          |  1 +
 drivers/remoteproc/imx_rproc.c                      | 13 +++++++++++++
 2 files changed, 14 insertions(+)

-- 
2.30.0

