Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62878C07E9B
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Jul 2021 14:43:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4900A61453
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Jul 2021 14:43:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232054AbhGFOqd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Jul 2021 10:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232702AbhGFOqJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Jul 2021 10:46:09 -0400
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-ve1eur02on0600.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe06::600])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E541C0613B3
        for <linux-remoteproc@vger.kernel.org>; Tue,  6 Jul 2021 07:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0kqYH4/SOBMnVPJvDrUM1rSzffUgDpK4jsB9eYxNy1mM11m++QQKA24quh57aY2/gMQWCuX7i0zc5Qq0Ex59HiA6rcD2INGS0pnExybkNRfHYTh2tWk5PavExMxcaIIhTU6XiwOmAm5aBW+RqKfczcW0ZFK6tCwZo+6BNo+h2kqvzJBphATNTm/Klgts5mEJo1cDPvSiBKLy22kMsh3YlP/ZfdarwZGuhAkXHlslRNFVygamLi8XaVBxj24XDuSA21DQ5eFK/hUuzbeH9IYbXGwDxe2svfTisKWBSRhR29URdEra8MRZtc44600T0Qqy3YsBuDbwLb50p62OjhDrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZHQBKTWjUJP84BYYvM+TGZKiaReFS05jiEkua8sNA8=;
 b=TLVXSP/fpYzqKlq0wjPUmJiPJLp3R5TFXxxp3RzyXhPz/f0SxedLQE8YUD7OpXVTHiQOntUg01BuSHr35qBSwcPZ0167lu3FrqVsAFoxiBQe7KgxOPUyM+vCC9Nc1H230s2sya4ckoYk5RJbwkTKC+rxY6WpngF17MKfY6M5w0dpI2gcsJwqtGveK08FFmywEKbZXOSoFLbNH3v/rYLYDtKutOiLxVjsrHAWBlxCfENoYKvtHPFkJIJfURDvS4BEcOpXW0qnAjDfINxdzLvt4FYsfb3xu7/k0VGIu6IJxWWKDq7ybLcfyg3QZqGEbU6Vx1YemzulC+c8dU7Z07+gog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZHQBKTWjUJP84BYYvM+TGZKiaReFS05jiEkua8sNA8=;
 b=YfgnvMd3uIY1TAGoQ4U99/2tmK6G+H7dIS2yZkZ2eoQ1sMloXhVIkXLjM7FMg34zkrtN27VdVhDdV0ld1WUdBk89UTJ5y5+lL38vazjvLJwdO0spq6U/sxNyAu4nMT9AvBDxG3M1e/sZFPWq4cogyU02Xz3Ieyurkx49JVUCtoc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8853.eurprd04.prod.outlook.com (2603:10a6:10:2e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Tue, 6 Jul
 2021 14:24:43 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 14:24:43 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-remoteproc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, ohad@wizery.com,
        dongas86@gmail.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 3/4] remoteproc: imx_rproc: fix ignoring mapping vdev regions
