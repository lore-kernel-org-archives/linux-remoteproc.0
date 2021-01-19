Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 673ECC43381
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Jan 2021 07:53:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AB1A23333
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Jan 2021 07:53:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731348AbhASHxc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 19 Jan 2021 02:53:32 -0500
Received: from mail-eopbgr40048.outbound.protection.outlook.com ([40.107.4.48]:30438
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731464AbhASHsa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 Jan 2021 02:48:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEUC/Al0Q+OmeGLRmclRmnMWrHA5r/GdudB5pRuipgg70QeYVXrEguQ1URLlAkjX8/o8W1YK0oBu2ajIRIKwlHiQZExe9Sv/seWclKo96Kbu34gPbRPByZfvAwJQ54HfGOk54CYCddzLMlVQoNKm90ZIXspkReZu8glVg6gTQPdPZTPQdCswyvGrHeV8tO5XoyZ1Q8ogc1VzpU2LevWPLMT49ZS+djpoMp4PgHJyFzVFJKmb3GcFQD78N5/5ZweZt1PEOBWMkE+s42WmxvY0/flDVRpRT6B4zwF3tMSEVcY/KrDukbZH4ONcZXrIFO2pF8scKXf2NFkCawe8777GyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrM/10lxX+u8ygpoSj3Cn75qK7g8pM1NhQgG/rAaoNk=;
 b=J0zU+CeOeKWicFwLolgf/Sb8VzCP+jaHgmv08smTNpF2cDF4ImW1tM2OmX++4K0LNCaY5rLBZnGED6K4I7RLwjYq6L3/GBUWIw2ZBcntNXaJLGgJkPi7NSbyVvVqqgnLYQElIYfAwHZvDJvJHpRy4OSkXhveRrnb1iVV+tI0etIY2kqYaRGnJJu6y6vYv9l8lDhbz5O4OrybpQ3D985tlGWgsqRtuc2YftWRCS8f8iYGRiG71lvcw7dJnXPJ8VvsbS6so0iDJ4rQf8txRhRxZzS9OVLtmEhDwOfoUEXrsNMhtyHcnxgpd91w//JQDbDyj7LVTa6nnItEK7avdfcsng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrM/10lxX+u8ygpoSj3Cn75qK7g8pM1NhQgG/rAaoNk=;
 b=M1+Z/7TkCPHHDeP/NethO1zvrwizl3Y3UaaYMw0wPsOAMgFtr0MId7Y9EsxA2xNi/zpplTVIG0RFEfxz+DrgqnBlzeXNKPPFAKZDaAfcw+k3Ac5tzHScT0cwAW1j80HDFuCaEZleUoqH+lgZSXL2ooahE1NJGcT5m9qlyKya+tw=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4492.eurprd04.prod.outlook.com (2603:10a6:5:39::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Tue, 19 Jan
 2021 07:46:10 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 07:46:10 +0000
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
Subject: [PATCH V8 06/10] remoteproc: imx_rproc: use devm_ioremap
Date:   Tue, 19 Jan 2021 15:35:07 +0800
Message-Id: <1611041711-15902-7-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611041711-15902-1-git-send-email-peng.fan@nxp.com>
References: <1611041711-15902-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3763.9 via Frontend Transport; Tue, 19 Jan 2021 07:46:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6b201de0-e5be-416d-0ed1-08d8bc4e49ae
X-MS-TrafficTypeDiagnostic: DB7PR04MB4492:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4492B7AE415A0581D445558988A30@DB7PR04MB4492.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zGa5jenCbuzX028KGIWZFsGlk8mEQOPtv+rM5mbgHL6UxvQlkS57OrZiRxaH5DtoQGxiEeso/QhPadR/EU/Iy5JYzzYjQNOcuH0YAV7DBpD+wBdGoJcTKvL1/vLMaOeMc7CM5DyirjLSjb+Kfhz/PBhzYu517AEwavGpgdLkUj9BoOGf8ceTml3pePEK3Ln7p/AQvDLJKyXbFy4TYgBsTGIsJoug3tkt5jSvH8KBN/xGMH+QQDsqd93ozIrDhzAqA3Qb6OyaGuDI8FExIPA35B2tlkRi4bGxxcqHmSZfHcI6+UxPHvZEKYdYjjFW/1StIhEq8SyiatwKmAe1Xd1x0bZPPUndBM6JyV5XrW44XQ1MexhizNoXrWargJdxjMizfbILGFSe8TFjd6JtYbXFK7tNvpvxh3A+oLDsO+aofvQ/vsGW4ELkhImMHEedT9QBsPSrwwFP8fu/kA/QqW1Cww==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(2906002)(66476007)(26005)(69590400011)(4326008)(66946007)(186003)(83380400001)(6486002)(6512007)(2616005)(86362001)(36756003)(52116002)(8676002)(6506007)(498600001)(7416002)(9686003)(16526019)(8936002)(66556008)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pnOy5WynSXsZ0MchRDwwg0msYQSw8/TYQu27Pd8NbiE287+kbxuVaJIUd09D?=
 =?us-ascii?Q?GUJIisDCcxcFgMx1AQITgb7ZicnZ2Qhl1HXKbZ0HmXyUvE3db5tQF7wS+3n7?=
 =?us-ascii?Q?yDv1PrHJ0vWiZe4Mr6TpugwZkZKLXQYg8ITuVxw2R4oU/mHJcRTrERUJYd3i?=
 =?us-ascii?Q?vszYHRdDR7pOylmgiWgDCChXQAWXJQVkKCZSDVdBPho5ZJV8t4e2dPxGvIl0?=
 =?us-ascii?Q?MBy/zevq0QZTXGiQimgGOk/lLvMPieL9IRLMWiBnvSzvySpNXw96s3+SvMSX?=
 =?us-ascii?Q?9+KNcOBMkubeO7I6K+Mn8fZHTFurrzjygDqwCJyyQy6L61tiUPJEEdlN9OtT?=
 =?us-ascii?Q?KV32EiANAc6GX7pqGTjQCgQ/HyMO+ugEFh1PsXfvARi2dW0qXpTFJM4pGpAz?=
 =?us-ascii?Q?XbB8G6r+qSEA+toJloZNDGh4YNfsV+kD5IVntuQ7sRbrw1xx/pmPqkHV1DAl?=
 =?us-ascii?Q?b8X1b9wYFl0dfw3u8IcPBvLbmrQIHGem5eilM0i5c1P8bZrBHYXAj2DMMkKY?=
 =?us-ascii?Q?2aIV2rBek89YoTKEpYr7siBVgOSkvXiHRoxSm+m0M8lkNnPUaYe63TnMPyLZ?=
 =?us-ascii?Q?qiNOerkl5aTvrh88TWyaEnZJv7K+oeDhLnKYuCChYp3lOl60yfKsFq7+tAXK?=
 =?us-ascii?Q?w57KJlqnNr6E9KQ1w1pHzp1l/AoqvzBUprJyiY3a56ytwF2QbVMZwdcdvoko?=
 =?us-ascii?Q?MXu/2GJhWcP/tVf+bRlAzmgWJuaCySJ+Rz93dXgekZTXNEaAdeyZAvIz8z6m?=
 =?us-ascii?Q?TmkPazstBOY/FppdXfg6nScTAQFWrCVkXb0a/ADEjIk+H3QSP0zuctXfnIFT?=
 =?us-ascii?Q?W4l6/3CBsFMIzpcyQm8THCzCh7GjusYKNKEqgoP0YQmBXbSu6ph9ONLqtrHt?=
 =?us-ascii?Q?cxJSE95jsbb8NpUzUieQcPSZ7NL4drcrZw30c/M216nw/aygp8O2gjH+fTEi?=
 =?us-ascii?Q?Db4+s24SsQ8VcvbWn6Pp83N+w3wUYMSR/GzRcMsV42vabIZDrvqjus/VoNlf?=
 =?us-ascii?Q?k0sJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b201de0-e5be-416d-0ed1-08d8bc4e49ae
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 07:46:10.5938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/HEb232l+Ze/pqxplC2zP6psdpj2qJPOGx1D+w6kNvlz2h33SMLH11XnTh83IU3HuuNLcE7mKAaRHm9sFjbQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4492
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

