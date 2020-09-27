Return-Path: <SRS0=lozc=DE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DB3C4346E
	for <linux-remoteproc@archiver.kernel.org>; Sun, 27 Sep 2020 06:15:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AD34221E5
	for <linux-remoteproc@archiver.kernel.org>; Sun, 27 Sep 2020 06:15:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="L0+R/4z7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730370AbgI0GPr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 27 Sep 2020 02:15:47 -0400
Received: from mail-eopbgr30056.outbound.protection.outlook.com ([40.107.3.56]:25733
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730355AbgI0GPp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 27 Sep 2020 02:15:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXVqj0cqqO+SoP1yOMxo4W+aiZWWNYFbxXh7YZsO66zSp720eLNnCXPDD/xoCYzLM7aySHOKj8+j9AHPEsQsz49Kltozf/rPjbKwyg7sJhw+FzTFPAj2gvm3O/ISktBubyMFtJaEeNZRuSrr15/985Yv5dxJ0k6Yy0gLXZcsyjgyFKtvOBD5cpUOjn63S/JhYk+Pyms4WHpFTouZ1Ppr9PNEhaeuJ1Ol7+7do7QoVzi8vDj3MjrWAv2G0n54IFluE/iZavJClzkAF4R2I/CumGJEgS12quY335dJdYj/3l1qP/Px83Py8WlF9jyYJxaI1r8IvKQJvlodH/YvdQGLZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WvGSGcKYc3VMskfmZvqWpDA0bc+3FaTKmuy9Rjb6Dc=;
 b=iy5YKYlPNqHjHZFbHMsXPaYkZX6TlCYG5H153W3ZLyJfS/0GwS6Mty1xE692nGdKZ+IqdcrsDEaS5SbX7qavFfhiuKxxABXDcqh7lYWIvRXPbA9SmZmKo0oUcok9ktJxWHTPcR3nd9QxJudr+x9wMpYWH2mrzVK0QfNEtH+Q6nApRxmc0eFteco/fsL8nqBg2x1+xQaNnbSdxXKCyMz5MAywut8I50/EKuY3JTqFM4M3S1eGXxOIa/ZPQ19I01mgSFK7YWu4Qp+4iqqLyjYeTWmPHtBe2ctB03UFItobDRUmmItvV2Q2H32XX2L1R8B7miL32xlZ4rA7Hqnm3fp7Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WvGSGcKYc3VMskfmZvqWpDA0bc+3FaTKmuy9Rjb6Dc=;
 b=L0+R/4z7R6msmFxcwOVsVs5+EYUlmeWplKt5IdIXIE2CIF27ewAmg0W+SGeG0BbA2gGDPSo7eqRUYI0lpiOV/eD5lWqCcQNo274cmDrxvSpacSEF95zs219Dgmj2ZNsSxRVjgRBUdi2AkOQXv20Cbhrse/H2DfNZTOV40q5SH9g=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4633.eurprd04.prod.outlook.com (2603:10a6:5:36::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Sun, 27 Sep
 2020 06:15:41 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3412.028; Sun, 27 Sep
 2020 06:15:41 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH V2 4/7] remoteproc: imx_rproc: use devm_ioremap
Date:   Sun, 27 Sep 2020 14:41:28 +0800
Message-Id: <20200927064131.24101-5-peng.fan@nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200927064131.24101-1-peng.fan@nxp.com>
References: <20200927064131.24101-1-peng.fan@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0178.apcprd04.prod.outlook.com
 (2603:1096:4:14::16) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR04CA0178.apcprd04.prod.outlook.com (2603:1096:4:14::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Sun, 27 Sep 2020 06:15:37 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4ce5f486-4ff1-46ff-67d0-08d862acc2ab
X-MS-TrafficTypeDiagnostic: DB7PR04MB4633:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB46331706F1C21AEBFEFB280E88340@DB7PR04MB4633.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GR6VDWtohUMF0SxMOKJvEW30GgUmuQX2pExXiI3lLi+7lhFsYmn4SDOhxa+9MDsZjZ5Ir3VJttPoZ9OtJ7nVUNWvVpJHojTFNX1mblRxeUwKhcr/IS8CEcMP76AUEpg8MvDnAHSDlN7b6RdNdEmJeJM5KNeYcDquK+sgn3bE9ObA5btJigqIyBviRc75hghNUD2fVemjp+4ddYfFDDlH4ghIuO/BZRvaFIdKMl6M580G8w1efIG6aGu+7fgBvkBChZ93Pd+DMq5PbXjKa/zPXWDwtVzc4P1xV9HwCZsOFB/ismHperRPPOHOr6/XdTIbFRZeSCRsZlI+xOJHhxxRpDTFJS0KCr3LY3poJuJcV667yAM9M/7GR8fNBbarfzyX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(16526019)(186003)(52116002)(7416002)(6666004)(6486002)(54906003)(316002)(36756003)(1076003)(44832011)(5660300002)(4326008)(8676002)(2906002)(86362001)(26005)(956004)(478600001)(8936002)(66946007)(6506007)(6512007)(2616005)(66556008)(83380400001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: z/n3/HYegAA03bh7l5Bx/SPPUb+IcjYqjgMYj6aWVXENdRPiP6t6KuTV0rbpOiV3mAZN/Jw3t6bVCq9Ht3Sw+TzuwiODX9zKq0xMOulcaX/uOfBshOZK7th/kMHL9Eqjc4MFxKcJDpa9J5URnuMKfpj7TLsVsJjpI4L994zxf9X/RG5BB47pWNC7NTRB4hSaPcWmUVIULNE2auRYfZpiX7fTJsKtJT0G0GztUHHpd+PxbJsgraQO2ly7Os6QrvZSSIzUKgVfQq9OHf2xM0N7O5xrBVm7jQe05wbeX1SUC/PH1YydtVlOMKV86r3C7sIQ2NLgrVJcjdiH50P6Y9IZlQ7FWXi4gENGIGbEFVWBqoNTs2IWCwlWGsugYIjC0m+OeRZb02kNKnZqx1YZsq2J98UeGVOxAKHDHb2co6BD2b7rW+d3FdvFgEeZH7Fyjm8MR+qk7C34mLrhdB19IcFA82fOgQEWNb2cm0eH8XPBwcnudWgwrYKVwgRBcocDMdX7ZWf5rtrGWovgbWYMz190D603f0SSaGxIHClDT3KWZIv1TB8lvCPYjKO4HpTtodJCi2HEI444As+dn7wxzkJzezHu7qbiSxUDfE8qdiyAX8mkhQs98FenGYLwiG7WVrEPRW4v6ZUSTFlVQoW+w3EOog==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce5f486-4ff1-46ff-67d0-08d862acc2ab
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2020 06:15:41.6123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MLPjEJtaMWzJxyCJp75x6Eozf1cJEalBMVAlFhlBfcN3UCwAh0/Ur4UCevYC3qTOQfGDOYWUbNSixzCRVPYUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4633
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

We might need to map an region multiple times, becaue the region might
be shared between remote processors, such i.MX8QM with dual M4 cores.
So use devm_ioremap, not devm_ioremap_resource.

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index aa5fbd0c7768..48ce09e857ee 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -298,9 +298,10 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		if (b >= IMX7D_RPROC_MEM_MAX)
 			break;
 
-		priv->mem[b].cpu_addr = devm_ioremap_resource(&pdev->dev, &res);
+		/* Not use resource version, because we might share region*/
+		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev, res.start, resource_size(&res));
 		if (IS_ERR(priv->mem[b].cpu_addr)) {
-			dev_err(dev, "devm_ioremap_resource failed\n");
+			dev_err(dev, "devm_ioremap %pR failed\n", &res);
 			err = PTR_ERR(priv->mem[b].cpu_addr);
 			return err;
 		}
-- 
2.28.0

