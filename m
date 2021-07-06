Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31B6C07E9C
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Jul 2021 14:43:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEC8B613BD
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Jul 2021 14:43:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbhGFOpj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Jul 2021 10:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232763AbhGFOpf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Jul 2021 10:45:35 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0626.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::626])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C68AC0613AF
        for <linux-remoteproc@vger.kernel.org>; Tue,  6 Jul 2021 07:32:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khI5si7RaZIuMwlf6vCKwKQeg18yaBSlhKo6HEY4Sn6w7nsLdjtN3+/qIwmnCZjQlXjesf+fJefe7gGL2pR0Rzr8tzMEIarNXNscx83T3jCfrMzr/rj+Bpij8+2kWyMyHrEq3GvjloJotOImZXOu7Tp0JQ83sdbsLIOgZSDd8riySxSSYlG9AMKq3A96rupCzqIxJtLOM59f5LBf/8CRFE6pZ+WZLj8nZkRbTsaMPyvfge2I0Ft/EtTStXVLy9MtSwmAZgODflq6deKNx8Ymj0rViQzOTG2Mhqu59aU3amNcNq1K5hc352skMZLi6FqBXuD4igiDvoghquhTa7otdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zF3XaEbnRR9Z5TL4dxjsr2JPlr20KSG1T6nnd6CDgnI=;
 b=ZYv1xl5XYiw/ttb03hCFLj9JUTQPEt4PujCLQ2NT7a2fUgYSe3nZCF7jqCfUPtn4EhIg4FOXu1YoZIaH7J8hjZUJH5zmcjnncu+i3nuajbfNbcVN6PJkR/USnQt0JjCGGLaGonyIOdoW3bRFSxpVUrFd39Lka3vusB0R9jY0Ynl+0ANfEMCdN2URvpUMk5W+wW+5NZXU7ttMjAMu4fpR3MvTeK/fwSxpjq8IwyOFXGldLVVB2AsyQwUno9hUENp/0HMSbl5mWgbnWRnsLKew8RYODJFJN+9zEo4ZgD7Q1H/ZrBy5bBu8LdwJ0zK5U9QAheUJiDF/2sN+oUh5Frv5Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zF3XaEbnRR9Z5TL4dxjsr2JPlr20KSG1T6nnd6CDgnI=;
 b=Wqid3L2KJTX2rtcmrCGG8KI9sBAmkn3e2UG/10Zk2dWhcUtV3YhcVzJv7ahoU9JMj8A8oM9AViPv6zr8NJg7U/+U9opcQh0o8NJ69lSeOrv4s1qnvxJNBSNDGmPEvbCZrrF0oOnP8StDxQQ+PzjT9M09Ib8+wXAYuGbisp+F5o0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8600.eurprd04.prod.outlook.com (2603:10a6:10:2db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Tue, 6 Jul
 2021 14:22:49 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 14:22:49 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-remoteproc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, ohad@wizery.com,
        dongas86@gmail.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, cleger@kalray.eu,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 1/2] remoteproc: fix an typo in fw_elf_get_class code comments
