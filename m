Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011007.outbound.protection.outlook.com [52.101.65.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED562F8BC3;
	Wed, 15 Apr 2026 07:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776239340; cv=fail; b=G5EzkK8sW2LgESxxaFBJ423oqwvTbmnxE1f1t5pG4SbC2YFnMrLH8ckECv39Cx7/1+A4NF2W65F6+aEV99JHdL+duRkMK6I1tDCJobiMNM7gZUP2S1I+cCzthfAl+v1byjkQk9fuQMoijCDz1Dkhxmdve1ZBfUcfsx56gxwSJzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776239340; c=relaxed/simple;
	bh=P1e+giHusYeXrP85GAp27JYNFcJKYgFLPPt8QmI3OdI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IKh2+PqTxdbLoRzyo1HhrYfAebRSSoHtNxfSzic5Q+kkiWbOkaSbFOjnNo85pc4oaPuzeYRsXmp1fZ2zafdB3rQwAeXEylpliCsqaedgSeyf08EakgkOfbFyxnJjNnK0dg7vEZB/2P8UeWPyN8emffMJ4HXFmopvqK9dv6Ftwto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=riKzO/nD; arc=fail smtp.client-ip=52.101.65.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="riKzO/nD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XKgc+A7XeFmMlp4xhkkdYOfnC5DT2c/bgYlRzV8GC1QepwDQXuWHu1LRDlEAameYtUf37QkCAVzw7zde89bAVX/LEvvbNzfaWyUKqWaX2GwA6nXT3/V2JN875UgYaUOmJFpGy9wCCsvgpVopk7UjOlhqseP8CcpjZI4efMEaSeNl0SmASSwfsb1A8NiWdbbPO6mx8TCDPgxt8LHREaPB4EqGdk7SPLC+VbuK64bcDEPcWA/LoEzMU5OAIl7GtnPhnnRjl2F3sSJ9a2NRorCIYu3ZGbTM8x3/C07WxxcVPKb7p/zKKYLzs8/xGexQDBjYSjnfllh1kCYMvparodkBVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEsTBtcjqyy5upITO4iFTnwHGzfZ09IcDvDM0btHkZc=;
 b=mdpcynCxiJtm29TJIUi8W3nFz181SKLEYck4y9vS2DuPM8or/LBM885PQsTmlt3cevh8EJLm1xkR/uH9ybJruCFNEdAYCiumRCEB1hF9x1koHkejT11OH6vUBV8CjAy5SLUuJEare7/7UHKfe8O2ZgWTRjxOlbDqxmC3nSNzxNoHia6j47WD3mqEWNMz9AUDuraR+1fTrSLpBHwCqpSe9fn8VDhXHKEnLprRpIuXIXS2rceOKw3QvVHYs7q8cP6FBsAoIQlqJ7r2BS4yTfnpAub70b5JgkFI1XZGwub3054WwiDQABI7UvS7ePUOqisCOL4R+6+P5JkSwDWJ9n3naA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEsTBtcjqyy5upITO4iFTnwHGzfZ09IcDvDM0btHkZc=;
 b=riKzO/nDlVF8uQtvwPZQyr9kOL2HPpt3M3C4aL+CJHj6XgilmuiyBh0+ALVLvV8Ustaz3NzDys4BJJpfbpHqiCq5DJPH1q69+mQ4ZpG6RLtbt13iDaRcKH2/tu8eGivYGpaYn0KqRSN0HqwTLgNzr7c4HHKs/r1mHCXBFlYxx2iapLU92WH9I/Hck5P2TScJ61FXgI1g9pKikBiK4awQY/eQ2Fewyh9n9h/u1hBRClYZyv192r5+xzGokMYHyLjEkhKJun/b6/Y2u0ptTRqJJgV1qemv/lWHXY2qDtoTd/UEPZhvwHVgD39+XLvthX8ySNHIwJqwG5oDt1mutc2tkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AM9PR04MB7634.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 07:48:51 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af%6]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 07:48:51 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Apr 2026 15:50:39 +0800
