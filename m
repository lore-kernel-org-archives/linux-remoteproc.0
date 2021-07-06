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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849BBC07E96
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Jul 2021 14:43:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6ED98613C8
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Jul 2021 14:43:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232643AbhGFOpl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Jul 2021 10:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232764AbhGFOpf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Jul 2021 10:45:35 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on0616.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::616])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A186C0613B6
        for <linux-remoteproc@vger.kernel.org>; Tue,  6 Jul 2021 07:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqSs0fHJNJF5gyiCutaW2HK8mJ/uhrsBF0LdDWSgw6gGemO4vVXFhjApSZDL/PawHe7KgbIoxAe+kn01RXF+jemFeH6l4RXOAO1ng+5iR4ftxmMdL/b3Uw2F/183pU2eaB5jsL07INlcxzrMq8FcDtxfJF0Xi48DL/7UqeSYDGFx1K2JtiDN8s+f1VtmFsoMK26S5OUIr80OxvFR42TARYRRQPrVtqU3SOp11PdeuyJYg5w3wk93PZdfG7Jvf6rIPQWMmtJh8TonLdtYwzQXk6SojjXWwlBQUBJdCQTS48g301wB5F5d17U6cPU3QjUM30SjPN76fRNCXUaykDWfwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkPtt4dHfqLfHCNSafk0JjXMbvz6Xs4ym0v0F5g6bR0=;
 b=lPJ7pCOcgAib9P2hY/j9bhtCS3x8NM9qeh04e1nPZLFfvs6CIJ3oQhwIZiVfU1Se8bAg9WpLpdwjKGl0ubz2V9GrDC78q//NNj9nDa8yRsAfMlnOd57N/QNnEniJKmT59yg3Hp3u+GJPw3Ek57YkpZIh8bJdiIH/bokRi2Nfqfwh5ATNPgNQYFSUTeAQEsEbVHSXtlEaNOpiBnbvVhJt+b10B/eyQN1E/n/x6+8KQJrcfClXucPhawrCV4AQuVoLfnz3VI/6ovVhxFmL3J6cVSOT92KxK2xUR4mVTQr6oiFjjQg4A0570ipzqYfxHGrmIMbMScEzvm7IUBxJFw79vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkPtt4dHfqLfHCNSafk0JjXMbvz6Xs4ym0v0F5g6bR0=;
 b=DjciuZBOd2HjMwl4pdw4W25trhqj3nYGnpl9ty9k+P2LgIMk2I2MwfdURDf3YHemwTRylUp5nwM3RdmSUD8sMHVe2n04rCtNazEhszS9/DaF8JmLlDzW/raFP59J51REO7FO/wpfhOAh8aOM2LYVC3RVd90mfjAQa+u8EyGASbA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8566.eurprd04.prod.outlook.com (2603:10a6:10:2d5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Tue, 6 Jul
 2021 14:22:53 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 14:22:52 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-remoteproc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, ohad@wizery.com,
        dongas86@gmail.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, cleger@kalray.eu,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 2/2] remoteproc: fix kernel doc for struct rproc_ops
