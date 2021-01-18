Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7F8C433E9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jan 2021 12:32:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCDBA221F8
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jan 2021 12:32:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391569AbhARMcT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Jan 2021 07:32:19 -0500
Received: from mail-vi1eur05on2055.outbound.protection.outlook.com ([40.107.21.55]:54049
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391563AbhARMcO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Jan 2021 07:32:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cf/rPmM1K2nhMlmTCxBksxLQ0NNMRhpJeprVTvWuafxxtNufQU1TiQqnmrx1kIXeyfqSr47U713Q6DIeAbw34ScZbdUNvZwSiqVF16s+1a2oKVvez7AD6DMngZZlDe9W8NfcK4gi1CJ9gMOZ/+9OvxgYFtACt0idu5bEL3yyI4gibXAs8g7/mAawTRHf/X5qC+yrme47B33mVzVteb/VCZ/OL6JVfx3+M2H2H/7n4VeaLHzbUnIXnxrg1OULr4Qziry7iGYI9W4lcHO4Bn4rHY7I1GXUni1qwjeO0/PAeD6e760XcNxSShN50kcVW7bbnOJX0TjYlMfGg+Jm0ciXjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOyXY+Wu7yjAZykW6d3WzVozTOhNuNfY+00aYS59St4=;
 b=WXZudrLO9ATpm0kD7dDGyEhOSGq4dbVpvHP8JxBYNJMvqeuPjNh5FtyS6znmuqmX6a8YYbEoQ3IQMCAC4USOMDoNCRdO2P2yRKGiAYbd0LvuT4x3wnhwx6jJxGUsyEHxIF81dTXBKKFN17uj28g2tZiF7j0K6iDud7N5gOeKQ/ZeUJQiAeLwzwC+st2GTkaiJU2Z/l4JW/g0FhlJfGTWCYlm0R5lmALfjdRtSlgV0q/CkiDrsSfKurd4ylJNf0XQP29+djSFK4PSTpo8/jjUEDhWf5hTjtiymP9oXCMHyGxLIQcKMECgzp8f4ePwNSOQEGWrHQqFW9A96tQ6exkwBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOyXY+Wu7yjAZykW6d3WzVozTOhNuNfY+00aYS59St4=;
 b=keIU8fTudSkWIJQsCVznpWIDLLb123YnJePdPESz/vQRn33EQGtR8+LBgACVya3F7pw0aMTxuUuNMQbQpN9JR7nh16E4wvpJ5igCWNv4+vxnowxI2unJXlkuai/GY8A4NYlcjVLdK4X6oTuebClyHmgEWXevzKXWYSzQ/mN8dfg=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5243.eurprd04.prod.outlook.com (2603:10a6:10:17::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Mon, 18 Jan
 2021 12:30:44 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 12:30:44 +0000
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
Subject: [PATCH V7 03/10] remoteproc: introduce is_iomem to rproc_mem_entry
Date:   Mon, 18 Jan 2021 20:19:52 +0800
Message-Id: <1610972399-28286-4-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610972399-28286-1-git-send-email-peng.fan@nxp.com>
References: <1610972399-28286-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:4:91::17) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0113.apcprd03.prod.outlook.com (2603:1096:4:91::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 12:30:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9fbc4444-2138-46da-d4de-08d8bbace01c
X-MS-TrafficTypeDiagnostic: DB7PR04MB5243:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB52430C055380CF5CB710E3E488A40@DB7PR04MB5243.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wCUNJGoEJMsagZ5r8EvmpoLM+HpA9pi8/X5jVxByshjPKAXue3Q7dwz19GBFo6mukbCwBi5A9yT2BZjyNQQl70PpWAT8Oq6c6Hv/i535f+Rr5W/96lC8WaC9x3HM451ZK8kEddBJi/76f4ZGeCp623jKcYFM5jw8AzF5QeK2H+QkewSJ7/LXF3rX185pIKU5nqgBnoRFOLHh05G+O/QzdcZjfvhUN48VEhvYEQUq3Zsw9+GIkfr2aU3TeOB9SlG6pRmeANEyyv8G1wQl07Zryv5gOfIdLR+KTwAq16Fw8Y2dPZyDwyCO7rJVfVDaKyYtBT/MUgVF6+gj7RGJf1umn6fTgUXnEsjiCqpUAhtU0fPqm4SDFXGIU/AD6T722BiYVASbdm6JxYFYPURRbqktFUPw5isvDox9kYZBrn5ln3M8s0py7M22whHkolpj1kUNiGPgzQMXCfqoxg/pYuRrqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(478600001)(4744005)(6506007)(316002)(6512007)(9686003)(36756003)(6486002)(66946007)(66476007)(2906002)(2616005)(956004)(26005)(7416002)(186003)(52116002)(16526019)(86362001)(5660300002)(8936002)(4326008)(8676002)(69590400011)(66556008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1Y4wMl0heQ6z9uX1VrOcqKSxNXhdL05XMH98gpIZGE08hg0JYsXoUCLghHoP?=
 =?us-ascii?Q?lK50XDe/QZNYuFa0DTu/InwBxxUt3V6NzuiuKrN7UTrwMhn/gUe9XjE6e++h?=
 =?us-ascii?Q?mqQCmAJJvSSiNq7KqRV4RsCYZK5kcrP+sybq+fZPuP+UGTchp+bXMHi9ns85?=
 =?us-ascii?Q?23i7ATXiuy7eW9M6DdqoUAdY/WTGnR/hE2899cmHw1wjhzxpv+vODdmok4sy?=
 =?us-ascii?Q?LEdOGgkyfOU+2gkNYzc0Kfw+oNyD+RpcJvDdkKMBAWJ13m78svrBDnuMbLMP?=
 =?us-ascii?Q?uclKgpQQqq7uuHa4TkMbTeqqOw0L/iOkBTYcF7QN4wpCa6WgdjGwt8nwmGff?=
 =?us-ascii?Q?jlmb5N3vY6u6a/AozeCwR1AAuCpWDyPycJBpu13tVtXMwbOGVYwD+kMgw+nV?=
 =?us-ascii?Q?QfSLOH6FbYq4OkgzLPlEl5xXMxtBalQylOwBLlWqP/HPtXuB5VDpQAHhRfHE?=
 =?us-ascii?Q?3oPQPTwjbBkFAgozK8vSHqdi6rsKxK1AJv7t5F3ss2tuvaPbphweoQsDTgHg?=
 =?us-ascii?Q?MSxu8+EscghsIw093nli8IU1f/BZDJ3BEfb/ehUXe1sLDmVbh5LFUZU4cTUf?=
 =?us-ascii?Q?j5G53m49EedFK47gNYytH5Ukq/j/BEzAQYjKKSk0Ra0blGrP2ph24OCp+kTe?=
 =?us-ascii?Q?ANmJe15zL4qFLz+NwyMhfTQ/2i1zUeGNl+gnOujzu2fAuGX5Vdr3nuiaikzR?=
 =?us-ascii?Q?4FZjTwSci3Otg+zQzfrw5+azy3sJZAJtck5N4sEtCFaZL5X76fAslj+OEjyR?=
 =?us-ascii?Q?KC7ZAqEBH65AOu7SU19QV558fsUC2Bw3U6SFZ1GgJzXmOXZvl/1fWImfl3Jz?=
 =?us-ascii?Q?Tn5cejJtZDAvwSZB0fdGcJ7Pq7KKZk2oifMNQfF29bberMO3KwLg16r6bRTz?=
 =?us-ascii?Q?88mCoy0MyGQFcYrMLJjdcvy8rWeDQY8V8n05E0y1WExCDKTZ8nGynCbpEZWw?=
 =?us-ascii?Q?cS07dA8R5FVdMmNSvWU8XoAqBYmH2YEBwBz882iBKglbckzIvHMtxVMmbl5u?=
 =?us-ascii?Q?VgWz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fbc4444-2138-46da-d4de-08d8bbace01c
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 12:30:44.5818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+VwGUkRD5PRCJ37M3yE1Eq01ROP5Ehi0fNuc76ng/zpjqS6J8vLt5FCsLWuooB/0/FUxV46W9zYZ9eCpaoE+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5243
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

