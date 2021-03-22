Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E409AC433C1
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Mar 2021 08:27:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A534D6198B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Mar 2021 08:27:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbhCVI1M (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Mar 2021 04:27:12 -0400
Received: from mail-eopbgr10060.outbound.protection.outlook.com ([40.107.1.60]:36614
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229614AbhCVI0u (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Mar 2021 04:26:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jf8M/nZxGmCaOdpt+jUG4A6XWJBY/g7vyji6Z/fRZ6VbTyKaKC34sttjR27H2u2DQkyKXHGITZzKM0+idzzPiSNSH8Kp0nrLgX7cmfopzh/qW5cfC6RrTrSWZlItOpyh0MOe0r46tVX9jwz6xfLpq9GWYtjyyS2jN0fxA1kE2T3bxxouu/SqkeAsjsC19wn07BBLR7giTI5Z4tX9gqkxA7XM6aj+KVzYCwPPiKj6hDbwnCh2HQWdHI6jCa3o/EFnJfJx4JezuVefsdOC7wXs5eu+96V3H9clip2oLShspz8r1iF6Cr9TWycZPhmj2Hhw9y4jX6tp97x43R5yEguScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4H98Jz/GASDO+bUQz7D0bhMX1G6nLTSXpsXRkK+eo9E=;
 b=TCufVAePOrI4u4Hvniyj6Ff1bs1lI6ltgfYdCFwmqGipSrm7KleuHy2k7VT9BOAVUj1+2Wc3QjgUJg+C/PqL+vT6TIYGuz4iE+byZSO0KvhVfpH4GChpgsf7tP8Zi1Vfu0gFiCtNF5F/h6PCzx3SQnXvjvzMT+sAuz2lYybW52wUewb94R5gwsYHsuFJDhXdMbnm8Ri0bp+23lI48n9eYOS6FIy704SkSMY5pMQRgwvis49wRpBMfOYfx6LcH824am167EfKjIgUhQ2vZ8fVDb1uBC59R+xIPck8yA9JOMlNKOxmxVwNaHCUAm1R63zW8Issu7pyQQFiI/TJ0rKs3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4H98Jz/GASDO+bUQz7D0bhMX1G6nLTSXpsXRkK+eo9E=;
 b=OeviyR161gvac2TD8qVakw8FW56bPVVGn1Fp6pVxxlUvfnMdkg6YvQ4w3dDdMoR1aFK4ad9KOKYfNV6Gml7Zc53be31ePCsxVqVpR/amk1Il3oUBJWu+udvuIlOz1cvvZ6PtQLrZ1Ds2mMQx5IO9hofsth1b2t+8jmCx6u3ae+M=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB9PR04MB8316.eurprd04.prod.outlook.com (2603:10a6:10:246::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 08:26:47 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 08:26:47 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 4/8] remoteproc: imx_rproc: make clk optional
Date:   Mon, 22 Mar 2021 16:12:39 +0800
Message-Id: <1616400763-16632-5-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616400763-16632-1-git-send-email-peng.fan@oss.nxp.com>
References: <1616400763-16632-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR03CA0007.apcprd03.prod.outlook.com
 (2603:1096:203:c8::12) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HKAPR03CA0007.apcprd03.prod.outlook.com (2603:1096:203:c8::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.9 via Frontend Transport; Mon, 22 Mar 2021 08:26:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3da0995c-8368-4685-d157-08d8ed0c3bde
X-MS-TrafficTypeDiagnostic: DB9PR04MB8316:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB83161A019B9EAEAFFF8CAE7AC9659@DB9PR04MB8316.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N7r0HQYSfmyi3y9llcjF/9lQan9KK0C1N37TGu9EkRc5OzMO6f4UTw6IWFPE/z+wDtCDekY39yNtO6UjvqJDgm0HXw2m6RRhcVeIipDxnTarRJQEsK+nlXQR+lOTN4Q7qh2LkWnXPouBZoAbb1xEyPJKVQHTeQ0KWcIM7Znl4bjFClDvdkCxnmIDu9fcyNpuEGCKXVUDfMdcFRnqRZuGSjEzg+u/ytPnaNQzVmLBE0Rn0QwcIeCFavQ6mrmecFxm0SIkKO3DYRLXMR61auJHrK0nAVjUq2VrUohtsC7K9VQ0EOvdXyJhpP4trRtn0GAnfNbt4v0SbNrQe9Oe64q5TbmozLOErkCg+SLqoX7eGCXxygJJcNcM5BTcDqzYuIQB0wT5u0Yl6+CFzKt0cNQUuavUIrd/wGDdIyiPFs4ZFNWApposvkAouhHC979VPJysRYt064f9KNW1jXtwmOITGSGJpqfDBKhWo9d9Q9H5xtBbTMeA8dpkgjNohUoKkDmSRt9DBQLLPsDf8B4UarkMoZY/EXem8WcjhqDqO8xq/jRCb7IKBdZLZLDJfejotO2iZynhzSCWPEhvZr0/rUTAH/BHFGmPmG5e+oJhgR7gqppcOQCk9+FKisuMoY8Ztep4gmZewjg6GSMZujBGHG+qIQ2fnXy0f2ybfxZHcszgohokytSalbx6MMM4BhsQNBwg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(8936002)(6512007)(6666004)(66946007)(66476007)(5660300002)(83380400001)(9686003)(38100700001)(86362001)(8676002)(52116002)(7416002)(6506007)(26005)(4326008)(478600001)(2906002)(956004)(2616005)(4744005)(186003)(66556008)(16526019)(6486002)(316002)(69590400012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?zWUMjYjh1p7vw6B6U73gBeP/3oVHRbzV/8pQITd6F0WageSR6hdGNx74d/fV?=
 =?us-ascii?Q?hz/qzGUh5WGH7OUP+rgRCkFi24v7tnoF9JwgPiurfHODu91CndQoYVRgT/PL?=
 =?us-ascii?Q?HWMSSSdsQH1O/r160ix5byGUDtxuqPAdM3C6ghMvaCEJ4bJWznjuukB6I44+?=
 =?us-ascii?Q?Q2eAjI+CU5rW1/h2XSPUqxBX4ooTQpnQB4b+M/nI5B9D2iJ9DgMek6Skrvva?=
 =?us-ascii?Q?OWkXxJpP64qwSHXEhg4PTnviFgRlK391GXbZxUrbLEj8A30Nn5vr4xt5r6YP?=
 =?us-ascii?Q?43qiQSkiI915B9Zv1ilfBiCS9aYIimoZIBLXUOx+qdys4PlyjcviWnS9A3lq?=
 =?us-ascii?Q?HLjp4m2kdJ0AmKEz1QwesZQ8FKTH8nU+Gb2Dc5JnUeENPibUaHClYO/QjMjX?=
 =?us-ascii?Q?ois6I9DigOBxoHklae9mP9SfUsB+/nO13PA1X6rmaGpBlXpX8T11vCwsU53l?=
 =?us-ascii?Q?NZFyeeM/g4pkGs474YCoUL+93+0LsMmnAyg1b/TpvxPXAGe8vPf3U4FgY03w?=
 =?us-ascii?Q?HOlaBQaayicSQuyypW2B5fmZMZm06UviX0UWpD6UTlTyhOPvq3J/PMUuHFun?=
 =?us-ascii?Q?bNfRP2br12AZbCPZWnc1yxX4StjcHtjcrmJQflsGujysfXvjcRgzx7Hu620y?=
 =?us-ascii?Q?CJhq2R5gJYHLb1LhJA62cHmf6aIqktABxWkRvz2feV9nWyG3SGiQarwoQgQE?=
 =?us-ascii?Q?knUYtN2zFDAvgbZN60eKapP1THJsx0hAKeG43C5BZt62vctYVCr2SlSAeKC/?=
 =?us-ascii?Q?afXo/d+8j3M7Qv1W1Jk3Gy900o+lW09ahcc5HY/NDGPPMtLrS7tCwmfp3xtW?=
 =?us-ascii?Q?89qNmwQy9Zh9gO4mGO2QTgfN+QnoT4NhUHMmZks7QrxSOCzjt9dHuwZe/0g4?=
 =?us-ascii?Q?vXhyftNzjQiCakG+GIWqgyVaCgo0ek/ue5ojT13saVWdFCpttH06HI9Tupn/?=
 =?us-ascii?Q?SWka0Qk7KCrmJhU8WTUGi/roNgJ0j2lW6F1iRFGQq1OtrF1T1RSK9LYsXL9x?=
 =?us-ascii?Q?qiVpSpJRsWzUklxadV8wUJxLkjGj9+CEiJ1jK3ie1Mccp/npVGh5/sDj+1Lr?=
 =?us-ascii?Q?XbC2qtfKqdttzg1BSrKnLbngZ+wcjW9eIaHcJ+39eTWlSNlgjhaCEM2JbzS8?=
 =?us-ascii?Q?ZSxppgM5V8j1uRgfsqDtZLYOzue2P8eEkn7ZNi+AIvCp3Glp6o2TDtXez8hj?=
 =?us-ascii?Q?KJDEpOt1nW5OwYKx4la8xiTwDZ/mVftJjEzeDNB2zLcDgjz+sINwzUBJAeGD?=
 =?us-ascii?Q?Smk/jUHSiuRaugSwonyEXwL1KsCFZ2yWwwryePx/sS3YT1tJge95s/SefNYH?=
 =?us-ascii?Q?0DVS/RQ9uwNKRDmmCromBz0E?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da0995c-8368-4685-d157-08d8ed0c3bde
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 08:26:47.6082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHaB6ruZeBAxhXU3GcPaIb34N0I+HBC46z3XrY+k2ok6kpFhqX11bZpCYw6UWos8a1ySX8i5nExRYvlCfleveg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8316
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

To i.MX7ULP, M4 is the master to control everything, so it not need
clk from A7.

Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index fdaaf7599cc8..e858c1af4353 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -654,7 +654,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_put_mbox;
 
-	priv->clk = devm_clk_get(dev, NULL);
+	priv->clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(priv->clk)) {
 		dev_err(dev, "Failed to get clock\n");
 		ret = PTR_ERR(priv->clk);
-- 
2.30.0