Subject: [PATCH v3 2/3] remoteproc: imx_rproc: Program non-zero SM CPU/LMM
 reset vector
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-imx943-rproc-v3-2-9fa7528db8ca@nxp.com>
References: <20260415-imx943-rproc-v3-0-9fa7528db8ca@nxp.com>
In-Reply-To: <20260415-imx943-rproc-v3-0-9fa7528db8ca@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0002.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::16) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AM9PR04MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a66797e-58de-46b4-994f-08de9ac36f37
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|52116014|376014|921020|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VqQCel/17MsaiSnuIwQz/796fDhQlg1vpUSI/nNB1/VHnh5u1FNHDiTaUjY96DMIQ6U5HKzySoKsFhG6W+hc5Ws6VAK2gm6+MLhC+eVTTrjtSfgNMI0IeE20cA270ifqHu6noJgywPKPGGUwfRA297QaElmPr5xcvaUX97Cj2f/ct2zQtVX/94XBFzcfS9S8eN+jTa8bzFbyQVhAcMVbHsOhbgr/4D6iXPBZHdOWvb2X0/QfqVFqrnXwtft2LE7Z06XadYoaGnWL9xNhJydh3k/hwQLFAA4JgNwFL2XVlAL69E1FbeCtfRiIVHfZ3e6IDQQbiFJZ+drBk9LZ5L6GdbEVJl05XrU/8r1F6HqOcrkHO7HFzP6aCZtkzwLO0SNnKuc80ws/C4BupH0PuaJPfc2j8Sih7mC1FtGjNmAblYbHXJUQEdxyMYSek4f4XBqT0rcyZ7SP236ljOUFE9t1+GyEDN+1s6s4LDmTlGCCauQPvOGn8RzbGyeT+f8ojkksaDmkeAbk8XeCTEA1J+xGkOH5NiOFhrLd/FTQ+NNGpK+DrDhMdwy1jOMiQ79yVrJYHbxdBn4ZtzEROpUwD970RehsHV8Hz+JntpRPSwEBeBdOCEZ98NV+0d3I52suBEOdZLhsKc93I9NR39OUhoZRDj/bZ3PsQS0mQn+H2Sqo94CsRMYtsRDPxJkMeCJweO+lPnuuQZUqryYoa3UL5DD9ihTgkU7fGM6IOEUUjaaipJxRtZklf7JJwAEsrPTftJAPqOu50Y20UTzYg4nl6LlcB/JuS7CMJbbxH4npL/fE2uuzF4rap2esKx7O3pFLoDth
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(52116014)(376014)(921020)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVpWUnZvMFRZR2cvK0w0ZWJSQXllWE1TYllyZjUxSTB6dEFBdnJBb214UCt5?=
 =?utf-8?B?aHhTV1VIZWJscjlLTVpIR0VxWVRNUUVLSzNVZG1BNjFnYzhCcUtGSFpOT0t0?=
 =?utf-8?B?U0g4NHAyTDdpUGVMWmlhL3R1QVNZaVJJWE1MaWVXd2Z0KytlOGplOEhoQzMv?=
 =?utf-8?B?NmdFZkFqQVUzRnpRVjkvL29oWEpyblRGTmdvbkFETThZNEVrZEMzUm40MzZh?=
 =?utf-8?B?MFI5UG1GWGZZY0J0aWRIcXU3aTZFdzNXVkFLdDlFR1ArMy9RMGJHWkpZcEtF?=
 =?utf-8?B?UEN5Wmx3bnZCa3oxWEZ6Wkg1VVVmNmZrYzV3bjEvbkVnb1BEdndsaGhMUWdY?=
 =?utf-8?B?RVE4RUFQRUR5ZmhhTTNNUWh5RTRlQlR6a2NXaWF0SHZNQUt6S2VLQ3JWRjNl?=
 =?utf-8?B?UlE4VEFYSllES2MzaHE0MVlFZFk5R3o0WEYzekdOMzlzY2gwWTVzNHRhMTN0?=
 =?utf-8?B?YUNINm9Zay8rVkR6dWNwN1FaWGRsckkwbXNTRDg3d0o3R1Nid2syWHBtN2FU?=
 =?utf-8?B?dWRKTFVNR2xuYk5mT2xhZnNKNVpnZ2J5dVhINno0QXEyNXVoZUJUMXBiRk1Q?=
 =?utf-8?B?ZDVveGMyQkFndDR3ZEpEejNnYlVYdW00Nmh4WXlRd1FhTlFDOUlHY09oZGF5?=
 =?utf-8?B?VDNDWHBsamJZRW5TWUlLRm1BZ2VhUzNGemxUcEJuTVpOQzd1b0o0bWRXNTBV?=
 =?utf-8?B?aGhQdGJxQkQvcW04QWR4bU90VEM3OFQ1aS9HMjNkbFlIMERGWllieVlVRXNQ?=
 =?utf-8?B?Wjc0SzNWcENXQ01FV2VpUzlNREFyeVpFaXM2Q1JjbHh6NVpUcTc4amJVcmRS?=
 =?utf-8?B?RURrUFFrazJyNmNPSHlrcFg3Si91UVpnd3pwakJYWEowdC9FSFJBSUVNSVpX?=
 =?utf-8?B?RG9QS29wSGtZQWhwbHJMaDRnZE80TnpYazlSR05Iczd4eFRaY1dNbzFKQWhn?=
 =?utf-8?B?UXFBSXFqc2l3Mkx6Q0EzbTdndXRBdDJpcXppQXBkSWVGdmpyNHNWSU9TSlF2?=
 =?utf-8?B?Rms0MXUrWXF3ZHpOaDFEUmVVRkN6YW9TV21oNHdPdnVFUDMzVmdmZzZPRmx2?=
 =?utf-8?B?OWJHcUxuTTdPUzVObmV6TGM2UkRtSmhhM2lqR0xUQVVVQkdpQ0xVbllMVGFD?=
 =?utf-8?B?eE5lamU3eWVtZGxMQnFYQlVIVCtscVZ5UndOK3Q0bzBvNys3UjhvMXZiOGRU?=
 =?utf-8?B?ajRNaGp0U3hoUGVRNkFSbXhTRkh2cjkvU0VyT0c3YmV6SVd2MVI4a00vMWFX?=
 =?utf-8?B?RjNUUnpZNVdlR3Q0QkhRTG5veHNHODdZa09UL2RwMmhDbFl0OWhYaWpvMml6?=
 =?utf-8?B?bjNkaDJMTkYyZVU4bVJPU0JvM1JYMVVTUHFHbU1zWFFBY0NXQkpnd2pYNzJS?=
 =?utf-8?B?aWlKeTlQb0ZzcjJlRFAzOHdrMC92Uzh0RHF6Z0JPd1JpSDJCS1BTM2hLT0Qx?=
 =?utf-8?B?NUgrV3hHdzliK1NhTi9rSWI4Z25WSXZVQ1VlcnRBeHJGZStTdWlUWC9HTmlU?=
 =?utf-8?B?V1RqZUZYM0M5ckRja2ppV3BqTHFlVk8rYWtocU84eWgzelRwYy9MMEthZnl0?=
 =?utf-8?B?bzlFVjdPYzAvS0JYaGI3KzNZN0tSQ0RZSmNaWityalJDN0NPWGFLcDhEV0s2?=
 =?utf-8?B?d0RnZFpvemR2QTBoRkwxUGxDSStXUnI5bjh1Q2JvWWpMVm5LcXVoL2tNeXBM?=
 =?utf-8?B?OHFXZ0h2ZEJXdUhpZ3R2WjYzdmRwTmc0aU9QclJXUHE1cngvYmNtMjlKWTZK?=
 =?utf-8?B?NTdLdU5CaW9JVWExOXVUbEQwMjlJSk9DbVNBZFpmc0xCbElOQWN4eXRPM3gv?=
 =?utf-8?B?SituUGg0OUpMcmN2NXhFU3NjcWVadWtYZ1ZuUzZMMGhGQ3RBV0NJWGRRRmMy?=
 =?utf-8?B?SitvVnJkVVJQVEwrZzlCMFIwUkp3dmZzUHZPOE53WlBaWW85YWxvaXZReTN5?=
 =?utf-8?B?SWdLekJRUy9KRDdzNDZXc3lyNkRjVHRXMFBQYVJKZXBFWGk2L3BBM0F3dXJR?=
 =?utf-8?B?b0lwSGhVK0tkdEI4WVBhLzUvRkd5YUJiY2JaaGM3aVh6M3FWMTdpRTZBSFYw?=
 =?utf-8?B?Tk9hMkpycFB1SVRTNFcyM3hZMy9Wbk1NQTNMaTdLMWRPSC9OY0dWUzF3MURV?=
 =?utf-8?B?aXRXRlVzWHd5MDBSUnFBQUplUUVxMDZDOWxLWHAyYWJzaFRveENVVTRUQkxy?=
 =?utf-8?B?YlRzOENPTzNTNXZOSzFtMWhrZVUxQVpUY0UvNVprOVRtWHRvK3U0VnZuTXVs?=
 =?utf-8?B?WGMyM1JkY3RNZ3VqSjdlZy92WURWa0Y1Mk5Vd1ZHRTh3QTVSbTh0RHRtbEdJ?=
 =?utf-8?B?cDk2R3Y1VEZPMUdwOTQrSHpqNVNWYi9meDVLMmN0MGtQT09kQjZEQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a66797e-58de-46b4-994f-08de9ac36f37
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 07:48:51.1494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yg3PZcE9KAJUIDHZPTumHyIeAU5mXQII14xQHk2AWlE1zxYEqyzVzBzd2uQ7wp+u8E+UzcX46cKtJXmZYE/Xww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7634

