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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA748C07E96
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Jul 2021 14:43:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDB9D61453
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Jul 2021 14:43:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232307AbhGFOq0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Jul 2021 10:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232530AbhGFOqI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Jul 2021 10:46:08 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:7d00::600])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CA30C0613B2
        for <linux-remoteproc@vger.kernel.org>; Tue,  6 Jul 2021 07:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzyaKTqDptBNEG6obM4uD3d+TlFSV5wl9lYTe7Sho7kbu+yM2JaOe9Syu2m/m6PSUJTi0A4cAF0HZvty34Y1tqMJUuGSb4sitC0MstpsKCaAq6Aabp8EjZBqC676XqfDwPw+sfpAiJ3lJuj67vvTDwFB/19RXQRg8CRtbWcSz/QOrP4jAMxlsMS8AV3wdqFBL8x7absYtfOl9EX1mAawqrFwehymTv5QH8Q4s2vvF11/YVItBhTX0dtm8X5LVrzGcFsRhRT8qpKBRsArMdHYuMGZhLCtSRiGxd8OWfAbo1/1yFjSPjm9Bq7XU1gyiPnwtpvSylonf+1sX39GQ1654w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyhMnFvyJTyXGLRSOGsDEh8PMb9zjCEHbBZAf5i+Rng=;
 b=b/bUNLe1VVKwxMCpJUiIRmWPUd9uo7UeLtC0fa9vmcx8rAXUNQsYOQnmq+JGzMvGsXfBUt/2uTvjySkpQcPV5nQryWAlfne/AbtGrmbUcfd9xKXyiWrs7RF/B250lzT8nGRMK+4XKgxsVtBwcWdBHK70MbQo6jXGrbHlZF00Gy0MPQuuTKyCk4I5tWDCYtyYjR92uDYndzuVnDZhLxKhunTaNyOpoTlSLF9C91EaxCK6JQDFztdZtYCGw999XrtLxOWGXIV4I5y0Wzr094Gzevof3cnX8iUcusyqh/yvyZ3gkzjxOGviSEMMnXlGZcugpoYahmF3TN7YoLv24q1hCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyhMnFvyJTyXGLRSOGsDEh8PMb9zjCEHbBZAf5i+Rng=;
 b=VqUBy/vZZw/gR6XHjbU7GluqnmPGOByw7FvnSyeOjMG52gNssttSVmaaf/+qCW0HxJNoN0vXHGwBNxeBvpSNYDoO+jL4ISRCHmlQ4N9+AVifSik5n1iL/5fpGE/DEZD/Qbjeq+TLt317DsDa1+meEd9gNMn6cNU4FUr33EVJdoE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8853.eurprd04.prod.outlook.com (2603:10a6:10:2e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Tue, 6 Jul
 2021 14:24:46 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 14:24:46 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-remoteproc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, ohad@wizery.com,
        dongas86@gmail.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, Dong Aisheng <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 4/4] remoteproc: imx_rproc: fix rsc-table name
