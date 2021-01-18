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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E8DC433E6
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jan 2021 12:33:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB24F2225C
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jan 2021 12:33:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391429AbhARMdT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Jan 2021 07:33:19 -0500
Received: from mail-vi1eur05on2055.outbound.protection.outlook.com ([40.107.21.55]:54049
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391592AbhARMdH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Jan 2021 07:33:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7F3SZQckITv9/7JLqrA14Tcd6UO2p3uh3eKCes40wzLAeWTeQcsd8F64q4JzxFsjmssEBS2jDV3U1v7yUcY4DFRENjBjK0pd9xib0c0QpPLMZDPRaOeRCYJ2s7/83rRjVYiK/03/aI1XxsFk/6RLQ5mjjiWGqq99ne9PhxMknn6dDAcX+JKxhdZb9yatz8epomzV+AabHewy93szoTznSr2NC57y5b+sb01kHyko0RtFn7+oZPEf4H14PpkLj1AiKl4pT5RSYORV9z5Yvt6awtR1UzhDhvlIFpDtxTcH73Ya1aSEBLFPBVaPgftQEx14bCw/UjIISD0Q4xnVxZv2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrM/10lxX+u8ygpoSj3Cn75qK7g8pM1NhQgG/rAaoNk=;
 b=EjEDHT10qoMwIo0CSGPv82XZ1rLXmriXYlyaQAebM2mZkE8rEaMHFsAopzmauxGMCq3Nxf3PrPbGBfgRCboxdXfxRemCWotbN4xcqLH4PbEcXbYajiOzaI8dElDBSfI6SDprX6LZXOQvEZAQ+XmXrYK+jjBuQPUVFapdJg+3VWPGW9WFx4G8s4/5Xy0WgjaICJoYzABmkrgWA06Fdi+9i7nDybmPRlLlx27Vmclhtbi9c7RKfmvjUuM2shbUqmCDo4yfxNrUNpxfrrTBc5pZV1qEQ5dlj8TR9iT0ZTTXIGrBJ6aAiiY7IYM8xNGTaXVj9Tmw5UlNpnoYQ6fEJmL85g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrM/10lxX+u8ygpoSj3Cn75qK7g8pM1NhQgG/rAaoNk=;
 b=mNS3c2/+7mVIYC/zLJotO5CdY42oLnMKXP56n3gt9UuujUq4Kp/zkBnPOe3Yj2xVYx9ANQww/ogWIt7A6ISs6l4fDCN4AhiND4v6+msPkF4JXMqI3F9KZPVvj/xZrdpkVFo0K51XJo4AnR4TZI6vlEtgTtMPvjJzXkv7Iz0cUmw=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5243.eurprd04.prod.outlook.com (2603:10a6:10:17::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Mon, 18 Jan
 2021 12:31:01 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 12:31:01 +0000
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
Subject: [PATCH V7 06/10] remoteproc: imx_rproc: use devm_ioremap
Date:   Mon, 18 Jan 2021 20:19:55 +0800
Message-Id: <1610972399-28286-7-git-send-email-peng.fan@nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0113.apcprd03.prod.outlook.com (2603:1096:4:91::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 12:30:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 767edf5f-fd21-4231-2c34-08d8bbacea73
X-MS-TrafficTypeDiagnostic: DB7PR04MB5243:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5243BCA9C10AEC23AB708D1388A40@DB7PR04MB5243.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iA8ycNQLF/1Qc0lkmOTA5680Einqba12CelkQpjSoKnsH+mdHMVTJF3reLTYM2a0+iTjGIZP98g3Rf1avRbwkE8JKyrE8WW9SzTexBvtKQMwVjMj5jZQNcl7Gl3grwk4xx20ZCGuQD7hQLWwtw+Qj88ek6fi7IFCl0tYBR9KB1ltL3ybN5wnQRqph70Xp0fPZzsNLibCDc+2hwHNEJ8+v4CiQMeBBRv0E2OaQNQFireQ3XRvg+9PwUHOxKBWp3X3DMXKj8r5oAkuacrfnrWd05nF56diO3uU+bMuyuUkR7xgbARZuyaD0kSr7/xqtlnKuMFT8NCnD/7qx4PYCSmnKOuGsc6IAht+6EE9kvXH0f35RbnbE7/ZuVBv2bLMFEEsraCf4XQx/OYbPkn4HK86HfIRXKQE9MVUvw6MEoa2RjQCXLL7bBiHXp6MPuy/6Iho+ZHGXGKvolvnhLOOSS6zaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(478600001)(6506007)(316002)(6512007)(9686003)(36756003)(6486002)(66946007)(66476007)(2906002)(2616005)(956004)(26005)(83380400001)(7416002)(186003)(52116002)(16526019)(86362001)(5660300002)(8936002)(4326008)(8676002)(69590400011)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dTCl9Kv9rH+WKj7NtHIXibm5sxvhF8vZGsGctZPPfzZLaTzv0KJusuQUXHPy?=
 =?us-ascii?Q?TFeJoHLwNKrktxISd60Hu9ksBP8vbEo2LSHXcnccPWP9i1fw08jtz6WDOzfL?=
 =?us-ascii?Q?YB9lvuupllloMEfzI9JFnNLBNxDlgAN6g87DcZ6Q4QNgjZiFZ6pIfqTji+Zn?=
 =?us-ascii?Q?himsqGh1U2iyv7ZMnvgIaZNb1X94nW9ig5kYagWiGsOCOpM12o7KZyH+lQRc?=
 =?us-ascii?Q?ycdsHtYjwkOxKWiQK5uqzJ0UftdUfpJIJpD/Cvcjmv63VlGbZ6yL5p+uIBKF?=
 =?us-ascii?Q?+9Wnk3AV+HrHKwJrKM8nrt1C0D6u8/GRl5ztYTz0X7OVwdd4z5ZqKjL6fKRL?=
 =?us-ascii?Q?xQ4liI+Wv8qanK5cOfeffNJ5PTU9JTMeIujcuVmdEWzYCTjqE49ztyfw2431?=
 =?us-ascii?Q?7B/DWTdAuHPnS5/JEhSHgJR0f0mKOzzn7PLT6AjcVoO6Pi3WS9MVYvCfQdp1?=
 =?us-ascii?Q?2zSYJnFXtWXQSpttKRJofBj8sUeCI+Hv0M0AVOr8cQOJionWKuP2PHBQaTwX?=
 =?us-ascii?Q?1HVpEGt/JNy3s1ON3kNYF+agzaR99IZig1Y+tttTDiPds1KX18sQapjZfzBi?=
 =?us-ascii?Q?/XPCa6fgeNijrp97u2RkEfuNnT913nYbjBndMS2NHzTWB27RMEdE888nhEqH?=
 =?us-ascii?Q?zgyIRnHLqxn/TBLqbX7fOlm0l4qdRffBtVl9JVdHOjIQiKOJy+6JQmYm/7Jy?=
 =?us-ascii?Q?EKW6ZDNqvo17Xt0nXhSwowfoCB7JMYQWOTwv4S2iE8o5WMgGPSVuDI4onOYj?=
 =?us-ascii?Q?DfP5hblvVRmNKUo42SRTs2nOUFkfcJfvjNvPPdxoxc+Lj6aymblKBsRfiTqx?=
 =?us-ascii?Q?g+wnlIpV5t2AwwMiLd94XfPXA9DePp2dxr7p9fVM7Rpft98sOkMT6zH4Syva?=
 =?us-ascii?Q?yRFDjZTwH1QrhmazeToIsV6jVgVYZZTcLUWuROE86F+hSjywqFN1sIEAJfrL?=
 =?us-ascii?Q?RjOKEkTBPCIcNgP+7DLIQarYUFmqu9pWkLod1+oPEL5G6BmG0hU2pW6YMqH0?=
 =?us-ascii?Q?TeR/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 767edf5f-fd21-4231-2c34-08d8bbacea73
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 12:31:01.8479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zR7hyB3FMyqUYQZxCz+5HPKqXmKZsWFvUs/E8QBXL2GHdMCCv1yVJbFohyQEZhIMH5weCNopgEG3GPFKYRsg/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5243
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