From: Peng Fan <peng.fan@nxp.com>

Cortex-M[7,33] processors use a fixed reset vector table format:

  0x00  Initial SP value
  0x04  Reset vector
  0x08  NMI
  0x0C  ...
  ...
  IRQ[n]

In ELF images, the corresponding layout is:

reset_vectors:  --> hardware reset address
        .word __stack_end__
        .word Reset_Handler
        .word NMI_Handler
        .word HardFault_Handler
        ...
        .word UART_IRQHandler
        .word SPI_IRQHandler
        ...

Reset_Handler:  --> ELF entry point address
        ...

The hardware fetches the first two words from reset_vectors and populates
SP with __stack_end__ and PC with Reset_Handler. Execution proceeds from
Reset_Handler.

However, the ELF entry point does not always match the hardware reset
address. For example, on i.MX94 CM33S:

  ELF entry point:     0x0ffc211d
  hardware reset base: 0x0ffc0000 (default reset value, sw programmable)

Current driver always programs the reset vector as 0. But i.MX94 CM33S's
default reset base is 0x0ffc0000, so the correct reset vector must be
passed to the SM API; otherwise the M33 Sync core cannot boot successfully.

rproc_elf_get_boot_addr() returns the ELF entry point, which is not the
hardware reset vector address. Fix the issue by deriving the hardware reset
vector locally using a SoC-specific mask:

  reset_vector = rproc->bootaddr & reset_vector_mask