Date:   Tue,  6 Jul 2021 22:23:34 +0800
Message-Id: <20210706142335.952858-3-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706142335.952858-1-aisheng.dong@nxp.com>
References: <20210706142335.952858-1-aisheng.dong@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0145.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::25) To DB9PR04MB8477.eurprd04.prod.outlook.com
 (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0145.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend Transport; Tue, 6 Jul 2021 14:24:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d63a79df-700c-46f9-dc6d-08d94089cc0c
X-MS-TrafficTypeDiagnostic: DU2PR04MB8853:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB8853E25C10797C7D5A75018C801B9@DU2PR04MB8853.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:398;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8F9dpXlhccOO9iAjraeWcva4JZO8ZjaUQrl2hrB/hzvquCe8Jh/bG7lSywrUwey6Wnng3lWboTQufXXEtlE9pHd2RSYjI7UxS0DTqEHuqDhuy6Lgth1I0rRYhWN12qfmX/6q+HEN3Ddxv+MGiqiwp2UffxAom4ptcU+pRvF4KzdHjMw9dpvFRid/yrfRFLo3FboYINAEVnPLcEf3zFZWfxHNrP3QmPnLNzX82aMK6zYtxvlhMPh8B+6y2v6xZ6M5tbpr9zffb5s7m0JEOnYC7ryKlnc7vyeK8OPYWb94TSmPMHNWbjtHrBeGzXJHFJvg8PwCRG7Q5WlcdQphJsGnrpxK1npGXs8pwvUsgp58BEb12Sn2ouiU23c42CHcZgXonjwpfEKOrB+KrcckBQvXM++8gHgQb6jrWKQvOaUzUIG5JNPBZy2JGXtaLFZTrdhBXO3LjJyUDZCFOtHxdC5TeJNldDVNvGRPd4mQYopiJaIsBUrOEHedfLfrLOXwttjH1orK0GBYdImXBoC23Viw87SN6XV5m1Y3ytqO6jvWvnFP2dHorBOLjFM8xxG8k2twHkyVnQdfiWlmu4uagiN8lTLLN3Oys/2KzpUibLaeB2fjwnTtp33YS/n4TFkmM+k2qqGuIxSwHnyZUpFVyFRR/qRLifogXJNAIV6L+xSVURgqlnm5CsKluNQo/u5CvF95biBZm6OrK5EJ3pKKbXiMYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(66556008)(66946007)(8676002)(66476007)(4744005)(1076003)(316002)(83380400001)(26005)(6916009)(2906002)(6666004)(38350700002)(36756003)(52116002)(956004)(6486002)(8936002)(478600001)(38100700002)(6506007)(2616005)(5660300002)(86362001)(186003)(6512007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bEWk1Sh1vL2iOSYdXcQA8B2aT6y6ZDzsX9nbRgrIU70bM6N8YMZE0043gZNL?=
 =?us-ascii?Q?iVFMR58FogB8MkuabkoFaLq/cm4+K7hZNzXmbPzB+3NmMWsJleWDkXemLSGh?=
 =?us-ascii?Q?2cSkYF5K837wKseBifrMLaxQDmsZIYIyUTPzodc8ONwvOQIlNTw4apNpPvQS?=
 =?us-ascii?Q?iNwo+QC0rgN2zlP4QkyNwiWGe3aFLR7GYmS6DA/E0pAv29yyNXfD4bvvzSiF?=
 =?us-ascii?Q?AciwlVIXteeMcjBmsbbj0ah0E1AfWf65blayvmTuPKBR4sKLCdWQbcOKA+TK?=
 =?us-ascii?Q?EEwUtZAgarSfLpFJ9bMaHHARLl235WsiH/MSmOt1T/dP4FaQuKytviKj2Lvp?=
 =?us-ascii?Q?5F5tdTiEhVeeubwj4RVqWRkyWNUPDpZB5q8wjcg1ztvZTxY7wJZleaWTMnEz?=
 =?us-ascii?Q?vFa4yJ2vYJ/RPYh53qaiiGqBpCISSYKzDYgJQF84CMTt1RyXcVcPXmsjQ0na?=
 =?us-ascii?Q?sOtML/AUeOpHBjUVvwt2zLG/H4siETxCWTQfnH7aUtVspWI+8qZzaWu3xkHR?=
 =?us-ascii?Q?7GIqWdGUVxUhr6sxUCFPE49kypwme5M4rqbRVtrQ4iQ7JxfVACeWQ9RVMyl5?=
 =?us-ascii?Q?iYsvs8ev1CDnWqRrZSdXbgGhXEaodRew+RkKEpFGu+eyXlK1wv0ivJevMWKM?=
 =?us-ascii?Q?chtT62+0S9hXFBNKgd+yDy3O4PwzIfsL+GTPPLc2ebVp3rlJuMfMa1AL1ZrD?=
 =?us-ascii?Q?7WK6tslzN9o9F6WGPiQQewLXo25mSEutQNZrwKf+1Jlrxjn7TYFU+rAOWiaR?=
 =?us-ascii?Q?6vEc6pROaNrlaC6q4HIirUp+32S7/OpCFajPdbNc6U5Oc4unvg6KoSWmGLTh?=
 =?us-ascii?Q?4CgkcdwCOlgayAjOh7TpkBLoMUnr3qqZtQsiKAl7X4N2VuPujm9UcssXC2+q?=
 =?us-ascii?Q?UVx1OWZWBsHZ8OT7hBbTtNyQdQacuETpibFyJaZ8B3AV25hKHziw4HylM3uZ?=
 =?us-ascii?Q?LrRM7WFnMuQwROLXIknYWC0xlJbUWCm6yxo/2vkp3pw47wXk41i3m5Xlv85A?=
 =?us-ascii?Q?4isjJowDeH4xiI8RCTauz9CbgMuUKm/ONBL4Ur+u4JZkqj6gsAvnCEE0zI7d?=
 =?us-ascii?Q?ckirxO5xW/1D67dy/1meu2OEW7Y3wy8HhkELrU298L5dyxfUYeIhJRELIY83?=
 =?us-ascii?Q?L88zTnQLWGTOV8DNJ/hSC18IKEN7jiHA9f6VFr8wlMy3xs/tdS3eykKqhwvk?=
 =?us-ascii?Q?6klPPbbzhCP9ngehlATRC4IA/oXVY56DYE5CnD4IIF3ymPMSg8/c4sFl+tpV?=
 =?us-ascii?Q?/dhjAsn2S572dGanCBZrmBWfwMDCKbPHaPdZpRu/UijcYYpqQEcLoxJHfAyq?=
 =?us-ascii?Q?OcQJa5wb/zsiW27nxKheNxlj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d63a79df-700c-46f9-dc6d-08d94089cc0c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 14:24:43.0386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: niLTxrIbGClhJPBnZ00MC7HVtW98KclKJ9U+NHhF7lHob7QECB4YULN3X+NnGhN3X8z4bZGHL98od9vtrkX3gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8853
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

vdev regions are typically named vdev0buffer, vdev0ring0, vdev0ring1 and
etc. Change to strncmp to cover them all.

Fixes: 8f2d8961640f ("remoteproc: imx_rproc: ignore mapping vdev regions")
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 752f8ab258cf..12de153abb2d 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -578,8 +578,8 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		struct resource res;
 
 		node = of_parse_phandle(np, "memory-region", a);
-		/* Not map vdev region */
-		if (!strcmp(node->name, "vdev"))
+		/* Not map vdevbuffer, vdevring region */
+		if (!strncmp(node->name, "vdev", strlen("vdev")))
 			continue;
 		err = of_address_to_resource(node, 0, &res);
 		if (err) {
-- 
2.25.1

