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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4DDC433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jan 2021 09:51:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EED0023102
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jan 2021 09:51:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391470AbhALJvQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Jan 2021 04:51:16 -0500
Received: from mail-eopbgr70085.outbound.protection.outlook.com ([40.107.7.85]:13701
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391469AbhALJvQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Jan 2021 04:51:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJMVFuunKY7ofZSpguSlFmZURgB9r7T11Ra/wUnvhyjsL1XRHanKAWX7IQNvN01h5BKvUwFnfdlVmkwROVrhQOHA83WPPA7qWFx/BEGgr5WKp/GeEA6LMAgyFJOVW6JSPbLqfWNJoSMQ68voWCcIuYK9i0pcFnXoFc7aoYoegxUGb7P6V58nY+zfYJKG6Xo0aUECDbBvQ6oe6hoeFsxT+HWW72NrGeYKhBSx8fPbWkl6ieNwwTFBSNpYI46vLO0WZLLwHfeiJxt7LdvVkXq6xBWzq79HJdDUTxOa+s4nMz8kmVZBdsQMLrxPNil9S0Dbs2IRb8E9Et8cJddyq5iMxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrM/10lxX+u8ygpoSj3Cn75qK7g8pM1NhQgG/rAaoNk=;
 b=NawoSvHLH8V59SQJLJnYVRhWL9xTYmwlZjg5/aC53YWlsBdMyU/mR1CZK51BA2leBELWHUo+4WZdMjBL6TmgHOmhPa66KaGSp0jOuqjMz5QXRYMeQI6lgkiPJd3tKsen5qDaeUaaUxMYhpL5ovt1EZwF47Q7sg8Io4YzeFr3KQ8VZ9nC5XluEsEeGeGKYXEmQCH2wLI5+vhV4pkQSjLXh7h0vUgn2yc86bkHsC4z60CGS5s8wQBA6hTDl6smEz1ivrlQaZQSPJ8P5uyzWaS69hnsioVLtJi6/EzKDZBP/5XD9VIaODULWn0hG3gaJH1jMoLV4kjr6o22tGSKQiZU6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrM/10lxX+u8ygpoSj3Cn75qK7g8pM1NhQgG/rAaoNk=;
 b=qofN123OxXjBOdTiuIOXhLxETYyTtGJ341ldllTyzu8Ju870BTxYp4ZHEeMp6PhFmQ8HJ7P21pWteAjGHOX4HkAffwpDVxJA4sfURR37IRBDzpxtks72lRhIk7SLtaWSj+ronoqxDvcRsgpgQ0jeNh7YRvqv6QXXsSXh9279dCA=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB6025.eurprd04.prod.outlook.com (2603:10a6:10:cf::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 09:49:51 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 09:49:51 +0000
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
Subject: [PATCH V6 06/10] remoteproc: imx_rproc: use devm_ioremap
Date:   Tue, 12 Jan 2021 17:39:15 +0800
Message-Id: <1610444359-1857-7-git-send-email-peng.fan@nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0212.apcprd06.prod.outlook.com (2603:1096:4:68::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 09:49:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 554e8347-1ee2-4f19-0a13-08d8b6df686f
X-MS-TrafficTypeDiagnostic: DBBPR04MB6025:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB6025C6A1BEC6EE73D009336288AA0@DBBPR04MB6025.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VOqoCL53/Oir5Phe51N/q1ZMBYG0+f+0B37FvCTBzW/yJHcwLrol7JzDVy52709yCpJ7pWgjhbQysSoB2me8i329wSvOrXFhvvmFN4HihxOsgVP2rWDOfj3GDHkOTdfuTlabdtS7iwP+PHB8BqCZuOYo0ppUF9lge3UH2wlcZ1PTO2nHrUz3cDVluBltt4QiMvxnrULoaapwKIVk3RSuDcqcHFLlUtusQLH8AV4egRchjunpDxpPNy5+Wmz6YK/RsB1sIe/c0A4J3WwzQNkLOTG671eY/uePclcifIwvIwbCyblAAG7mPH5ikAxGXgLOWk9hfhmHS8K+iOuWTambAbkDNWO7HqZONMFjsEHsIM4QDrehZ59YPn0k6nmrW/VjLQ91rF8fLgOl1XtkvNl/kr1rdwiktBbuWgQs1aRyp8hnDU6Wt5Ep1PStVD0QewNPxbs34oYEUF3vY5S8DzCedw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(498600001)(6512007)(7416002)(6666004)(9686003)(69590400011)(66476007)(86362001)(6486002)(8676002)(83380400001)(8936002)(2906002)(66556008)(956004)(2616005)(66946007)(52116002)(5660300002)(6506007)(26005)(186003)(36756003)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xHUI7ptyfO3WVRvtCBjwC4Jpr3hdJ1HlgAUJrKdvq8RlIzUhuwsxWTIejFtp?=
 =?us-ascii?Q?p4kq+OIsWw8WY9GqHpkaUzKWx2bwuvpWELOu32+wNSxhJ0ciZhr9xtFNKuYR?=
 =?us-ascii?Q?v/Fl1UK2kZpxeI4Vsu8+Iv8b4gWOR519N/eCDkgmJmFtzdED2Zah3zy7+mxn?=
 =?us-ascii?Q?9wb+MmrebDOL3fTOqs3mlaW4mZc4RuOfA9JcDuQfqyljAqLdegPWqIv8JLZR?=
 =?us-ascii?Q?kujBenSGc6a37/4reQVxjHWNpfAX+KW1Q6WYnZ/5NM5+YLoysGuTHiNYvFKo?=
 =?us-ascii?Q?7NdiaAfjzCi5zwQQHQYRAd/BqRM0Ql+9IWykKrdb9SrAO628oMMNxjheIq2v?=
 =?us-ascii?Q?C0Xx25pM5TL736rt+USY9T6GEDn5l9o7Y8zcQwmo9vpzjFThx6kLCmUu7Goe?=
 =?us-ascii?Q?TKVYYdUAXORDGbeQZiAcqxpH75iqsawidTompHovPa++NC+y896EOJPuVuvz?=
 =?us-ascii?Q?UbXR0QesviG5YvY6fBwJMMplNYKrZ56rW7YO2Vpzyma/PBb/HjcPP64peLEA?=
 =?us-ascii?Q?cI9tMZWa4Z6uEX0OClJHl8DwlF7EWezWlWJBmOOTsnOt0Ds/TbwdxNcKCyLa?=
 =?us-ascii?Q?BuXdA/ZnjFZNd9dg+Eg7AGuzc+Okneg/VWVMkEo5YNTW3vRP2/Ov1Oiask8t?=
 =?us-ascii?Q?0CKzFzevj8/9U5z/C9RJzhhEeuLGzJtMn6IxZFGCtuCUop0lV49TGBYCIwOt?=
 =?us-ascii?Q?R1YVgUcRmbz5jP/zYVLc62YRq+N+HN+fLCIYozfxudt3oY5isElTV8eNFqXK?=
 =?us-ascii?Q?dKFvjFnDY2BuYeQxfPDO465d4kgnRdnvpKDbM4KwOxBTl1EqY3fxe1p5vUdk?=
 =?us-ascii?Q?y3RWMw/F6pz08KHGJVUn+lTLiFD7FmA7d3G9QN5nP996tTs5KF/2Dh9X+B6j?=
 =?us-ascii?Q?BT7LbJPbRvsoQIzDDVQhwOj3S9SCx3ru2rFgpcfzOPnLLeR1Xn2arb3nbZYd?=
 =?us-ascii?Q?kj+hS+fK1vtIJpEKfryLoSrutSH2i/fGPWgZ8K8cvLOQJKGph+XFSuC28mCm?=
 =?us-ascii?Q?bTW1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 09:49:51.8035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 554e8347-1ee2-4f19-0a13-08d8b6df686f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HNkJgwfaDSwKxnkYHYatgn2dNktTJw/vc7fFyf4NABFZoZaljaos0mRllwOEcaATE4xQyZqIgLKY4QH81rjg+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6025
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

We might need to map an region multiple times, becaue the region might
be shared between remote processors, such i.MX8QM with dual M4 cores.
So use devm_ioremap, not devm_ioremap_resource.

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/imx_rproc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 2a093cea4997..47fc1d06be6a 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -296,7 +296,8 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		if (b >= IMX7D_RPROC_MEM_MAX)
 			break;
 
-		priv->mem[b].cpu_addr = devm_ioremap_resource(&pdev->dev, &res);
+		/* Not use resource version, because we might share region */
+		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev, res.start, resource_size(&res));
 		if (IS_ERR(priv->mem[b].cpu_addr)) {
 			dev_err(dev, "failed to remap %pr\n", &res);
 			err = PTR_ERR(priv->mem[b].cpu_addr);
-- 
2.28.0

