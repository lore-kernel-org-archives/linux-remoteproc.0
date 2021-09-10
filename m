Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC1AC433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Sep 2021 09:07:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 752276101A
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Sep 2021 09:07:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbhIJJIn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 10 Sep 2021 05:08:43 -0400
Received: from mail-eopbgr50055.outbound.protection.outlook.com ([40.107.5.55]:63811
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231965AbhIJJIm (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 10 Sep 2021 05:08:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ta8+cekach8yVMjY6KI75bBnSWPGpkpVdHbZvqZjmuixrLB9RTKA2Vs9uh1/RTftQGOWrrC70/6TwsXq/bBXXImpiDaKkwQ2YIU5Tg55F1A1e0AcWynBzf8/Mk+ynNhEro5+3alBAnm3+L8lfpPzc8p6dXrkn/CW1tJiw89+heZNraLTheD+l9RR8tXAI9Wqnes2ocy4hrXaV1I647G+BiZlHmOYfZRRHOMMnVaUFDm7CKTiF6Lbtx6COyzJ71faKbOXWk188AYj873w7xkINnD/19qxfIuYYJSxjZi/C8siQan4RKy9HmACh0f4dJBoWPDAVZas3exa/AzOs91L2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=QDhteh/7rEL9ai3+QO2/IVVoUPCsC5kBHl60+oO4Pgw=;
 b=nEfNgPyNLLu6V+vDgS6C76pFAlgwMgvmhoPpBNrqWZ1eAhzGqKW9v8TXwmT4rnh2b1uCSFqwFgY0iVPFtsryR5pQ5Hd1qmE0sVSBtb7+bzwtItIuCXrf9GYlP409LMMDRPApYil8PBDNszBzIpme//P7f3mHepOOE/gtaJSSYgsVSp19rG95Ysfdh6cIJyJmxTp38IGfOV4j2+wzJ2XsNrszVNAekuh5oWzJ4XF3qjzibeThnz/ZCzCw54ssucnmydQErmZw5IVta47o6izex17NET3j5FSRcZcoReDKiar5X/sqoIUCBb5gLhA/Ro8Tz9m9/z+0FItqN/vv2Ju/VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDhteh/7rEL9ai3+QO2/IVVoUPCsC5kBHl60+oO4Pgw=;
 b=c7RCDiNTdSm8aYsAPJUB8t4Uc/YFOl5lVef/f6uVyBRcJ2LsSc69Rj0XA0PHabxCsn3A9u/U+oZbpqaSk9lYn0IDXIduf02ZFH3KcUShFgHGBa9pFhenU9AAXMzDAnMhp+JImt6ahUN7aHYRMrmsU5N28VMVCFizdryEMzHKtyk=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4763.eurprd04.prod.outlook.com (2603:10a6:10:1c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 09:07:30 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53%4]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 09:07:30 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        aisheng.dong@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V4 2/6] remoteproc: fix the wrong default value of is_iomem
Date:   Fri, 10 Sep 2021 17:06:17 +0800
Message-Id: <20210910090621.3073540-3-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910090621.3073540-1-peng.fan@oss.nxp.com>
References: <20210910090621.3073540-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::24)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG3P274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 09:07:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9b8fc3b-8f0e-4610-1092-08d9743a6aff
X-MS-TrafficTypeDiagnostic: DB7PR04MB4763:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4763DF272F1CE80436C92A0EC9D69@DB7PR04MB4763.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /2CQL1YBp0Za+9ObUyVaszR6UH4LbKAcRjKnSt1dkZnGbJ+hC537PRBUlM8vWb7l7ztmue9LMBSHiVGWoSBqdNZtXakad4ycbNYm7/Ar9sWKpR6BvtC0orfDoAK2cBRzMjLbauSNsjVbcjNl575yqyJpj22aDb3E2yEkCkhxEuW2cEwLeq1EGmvKQcoOWdyZaOFODy7abegAcpO5lvfJoYOaWJSOUdWXeZIEab4iLCn7lj/isGtRtRtPiW2yYKmFAUFMjLm5K1ZHrp1OnjWAZnXaUBxSTju4USEUL0Knyn3y+7IOxnMxpBoae5el6VYyBB8L4KdJPahwZ4liy2DQysRzrbH+gSrpzrpvyDjZ34mXxB409Ee+GeAm2e9740xHLdzmletK9Jg6oIQYEvaFNSpIGoMQs27QnXP2xtGAQbeXq60VczBjCaYkdblZ/ACzhtsBm69CPLFFjO4NNtxqcU1TZslgf1BEshYXaKQybhOWrRDGLF9xBJSQ51Js/A5r+nR+5qJrXyYL5ReIjI4RE6l4mUIAUmRmuegkcp+sNoVryjGyoamrGEUXl3VSiU9my5RTCwsZGrAIAvWwdFUDvpMJJ8qB40dTyNdpwacU6SRxSlRYlXENfs2Qxy2CAbxDrjR8dRqtdY71+bSRtKcr4i7V/nqWcKotpwVKNdXY7JPEVMfQhFaupaS3xDGe7XJeCOVnGX1K3YZPc0TpTZrL1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(136003)(376002)(396003)(6512007)(8936002)(66946007)(66556008)(66476007)(83380400001)(7416002)(6506007)(1076003)(6666004)(38350700002)(38100700002)(6486002)(8676002)(316002)(186003)(52116002)(86362001)(26005)(478600001)(2906002)(2616005)(5660300002)(956004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Z8+F+nAv7Mo+3f4jdy4vgltTbtG1vudidJmbjU5MKkvcM3cuUS1hLth/FFs?=
 =?us-ascii?Q?Phv2oVy3hUFZFl4tILKKrdMVBR1eU75TzPchAF+BvEqh44CXf3cFKafRN0G8?=
 =?us-ascii?Q?wBUmZ7r5LfRSX0muNe6WKZ2UyQ51Rt4zSpZa6bY8JXSKKLYfrSKsCyQ7+ku5?=
 =?us-ascii?Q?VGlwLMgX7LFIYSNRRl94zrLuOABd3sdE/PogzCx27e/6/iBJRw/qss6f/sNK?=
 =?us-ascii?Q?igKuFgbhnEqvy8CkXY76UuhumnZQFQ5NA7MCONZLdtjWyl7inwLA4IBCcXWU?=
 =?us-ascii?Q?5MspNtgSuudJoOJXBwjUs/rZrgH5gPENighx0btxbIXLxiyb8sbCVo13IVRy?=
 =?us-ascii?Q?Inj1Y6q+V377dgxs9RS7RmNoPoWraw1kHZ61HxZSDhDI73SzUlQEJyxdpmaj?=
 =?us-ascii?Q?PYsuHhLebCOa3fBc/wGaJr0Ez8+SMTC3An1eYZo9gdLJFhlxRirtXImyYuDR?=
 =?us-ascii?Q?g1sH5KUpENP00vgBrHk4th7AOjxElp0ZlnmQCeIcIau36uYOKVYpKduncrTf?=
 =?us-ascii?Q?jCykQ6ILNq9ToQ7N1t4aMQbSg2QFHgjH6kpgWKK0Y4RumO641c8ye630fVJS?=
 =?us-ascii?Q?KOW7HV2pqiJm2Z4/VwHJYH94Wp9bU+m+mIT3X+N9CBOpVyUeYG9spczK1Jmw?=
 =?us-ascii?Q?8a2+qqzGdx+9VSleOjXGm43pzsRgpTgxKhMjRfEHASZLmE2NIDEMZ+mvIoAX?=
 =?us-ascii?Q?J4xcWDnaAdXAGX24uXNdRGmLl47elPGgjtGM1t/SSQVvg0LSJ+uvI6MjBULR?=
 =?us-ascii?Q?JE290jJWwWRHKqsP3dk746oUEl1uc7k64lh9qx62a3yCOf82LyyZDsIipPSO?=
 =?us-ascii?Q?k/TMtT8HDepGk88zKmuIkjMiwzle7LZzzVZpz+fpur9ASLsIUEWAJEfQVMJz?=
 =?us-ascii?Q?rd8lOZVf+B1KTKWksenYJrPG3NZDPBmnitr4AJ9pH1/q1VBMonpbIep1C1nS?=
 =?us-ascii?Q?BgLtmf9U/q174MORHkcsFOFld46iG7Nfm7dDc88UyMPkGpBiHrdRuTwArSlm?=
 =?us-ascii?Q?rkzd+9U/U41M409OyAioGZg9lppiY5SWptykeOrLPe1/ULn9MlMQFTpH+g+g?=
 =?us-ascii?Q?XDBE3QjgFcNvUsOnHVi+P4+AJSDK9K7m/XmCbX5tskGpMdq0XuAgTdjseEfW?=
 =?us-ascii?Q?l+O6gDAiV4tkyrK9bziQwIHL8PE+C3TG+2ZR5q3VCPQ8bGGxWVroQlw8VaGb?=
 =?us-ascii?Q?BD9ypMT9WLjSCHrSqWgaPlNUtmbyaVQnOebPt3C9+9a0qtfARblNb1SDvYsE?=
 =?us-ascii?Q?ELkrU3dbUPs5XG4Nf+0z235GKukteX5RDcDUwsVTbs0rznAkbjmQ/pMsFSkc?=
 =?us-ascii?Q?lsR+575VIzBwi6eCTJ4VtA5v?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b8fc3b-8f0e-4610-1092-08d9743a6aff
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 09:07:30.3580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 03GioMW5hwtLe3ePGat768kaIbPERqr4Vvngr8D7TfSu4j9KB/LnL3atApk0VqVkgFyKAC37/WYxvtShKpX0rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4763
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Dong Aisheng <aisheng.dong@nxp.com>

Currently the is_iomem is a random value in the stack which may
be default to true even on those platforms that not use iomem to
store firmware.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Fixes: 40df0a91b2a5 ("remoteproc: add is_iomem to da_to_va")
Reviewed-and-tested-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_coredump.c   | 2 +-
 drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/remoteproc_coredump.c
index aee657cc08c6a..c892f433a323e 100644
--- a/drivers/remoteproc/remoteproc_coredump.c
+++ b/drivers/remoteproc/remoteproc_coredump.c
@@ -152,8 +152,8 @@ static void rproc_copy_segment(struct rproc *rproc, void *dest,
 			       struct rproc_dump_segment *segment,
 			       size_t offset, size_t size)
 {
+	bool is_iomem = false;
 	void *ptr;
-	bool is_iomem;
 
 	if (segment->dump) {
 		segment->dump(rproc, segment, dest, offset, size);
diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index 44e7f9308f4bc..d635d19a5aa8a 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -178,8 +178,8 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		u64 filesz = elf_phdr_get_p_filesz(class, phdr);
 		u64 offset = elf_phdr_get_p_offset(class, phdr);
 		u32 type = elf_phdr_get_p_type(class, phdr);
+		bool is_iomem = false;
 		void *ptr;
-		bool is_iomem;
 
 		if (type != PT_LOAD)
 			continue;
-- 
2.25.1

