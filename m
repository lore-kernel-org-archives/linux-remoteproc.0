Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6979C433E6
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Dec 2020 09:57:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A25E22CE3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Dec 2020 09:57:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbgLUJ5k (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Dec 2020 04:57:40 -0500
Received: from mail-vi1eur05on2078.outbound.protection.outlook.com ([40.107.21.78]:55873
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726187AbgLUJ5j (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Dec 2020 04:57:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Twzqf6DyZ/D1UyvH2cX9E0VSRnGuzd+fOzR2YxYXBptgDvTxiiOSFCIYpkxFDMyuvO+/iEs6rQcLos9jONWpVdHvBMCAyE8V7vIKXVxhqe/1FKRYStGTixY8XIVTHIehhcs19n5WHtvJsoqtuAeZ1bY6/5iXRXA+iiDx/77RsaXN7OHPFmPlJnmU3ZI/J5tCBs3oQ7IJ21f1XGuDk7RhbldIgZ96fpMccxUMYeTRZ8QAPczkzXzQ5m2Cslxhl+fP+EJnGm3Vf7kau7lfSs/3t/YRsx4YmPbvCQSX6b0ugSc0Voj70PXCKvjZXxIuLF5FDFTWdAvM3rb9QxpHf0xSWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cd0i7N9PBSSbRfqnT60wRNuEFfxb/oykZGmixpw3i6k=;
 b=Jn0hj63/zo2bS++bSs8/T+8NK39WE96BnK88NhnBKJWJfd5yGSOaWhvV9aEbGgKGjsOEEOuypPXlsdjTWn1c0Eh3QW2n+eNdgfpIJ1hUlBlUVShYo7D9oB/ZPWOjin6Ti4mNfYqXt7wG7yOqlw25MMBLUiz/b0/0TF0IvcaAdjP2JN83gMzwFvNNQiedYHYL0GyAuvUzNotBdGIMk0nAUnJ/nuG+gJ+J4qxecsTT7fEsDoT8dZujVwRS3EKvAb096LpeYR7V+ogsxoZSUzxjeV4rAaUsqGthF/gj6hnsW4rhgb7A0WAVkdlqZGTkPEt8X1A7UXoDNDe04BNehN5/og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cd0i7N9PBSSbRfqnT60wRNuEFfxb/oykZGmixpw3i6k=;
 b=J7wO9M23OqzkXMsAfkLAC6pn8+gWSBumqAYmDhN+qcvJfFXKXiS3ysd0fE54vpR2DSFLlkghPNC4ARLi8bPdsZvEW1NfgFE8/T7Q5q9mgOHBzN1nYu1jQ8+PxmkWsVkkwVOHfN+ajouqXUj0I37CB2S+4pJWKNJb1DLwv+8ywhQ=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Mon, 21 Dec
 2020 09:38:17 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3676.033; Mon, 21 Dec 2020
 09:38:17 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 1/8] remoteproc: introduce is_iomem to rproc_mem_entry
Date:   Mon, 21 Dec 2020 18:06:25 +0800
Message-Id: <20201221100632.7197-2-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201221100632.7197-1-peng.fan@oss.nxp.com>
References: <20201221100632.7197-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR02CA0110.apcprd02.prod.outlook.com
 (2603:1096:4:92::26) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR02CA0110.apcprd02.prod.outlook.com (2603:1096:4:92::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend Transport; Mon, 21 Dec 2020 09:38:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9acb4218-8891-43f8-8b25-08d8a5942564
X-MS-TrafficTypeDiagnostic: DBBPR04MB7930:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB79301881A557922BEFB3A53DC9C00@DBBPR04MB7930.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TDDSrQsbJ6bpKrIq9MqfM76kZXZNtYI8DC2M8W/r0ToUVO+mygl6Z7SDXCXOkvHpsWkSiLMjyYnLNVtI+VNQi6+MG/2ICnTsCrOqJjUAtUGZLCqaJ6Ac3NKNAAPBUtFi1SMYrEZhKOotHtBtYCBO2zyZPPnE0w4VQxp8yK2JSr0iiXFjzuviT6duXCt0sqB0y7zetjxxOyQromW7hkIxDUedMMtpgOJK64AxNSHNRAkFRC9PbGX/UOK1CPzvaFU0dmNGfUYn20oN+17fcT4Yw2+dSozpCc14gP7l9YJ9m8uhtgxUkvxCBIAuAr3+BaDRG6WMVLKvLigCsXM+WipO6NUkJLdpvh8FrE8NmCvR6iDaI1N2fj0uYqcy4PAd2J0js4emgF6GcoBvzmxqCbxBhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(5660300002)(66946007)(478600001)(6486002)(66556008)(52116002)(66476007)(7416002)(8936002)(6506007)(4744005)(6512007)(6666004)(26005)(316002)(956004)(186003)(86362001)(1076003)(16526019)(2906002)(8676002)(4326008)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?z8H/96dRyM1+l5T7sZBYAkSLj4R0qDkaiDaT/lkWRizHnkKWDYVee7a2tAyG?=
 =?us-ascii?Q?XKNIyygiE2i/3CkiRbV0BRg2/BLUMDVJNRqzxsiWEcyg3W1eIhlEWpAfT4hq?=
 =?us-ascii?Q?vE9QzsRsFhqE16m2/tsSFmxFxc1+a4Nh7SDow1Lmf+thkYDK4daoVF9bR0mJ?=
 =?us-ascii?Q?ezYZVHyMUyst4tPt1A0fPEURkGzHo0b5zbPaQft7bol84sFi0/JV+ubK1tVo?=
 =?us-ascii?Q?feCy2u/T2ZCsXmvqn8MetfzNOsajHs5rcinsfdHFVLz/Gn9SAnOMi97tcet0?=
 =?us-ascii?Q?4YEh8srRlQHVETHypH60XHeWRONO+h7MSXyQAAoVHVLS74oLONau4+gp4Qkp?=
 =?us-ascii?Q?LCyqWmnNj5UuIcA0J0RWewHpggYcnDo6fpek4a4/b6Tot8ynTtKeiwFFZQOB?=
 =?us-ascii?Q?gbY1xoV7xYJ5XaRyRWlQiyE8WJ/bMnQoxZiMHPA3itW+9AiuQJ6OuR7UoqzE?=
 =?us-ascii?Q?LnRkwsWG7k5W1h2M6xrqgE/KJiD/4VfPHOp/OrduaX1HTiL+Ok42pcedSNWo?=
 =?us-ascii?Q?74b6/BMyPt2stUxcTd2oHpZro7/DewjUsHOc+hSjuNVEMzoYZR/KcmkHgaXi?=
 =?us-ascii?Q?SFKP2vGmcoezqN/ZHzrYX0yDrlqpUdy6sSMXtXmk7PpfyU1kX4hmEarM/5C8?=
 =?us-ascii?Q?Dm25MwOLEnz1ZGowzI1ct0mqUM5LLdrBp+WuqS/YuY8btYIaaWtFzAf8kval?=
 =?us-ascii?Q?J+83EzlfscYE8CLLrOYRN4fQqT8ycHub7aSbmPrTFekTvo55C5KY3gcuPC1I?=
 =?us-ascii?Q?pZIJ/UfTRms0l5FcE3ilW2fmDr5OEbfwS/6FL+mFtrRT+xPCUp/MiiKhE3gO?=
 =?us-ascii?Q?U+BWt4cIdwqVkC6F9glUOq7TuTx3FUHI4p4VLvST5XroOzhB2pbPcA+moFfK?=
 =?us-ascii?Q?qBjDAbcauu7Uu5cJxFZsdLkOXBNXCqpS4sCEW36ozwS7BPmn+z/56g7tL30K?=
 =?us-ascii?Q?dUfnPL5b2VTL64S8I5gT2TEcPLL39rnevbRw2ij6hkzfI3IjJgCyjTkDYkBZ?=
 =?us-ascii?Q?Lzhn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 09:38:17.3244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 9acb4218-8891-43f8-8b25-08d8a5942564
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FIAz/nfRdAOTkcpX2nNEznT64q2ZKoXSaixu2CHabCNMGYiYEUD6M9VEcgxy+To4QkztR4cSN3EPQRNlK3vx6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7930
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Introduce is_iomem to indicate this piece memory is iomem or not.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V4:
 New patch

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