Date:   Tue,  6 Jul 2021 22:23:35 +0800
Message-Id: <20210706142335.952858-4-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706142335.952858-1-aisheng.dong@nxp.com>
References: <20210706142335.952858-1-aisheng.dong@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0145.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::25) To DB9PR04MB8477.eurprd04.prod.outlook.com
 (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0145.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend Transport; Tue, 6 Jul 2021 14:24:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d05f4948-174a-4113-f079-08d94089cdcd
X-MS-TrafficTypeDiagnostic: DU2PR04MB8853:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB88538F55D0FACD1671EA1E91801B9@DU2PR04MB8853.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pP/7mQKzIUorWyIEU3XcgfqYhsOnDjpyUN75U1cvESf/rw8ikJgHScKUdN2Esd4DR5Slwl+WDgc8WrEV9IiYbW8rnYJGE7N98/WIXPIxCCugXxMGMPp4IpPj9ToXwQx6I0opHzgXjFaHvFTPX+oYF5C3gy0tggr/7iLq0x3YFElYM8WXSyf6tG2Q/kviDZJz8oUmNFpPAMft6Gvc2rbGcuSESqGVIvLseZO9A+1shxyR7i/1bhi18g8m244Zfq2H0jw/bpHUYVUMwt9aFFif2N0+tDhT8vo9jGItflWaVlIN3vfRDQ09xWGXpvvtD9OXGd5HtHA8ZUpgmCrrEv211ld0efgFWrG4szLzkH/jvwAqsRga1Vo9FLjZzmftWKlSon0UoCGU/kXPCufKatpv911EUrEI4hcrUi8oHKa/2iabQBzt5V3hmh/Yz+pVgxmuXJhkTEu1CEE6PXumXgv8eFVyZ9q4crPrP6NTDgIyCuvaJrJ17q6oLi+IBb0Kv+UENmirZjFL8bVd82wjBoSLQq2+FD+W37+E/eAQ6NR/WQM6SHisgaF5qdQiUhLHTZOt1+r5a8e2lxXzjQhpode+m0Ex9l4L50T7dndVwgL1cUxcS4pCekT7Lc+mnMT9ugvvE3PXiAbEswxz8hIRvunxMhA3avD7lWPpabikRVHJLZkpKiEWhuQOUkE7jEMaj90rZ2XijSHepxqgoJ9Nv5FQhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(66556008)(66946007)(8676002)(66476007)(4744005)(1076003)(316002)(83380400001)(26005)(6916009)(2906002)(6666004)(38350700002)(54906003)(36756003)(52116002)(956004)(6486002)(8936002)(478600001)(38100700002)(6506007)(2616005)(5660300002)(86362001)(186003)(6512007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vEjT+T5e9B9N3n+InxWIhexTulKtm+Y7fl9xPXtDw6FSdiNrnIhX9GnirFK+?=
 =?us-ascii?Q?Z/NbNLOwIeq0x279BLsowVaOE6R4RkYXuRf7wss1Vq/7+CU6XmJM944ihbV1?=
 =?us-ascii?Q?RgEj2TljwXMzv9ogNm8JQaFE5oZHR3AN8svvTLQpbeyE3sAbodYhXiJVzTJU?=
 =?us-ascii?Q?inr0eX+7A08qa6FjX3PnxiRdr1AvaISp14LIKudia2n5RkXp5wt7a0qoXaO1?=
 =?us-ascii?Q?P9QPx+RWyvu7Grz3sSWmG4apFLptvZ1z26YIwCD3l+wveNslIDvUo15NaWgC?=
 =?us-ascii?Q?drGJ5PnIxnPAUQeG2ZbEmKDK6cusPgQM69JoNlHre6Cs76JzUuNkJjrEVCJ5?=
 =?us-ascii?Q?vV8Ywq1T+xLn8NgCVxwfDUTFb1wkq2nNwcAkaiKmXutUzvb0maCBvg+bzp7J?=
 =?us-ascii?Q?3MuZ85LZjKCKLB3662bodk0NLwWc6mGT6Hh8T4tuzF5xO9KXSRgd/9R9SgAf?=
 =?us-ascii?Q?uysw/gfSnQJqO1VBeVybFYe4e+W5ZJPR8xYCfDEjBC9qMFLO3IKTKV6RhRHD?=
 =?us-ascii?Q?BE5+E1zr5/GcHblqPQ87Bd4pfnHdcRhdbN8bbJGW9Orf3KrwqwnNobtRMcFm?=
 =?us-ascii?Q?qZRHbhkAiHSuD9nX/zvLgRWfb9pmu9OyXsfZvGzeujYNCnIZHx+oMNWxnUST?=
 =?us-ascii?Q?6lYmTfpNdhbKllAeV03U1Z2IgZ6Yljt2g4al0ZNq7xRyFdQNZNTNW0zzpqZy?=
 =?us-ascii?Q?wsaKgNM8uRAWEKjFqa41s7N5fVLAe6OuuifRRSHtPcsvGT4S7HJAmlsQAwhJ?=
 =?us-ascii?Q?yoz0fB9I0qF1rrHmdthUQeQQQZyTW8wI2laWJX+YBZMzQ/hEDyk/2ZmjlsEF?=
 =?us-ascii?Q?5vSsMDVjd5byPLKJdFARowM1M3W7EA3ygtUobpuI0zkQn4b0HP/TKOaRHR76?=
 =?us-ascii?Q?82zg8s8nzg4LQgkMTh+y8nfJgiHYGRStdmzIFFVaNiSD0V5xO4pjm2XQKuqB?=
 =?us-ascii?Q?UO/X2b0RAvvIVMgL58bGC+oTHtd6M5pzkDfB8tNAI7FTriRjq8CEIyu+LDIV?=
 =?us-ascii?Q?cg9t32imTLs0bLAdrsoRkT61f4VD5ppmpKa21LtsqqpnjeTGE80dEGGZr7ZB?=
 =?us-ascii?Q?vezeynRi23zkeJtw/g2+GNMwsEh2yjchYWiD8z2q2L6H1aJa3b7tex4QkdQi?=
 =?us-ascii?Q?tzAvQREkD5WD6liM4eI0xPuk5gBdYlfNVv/mUIaCtRvVu1KGjEJwo8jTW7tN?=
 =?us-ascii?Q?xPwLNxQjf5QXbadENf823V44VYUa9Pu+NYvEPF7QnT2MMw/0huxGvMVNuS3r?=
 =?us-ascii?Q?9NhlWUd9rUQn25oXD6MPB/a6q6iN0PBf6AhphDFtuWAtrGW0FIp0HoB9Cu7w?=
 =?us-ascii?Q?NY8zwL/CdljRDhb9UGgOa9nO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d05f4948-174a-4113-f079-08d94089cdcd
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 14:24:46.0085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUMobD/oMrP7p8VQLYbll2tHexTMjBSnpU0DM1znkCTnzq3ATQLMnZXBDE1uCDPD8o28ROcbJmZVDJsPbv4n8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8853
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Usually the dash '-'  is preferred in node name.
So far, not dts in upstream kernel, so we just update node name
in driver.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>
Fixes: 5e4c1243071d ("remoteproc: imx_rproc: support remote cores booted before Linux Kernel")
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 12de153abb2d..26eb130f3263 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -600,7 +600,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		}
 		priv->mem[b].sys_addr = res.start;
 		priv->mem[b].size = resource_size(&res);
-		if (!strcmp(node->name, "rsc_table"))
+		if (!strcmp(node->name, "rsc-table"))
 			priv->rsc_table = priv->mem[b].cpu_addr;
 		b++;
 	}
-- 
2.25.1

