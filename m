Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B855BC433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jan 2021 13:22:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79907206F9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jan 2021 13:22:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392028AbhARNV4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Jan 2021 08:21:56 -0500
Received: from mail-vi1eur05on2055.outbound.protection.outlook.com ([40.107.21.55]:54049
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391624AbhARMeG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Jan 2021 07:34:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlOnihLU/RZv695tPJQWyAQ1iFUsVWMJdjPtDn00eARjHgJZ6xecDli5+oeJ9BpYgKzorJZU8lGA8HslCvFVia4Kvh9XEGMCGBxDyVG5fu+whZVPv6bhjJQ2GjNpyNy4DCUp0LbbDYI1v6zHNTBlrnjCgi4vZDDyW4xWfnFTOTI8DiCe+eBA5Na90oerOGc2mthWj8dDRKsAgjPDPMFBXj9DUdJkg+UnauJlQ16xifCLQXbpPNcv5CfnZCp8m7DM8kDafxxkOf/ejQKDk3Shc1VgyvgJgIwy5bNkZ6DiZkYRRJlKFGTCxwO+dEHpFuS3Mku9Z7KQmMUu8LwYHbCr5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=115xpTjMhzr/pXT7tXiTDwfmJxE7ztAJUZp9k7KqSxc=;
 b=PkSoorinffSV5MwGo4NBpSo9Ngyd2vIJJ46YFseK3bo0bW4AbVaXUeiLOP+v0KTJTH3rTEtmUbCslu2TsXGHbi8n281XQiV0AS/SI7Ky+0T6WLo/BXt0hEBuIRR9pvaUEy/1Ucy4aOdONlIYB5MoAbwAXQWaytMMbfqVSFDwnRb7VMsKmvjbxFEhQ016Z199ThDbvmwrW5zEkEv6CV4MBgKh24lDUGzFbYRmJJUPXIVGqMKUWdhE+td8MyoK09iCXYqh/+gGajXteBhuIgcDU+GpLMEUnYKSmxvZoKv+YIGb2BPaObZ/LoOt2Gpd7x/hHR1GfkVJZFbsbBWPBy3TNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=115xpTjMhzr/pXT7tXiTDwfmJxE7ztAJUZp9k7KqSxc=;
 b=GsP7dezLQvX8QZ/o8LpL+R6ElXwLadf0AEh55WD5uCpT/8zsQoe+nfi0G9CtnRAkZ3kZ5h3poxBmAWTMMZRd5qFmLIjCEThqr4bD2EY+eYobeYypb2qT0ne4v5FOOQkk0wQ3dP52WlLV3J6xbNuSYW5PVJfS6vi5wghxVuwi9Es=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5243.eurprd04.prod.outlook.com (2603:10a6:10:17::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Mon, 18 Jan
 2021 12:31:18 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 12:31:18 +0000
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
Subject: [PATCH V7 09/10] remoteproc: imx_rproc: ignore mapping vdev regions
Date:   Mon, 18 Jan 2021 20:19:58 +0800
Message-Id: <1610972399-28286-10-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610972399-28286-1-git-send-email-peng.fan@nxp.com>
References: <1610972399-28286-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:4:91::17) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0113.apcprd03.prod.outlook.com (2603:1096:4:91::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 12:31:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5608b491-28b9-4ff2-7e8f-08d8bbacf473
X-MS-TrafficTypeDiagnostic: DB7PR04MB5243:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB52437BE83CF194BCEBB80F3088A40@DB7PR04MB5243.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zmhaZTlXYhxUprfjEmH0PQm7U1FUIt//XGzuRW3TdzWoxNMNcyk80SqfzGxKzPQiBs+By/5v5McXeQcW/oLMv6VlBPO49ZrPxMS4KiU3r7x823lPHsCCkVYmd8hUqbJobMLWJ74LcgSrm63DKz/+H2VMPgDXQcui4OnpJjAvypu7R2leqbCP/vHLfP14flP7pWeGzQ/M9Ool1VcVggIxqGbrVevkkaagCjz/TowPPUyyspGSn92IWxX5xRt1VKZSTF9rMO98DC+NQ7UnywSMBvyf0xEjUNBOfsKc8hlLhzpwYKlR8socSsbFH5CfNFh6/9Y9Ou4K0z0P+kYyfVaLFYKuQwj7LdrXKvf/WBpbvyPlHI55SLKFueK2kIvArcpkVFojXUjkPbdIyZI3mWCD6yiIeaj2LI8lklCuoDZakgUM0MYkUDVrrVQmcdMQh/aK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(478600001)(4744005)(6506007)(316002)(6512007)(9686003)(36756003)(6486002)(66946007)(66476007)(2906002)(2616005)(956004)(26005)(7416002)(186003)(52116002)(16526019)(86362001)(5660300002)(8936002)(4326008)(8676002)(69590400011)(66556008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bGP+qyswcS+FhXknx3dNDHS+5N5iWQXKyXnrsVkaqQgWQIjzr/IQQpl2pWVe?=
 =?us-ascii?Q?BLCuc+bftmxIdA+0BLIM4kfG5AxUUUzIiS9i5OKlATZnuHKWJOdDOZCWmBtp?=
 =?us-ascii?Q?mJiwf5YZE/y4ylrpbE+ZnsSPFXuKR4I8PL1Pfm4+uY593Wn9QZ0AsaZ1UdBR?=
 =?us-ascii?Q?LrlGBOvaSZ23rFVbhKKuiYVaOQX3bVMeHgAjZmCdLTqpOwjQd1/OhiID0Qez?=
 =?us-ascii?Q?hzJAH79jOgY/T9EIVp6x3I1NhWXfAs3gAhPHgltqAnPV7NTGuYXWNLzfNJtG?=
 =?us-ascii?Q?zwIabmlqPdO6oJ17GZcEVnLfTTcdcMPbNLvc6t0omVqkyASgDH07jx8gtUZp?=
 =?us-ascii?Q?0GqyN9I2Z8EQat8rE+sybLV61Pf03+WIjdoTCgxsRC0A/BEJWA6VDtJ3LKe6?=
 =?us-ascii?Q?bDU3VblJpPnaScdD9a+HrfRz/5ygzUFWejW8DpwqVepceKtSyvy4swJrWcLf?=
 =?us-ascii?Q?1GdV1wY6WNFVOYRqwAraZq6BngGO/xGw5JkST8ctdOMPBM/xLHPt/iIgm46J?=
 =?us-ascii?Q?JXNFbmWLE6nJ5pNTCuszZC6n6neOfiyEjxV7MpYsxolrosnTaIpUdu8V02dK?=
 =?us-ascii?Q?2ueaMn7nfHMVDagoCkqCpIVNIElOB4hVnVnEiY2MZ7AV5Y48B0zoR7V047k7?=
 =?us-ascii?Q?iv+YhDZzIlo2WqVvmnbhe4TU3+DT8S/5NxjgLj5fc7i6+PlEfaiaIMF/ACxD?=
 =?us-ascii?Q?Z1SRdTf8eYpUJ2ydtK7UsqNcUZRTr8MlR1bGFahtywKlCo+jaxYmejKYOgIm?=
 =?us-ascii?Q?8CP72w/vTnFqd0/0hF2kqs2TKF/hvOQrguVe3fZfipLHvi13kDLr+pWfMgQ2?=
 =?us-ascii?Q?/qwMf6MMa3+0VokjCu98alpWlw4HbnxXd99Iq2MMEQHTE8oj7nj85PUJ5RzP?=
 =?us-ascii?Q?bRj14jnazzGaEG/AsBus1A/637TdxsFfGe4WmMNzGmc5kjRMg5LrvT50zEYr?=
 =?us-ascii?Q?66NbvTG9Hh06li4EAyvhhUCK/hB+eoe1OhqQYx8BSEYL5x6QmAyxmFh3q7HP?=
 =?us-ascii?Q?0GeE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5608b491-28b9-4ff2-7e8f-08d8bbacf473
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 12:31:18.6732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wS6B2rlh+PEmGQj5X+RRpVNSTXIJrekt+VKqqhXRZnXsy/vesbATvBJQAmVl+fDZ7Mg8as16qegMM1vXC48BzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5243
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
index fa01e64cc791..54ac143ba033 100644
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

