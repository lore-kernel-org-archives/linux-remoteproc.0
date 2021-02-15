Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1816C433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 12:49:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B63064DF4
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 12:49:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhBOMss (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 15 Feb 2021 07:48:48 -0500
Received: from mail-eopbgr40044.outbound.protection.outlook.com ([40.107.4.44]:27717
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230340AbhBOMsY (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 15 Feb 2021 07:48:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Doy0sJ6/2D7go5ChKU+/q15lNGg46grDnbn4dYWO4rtRdABnCacg+aSE5DLgksX1jFTN5pPbod5A5vdPByS+uuID4zKtBspso4sFIEROLGUfP7K1TpUY7jLexVA62WQ7uLgf2mihC+4L7fkIId0WVe7GIWnDRqfRVp5TloPODSF3g/bidBNbIE2pFusEtMVhA/609K4RqOmO3ltt54yfI76G3q+eLOkTLyQIyC78NUWZvDk5JwYHfVPrKNfOteV8f6yPbER27irrmvcK/WeLdBR3lrmNpIJLBsP7deB8m+RiVG0fXLYzoVdJpM5WcFsGwN6qmd5710046BqWSWLZuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJE0Ov249gPUdtT6ZeB+lf9+Z+9T/yJFkeTd4I25VJs=;
 b=UJQB4baRDZouC4N6Q+Bz6oNvFXknyzDRqsyVZra+zvV0BTDouW2I3hDHX/9apU7uoiTe3XxZJh2iZBUXbT0cAbwVzgNN2MA/JJBC48Anp0Qt+lC4Rl4bjTkTlUU5okLDXy0kCkTdqA9DjtZxzfBuYa2lF6AoakqSqXNWwsk3tGvb5bpgoTK+wqksWH1OPddNunKoICeW4wYfGGHZIHOsrRnh6m2Q8zStYC6sl1a5t1IJlSpfRIzFp17QcD1HvSwwKiLdBUM93bNsov6TPm1ErgTnOhUuu10RqenGG1hp9YLhuEd78fUnIrbGe12FgjtkOlE23HqUXHERhK7g+vkjxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJE0Ov249gPUdtT6ZeB+lf9+Z+9T/yJFkeTd4I25VJs=;
 b=dpA4Mt/RMMevTHVO2OquF1bvsxIZ7PLmOvDB7fIAKdem0V5QPrsr/ZfNOdaulH3WmVtHAZGWF0ycJfZDu1ZApHrTLcP0nEJ/gauwLslYYERz1o+MIBrekFpSF8NPc9UsWvRnsXEZY4m5QbDN9UYV8ue14nAUv/1K7Lx3e0o7Oqg=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4091.eurprd04.prod.outlook.com (2603:10a6:5:1e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Mon, 15 Feb
 2021 12:46:55 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.027; Mon, 15 Feb 2021
 12:46:55 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V10 06/10] remoteproc: imx_rproc: use devm_ioremap
Date:   Mon, 15 Feb 2021 20:34:19 +0800
Message-Id: <1613392463-9676-7-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613392463-9676-1-git-send-email-peng.fan@oss.nxp.com>
References: <1613392463-9676-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0302CA0019.apcprd03.prod.outlook.com
 (2603:1096:3:2::29) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0302CA0019.apcprd03.prod.outlook.com (2603:1096:3:2::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3868.12 via Frontend Transport; Mon, 15 Feb 2021 12:46:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dd40fddf-5c16-4c0b-496f-08d8d1afc695
X-MS-TrafficTypeDiagnostic: DB7PR04MB4091:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4091E04E5F81AD04FE84D570C9889@DB7PR04MB4091.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HlkFgNG4eckEnKYDUSsKi8VpKjyvrXdPHyZc0dWJbGg2XWOnP7tjRt8o9hDJn9w9xvPxq0qbai1CLnaQzqQnbldLqKnrwvtcmbK6dLdwv6EBaH4Y9T8ZqKL9nS8ghxN6uig/ifB0A3ltPLld0h5cDjaAnLDySHxgOioc7v3Vs5WvK/7VeSODRImAvbuYYNtVgssMFmUVve59WXDuwJBI/5a3yZV0TM7V+NkMTlE5mFjfr78ik/t42zp3H6vRMYIQ5GYKWEKaMZqmmnqma3RpkiWORenvt06GmShrlm/foVjPyR5pD+VyJHyuyOLaruwxhGHlcX/z+NC7g9UJfKwXHlXbWPygx5dEAQjBCSYuYFtHdMWOjiq10uCoEnBmezPvgj4bmd1VhiD8tjW5mSV2JmZDBFz7wtWZFtCYfGFiEPbRzcLQ+TqN4QWRcN4rbc1ZTf7V4/ccMGKOKnWoQ9bFmQZTBCTmIKC1yg2YJCjz5J+4xY7YG6b12fTw6YF81N6ybFD9te/lznH2/QT7tTIo8NciNUP/AlyJMD0Kiqu9O+zoMQKpOmPOYhTRkN4rNhJlnJD4x4NVOxBRpiPo299XCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(26005)(6486002)(9686003)(478600001)(316002)(186003)(52116002)(6512007)(2906002)(16526019)(4326008)(6506007)(8936002)(2616005)(956004)(7416002)(86362001)(66476007)(66946007)(66556008)(69590400012)(5660300002)(6666004)(8676002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4y7htauqArsbk7H3EreQRZj31ZdgQgUqGjSJhm+p5z+1cdqXwlBw/byxcFHv?=
 =?us-ascii?Q?c1HqoaMXxZ4bXRwjdwWimDU0rqgk5XQrU8Z11KmjnWh+ltLAdl3XTflAB3v+?=
 =?us-ascii?Q?RvLp/Zmf3EZs0mw5Gbzu4AvhrkTuqBzqdHGV6zOpwNQATruCdOHUbknZmJGe?=
 =?us-ascii?Q?5amikZ22ptUw+OT89hBQnuMaRyu6Q0g0xInwAKc6qBfx/gFJ4IML99zj5IBO?=
 =?us-ascii?Q?Fgatgixil2LKVLl6lKGJYV5bqD6mDqfctaeikG2uQ+rG3oLv+eTkA41CDKLs?=
 =?us-ascii?Q?ZlDekm73LaxfkouXpLnCqhLcsiuVNADdFOFU5fSNiU8qZnD2S4JZp8jL+8n8?=
 =?us-ascii?Q?Eg4k0TLfHeLmEX2iyon9hms/OTGhie98G3PycsvFO294xChcEU1VxwGLE95G?=
 =?us-ascii?Q?0+8HfQ/F+xGxuS0HVu2fg4TzrL51TfqsvEjiyInwNm2OJtyQ6ItCWJniWE+z?=
 =?us-ascii?Q?PZCA3QoU+DLKuRWmTqK+AtK/+yMNWvDHfGbG52yJNv86MhXiIopLFf7GVtr0?=
 =?us-ascii?Q?YG3+JfXfJrfujrR85q8n0vj2S/HAyWI5jcnpRXVxKccHXFLlRERW2fteEe21?=
 =?us-ascii?Q?PPWVvt1CnJuN9sKMwtbkSt/2yok6hkgboh2SPx1HIthryGFz6sEfQO+jfe9K?=
 =?us-ascii?Q?wc/IWEIx28UKfWGmspDFOc0NIDVLEyG0ZlOWzSNVYiq2LW34nw+o3tH4uNfC?=
 =?us-ascii?Q?8Zbm2Ub0cHQHNpFF+BwJEgxTSHDZJfvB4oHWtw4fDwrMxaHV3H/3fOe+YTgk?=
 =?us-ascii?Q?1QWxduokJhIAONLPnFsNDbeSKp9tPE3HyoYPienqfYIXfMJTNmym0nezOXi6?=
 =?us-ascii?Q?4lHfIiDi4roZuzc3lpKxS/Xdz78nMSzDElG5Yxh3480FVC5K2RJf/IcP1VVX?=
 =?us-ascii?Q?3EOpdpo88jtsLu8bnj+iKltwCWgkEMkOOPkux3W26E4YxssJzgtx9NAI7wyI?=
 =?us-ascii?Q?pzZJ4x7WOfORxiszQF2XOpXgyqt1ZfMk4IE+OTfGhA0qYi4q6l8/I/U6TOAI?=
 =?us-ascii?Q?7wdse1NfOWhmWaImJPzGQ6IIu/kG5TfeCtco2ypHJkp6LiIFsHXRFLUBreEG?=
 =?us-ascii?Q?uuCf+YPRuGL+LUYHtr7Gsm7ZOFc/wt/Y7P1JdEWNLsgVZu4iOJ/d6bQxAj4A?=
 =?us-ascii?Q?qBmoDk00jdZGyTAmNva7GMcBl+e8t5Lu1IHFTutTW6JK/5u5bo5xCpcaDQfi?=
 =?us-ascii?Q?U/sD7FKD/BKkeVqzjPIIoClPEQXkXX/HPQ2xpdOrR0c0zzBXdR2cnWXCHxT+?=
 =?us-ascii?Q?S2ib+5jaYGfqHAMf+4iNyKy3dqBWXr0DBlaNwLXtE/ygA0KiVGNN/q+4xLks?=
 =?us-ascii?Q?qCE3CJKy1j2eTc8QmfOCHIIr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd40fddf-5c16-4c0b-496f-08d8d1afc695
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 12:46:55.7787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9z+8j/CV7orgdacaqZroIAw7LQrs7RT8W3911VsEs9vQ1rOwnf5x6/1cZGU/IA9EbH7hhDGxubzIGWTdEaE1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4091
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
2.30.0

