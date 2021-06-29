Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6529BC11F64
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Jun 2021 01:14:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16DD6600CC
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Jun 2021 01:14:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231947AbhF2BQs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 28 Jun 2021 21:16:48 -0400
Received: from mail-vi1eur05on2066.outbound.protection.outlook.com ([40.107.21.66]:20897
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230163AbhF2BQs (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Jun 2021 21:16:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1re8IwVUYE2/RVbbvv8/5gu6ITEJ10joTMTaiei9cXJF6+yllEwK8G21Uv2WMxugD/NFqLEPsON0kjXwpF2QDEysvdNbKYCPGpAivSbIyBGAFKxlain2U/RLbbdsV1Ih53WXT6uIoKPYK209yMiCHePgukvsCEfLrHeveh8h8XBXnLEm1YYLXdAU05OsN0RRwsOHtBBy/SX8e1W25LvM+Tz568fAJVxYMnP602cfWEqLWmpXGGVkLTA4Iumcttevl8Em/dc+nX/to6Fz0rlpUCkUh6gHMbEiCPmc/ymNCU8mev0hgIUfSJ2Vpc9muMZ4YnskGM4LFqa5f14DcVAjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPGpb3/EBToKDZoJDQ0t0nxDY+fJ5t/u6Z4u8OlCiek=;
 b=oXCnSL1LIsD0BZe4vfCQ9Nam6tGeNnQo3vjH0g0c/8AtnsNSeqcUOA/NxBGX2zxwabKSL00jDDOys205xzrZMrkxdrZ167r3dKoAnQbU8Z36t4lg8HA4/9l0lqW5yn50seoSJ1St/mNksuGnzNGrRQHuzYiPs1nGcGd2hDlUiMaXV/AdbWP/UgvMmHXplv6snk/tylq74u1ROZJLX4HBYqFXZAKKaJEkalD/eHWMB/WywDDwYX4b+kfN28c+gQ86RL0KG7U+0rdhMkgY6p7lKK1jalWZablv/pxmtM6h7EF77On577EgzwwottVEHfZ3ChCWhRT593jKq8Mw0eDtJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPGpb3/EBToKDZoJDQ0t0nxDY+fJ5t/u6Z4u8OlCiek=;
 b=LTZpjyd1/W+ssp6kC86y61GdotJeMhoElBwEuw8sdcqigr5nrFZGu2aD6DF7eSNMcJFZukHCKrgT9L799NBjzQUnfwQe22R4VtRI65jAwprnDru6zXZciVUdCjVoaiGmd86rujVh7pjPHRRzuFGkFvgeHvF+3Pd5XqFDm2ji0Qo=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4236.eurprd04.prod.outlook.com (2603:10a6:5:27::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 29 Jun
 2021 01:14:17 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd%9]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 01:14:17 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        aisheng.dong@nxp.com, Peng Fan <peng.fan@nxp.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH V2] remoteproc: elf_loader: fix loading segment when is_iomem true
Date:   Tue, 29 Jun 2021 09:47:52 +0800
Message-Id: <20210629014752.5659-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR04CA0147.apcprd04.prod.outlook.com
 (2603:1096:3:16::31) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR04CA0147.apcprd04.prod.outlook.com (2603:1096:3:16::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 01:14:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68616c39-cfa7-49fc-e6d5-08d93a9b373c
X-MS-TrafficTypeDiagnostic: DB7PR04MB4236:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4236EB2E4703B383DB3FC014C9029@DB7PR04MB4236.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kPAQ9V64gk4KdO63i/g918b6zDWhlJcaHLQi8dAywx3lLECQewT1FicNf8VzMStHxORflPmcizFTPo/iWSwdvOB2+zKYfdBhHFWAVwKzrm+Ss4bbSiDG4W03oLaKD+9wM/zqW+wvm4oFpS9TP23KW2SmO4Z5pYKVERaHNnOlKMR9Qr6PVYgZzmxtlQvb0Refs5W2axl017tcASdI0kIleYzKSX2PU8/t6WDvX2uzC/L980gnF6NSF/D27IhRZZPGTllmjhim7UicZm8+OebxLDtSOfox0sAqiw9fRvB0TiZAu1e2TuvoVDvwY076WIp+c9EMXDULTnqsrRyKWcXrfTlqfziNNFyuOqRCfvIgnUEf5d2GcRVc2qwnzTfO2hTO6lI9YLnaldNxdu8hgReib12MN4PQfN5sSV7oXOaieOH6k1JJJMrdLwN3dt9hsn4wWm64lJMNNr13KQFMN+F5DYUJit1pyz5sav4ds5VGqWdK4szNCD/D8GrJ+b4QOMVuPsMe1PD2tHH8h90dcpF/vDXWkE7wAtXxOZqiefOlsBGuy1n8TRafRedEw8kJi1bEydnnJ7OzpVxxkpWdaLVbATjVOd3OLvu8ge62BX/6djRwh+XkMzGIsvhFeGhj60olCUub2DFRJX3is2UnY7kIJQYv2lzAWQ+ckwHG04/ACTl5HeHEfUveL8gVEKP2193xuy/L2yHHmzKuDok1dBhgLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(86362001)(52116002)(1076003)(6512007)(5660300002)(7416002)(38350700002)(2616005)(66946007)(6506007)(4326008)(54906003)(8936002)(8676002)(956004)(316002)(6486002)(478600001)(66476007)(66556008)(38100700002)(26005)(83380400001)(2906002)(6666004)(16526019)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sqTNbIVAFhGcYDbWpQpKYw45ZwOWhS4CEMeh57Fdmk3tRmBjLD/KrxMMDMF5?=
 =?us-ascii?Q?elWVcLdTHlbDb/hsFyuVDdpzVOV5mwDw7vTgOmem6j8VVxw5xtU+n/2iNhxl?=
 =?us-ascii?Q?R3dDtVUGKfhD0ovH1DtpyuIVnDdX1baWWrVm56JXGjDzvDt1RMYUw6+5FC4S?=
 =?us-ascii?Q?8WVniiCF+3fT/9lEtUO786Pnqipw+aImbOttY6PFO0EG4i0rW3VPCHqwLDp4?=
 =?us-ascii?Q?RjGE4l4fZ8lzFHYBofjp6Vbj5+4N58fV5pyw3OTC7FeGROA79d5VElBErgTl?=
 =?us-ascii?Q?s4/y/CGdepNbVeKMOoQsCXs+qAWHvHrTz0BdipI3R/40c3YHTdfk7DWqOhN9?=
 =?us-ascii?Q?XL9mXapyea9xkRCAaOnRsPqJKhIIOply+pm0pEBukYh9cjt951fDQKfi0wAC?=
 =?us-ascii?Q?yACfRnwpyCZ4j7F8G14Zz+JYbiwZP6d8vNLQ0IXqnY4L5xzzNKtiI/QHDlVh?=
 =?us-ascii?Q?f/ZicpNTajVMfDtLwFKrOiIZ8x/nMnlqCivif+2Y01PyzbLHHB1QmTS6E7hb?=
 =?us-ascii?Q?w5SIRu+HYddBb3wLo2A6XEKDYdCao4v41DObsDzjLMF/Ebn0wDL4o98Cd4HD?=
 =?us-ascii?Q?tB4k4fI6UdmPeFaA4mZQAn287iVemnO46OY4X5GiL+Cq4ZC44PUmtRxGC1N7?=
 =?us-ascii?Q?VZ9Xuu2GacDSTk2nUsVOoeINIZCKeOagvmNYHawpmNXzX0Ryb6W7iwnL8ULz?=
 =?us-ascii?Q?zKKT08ivuJdwKng/itCYrmWXz9xgtEm3GLU0LeOzU6CyvIk9+ms1MKDirygC?=
 =?us-ascii?Q?7yvaoEZS8sntohcMKlVSsDrhCHmd1qJlBm3F/RBusbgyKYqAKmY2TkR3h7VJ?=
 =?us-ascii?Q?xyE3plv8GLFpnpV/6zW20SlwM9ZtCjnJJTRYGR+A0GCxBdmZGe8OVonXw2tr?=
 =?us-ascii?Q?MBKadIuyKBOw+FAmRrKrQarluKFLAVV9Gl7+qGP2LFzZ3pOVP/dFMuB8v4FD?=
 =?us-ascii?Q?s+VpsCparAP7gy77YTFf8t8dKmKkNZQCGd9nk1cm9P0AMHpYHZ801FOjRQeD?=
 =?us-ascii?Q?kt3LA4I99nUGNpLQllSU6AI+D3IAW1DZRj4QGCYtJ/MFkJ25tRbsMBwKVu31?=
 =?us-ascii?Q?IVhKuF+xs+tbQzGgzlTzxcjEFq5dKW/csHfkePPkfhlNvlEsZBRPubgbd5I5?=
 =?us-ascii?Q?Dt9OOeU/hmlV0g9IBY1xqgmMP69CjripsUCnQOpglkD8uziK3fjoxvdVNcEd?=
 =?us-ascii?Q?ycXoSMkMcHtSoBMbLbV7GAS1vZVIswiOyLteuI3yQd+5ehwNpsQknFdsqfkv?=
 =?us-ascii?Q?g/vgA8PVQ+eDIheZufKR+tYiKQ6DkrPrkfNn9rH2YE17mwAyiOSM+TIwtR7T?=
 =?us-ascii?Q?XwiwSrj34x/CC6Zmgfo0TVxQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68616c39-cfa7-49fc-e6d5-08d93a9b373c
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 01:14:17.5593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /8e5Qwyjn8xZRRko3yxc6+9SO0lIpigePoQUAXz2LC9wbmeonUeUj6q+R7OX2QFqLDQHAONjz+0UFZLH0ngPnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4236
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

It seems luckliy work on i.MX platform, but it is wrong.
Need use memcpy_toio, not memcpy_fromio.

Fixes: 40df0a91b2a52 ("remoteproc: add is_iomem to da_to_va")
Tested-by: Dong Aisheng <aisheng.dong@nxp.com> (i.MX8MQ)
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V2:
 the __iomem cast should be for the 1st parameter.

 drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index 469c52e62faf..44e7f9308f4b 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -220,7 +220,7 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		/* put the segment where the remote processor expects it */
 		if (filesz) {
 			if (is_iomem)
-				memcpy_fromio(ptr, (void __iomem *)(elf_data + offset), filesz);
+				memcpy_toio((void __iomem *)ptr, elf_data + offset, filesz);
 			else
 				memcpy(ptr, elf_data + offset, filesz);
 		}
-- 
2.30.0

