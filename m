Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23C7C433E4
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Mar 2021 08:27:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B7F761970
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Mar 2021 08:27:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbhCVI1M (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Mar 2021 04:27:12 -0400
Received: from mail-eopbgr10074.outbound.protection.outlook.com ([40.107.1.74]:9377
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229872AbhCVI0z (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Mar 2021 04:26:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sr8PeEVkbCep+myOa/tUTmhq6M/t/2r8r26I8C2tkKGkngQTWFG0y+chMm6xKMcv26h5k/gLDwfpwUuzXlptFSV0KoSrlwYSKgyKD05+xRnK1x7eVrUS8hze+xVe6dOcXnZoD0XhNM/t/vlcyzBPE/l/jRzE0QUgQkcxtmP+GfDlGMhTlZJCaWoSQcVSZju1D06dV4PYdDtz0NrwD0FL5vlr7g8zY6L6d3sv4R61omiJanxZeigoQp7p5VCTgxOOCxjN8Axd+Plm8rcRMgjggf/L3l8N6Jd1G8C4IWEZOgUFamSSpA+jqlFGGUCj8UtZ2u+tjAy88PvM5pHGcltrkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vf7ayQTSpXiUsnk2LCKoEVQ6Qweo+gEfS/5Lg2n8KYg=;
 b=nJy/i9SUXtiCe2W1r5Hz7ifOV66t9ETo9hnBEEA6PiC6ar1B0rhbUggmPWBJP+TOe682B4TL0WA+nMrjd172S8bkYz6iIKQuk3Do/b2qj/3wmWTCEYdno/5P8IWTX4EAuK3ZAsXvAVkXotc+LzXEUFTt6AkfCE2CS2oNl1Of07SeyciYt/n8p7EFBTOagjbAIVumdn4BFoiPG/R7vHcb7dxnlMKFeyMxDOlLK2pF3FWTy+amT97u0rLgDSd4Esp1O7MbspmyU92CZroq3gZxgIFSBzN9A68ebBZG7xraNhT7CSJghstsZ1b6FOHY59t0bBYVfI/pp7o0djnxbIRduQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vf7ayQTSpXiUsnk2LCKoEVQ6Qweo+gEfS/5Lg2n8KYg=;
 b=KD5BGsGL/5+cejydLcA7S4OeGwbXUsKl9TMKFt6JZ33Pa2i2gjblFYtL8c76d+jMWFPZxtk/Wpf4gMVhGewT6XP+FiU6H/PoE5Nsw05ct4qb7aa135AbZoYYnA++bZEM4UfPhczYVE0PhksoznVKkV1SEgtvY7ck3oBlktYx+RM=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB9PR04MB8316.eurprd04.prod.outlook.com (2603:10a6:10:246::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 08:26:52 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 08:26:52 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 5/8] remoteproc: imx_rproc: parse imx,auto-boot
Date:   Mon, 22 Mar 2021 16:12:40 +0800
Message-Id: <1616400763-16632-6-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by HKAPR03CA0007.apcprd03.prod.outlook.com (2603:1096:203:c8::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.9 via Frontend Transport; Mon, 22 Mar 2021 08:26:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 73b8aaea-9d5b-48cd-b4cd-08d8ed0c3e9c
X-MS-TrafficTypeDiagnostic: DB9PR04MB8316:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB8316306EC20E349E7B0550A3C9659@DB9PR04MB8316.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DSf7LvnKvZk8BBtLo8PfFnAkHFitWoFCkz6xEJzgWGkbNzOuK/Kdbw9kOMmXNBN+Fn6wacFpnqBGhQmXYc6aysoQ9fP4zdPHP5Gig4PFTX+g3YdxaJ9obLX+6OJScaKqWA7FTvCQl8I6csi/9ZMHKDolQWxxG8gRbDI/MX/KmlwuuXwwWmik8wxrXYDSHGJZgaEHtQGZYHi+dXdqTBuOh6g/DSNvpAls01KG8XA+Br/PhxX3VwcQ0DrgFVCCRCJaO6UPRsRSb4jYaAlGuyVag58hgdegTslCh64Qe7eKHQ2lYVtV5hdEWMS9lHOl8I6F+4DOs31hF3dYNpx6PIZ6lRaRt9tZdSwyMALuu45DId3PND9jWDfede9HSHIhNJyAnzFmpLV4lW3jjs5VFOU0k7xTj7b2TsO+V78x+47RTdejGU+Ce4InoRSe4AOKdC6m71wSG3HESpqSev9qo3XxGOvMXtLh84p5GpuzDdAWfz7EebdsUrJJvy4xaqT9QZSS6ji2V7VgQ/A/TvaAVUNY4+QqhzQ/tvUTzxQCnebInFb0YtFD6G/LaAD+260U/YxyFXCvdgPfQKB4tpMOktMmzll/LsLHL3Zn/KZgvwpI3rsNkDACgYEpRO1mr27mRW5NQKPDxvgLwukcI5+Ppw4dNl8/C0IGgDUgncvVur5UZjDB88HO8DhZoc8A9RbcGCHX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(8936002)(6512007)(6666004)(66946007)(66476007)(5660300002)(9686003)(38100700001)(86362001)(8676002)(52116002)(7416002)(6506007)(26005)(4326008)(478600001)(2906002)(956004)(2616005)(4744005)(186003)(66556008)(16526019)(6486002)(316002)(69590400012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?h4/WjWsbrwvJZTjxVf41Z2V+HEfHhwR5qgjxuaT8LeK5r2qXeRBe79HNYLRf?=
 =?us-ascii?Q?Yz+WR9a/kkdG3KB7TMpmg8ZDxv6ogD5j/5De1d2g7SMNkKQIGMLh+SJkj5Qi?=
 =?us-ascii?Q?MbwSu7ha0uEuuWtEVm1tgsHJLg98FQPR6Z7aYCGvRz87JOIhmBo2cpkUdjzw?=
 =?us-ascii?Q?n9M784dK4P4pDmMcbs+JnbH4CKbEP/M/HGDbUSAuzKirpSfudXaGUJ85jwAU?=
 =?us-ascii?Q?0r+9iejPV+CuVCoJBid30Mw5GquH+QHcesntxUQlCzgFVcz1f/CES3kn55G8?=
 =?us-ascii?Q?wUijYmbQkBtEGT92TO0kY2XSpzF3m7ZtOLVoQOEY708D0vbWvqnO8iicZI/7?=
 =?us-ascii?Q?zXXsB8kmJO4RmSoiTci7H5fJewwEtymac9W5EyCKvlL41ogdht3IU/FzQkAr?=
 =?us-ascii?Q?NvDodNMgfDvtKR5BwlngReEbRdSTdzSQd3TLV109FLFHFCuC/1dAHSNgMx1x?=
 =?us-ascii?Q?sg7O1QBf6A3S0g7qEYSd4hbU0a9Rjw+Q6cdOXEp69REKXFBYH6WZFVftAovx?=
 =?us-ascii?Q?Sqaw/qvT/qyUhuvZerNlyttZxLzmxUuUzIs58j4BjQAcyjxzrF8P6hQbWyNh?=
 =?us-ascii?Q?GcdILjzZWGYjE3CR+I3OmiUilQxNOonMPTSlatD7ZE0YNYZFnZW1wRgxqmeD?=
 =?us-ascii?Q?nw8y49wgRYcf+gUgivRMRKt6KE7Z6srGJDzN571HAI/2A/Fk5L/eszgR42UB?=
 =?us-ascii?Q?Z4rmy1o1itWP0OlVFTa11RWqYtbypg4/dFJIp+vrzHW7/mwtZANnOHsHKz3k?=
 =?us-ascii?Q?tf3FntXeKfDEHKJCzC/gdso+YEKR5d2ed3+665tl25bt9k/0xrYVO7kO8Y4i?=
 =?us-ascii?Q?RbocmEI39oH5c5EzUZHWbiTkUBEJ2jmGN+BBMcD5cTWC2vElA50M4WL9NGxs?=
 =?us-ascii?Q?YQSze/DqX8zW4NPkeEDzo31lLct3XfkA9zpAy6uQIv1DtyLudOE/ZHVUtZAg?=
 =?us-ascii?Q?9vX809b9RlFYKKpU8iuwYA0WrLLXr9t5P2+TvPuh7Y8cjStlwVrqbnYkfujE?=
 =?us-ascii?Q?/LgXQMcJommxMYz/BgzpnEpBhPvjf4WA6JhDf7xRdLojO42DK6wpYNH88Abw?=
 =?us-ascii?Q?Nzvp4qteoQ9vmiVL4VEWSjf3HMtTGxOZgHy+azjYejtN9ZmvbB0xmZvhkI58?=
 =?us-ascii?Q?xiIHI7pLLpUjWvLcOYjby0IlAeIpAR+uIOmo54BfF71PDkgBaW1kB4oDYCZI?=
 =?us-ascii?Q?WY2Y0NoNnT2pUHSCmn9c4hzmRANdKjFhYaQzlGdptopn/G5G6qSLo8piQdf5?=
 =?us-ascii?Q?kE5us0A907WxQMl5ifPNB+Xsv3pnRPyPn2a6g+djGm9UOeG4FEnwzp3QrFbL?=
 =?us-ascii?Q?SZij/GYTaISyxPTPC4mwQVu/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b8aaea-9d5b-48cd-b4cd-08d8ed0c3e9c
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 08:26:52.2371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HbpET7uKcutrP7em7T7IvJRCYxy7pOVRFoIMfK/gE9Rhx3/WMzYF2TW1Wi+P1zEtlTutXKHPH5jJgsRStJbh1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8316
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Parse imx,auto-boot to indicate whether need remoteproc framework
auto boot or not.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index e858c1af4353..f31b258201c2 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -673,6 +673,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
 
+	if (priv->mode == IMX_RPROC_NORMAL)
+		rproc->auto_boot = of_property_read_bool(np, "imx,auto-boot");
+
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");
-- 
2.30.0

