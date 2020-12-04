Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567F3C4361A
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Dec 2020 07:14:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E626D207C8
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Dec 2020 07:14:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728614AbgLDHOF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Dec 2020 02:14:05 -0500
Received: from mail-eopbgr60041.outbound.protection.outlook.com ([40.107.6.41]:50414
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725550AbgLDHOF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Dec 2020 02:14:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFgd21kaOdaTmiKVeNeF823SGkManiZdXjS99IWpqhuXQDcbmBHuaMDZREkLG4T2moCIC9/zuo/EWQ5u0wtkbTziecOtbpfU2NSlqLY2ehSyBeaUkqxicb6GKTxIHbI1+LweP1MmQgy+7bRBs/7zeUOQg5ZMCz9eubDyK0ESDC4DdCUVKY5esanekkM2hKJtdEpENd0JlTLJqgmyLLyfO0eqUIjjVaNaBONzdfQchxiW3RxJ3LCGhe2jT5tfQ8N7uAf/hTEoJbKcjJF2n++t4jWk4EOEcLy9WP+diVcGS1WFQEFnMKKqQsAdlcHkWcveULVfpHjb/rKqzPYuEhJbgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbHIk3RdLqqXi21+8pZBW4CmocG1F/6hgmHhROLpy4c=;
 b=E1TUaJGPbrs9QwPyW5oTMeonNhCzW0SeRCQzEJMvkFujAKKt3w4cnqFt2eoPysKw9M4EBcZNhZH3mMUBa45w8ieCXSAcNkJT+Y2W3UdvMlkDcKbAVNDUC1ueY0J10+ft74w/H48UaZqApzO7yThJ26AXjSUJimVTrYKMb+tGs46G08n/ZT2lwcumuxUt+2nmUUdAjc+TOrS8bq03BWzrFfm4mT7UhpbYLqKImC9t4DT6ScKNS3yne3sDGkXi37Eqab+Dt+srQPUAiZkScQDgs6OsNte91dE0zG0ueDdUg2J+LX0E27bKkgdutaTiLGRaatPGqC3rYYBaYjmC23ZQKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbHIk3RdLqqXi21+8pZBW4CmocG1F/6hgmHhROLpy4c=;
 b=Oj2ksfG6a0Krxj0aYyhBJe2+lakx7xpVw/8ACAHWXk3LVOc5QAVfQXC0dDBGhzSJi2tFpTT5W74kayjSthjNeG2BcZQLXJAXKNBTX4jGYoLimcQrZFM3mHj1fK9YAfNjrJm4YykCbrB00u98vViorXbIfMjHcAiw7wNHI5LRWHM=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4633.eurprd04.prod.outlook.com (2603:10a6:5:36::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Fri, 4 Dec
 2020 07:12:50 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3632.018; Fri, 4 Dec 2020
 07:12:50 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH V3 1/7] remoteproc: elf: support platform specific memory hook
Date:   Fri,  4 Dec 2020 15:40:30 +0800
Message-Id: <20201204074036.23870-2-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201204074036.23870-1-peng.fan@oss.nxp.com>
References: <20201204074036.23870-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: MAXPR0101CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::31) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by MAXPR0101CA0069.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Fri, 4 Dec 2020 07:12:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3b0c9533-82e0-47da-c23a-08d898240287
X-MS-TrafficTypeDiagnostic: DB7PR04MB4633:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4633E44A0E14B2398B4C0E5DC9F10@DB7PR04MB4633.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lF2mouCJX0mxk/iOMgzMm+2wz2QBG+pVzal4yxPCP/pqo8c+YvlgSYGSwyzTNN9XQLe+8qIztSo17pzcm4hM7fZffH7bYxjDlOAAKW0ZM15KdZkRCdS1Lc3ik6t0PTzPbcmfVG05zfNfjQ7Q4CKrM5oY3m269WzpURSfof2V+kUY3DGVtTtfTsf0eTeHJQbGhi0M8apNgrtqr+8dAAcELqxfUEvGd1x8Hance4WQyuvG6xeJuqmKREa5u5p4Bt6/mEoUJmOe1KmcSXiFhvnV/Q35CHL1MkZLnOIAubHalThEm9OM4xh0+fKXILp92ZPZNbesPBloJmTYQlsOlPkRLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(2616005)(86362001)(52116002)(6512007)(7416002)(1076003)(83380400001)(66946007)(66556008)(66476007)(478600001)(316002)(186003)(16526019)(8676002)(956004)(54906003)(6666004)(6506007)(2906002)(26005)(6486002)(8936002)(4326008)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?uMg96VdwdCHdsrMjHj8K7QFvBmqYHL6OrCsU8IIJaQVjsDTXaLHyHhCuq+UZ?=
 =?us-ascii?Q?xxiHM4ihaqV+pWUyftZo32LXgFvq8pvGaP+WUQ8zkgmWMiZQ3TL9JaSAMlZT?=
 =?us-ascii?Q?Kvk7wqrPVyGZvygXIxXh+A/JCanpSLEDmoU7DFoKVsD3AdqvlM253UO+bsdm?=
 =?us-ascii?Q?E3VN81ym+o1WRzMqcK2xO3cidYh6RRWeF0Wo9OElJ7vZylBOcu8Y8pLal0J0?=
 =?us-ascii?Q?W5A/Thwcp99YlZAn4ECuXSBnwa7PmgcWRDtwFqbPS5gznjWLbwWd8dSf6GyX?=
 =?us-ascii?Q?s96Uad3hbJ3QTQu+TiF3A4lkzyvWyJUOMEefd5YcjwA85X517vWSv/sgV2HA?=
 =?us-ascii?Q?9rpwYwjNSURkqpvgbTBTN14Wjre3A4IarLTBX4NWtJGeW6U3/OJZSpnMkqxi?=
 =?us-ascii?Q?1gBQpkFmSIHUZsM9rDV7ZO3Wes2nnvLLZBODdLVz0N7+7m5PXq2yCsYrYHeg?=
 =?us-ascii?Q?Y9GNPMmyb2OQubnyneLX6DqGz/U+Az76KCRnjMbxW+dgNyQYy65ZC7cpGhvD?=
 =?us-ascii?Q?AS1J+z/VJqgsMVhFUynQzYfU3CKt+tHaaBrzqw6fGD8yxWsu/pLQ1HnTSxDJ?=
 =?us-ascii?Q?U0UjDpSazdwnKg+dU1MAP0hJ3MVcpTgUqvRj9JIDmaLuEjIRYZpprqMMA0kJ?=
 =?us-ascii?Q?2l6iHlDsIIoMVeS8mkmXEpPYFI0avjUTyIVfekCcVxdW4pfTNbdI3q9VTIsr?=
 =?us-ascii?Q?Jqqpxjq1f8Z8xwDuVqlcAwcX4/vq//bQFuVZ4aT5GTH+d2u4ZG7+dk1ky9Aq?=
 =?us-ascii?Q?rN7P4b+m+nhpkIhz6Vp0/DkQvmZWNfsp2/rmUeByepjUbSkgGEBh1XavSXDw?=
 =?us-ascii?Q?7CRMdzpOdKQ84QK1jkVTC9XDQLUE2RTjvY1JSgYxBBeQrw+L453lj/ZBetPE?=
 =?us-ascii?Q?mIGB9GWwtwKhdMyFBTxe7JB6SyjjMD+Mg0ype8JGmS+MCZRSzVSlPGTTV9c/?=
 =?us-ascii?Q?JJkHqbo4aPm6mhrDDvMA1ZW7dSMUNS7FUs8CShW0NsSTmFrpr2+v8xdqYiYd?=
 =?us-ascii?Q?prz/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0c9533-82e0-47da-c23a-08d898240287
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 07:12:50.4619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OIgFh/JhomGtZAjykH50EY78imMyIl0ptr3kCmAUIMxvql0+l2hGoLB82jrjAFXsCsTVErO0XSDHaSBsohS7rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4633
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

