Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34DCDC433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Jan 2021 07:55:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCB2B230FE
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Jan 2021 07:55:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730780AbhASHy6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 19 Jan 2021 02:54:58 -0500
Received: from mail-eopbgr40048.outbound.protection.outlook.com ([40.107.4.48]:30438
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729993AbhASHrY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 Jan 2021 02:47:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaC6vI3hsDnbrAxTgm1JjMrRptUMbrs95PBuIp5B4La6PZDgc4mtUo0O+9BKFfHMO/DvL/8ZsLzAPsQNvYkumSfqWIi4PELv7C8gFS6HKg+pHXImAMfW4DKhEVcTibxoRAqF42oYra1o6VpPPt/OXXrNiLek1KhDV3iTeS+zmH+sOkXxyqHD9ews0++OiZZS3GblfUJmWCAmlg03WfacXLQaAYibxmeRSn1H+Xcl5gqSGOvb5ImyLldnxUtM1Dc3qRtzzkiLozEz87B7FhoV8zKmRL2+2cXHU+xN16wCctFxNwhZKGRcnxk7iQpm9qZfe5YaFpLs+E1Qn90A3DdIXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOyXY+Wu7yjAZykW6d3WzVozTOhNuNfY+00aYS59St4=;
 b=CHtNs5usDgA6VijRtgGTPwqwffDqdEeXxO0K5xCmFy9B1wFj4LE4EYBt0J4UnZgjUlhMCIjpnej6WrnYVI41OZ8MK8N3uX3be2u6mIqixSgUPBQqJ8VHFb/UQ+PizELB60P0uRUbRXOtyeWsgELcf3oi11657ee7PFD9vUiTIwuYbw7jZTBw6VTDjOqyqaYQ0+sEMoXzyDNyYT3DqM0uv3AwXIERIjIbsiMY0AfwnamnMv5sGYyqkkCsbEgHrX8pGrSYWFisVgARdyXPT9l/+deNVC4Nn7efwFysCAOTtl8QPgDZA3LSWprLd/YXGE3twnd8D8a1+8T+xnV6J3wHeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOyXY+Wu7yjAZykW6d3WzVozTOhNuNfY+00aYS59St4=;
 b=UGPY58lONgM4T4r4BSsFVMgCmyLkPJ0Lt+H5YrpAUrkIe10GrDUdhKKzf00rMf54yNhgBF/17rCNHgdPjpF98gjYOxDvYxps+bl4d1jAK06BabhT68HnBp2UmqLVlj/S+R/61/00/glByWTbomP0x/UUn8xXYnupQnMwddT5sC4=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4492.eurprd04.prod.outlook.com (2603:10a6:5:39::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Tue, 19 Jan
 2021 07:45:52 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 07:45:52 +0000
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
Subject: [PATCH V8 03/10] remoteproc: introduce is_iomem to rproc_mem_entry
Date:   Tue, 19 Jan 2021 15:35:04 +0800
Message-Id: <1611041711-15902-4-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611041711-15902-1-git-send-email-peng.fan@nxp.com>
References: <1611041711-15902-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3763.9 via Frontend Transport; Tue, 19 Jan 2021 07:45:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 21214fa6-f2d0-4df2-7b65-08d8bc4e3e9d
X-MS-TrafficTypeDiagnostic: DB7PR04MB4492:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4492AA28975393CD5074121A88A30@DB7PR04MB4492.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tdju8JC4NWyYpQbBcCj7PxI+i057rRDjAMEAf/0xo3Sz1VWUxJ3PMzVwU9JHccnqBE9wGfgy7DSzZq114zbT4vNSl1Weog2m63p4DO7i4vF0DRBV/GhHwXADM0Mev+N0zL49HqRTSoYhl6AAIsNOrF2romMYqEDDhrhmQHBYNrmdex+1uwC3PXOk0UdfW1QCeW+g9src4QBmliHJxLW8TqcXeB8klCL2iciP/INd6rd3s+UAWV/sb411kmDqCYt3RUzlzzXQFHJVI8Ke3ptKOy/7VFym72znkF0oaKD9lXSIahPZv6BmQOJt85qx1mvmd/6M9MswJlJ5um1CeZhWqfzvUX//5k/GMLKH/tBoHKvTsItrpteFjiEQJIg+Tq8TvG7qS7mrA3tde6N13Nf1lkIiPPgX4204Uu4LTfM3xTgaKHvyDEptZvjdsEPzZydE/CRg3x9Yot+YbuqnbgvmVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4744005)(5660300002)(2906002)(66476007)(26005)(69590400011)(4326008)(6666004)(66946007)(186003)(6486002)(6512007)(2616005)(86362001)(36756003)(52116002)(8676002)(6506007)(498600001)(7416002)(9686003)(16526019)(8936002)(66556008)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Fo1ZOjo9i06GzTxN2V7PTfdZ0+y+yrx0UZn+zEHir45JPH6t+Qs3FqyKAUmt?=
 =?us-ascii?Q?83xz+iHtN4P3A5+VKO8K2+XQk5mMooGZsqP6f0mW9FH7vTSC5lgeFCVIaZy+?=
 =?us-ascii?Q?seutgAUs9p75Y7tqwLFVPkQaNHC11Wr5U7+lZzkZ7xNaBO4RsNMuoIKtfl06?=
 =?us-ascii?Q?CHqc4of9HoS20Hg2WZEwxyxVqZOGeYfbO9kxq9aea+pOGfJ4oy7DiLv3Xiv0?=
 =?us-ascii?Q?gIIlguaUzzQKN12mCYT1YCDrJP8z0NAYisjgLusfMOj8cForjCUoBkSEJuNJ?=
 =?us-ascii?Q?NQ1xUK7NGDUMHNRUIacPQsLWex4dj8eMXSj5rQ+Py9GizxVfdQpE1DQ1IO/l?=
 =?us-ascii?Q?+xSodHmYX5j1tuH4H8YsY8JxomQgT1iQ/2sWetD8NYqsC9Mhush96rhknxnW?=
 =?us-ascii?Q?I2nw0mURFnZ26vejaDzV6Q+DJ8AEplo18mX/FZfFAXiJF+Puc2oSAfdd63Hh?=
 =?us-ascii?Q?35Cek2BUu7Fk5MVebXwSpMEbaJk3HHyWZvdIrX1ziy9KWu3CpRtMhPfLUwbB?=
 =?us-ascii?Q?WfYKLhY0kFgVT38ZrgvNItt/7AAMBtfZcLuqUyd5TIX5uzS0DezvrD8HVteU?=
 =?us-ascii?Q?F0CW8AJ9y4JsIpQsAYyNFnnfcwBeBaO9Lrz5u7071i5d04TLNZ73a9ZRJBY0?=
 =?us-ascii?Q?Y7yw8F3x8bJ54wYuVpsYWmh8yNNoFNnbZKETRRQ2v3uHhnOYaUsmRQmQrp6s?=
 =?us-ascii?Q?OIUnkErPbcwOVFpqDNt7OKIIaShFHOhjmim8FG257zDnREVdLDGKi/iNDOJA?=
 =?us-ascii?Q?UvD+MbSZeVByt0NLUFMUDWAqXt5ioORfB4ApyMp6fLAqFyuSa/8+FnODh+hX?=
 =?us-ascii?Q?fU560hKgRlDudClo9AaasFHSRREThYDh0T34mAx5auQ3ZKhZUcaHHILg0Zzh?=
 =?us-ascii?Q?3lJuGfjfLh5DjESNegjG0T7BAuNv3S6Fk7dA7zWfsnFWsPxsCu7mfez0vGu8?=
 =?us-ascii?Q?oNwfy/AeZFyiSkajRt3bQcVh1Wy8tXP4aYz6UoxlHKmudKUpKkMLH3eA/lgw?=
 =?us-ascii?Q?1ezW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21214fa6-f2d0-4df2-7b65-08d8bc4e3e9d
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 07:45:52.0072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9CFu3Zl1WDEmS3kZlh7ja0Qb1obo0JiDTuh/oLTLgZejqf6G6a5+fr1KTneqM9t0v43gJent5kGNWOBDO8Klg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4492
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Introduce is_iomem to indicate this piece memory is iomem or not.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 include/linux/remoteproc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index f28ee75d1005..a5f6d2d9cde2 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -315,6 +315,7 @@ struct rproc;
 /**
  * struct rproc_mem_entry - memory entry descriptor
  * @va:	virtual address
+ * @is_iomem: io memory
  * @dma: dma address
  * @len: length, in bytes
  * @da: device address
@@ -329,6 +330,7 @@ struct rproc;
  */
 struct rproc_mem_entry {
 	void *va;
+	bool is_iomem;
 	dma_addr_t dma;
 	size_t len;
 	u32 da;
-- 
2.28.0

