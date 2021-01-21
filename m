Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70718C433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Jan 2021 01:25:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26BC82388A
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Jan 2021 01:25:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732522AbhAUBT3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 20 Jan 2021 20:19:29 -0500
Received: from mail-db8eur05on2054.outbound.protection.outlook.com ([40.107.20.54]:37697
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732776AbhAUBQh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 20 Jan 2021 20:16:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1M5EhTcI3jkwFdYFSADZfohZWaA5q/pLCFwlKRxidmZft5RbN0Q4LYfPM4SJwz8gh/+V16XUGDFA0i8NGp7AS+mlqH0R8fzWNxzzQDTmIw8GzgBUfiO7mwZ+QGKTB3YXqhkMJZtt7e8wiV7xw1V3jJk2reRLcJPpTl3p94C3ejqcTRkt90ibjM3M/gjk65sU8/fSBrPkZ+mPYp9+7iyX/LYhM/4YpSe1c72e5F5bvtMgHn0rDIZbDUMjTddbSoskrf9FlTq2Ut73j4ZQK0QKbrTjlKSX7mhHeQwF+ehWeL321tqJWM0rzBoCm0Mu8Nr3Nsk1ygCKCiX0EjlVi80+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOyXY+Wu7yjAZykW6d3WzVozTOhNuNfY+00aYS59St4=;
 b=OCCI4XoZmxgQmQwWwU1WEQibSlG11mZq6anyGEN04UWj+ntccuBpOtAz3A+R4OPZkdjdGO9N6wl/nirnKUDYPF5pnuYd/HzaW7UltwdJnqtFrgUd00dEr/2s8HmRyKEhlT6pfoDvIXyKHXXrvm+RquZiYUJUFhB7ueoEz8R5F1uSovkFl85wW1MfQVVwbJ1doIqyMwqXYbdbeL/tKvf8x2JerJNS7FfDcr/p5snoDsGqFjacZsYLoeArRVjZGC1tUwwBK7Ow3pdW6tMr1tb7Hre0aavIBXGvm+/6i2Lg2xzQ65kUzvrmv8097PA6ilXPzA2y4ugaLvwK2hy2ACK4iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOyXY+Wu7yjAZykW6d3WzVozTOhNuNfY+00aYS59St4=;
 b=sjnzV7FeiAbb/W1ATiSszwv+1GsJeSBvvLXV4HdMSll1XQf/DfKUYVZmF1ELC1DTn6vmnAVjSTOas+sP+kInMM9jX0EZ26RuHpu5o32b0twwN9JSHXEXGLh7FZyIAYZIvX87zKrIE2g58dGXFe+nMx2hOABXJlxb/JBxd6JtV/U=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 21 Jan
 2021 01:14:28 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 01:14:27 +0000
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
Subject: [PATCH V9 03/10] remoteproc: introduce is_iomem to rproc_mem_entry
Date:   Thu, 21 Jan 2021 09:03:28 +0800
Message-Id: <1611191015-22584-4-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611191015-22584-1-git-send-email-peng.fan@nxp.com>
References: <1611191015-22584-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 01:14:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 172222c9-91da-44ac-34ae-08d8bda9e5cd
X-MS-TrafficTypeDiagnostic: DBBPR04MB7930:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB793094EB823CE91B5B68B3DA88A10@DBBPR04MB7930.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dn1ifnbnhZ8C8lY+QZp+REniTnhA+OS/rbAzHsgdO5UUCGl6yDgODocwO/9k/N3F/YvTy0XNX5U4xFNJb4ILTgI19U2jRgjWzDfrTE7f+qkNc80qtxCR3t2UwZFCiTBOL5/QjV68/MbMvwBMVPm6SDpSkqi+eaEqo1ZngdGtGN/grJz6ADNTcPj8jFyz7QmguAfXmpW8jrQGCauCsiE0Atrl1XudhFe4heuEa0p8L2TSKcHW5iKsdP0Q3lLqnM5mgvGUrq1PZAgHXOGSrkco0btl4q7Y6bGxdrCicukSDcev19V6HaCD/zHpSivsiIX3TXZnAwPUKEARuoRZEb3ET/ElruUFif9QiB7j4QPTq3z01Lo/+4Czp6Lff1IcvUelXIZEtQCIphZTokcj2s/PNu4VIe+DEFU/Y0yVM+pql/zvvnyztfMMHybMhnoZYFDQLztauu44ip/CpTpjuJe06Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(2906002)(7416002)(6512007)(956004)(8936002)(52116002)(4744005)(26005)(478600001)(9686003)(316002)(2616005)(5660300002)(6506007)(86362001)(4326008)(16526019)(6486002)(186003)(8676002)(69590400011)(36756003)(66946007)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?L7/I6XfLMUv/j+IEGcjahsdcMonSM/8z4zHI+BCCXiOrvh59BBke9b1+wBUg?=
 =?us-ascii?Q?gKMkw0ytn1FiaceFrsgt5l1qpRD53t3j2SQMkh2cN7OfND5eJKAmPU602J0U?=
 =?us-ascii?Q?DXX6oVSQ8BiFq1bFu4NRpwMNzYYi3I1nYUs7ub1w5mE7qbkFeLxlwygtVH6C?=
 =?us-ascii?Q?DD6zC8LtLTyo05uxeYUxy2ytAsCGtlGU3aZQXw/rK2AeqXgyVr5Fu6f3XooQ?=
 =?us-ascii?Q?mOcIANplKfez8EFID9XUe2qjv6VY7kVt3jumrm8sXEv43gReRW2m/L8eyef9?=
 =?us-ascii?Q?UsWuiA+agHXejsZXqf2hs31YdORGgTjSNf6YLCkh/J6L0aONBsX3m+DCt7nY?=
 =?us-ascii?Q?3HZNgW86GzX96+DvvkhQzO99JaalyQi+A6oaAkQDYmkERT66Pel9f5Dvpjaj?=
 =?us-ascii?Q?iEAtMZa+3E1k9X91uDdN7wFjk3HAzwxJVO7+MFu3UdsbMF+EX5C2XlvsTtun?=
 =?us-ascii?Q?OOMQIRD3Dx4xwexO2T3SSjBFaZJe9+YWcl5UN/ElQRCWSwL+fdUZ9WvDckfb?=
 =?us-ascii?Q?fLadJTHLLCXnmlwlQFjn7oSaO7h/AkTIAJ7jdCwcRZGCvOFVNl1WActYv5ky?=
 =?us-ascii?Q?Fi55M+k8Iy+n3PlHRAaPwJ2khX10Dhr7Ulw4ogrSUSDDJl6kBJsgMpmVZ5a6?=
 =?us-ascii?Q?Ah3FyNQcd8NVcU2Ho6W+dDpLlZPvRw15s2tdoi8CGM2d4IMdMOjXUeOyGC/+?=
 =?us-ascii?Q?tCxSj+ZB4MxsQWA3tXZkQw7/mnT/1ZwjyoAK0PSSRgTi1Y5Nn/RD6lFVS3nJ?=
 =?us-ascii?Q?Aa0LwXqNDX+tPH3DoBTLgmjnvamqCM3oFnvBIn6A17Y/mykLXD8BQjWt/YLt?=
 =?us-ascii?Q?i6s/MVTZNcdX0OuJP/KQpUf18JsqPBoI9Irj6x8KpfoavoNY2K6EcG+B3ml7?=
 =?us-ascii?Q?emB52v76FTRWxqTmLcGjXumiPYeTqNQFaGgtGhLWKD7zahX2fNCj3VgR5a2T?=
 =?us-ascii?Q?iuVwfdkBP9gh+2EpsN/o4qDTYiCPWxxXDZhXmG/zbXzl20loi8hWQ5mNzGem?=
 =?us-ascii?Q?2GU2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 172222c9-91da-44ac-34ae-08d8bda9e5cd
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 01:14:27.8997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ymeK+xEF0eT5g7WwyZ1+LzsYK5QoegBCe+h+mPCBr91KOVfoiImByZt0FJ6sgi9GEFPePZxpBg4BNTQkzEAT7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7930
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

