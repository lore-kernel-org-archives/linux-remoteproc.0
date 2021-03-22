Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B6CC433F8
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Mar 2021 08:27:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B91161970
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Mar 2021 08:27:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhCVI1N (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Mar 2021 04:27:13 -0400
Received: from mail-vi1eur05on2051.outbound.protection.outlook.com ([40.107.21.51]:33505
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229955AbhCVI1E (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Mar 2021 04:27:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9JGyveItMR6pgYqew0Vnf+J3f82xwiCNl2Ukr2z+CY+AscmSGd2+o1x4kln9tD6vbkPYLF/lcElEvmeSuN1wePNA+LsDl7AdKiZMIi6RbCEyYdVGi60yOI5kJWrKet+XxW/dNpNGz88ZYzA9Hw6kdKdwQXqHQExRtu4bfQWTlv7W7buJNiowlvf8DjxitNRaC4HLnWsNpuWr9Q8nzOfQDRRgRAv7kNUOHcyLgnxPeetBT+jsa117AGvaZm1uigCciLNeBlRiFroGwOKlV/O9njXsXm44XQBrtg2DPR71Q1tDTFEi6/V02jfJNp7R6zX23E8fvOM90ThtlzpsrIykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5VwaKegBRxG56V2/anrNjKPfbeJKryS3uQ6kE6PXE4=;
 b=i7XnaLOnsEsZBgGAOXUXRDQJegZzB/Tknq6JdMw39EZ1Pu6LtpR5hNviXEX5BtfcjV3CkmMIFE5y0cT+ndYtDZGK1W0fMIAwoD70zF6haq0bJbNyi43WfydiKevuiYDjWYl2a7UtiTBH3jUO0ivxkLnph5g1ByNWtaJ3lCLWaTNPdKcJKLbEF2dGQerlkVokkMYbPjB30bS2QBkQ7iYoknUWPbztuM3rA204dsaLmLGYYMVPD/NrW68rpI7TFiO43Vs1+WbH8f0s1F+TQwR56xSHMhdv3bMoBthM752A7i9jqn92CVPPaMJmJ/O8iNrNAehLs2aWFdci93fCsGu4YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5VwaKegBRxG56V2/anrNjKPfbeJKryS3uQ6kE6PXE4=;
 b=BJufkY+abeCgBwCBJlLtlpdGeJc+96e40XCH9+W2rDbaqraHnonYKt9wwrG44wMaz1J8PzAy7SMN9cL/ByhD4KxXLTgvNkYyNQrO79Z/cmIMOR9TQQxGWyTJgB1NJ/0qIbV9etpCt+G/4aXWp6K6MKXukt1xpItYN3v6NJo8aBc=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5993.eurprd04.prod.outlook.com (2603:10a6:10:8d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 08:27:01 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 08:27:01 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 7/8] remoteproc: imx_rproc: support i.MX7ULP
Date:   Mon, 22 Mar 2021 16:12:42 +0800
Message-Id: <1616400763-16632-8-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by HKAPR03CA0007.apcprd03.prod.outlook.com (2603:1096:203:c8::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.9 via Frontend Transport; Mon, 22 Mar 2021 08:26:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8bd95aed-a40b-4b16-810a-08d8ed0c4404
X-MS-TrafficTypeDiagnostic: DB7PR04MB5993:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5993802D3A2EBE0184661C2DC9659@DB7PR04MB5993.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:118;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8kN1lwpROHGdUtY0peAsXoDT1YqFaYtBar6Sb5yZxN/kbnIM0Ma5ywhKtJDl4uRAy5GLhxSECPHk8jtPpO3cFjmkiCGQ1QdhTCUxZorL/iI7DR//yy8yW3VMYCY+oKKSbf9DuC6ENPHeOuSc5RO5deWV5ML2vJ1MC2yA4B9Ll8ZwzRj905KGQvzhrWh9DB6ItjaDn3a1NheZjQHURSIJJuAXl3+h7pROoiv2wXUCbgphM8s6ruWsNK3NSoE2Qqj7q7+gCiKSGWyCFWLyY8Mq4dAVHlPEmF1XTM0FTTK9/louEoqIMt6Ns7Of4LfqLHeD21wvUj1qAI/WWO8ww9j/lhrZUYwlBvA2KUiDqsvPwaxAdRlP6BwAsEMjT++M8MUkJxYnBYObIwUfX+OPvVzYaBQU8TCpUMqImiKeeqdLUs7xdYXM4yJjlM4S0EM4nyZavFsW46ReRJzwSpxZ4+9JYmyEZWA3py5FlkTD9P26TOctTus78YLmtGyu6z0shVUIQ7DspF+/13ciOfDOuw8sNr9+LYwrenraPXVrBSlkiScYn/R2up5l44b8utw26TGhPdNnNcy+nG4X1rzbRTPU6CeL5ZKKFm7NgEnowTe+CmskpFqxbDjjc12ZFpNuVboxwLXNgfdrsdz1i6M04ATzBRevSZEf0dwgoG41Ufq/UYkzQCwzgduZpynEARhLm/ai
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(26005)(186003)(52116002)(316002)(6486002)(2616005)(16526019)(7416002)(6506007)(956004)(38100700001)(8676002)(8936002)(66946007)(69590400012)(66476007)(66556008)(2906002)(6666004)(5660300002)(4326008)(6512007)(9686003)(86362001)(478600001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?76g9jJXQoeEn8kju47f39zWisbiqOh9HJ4mQgrnen1W/cK6V8rGIGdp179NN?=
 =?us-ascii?Q?8IbZz8j3BZyvkaALDIAwL/9ns0H299JG+Fa+RSGXneWDSD8F2u5JuHNrKWZ7?=
 =?us-ascii?Q?qEmTvV1Orm4UBf5obzQYej4ELTz/OviJnIDZ699byoLJKY3MGlh31tY7rPDw?=
 =?us-ascii?Q?L20+RjaZu67B5tCqa9GJ9L1gNjU2+/JFSkXFyyqja53Xo18iiM5iLrxdHoU0?=
 =?us-ascii?Q?w04gEKQ1b8rUm0Nim63BUYynwSvj+1rv9MLUN1r0a1fyt9kYKDKcaH8Gn509?=
 =?us-ascii?Q?Jtd2ITHPKW7K0q9eBk4jIASsz+89vZ4RH91vinQyZT3r9mA3w2YX8C6U3yWp?=
 =?us-ascii?Q?dN+VDTlsF5MO9uqid/Gu/L65NSoxZBe0cwwIpfhyElSUY9xpNEkudzxDOCUV?=
 =?us-ascii?Q?Bc9v5Rxfl/V4/G/KobjS1Ez/JPVZoSNpB1I9kNk3FlGmT7O85IhIGyWnROs5?=
 =?us-ascii?Q?dhaTEBy/ZeaPPEGmeQsz6h60+T1tghRD8lWr3roEe4Cye9SNGyLv7/DRaBeg?=
 =?us-ascii?Q?I7n1I10l/CWOEgzEcP3RiFufesbHO73EpCV9io0NmDwEzsudEbVcQXeRUPQh?=
 =?us-ascii?Q?ZULIvIZEbMQFijlH0ph89Ev0q0gamhJOsz7Az9/U7B8ue2yIs6hYKwvNjPjw?=
 =?us-ascii?Q?V1rq/3So1hzkdxzR6O65T5QwTSUMmMToVUQ74WdbSR/YogTfAhdgJ8+tXZAS?=
 =?us-ascii?Q?mXLocG3+wiX6IUY6exK0pOlCsdJrArK0fH2FU4PPtlHMGqLZdAbV/KJoATbT?=
 =?us-ascii?Q?ITQHyuAgtFM/66HdMIL8QqEaJOV131R9/a5WMmqL0ALDMoVwVeIxJsVcIaQX?=
 =?us-ascii?Q?PjloVSI81gfEtJZTBzo0djYaAlMyw7sS1xnuNgaAn3CtSSeXoOIV67dhxOGr?=
 =?us-ascii?Q?qq51VFgn/oQdnPFVOzfnWl2I/a57rnOGGLmukezvU58iJg317wmZRzhOsitP?=
 =?us-ascii?Q?QVL5+V4DqQAdpj320LHBVpo4G+QlMPGsjvT/4g+B39JhZWXFh14rxBljvyI7?=
 =?us-ascii?Q?n5qVxMJDU2e4yVcBXu8hsYEpnFzZm5vNnueOSlRZv6O95ZraoTfpc+y7OkgQ?=
 =?us-ascii?Q?uHPCmsTerhVjubYw6mpk20iAUBz1E1BqhJYiKZeLSJ112nrCX/URnAoyOhD/?=
 =?us-ascii?Q?nZxbQ+K4JZIUQt8pKuBKENMCQFR8NpbEDKb4si4EOs+q91c4fFaebOsegIsI?=
 =?us-ascii?Q?Z8pWDzwapz377iz5UtJvybDJhnriAi5/Gunw5U3jI6scNxd5KY3msY0S0dvE?=
 =?us-ascii?Q?8vvsM7ZM2O84JVsW5gLoYjlydqBEaxvoNMipCKXjdhBwhnIW9g4neDv9i01A?=
 =?us-ascii?Q?oCNtwXHkD+1z3XTd1TYNkXqU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd95aed-a40b-4b16-810a-08d8ed0c4404
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 08:27:01.1080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uXNPzi1MSFkDouytE5kdznlwh6VrvMTHwmUdaG73Qp/zgES8QlixTYPnODLKh5ci5sBbJjZA2Yri/2s7IFh0JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5993
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

i.MX7ULP A7 core runs under control of M4 core, M4 core starts by ROM
and powers most serivces used by A7 core, so A7 core has no power to
start and stop M4 core.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 8e545b654e54..79a6b65d60b6 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -147,6 +147,14 @@ static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
 	{ 0x40000000, 0x40000000, 0x80000000, 0 },
 };
 
+static const struct imx_rproc_att imx_rproc_att_imx7ulp[] = {
+	{0x1FFD0000, 0x1FFD0000, 0x30000, ATT_OWN},
+	{0x20000000, 0x20000000, 0x10000, ATT_OWN},
+	{0x2F000000, 0x2F000000, 0x20000, ATT_OWN},
+	{0x2F020000, 0x2F020000, 0x20000, ATT_OWN},
+	{0x60000000, 0x60000000, 0x40000000, 0}
+};
+
 static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* OCRAM_S (M4 Boot code) - alias */
@@ -207,6 +215,12 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
 	.method		= IMX_RPROC_MMIO,
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
+	.att		= imx_rproc_att_imx7ulp,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
+	.method		= IMX_RPROC_NONE,
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
 	.src_reg	= IMX7D_SRC_SCR,
 	.src_mask	= IMX7D_M4_RST_MASK,
@@ -593,6 +607,9 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 			priv->mode = IMX_RPROC_NORMAL;
 	}
 
+	if (dcfg->method == IMX_RPROC_NONE)
+		priv->mode = IMX_RPROC_EARLY_BOOT;
+
 	if (priv->mode == IMX_RPROC_EARLY_BOOT) {
 		priv->rproc->state = RPROC_DETACHED;
 
@@ -728,6 +745,7 @@ static int imx_rproc_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id imx_rproc_of_match[] = {
+	{ .compatible = "fsl,imx7ulp-cm4", .data = &imx_rproc_cfg_imx7ulp },
 	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
 	{ .compatible = "fsl,imx6sx-cm4", .data = &imx_rproc_cfg_imx6sx },
 	{ .compatible = "fsl,imx8mq-cm4", .data = &imx_rproc_cfg_imx8mq },
-- 
2.30.0

