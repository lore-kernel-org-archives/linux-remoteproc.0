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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE28C433E9
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Dec 2020 03:03:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9F4A207AB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Dec 2020 03:03:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbgL2DDP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 28 Dec 2020 22:03:15 -0500
Received: from mail-vi1eur05on2084.outbound.protection.outlook.com ([40.107.21.84]:9185
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726825AbgL2DDO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Dec 2020 22:03:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdJ0m9GZJBK2dytH/Qf6mGgWmubgOzPigmVwoxZn6dH/FGMustK4Bq45Ei/0I2fe0G7nmNGU9xBo1xRqeChs2SYg1esjqAkzMkDpie5LFaG2yzi7h6WEivTwCh6ogwpkUGLqel1SaMmVcKp3Jgc33p9+84/XiW1iJHP6O7VRaEXqYiK28tGwLknuVYqTutXSEZ4rySTwK9yXxMfvR/EA1eRqMhVKlKNHhs2KraAYwcDTwwCfKnUBDUA7/UFcB/iTHW/UkkuJUk19o2FeJ8OdMsC7dQJKcBvzSaDKkq1Ku24VEBM9RH099f5B2Jfu+L/izfsimt/o+gqW30RrAuGbWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAYqIU35UPpL90YeZ0RIqNWEqoHhxw7xzRqpkA7vL1Y=;
 b=H4oNnleYcJt5pTxN4aeo5o/UC43A7ZGLvM3V8KW8BCtvVXJyTBy31LMd3LzKtXvKXsby09KSKeoEkRNDNwTCdDjkKgVCpEPH3TmT70SD30s8TCjdqJlJQrgx5AoBL2/29FqaBZ4q5Di9/dz/NVYrRjufoNSv6CHqNAFZUFnIerSlP9G2NLxtoMrBl63e7kV1WgLDnacSDTxyLO2AtpDlWeLo5JuJXDZ3MBi9HVGtXCIOGH7Kkf841Rh2dBYp6XfDgUGIIJj29PwlLvwBYjjNHboKnFwU/Fl/E05pPfxnMDFq8NHfXcwMf3VzUgqvDKWD1usehBOEBjoHC2Q4JxlG4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAYqIU35UPpL90YeZ0RIqNWEqoHhxw7xzRqpkA7vL1Y=;
 b=GipVXkfns9ZObFPRi4lY1yay9EwHOCevj/kPz4YqMbcUlUR3k+lussCWCWrVgtUJVUVuVeYpukOYLEhWqHRbU3mIrzsDnzgcs6gj94YsOZtNGCjvuHot8QBGpdv2YgyO2Y3kodN3f6TF89+9taNwqZN5PUr7JlF2INavn9BWp6s=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB7180.eurprd04.prod.outlook.com (2603:10a6:10:12c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 03:02:24 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 03:02:24 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V5 7/8] remoteproc: imx_rproc: ignore mapping vdev regions
Date:   Tue, 29 Dec 2020 11:30:18 +0800
Message-Id: <20201229033019.25899-8-peng.fan@nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201229033019.25899-1-peng.fan@nxp.com>
References: <20201229033019.25899-1-peng.fan@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR06CA0178.apcprd06.prod.outlook.com
 (2603:1096:1:1e::32) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR06CA0178.apcprd06.prod.outlook.com (2603:1096:1:1e::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 03:02:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 982e36c0-1497-4c5f-87d3-08d8aba62ace
X-MS-TrafficTypeDiagnostic: DB8PR04MB7180:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB71809F634FBC43D2F4E8A5D388D80@DB8PR04MB7180.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NHdFp6soMlFidDM/XDSX19WDGPlTcQVl3NJ+e0GRQ8frdEssodfRp9riTfrVkT1GAZFwKd2G0qn/MBzHwY0sLQuuQ5wQpMXdq5P2tBIO6BXYGXfjAn70Envm6XCsttOv8bD5WlCuLWt9v5Ro98vfAdL4hDHffUOttl25Q78P81Cdf4WVq3VPG6nJkLJd5GkwsR+AiECf1+thPsTCS5l3UChRlrebvP3BMgLitP3xS2JtFCXFte11tl95wyQYfVfMU1hAcf7159V/0tdvnEDk/qkM5XRu5feVGrFHWDqlF/JnxDZlDMMHQpUjE/z17F0HYPzeuKpkQFDRvSt/40116XwB1Iz6rZhHpevP+8Dlme8BE2fqYa2u0cfmwR9fmCIGyLu1FcvmDOpRwiizekxJew==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(52116002)(6486002)(6506007)(956004)(66946007)(6512007)(16526019)(5660300002)(26005)(8936002)(7416002)(66556008)(186003)(2616005)(36756003)(4744005)(1076003)(316002)(4326008)(66476007)(2906002)(8676002)(9686003)(86362001)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+7AffkZxpYaia532eunqev4GLOzM0qTStnAnEXJcr2yDZMMPj8sXOTrMQ7V1?=
 =?us-ascii?Q?yb1+YctXVEhyeVCx9CMviAqXogWkPXMIktfoDuxtE6aeTrwjKpFqQQ5K5JXZ?=
 =?us-ascii?Q?puXX/o5KYFRkmfC1sw6UO+py6D3W6Zu010qNs9CjwoDIyCdskC4jLDEJ+iN2?=
 =?us-ascii?Q?RdywSSRMk4BBiWl6IujRwkrahnb9Uaw0k33yOHHY5ixl7CJXMVba3GXdh1iS?=
 =?us-ascii?Q?223zOjGjCZJBrj3wE/BVZvFd+c15jJLlynCvRMz/tWVi/l9ek4mOvn07FRjG?=
 =?us-ascii?Q?XGfrpCl6x/mvMnODeuy3ol9Qpufc7EPR3uQOTxrkyqJe5bjar716NBMKAKR2?=
 =?us-ascii?Q?oh7+o+zfAidFo/wfvMSqWR50TBueOfC5jPiLRfHgJZZIKB2ReiiQiNbEcKdD?=
 =?us-ascii?Q?m97ylaWZd2swe7du91hgTWQQbLeuCTEd2MhueuEYuaIs8eetvFX5Y1Fav9c8?=
 =?us-ascii?Q?2mOmtjKkvy4RAMZhcMDhyle/fOGDQrIajvIDFY+SbLrrGYhysDpWr4BBPDL5?=
 =?us-ascii?Q?ajwwHhlreKFW7092QtgQK4Xh67kY7AGMR11EumLJUtnKQy/24wAqXPykWdqi?=
 =?us-ascii?Q?W4x5km/axygQhWgWNGxaR0BxxhuLlC9Imgyq3oT2svqUewW40plwqlvRkZYL?=
 =?us-ascii?Q?Wyd62DNXvlsHjDvk1WLDfAFv5kQ59oereivnmWOpFJx2Dw12V6xu5+0E4F2s?=
 =?us-ascii?Q?PceR/SzPJFF1Ff1t2Y6A66ZXPvwfWWgArbh8TGkpAm5vBeKpMkG8spWlpZOf?=
 =?us-ascii?Q?5qC3txZPnM/m9l9501zhho6Ax+BuuDZF9anLT6aFvPxiZMKLCEr5Lot94FSw?=
 =?us-ascii?Q?Ja8vqfE5c0ChPMK+PeDldIfzwMWrFawA+Lj5Gv6MPWvEUtTwX1G+IdspwcLv?=
 =?us-ascii?Q?SWJkcCj5Exu9VP6mDK2Nxi9VXq0ezp336DN4iQ3jpYdSWazvqlK8leqy/g9Z?=
 =?us-ascii?Q?nwuVwMP2IVkWvdsziMVjnMvA81kRSlm1eSgDiueaaUgnN4bTAh+YKgtHe6F2?=
 =?us-ascii?Q?0aLU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 03:02:24.2784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 982e36c0-1497-4c5f-87d3-08d8aba62ace
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRQkW5+3Z1hfh0TQYQAxDj0OHTMSwa2nN3XKy//QVWhdm6/fg0kNUFEDfmaFkiG0ZIXXbu/zIbyKmRsKdLBjnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7180
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