Date:   Tue,  6 Jul 2021 22:21:55 +0800
Message-Id: <20210706142156.952794-1-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0107.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::33) To DB9PR04MB8477.eurprd04.prod.outlook.com
 (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0107.apcprd01.prod.exchangelabs.com (2603:1096:3:15::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 14:22:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0733575a-d9a3-4f05-f620-08d940898888
X-MS-TrafficTypeDiagnostic: DU2PR04MB8600:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB8600226C149E042E9857AD85801B9@DU2PR04MB8600.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D90lwXcmG2qPMF9Fz/eyfft53IPayIGuF1pxwWbIT0Uv3HWN8Q70vP2I85E+WOwS1gIHs2s0ITJsp2CinuU9UfHcrckpDp4GZF6zioHev04s/NE9Wq78E9gfTFMDQpqri9umc8kXCNz+gg6Ob0b4Q6eCsGmhXc9dG++eLoC/FAGxzjTYwTeUsAjUgwwimvEd4oycPEX8Czj9SaA7hzRSSJ9ukToctKYi8Z6F4ncxj/0tfjdCExwc+g3F3dal8TxXEt6G1hpDjUi9i0ORvtXgPjz0Ok17KhrOcyTmqfPJD+i1cinPFPismTCK91XAXXlFlrF2vb0LLBgWplp7ZboDdAFG1shO6W8uo+D2OX7R8ZnMiyWCcq6edOwP/G8codZUL7QJQPZSO/MCjwvxcISvNNf6tsjDXR9j5tDcS8RXrbqFj0K70ggsJXu18jdJh8Z1QfLlxCKI+7h0X1N5t5cOZZwUU4Kig1C70XYPTHr8el61YVl6OcBdyKGHcLMdpqrBP1KkfH7/Qe8J5InSrPZBcONiOk745o7Nh+vvmaXCbhKMz3mWkIcE3p4ZqpXy3P6xNUpOWRWaabGhop2MqLq590DY62Ff6vPiAZhPbE2hnIQzHwYzfbxoPXQ3UAKHtFU4vzXoMdqVM2F4azSb6V/1+/Cah7xlbRhQnKsL/btyDYdBh3iPoGKjKkP3M6LQAckoiZ6hGW8vfHwb7hNcvGj6wA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39850400004)(136003)(346002)(376002)(478600001)(6512007)(8936002)(5660300002)(4744005)(186003)(316002)(36756003)(1076003)(956004)(38350700002)(66556008)(26005)(8676002)(66946007)(66476007)(2616005)(52116002)(6916009)(6486002)(83380400001)(38100700002)(86362001)(2906002)(6506007)(6666004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?73BbC9ZRUyLor91PhQIja6yMLMvDgP74dq6+cI/ZIh6h2wIvYiDNVhCxqoZ5?=
 =?us-ascii?Q?idmKJ4QB9cLth3n5RrbD6lwrvzGhpr2bCTe/zhCbHRW8XOcQFIlXmvtFhYB0?=
 =?us-ascii?Q?dDqz520thaMdhe/luHKJKlNm30hzktDgIHdO9Ykp2Pj67S3iTOpxldBUTPOS?=
 =?us-ascii?Q?jpX7gpaYz1yP/uj3JbfmObl2esCaX+WkE38DTUnB0nVbYQ1B3NHNsWQtg+/J?=
 =?us-ascii?Q?K14dMI0VWIUpaXfCNZsavXPW2+NueFlfC/k0WFdAhgd+04iDgNtRz2jy991y?=
 =?us-ascii?Q?v+GLiytEamNBcAHEOqPg2oSlKWUThZT7rv2w6bARFBOS/3EdT0QfWvbzXLH3?=
 =?us-ascii?Q?ZQcDJjNuqK/NMIiLpKJM1czcbC+l1LKSfevCcZeJgpiPBZXak3KLN3GczdSQ?=
 =?us-ascii?Q?aXgpMC5FK/0u+RdWICwA3l15HOrzCh6oxZg7ZPcAGiO9j3CnTcktMjCWFLOu?=
 =?us-ascii?Q?F81Os6xE6SrnZYnvkZL0wKjBdHflredWTz9lpZrs5gnJZUDt95Og+6R3ozAE?=
 =?us-ascii?Q?pmhhxl5Ld1qm+peIt9NI9xfxl8yTHuCHYtxXJTlzYRgHeljy0bUPpXS3VkYf?=
 =?us-ascii?Q?PpAZX9JNz+JwCXZ5bHovGNFfYqlmTXn29UUg5+648+JNzT8euWsWv7NP2Vv3?=
 =?us-ascii?Q?nb9zoO4+rLZV6LZg+mxClZ5LCEgYZIC4HEknUHRFFpS0lnyr04slyWP0XEsK?=
 =?us-ascii?Q?HB1uxJ4fWidVgD26bi8lSlaqecTnoBjl2Gd+7NenKDJZeB1Sj49X3UTxlkS5?=
 =?us-ascii?Q?bANmPz97XDbKy8glX9IeLdFomEfH7D5wZfrIMVZIXbt5UqM2mUPgiJR5/93p?=
 =?us-ascii?Q?NHK8dHs524zSMxTTcj1T7lnacT6RyDmdhcX/iiVtbmhneSvK1upEm+pFKPJq?=
 =?us-ascii?Q?SJLlBrBcY1MItGaRBXFBIh5Lq4zwEnfeLuRbLrfa5moxHBuuWM5CKLBZ2BbC?=
 =?us-ascii?Q?sLw92BjMTqDk6NPik9mRjhzyvIRygsvZHwD5evTq+gzSyQc6WpWlw4e9hdq3?=
 =?us-ascii?Q?YVo05hNkVXtdLmjvBprQw/Mw1BxCjMYZW+FJ/emcGtElwny7n9cg7J4Klk6F?=
 =?us-ascii?Q?3aKcw1r6ZYR+bCPSlIkLHRfmT+2bjuRO2M1OGrbrDUtkL6UBM7nXWltcNifA?=
 =?us-ascii?Q?xq/bC2oB/MSU0KiAPd3hQU5DZVljGaLNNHvz1n9wrtCUbvapNYORKAm/oHuU?=
 =?us-ascii?Q?loJX1xTaCVW8tczMOuIZ5rucfnTCZl6XpvR+pzwyAiUtVJfg01xPsWrLrn3J?=
 =?us-ascii?Q?FiTu0b6vaGRwabiojk1B4lkYLht7wzlDpzJbRSoDRWE2WVZuL89Cb+aZFuwA?=
 =?us-ascii?Q?Euz3T8BQivOEjIw6ANanZEtb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0733575a-d9a3-4f05-f620-08d940898888
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 14:22:49.8435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +7avv146x7JFz3zjx5x6wm9jdltiU7e/f96GO8aKvtMgPEGgSbXRdJJR+rS8SazpURiEIhyyZzniKZRlSy5GYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8600
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Drop 'and' which looks like unnecessary.

Fixes: 73516a33588c ("remoteproc: Add elf helpers to access elf64 and elf32 fields")
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/remoteproc/remoteproc_elf_helpers.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_elf_helpers.h b/drivers/remoteproc/remoteproc_elf_helpers.h
index 26404e68e17a..e6de53a5000c 100644
--- a/drivers/remoteproc/remoteproc_elf_helpers.h
+++ b/drivers/remoteproc/remoteproc_elf_helpers.h
@@ -15,7 +15,7 @@
  * fw_elf_get_class - Get elf class
  * @fw: the ELF firmware image
  *
- * Note that we use and elf32_hdr to access the class since the start of the
+ * Note that we use elf32_hdr to access the class since the start of the
  * struct is the same for both elf class
  *
  * Return: elf class of the firmware
-- 
2.25.1