Date:   Tue,  6 Jul 2021 22:21:56 +0800
Message-Id: <20210706142156.952794-2-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706142156.952794-1-aisheng.dong@nxp.com>
References: <20210706142156.952794-1-aisheng.dong@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0107.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::33) To DB9PR04MB8477.eurprd04.prod.outlook.com
 (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0107.apcprd01.prod.exchangelabs.com (2603:1096:3:15::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 14:22:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98fd5b4f-e3bf-4891-bddb-08d940898a6d
X-MS-TrafficTypeDiagnostic: DU2PR04MB8566:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB8566ABB0BFF349382272366B801B9@DU2PR04MB8566.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wjgmZ8itmoXRec3tTO1EQWn71TN4CMEuu0+jYYTvVSkQsm/yGJa0ZkvAIjIjZY9GFC5PeKjhqJuHKXetT4Rck8wMeFHC4MjEfE/7NgxfTC2bFcjkrynC5Rvvvfrtbd3qx+lHtCHqW4dr9LR3v2LcX3JntK5dI125CBdNHp/ladGf5FpCvlFn9awMzHII96RBXi1+xL23vfPeD7UzVgT4sGPHNTv6NQ+NHcxsfTIngRQoLOhm0pBSeZzw+zFkKUo3OEPiqkYdPBFljbGg3q3ouDMJJE4dz6YVCeVbpX2bSVAsgwGUhsWoNbq20w+fEWceUY8LmdFgVIC0fIGhe3NtSG9fEpWzMqU26kJSMrkTNn7/2ZNu9AfjZqmkLw6rIkPEEzTFL5SQlaCfarJAeQuHfJ/k+ZVn/UbOFVYlWlBJMJ++H6j5S0rDPUNXLQFDfpH5ANTaLOmLMMfxsB7xpMCTBW/ONaWHQO4eeOCJrN3eFxHcS+8I+qc8hO1WMh104CTtXvNWNXIrZL1TnFko/PIWD5l6y2y81bp30HMbU+bJVoqqWStsjmXlJoSb2CvtU7OlFpf53Gb9ZyIFttmMqCzQlt5F9fJ5JbeaxZ/EX8dJk4J0PH/2AvYb0dwtGhVq/Pr2QjGDM9qCsO/VnJhJ8CPey9VKdMWfJGtS2Up88oPAFjSCOixvCq6G8F5QaMPZ+nJBQJcA3iCfM8ZuDofBID0CGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(4326008)(8676002)(52116002)(66556008)(5660300002)(6486002)(2906002)(6506007)(86362001)(316002)(83380400001)(956004)(66476007)(1076003)(6916009)(186003)(66946007)(2616005)(38350700002)(478600001)(6512007)(38100700002)(26005)(8936002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yPy24Euwqdp5+M3hU/wmS7NdZF7cg6FcFxMFbNTBrUytdZmIVMoZmGzQr494?=
 =?us-ascii?Q?VFpKWALZkym8Mk17ePLGPSdtdLMkic/fDDjhxPnMiXHgPMUEhQZgELSDVCRA?=
 =?us-ascii?Q?9PtsJI3VV6Cdi2Qarvoq5QMeBL3r3idnvDJN3NPNpqX5SDBQaDJM46BEGbxZ?=
 =?us-ascii?Q?HFlr3+rlmYNP9B5bYuOc2hWW8YNJDJ1Q5PlBsaSYV2ySd2RzAn50FEeo1duI?=
 =?us-ascii?Q?qge6Xegh9xYlSowpZDzJ+ch8Zm3s7dTNHNuwfAo+SU8b10MaTGpAudT9lBLI?=
 =?us-ascii?Q?9DlXirgeQKnQE3oHRW8Y5n0oy7XiC0tJGRyQPM6h1JxNn6QGqztporsI+4mG?=
 =?us-ascii?Q?IbzWLTQaFZgQPoaYiq9KOZjsAm8xhHV2BvI+iSml9aKBC6CuX+MIrj+7GRVY?=
 =?us-ascii?Q?qLv+R+/8NvnOTbafUSozqB9ldlR/Xb7m/C1mPwBo3XtkS92+IFRQsPmXbSx0?=
 =?us-ascii?Q?mzcPi0jje3gaqfzwJ0EP7uq8369mo+a9mtKLdx9Z+DlxpjthiYD99D04MiSA?=
 =?us-ascii?Q?Ly3agumQT+G4ImunDp9m/A40S13w85PhVFeQ+Z9hdYxVnfl3JwGzg4o86QvY?=
 =?us-ascii?Q?Lf05B9F+vYpl+iJBamhFe03BRPjZg1+mgm6a9DtVftS5x8ZMWnOHbPwFrpIm?=
 =?us-ascii?Q?NfgOTARnBaZzh2pRsYWD2d47MBnS5gamQKF5yeBRbzG7O8t3gowTg1edmTmM?=
 =?us-ascii?Q?avBM2Ch3JZY3ymE6BmrdACUjy7g52XkMnkKcQJ+VMcCtyS49aIYlhEyCkzEE?=
 =?us-ascii?Q?vT48wuM+mF39oIm2lfpzz+lpKer3uD+fIEPGs5vzcl7lMfC9OqMUWRuqysnm?=
 =?us-ascii?Q?786Gj/kylNuh/KMbjphM3+9Xj9yTefaALuvtHpc41lHGvovwseSsq10fIM/m?=
 =?us-ascii?Q?uJRqyS9xSrEx8rcVDQD+l2FdHmvgk67rfRDu0Snx35yjWcBuw+8Q/cDhr1i2?=
 =?us-ascii?Q?YwcVbmijPWopuQ+1akC9xp2hfdWqelwmuIF6xdIKTfXw/DydzZm5PW22lams?=
 =?us-ascii?Q?J8oVmayyGCCM/y1oaxyQVsvzkGj6+Kcw58yiF37S0FIvdYMUJ2UYpvfsNVnY?=
 =?us-ascii?Q?pf8T+11SDZ90sXpVZ0qbbP96tqGHLkcwFYkH1SPQQA/810leMc1O/EcZSoym?=
 =?us-ascii?Q?PoCjxuVYl8rJGhpm47vhoa5NQIcebXteqUNmcFMHo8jBHKp42wPB+Uh1ZDFa?=
 =?us-ascii?Q?y6ROxJspmVxieBMYVI8DScznfGqJ+Uivj5CzBJJX1rvs81Atu18g4gRsnKz9?=
 =?us-ascii?Q?9D9zj+//MOqIS8odLO0CksNUaq+Gnt6I5JjjIFLcjJF47wzzq93wYl6qFcy6?=
 =?us-ascii?Q?JMoOgwQpr3+Q2oU/THi32Hz3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98fd5b4f-e3bf-4891-bddb-08d940898a6d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 14:22:52.8483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gnpNlxV5urrjmN/q+w2ChvBzxrB/2gVUgqfzELP5tamflarJmh48+9UQ99qSPF1DWzczFgSUeM3TiQ10DtPHpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8566
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The load_rsc_table was removed since the
commit c1d35c1ab424 ("remoteproc: Rename "load_rsc_table" to "parse_fw"")
but got added back again by mistake in the below commit:
commit b1a17513a2d6 ("remoteproc: add vendor resources handling").

The patch fixed a small code indent issue which not worth
a separate patch.

Fixes: b1a17513a2d6 ("remoteproc: add vendor resources handling")
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 include/linux/remoteproc.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index a5b37bc10865..83c09ac36b13 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -369,9 +369,8 @@ enum rsc_handling_status {
  * @da_to_va:	optional platform hook to perform address translations
  * @parse_fw:	parse firmware to extract information (e.g. resource table)
  * @handle_rsc:	optional platform hook to handle vendor resources. Should return
- * RSC_HANDLED if resource was handled, RSC_IGNORED if not handled and a
- * negative value on error
- * @load_rsc_table:	load resource table from firmware image
+ *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
+ *		and a negative value on error
  * @find_loaded_rsc_table: find the loaded resource table from firmware image
  * @get_loaded_rsc_table: get resource table installed in memory
  *			  by external entity
-- 
2.25.1

