Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794366940;
	b=TnfsdgLGIW1q1bjdY2RTj1lEo5EZVOcoDpe61ZhBWheven7FvaY/kary4DJBwKKTVLRk
	 SXQPE0Tr9lVuEJ5suFbfIiD0jgFSNWJb5twxitmKk0ycqAj+N7w0+zL6wogi/wGHFM6Yu
	 9T0/HFe48b0hEO5jT1wyGthsPENq76JEW2Sw6CbswfOajnXycxCxj4jcKgb94EOxfGK3r
	 LGqyxOOTTlS+waghwogSqjv8A7fe3toYv1ZvqB6VDpyHBskJsz0ZTWQzdekNQVcx7UjSa
	 2+xKOxB9PQUM8pYkfJ6gc+ubi+g2ZOmd8MOKaEC230U2lEGY5MyDPVoQjV4gUWhC3gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366940;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=YRxNZIaBemn2QemvvsR7a33X64l9Jopi13SI87mov2I=;
	b=o63SBbJPOB1O69meX+XjBHcezUPRstGTaQq8uNzuAxOq2wPoP4cwuqkboaE3ZUX6EFSj
	 VC22Xh+aQfhBz5+se9txuHkOxx6HXDqsPgjoWkR6Xh8YGpEyzRdPD2sW9rbgAjWaCpQn/
	 2u7oNRzZm+7bGKtHLElF1gvyFiZ2tHtNO6xIjzZBOCIH+WPTtzY10w97iSrS+qrmdu6cp
	 gn6SSVF2n3h1fMszUgjiHH7PrKFU6aagcKS5gxFh97E2kPrcP3MiQ+DrrBrYSb9gqERzW
	 pPhJiLd+IfUYftoyYr+Cl7z3Pjs+SmypCaBPre3oO7fjyJjaPNg7ekINOAGPxVKZD3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=wataFUmY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.10
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011010.outbound.protection.outlook.com [40.107.130.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4A260A260C;
	Wed, 11 Nov 2026 03:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE4A260A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=wataFUmY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g639Pqn9918iwb5GyqXnCpHmCgItWdTSbf/5ouuyGHLgk+PgNxomM0HgjWXoZJh/wLFAwWzabneEGIhksDVPoew/qRJrOJKr7/GQeWO9jzgq7gydSy1hDPq+58J2y8nnUB/7fdjlt0yosySw8biRqFoO6lUoRpr8aLI8MnnBLNQk1mJpnVDOFcw9mnXp9Q6lqmUIo7sqlViJz+8MQS/kp0mOBvCtLCMZ3UKgE5REqenJCF3qNfi0GCApYgIvq8/gi/AkUnGJQOZ18pu0H1VQpTpb3YFeYjpwB213mOCWvNUPpCVYxftZG9r5i5mAI2Iuy0wJwlq0R/eXvMcSnJhDKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRxNZIaBemn2QemvvsR7a33X64l9Jopi13SI87mov2I=;
 b=b6gJILB5Lkxazf0znAg/oRyBwRyyy7QrC92oq467d/6uHwRGoM4ezJyCGUCmISZvp5ZXCFh8YBOyMThgWBrn8wU+i7/l/XneJ33L9p0jVjkwlq7K9kB7RqLJVAcaYHeckK3xcXkUXTEKDUr1csKdOe2Qn1GlFWRkSSht+72fTZFhtOv5FUGwg7F3xtvkc26ZYWMaGdGf9rFaceISL+ziH0Isek86hsmJOYN9mPEHInfHYXBOoOlAmbunX/xuflH1l/zQXTbqbZ1wZ9mMXFomKhNGuMYo2z/CNU4AZQPsl2dIVf8gMa/b4AOPvNFrPKMciDHH5y7NHzMtsZn4dajBcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRxNZIaBemn2QemvvsR7a33X64l9Jopi13SI87mov2I=;
 b=wataFUmYYhiyu+GhV2s5/LpMlL938eSmU7cyIe3iNA59svDfSMO42EDCUXzS0a9QpwCQTCy+1IUi5nwp9A+exXtYW+zELPH/ufDNABsEKJjgovlaeDCDgbs/5f+m5vmHtfaBZjlMdfiFLXHYNLaLMDM9syAAnoOmPHbDmkA1a9veos0h9EXchFMMgCkvVZACzEvPuOT4Xzq/rLRdorvExnl/9AC5rjcQxauIQCA3ut7ppAYD/Q8Y5Bu65n4KZX58Z4/NO5ZjLK3vFhtN8lY5m8ctP/sKevZbBu+Aus81zsAxhRtVa6AqogReBPnc92tvYDx2vLNtKLWHybPcksbUOg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by GVXPR04MB10802.eurprd04.prod.outlook.com (2603:10a6:150:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 03:15:36 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 03:15:36 +0000
From: shengjiu.wang@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shengjiu.wang@nxp.com,
	daniel.baluta@nxp.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	p.zabel@pengutronix.de,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/5] remoteproc: imx_dsp_rproc: use reset controller for i.MX8ULP
Date: Wed, 11 Nov 2026 11:18:06 +0800
Message-Id: <20261111031808.570680-4-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>
References: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:194::21) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|GVXPR04MB10802:EE_
X-MS-Office365-Filtering-Correlation-Id: 40f73897-c6a7-4bc9-13ba-08df3fa20e2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|19092799006|921020|261028144727099003|11063799006|261026121527099003|261102123227099003|261022075727099003|261021123027099003|261021121427099003|56012099006|261009223027099003|261022105027099003|261026140227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	UQC9xo4v23YqAEIM2NzB6YFiWKEdceUMVbpwQ0loaJoU4uEo8X+65xqKfSXSt5L+KSQS76Z0PSFHaHR1VsYbli/fO6MTi19h+MT27xFF/59FXFNTgk4WPlre+NQ+4qcSoEDIruZvH0UPRAMqkps8rUyZaHca/oo3BamC+BXrSUlYQzWh8ebw9HfWGcyalxG4NXwxLRW7g1We07kfHkLQGFeLnsnLfGZAlqoidmqmHd00EGMAT1T3L9PZzeqKXQjtm0WrvWxNH5sn1hUMFY9CkhI2i71DMFPEH0PBCRvkIgQzdMn68msazw7ckyibrrUzAUgWh+xPO7gLPsFaCPRW7QxvhgDxWUfCIeO0zprTMgeO4lseDksL5TJfLM5UMsgZuMUd6iKJPlejq2ohnUYlVYT7pHiEo6K3njP2fXMpyIT7ceAT+uC3YDzvcIHx6TtC+bgHqCRopd6sSo4hasdPZTB4srLdniVSYLupWljtFeeB2wgECXX1I3m2S5ZaOL5PdWi0gDLBa6ththwAwkj2flzG344v1Ioy4pGyvVjVJlTNbY4NnLA90uFyNOd7bSwD/Kt+pfSonKvEXd2iuFjGy2h+pnku5oo/k2d212DtQSMAutjVyBazDdjXb5JF6Drp3PUcA39ifdOlRovy5QMEIjKAB4tnyxo4NXzjZJfJeFEMeWfJOXCtzQUs4YN/rHvQwsDozPLrVI7PbbZSLrIpTw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(19092799006)(921020)(261028144727099003)(11063799006)(261026121527099003)(261102123227099003)(261022075727099003)(261021123027099003)(261021121427099003)(56012099006)(261009223027099003)(261022105027099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0RowOxKQNlRdJo7GY6j2I5aPf9HWkGqzzvqxiZtm9RxDWJ+laFgJfDnEc3Ce?=
 =?us-ascii?Q?Oz6xjpDbxHWg27aYJr0DYJCCgfF252xJZZLLEtrpSWkmEbUKsefFGVFq5z+i?=
 =?us-ascii?Q?L6ed93iWae8HRnvOz9LkBP/MBlPJKN36XWiWSz6n6I0zcpLR7JQICxvf6rg7?=
 =?us-ascii?Q?P3OenPB8DFIjui3GjWIKpzZLte0Ud2sw3VgDO5SajAm/ao4xPZsOTJAAHYgW?=
 =?us-ascii?Q?rrvgCpEmEsXosZCTArXp6TNCPSaTwZv+iIAFKZMF6NUq/IzzMJWXHsOZiqjf?=
 =?us-ascii?Q?49Gu4KcQrV7HqCGO0nAJv80x9o2ttoTLl++VJDj518ndag7rMGp2vRHBdm9H?=
 =?us-ascii?Q?xxodMFnaZnjsetzZvUO/LuEnin+w1sEKSavB7rJSSMKlhnu6BAkVP7wk/Pc/?=
 =?us-ascii?Q?A7Mbd6ttYIu6+kkSrxVmXLQBYafHaICOyQ2LwowQcC8D9+1dW4eyd7Kjqc4v?=
 =?us-ascii?Q?4+W60Lt4uQh5+kGj7fx8dkPeYAC6h+g/7Mzr4rzXA4IeCHhEcA1OsS5br/h+?=
 =?us-ascii?Q?cutmYy8GNJc0Jrqip6xHqe2djmneMpXKUyD096VyoOQn0rmA0sEF1qCdzwAM?=
 =?us-ascii?Q?lwRZER8bdNKXrxldZhcJDUH8y72bPfCk+zZEul/gVHBjIqkwma9NXCCv6d4H?=
 =?us-ascii?Q?6Snq/YrwBifiu1f1HpGdtHzWUhxLdqUXVrZ9DzijciyYkcS7x+YBtXyupVWu?=
 =?us-ascii?Q?/pzGHK67g7J9cfUicxlj9BEkoVHrj5Is104Uk5MuZA0+k1F66g8N7qF4frpW?=
 =?us-ascii?Q?hBbZJF3xYfr3AO92hvoQilkVNayFJmQ7ax5NmDp9jz+1fdLR3uCxW+Zgjg1+?=
 =?us-ascii?Q?eonezDPUhkJqlHLOtk/J/Ey28szbsDTLzgTAIYBkcYbQE7aaY2Pgcz7D4zqB?=
 =?us-ascii?Q?Paq/+7+oN+yPEymYKM1igkQQsh75518+4pbEJn6vX7dvC6KIpKMSlzIeEUmE?=
 =?us-ascii?Q?cZiV7htGmh2FyvCjB8xybtr6XBalUB9xzihLoJAEdHAIu+fXSi2ky2OwyXc6?=
 =?us-ascii?Q?f8Asnc8baCNLVD8ux+neRnB0rQjOi6EN1qWrcjN0TbE3uExb1ex0jcar8wCS?=
 =?us-ascii?Q?KYS4veoanAAobcvRynNV1V0fkv7VF+mV6uc7ttmSnZvXaLGeZAzGc4eKZ1HV?=
 =?us-ascii?Q?34PfyoWDh6zK3gLsuZFNQ8mNfb4nJbWkNo9DD600CJ1iVkDM5xkB0RHiBqK3?=
 =?us-ascii?Q?i+ECK86J5TWjbqkDEAvw3zsItvcT/TkatJpP3dpjopqeassHvPd1Cvlh1i+9?=
 =?us-ascii?Q?7nBxllUOCVJplg7IOq+iKlvVA3xV+mkvtnfPuLUBoYFS9MPlGWS8SXkKUKtO?=
 =?us-ascii?Q?v3C7BgL8R36bqI1+YTvCME5idpBFcs8NymGLTQrxsAHxLCbEMxRZ4NFNzYAo?=
 =?us-ascii?Q?8KXrFgpU3ip7JY7WEmv9JjX5K2UGoREqtp8lrVEHCMJXj4svt8VzLCZOnleB?=
 =?us-ascii?Q?VC8U/gyJ+BjS8WSXOWAFZrCr+TiRpNQFDN4+wKuZnq8Nq2e4FV+P9ernnfV4?=
 =?us-ascii?Q?B+ImjtUguWHVMgKBqLASVDhzc2mLc9iUsoyK8q81nJyQKZIoxZPA7j6Kp3t/?=
 =?us-ascii?Q?k9ruEg78sG09h3jFn2UNxUNN11qvvIjaYCOQzaC7ovOEDr0J+/Cx0lu+NMw3?=
 =?us-ascii?Q?ILrER2QzuB/5FAv3toRvlTGlZ79YPkaje4zQbVJgUQCLylV8ZVaKgs3Zk9/7?=
 =?us-ascii?Q?MYgPSB2XWvTO/GlPUEb3Lyro5Mz+WEoATPJ/Owu+w4vtZeWbmb4qUJEnzSBU?=
 =?us-ascii?Q?+6ynC06Obw9B9KyFhETCxABvClYi+sgmJzwRakE18pBUaco1SxhV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f73897-c6a7-4bc9-13ba-08df3fa20e2a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 03:15:36.6113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4k/EgFLDpsjis414mlqIeW8e0U+6GgRiXp/rA124QJOXSq5U7sAPdYwONsNwK8Smr2XnR3goc29W6AYQEruk0Q813lRyJ90tUsY3ERhfAybgZDYY+G8Vb9so1bMuhtMc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10802

From: Shengjiu Wang <shengjiu.wang@nxp.com>

Add soft_rst and dbg_rst to struct imx_dsp_rproc for the softreset and
dbgreset controls defined in the DSP binding.

Update imx_dsp_rproc_reset_ctrl_detect_mode() to acquire the runstall,
softreset, and dbgreset controls. Acquire softreset and dbgreset as
optional since they are not provided by all supported DSP variants.

Update imx8ulp_dsp_reset() to use the reset controller API instead of
accessing the reset registers directly. This relies on the i.MX8ULP
SIM LPAV reset controller support added by commit 5aac7afc752b
("reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV").

Remove the MMIO reset handling, which is no longer used after switching
i.MX8ULP to the reset controller API.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 76 +++++++++---------------------
 1 file changed, 21 insertions(+), 55 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 96d619daf3f5..0b0042525ea2 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -108,8 +108,9 @@ enum imx_dsp_rp_mbox_messages {
 
 /**
  * struct imx_dsp_rproc - DSP remote processor state
- * @regmap: regmap handler
  * @run_stall: reset control handle used for Run/Stall operation
+ * @soft_rst: reset control handle used for DSP core reset
+ * @dbg_rst: reset control handle used for DSP debug logic
  * @rproc: rproc handler
  * @dsp_dcfg: device configuration pointer
  * @clks: clocks needed by this device
@@ -125,8 +126,9 @@ enum imx_dsp_rp_mbox_messages {
  * @flags: control flags
  */
 struct imx_dsp_rproc {
-	struct regmap				*regmap;
 	struct reset_control			*run_stall;
+	struct reset_control			*soft_rst;
+	struct reset_control			*dbg_rst;
 	struct rproc				*rproc;
 	const struct imx_dsp_rproc_dcfg		*dsp_dcfg;
 	struct clk_bulk_data			clks[DSP_RPROC_CLK_MAX];
@@ -243,20 +245,15 @@ static int imx8ulp_dsp_reset(struct imx_dsp_rproc *priv)
 	struct arm_smccc_res res;
 
 	/* Put DSP into reset and stall */
-	regmap_update_bits(priv->regmap, IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
-			   IMX8ULP_SYSCTRL0_DSP_RST, IMX8ULP_SYSCTRL0_DSP_RST);
-	regmap_update_bits(priv->regmap, IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
-			   IMX8ULP_SYSCTRL0_DSP_STALL,
-			   IMX8ULP_SYSCTRL0_DSP_STALL);
+	reset_control_assert(priv->soft_rst);
+	reset_control_assert(priv->run_stall);
 
 	/* Configure resources of DSP through TFA */
 	arm_smccc_smc(IMX8ULP_SIP_HIFI_XRDC, 0, 0, 0, 0, 0, 0, 0, &res);
 
 	/* Take the DSP out of reset and keep stalled for FW loading */
-	regmap_update_bits(priv->regmap, IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
-			   IMX8ULP_SYSCTRL0_DSP_RST, 0);
-	regmap_update_bits(priv->regmap, IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
-			   IMX8ULP_SYSCTRL0_DSP_DBG_RST, 0);
+	reset_control_deassert(priv->soft_rst);
+	reset_control_deassert(priv->dbg_rst);
 
 	return 0;
 }
@@ -338,14 +335,6 @@ static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
 	return RSC_HANDLED;
 }
 
-static int imx_dsp_rproc_mmio_start(struct rproc *rproc)
-{
-	struct imx_dsp_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dsp_dcfg->dcfg;
-
-	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
-}
-
 static int imx_dsp_rproc_reset_ctrl_start(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -391,14 +380,6 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 	return 0;
 }
 
-static int imx_dsp_rproc_mmio_stop(struct rproc *rproc)
-{
-	struct imx_dsp_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dsp_dcfg->dcfg;
-
-	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
-}
-
 static int imx_dsp_rproc_reset_ctrl_stop(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -1024,23 +1005,6 @@ static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
 	return devm_pm_domain_attach_list(dev, NULL, &priv->pd_list);
 }
 
-static int imx_dsp_rproc_mmio_detect_mode(struct rproc *rproc)
-{
-	struct imx_dsp_rproc *priv = rproc->priv;
-	struct device *dev = rproc->dev.parent;
-	struct regmap *regmap;
-
-	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,dsp-ctrl");
-	if (IS_ERR(regmap)) {
-		dev_err(dev, "failed to find syscon\n");
-		return PTR_ERR(regmap);
-	}
-
-	priv->regmap = regmap;
-
-	return 0;
-}
-
 static int imx_dsp_rproc_reset_ctrl_detect_mode(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -1052,6 +1016,18 @@ static int imx_dsp_rproc_reset_ctrl_detect_mode(struct rproc *rproc)
 		return PTR_ERR(priv->run_stall);
 	}
 
+	priv->soft_rst = devm_reset_control_get_optional_exclusive(dev, "softreset");
+	if (IS_ERR(priv->soft_rst)) {
+		dev_err(dev, "Failed to get DSP soft reset control\n");
+		return PTR_ERR(priv->soft_rst);
+	}
+
+	priv->dbg_rst = devm_reset_control_get_optional_exclusive(dev, "dbgreset");
+	if (IS_ERR(priv->dbg_rst)) {
+		dev_err(dev, "Failed to get DSP debug reset control\n");
+		return PTR_ERR(priv->dbg_rst);
+	}
+
 	return 0;
 }
 
