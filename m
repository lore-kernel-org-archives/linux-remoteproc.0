Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC70C4338F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 03:33:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09CA460F22
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 03:33:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231500AbhHEDdO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 4 Aug 2021 23:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235289AbhHEDdO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Aug 2021 23:33:14 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on0612.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::612])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED9BC0613C1
        for <linux-remoteproc@vger.kernel.org>; Wed,  4 Aug 2021 20:33:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIFxhwbyDPXDu2+v39taAIa8vw6wFcsyOp3gPlNDwd9e8qSOV8DhapKUWlYY6D7HKfTkhkHNarDLIr0uulW1c8NeRoIJu/dt4Zgwo19gaaIhRvDHzUyA7jD3G1Juzgp63ZofLe7BK9V2N7j+x8W8uqBQ4A61H4A7DebWkBYbM3oFnuZHaFExR2y87vc5DMAwoEIh4KhdRcPMWg04DyYTSIwrYWrSTI46DYZMhrTTpxGy7B/0cWlZG5XKKBVw12BJJSffOH1Q48m58JfH6Nuj8k9JIqK7Tj3QBmfstlvXPgOXVkMd71Scs+ilUBh4uWRyiDYEQkdOMZ9uR0gMty6KGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXFJxVIoVk11oX9ieK4a8eXnmL+i5PORCezGKhyEA5s=;
 b=M28xKwsqLdD+8Z+zSb+I9eaL7VaCku02ih7UDArZg4kb+2mnewdBpQ8ldw4/ePW3N328hQF89suMR0xg04RZ/SojvuXaeUhVpN3nYA1Ntw8fg0KWHZ08XBcAWgZEGNn8SKg58hHzFU1AVn4Q0bCNwoPRD7zpjImT04C/Lybe/o4ekssJlRxzsHHWK4gCD70AM2FNiSKKqTHeO7fcPeLIHLuby7tcsEjtORdYU/PYM09dT3X/kDfbLSjKtpA6kVwpjoeR1nWThnqABR1S0O72mUgK/piBVDGQc17kD/N7CstcPQmWtB4j4NKodiW+XM4uGngt+9dGzCo8Gp2ikKDQow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXFJxVIoVk11oX9ieK4a8eXnmL+i5PORCezGKhyEA5s=;
 b=cUKbZxeQJcpwjfU+dgVyvi2XAAldIWydJ7HFCQaYPiBAjtieHkJAQXiEsDz0qEfjj/cXLbHB+h2R0/RIHacjvK8vTSaCIg6agexlCdN03ljci1YWivTHliFvb7DW/WdCOalxX93HjpqT3XMuplI7ZEDMSEIxwJcjT+KIqkzOrQE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DB9PR04MB8448.eurprd04.prod.outlook.com (2603:10a6:10:2bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 03:32:57 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4394.016; Thu, 5 Aug 2021
 03:32:57 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-remoteproc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, ohad@wizery.com,
        dongas86@gmail.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, cleger@kalray.eu, peng.fan@nxp.com,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH v3 1/5] remoteproc: fix the wrong default value of is_iomem
