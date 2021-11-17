Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9ECC433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Nov 2021 03:33:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D097B61507
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Nov 2021 03:33:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbhKQDgr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 16 Nov 2021 22:36:47 -0500
Received: from mail-eopbgr60086.outbound.protection.outlook.com ([40.107.6.86]:61825
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229614AbhKQDgq (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 16 Nov 2021 22:36:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaSV94wmNmJkKRJTW92Tvh1U4Tlkj9Bie4xf6YcTxyA56unTylNnyGiXgtwv3QSVTH046F52g50B0DTULzHtEtE0P8J6VnRgzs21YcpuVlIvMrfBKP3XBlqgye/Th6w6sU3A+KpQNfFGm9f48muzRDv7aCPwBU1DTTVwthMJESLv4WstxCHfiyYwstpDRVGnLN2IbvgX7v49fh+WX7FEF4aSasThRkBEfUPJySJD7o9p0VOQjfv67Be9GSNwneCwp49jZW+w8z5l8DBhLmrbJcTNyxmdh4LRc5nY5yrQenxIrASjvpwqNPoqQ2ZU/4/NGq1i/PudJZuU+tag2bdxEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Gbu0pJf9NZEdojfo4iz+/27dSNA3DcdZh2DQPuJJq4=;
 b=nyxF03TLbATX25gYBv1h0i9Bgfy0oCB99nZ8EHUhUuvi+8ptkCiXLDT7gJHhk3AQGSbQUAzLNTG+RjXPcdKzDmDQASnn1RSpFfSGUUczXim6J24InNY6gtjm84HOWf9fVk0h8bba/y/TNsRrr1hIfOhM+lNMnmg1wElfj99ySAvMt/vn9octjWswpIEAMJIcnplqaWhpQSd5Z/gKdslLJZkcDbxhLQ+oBtnYmTDY3jz3LwYaSR+DuHh7mMCv1gaANtLlBqBBxIDfpXlBMMEL3aJFogFPzc2dAuNY7Ti+nnF7F8rXwL2tSMrCCMxzQZvtYnJx07A03am8TFtMzStQHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Gbu0pJf9NZEdojfo4iz+/27dSNA3DcdZh2DQPuJJq4=;
 b=NcncqnMRxFuQLWVKZ352fjvnetSH3XLMFBliBVRXtzZprJgzWBLHJMlKXi3U6oOLGsqSbBQORIHSgGPQSXxoaFvChS1kThQOhA6524vRBg8LuwHesYO1mhvwpR656wuzICmk2SI72tvGFWF7sjW+zaYTRnAW8BkvWCaEAL54L2M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8840.eurprd04.prod.outlook.com (2603:10a6:10:2e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 17 Nov
 2021 03:33:46 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Wed, 17 Nov 2021
 03:33:46 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH V2] remoteproc: coredump: correct argument 2 type for memcpy_fromio
Date:   Wed, 17 Nov 2021 11:32:20 +0800
Message-Id: <20211117033220.2526552-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0132.apcprd06.prod.outlook.com
 (2603:1096:1:1d::34) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0132.apcprd06.prod.outlook.com (2603:1096:1:1d::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Wed, 17 Nov 2021 03:33:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9acff4e3-d930-4f9c-73b4-08d9a97b0f91
X-MS-TrafficTypeDiagnostic: DU2PR04MB8840:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB8840407597D667F6719EA726C99A9@DU2PR04MB8840.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k8lESvh5JVXAvmb6ibPkyisyDCwEAlJCecTxxXg9tUTVttUrMxFf375Cnv7ygRo2XxKJktFUV1X9knRU5pkOv+Psy9MqZt9snM9P542u/X+1yaxJxzGNf9pbKuX9DGUyTKOel/Pq5X/MpzIMKJXP3v14G23ZEtblt4UlKqqdb5+NtfBHgRBKy9qnzSx5KsrGVc5yyo/b4ZUoPJNdDqbDlUtmFQKHIclFW8EG5jPUBlEyK2rRus7yvkHDpggDZyBiSKG+k8zAbR/TPUGPZwG6igE50QGPjVarMVh7oQdCYDjhXL+0nq3u08Ht45C1+rqpHhAvkvn3SrQHoHVrAsaDkAE/9L+TlRxex4df4ceoEipC+7fY9ff5z5EENitcgyuGbYLbON52MWHxVdofdq6CCJPFJwRmHN3rzRN4s0ffTDNS/U6MLb/pDInbWTPC5EAf6i0Z/r1Xh/l2VNGFF999LGgHlWSqdzTD/YVto5njLb/mfMfKdApAjvJxDcn+Mc3se7CbumQWadbq0i2dHhNB+YSHmRFtBrXVX7Ag9Repb6XvJQ4fhg3mmIQTkxLQ/B6sMqMU3m7xSvMV6kDT8uVvXaAPeeS5IBv98pQhWiWK1nyRFbLiz91Qb1Zq5+SfUSTOtjV6wK7yi/JexjWdtk8CIFBbGrLAu1Q+vor3X/ygNfyzZG0rfEtXg/t+uQpseD+fq6dra52noVDiHO+vFBqUkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(5660300002)(54906003)(52116002)(508600001)(8676002)(2616005)(66946007)(66556008)(956004)(86362001)(2906002)(26005)(6512007)(186003)(8936002)(6486002)(1076003)(6506007)(7416002)(38350700002)(38100700002)(83380400001)(6666004)(4326008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hmafYQSpKlI9ggmAGOYGmmaNXTa+30NlHbcd/ecavdJkeZ3LcK+Ea2mJhIKY?=
 =?us-ascii?Q?xpI1YUNW8iipUoDg3rkWql2p2WBbe92KLmoq36IjAz+xjyfl94rdpjsGzUPC?=
 =?us-ascii?Q?mMXfQeyKnWwppbTX06nVqkNfiky8FW7Ii126cPvaMcQGga8WYkuDSxewvIlw?=
 =?us-ascii?Q?1HWDobFWVyuvyUXV52ctRn8KtdWkuLYfnOQ+bxI5t9911sTxTxlJhTNUsck/?=
 =?us-ascii?Q?dE+SYezLGQ5wjcGc7mu/hfUdCE+lMLL0aLBKfOXYyGtXZMqb0USJ1xtjK7Sp?=
 =?us-ascii?Q?CJZloNUblLP507tC+Ho2Uc5Sz3XKFHtmNaeDlkos4Kw8/F9GQIsRSIkafZ6Y?=
 =?us-ascii?Q?4Q+UyfPqiiza/cNpZylgDjUiSSwqqkO/7zxzPG7Q2OM95gh3brHCVqpSafmW?=
 =?us-ascii?Q?ANR/iKzKlaC52PYMcKWaj3m4pUDOmhf5oaJtnSBhofbFjDpfg7IwDtdPs4hE?=
 =?us-ascii?Q?sNn2o/zzIJ1jOeQ+Nu/tqeRgwYNsIkp15OJtLBc2IhGs99KnMHrpTho6/e93?=
 =?us-ascii?Q?lKEFd8pZk0vM2mcE/gxThTHMr304swYfRYoOM8KZ2IrsNOy41XC7PEqpLUZk?=
 =?us-ascii?Q?cbCpTdBi0E6EuSio4YQf4WgCbyZ3BW1xfIqiFsFrbKuJKfMaxN8gGUwOxlyG?=
 =?us-ascii?Q?HArnLdCdheiVLr5O2RZTr+mmxtQ2lKKKmJaafDoXSOBAEdR9xq5gEf5heC2G?=
 =?us-ascii?Q?NFw4/kbtspTMwc2raPsvGomqfd+1E06GvRXR0wcZwAeB+zKBTJqrUDqT/GSJ?=
 =?us-ascii?Q?IoIEQnmhdI97LoIuVWKItl6vTVEx+OAuax1nmppULjdQ4WKqRImHT47SDNSC?=
 =?us-ascii?Q?KzBqJE9j/V7gMEcGAKO+3ibiVntimxhKsRx/HBEgAb9Sl21D1l1sKA2RPY1P?=
 =?us-ascii?Q?/c0TbL6BSqNkrC8p+idvXuejFGYrY6pHybHiPb3HoleFrzVFLJV9p0BhzNKz?=
 =?us-ascii?Q?G9dWH7DIXljY4/HwohQH6f8NSfzdGXDKWBATuFuiQzNlxD/4NnyfDap/kpBV?=
 =?us-ascii?Q?kMpEHXvK4C1s/qbM3kA56N21R9qJenGNwmmxkgcNZtMwZbudOgULr6SCnPyn?=
 =?us-ascii?Q?cImtTWRLdSgWXkjskYgmGg5CQltYroN0QHMrIDeBpTHd2wqxFaL42rbsBe2u?=
 =?us-ascii?Q?OSvGiy0YqBhEzYVGB25982wbqfKwJWtilUtmuO4VXT2nynwHZ5aZZouKLoSY?=
 =?us-ascii?Q?MW6OPVk4oXrdp2eSlYXpPPNAaHltcZPJWYqffxPGLGI26u0DwXa+rhPoD7TB?=
 =?us-ascii?Q?oGhOftc15ORrG7obsGo+hD9pT4cx97YUmyaCd0O9RwZWuzHrgujESJV72dY1?=
 =?us-ascii?Q?dj7a8Nk7mNr+FGn8Pfk/noD9QwNLTwEhkVP6mvdfwtPjln4gTpKPkEt5hli4?=
 =?us-ascii?Q?cgwpVx4XPhbyYTAhIQ0e8kPRUx3mnkhVNyNoV/5rF0NIKVBLZc956Qcsurx9?=
 =?us-ascii?Q?VS/iMVXleSqn2z88P4SchmFgyulNXa7gIcKIBhGpEPI4I9WQgV+J6xYvuGym?=
 =?us-ascii?Q?aGHRCaPbu1dfOIgeCje+JBT+7Cahh62oga3avQpoOdP4VCdYzML8sg8z8TYG?=
 =?us-ascii?Q?PhKzxrenpYQNVY9B8gncAZje75qXG8nj12+xvOn9SviCKHd7NEq4AvIGGvO1?=
 =?us-ascii?Q?stANZHIg1maoCq5rlyIBFzE=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9acff4e3-d930-4f9c-73b4-08d9a97b0f91
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 03:33:45.9745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UyBvhp/lHJWGJ/c14zzftIFUqszEsyXbHYAXywLFfS/5jSJvkI5qkI91e4SZHdlawyiV/SjWGzgxrWQmvATAlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8840
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Address the sparse check warning:
>> drivers/remoteproc/remoteproc_coredump.c:169:53:
sparse: warning: incorrect type in argument 2 (different address spaces)
sparse:    expected void const volatile [noderef] __iomem *src
sparse:    got void *[assigned] ptr

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V2:
 Per Mathieu's comments, use 'const void __iomem *'

 drivers/remoteproc/remoteproc_coredump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/remoteproc_coredump.c
index c892f433a323..37d86043ce5e 100644
--- a/drivers/remoteproc/remoteproc_coredump.c
+++ b/drivers/remoteproc/remoteproc_coredump.c
@@ -166,7 +166,7 @@ static void rproc_copy_segment(struct rproc *rproc, void *dest,
 			memset(dest, 0xff, size);
 		} else {
 			if (is_iomem)
-				memcpy_fromio(dest, ptr, size);
+				memcpy_fromio(dest, (const void __iomem *)ptr, size);
 			else
 				memcpy(dest, ptr, size);
 		}
-- 
2.25.1

