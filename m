Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD50DC07E95
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 09:41:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 904ED61C7C
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 09:41:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbhGGJoW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Jul 2021 05:44:22 -0400
Received: from mail-eopbgr00085.outbound.protection.outlook.com ([40.107.0.85]:34710
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231175AbhGGJoV (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Jul 2021 05:44:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8MnL31M4Jr+WVipx7HAk+EhQTgeyC5/XzAks0p7Sc7w5IBR3fZwCCKZzugOjNvWgSpTfvLtF/nkEoKDY7/g+8UJQQUap6m+ZyrngQsNg+vx3WdN+a47yWBMVMNuX2dEVRFnw7z169pnd9/4pWNSMo52dZpMVhYJwFWiv8aBusUPs4/MaNldGsAIX9kPrclRLkGVLNtkGlY0zrQZjxJgF+cx5J4fXjk5CHFYaYv71CwE02UvzuhGUz/3LWaa9Adv6oYh+UbItsJCQLizElWCGqabEdefbIR+ZqqA5ko28XVj/VkERDN8Hr61fr4Fxz/tJb5Mfdwkj+PU6Ts5dAnhDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOmpuJk0w1nfBcrwnubtNPSRtW5XKSKu8QPZLhagQNw=;
 b=fngLNPHCceIKE5pZpCGasZSDuYz4we3OC8qam6aQt+nHgSUVOCdDrKy/LxVWyr2BPfGywlMhBMmLqXgR39gqMalfXU+KZoUKOXKBRHaSwvjstGedmaHSXDpPJtbVo8qTJQixo+L3WrgiWVVT/Le6qeSsDW1VHQBf7NKaDaDdw81PyfTAEeXtYigl2RbulifK1++f42JyQ/f57RcBmBoB6gwQZ+lRjLDdDoLnhxMQ1bOkk0ydV6Oh0JZuIFysn/aSue9d825eO7Lg1jbwLOtD4U6bY8O3w52ms5tUnRo2qiXr0FU3tlQ5NRf/W6RGqhsI/94Om8a6N5Mn6daTYvijmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOmpuJk0w1nfBcrwnubtNPSRtW5XKSKu8QPZLhagQNw=;
 b=q2Wp1CtFr/SuKqddeHLDGtbRleqOQmdwQsw5p/ciOlchu/txU32Jha6LdwJeA4qBaQl9PDmRR1o6da6jOwe1yP7G0lw9WvVQddCJoEV+oe5aussmPMmG8dKnTLVi8Cp8C3AhSyjumW6eOfg3Lv1i4XUPGp5rXF6LcYU2PCenNVM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8710.eurprd04.prod.outlook.com (2603:10a6:10:2dd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 09:41:40 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4308.021; Wed, 7 Jul 2021
 09:41:40 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-remoteproc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, ohad@wizery.com,
        dongas86@gmail.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, Dong Aisheng <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 5/5] remoteproc: imx_rproc: change to ioremap_wc for dram
Date:   Wed,  7 Jul 2021 17:40:33 +0800
Message-Id: <20210707094033.1959752-5-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210707094033.1959752-1-aisheng.dong@nxp.com>
References: <20210707094033.1959752-1-aisheng.dong@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0112.apcprd03.prod.outlook.com
 (2603:1096:4:91::16) To DB9PR04MB8477.eurprd04.prod.outlook.com
 (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0112.apcprd03.prod.outlook.com (2603:1096:4:91::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.8 via Frontend Transport; Wed, 7 Jul 2021 09:41:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02b6f69a-8450-486d-fce1-08d9412b6c14
X-MS-TrafficTypeDiagnostic: DU2PR04MB8710:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB8710D9C80203DE970E660C09801A9@DU2PR04MB8710.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8O1b6Nrcb4MecPLNQkkdoDSws67I1ZzfC5ZLY1dSO+BzQ0uapAxL5/904GappQDnOyrYjVNopudloPFTDFwt8a/Q7CPiLkSI2O0yEalqzWEM8EtyiIFoguK/IwBytb4S5tdQqLClgQIKGOOVdcdtDgXIQMDUd1Vr9/OLdgcJZJHssGT5ke6QyAj/Ky91zRcIFqFcT3S1hT4btC9W9VCGqV1zYrO4IESpTgXFXP2AvcDGliqDfoYhkMC2VdUTLB2/IBtmd/kOf7Ba5lyJqSjsk1Qtz5xnejTJljkb+Q2Xx3sGRnjA0WQ87sFteDyEmA4BL6wMtV6+NfbgxJBrDpVT+kdb1CuUxDYHj3NxHpbUH49Lbj44In5ME9zisnjqmhtoPnfZfux44HyuWnwedhpMFs88YU7S983gEIyEAhPNt+Uhu/el41ymqA5dr8V7IrCNXBMfq5bIqs1o+5ZIOKZ4ASKa12z+BoxauVbPJX5qPok0Hs1W62KlyTma9E+T9iJSlqKkKyBtA1huZHiELETx/p44ass+0FtnKHt6xQB0alt+38ldJeyWdKj53QkchyI+1GxHOrcxReH0ZvlELA/xG2oEykk09DSz37dFefvfsKhBsoED8t5bahXxdKqKHa0cvJ5jjRPOh8Snvyod7e+KpSjsZ2Z9Xmp5xa7oPV90c3khQqafKA3M6WveWByRwS7WFnLeQ9bivbBBCqP/Kw8/UA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(4326008)(54906003)(36756003)(2616005)(2906002)(86362001)(83380400001)(1076003)(6916009)(6506007)(66946007)(26005)(66556008)(6486002)(5660300002)(8936002)(478600001)(38100700002)(6666004)(6512007)(956004)(8676002)(186003)(52116002)(66476007)(316002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tmeOYPCkydT3cbp9YebTELvrhlCykmrjjVJz9mjEtlzmgxdDIDOwigurGKR5?=
 =?us-ascii?Q?v0Og6k0pAGh3uedH3AdADVzEt+Hhg9Ql8IbQKvnrq5SkjqhyZlJlMs4Ibh8Y?=
 =?us-ascii?Q?k8ZoZAYTO3L+9S0Fg1O9zOYbzyZwaA2cOYGXFh0qydBjofcvgFOEc15k/Qq4?=
 =?us-ascii?Q?ld/2oWMJJJ8D4trqGFNMJSTlADtX7sVDXQyR2Yi5uiaqNYEXVgZzllAeoyNE?=
 =?us-ascii?Q?mJlmMIpFfLyYMfSv0Kvd4nBNF5rHgg83sMVRDPuWfzC0fdNSQgpZmKJbjh+G?=
 =?us-ascii?Q?IZ44pMV5Fn9lrti0h/h7uT2jOQlUoYQKb0bd+RvtH1WIUoL9RtyLNjtIm0nI?=
 =?us-ascii?Q?0UmkgwEtLQHvc9VsEByTFH5lHEVXDwv7li614rNdPxG/k8blKGynl77zAlM2?=
 =?us-ascii?Q?FG/Pz8WnXtA5o8NSGaMbYTyGboxr8w1aVk76jaq6k0B7kH1UnREN7dRqrL1b?=
 =?us-ascii?Q?LGNaxuJQZ/tStBZM4iKH1DhYvd2AWwA6AMQVHMsgsBq7AP4R0zRNL71LE0DM?=
 =?us-ascii?Q?b0XoEJn3DMWr9dyOY3uyVparwdCPeDpwMqVwo9gwBH7KCykIJH40AW4oDVfo?=
 =?us-ascii?Q?mGBVFGH2CkZG3t84DyM9zqJHnbYxY5A6gN0j+2kYW7CayiYQWPSa6KuSk7zt?=
 =?us-ascii?Q?U3GX2Ywpoeyg8wkY2rnIw+auMhD8oYxH0GJRv+NVbvBazS39/IWBpyVBr+M6?=
 =?us-ascii?Q?2JbCxTkkZ18dEFc5X7Im+UJtenXpD3zfhPqrRwDH0BHtLY3gfNv0pdzhgcXB?=
 =?us-ascii?Q?7kKefNCm/P9udXkCDZK3pQrBjMV2pcI2lidv3F1g35m5bzcRZvyf73ZXbCf2?=
 =?us-ascii?Q?4xaF/nht1t4t1E/6n3mJKtIK6L7arCcIj4LeGlNp0e9Gw/Cy2wosy/kCoAIq?=
 =?us-ascii?Q?tnnBiHJU8kbdUUKBkr3TeraWrpOidf4AIQCcLZoDsSQxexe262YsnJQ8Ef7j?=
 =?us-ascii?Q?OiNehLpbYgag1SQvcDx9kUGd/+ABxSLc57btZ+wqzdIinI+3gEGNQQUMjcNa?=
 =?us-ascii?Q?5Mda6HuxffwEi60hZuRuRcp659cWjXCktHjF3j5SJsNe8alb2ExgMeHrRJ7o?=
 =?us-ascii?Q?A2ExUwsPKNv+lDBXcvpES4NM8UMIWMkWzouOP8lCbfKsJOUF2xZvWQ4MqEN5?=
 =?us-ascii?Q?FLBcStyb19pF/IaHZJh3x054pgflmu8Zlx2SIa2OPyEAOc+CWTeH82BhHs7z?=
 =?us-ascii?Q?Ln1NNCZvxHrLkCnulzbSuKx7DJBeTOC2/+LQnVWyibNqRodCLOofS0eeA8If?=
 =?us-ascii?Q?fqjxu/cJWFox7XHRVbbGnZ0pQVo+uHcx09iU6jULLQeOK/oB7+jIeraTFfuA?=
 =?us-ascii?Q?ydcLQ4nyiFxDRDm/IWFuLh/X?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b6f69a-8450-486d-fce1-08d9412b6c14
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 09:41:40.5476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5SPhwld0oB6QlwEtGbjsmySs8JKJf5nJUmu4w4PFr48NQH+jPCJC/C2gNdGETR+loDDm1eYUmJ5W/o2JwdwlJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8710
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

DRAM is not io memory, so changed to ioremap_wc. This is also
aligned with core io accessories. e.g. memcpy/memset and cpu direct
access.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Fixes: 5e4c1243071d ("remoteproc: imx_rproc: support remote cores booted before Linux Kernel")
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
v1->v2:
 * new patch
---
 drivers/remoteproc/imx_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index ff620688fad9..4ae416ba5080 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -597,7 +597,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 			break;
 
 		/* Not use resource version, because we might share region */
-		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev, res.start, resource_size(&res));
+		priv->mem[b].cpu_addr = devm_ioremap_wc(&pdev->dev, res.start, resource_size(&res));
 		if (!priv->mem[b].cpu_addr) {
 			dev_err(dev, "failed to remap %pr\n", &res);
 			return -ENOMEM;
-- 
2.25.1

