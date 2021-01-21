Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82E8C43332
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Jan 2021 02:09:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C76B72388B
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Jan 2021 02:09:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728478AbhAUBnl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 20 Jan 2021 20:43:41 -0500
Received: from mail-eopbgr00081.outbound.protection.outlook.com ([40.107.0.81]:11138
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391883AbhAUBRO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 20 Jan 2021 20:17:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsRonzgyxudGLmBdlL6RSfDkAi57wOvqvIBAaM6ggL9EN1VzkKpzf7gDioLP7V9/vEsOZw+Pc96pv1wY2nqxuRRTIOC3cLJiJPwtgnBR+x/b7LXy1zyaPEq/hslR7DJIKf3sJ3HrOdNA5Wedcot95L24PMUy5FYVt9FjeVRD4oGe37ThMMt7wdpXwql0pBq2Pc9kap4oPcKxgdvXjdDg4Cy/Fzwz7h8I/LNIT30NCkRDVDEed+SZ3+amPsSoOcYvIfgXbUXiKFzCzVPP87LL/j8LO/qUvtgw3RUT/iTyK8Didyk75jDPEfImdrbhWFv+ww55RBl5RX8JnjfpPoukXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rI+IUMb1+JCMowDxbZUaZ3xdAvqxJsUkD8J2FuBMne0=;
 b=kh0rmusw9PnmmG3wSxww6sOymZ21hZFBthLEnDFGjLu4GYv3iFHwrwM/5OlRzQpbJYvs6YATP1HgnPyzlhZETkIgVLkrkW9DRihwjdc5QbhL+XpO1oVjB8iaCzhjsEfk+9AjRspHngIbDgC2X6N9a6dCFU2MQY+9XA+EXsKPbz6oPO++EyJPCW01cJRTCapDCYFWbtDnsHnGrFipYHnX2AmCrf7al9ZtI8+JQJ/IdWDQ3iXSdSY9xNVOKwaFjCdYOigDq8CrNh5hl6sx4spLrfUARsgDumk7AF/4Ylqgh1dx4v5kJNT1OIVUJMr5Njy8pCXsT1rPMMP4R9+f38tvKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rI+IUMb1+JCMowDxbZUaZ3xdAvqxJsUkD8J2FuBMne0=;
 b=aBmSOGy2NFoRkAeYF8V8cAjm6feC5NG40vkdTW4yqEV//86OdXpVDhvd9Jpx9dVEXCYPMJiYcfckWtiRV0vaPIJKkVxSl5wsepc8LD4OXRAMk4FosGRDkmczizc+wzQhRdBkKjL4cu2cUF138OSB2A2qwHQ0adepu45Zp8Ji1iU=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7948.eurprd04.prod.outlook.com (2603:10a6:10:1e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 21 Jan
 2021 01:15:03 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 01:15:03 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V9 09/10] remoteproc: imx_rproc: ignore mapping vdev regions