Date:   Thu,  5 Aug 2021 11:32:02 +0800
Message-Id: <20210805033206.1295269-1-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0085.apcprd06.prod.outlook.com
 (2603:1096:3:14::11) To DB9PR04MB8477.eurprd04.prod.outlook.com
 (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0085.apcprd06.prod.outlook.com (2603:1096:3:14::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 03:32:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02693285-a96b-4ffe-1fcd-08d957c1b7ef
X-MS-TrafficTypeDiagnostic: DB9PR04MB8448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB8448CFE45D2F3D77AE59D41780F29@DB9PR04MB8448.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AdWH6WZvliQGqjd5uGNkFkA2X1oAhejh2fITEoY/jwFxeXn5KsSimF65O2Pv5qdMNbQX6S8L04yUhB5pGv5/Jgv+ucCIuaiyFVN/ulyDuy0JNliQvhU9otfCgGnMObHXrxaqNH7bLpdJGeC7L9U7uNSbD7D4SHfXdFJXLtn5CPTYfL2xuiTM2PKnJ6W1bwxOfkMpA2seOyUo7xl9/tSeVe48W3OSOFZNob7Fknbq4TBHifojcMr1/wyUtNYtk+xGAv1T05Y6Px8f4GE7XNi98NjObiVOXSeCVmYF0n7Wb5wk8kXclrqDQjU6F/yWCgErDZRqGnPYwo/2Oyr9FVcFFCDcXbEAD3zPufvmwI7duZwM1rsc5wG50Lpi3GHrIh0wtXTmdU7meHm29kgSFbDeerbVtYYaeANRbLYCqQ0u9dywoGRY7NfWjyF3kdh2DJAWGhAT9/YWwJ1WMUiR29Htu8XMpAFqNfeLglq4mY3oHwGjZP/wIgVwSqBJkQDVM3lp+BN2R/EdB3RNqhsEiOfDxVuOR9z3Fr3UMCF5MX9AFCvN62xgN0xhdwBdH0GSvP/1p+HMNl0mtqOUyj/pdQwiRsstkU0GiAu6j3aMMxqovTvwchOJl/CZ1wDdpnbM7PiwaJqlGfaEdn71BY/cWHdS6Q/gTNT40NzQH1VQ/coZx7KLxsStbjravPG4peo2JbyCMH+2gPb/MFOirBV2+0rh+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(6916009)(6486002)(66946007)(8676002)(1076003)(6512007)(38350700002)(38100700002)(66476007)(66556008)(8936002)(2906002)(6506007)(186003)(2616005)(36756003)(86362001)(52116002)(478600001)(956004)(316002)(83380400001)(4326008)(5660300002)(6666004)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uXl3OS8SEz24MTjBuMlWgYg46N1Y3vvITP3z6hWLRwdowezAb2LNWXiym3oX?=
 =?us-ascii?Q?gzDe/09R2YPeGH8gDgYnS4BadF9rFd1F88yMeC3taCezycyUVBozt/rpC8HW?=
 =?us-ascii?Q?SncFsHQIdtDix4wGuEaij6/MSf2ntOgw2eRIGbtL+zebWC+1+/1p0dHgJqcd?=
 =?us-ascii?Q?WWYsUPpcQler4zGHODdpK7gCKCj6WIRNbBJNIjrRLx356+AqptdYJcwO6KWs?=
 =?us-ascii?Q?EHWjLOTrqSyTiTfzkyUjm7UTejuCskwHpipEmYc4fkMjcxhlaUhLDuG5cmv7?=
 =?us-ascii?Q?x1zM0UG2SUoZDFBnlNCvguvE6kv+1YhSTM/g0u/9Wk8ibzOjmEscMStI+l4l?=
 =?us-ascii?Q?dbL5au/wzAixJjJXcq6XitvrZXx54xGrsqKpQOzgdTrwHxw5PP3NMI8ll39q?=
 =?us-ascii?Q?tEBYuN1LoPFFPK9Iva/FQ6GSyz7arBmh1LKh7pwk5FbgthBr88vmFedtpMQs?=
 =?us-ascii?Q?HnmqO8lhlCcsgKFch3IJMCIpVgtr3Ker7VjoimgY5cua+J0RI2MC9ZSyl6E5?=
 =?us-ascii?Q?M549klc5/qcriMntemLTtx2fn3zbWjfjL42HeJSByax1oZxu8zSZRaGWlIci?=
 =?us-ascii?Q?ya0iBVldC9Wu3nidjU9bpiYVoP4steHt2wlZwOcJLgrIBhYHS68v426fMQaW?=
 =?us-ascii?Q?6yBMw8mgRG1wSThOQRkaeJeCjkM7R3CrK3ybmGdhXE7s2dMb0/Gu5hEtYMYR?=
 =?us-ascii?Q?l2y6j0t0ppnOSldhOPLLUV9YIhX4icIIc3lQ1DjuqweXIocqlbGuZh0Hj6Rz?=
 =?us-ascii?Q?4HAQ6H7wipqLTB1gg0aftQy3iFoydeA0OWR2AgktEU6GoFtzhthvIk9lFCyg?=
 =?us-ascii?Q?w2aL97V4rfD209Z7LU1iT9nWgJawICPWyXN5MsK5wmYZSvv+S0fCA4JxX/9t?=
 =?us-ascii?Q?dN5X/PdtodAC55g6cd9rK938ofaH53E91ICg3L0BvzX57FjVGu+DoLJ3Rtyb?=
 =?us-ascii?Q?i2+dVXsntPg/gw2FjDwyxm/Qvsd1mxq/lLmVWhOYq916AikaTrslZd35CCTe?=
 =?us-ascii?Q?YdbjSjJeq9cFsdB/CuEoLx+NuvqiTWQNjuoToE6GdmZzKJE9Nh4JgZ2azWBZ?=
 =?us-ascii?Q?clSF+2QrS8a+OdCJz/Z7Ka/rZwnAEqYf6LHHZFDoz3554sGblBlHr+2Opc+X?=
 =?us-ascii?Q?Q8uHn+wurLM91gPndYlYyoifHUlcH7t/oceu+6hQKZuzRLXrXMQBgSK5r4yw?=
 =?us-ascii?Q?MrdVfl9ZPBC+9E3ZDwVFoLB3iI7MVKImM1DFfF4ryJBkQ/nP7SfUtjyDh4AK?=
 =?us-ascii?Q?x7IyWjqyzWC6LO/4/t3ETRbx3pqj1/nQ+245LxyEonka8sd2R2sn+SGV0OcS?=
 =?us-ascii?Q?a8fP2uu9igfzYFyHWWX9gFwk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02693285-a96b-4ffe-1fcd-08d957c1b7ef
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 03:32:57.8191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JPdzVDGydNCh54D1U+IJbgPz2xXB4RHdsWP5uLsHAEBbXxvT9pmjnVz1yWNoOq3pNhwK58Eo7CvFlDrg2oyisA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8448
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Currently the is_iomem is a random value in the stack which may
be default to true even on those platforms that not use iomem to
store firmware.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Fixes: 40df0a91b2a5 ("remoteproc: add is_iomem to da_to_va")
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
v2->v3:
 * no changes
v1->v2:
 * update rproc_copy_segment as well
---
 drivers/remoteproc/remoteproc_coredump.c   | 2 +-
 drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/remoteproc_coredump.c
index aee657cc08c6..c892f433a323 100644
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
index e8078efb3dec..3cd1798f17a3 100644
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

