Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B2AC433B4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Apr 2021 02:36:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CFD061414
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Apr 2021 02:36:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234741AbhDUCgv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Apr 2021 22:36:51 -0400
Received: from mail-eopbgr150088.outbound.protection.outlook.com ([40.107.15.88]:34783
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234732AbhDUCgt (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Apr 2021 22:36:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BizIlscu30KvtM+g+kT1V6oAxWPLrj5aJbY9mq8a3uXOU0btLYwXN9xBnDaslch+GCf+ovS16Tpl4G4D9ojq08XY/g0p1e2dmJrbXgf5O9juotmoIZpF+v5wq5mAULx1gp31jD1dX9AqVlDesi+ekHBffp2SChZDJIgNieQmq9IAyOflrMq7afnIn5W8ScXptb5ZGeUyATJxG6XopVzFYmTfpGgewy8dneoXURuVyG97GCrPzJcxY0rpC99Qda/KgafsL0MyFDCNh5jB2NngYu5Q6TY4elTK+j4+F5muv3CDeP1A002PcllWwkVxQUAYeYqqyQojd+6R6lm2uDLMAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sS1qPSpCR2+q5Q2NGZhBZ4LMiXU5RaEq5A3dh4Bn1gI=;
 b=TnU0/ycZOwZ+Q2KEP3rX0ejvt+0DCDB42NzQsuAnaya0BprIE4MdTx24EKlOuQpGSDf33LXq/JY35Xn+S0nY4q1tcjZRGUp24h5OJ0/IWSPAKLqqgrsObmtWXc/0AagxsrzT8u6BHNIwX+ZQGPzR01c3Hm2nAvzFA1+zQ0781rk+kFI/ICv/b2nF1txmIH14w7vZjF67DJhqGLEG7zsYss4PKnb6tk04MsOeqKiO0HnM1smRrj9kjsf8z6lOjAu/lZ7HpfzIZ0m6a/hdLmt1J+ahEJOvhu9LFgpjqZXhDATu6a225cVFDeuHOHs2P3bl+y7+RcSg5EsGmew3J2R+Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sS1qPSpCR2+q5Q2NGZhBZ4LMiXU5RaEq5A3dh4Bn1gI=;
 b=TM8JhSdPvtsjlyvtIbzVASLgDPPiUAtJQ1JLaksaxE8SoO6aFvAJ6rhwKRBnOzAoV8iTyu956fsI57r0mmU1IhTPCRInZjlf8J30X4G1WuV3nuNhIcE1YxDKrUvzZZoHYeVjZYmfAMgeU4o3bBYMuxT2EhkWLFJWYUND4439O0I=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB9PR04MB8313.eurprd04.prod.outlook.com (2603:10a6:10:241::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Wed, 21 Apr
 2021 02:36:15 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4042.020; Wed, 21 Apr 2021
 02:36:14 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V5 5/8] remoteproc: imx_rproc: initial support for mutilple start/stop method
Date:   Wed, 21 Apr 2021 10:20:19 +0800
Message-Id: <1618971622-30539-6-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618971622-30539-1-git-send-email-peng.fan@oss.nxp.com>
References: <1618971622-30539-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0204.apcprd02.prod.outlook.com
 (2603:1096:201:20::16) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR02CA0204.apcprd02.prod.outlook.com (2603:1096:201:20::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4065.20 via Frontend Transport; Wed, 21 Apr 2021 02:36:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fcc3924-277e-40cd-b120-08d9046e3813
X-MS-TrafficTypeDiagnostic: DB9PR04MB8313:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB831381085ED4B2166F0DCA73C9479@DB9PR04MB8313.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:153;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hvzs/RWYkuXuL8QXAb4ldSwb3lEZOGmJotwNOXx4SplArZDksv7rpCKdvXiwvxLKBcbWenMvZW9ppNslF+A8x0sOujuEMZeIK+s2PtS7ATyH4Z+Ptfx8Id8w1yV/WUbo2GBCKSp7NAATbaOUC1yUCE3cRLXoLzntb5glk3FCYotI18T38Of5ZolGkyENnFXVutejDzqL7SeswE6HKKii6gKW1GvJAj+i4pUeOccSHiGxPm51Ya/evyMpvBPL+iYLHuJBJPTp9avr/fFZcX4CHCj4ScrmqHXCB9cyOLyDAvQqmGoLq09EEkQh73izL2SGFezTCgcMqfqdVs5dXHIlL/jrxou3WlNN/zXPprOdoK/H37AmJ7l0L4Db7Typ45ctGlvsqli7oRlC9ky264jilGQsE95wIeYVEG6/TvfPPk6dLA5c7DFlqCXTwZQorz7GbAHV6nDkiBnS0tJTK0MovYkcRYsIh6ZYPBDLh3Yo5Diy4bosGoe+WjSwjCiOM0IDhWSdoSdeL7JiTHwoHHtl9rGmVqqvjRpxfbpDhKma53WB4V/vkftM5iwCULK6iqLGq4L+avsCR2i4O9coM0FoBMcUHsswERApFQcddI53+lBfsFv+StznHZLRsohUz+e6eILcEaxJnr0K5ZekmRlXq/jW7ImM3GzD9CM2pPCSeAHWgVbf0h7IBQkHcS9yGbXW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(38350700002)(26005)(186003)(38100700002)(66556008)(52116002)(5660300002)(956004)(4326008)(8676002)(66946007)(8936002)(316002)(86362001)(6666004)(66476007)(7416002)(6506007)(6512007)(2906002)(9686003)(478600001)(2616005)(16526019)(6486002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RcmQbNqZAVw/zCVuJs5zwwcDco28A63/FWc81DHGgmll+sIxR93l5AIgoOXZ?=
 =?us-ascii?Q?H+7bZSoHn90qZefb9HlzWxMCmG0ebvvfc6jZPXfZ0ttVgz9ehT2lSpg2t2Oe?=
 =?us-ascii?Q?yH7oJZ9DWtSBpx7rv6ZTxlaDd7Oc4T9My82jEUB+KnMecILuAjte74haWk5F?=
 =?us-ascii?Q?k9I7b4gVqs7vB7USr8jzwm8fmTyTqvHDkGQZZYLcBAl1vglFZMacgTB+kuPA?=
 =?us-ascii?Q?qVZ2/yA2Ju1PFrduBhvBU2ceC3BKJIcU18Y90s2Q/CQ7DjRAsVZ2QpYj0jzL?=
 =?us-ascii?Q?kBFNRafzlsqu65mizHRBbMkv9WNIQVK0+tZ6CiFZHgPsK2dIH/86wpLa+PcK?=
 =?us-ascii?Q?uYiEpGeY1upU2rk+ybXJHpkW6xEUgfoHeyHun+hSG+g12ZmeR8hqFyUMsSPZ?=
 =?us-ascii?Q?tHz0IIwLPTqFG0KHDCW54vyzxzPoiL+s3OPx5ln0FZjG29gD6fzG1FPnSIia?=
 =?us-ascii?Q?cSoo4Cq2GwUYvL6rXNrKzpd3z8oEoofBoA/YY8HsR41MzSbOtHblvY8FL5C4?=
 =?us-ascii?Q?C7JjhYMd0ujPxdrZgvbyogVCL1gN0hCKQ9BFXldiY9NYj82LSSvRNTyiqXVC?=
 =?us-ascii?Q?CXOBM42EgD19X70nVSeQZPo7JCidhhIIMucEGgh7pq3xQrYdn4feJ4tDmERH?=
 =?us-ascii?Q?HwaY1RnkeTsPRtBpYqy4DSFv+RGwHLkTIf5qKMz0/ORj3qM48I2Kos7aDSsF?=
 =?us-ascii?Q?3Fya8ebS+0bflIi5YgxguROsB+wLFeB8bjY9kOsulbi3VW4d71FCf/d7stOI?=
 =?us-ascii?Q?eMdcx7V/HTMMNenJ99bbhbT+JVrG7HIXNeMENYyspXL2xAzUCJZreRBCtKn9?=
 =?us-ascii?Q?4ecqbEiKvr/Lo8MWPH0SOM19l8DpR+FJ3xckhSsPbxYvnSvy7nT4/ywTJWMT?=
 =?us-ascii?Q?Kp5UvquKM0h3+4/0R9PyErTt+0GCl9ZhTooTdAQaAe6Xg62Nr/V1YhJsYp1e?=
 =?us-ascii?Q?ut9HlLlyHgXe8lTOM/+y2QOiRV9piYbDTb876K44jMZ5XmQj6Kii/ixRzH2E?=
 =?us-ascii?Q?S956LQCfqKTQC5nWLHY+nPcxDgGV6K6tl5kxhCRohU3YqYnIbnq2xD+swI+M?=
 =?us-ascii?Q?zAfwyN5SGcCmU5CluAoRco3/eATbBqVQNC8Wc3FOK/4wbuy79KY67gG7z5r/?=
 =?us-ascii?Q?h8ZsYGMn0pMs0UkynrEQis3hXkwbFiS9fqGeFwfMPJDsxccvmR1z1Pwb/W9O?=
 =?us-ascii?Q?PzI4xIc1GP2WolZaMl8n4Wkyh+0iJ3VoQKV5yz3BjqFm10ksXYHK4bNjc2KA?=
 =?us-ascii?Q?zgjclN4Xz37iWsGuYTuA2kGWf8vhasf2b89u5W1jDnU/8YyKZF0w1xI8te8e?=
 =?us-ascii?Q?2gmCh0mWUZwDcTYFccAmca3Q?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fcc3924-277e-40cd-b120-08d9046e3813
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 02:36:08.4983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPqc83FQ1x/p+HcGlg62BmaNfa1xxQjHZKwVsjLMxhtu/UfijM21f9vIQ6D9iVSIdvFVZVyL2dSv8n9FgZpI+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8313
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add three methods IMX_RPROC_NONE(no need start/stop), IMX_RPROC_MMIO
(start/stop through mmio) and IMX_RPROC_SMC(start/stop through ARM SMCCC).

The current SoCs supported are all using IMX_RPROC_MMIO.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 06dac92e98e6..6289aeae95b6 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -74,6 +74,15 @@ struct imx_rproc_att {
 	int flags;
 };
 
+/* Remote core start/stop method */
+enum imx_rproc_method {
+	IMX_RPROC_NONE,
+	/* Through syscon regmap */
+	IMX_RPROC_MMIO,
+	/* Through ARM SMCCC */
+	IMX_RPROC_SMC,
+};
+
 struct imx_rproc_dcfg {
 	u32				src_reg;
 	u32				src_mask;
@@ -81,6 +90,7 @@ struct imx_rproc_dcfg {
 	u32				src_stop;
 	const struct imx_rproc_att	*att;
 	size_t				att_size;
+	enum imx_rproc_method		method;
 };
 
 struct imx_rproc {
@@ -183,6 +193,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
 	.src_stop	= IMX7D_M4_STOP,
 	.att		= imx_rproc_att_imx8mq,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
+	.method		= IMX_RPROC_MMIO,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
@@ -192,6 +203,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
 	.src_stop	= IMX7D_M4_STOP,
 	.att		= imx_rproc_att_imx7d,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
+	.method		= IMX_RPROC_MMIO,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
@@ -201,6 +213,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
 	.src_stop	= IMX6SX_M4_STOP,
 	.att		= imx_rproc_att_imx6sx,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
+	.method		= IMX_RPROC_MMIO,
 };
 
 static int imx_rproc_start(struct rproc *rproc)
-- 
2.30.0

