Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B19D1C07E95
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 09:41:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92B3461C7C
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 09:41:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbhGGJoQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Jul 2021 05:44:16 -0400
Received: from mail-db8eur05on2076.outbound.protection.outlook.com ([40.107.20.76]:12801
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231223AbhGGJoP (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Jul 2021 05:44:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bghOQvAqtUS6JN//fAmw4chWqBLSkB4SIMnzsPPVhTF302xofKyMl9Tu/WhLQrFAu7nZEzFWWrYyTmiN5DmZdHUBEypeWU47n/Fp7oQRLUC+cLCrC1cu7lLjhhn8Wg1SIR3Wfh4zP1EcpGAU3djh/3GDD7knIAtYto/A1Pa5C/JUaVMwD1tow3C1RSJC3N/xjsbPXtU7yT5XYjjhQk9h/HYX7s8EF1HJqBzy8tTYEYKJlJZ9nHTtorEQq3WQk0biTT+w2XO2sD1dLEhtgiVBLjpKluOgbC0JnIw6hW38f+XOYwiPBTGgqXq5QlXmwk7FfTBQJoFSDxohgz2WpCg8ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9031WpIjCstWowIFUsijoHpz/rOg2eR5mjmUhbJU/4g=;
 b=R/JQZoN94SZmmk8VvLfuUujG+8PBnHmNlYgVIiHnoDeEFC8S63GxDKpy4bwTznJx7XK9OAuQnikUcdMjdP6lEYWauLqNhngQKkmhh3q4qegBqnsYy6GJXUMRxtl4scxTLY3+2Hbl4SEw3sinQLMz/+WFgAQ3Y3MGU9kd22NgQIkxelehiAbd12khYsXmrNhHsuYlT/Ku5WNirygvATb8j/tsysdTnC/fdkaMYTuOPiXPJTDv34MhowYlwjqTO+7oZlvMiwiZz6Wq+s2fL0ZNmzxXemO4gMg5QksKb1zqEjAHhZG3KPFRrDc86FZ+Q2baOgza+6QhNlcHreyjyWgDsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9031WpIjCstWowIFUsijoHpz/rOg2eR5mjmUhbJU/4g=;
 b=SKC7d30AdIOHw05dgSrwWvDqd7vHr2Q3kHWEHl87JNU+BMtWv5EQWoYun/6+usPPvJHms5aZ939w6/umZMjjytXURwDCj2CnMX0/MYIwUW2bsHnIw0dFK59qvmI4mlCBVunMBWtrOzcTXpqCrZGQWrIkVnHg27cD86KvA8R4sCQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8565.eurprd04.prod.outlook.com (2603:10a6:10:2d4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 09:41:34 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4308.021; Wed, 7 Jul 2021
 09:41:34 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-remoteproc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, ohad@wizery.com,
        dongas86@gmail.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, Dong Aisheng <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 3/5] remoteproc: imx_rproc: fix ignoring mapping vdev regions
Date:   Wed,  7 Jul 2021 17:40:31 +0800
Message-Id: <20210707094033.1959752-3-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210707094033.1959752-1-aisheng.dong@nxp.com>
References: <20210707094033.1959752-1-aisheng.dong@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0112.apcprd03.prod.outlook.com
 (2603:1096:4:91::16) To DB9PR04MB8477.eurprd04.prod.outlook.com
 (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0112.apcprd03.prod.outlook.com (2603:1096:4:91::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.8 via Frontend Transport; Wed, 7 Jul 2021 09:41:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d1a7a1e-5668-4632-2e6b-08d9412b687e
X-MS-TrafficTypeDiagnostic: DU2PR04MB8565:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB856576762605B299485BCD95801A9@DU2PR04MB8565.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:398;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gysN7ltwo/zxubAXabr9WHJNFTZITUSguIYTsnAHG89nZDVTnhOpAhIAoWViynHz/I/+S8qumwaHqpgv3Eox+JNT6Z/UazOq5xHI4LYvPycqaH9HivmmzUr/UeCimTXO8VLsYz0Va4vR5aFwJwiLvV9hL7XwbmR/t96+siRhFY1EmmIn9tXLDXikmMEKR1+Bpdbzzpzclu1D9f+TO24EjFbATrxUL1OSw6tlKlpC1F8jDXEUdE2XTB9BBAGS0uPuD44lRR/q22KSOQ4Lgbt5v51XUJH4zPYUBKPXeAPmAAqUx8oe0ceIllZROcCw3SnPjUYm+OQBI9244+xJlDra23rj13VPkyEliw7vbIQxGUyUcojC47/+myoLPqYSrjn9+s6M9OxIfsCiH8yPSwvsnoDivg6tFeCAqUO3iHTSrs1rSOboLCcNQ/hPwAunMrkKOJPk4JKRG3gw4VaYMO4rB4Itz9BuMR3r8foYCr1XHv9ocU43nXH2gDTRQjuLoCQeGNrNiFTsDjOliETVw8EJZIS4j3i6JaNCfNV1tGc+o6tvlSDkCT6ivE3KP5OMKai0pbqH9ja2D3ccxXoGaMM8qJ6g540ejV+ANVj4GjwJlUl/86TBpcef6c2KeKAh65EacUc3/JO0Mg5wEj7kgqSetM1qzMFYX1O4N0DpgIGkTl9tgcjWcON4/xfn/8/GMbZFsF9XrGbFOa/ib7y3+2fsuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(6506007)(54906003)(4326008)(83380400001)(66476007)(5660300002)(6512007)(8936002)(86362001)(26005)(4744005)(8676002)(478600001)(956004)(316002)(6916009)(2616005)(66946007)(66556008)(38350700002)(52116002)(36756003)(186003)(6486002)(38100700002)(2906002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LaSv0rpqbJt4ew0+heKs1JX8ISsfLObf3nDHpENnJl/ra8GjKw4LFFzu4+TN?=
 =?us-ascii?Q?QiPv65t1e3zs8Fz+FjJNRbE9w4Pmcg0BntuhwWw6+Xy8vJ7Ne04z2jIVaFYW?=
 =?us-ascii?Q?dtv2YK/jxUteRdKeWisbo5r/UgaF+laUbcB79/+oXjV7vSGHQjEOvyw4UPjp?=
 =?us-ascii?Q?tgroEJoGc4GNzXHIC5iEh7KnpD5bFpuBXnNKhZ+ncub3XUFHZlN9vS5oFS4j?=
 =?us-ascii?Q?Dqiw64jCrI09LeeMIZA4hhMY0SCP9TM74XmTOEGsfj7V7vKObCK1CnHW8SvC?=
 =?us-ascii?Q?gl3i9UoRBQ7F8VUiHSi+KynYVof/+9trIPNF3MdMo0Ucy1dB+uqC+nrU5Pxi?=
 =?us-ascii?Q?obl9kxGoCFbI4GDoBNrHz+6iDTg/ok6VKSB69RSGeNG9UjMNjdWwodXCzvd3?=
 =?us-ascii?Q?ol4vo8jpoeDyJHwBhUhCNqY332vO12vvDpzWpouDoNabemeWPpVuLWXFN+XN?=
 =?us-ascii?Q?GobQs8JZ8JRXZJZt0kxkp1X2jZBVpgWWEbeNCCQC/GXDC6FyuUnPtfj5gRdM?=
 =?us-ascii?Q?+9hEjJNxu6wWeYXwHKT0h5kPx8EKo8y3Yh/w36vdVWVXLbd0w/c6KHudusQi?=
 =?us-ascii?Q?hUQ1nh98xXVn2XZ4+vEzt6frok3PmJ/uUx6a0iCAK5w5r7XX9o2RtkpLPcqk?=
 =?us-ascii?Q?zsmtpjBpZkz39X6WDQkB0qkCE9e50OrYqPMTW9ujCEp59WCyiy0ZEFGomeSp?=
 =?us-ascii?Q?t7ywYIWJWCxUrQ3HnSCY+qksH4tb5Gr4xPudg1BbdvP52GOAXOYdXCVfOY/I?=
 =?us-ascii?Q?B7LM3npmPDNb8J1TcHTx7S3GFC/8cvGmBCrUvyY956BNhzd3Ftw4g9CsGnDm?=
 =?us-ascii?Q?iilF3qexEtUiXfS+mxLqJN7eGquHXtO2di6X3BrXr+b8EFE/ZOpYO6Oc7Hh9?=
 =?us-ascii?Q?6Og4HS3d+za8YT/RpYMFjy81HXo24/FcRupb59tLukCXSFPkcS3xn7MevkAW?=
 =?us-ascii?Q?k2qbi3aBEb9K7ehm7dHZS8OlGeEhWBKXupuxtLjpw364AUONg6PpS2mmh1Vl?=
 =?us-ascii?Q?rlBRBZ4yafGnCd3td2Wl/mX5aq8RqFWHd7B/fMczxivSBsnXqU9fRGZNOm9E?=
 =?us-ascii?Q?nAqLox2zh8oGPudPpz6hig871nVnwwzh+6CKa7c52zfWVF7XS3TarTgUM4J3?=
 =?us-ascii?Q?7gi22BEGUjTEBz/iqv6nCq7REOj0j5f32CoERQcHqGRZisFXT9kmY/yL/jki?=
 =?us-ascii?Q?AjeU8DD9xBBs/fDAM8TEUmqSd8ISNHASuBGVvtSn1lqecMuq8bT3mTXWlTJP?=
 =?us-ascii?Q?lwnKOLj9Huh4JPgB9uuuNnczV0pAvzQLv+UUFaZXslwtZ7RN9F+TNa4nBXzY?=
 =?us-ascii?Q?QNYPm6JAOfDZtC2z0zsLgfqY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1a7a1e-5668-4632-2e6b-08d9412b687e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 09:41:34.5121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rU2Ghdo+PyXo5Z0yTjnnSTUs+xSMsTAKcTMPYen7ZIlUgzqo/Fh04XT8cbYaPjkjjCwsAwvSt+IyKjIBVYRunQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8565
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

vdev regions are typically named vdev0buffer, vdev0ring0, vdev0ring1 and
etc. Change to strncmp to cover them all.

Fixes: 8f2d8961640f ("remoteproc: imx_rproc: ignore mapping vdev regions")
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 71dcc6dd32e4..abfeac0b1738 100644
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