The ELF entry point semantics remain unchanged. The masking is applied only
at the point where the SM reset vector is programmed.

Add reset_vector_mask = GENMASK_U32(31, 16) to the i.MX95 M7 configuration
so the hardware reset vector is derived correctly. Without this mask, the
SM reset vector would be programmed with an unaligned ELF entry point and
the M7 core would fail to boot.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 27 +++++++++++++++++++++++++--
 drivers/remoteproc/imx_rproc.h |  2 ++
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 0dd80e688b0ea3df4c66e5726884dc86c8a5a881..c21782be4bb69d830479f538a091bda48b740ca4 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -339,13 +339,32 @@ static int imx_rproc_scu_api_start(struct rproc *rproc)
 	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
 }
 
+static u64 imx_rproc_sm_get_reset_vector(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	u32 reset_vector_mask = priv->dcfg->reset_vector_mask ?: GENMASK(31, 0);
+
+	/*
+	 * The hardware fetches the first two words from reset_vectors
+	 * (hardware reset address) and populates SP and PC using the first
+	 * two words. Execution proceeds from PC. The ELF entry point does
+	 * not always match the hardware reset address.
+	 * To derive the correct hardware reset address, the lower address
+	 * bits must be masked off before programming the reset vector.
+	 */
+	return rproc->bootaddr & reset_vector_mask;
+}
+
 static int imx_rproc_sm_cpu_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	u64 reset_vector;
 	int ret;
 
-	ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
+	reset_vector = imx_rproc_sm_get_reset_vector(rproc);
+
+	ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, reset_vector, true, false, false);
 	if (ret) {
 		dev_err(priv->dev, "Failed to set reset vector cpuid(%u): %d\n", dcfg->cpuid, ret);
 		return ret;
@@ -359,13 +378,16 @@ static int imx_rproc_sm_lmm_start(struct rproc *rproc)
 	struct imx_rproc *priv = rproc->priv;
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
+	u64 reset_vector;
 	int ret;
 
+	reset_vector = imx_rproc_sm_get_reset_vector(rproc);
+
 	/*
 	 * If the remoteproc core can't start the M7, it will already be
 	 * handled in imx_rproc_sm_lmm_prepare().
 	 */
-	ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
+	ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, reset_vector);
 	if (ret) {
 		dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
 			dcfg->lmid, dcfg->cpuid, ret);
@@ -1462,6 +1484,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 = {
 	/* Must align with System Manager Firmware */
 	.cpuid		= 1, /* Use 1 as cpu id for M7 core */
 	.lmid		= 1, /* Use 1 as Logical Machine ID where M7 resides */
+	.reset_vector_mask = GENMASK_U32(31, 16),
 };
 
 static const struct of_device_id imx_rproc_of_match[] = {
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index d37e6f90548cec727b4aeb874680b42af85bdbb4..0d7d48352a1091ad24e8e083172ce6da6d26ae10 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -41,6 +41,8 @@ struct imx_rproc_dcfg {
 	/* For System Manager(SM) based SoCs */
 	u32				cpuid; /* ID of the remote core */
 	u32				lmid;  /* ID of the Logcial Machine */
+	/* reset_vector = elf_entry_addr & reset_vector_mask */
+	u32				reset_vector_mask;
 };
 
 #endif /* _IMX_RPROC_H */

-- 
2.37.1