To arm64, "dc      zva, dst" is used in memset.
Per ARM DDI 0487A.j, chapter C5.3.8 DC ZVA, Data Cache Zero by VA,

"If the memory region being zeroed is any type of Device memory,
this instruction can give an alignment fault which is prioritized
in the same way as other alignment faults that are determined
by the memory type."

On i.MX platforms, when elf is loaded to onchip TCM area, the region
is ioremapped, so "dc zva, dst" will trigger abort. And ioremap_wc()
on i.MX not able to write correct data to TCM area.

So we need to use io helpers, and extend the elf loader to support
platform specific memory functions.

Acked-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_elf_loader.c | 20 ++++++++++++++++++--
 include/linux/remoteproc.h                 |  4 ++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index df68d87752e4..6cb71fe47261 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -129,6 +129,22 @@ u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
 }
 EXPORT_SYMBOL(rproc_elf_get_boot_addr);
 
+static void rproc_elf_memcpy(struct rproc *rproc, void *dest, const void *src, size_t count)
+{
+	if (!rproc->ops->elf_memcpy)
+		memcpy(dest, src, count);
+
+	rproc->ops->elf_memcpy(rproc, dest, src, count);
+}
+
+static void rproc_elf_memset(struct rproc *rproc, void *s, int c, size_t count)
+{
+	if (!rproc->ops->elf_memset)
+		memset(s, c, count);
+
+	rproc->ops->elf_memset(rproc, s, c, count);
+}
+
 /**
  * rproc_elf_load_segments() - load firmware segments to memory
  * @rproc: remote processor which will be booted using these fw segments
@@ -214,7 +230,7 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 
 		/* put the segment where the remote processor expects it */
 		if (filesz)
-			memcpy(ptr, elf_data + offset, filesz);
+			rproc_elf_memcpy(rproc, ptr, elf_data + offset, filesz);
 
 		/*
 		 * Zero out remaining memory for this segment.
@@ -224,7 +240,7 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		 * this.
 		 */
 		if (memsz > filesz)
-			memset(ptr + filesz, 0, memsz - filesz);
+			rproc_elf_memset(rproc, ptr + filesz, 0, memsz - filesz);
 	}
 
 	return ret;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index e8ac041c64d9..06c52f88a3fd 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -373,6 +373,8 @@ enum rsc_handling_status {
  *			expects to find it
  * @sanity_check:	sanity check the fw image
  * @get_boot_addr:	get boot address to entry point specified in firmware
+ * @elf_memcpy:		platform specific elf loader memcpy
+ * @elf_memset:		platform specific elf loader memset
  * @panic:	optional callback to react to system panic, core will delay
  *		panic at least the returned number of milliseconds
  */
@@ -392,6 +394,8 @@ struct rproc_ops {
 	int (*load)(struct rproc *rproc, const struct firmware *fw);
 	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
 	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
+	void (*elf_memcpy)(struct rproc *rproc, void *dest, const void *src, size_t count);
+	void (*elf_memset)(struct rproc *rproc, void *s, int c, size_t count);
 	unsigned long (*panic)(struct rproc *rproc);
 };
 
-- 
2.28.0

