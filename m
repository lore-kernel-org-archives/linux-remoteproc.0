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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAA7C4338F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 03:33:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A568760F22
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 03:33:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238519AbhHEDdX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 4 Aug 2021 23:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238518AbhHEDdT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Aug 2021 23:33:19 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on0602.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::602])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49D85C0613C1
        for <linux-remoteproc@vger.kernel.org>; Wed,  4 Aug 2021 20:33:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGowfnb1GgCCnMdJzryKPqTuMhOP/yRqHVhIVGy8RVxCtdrjlPDHYV7ldHNEYxWo7L6W3X8sTOu84jchJd8xsQUGOqJmX4NkRQjJUQAxJfl9NHImyoTMF5VNu2aNBs4gxaNxl78ciKkXVSMxjC5yM76JuA3FJIzW9bQ1a0Kxp6PTUt8hasLi2mHoM8ylhMRl3UGPP8drzzYzUgsnuD3I461+A+DfjRDhCeGtnjhQccXfu/dBTP8rZNPM81AqI7e8KQEbsCOyOi/hMKNZcBNMpzk0LhImr5MIgItik+Li5Jnz3gn4K2hXxR01IqrNkiVSDEI6Y/dq2DOjPPCR6IfPwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nkgk131VuD+uhNQpJ3YGKTY2ONIZQ4oZ0IgMay9vy/4=;
 b=WXtojKVQo9c9NTdk784d3XIo1sVOm+Rfqeon9NKBasba5cftEtWYjFGG6MiNvYVGvQo1Gf0/pUYSXSja/P5SJlaGzww+sZ0YzS4CuUfa6V879P+eyqSFrtTf4ARmeyp1j71LaeYBETzvFINL6e4OddQxybNormUCM1SCCy0JC1VjhvevtfxuY1XmkjQrSWendRJKnhiHpt+9wb3ECth73njcI+IP1NhdqyWIBk1cp3qxl1p3rsnMnZOP2iVFOZ3yRuHc9hfKh5656Xudd4/bACcXYmG47bamlSZt79agJaK8LWCS2nJceh9Rmqkv9foHj4CJ+QWipa4Y0/0ye4y0vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nkgk131VuD+uhNQpJ3YGKTY2ONIZQ4oZ0IgMay9vy/4=;
 b=Ueu/8UrEuPiXWQsciXuetWwQyilrCg8nAIAPSwKpRUUBEHjFDhVMuuouC8ULDXKLs/Qm6OgYmwWBM+3jg575KpLa/xgOo79wjKcrTovOCgq0OVEnsiyF8E3MOLTRZ5hlTseIbRa+SPw0rMOpO9j4mnqAk2kz9il3hoFs/vdxUWM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DB9PR04MB8448.eurprd04.prod.outlook.com (2603:10a6:10:2bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 03:33:04 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4394.016; Thu, 5 Aug 2021
 03:33:04 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-remoteproc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, ohad@wizery.com,
        dongas86@gmail.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, cleger@kalray.eu, peng.fan@nxp.com,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH v3 3/5] remoteproc: imx_rproc: fix ignoring mapping vdev regions