Date:   Thu, 21 Jan 2021 09:03:34 +0800
Message-Id: <1611191015-22584-10-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611191015-22584-1-git-send-email-peng.fan@nxp.com>
References: <1611191015-22584-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 01:14:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 73860709-5ab3-4318-b6f3-08d8bda9faa1
X-MS-TrafficTypeDiagnostic: DBBPR04MB7948:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB79488EF328A344B0B9E2F03588A10@DBBPR04MB7948.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BcXWNgaC4F1m3n7WxDumbhBJ/mPIcl/IvpGq78QGjJfeAhxzZVRo1z9/5YK8S2nCvZRi5VVQcJHutY3KYOg1V5+2knF0/e5gCnE7ANxsQFpRyD3DctUOGJK1GDLiqhtR6tSzk31ty7bMIt8kHxbnmNFWTz0QJJNpr8SnMvgFCgjYwYyccfQBuTi95zR8zOXyCLxqwxxWgX0UejhjMFyCslrckRDGY7hfXXyxeCYbBH4vj/iNOUb9MJv9PDJ4QM7kn0ikL6gs3C1luvOlWLhkvDcTugHCbHyMb9XA1Cpiv2Q2Z6acVeVZl4m5EjE7xWTsF5n3ZYJUDp9PmUXsTy60CWDPSmW5AJm9fwcqE3cbbcHCv/IGa/gMMbWai39T2ErS2/44fGqR9NCdQfwa8iyc9M5MHbphywhuimI7VZlLRqlH5PAgXm5hw2+NDWj6ufDGqV4jt7snyI+RLODcQKVWnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(69590400011)(66476007)(186003)(2906002)(6666004)(52116002)(2616005)(4326008)(7416002)(5660300002)(66946007)(26005)(16526019)(956004)(36756003)(316002)(8936002)(9686003)(6506007)(8676002)(478600001)(6486002)(6512007)(4744005)(86362001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?927zAcV8xOlNVcgXY6uO/w93hhf1ChxVSkm/HmYkWuP6dMDNhpb0vZM6fOJN?=
 =?us-ascii?Q?+V5FxOW6Xjsb/m0q0a+Q9xbQSXYhs3b9ui5julv1MLk5V718rSfO47+PADLX?=
 =?us-ascii?Q?83SimagIsuEoC1tZYXddS4HWsslKJs6nWTBlaNFOR4cY2SjyF64Gi8xS7DuZ?=
 =?us-ascii?Q?4AXNhJNXNuBRLSG7av19Jtp1lEvRX2mX/Yr2jKHBfDSU5fWh/OBFQMw5YtDZ?=
 =?us-ascii?Q?+K8a6pkz1zXl2EA+wP3D0PTh/RLB/YbfXPP1jvqPWVhcCWr3nSGMHlULlJHc?=
 =?us-ascii?Q?pwzDNo9vgiW4Z+Rj9gWTuSGeglCT0gML38f9zRW0HDxVV9BE6n9bNpXv/RDt?=
 =?us-ascii?Q?zbpPNqh/h60yOTInV/E8oUSJRXhhkZYnXl+LmBMupdl4hKbdNhB1HNWm+FeH?=
 =?us-ascii?Q?nzoMczayOfS8kgqZkZB1sKiZUAVWLP0GDSWz5awf0Kiqw46V7IwHRbZMNiDX?=
 =?us-ascii?Q?pl4H0IjnpRqHOhbauPo1oA+gfIdJYpk5Cm4jiuTFtNaraSZcDDXQ5fY/FSdr?=
 =?us-ascii?Q?LtVskj8HHHcvtPGsQLZod8QONPXEOARLnFTA6lQLNmEH1aIfRC/bwToBCM8P?=
 =?us-ascii?Q?wi6Lx7vz3Y9Y+nn5XYGIlzP4Ubi8kfKrrQhJN25hWVbFxqZvtTTQ6eCfe7Nl?=
 =?us-ascii?Q?wigNUgduQITHqyIBlCq0YEgx7vqqLgi0E7Ovlv4VVbySM4oVF60bxQEPuI/N?=
 =?us-ascii?Q?RCXJs7l5hZKDDhCZRdy4raViaR8FbK/775Wdx3SB8fCv29LvvV8iOyE37x2I?=
 =?us-ascii?Q?HlvamcpranftNCr82DWhFV18mxR8NpQ34AKTnAxLabGEm2JziDS8SuFLsQtZ?=
 =?us-ascii?Q?YQsCvaIAfcqPa9QLCH/qTUP9LBEFkmH0XdyXLpzV/g+mHOxc5vi7GA5fxdt6?=
 =?us-ascii?Q?OGKWiOGPJmnf8T4Z7Mi7rjFDh6qF2mVOIm2PzMbCs5pK4Zzzg/FpJt6MBr4n?=
 =?us-ascii?Q?9OsMQonAA5WariZ5SKw/+CZCF8f+2ORNjvdenQKuQgbCIWruBUdFwqV9IWf/?=
 =?us-ascii?Q?kG3S?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73860709-5ab3-4318-b6f3-08d8bda9faa1
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 01:15:02.9987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IogGmJDU/06inWtkPKWj6Yli2awb4aR70SCdBxC+VScFSm3ngWi01TmeIbhVcLIRLOJ3NI0UMMy//XFXZLAYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7948
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

vdev regions are vdev0vring0, vdev0vring1, vdevbuffer and similar.
They are handled by remoteproc common code, no need to map in imx
rproc driver.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/imx_rproc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 0124ebf69838..3685bbd135b0 100644
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