@@ -1316,12 +1292,6 @@ static const struct dev_pm_ops imx_dsp_rproc_pm_ops = {
 	RUNTIME_PM_OPS(imx_dsp_runtime_suspend, imx_dsp_runtime_resume, NULL)
 };
 
-static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_mmio = {
-	.start		= imx_dsp_rproc_mmio_start,
-	.stop		= imx_dsp_rproc_mmio_stop,
-	.detect_mode	= imx_dsp_rproc_mmio_detect_mode,
-};
-
 static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_reset_ctrl = {
 	.start		= imx_dsp_rproc_reset_ctrl_start,
 	.stop		= imx_dsp_rproc_reset_ctrl_stop,
@@ -1348,13 +1318,9 @@ static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8mp = {
 
 /* Specific configuration for i.MX8ULP */
 static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8ulp = {
-	.src_reg	= IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
-	.src_mask	= IMX8ULP_SYSCTRL0_DSP_STALL,
-	.src_start	= 0,
-	.src_stop	= IMX8ULP_SYSCTRL0_DSP_STALL,
 	.att		= imx_dsp_rproc_att_imx8ulp,
 	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8ulp),
-	.ops		= &imx_dsp_rproc_ops_mmio,
+	.ops		= &imx_dsp_rproc_ops_reset_ctrl,
 };
 
 static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8ulp = {
-- 
2.34.1

