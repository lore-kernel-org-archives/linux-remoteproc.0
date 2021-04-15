Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC103C433B4
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Apr 2021 13:43:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92A4B611AD
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Apr 2021 13:43:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233278AbhDONnk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 15 Apr 2021 09:43:40 -0400
Received: from mail-vi1eur05on2083.outbound.protection.outlook.com ([40.107.21.83]:20416
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233282AbhDONn3 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Apr 2021 09:43:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsUntxZOsBp9SKJYsotqjlGN/UgGs/3sw2vNtTLurHNNfKgRhqCwf9a6asICym/+Xxri8ItbQ1ruZurVwuU7l1+cNy6suWJZncLqnVu5YvCFE7Qurxr2RQFCE15SiRc5aUJxLjbVvWDF/HJXZDUrKDBf8ZavR2TssQh+p5RcCeh3DPBpv4kjqKV1KFMEIYj1nyFDbhVJchGHKRZYiBX4qpThTlwHs3FCbgJMFJT7kUYYXlLO2uTZ0S3bLlMNRG8KKM9nGMihamH79/hBLf7gPcYiJKM4L5MR4Y/tVsDixxoj1LlHafhRPF7f2RdE62san2ORWQtiDQ5r9OM7M+jRHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucKWzsTsG2fJJqlsSK+Ps/iDIC85MCfylWKilysFYFM=;
 b=jJmIQMjIFrq8iwFDZQH4cvuTp5/YkvFg8ce+6NUpOwLTSzF+VXYeoobGWmO8mOd6C6yAWrmXQH+UCk6x2TJQFpU6k+wi+RsQvUPypvaN99nEyNIcg0fSiC8qegbktjZwm+b6RttVzvqGxWc4yTHON20jmsJCPg8IzkYVl6OmS9naBf8tiMtHL/gukiQd4Red9/JAr/LURKjwnpOejYP3EyRanN9bauYOnXhPMXPcAW4WC6bGxg0WzWGjOgJaZDFxzUsalSv7OwaDCrVTveVD6G1wn8U6VdwCv+VRBaPbhIRWg30kQYWTHK+9a0aRyvl0hYhr8wqU62Ch2SNPoEUaeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucKWzsTsG2fJJqlsSK+Ps/iDIC85MCfylWKilysFYFM=;
 b=U2CM4gSWoszKjGdaeciUNvfUCN6re2SptEUnyls3Rho4VNo+TPAvzZvp/c/Yz0oaULuKjP1AeGuwq5l84AG3nNu3vMN9xP2H2rOJ0gMvDw6hGgNlfDFBOO7RelaesW09GRDCaaoEwXEAyl0Ov+vpRzn/c/MNAukO8jZy3ftJNS4=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5241.eurprd04.prod.outlook.com (2603:10a6:10:1d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 13:43:04 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.037; Thu, 15 Apr
 2021 13:43:04 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V4 4/8] remoteproc: imx_rproc: parse fsl,auto-boot
Date:   Thu, 15 Apr 2021 21:27:37 +0800
Message-Id: <1618493261-32606-5-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by HK2PR02CA0132.apcprd02.prod.outlook.com (2603:1096:202:16::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 13:42:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b7cca10-dc46-4eb1-b979-08d900146479
X-MS-TrafficTypeDiagnostic: DB7PR04MB5241:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB52414A9BF42D7AEE7DB04F8BC94D9@DB7PR04MB5241.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: siBnxHtQJdL1mdVofPJumAotjAB/Z+woqpN/c3zjhE37sM1u39ejMl/NRF4t1L7TYeIiNg2tAF5SZvVHdftaiMEtXxCYERYTyBNGGYjgbWP/yHu575bl1SgIBUphT/cq02Q+Zi5GdhSDFarDcvijIq/+lbebYHVndT3mgS5dGXFtYNCMnlpSGaKDkY7kfQJJZcczGpg/U4LBebTu7w0fhNf+inEYql5JjkoUZStGZQr31IJvpJ7eFIBoyGuQsuXdpdfM+YHijku8Pfx9eHEeE82t2JnOqOYW89nFi2noLJvlesHsWZh5X0rob949HvjEZt3a5nK+6/tOpGFn8dLhiySag9VUc5pOhUdID03ecsxCSUXoZUDD/E6oxFJHlmAdSmxJgBi6aJtAwdrWJOvYQEEekC1nGvbNe7uXuEq13tEehxNmIMg81ftxQAbqWam5PSG8r1GwdPhOZI76I6HJt60mCUcOJLob/eCvyLjNt9jIAbtyDIov57dJmsO6arJF7D8OVewTUyfj/RAOxBGdx1rLtvuEj2qiEok/39b5IDkpuH3Xv26YJ6u4rgiFZrjYniMwYFNjWozgE6giCPRYPnjwjSbretS25RjiuM01qPhzUlAmTzu3jD019bQGIgsDF3QwxlEc+sY4mF3zlCXL8kjoydPUfUTUUTjrtcpVy6V0o3VaxAMS/WLvCtFoDXjO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(4744005)(6666004)(6506007)(26005)(956004)(186003)(8676002)(16526019)(6512007)(7416002)(2616005)(4326008)(38100700002)(38350700002)(316002)(69590400012)(86362001)(478600001)(5660300002)(8936002)(52116002)(66946007)(2906002)(66476007)(9686003)(66556008)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3XwhPofq/F5Uae1V4mSjNmc+1m+Zk8VBoUPqZJv7N/i+L985IEM0gGiGiMEO?=
 =?us-ascii?Q?DolOWpPPUADmfJxVXmdRY9aKHlesdptCazoj8utLiUKjLMpvBkSfR5BvLyNM?=
 =?us-ascii?Q?KhHvGCsOJ3ptna7rcMXdC4aM9hy0ZtyLT3K3kuKS96DGAlVnTg/e4+j0NZKl?=
 =?us-ascii?Q?gz8tfXWorWgIMRTWoUxqdpTpZoJENh+GObPgXlLNfjbLCVB7EuF6icsLaYcN?=
 =?us-ascii?Q?Sel2OQeAncP2JulXVrEKDiWxqXDH6gU3bmxayeUM5BUlvCsI/D6l3naQC+HG?=
 =?us-ascii?Q?38KUdvhrqtKUXl6pGGGEb4yTxLA0k2y7nMbkOZw7BiR2yrXsdfGNE8DvvuRt?=
 =?us-ascii?Q?+wc4cZI3Cp/q+TXsmPI4hrrA7/OIuSP2fgi7Z15fc10GrQgV7epeVJQKDtJ5?=
 =?us-ascii?Q?NAGUogUb/NIEHyHHwTFL/dCMvZYcSQ2QFyc8kSpmN+Y4kWhLeZbm73VjeDe5?=
 =?us-ascii?Q?+8i7OQuNPhm5Orp7fzURWw1tSF41QPVzgbB5vOdEcCyx5xhCJcJOzNLSohUr?=
 =?us-ascii?Q?D7hqFq+mYtCka2G8NO8Ch3Oscem8y7dPXrHkw9h0ykzWbwrWIlmpSK7qKLOO?=
 =?us-ascii?Q?7fQCJzda0vvIsqkyHaFEVs+w7DYBguz3m3TyAKqk8awosPOi4X4zliKhYfkJ?=
 =?us-ascii?Q?H/yf28lJg0fdxRnRnC0gPfzRqMC0ZZEH/2Nd9M4w3vSkgNNRPbW6KocwKWqR?=
 =?us-ascii?Q?z2zOqV52vrFak1Zb1WLZZc/2nFM4zVh/gypIaqHfthhYXrgnbqc2V7/47uMp?=
 =?us-ascii?Q?Cv9H9GWWNUO/bp7O0xp2j89lHZQkCNYAmB2zMDoFJNWlSLaXb6f2/YKlkXbg?=
 =?us-ascii?Q?hdchffr5/L/66YExjUOGA6R0y5rBLYPtfkpyOT/1qc6qUGGTq0ac8yHxfk/R?=
 =?us-ascii?Q?Zk1lju+ZxuWIbpXMJmoF2vX7RlHWRsiwWZ/h4yFX7lIrOdTZE3uHjITbtd0g?=
 =?us-ascii?Q?wTcpdepKHblrI4WGwrX/atytYdp1CHzTTKxFM2X/oRwftosLsVqKsTSZdpSL?=
 =?us-ascii?Q?yuu05RZsekSswHnF81X05TxoQhsok01ExYZxx7ZANhUeDXpNQAUOIjXZE80z?=
 =?us-ascii?Q?NUwAS9PLJ+eJO2upQSNZjFfMXSZSm97UE+9k76dHkmvP2THPZckCg/mPGiiC?=
 =?us-ascii?Q?+OO8QwL8P3GCzDEvUqAGiAJQCuC4wCgeif5g41nQgps2B22aoqWVaUg2xL/s?=
 =?us-ascii?Q?5igVK/jzb7ys4svSKxp5YccDUhurRr1UYJwxl4Di+S2osWKMG6hEcnYeRqRz?=
 =?us-ascii?Q?DanhMPQPzIOY1czN48De5odIFp1IbaCdNMD9qQwBdAobNb6p3Jcgipf8lRwV?=
 =?us-ascii?Q?BNtSQNe6Coly8ohAVZdmuFzF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7cca10-dc46-4eb1-b979-08d900146479
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 13:43:03.9258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZHlnrlz1fh3g9TSQ5C8BAht6vzNGW77azkpwhtGl7vcFbX1E4K0OHCWQ3DjdL3SeJAfWIRXw60gaI+irndbow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5241
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Parse fsl,auto-boot to indicate whether need remoteproc framework
auto boot or not.

When remote processor is booted before Linux Kernel up, do not parse
fsl,auto-boot, so only need to parse the property when rproc state is
RPROC_DETACHED.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index d633887..06dac92 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -654,6 +654,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
 
+	if (rproc->state != RPROC_DETACHED)
+		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
+
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");
-- 
2.7.4