Date:   Thu,  5 Aug 2021 11:32:04 +0800
Message-Id: <20210805033206.1295269-3-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210805033206.1295269-1-aisheng.dong@nxp.com>
References: <20210805033206.1295269-1-aisheng.dong@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0085.apcprd06.prod.outlook.com
 (2603:1096:3:14::11) To DB9PR04MB8477.eurprd04.prod.outlook.com
 (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0085.apcprd06.prod.outlook.com (2603:1096:3:14::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 03:33:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 342a8145-466d-43b5-b7a9-08d957c1bbbb
X-MS-TrafficTypeDiagnostic: DB9PR04MB8448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB8448B86CB8EC0D8A6BB2A12D80F29@DB9PR04MB8448.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:398;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T0DewMlTFGXhPBBPjkiB4xYpzFviSgz7A/oJH1kk0hJvp7hAPhj6DTp/N2svLC59PnxxiPspQnRKKEITh4CxEjdRE5F+pSlvObllhJkVGvqs/UEKHAkxDVhmNLngvfGp2EEZNXgQJ5cnxqCDTkCI+tu1yTlXkBVgrmTu2ar3AZbbCi6+QSEZYjBIui7EQ4VEmJI6Een9e0DBAjGRfAxVYuxTK5dZ8dvLmUJAZEGv1reGhSbft085oiFC2mCL3lBSORMqV7tXpikTveX4Fxen3PUG1WC+1sXiIC/xgHzZ2GUy41V2cDvmESOJbXzuwwt6NsE4RafYsJW0zR6I7G54ZwX933QWsnBxTGTSiB8N1jvCWMe3Zwr4qJbxWF1cwpaodIPnqvaZKDn+bvtmcsNZTCw4q4jkVkih7du7CODmswehnAaRjh3Lzncmmrp8OupuYvxGMu8hIFQ3pGgTXj0pYteJgXlOGW3XVroKF3a2p5rbCnP/JWpmxqyyepYK1OG1O4EV3RczbqHe9+OqbqSvn+orQO2YhDqs8T7m4jsGz5wbOPLG7TSMig9Z7dZxwtoQSj7LjraF7EZBT6hYploaKnwpRY3m4jcvyfFRBAyCXEljFJq3wrLk46DsfPDPXuH0yhEC12NAW6+zdtBB4bfALZ1cb+qvPC9M7IKh971DktUJ61KRh6nnMuOeLPFi4wb3e/9XVxpSBuBaiMdkJDtykw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(6916009)(6486002)(66946007)(8676002)(1076003)(6512007)(38350700002)(38100700002)(66476007)(66556008)(8936002)(2906002)(6506007)(4744005)(186003)(2616005)(36756003)(86362001)(52116002)(478600001)(956004)(316002)(83380400001)(4326008)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sGfYNHsfGa5h+OCLdYOyP4hz0rLmwj/jGI8fl8FypGOVcv/67FV3rBG3x8yP?=
 =?us-ascii?Q?+ZCXMulh/qqpKP7DtUUy5aCv141JvorE+eT+MQwf235lOpe5OpJjNKSMQnSb?=
 =?us-ascii?Q?6wmCZoKjInqSqQH2EqbFtY1kDB3m3c2QbfYWUEoV41qvbK9PYmuEw8KfZxf4?=
 =?us-ascii?Q?o2mZcYps8UnaBKTY6pK87TDrSJ6DpcOfqvDKdV8uXx1KbLsGVvTdtogLmU6P?=
 =?us-ascii?Q?6BCCKdI2WR7cDK+ZBPoL82oAftWtSZHoFFH0qqLMcq0AK8RWP9pwMTTPAOPw?=
 =?us-ascii?Q?kQP3Bo2I7WwSWEhmwH+3s7keqO/VheCcJxX6KlDHub621KcuL84R4nHqubYR?=
 =?us-ascii?Q?nMUNn8RP6FnF7G0VRsCg8LtW0gjbduuRnPVh+SSEDhWTj7e66DBQHIuhqlTz?=
 =?us-ascii?Q?hLiSquQOETZ2MOIIFfV13IGzvvLj+ecQlVR4YSNJRBp6jEULxDAHD+Mexk2K?=
 =?us-ascii?Q?VvOF+44jCAx865B38/Ryg5Muvu1p4Oyw0EOR0wrsGt7/w4nOIu19FY8virEd?=
 =?us-ascii?Q?mwPcL9dXHNp3jXSn0038x+G3/FAQ8A/iKyox6CNQXjvKKYcHtOioYJlTRFpd?=
 =?us-ascii?Q?68HFJeZkI25yn6EZgZobSpzyn3kO/z9HahZAee1GOwCB8jCJkSMAgLB6aD8t?=
 =?us-ascii?Q?UHoYI6v9E1iHT/mCa7Oc5NXyTIQZDQLL8RYShfwZZynlUFF0vZ+Jv8VpmxXt?=
 =?us-ascii?Q?QTjLsL+0e9Obt2x7P8JmSDsqKGj/GcO09v6YNZ/yWWySNYeohUqdBDLQPaoO?=
 =?us-ascii?Q?jjwVCaG/b3ZQMUqJs/1vC/H90uii+0h0Vguj3YzxLM/QS6hHNU4GaFbDXzSi?=
 =?us-ascii?Q?7NI+pfIUQ4Ro62JcjuT5WX/GDIspk3gCaJev+i4ap3bJlBIT7I2o5Myfd7SQ?=
 =?us-ascii?Q?GtZbUnZmJf9IhYfHinBde/ghqnVjLh7aN0rKlOfbDH1v7m+tFkdcj7DU73mS?=
 =?us-ascii?Q?FVpsaAnB5Z1DrTYY8iY0q5WK3cPwS1fbG7I1fAEiOwp0j7P7npQljmopIy6a?=
 =?us-ascii?Q?bvkgTUEfhMe5hh7K/ZsjmHnoP+czyl6+VvyPUs0ba4svkgrSIQAFBQsKderI?=
 =?us-ascii?Q?XWQdhFfwFvVto8LD5PYxmz27AbEUzZvVrGbqLqPnV50oe3IVmEfD5yLCv88M?=
 =?us-ascii?Q?fYEREkI8b1Kd9M5LaXMZseDpdToTzdCbAqWpbqjxuLyD+5Bj2neh56fTGjev?=
 =?us-ascii?Q?pY0t8pvWDchbXljO1UBYmTJimFhbaqdvQ7dclOhkPAcY5eY9OxLtV4lPzjjK?=
 =?us-ascii?Q?XUATuPRbGSD/fI2mcFkN4stVw1oQ26DXqXe4WYh4TIB5IQU0CGgT46n6WNrB?=
 =?us-ascii?Q?5UFVAVug5egbtlfE2+EZAJHE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 342a8145-466d-43b5-b7a9-08d957c1bbbb
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 03:33:04.2748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Q8o1zVgJF7Pjv4aEQ8zCI9du4oF24G9NLjiOCv57VcwSBT3Y3xhU036jQZ3yteSByLyuYm5RYOi6cS7q5pVXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8448
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

vdev regions are typically named vdev0buffer, vdev0ring0, vdev0ring1 and
etc. Change to strncmp to cover them all.

Fixes: 8f2d8961640f ("remoteproc: imx_rproc: ignore mapping vdev regions")
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
v1->v3:
 * no changes
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

