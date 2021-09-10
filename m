Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEDF9C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Sep 2021 09:07:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3FC661153
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Sep 2021 09:07:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232046AbhIJJIx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 10 Sep 2021 05:08:53 -0400
Received: from mail-eopbgr70078.outbound.protection.outlook.com ([40.107.7.78]:59136
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231946AbhIJJIw (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 10 Sep 2021 05:08:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mECDO3A4gE7qBRmq8jtVJNPXPi3XW6TDkwI1TgR01VhJYfONO+UK6cCJDEXrcqNSOFb51RBYvuMCgIl7cpd6H9rBkOYETT7aHJzB8NWaSr5fRvAYmUWvBGdp9oAHkN+8Njpne39pcL5hBwf60+g4+IeL7Bl9B/zP/p1P2zLWkR79t1cpk3WYjzM+02gdZxv0zbqvGQV+WGknCTafW4g/sj4Wnj0d89Ps3lCP5IJXNV9IWEb/yMCadPNMKISwfVlSIuu90w3TgxdB691od4vPDBiHikcquliARr+6l9AI1Ln8RyR1O7jNtkv34qeStrTUiW775ysvW4TCACvEZ6vDuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=uGElTsohkM67miVdnzYTuXfMqnGjMkYYUd8pFuiXw8s=;
 b=nXb4wc+0UaPoaPHRvHjqz/vED+dpHUm0Tm4w4kY4eYUA9nqYV99UzV597jRtLqhc/BdePu40FymJR+dZtpv6J1IC4+eo8xpBsZpe/aJFquVEFTBugsxqxrzRax8gJY57F3Q+0nNb8bSGrqcpcZ8VzSV95EVcZx50t21G5jAONpWhPzKRksMF/p++D+FYZzYWO+PdJsuAaBL0e44Y3+f8qFPsOwLg4yiEkumA86BY1Ixw9QgJzGSqK9QEW3j5WWPqpGAEcl+x5Lsu1lH9JLqxGZ9j0Mjx92ILk0ypsqTHY3sT92umtuI3EppYBXnIkqrCi/+Dn1HpyAtMsEgllvQUhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGElTsohkM67miVdnzYTuXfMqnGjMkYYUd8pFuiXw8s=;
 b=lvSuh7C82jmemVNEHi6ZfEeWxpebZH59+dk8dCvzozL2Pfhag9+zyjigMAZuLSfr2j3rRs7izuCRhezx1vx32o52RMyOEPRR9pNWPq31hRX3HnryyBYJCrb5bLma/8enKnaZT6mX80UcppXl/h7yssEHz9ZGG/lUUQFAfC9bBpw=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4763.eurprd04.prod.outlook.com (2603:10a6:10:1c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 09:07:39 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53%4]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 09:07:39 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        aisheng.dong@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V4 4/6] remoteproc: imx_rproc: fix ignoring mapping vdev regions
Date:   Fri, 10 Sep 2021 17:06:19 +0800
Message-Id: <20210910090621.3073540-5-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910090621.3073540-1-peng.fan@oss.nxp.com>
References: <20210910090621.3073540-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::24)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG3P274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 09:07:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d5a1459-dd13-4c8d-15d4-08d9743a7066
X-MS-TrafficTypeDiagnostic: DB7PR04MB4763:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4763178E1797482578E35AFBC9D69@DB7PR04MB4763.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:398;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bL6TVuC0XEsWXD8YLdfLiCoCo56uEReag30zrJ5P5Vm9/5pl5kzhs+3MezGNJJpbkPEP/ls2lob0vXkRptIroBprIbjgRTx9nOFwjL6fVie4FbPvjegJ7tQylhcDTJLSooDt601Q1M4QGMrxEWN/z0X9texhJKJkIeR1yHcjOf8ipBD7QONc8vaxXV+H1PTA6VGbcfJiDW+DXxXzeeqmNp1K1Dcq99vqaJoWZuxevsxuqbAiclmFFNyrRbqYT6Srp3O4svQrFhRPFMixlpfmuUOCOqQCJgtJKDwF3CD8uEOdPthLaKxtthGvcywUImTcJx4hfXJS+g4XNnNxuXFe4m2CfGN5OVtFPttK3oTBvuLPlMdQ4gfCsL76MNGm0G/P1QzY2OOENwjAt+QiXbULJtEqApAdc8XTFJzcE9j6WtmOlSu5N1tTb3jxEA3MYT02yXMYI3j1z59kDWyycmBJ296R5DlSugxkWOffOnvQ6UXE7TGDqQQ7KozOUbsTUdFxx/HZuVS3UKNj7FmiaJFJe/BHl7pSqnIoON+rgRMP6Ua5dHmGEVf0mulctjC/O52w4sQsB5S4cX61SHx6MKjTXZUkCAQdkeuD/WnMCvuPxucT6P9K03SY8FY4jGKadEAd5Bh0D/UedultxqFqsoVNk8cKskwhsG/7NqrPZMbaJBuBRY760wutTP3S5CIwA5OLMHeAkZZgV1xsexIrzhKsTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(136003)(376002)(396003)(6512007)(8936002)(66946007)(66556008)(66476007)(83380400001)(7416002)(6506007)(1076003)(6666004)(38350700002)(38100700002)(6486002)(8676002)(316002)(186003)(52116002)(86362001)(26005)(478600001)(2906002)(2616005)(5660300002)(956004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q9mOnR1AUMwZkqJBfZKhtDTnOh9IJ5PPsdP+5bYl18YuSSHWqhoOPo3xvi5b?=
 =?us-ascii?Q?BcuBMN9JiRjmjyC1qK3lB+TPlzy7g4IisuZ2m47nG3y4oKIjn8DvHydFJA8p?=
 =?us-ascii?Q?seJTEd73ryXHTEu+UlEIdNmh26xHGTNJQf55l2d1FL3le4K9F/u+WbU5fUrM?=
 =?us-ascii?Q?YgLJdAsn76bEpvzvYOkyLErXxDNuQzskLRq7ZbW+fdylc94LPDCX6b5f4m/3?=
 =?us-ascii?Q?axtSIF/VKP1FjEHbZw2sR46URIZviHZP1rfsGPwbCx5HnJnsw8x81SeflOjV?=
 =?us-ascii?Q?4fzqytM/+w08WfSH4m+xQtYgaGsrPsF6afgToiHHBeK98R160mevv3x0rpwK?=
 =?us-ascii?Q?Oa7jgJjsJUdm2VGWCQVJy7nKQHg0IF14v7/g/TlCHbSHe4n78RuZNk98NG19?=
 =?us-ascii?Q?K9CtpEl3WKpVlO98LFp47ggMthB+IMOgfdn0i5eba8UndzazjLvBKdyiqEk8?=
 =?us-ascii?Q?TUILHJKja/QCip8tIYVP4Oyj/6Qzvb2S4jZU3opDP9z5LZ1iUPjjozwan7PU?=
 =?us-ascii?Q?5+0Ao49rhcbMpJHGUcwLmRcsp4sRI8ex6NKFxeFOs7H0BcFEadc3gBX7FdBj?=
 =?us-ascii?Q?PCKZ8InhuFToF/pz5Cnkz3f7GiUni16Uzt3ggvJUak2xdc4K8yeEZqT+bHpx?=
 =?us-ascii?Q?Usgll68/CpDT219sZ8q2dkx+UuVR8ORihZxUCECBfP/NDZ2mrRDJJaz1mR/y?=
 =?us-ascii?Q?NxHVlmNpa3z6gZKV6BrrAOgLPfTTrvt0TdWSF2NoEd0xZNY5ctS4g85MQPHv?=
 =?us-ascii?Q?HQzMv0QiDbiWmuYiwEp9fdoka0UJCITyOF7nzQRqvbZpdFAXPd9nZV1OLP8m?=
 =?us-ascii?Q?7UZALTowTX64HdbL12F3BI1AwhvFWRvUanyTkEyn4llYjQgnOZL3T+mmfb7H?=
 =?us-ascii?Q?MASJcH9DQkJBjTlIHZNZSaCfqPvkJs0Ggdqr+y6dGGUCsBx72+LbX3uFn/8r?=
 =?us-ascii?Q?8bRsrcloQ6LRxARf7KiIOak5PaWiir1SQRe5R6ftdS64zRkGbkKtRKlP+dG8?=
 =?us-ascii?Q?rtMcWaA3Gp0jh9devnPDDHPh4cNj71wOKz2kFyujMSkrkGCtyuFLwkGzkpmi?=
 =?us-ascii?Q?UqvgBiyJ+q3axW8FG99MBJqLChxvTKMG6oqQZr+P4llJPBG005R4X2XlnOF2?=
 =?us-ascii?Q?Ld99wxeduQUugIGbkLFkIV+ypdiGj4XG4KPnqgP+2+truKPmvUbaNedBUqJC?=
 =?us-ascii?Q?yD2zo0SHRERw7WsW9L9GgFIbXo+15DTJ9EAOzv1Kz2NAgDM5vcpgYFefUXS/?=
 =?us-ascii?Q?FuvKdkrNWE7fTU+Ju1e0wTCmHf4UTc/on9ycWNJRUAZaz6gdjEYjJAXiSaJe?=
 =?us-ascii?Q?TqMoBKAl1rjvDWkUQKehYkJz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5a1459-dd13-4c8d-15d4-08d9743a7066
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 09:07:39.5757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDX71DCrhOacmVnisCn+HrQ92ZCO9Q47h0Xg+SWNjEHsnqNB07mrSOSf6aj2J7wXTOloq3PoaiUJmarR1TX9sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4763
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Dong Aisheng <aisheng.dong@nxp.com>

vdev regions are typically named vdev0buffer, vdev0ring0, vdev0ring1 and
etc. Change to strncmp to cover them all.

Fixes: 8f2d8961640f ("remoteproc: imx_rproc: ignore mapping vdev regions")
Reviewed-and-tested-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 71dcc6dd32e40..abfeac0b1738d 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -582,8 +582,8 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
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

