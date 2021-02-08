Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE95C43381
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Feb 2021 09:13:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A022064E88
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Feb 2021 09:13:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbhBHJNO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Feb 2021 04:13:14 -0500
Received: from mail-am6eur05on2089.outbound.protection.outlook.com ([40.107.22.89]:51744
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231388AbhBHJLc (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Feb 2021 04:11:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYEMUX6XjQxgX6bGybN8n6ybm4LtnOfYcXpombkJQ8fbfRfTFmJbd7x9H4nWWaycdlVW1w0JLqSdNdTNIP9/QL3kbiGIn66/gi4sQByu9EG2ubxmsSuAYXJP7mqs9nILsWn8Ip/lh5aHgrgaifvbpsgtyMRo2CMctQ0nL0WB8aHT0j3MfnKQsmwrlCbAt8d+M1LERb08EznKr/krtIDJZ62O3JARDg5Bd2wPdfXeCRv37KEpK4nkdLpDkWVHhd/sCgxKCk1iNDG19gOb1CbyPoaON/Uw1Paq0pIK5l4aBAHWDDpv1/MSSt29vsgq3mmKZfO4xW5rHxtNDyqlhoG0DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJE0Ov249gPUdtT6ZeB+lf9+Z+9T/yJFkeTd4I25VJs=;
 b=VEN6VdjYoKgzV8/7g2tBr+iw5wFYCkf1WiMBUSMdu8Q3NUkRjbk0pe7s4nWOYO05R2fkmAR9RCkRSCvcL00xxwxIxolTnwRDDlWRTh5GC5wjQO0RHenEQq15dyznXpR37WaZ5ISfM0Z7pTmHgNqqjAxaFY0QaH4nadcXLk5eCAiza7RZYMla/dHNyJLLz7CFU9sHCODHoS46CdcK6SWpbYkFgpWfRb2jzdIfUkHO6xgG3hB0AtiXWPLR5fZLTBFMljpsq5+BP+wGgWw2FFQglwUksNiiph6nIQH/W6KM0F9dr/EPas7x250F7OOFwLhzaHcd0eNrQ8rL5lPFHarn2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJE0Ov249gPUdtT6ZeB+lf9+Z+9T/yJFkeTd4I25VJs=;
 b=cedwUi9Bjnv0QJE9/evoYT/hAQ8hv2zfDcHUoTsI988tIrMnThFzJQXIMdqHoQ2PfxsXj1ibJ508lFNqe9UTR8wlmD2DGjdeuQNms5b28DtzyXj7qBqpbJxCjXfBlhya9CX7kYwyWLC4cMnRxncDx1FSsRTFMprSKOKl++blxvs=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2933.eurprd04.prod.outlook.com (2603:10a6:4:9c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Mon, 8 Feb
 2021 09:08:12 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 09:08:12 +0000
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
Date:   Mon,  8 Feb 2021 16:56:07 +0800
Message-Id: <1612774571-6134-7-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612774571-6134-1-git-send-email-peng.fan@oss.nxp.com>
References: <1612774571-6134-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0102.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::28) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0102.apcprd01.prod.exchangelabs.com (2603:1096:3:15::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3825.19 via Frontend Transport; Mon, 8 Feb 2021 09:08:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f67f1452-8715-4af3-aab3-08d8cc110fc2
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2933:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0402MB2933F0E53308766A97EF51C4C98F9@DB6PR0402MB2933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5WJv9pLYkr13n2lo8Z8bueCiiizYYuM8RHJ9wFziFFX5eWzu6AQ/4e7xqmkBgwaN2AOFSsVregEhPXxQiGXlQxY138SfL8zz6+0hfKhImA9p55SN4pYdq7RGr20VK52kkL8bsjMNDBAI53v/FlT2e69T4tLjSvQ+GHBjegn94ALmM1IV4ED8924DCOQjYousTbyfbi95nQxRtJF8vcocY4QMYqfEIGB7QCknmmOX7qJbZjpF0YtVhwH8dohjSUg1qrLzoVtqLE9ZnLBQ4cdTmjyepTW3+H7XN3k41XVbBJqg22sVufcBkYWnjqVN+4Zm8TeovYmqhsk+g+/yLCOuNP3KAREdoLExjnMvzcmtr+TRrJ7+42RlSepNvCW8DEJxGrlNApfN09alZ772iyZghrkanCOhSvFbgb+CfqmssYDTBgISKRa0tX5oeKwNzjJ+BhPG1jdYEvtPNIelKWWnbToWVvGjoq/beGnI8X7W8KAifsSK6QCbFdWLmpRdoTLmzY6RsXfcHi8NJgPG62FrJXWQLJQ6jorKvyFmycPe7xFiZTsAvjYSOP8YVGf2Ar8Dttm75m6i3GIugfI/E8TaLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(7416002)(52116002)(316002)(83380400001)(4326008)(8936002)(186003)(69590400011)(86362001)(66946007)(6486002)(8676002)(6512007)(478600001)(6506007)(26005)(956004)(2616005)(5660300002)(16526019)(66476007)(66556008)(2906002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hIkQrueU7TlIdxqh1A6EbwMIgzCV5FK7FPFLcCc7Hrkknv2G9nVMxG14IuYZ?=
 =?us-ascii?Q?mD/VwiV/Tj0bmpd5jgT+3qcmks9FffKgvyTiH180ZX5sbSHJr2XKPbikQKJM?=
 =?us-ascii?Q?q8JZdIvOPHImcpq7xwnlnjmh2bvWs+xpk5aApFWMAztJ8G038OOYACVC8Gmf?=
 =?us-ascii?Q?w9FDK4PsxvWr3QsnG5m6BpF6djo/9HH3Fkx0IWQCJA0DArKpUeGvtQAwQzEC?=
 =?us-ascii?Q?E8WrTf9TQo3hGQSeoQHCwD605pUyH33oV8M0Mb853USVxRrumwoWBUQGQBYV?=
 =?us-ascii?Q?qbpTxd6ctKb1B2jcQ88Jhu7z5PVwG9qblSIegqCs1Z8+o5Ve3A64dDiwG0RS?=
 =?us-ascii?Q?cfbCkwtGG51dtHlhQz19xj0/0XIzPvCIhbReSzp0YpGCtwfg5EnhihrT7pdJ?=
 =?us-ascii?Q?cAcLB3x12OsqeR+co/JMxEr9/5a9Y1V3VykSWZC4YGuoJM2XWPMk64MNxgAg?=
 =?us-ascii?Q?lJpQ4uGcAU6NiqWZJvzJxtKbTjWDdroDmRIdpEsZFWwm+VqmHjT4E2/c6deA?=
 =?us-ascii?Q?OxfcwzF3vdti6ibAcr3md6b1dWnBbyQQsd+FHzDwI6Sn6Abnnce/b3hWYInS?=
 =?us-ascii?Q?XpFylcYWwe30mbWRQYtmSz8PK8OLTFf5gFI2eI5mDaa+X/FVpt2WkybFpLWr?=
 =?us-ascii?Q?ki4ddlYePGhr5BWfHD7TLlp3eR5Tqv3vPXgKg/OF8z60NRTwQMly/JouZZNW?=
 =?us-ascii?Q?RRM10Ws/4sKYji/J8Y7VdGoU0jC61dFwz4eaubGrErrG13le28/0Zz8T6RWj?=
 =?us-ascii?Q?Vj/Og5VCnFqf6scxkmWhieDKckCL5q/mnyxoMwFxpB+Zax3eYRPsAd+YuaCw?=
 =?us-ascii?Q?rusO0x+GTz1gRAUIF+e4lbzX/cIxsP/QXbkyW7q6FEcGiB6ATLtjOaxKLoTj?=
 =?us-ascii?Q?W50Kf1a5cpve18AY17mfUhSUWwX5wF6r5WcYbyd39hLEycFda67WrKQ8+kom?=
 =?us-ascii?Q?dLO4pps4u3WnOrRYxO3YPtyRDaobhKqlkmPJf0DRoZP4xlnsS6PD4f5bBwHt?=
 =?us-ascii?Q?rfvtJU6vAM0RErCSJlZ4LUyYTLKlKXcqUdhK+i5w52GY1BSXf3bo2Lrj7qtw?=
 =?us-ascii?Q?kyN/1pRwcwZpZT1v7ZsRentDuDL1JQMO+wzT0IKRJ7F1eOUj1JjiJ4is0N1N?=
 =?us-ascii?Q?6p1xCQLpbRXEBkOIHjSQnIXNauUncVWRU93vaMjLaB3TfSXbDGggx4NPZrgg?=
 =?us-ascii?Q?3nFBgHhDA7OVIpfApjyt3bkFBwvEUGaNteOXBwzq5ClzRXn6u7EkEPhTvqWe?=
 =?us-ascii?Q?EkcyVxCUkWYcxsbLaEVO9u878m1m9ahXrzO9g753mAj4o/N9uQh8swGNZHvg?=
 =?us-ascii?Q?DGp62NC0cg657fh2tAkbDUz3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f67f1452-8715-4af3-aab3-08d8cc110fc2
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 09:08:12.7319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2eRu+ObApVTY3i+bXJgQ8hOL6Cw+3Ii55WYvBZ63AsKBhzF78BXPt9E2hLL5yoII0cFe5p+jne89E73PHqjMTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2933
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

