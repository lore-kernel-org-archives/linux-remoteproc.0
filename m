Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33591C433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 05:46:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BF1661928
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 05:46:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbhC3FpY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 30 Mar 2021 01:45:24 -0400
Received: from mail-eopbgr20066.outbound.protection.outlook.com ([40.107.2.66]:43853
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230306AbhC3FpA (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 30 Mar 2021 01:45:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUynbfLrawpGuIUXgc3Hq0K5vjkMuljQJDcc6ChX2hhbdMgF+jNrDeS3724rehfk6aksR/aI9OetLsfKHgMzf0Z+j7OtnnJfV9OFvGugSC0axzm5k4KCcQn54EJTGRS9TfmsISEbTGukIqsz0781g5Ll/xVa6wt7DKy3aeGxYVvTQL7Ye6r4XJedNDEnx1hPuQFagtUUI74jyRz6wBoGq6sXowqV3SVo27FZz6dDzGXTdrsyUs5p+O3rSgQLzKPZ/dQqQsseUlBG4BDcC+d66WBfCTMbIvYtjInIBiddeGK39XY03oUiyZHX0nxe96KJen1Cp10qtDCf5f6TnUv46w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECxKJbXQZTAqXR+HIVdkRJ+rVrMpLrfvCG2naF/TXWA=;
 b=NgAwnjmuluMcF77sqYmpsLBXyMR0emkFHvnoM06ByBC5sboNpwjxbY7DqY5tucwnoM7OMvAWwzoDl+6w9v0VWCBPP6nPtAJSYLMsyGkK1o+jeDVLf8US7g/3Zvq0CHQjapzhMkvRgRVjSkjCxrlIMHcvdTHm9zZKm33jj0k2uUPuVjmfkydBaFcdeb3Rd92I235RubDTWT6Rr8zlN9ZXyyxthafQaKyfUBstQqhUbt0mLLoGhAVCuePjvsYOk6h67aLZ+9/dudfwHQ6LRzoYsH2Fd9s3DHg/pY2PLQswLWifBmDh8B1I8+oq4Zx7KY5eDOi5bnQFEiB5+XU/QOCNgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECxKJbXQZTAqXR+HIVdkRJ+rVrMpLrfvCG2naF/TXWA=;
 b=BxgVrtV+oM+nZrsqPKe0ISkh6EOideq+kOcVCxOnPAJ2OaVGJD+guTu2100fqJ8DF8wNiCKnzjMD9Fo1nW7r7cK5N8ZjFgA/of+IcL4IhmdsfjepPMmy2Cn8oHeVu5ac9JEleMk+DpAVfMAYJWv+x0hqkafp/469auhFSAdwvyo=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4489.eurprd04.prod.outlook.com (2603:10a6:5:35::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 05:44:58 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3977.033; Tue, 30 Mar
 2021 05:44:58 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 3/4] remoteproc: imx: move memory parsing to rproc_ops
Date:   Tue, 30 Mar 2021 13:30:34 +0800
Message-Id: <1617082235-15923-4-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617082235-15923-1-git-send-email-peng.fan@oss.nxp.com>
References: <1617082235-15923-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0055.apcprd04.prod.outlook.com
 (2603:1096:202:14::23) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR04CA0055.apcprd04.prod.outlook.com (2603:1096:202:14::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.25 via Frontend Transport; Tue, 30 Mar 2021 05:44:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8d221769-5f59-4dae-a92f-08d8f33ef3e4
X-MS-TrafficTypeDiagnostic: DB7PR04MB4489:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB448948A2C00991F345A91014C97D9@DB7PR04MB4489.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kp8Fq5+MSAsabfgjgEerOkpb7O+5NOKTVSgIr1gcIK1VRtEBOQHP1hL4i+xaG5zvEAQUPe1R8f0+zAf41P2A55sU4siSWdkdMcDsavy9ptozZ37KAZPLyx2V+bi79sXE2gh2kG3kZVafKs95bqOgf6j65M4VbKkbJHS5Ok0vLcKSH0KZQxyaOdnL1FMdXQ645/zuo51KQA5l8SlWOW3FLBI5j42n4lZRkn1PsbM958OAzNOCNm3cJkhYm3NWkX3XbVSRu9A7LWmyRHCHaxf2jj66EOZmnEBe8GccwiQuE5kIYgdDmS4iUJRZgwbCIUvjj8F3UMEBWi58k3ZFdkwcW+TUo/m+C45rYZWagxeA5giGHrpJFoVpkY9tLx2AgjIdXUlQraFjzsHAYsH27vt5XMuR7MtVIsS2J/DbIAJtIGdwwe9dlChIO22uMDLrQp6w1ADz/kmcoiuLmlBMPgbVKLB25puoKE2pqZYJjEeN+67uabFTngoeVdetGyshNMvG3VFnMlM6NqmM82es2HRbXjONUuDdg0zsCW74kwtBU6SW2FzbZ+3lxTZVq+2q3CVa90MwAg58gWOy9GJSN+Os6MZd9OtZWtiB6v66Qwf0dUMDO0Eqnh9kdZozLkHRxe7mlVPjFwbCNJWJkzuEAbFHqM9ePHgS21cMSLLc5y03x1aSL2JMeQTa0h3N6mVvXG1C
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(956004)(2616005)(86362001)(66556008)(2906002)(6666004)(9686003)(6512007)(6486002)(26005)(66476007)(66946007)(8676002)(186003)(69590400012)(478600001)(4326008)(6506007)(5660300002)(38100700001)(316002)(52116002)(8936002)(83380400001)(16526019)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bam0A1d/M4m0Hfdn7U8XtMQLCMLV9JcX7i36B2WwWMOqn+5QXeAjLBDrSZJZ?=
 =?us-ascii?Q?xrT/T5V7Gc318L7gZ1u5bDygo+c8fCjMBdlGJteTZOQassUaTuuQgdU+HfC8?=
 =?us-ascii?Q?7m8AruqQqEqojA0+DR5eCLqblhpmJkN3Xe+WpRh3JH0uJraiFtByUp+hde1m?=
 =?us-ascii?Q?gf0pLJwuJRiVOOZLWI54odf7qZNAl9fWw8tWGeg31kp87tzafofxmBEcB+no?=
 =?us-ascii?Q?5Xfob0rsYWfZVtw27vZn8+LbOWFyUMopDYh+jtyRm7BT3eGJ8z7IBX4jxDLo?=
 =?us-ascii?Q?PDaxaG1+c9AbIruvf4EMcHowJNxLLzqhWRNS7fH9ycv70HaqxfHUEBiS1ARa?=
 =?us-ascii?Q?2ShSvbIceUiPhAtGgKvgUpQDYYmq3NyUj293CkQgkkUGeYB5KRofUkpn7wqC?=
 =?us-ascii?Q?RWG5s5PiLBoauXlmwaEqNwBG+fg5/A9k1H2BITtcW5X2bYxULv3jOyMYzeVi?=
 =?us-ascii?Q?M7R4wINtTVK6UfKLrNIOwE0WF3ZcxSjm0BaU/hrqbaVhR2y25xu/ME2zgH4E?=
 =?us-ascii?Q?0sbizZBsGF+t6GRGYjqtzLvUU7YBoofyUnjPgBBFVOSGrV+rwp3IHG8RasLH?=
 =?us-ascii?Q?OBgeJ3pIJmjywNHS5d60JHHJ3MDsqOPdQWfQJ/6oIpw5dLWveY16OWmxRoVl?=
 =?us-ascii?Q?CyGN1/w1KVoGNHhR9I1WLw63hh8+EAZL+ZOQSnlReGqYTOoVtB/q4OEOZ3Al?=
 =?us-ascii?Q?pLdVJhntondGeJkR7XToNaPEbU2znTUCgxNJjmMnqb52NK6QfXcXVHLIaXq8?=
 =?us-ascii?Q?wyfR3IdJE2fXDAr2ROY7zzg+2f+ZcP8gnY7+GWecSOnDJsp+iKd/HoD1ouH2?=
 =?us-ascii?Q?4hWNTDlWgBBWjF3mMubx4btRQZ2A0AWwx5V7bX8SKQNLYncs3nRcL6YIs1eA?=
 =?us-ascii?Q?KquMkDceMACmIs4zyBFgmLN+Qgi8Dc2VXRcnDpNSCGndd/Nn4howr298EOlE?=
 =?us-ascii?Q?TBrifraxbNS3Jb07SnlHcnO7YsazA/GnmMQ96uhWX1elS/teH7oSxLNKjJ7R?=
 =?us-ascii?Q?kKuPs6O2MYFX2vHC7pxGg5NYjpzS7URapJgYaV52fKWjhwrQZwHTk3b7tv4Y?=
 =?us-ascii?Q?kmkNPifcry4fOd1L4EmguCgtkd0/Y8eexcUcakx3gWblMpJcXISociGV10Vw?=
 =?us-ascii?Q?4oJnnT3uNapiwRyrA25pqakHxvu8dfWlKLWfmsldhSrOpCqaWWO8d0uGc5Ro?=
 =?us-ascii?Q?SXB72pQPJlJLO2buPbH2IU0MiD7iBaRmrAdfd5BVC3sqPqzVdYHzPBs7V2HM?=
 =?us-ascii?Q?Nsq0CsfmA+C6bPCYMUoDVz/mxLTlNlPMc3L07rUu/z2+6SauSuFJVit+v3VC?=
 =?us-ascii?Q?l7F6bA7qZuLMxzW9fWK+E438YYQaxF9ePJGYzsxEo/9y3Q=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d221769-5f59-4dae-a92f-08d8f33ef3e4
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 05:44:57.9695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tV8urTTh2YJkiqyTs6C9lGi94ELPdk+zvMV2Ed10ufohNl0kSu90pJKhVY3w0NtSrtdyS/m/youaM5GM/7xGJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4489
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Use the rproc_ops::prepare() hook for doing memory resources
reallocation when reattach an remote procesor.

Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index b05aae0ad7a2..7cd09971d1a4 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -317,7 +317,7 @@ static int imx_rproc_mem_release(struct rproc *rproc,
 	return 0;
 }
 
-static int imx_rproc_parse_memory_regions(struct rproc *rproc)
+static int imx_rproc_prepare(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
 	struct device_node *np = priv->dev->of_node;
@@ -363,10 +363,7 @@ static int imx_rproc_parse_memory_regions(struct rproc *rproc)
 
 static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 {
-	int ret = imx_rproc_parse_memory_regions(rproc);
-
-	if (ret)
-		return ret;
+	int ret;
 
 	ret = rproc_elf_load_rsc_table(rproc, fw);
 	if (ret)
@@ -399,6 +396,7 @@ static void imx_rproc_kick(struct rproc *rproc, int vqid)
 }
 
 static const struct rproc_ops imx_rproc_ops = {
+	.prepare	= imx_rproc_prepare,
 	.start		= imx_rproc_start,
 	.stop		= imx_rproc_stop,
 	.kick		= imx_rproc_kick,
-- 
2.30.0

