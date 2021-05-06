Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336DCC433B4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 04:25:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C25D613BA
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 04:25:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232484AbhEFE0K (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 6 May 2021 00:26:10 -0400
Received: from mail-db8eur05on2044.outbound.protection.outlook.com ([40.107.20.44]:18528
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232400AbhEFE0I (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 6 May 2021 00:26:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCX2EwAkRlggmADZRxob31OqJ5DsfAq0f3Y+YYG24kh6diiqtKAh2TjG4sNKmzslZBi+4ybh9rQ91kckZTjzfXJLPrKWyIUwfnEMoJ5eYeuNvBy349E1Q+XPcpSz1DnZhmJa6MtPoOTeJqvQFzhb0tOdEdtJwRiEklPBzZcajlSfzaTX5k0epNG8YMEqroBhc+WLFvsIJKZN0GPlrEKz9hlFKvTGYDac5EByG5Ktmsb5BOPc8he9ik9AL8GUAMZljSAx8RhPjlRXkRqTdtk4+DwT0od0Lpf8oq3B0sqk8p/9InQwTOJtQINjWYeXWCrdqA553JxiFqPEDsYrM78ifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5r2YS1IJ7iZGrBoTfdGtwCXcI68fncREV/Lm1YGhqas=;
 b=ZOHifvL6kx5LI/0jf6tRkHZNtJS3NF/9+k6nt0SPr14QZKww2offloE1zGe3MF5cYB50PDP1/UYGfyvl78cK3XFe3N0eqt/jPicjIqk6JXfEF7X2Fz/x2ykNavuARokb60pN24FigzJ+SE/CbnTWnDEf3Gxs8senbZJrE3krQ6paKQ3gplldccNpovumc9EF35pCIOk2l/mHAi70t1ud/z3++APKnnzavvpGhAMVbsne0Ln0/PSuTleGEI+RD8NBdBdPDvjKxuLggI/lEUtwU86/80KtXdAFmwAczeSZSUCAYErQZi2jQ54lfVY8tClYfIC9MSyQkxoSfHNkkpmrIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5r2YS1IJ7iZGrBoTfdGtwCXcI68fncREV/Lm1YGhqas=;
 b=S2uQdGpqfbf1s6NUQqlZiPypcomBrB8ozeplNf/beNUgHQAT7ZnAXSzjZo/UKYx8eSRlz9yFKyZMc7DdhQTewGMtKWzk46MzRHEndhh6349rC30s1zpigB1XoiQ1zN42iLBKHFf4vuImtXRYPmdTleJ1dAkZUTuzN+kyu3ISheo=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR04MB3126.eurprd04.prod.outlook.com (2603:10a6:6:7::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20; Thu, 6 May 2021 04:25:06 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4065.039; Thu, 6 May 2021
 04:25:06 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V6 3/8] dt-bindings: remoteproc: imx_rproc: support i.MX8MN/P
Date:   Thu,  6 May 2021 12:08:38 +0800
Message-Id: <1620274123-1461-4-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0055.apcprd02.prod.outlook.com (2603:1096:4:54::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 04:25:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f9f1fef-7682-45d7-81e0-08d91046ecee
X-MS-TrafficTypeDiagnostic: DB6PR04MB3126:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR04MB31269FC876C8DF4B8D984760C9589@DB6PR04MB3126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HjrPQyGiWSeVB57srAQAQy426NZCr90/XAOWCU562A4n3SGtYEWzPWeKRMMe7atokLIKQCk17zIiM0tD8Xb6Df1iKgQXktN9a0YxoOsTMwI0y1a6Qh7/7WgU0G7afriL+Yze/MaCG0fxd95LfGefFzEeI6IenoatWxbc/eH0WXN2i9UgaTGfMYBsPq8nZUIyH9tvGL2tXIZbDwMN+zYyCal1OezNS8JfGoJUPuGR3oOqyI0JV1tXG1KOxilM51Bu+Oms45SpfoNL63er3SEQrbzQ9aDBWaAPNWsV8Or+dbBImh1dOVH4OPTvnB8HxGzK9Ppbv/97qrKygw67CCb+U+TiavjRGWzdbUP4pJuCtwsKU6d0rRnuYl/phnabr3f4CXWzgEjfPB2RFlfoHBZKX2bACCSu/S4VnvdGDj79YDBOeLiiiMXKEuqax4KMgY2lUjQmt66+p/KRLdtU0BjSGiD2LNI7dD6RdC5NO22aHJG9eGojZCLPYF6V2vn3R3VAAEXFhzj/x2ZkxaLaWp6+IYnwpqbfh4qx68ZSF5vV4CVf0NgO8wy06SkEk7NxbYRUi1/kFHMP1sylrto7oUcrX/hwLmuDyFH3bg5T0AoYBo4c0Os1k+s/lFWgvsLVWHCXmSUWp5UOsOeqXO0uJaPLfdq5vsdoQAIeNICDmow4SsuWxTrT/LLnFFPCtz4IZHyd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(136003)(396003)(376002)(346002)(26005)(38350700002)(52116002)(9686003)(2906002)(66946007)(6486002)(8676002)(6506007)(16526019)(7416002)(5660300002)(6512007)(38100700002)(186003)(478600001)(2616005)(316002)(6666004)(4744005)(86362001)(66476007)(66556008)(956004)(8936002)(4326008)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BkZPMdzyYnCmBZBEfZDX0TESDc9Xb8pPaclngI4dYtMtJrixXEDw2Tp0Rou/?=
 =?us-ascii?Q?FdEV+5GcGXBI4dSSZzXrw8huoTLQyaC05Mxe9Zmbf1QrzGicDuRTfCy9Rouv?=
 =?us-ascii?Q?qbRjPzC1nwJ/jUa2hpl+xoBTU7qaZrTaiUpGdLYurA/d9ebFF30AWHaG3vTA?=
 =?us-ascii?Q?Z5cdmTg6E+U4yDDV+xspAtSkf6LmI/BB609iB0q5PX/lexxyfZHybqqs+OQ9?=
 =?us-ascii?Q?5RnuZ6hLC0OE4tsAMPvnYoB9JZg8MRqWyZmgaR2tGXJeLgQ0TniFkIvKaMdh?=
 =?us-ascii?Q?7O3EJXdGLPMzYcCCKT8rc7bcQlZvKU3uFn5T5NRRqb8mOiM+5g28ZWKDfYkt?=
 =?us-ascii?Q?AFfjbqzII97tbocEYcufoLaq1CaBUf3BfY41Ww1770OPnUaIpi3DTwHl6xjJ?=
 =?us-ascii?Q?RFYdWwoYwz/uY8+Du4k7RiB9Qwt9EnsXBQdJJuGAdNm+aMb1IydNs8tsi0RT?=
 =?us-ascii?Q?eb+1fUmce5MD3269gu3VKRpUNr81mZu14K7K80munF2St9VbDN+rCOAvTsLS?=
 =?us-ascii?Q?iUnitFt1Xki2mznH+QRKVUdnW3+VPU7PqHMlpx1ebah3k/ocHFu3bnpShAfi?=
 =?us-ascii?Q?ZaI6ldJMHuOU+VS7psUGZIvttK8hyvGtF4/pcErWw6n33BvM3rN6UIe2qsJH?=
 =?us-ascii?Q?5AE1UIHx6ZzbuDygrVcQ6vpDcK88KPfusK19eMgdSdmsNVcbcS6cPKAt7wsH?=
 =?us-ascii?Q?ZihFcezrc+xjYbpb7+gvWqqsCVFbL+/IVVb5b4peVM0afonKxk/Z28JjTqr8?=
 =?us-ascii?Q?z6HkBw/fCEyPsJLdhiBebSLHia6YYitWzdLm8C5osl3BWNk1UUz13W3I6bce?=
 =?us-ascii?Q?G8UVwy6hTdj5dBNSLB78uOPCydvjsIGN7sShNwGqKbvhNIQ/v37dl12+6p9P?=
 =?us-ascii?Q?faYiE/jAq4K8LGz6ojCTO3ebD4PMFkS0dRo9g9uX1NLjSY44p0/XnB8XZ28p?=
 =?us-ascii?Q?Mf0LJATSFT6CtWWN5/vd5DHNvxGb7OBihnjP72kRlPW/UMPh8XblrIis99yM?=
 =?us-ascii?Q?0VTX7x7yOVRP7keeGadXh7FpA4OTHRZi1TFs0OCe6l4iQ1LQVirrQVEOXcUj?=
 =?us-ascii?Q?4wCycHlm9RNUfZ4A9S+ZcMfeDf8QspmKYRjKhq7fn8LDatlh575DFUVlQn78?=
 =?us-ascii?Q?qE9crsYz8eQ7aQxT5QNVoRCJHMplC2xcOWhQuob0aI3P3bd43qvDKSlKcHhR?=
 =?us-ascii?Q?x0e9iS48a/NrhlYtmgxHtysEKJyFiJdokdxUx6qiVh6+6XC95iUKEqY23/E3?=
 =?us-ascii?Q?etf3UbPRI76IvR+OXUjHDXypSgmvAc5osLgm1f0I07kRZoyDQRE2a2JxnL6v?=
 =?us-ascii?Q?8MOo8FqaCAlmmElJmWVPrbog?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f9f1fef-7682-45d7-81e0-08d91046ecee
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 04:25:06.1603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j+FR6JzSP7ik3K8diuN7LkPEHWFj50ku7l5qM48AnBe2egEikM9Fub0qNr6lIb+0nifmtyG/qKtp6Gktrh8hRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3126
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX8MN/P remote processor(Cortex-M7) compatible string

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 58bc2a23f97b..1dc34cf5a4ea 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -17,6 +17,8 @@ properties:
     enum:
       - fsl,imx8mq-cm4
       - fsl,imx8mm-cm4
+      - fsl,imx8mn-cm7
+      - fsl,imx8mp-cm7
       - fsl,imx7d-cm4
       - fsl,imx7ulp-cm4
       - fsl,imx6sx-cm4
-- 
2.30.0

