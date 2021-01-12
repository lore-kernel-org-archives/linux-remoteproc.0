Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0956C433E9
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jan 2021 09:51:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B71D2310C
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jan 2021 09:51:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbhALJvU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Jan 2021 04:51:20 -0500
Received: from mail-am6eur05on2089.outbound.protection.outlook.com ([40.107.22.89]:7296
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387627AbhALJvQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Jan 2021 04:51:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fc6aQlJqPpqFYtdf67KtE0yY2b9xBk0PNpiP+r6fd4O7Xg2jkXsxweAv5U8Wvb+QE9B1ULiAYl4hnMviRcb6hT9LFcVIosF/6hltCHidSXFB3q5lySRY1py/a4WjdP0y5t2NMn2netGcRlGXORCoIbm8KsRlESuBWODDPtQF9ez98DVxS2D26qqF7xk/9UyhmHc5OPdOCC4PoV476pb4whd5S3Vb6xcLZRZN8JHpS55WhPBaEpuXKhWVc/LSYZKrPshLJLXfvzCtEXfQOZA9jKiQYQGT1fg5UvAsUK3WLZAJjK56kMTP6WdLl1SlNkXQ70Tk0gzO7r1Zy/zavkJF9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAYqIU35UPpL90YeZ0RIqNWEqoHhxw7xzRqpkA7vL1Y=;
 b=c5TqpZPBzwqyA1T+n8R1jbNYHmDEQtR4YpcIfGEH9R7OoYZA/Puy8ZZFKRz1uNwxaWbZAL09hhB3eC426jSnlOmwOzoOIExFkIUrGWRNyBmfXOwHwN7guo61YdidVRpWJUc9jxHieko2S0q7c+XoMdnjiRYdKkLUIXT0XjiCnaLeL6LBXpfwbv7xcencLCIUHpPEFJND0mG9tp5MYxEPNeSnkSaOCMlR4JJNWQ59E3j0BdvGQmJYi0+CtGF86Zc9VjwAoLVlGlPQp57zyIEtgVMLThM5o6FQywKch6yRv4LXHea6rBvVh/xKmhTMGe3I8fHJvsojTmLIBBb3WQUNdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAYqIU35UPpL90YeZ0RIqNWEqoHhxw7xzRqpkA7vL1Y=;
 b=jh1apPLSA7uJ+eATiO9tzul6aQSLZkHYLjIfCNe8gdbQdWowKKLO4C7rCu5qmD66OentkoDs8iS9tmz13FrqNBxejV59t6S56Evf+FVIDJ1mIEYmscIbx9zCFlNUKlNkxuhye24N1vrOznJ6t/XbQgwbYh9PeJhGgLBMSJAcgEs=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB3PR0402MB3658.eurprd04.prod.outlook.com (2603:10a6:8:2::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Tue, 12 Jan
 2021 09:50:08 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 09:50:08 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V6 09/10] remoteproc: imx_rproc: ignore mapping vdev regions
Date:   Tue, 12 Jan 2021 17:39:18 +0800
Message-Id: <1610444359-1857-10-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610444359-1857-1-git-send-email-peng.fan@nxp.com>
References: <1610444359-1857-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0212.apcprd06.prod.outlook.com
 (2603:1096:4:68::20) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0212.apcprd06.prod.outlook.com (2603:1096:4:68::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 09:50:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 93b9f83a-54b1-4461-372a-08d8b6df720e
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3658:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB3658585FA6E03BBD5270A25C88AA0@DB3PR0402MB3658.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vqWAeh//YQorbhcxjwTFwcm+61h8mB1sM0juYpMSScLtqKsmQxsAxD5gf5CrbMAmY9zIVQOt1kadw+Z78Q8ny0mJbY3cyASUg1bDx79vJsgHoJisL4ExTMYcBWy0M3zGUYBGXh5Suq6geiMfDoHhImuvTgWq+AzofihSiSxjgw0kkcExRJLMUHKQSv4YBL24R0qNtuUI2vjbW2i6cNrQ+uvDp8gzvZqFZ6Q0KvFfZewjpLPireTZOvigCLGhAOKCGctEU+LqDCKZs55RP0sXMETCU8Hdwwtr0V0OjDXAYzQxvitl8YaPaP/MdxwBCWqOJDmlL5eYz1TSiAW7iCkBkZNNcsPziGDgJM7+rBIo4rFi6fnOWJyXMsxaDXH7M70hB8s+v3BCe0K/b1fy+c1LTyLvx2++nhwGh6rre1Y4NC70uvErxjmZqWzIv4UlsY65L301ijrBId8RdWP7bCmWWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(26005)(2616005)(6486002)(36756003)(66946007)(66556008)(6512007)(52116002)(16526019)(66476007)(86362001)(7416002)(9686003)(6506007)(186003)(8936002)(498600001)(4744005)(5660300002)(2906002)(8676002)(69590400011)(6666004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YGv5kX7ooN066MaUNyMr9wKgF+azcYhrH4obzNuTwOHlpMBpkr6nZbp/+ij6?=
 =?us-ascii?Q?ue/GwsyAG32VyXCDsJXdie7cLaafufs9SxbqkeaLS89GWSrEiw+n2hPrz40W?=
 =?us-ascii?Q?oxaF04DsLaRSRsJgPWzh8rchGjSJaNKDROKMRU0vRW74A0cExLIDqWJMGi2o?=
 =?us-ascii?Q?m1X05W5dbA+CipgAFwvQxCq9MRYG4uivGH2G/EQXzhg3DswNwlK8exK7Htec?=
 =?us-ascii?Q?BXCDamKGptEojVK2RwBh8i/GGurT1s5laNIhF2c9HnW8+57BfLkRXD6ZYfvZ?=
 =?us-ascii?Q?UGrzaIkMPf+757h7THsnHjHUWBPFMJRi0l+b4Q2lRD7WebqVjG6selID/Lg3?=
 =?us-ascii?Q?63vfpetDM8RWO7gfmySeTLYyBeMnxtQaYwL/iXLSClxEPxIO9TZSEMirDDgg?=
 =?us-ascii?Q?6IWgjAExU5QQGifPi5u13M9gjHAgX8xplONWyp3xz5nYX8UhBrJ3e6r7SBmS?=
 =?us-ascii?Q?shO/ghU0VSaIg2dkxc1+/Hk6ff9PMtu8uhka1eB3nhtD0Hpf/AYQv3tkYxkG?=
 =?us-ascii?Q?pCscL5Cg3j67mfY1+kidUIep8QJL3dt3PeaIaAVO9vdmm+7DXuUonEFiTAqq?=
 =?us-ascii?Q?HNzpmNkNjHlDFI8fN1UwGghCuuiv7Al5YSigfkwxXCt9qqnwmbK9r27OVP/j?=
 =?us-ascii?Q?jO73v1XH+sON0FvgCQLUFG+1qhWQbJoD2CVbneECx3Kgn40ckGlhiPu3tV2Q?=
 =?us-ascii?Q?Bwy7+ibsWlqE/XEWcmjf/2Q/X+uNx3wlNvmD8eJSm5+n6vZXfA9q/lnjWRzm?=
 =?us-ascii?Q?3rU0DiRveIm4JYE5Sgv5Fqq4PY4GqNTebdNwxrokPQ/R5IZRbz3V+yshqPag?=
 =?us-ascii?Q?yDN6xR5S645+OZYE3xrhKWWnSpSU8KZY55JImAe1E5BgkmbXG813StczgsvW?=
 =?us-ascii?Q?su02OEhTdcKEh3lCvE8N8bIcDpkrZZfCw4YzqD7yZIbIVpsd5YSL129lMCOk?=
 =?us-ascii?Q?X8Azyvp80SY9mziS/ABhYRTe8WEAzT7u2z27BgGUP43McPNTHQjL1n3BAZcG?=
 =?us-ascii?Q?mpOR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 09:50:07.9781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b9f83a-54b1-4461-372a-08d8b6df720e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8bd4ErekyLJqVWmPBhRTS9ZvDRMi+HbPQXfl5vKd4RIn6zC4YkEKBAaJ4vlSYTPqofMsBzcQ4IXYJvWnRg8avA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3658
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

vdev regions are vdev0vring0, vdev0vring1, vdevbuffer and similar.
They are handled by remoteproc common code, no need to map in imx
rproc driver.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index f80428afb8a7..e62a53ee128e 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -417,6 +417,9 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		struct resource res;
 
 		node = of_parse_phandle(np, "memory-region", a);
+		/* Not map vdev region */
+		if (!strcmp(node->name, "vdev"))
+			continue;
 		err = of_address_to_resource(node, 0, &res);
 		if (err) {
 			dev_err(dev, "unable to resolve memory region\n");
-- 
2.28.0

