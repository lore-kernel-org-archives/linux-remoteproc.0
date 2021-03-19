Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8AF4C433E6
	for <linux-remoteproc@archiver.kernel.org>; Fri, 19 Mar 2021 10:17:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C145F64EEE
	for <linux-remoteproc@archiver.kernel.org>; Fri, 19 Mar 2021 10:17:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbhCSKQZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 19 Mar 2021 06:16:25 -0400
Received: from mail-db8eur05on2061.outbound.protection.outlook.com ([40.107.20.61]:35808
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229785AbhCSKQP (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 19 Mar 2021 06:16:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gv5PCPayW4vgjsOv87eLW9+OffA/N+12ewYMewiMUMgNpXG2GPqG4DBsn6GZeI/JshUwLgqoJUoxcuXfYEVCUHT3z9+c+RDWn8vpTJfe88GoIgi3PtkOhyhqAMCZjHixKzs95n3tP7dYaZQZ4kqrJCbyBj5sTMJteq58lWSvCPIY8M82f2X0js43Yu3p9E8o37rW5tr30tP8+0cQfE2pgdVNEwzR3AgYfp93Sm2MMOYedX/EXQHfy3nQF4/Itoa758bssq6vBUdPyBXjmJjrJOW+m7o+xtinOHgNqiyIi1hJ1joFaGHm9FEnKMxg5YNmbLYjWS5vdq9ZL4Ya/NTENQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUSsW3IoB1qObqykuMScMgJEXTMzhkEmiL5C3Bj+38M=;
 b=E9/kXPC6we4cPr+pjzVTqVr6vZOiLWRhjH0F/AeufqcZjfg/zJhQ39ldHzw+Ycfk/CIYl4nlV+rhgF5FceqgFCEm9LJuF7+9uki1JnqpKtukp2a0/qBxF+/pb7yc1nuMJTQlxGVjeW9oG3eVpr/bMNEQTnhLMnxD5HWOSActDZEpnYBsZ7Ki/kDFGCH9tXdWYiiDERab6tN9rdYMcawHgK8RlmwojbDpsTKB6RHQVFoB+acFnZxGsynjEuIw7rqyjlmdY9pXjPf2e5triP5J7t16w0K9y9I0oD2Aa1imAYlV6bZ3ZQtoRbri1n7mo2Vpige1wygFaslKP4Qe+GfCrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUSsW3IoB1qObqykuMScMgJEXTMzhkEmiL5C3Bj+38M=;
 b=eFzR2k2azmSkEWns2fn7VIYwBW3c/IU1/eGC88V+/x58H52wV/hpgRUuxNUJ5JZ9+Wu/3HBoZjR09/sQZROUW0WNclVjqdVaXiNVAcoj7FzssGYIVUO3KR69HchFpA6vWDXpnr5rrWcV94qcryOexWsGiI+JAeEwCyXbOx1tc9s=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5241.eurprd04.prod.outlook.com (2603:10a6:10:1d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 10:16:13 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3933.032; Fri, 19 Mar 2021
 10:16:13 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 1/2] remoteproc: imx_rproc: enlarge IMX7D_RPROC_MEM_MAX
Date:   Fri, 19 Mar 2021 18:47:07 +0800
Message-Id: <20210319104708.7754-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: MAXPR0101CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::16) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by MAXPR0101CA0030.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:d::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 10:16:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9dbbd95f-0411-4a04-54ce-08d8eac005ce
X-MS-TrafficTypeDiagnostic: DB7PR04MB5241:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB524119AEDFEA7C659F8EFF80C9689@DB7PR04MB5241.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VOpxlzctifxRFmiXrcVdfwwcj1MMzgIoTHjepQCZINNn0Itq38aW7hsJFR7cz1S160BMCuNYu/1s/JZa4NAie4ULcMGwzINRSpbVb54JkZ4IuPkAkvd9ZSkrFegTRT19Fnow/NWv7TmhoABUYF3EyVDV1U2T8U4ynKwSUy7LbNyN/mhBMPm/ho98N9do18gRacrSUaRzegdvi0AlZ6y/R6XsDQ9jnnxM9xoyzyCy8sQOXEi9UuWTHWt/M3mi2pzNanz7L/m82EIHgJRpOMByWxZXaZWfNXeCi8zfhRHxgbxac6AbbZPZOTf7Iiiv80Tjw3s7ZPcwTL1b5A96LpFjQLJxufhFNMGRJTQg/+bh5U7lt3jiOMvqlgGISJ+M71wao6kngeC0Wy3uSG6muZy87Rn+2uKN2aHyvM1t3obVtruIDdt6SaH8T6uZFM57PBlLau6vUQzUaTsWB0VuUhRFcTrb7ATNO0tlEKweDPHLEHrL6vouWBUv5xVn3y8nWdr9oRymI5MwlQETuGcMBd7XuqRMkNyKabFljExEzBO8bynVIsZaAehOdRHtlgGIhYuxWQ4bg2Gj40G3JYM20l3OgrcEvExkV/yr/ErYSdGrVLYnXxxPqf82v+Ra21jb8MG15KD+UQ8N8L39EVNUKm9SpfpmDhkdoRBz2B4dw7WUTA1t8WytyQBM1GPB8nT9QkqBp/IhztuG1nSO/Y2v5QnqnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(186003)(8936002)(6506007)(86362001)(2616005)(8676002)(7416002)(956004)(2906002)(83380400001)(26005)(4326008)(16526019)(1076003)(478600001)(316002)(52116002)(66946007)(5660300002)(66556008)(6512007)(6486002)(66476007)(38100700001)(161623001)(147533002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Pxq7j6XoZl5UpOMdEvyKSkEOxyvjxdRxr4scyWzxxX1VqACO84xWmpBCDEXq?=
 =?us-ascii?Q?8V5+0h9X4VIhZnaHPTQtQ3oP1aD0DzCM6RGAdDEEXxolb/KRriPScVd0jT5S?=
 =?us-ascii?Q?yD5wjDqa13JxqgYjZeqNHrohDXEQjlRuy7eznzE0tbCswxeLvb1ctIfPFM5h?=
 =?us-ascii?Q?RuJ289AhdeRQrYxzaZRsL3rJ7jxRtXznRu8Tfmyy3OP+UKV7VaAZJ8ar7zll?=
 =?us-ascii?Q?nwjwVSU+rSFG5NrW88Qi1bwICtiGokilKJvM8/CmgyStTpVxido1nRkpKoU3?=
 =?us-ascii?Q?vEP9v4iasITlvUZKhnGCNvNIrJwpIUQMI1AUpVLwdOlFht8r4VYZFZYD3Xxn?=
 =?us-ascii?Q?7ayKHY8xH/MhG2olMy1HoEMasNEjpSMavKf6oWr5xE5qsk7BuwtBJ3RawiPD?=
 =?us-ascii?Q?aQsRvNgzqqmSFt2LRVbToPz7xCrdlqs3/2aGVH+NzJBuA3D83SUt8JZ0BiZB?=
 =?us-ascii?Q?Hm6agRmUh+IfatwOrtn5YgP5XlhB0ytKvXi0+5zyBKS+RYVqyEiEsbK8b2ry?=
 =?us-ascii?Q?pritoOegULycVpCIBMrrZkeettBmmmQr9dGISuMfkZlPIclBKYZrkI7Qscpb?=
 =?us-ascii?Q?Rp0MstQexS8PUdXq/eBsiUcf1lwh1rZoPaHpC3iY22oHow81VNcLNH3krc7p?=
 =?us-ascii?Q?hdOqr46quQUf2L64kM/4RcZ5A6lLY/8o3E9saYgkWgzjwWipUXoxNMQoFuI2?=
 =?us-ascii?Q?BZzAX1aRzXVxL1tj24aPeH26HRJYjOQ+V0lDwzCx+CM2al3S4dUi2ml8fsKy?=
 =?us-ascii?Q?YgSFkrkRxniNpP6Tdt/DWPG/zUDuKxlNMsPjRlGF8DhT4rHSBrLlV4IBWAjD?=
 =?us-ascii?Q?lH/CeLCAN/y1UVhrWRlyTzLm7xUG5Ef3Aqi+4zVWfFh4RcnMniHQFuXP0MAJ?=
 =?us-ascii?Q?jjFpSqOdb5xmiBKQzLVT+IVoCY+ysytFnnoFcwettkRo+CZvnsUz1nOk/A/T?=
 =?us-ascii?Q?UWjvBcwEYh1I87jf3hQZlfyea75bqT2rsGFtW43qyRZ5nXJ+Ui+tKTw1Ra20?=
 =?us-ascii?Q?HsGav9SPEx5DcKMLAfg/YmCIzzNZ1OqLLXBlq07Jhljal6C3GUu3ACcaJi8E?=
 =?us-ascii?Q?3Hv2ACUOOhHrHhRax6LkgwM6d6J0UsWNZOhDGFeXYF8v/j1N3MwkpJ36Pye7?=
 =?us-ascii?Q?EBYXKJ/19wKx6dAcDSpa4DkMjiov8KTMN1rhjQ17f0Wmz/Xweos4aXhGm9+5?=
 =?us-ascii?Q?qFEWeXTRvXcinr0w8v0eGeIZP2557mNdHBV5BToD5FUHkh57t0v3zkwPbERs?=
 =?us-ascii?Q?f9FgBolUrSo8n1V6HNz+6xee14ylxUy1Dnoo3isL8oP3e0cpoNhsMgJEbWHp?=
 =?us-ascii?Q?17xceW67zYEK3Hlv1xk+bOdChhICtIdNr/fP2HVcTlZHgQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dbbd95f-0411-4a04-54ce-08d8eac005ce
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 10:16:12.9621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXNwAHrD0JyTAgk9st8lE/Rm9f510XlPy4KAaxUGxUjM7WmJBv6O/dVkJ8e6OS2o+Kzd0lOx3TW6JZXMpkQB7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5241
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

8 is not enough when we need more, so enlarge IMX7D_RPROC_MEM_MAX to 32,
and also rename it to IMX_RPROC_MEM_MAX which make more sense.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 6d3207ccbaef..24275429a7cc 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -48,7 +48,7 @@
 					 | IMX6SX_SW_M4C_NON_SCLR_RST \
 					 | IMX6SX_SW_M4C_RST)
 
-#define IMX7D_RPROC_MEM_MAX		8
+#define IMX_RPROC_MEM_MAX		32
 
 /**
  * struct imx_rproc_mem - slim internal memory structure
@@ -88,7 +88,7 @@ struct imx_rproc {
 	struct regmap			*regmap;
 	struct rproc			*rproc;
 	const struct imx_rproc_dcfg	*dcfg;
-	struct imx_rproc_mem		mem[IMX7D_RPROC_MEM_MAX];
+	struct imx_rproc_mem		mem[IMX_RPROC_MEM_MAX];
 	struct clk			*clk;
 	struct mbox_client		cl;
 	struct mbox_chan		*tx_ch;
@@ -272,7 +272,7 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
 	if (imx_rproc_da_to_sys(priv, da, len, &sys))
 		return NULL;
 
-	for (i = 0; i < IMX7D_RPROC_MEM_MAX; i++) {
+	for (i = 0; i < IMX_RPROC_MEM_MAX; i++) {
 		if (sys >= priv->mem[i].sys_addr && sys + len <
 		    priv->mem[i].sys_addr +  priv->mem[i].size) {
 			unsigned int offset = sys - priv->mem[i].sys_addr;
@@ -425,7 +425,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		if (!(att->flags & ATT_OWN))
 			continue;
 
-		if (b >= IMX7D_RPROC_MEM_MAX)
+		if (b >= IMX_RPROC_MEM_MAX)
 			break;
 
 		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev,
@@ -459,7 +459,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 			return err;
 		}
 
-		if (b >= IMX7D_RPROC_MEM_MAX)
+		if (b >= IMX_RPROC_MEM_MAX)
 			break;
 
 		/* Not use resource version, because we might share region */
-- 
2.30.0

