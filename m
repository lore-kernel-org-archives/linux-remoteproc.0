Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012025.outbound.protection.outlook.com [52.101.66.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B921631AF24;
	Mon, 27 Apr 2026 02:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777257566; cv=fail; b=dKatVxA/eKaw5isJhMKjM5VXskX/q3YX30EimeqqbrMPUbBMo4mIQggIg2a4onwfgnfMfugRnqSmqy/BHu8eCNlnJPIwQmP7XENssegthAdqbGLhKjsaf4L66WuNSbXOYHpvVmHfp/SZyc9bLvAt2rva0usDMuq2+ZpyyWd0IkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777257566; c=relaxed/simple;
	bh=E1r78FGCffhxKtzwSDwMWoPhAqxux8ICoH6DbUyuxq8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pvaA26obsq1XR+XJnq4MS/7CHbJue7vDxzjGJOaVSMIgAPVTH1rSh0+JzVDHNrIR4Oj4b4wCifX0lZ/YBe+2LS0bAa9GaItwDDyYNYtUv2nHoTWW7C7A2f0Cm5ZfleBbE4VNEkE2GWhYLsnwda03n937bdnyY7zTEIMrDggByDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hQBadcUS; arc=fail smtp.client-ip=52.101.66.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hQBadcUS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKI8Dk16bGnmtjoif4jUytqzxEy8NSvLurla3IOY4YAHMK3gTR4O0mnuJIsv7M4yTuAPQnoXrk0zYHJMVw2VIJn6YVEvMK+7ZcDCWSJa5HHqIrayMWD2LOkiblrvqCwQ7E/MrofxaY827dXN7YPeWqMVUFdXLHo8/EUGeaCXzynEyvi8sH+zgYcMxq/HaSYgkbmuQTnS9cn3sbuXt1DsupNTeT4GgYZUiGVLk1JYOUbz1c/0UDyJ9ud6iTb9BtaM7kwYUQur7/4pCkkEjRC9HOny2FjXx3X58Hc30knkpK18awoFwJ3+Ny4edzjdwMeYeAIsWq28/opa0hDGsl/n6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2lOj1TiAB+IECxQIK3KIE2mANkk6opapyi/KH+DzuI=;
 b=No2z+0lK1utJpXxoRHoYSBtLHlRwtiRbgJRfqbrMvjP47OXFTaFdfoQC9m+YD2N5nzvnRi9+09bDEt61hizK63Vd5Fak2JSyiOwwXuxaN5o6ZlWQrdeoinEZk4HZdloFEUO9i/yK5kHdl/XM8ZYU+IPyYR/5DfjCZdJUN6Mpbcc1Hs4RwHhNnar1l4jwb2rjBgXFpk8rhTrZUZzu/SbivVH3RG1dRRFSkxPd8muxzNgmxd0Y7ahy5s+y69hfM5c3ZItLpefriKELudYizD77i9sjyUFLQR4uGZ4g6pLtFdSY/Qpf0kDMgsX7jR0vfZcQ4NHVCj0nyYows4Co8I4MQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2lOj1TiAB+IECxQIK3KIE2mANkk6opapyi/KH+DzuI=;
 b=hQBadcUSP997hCVEOdQkn1p8YAScI/rXT5QikguBmAOJfneKXduRr0a5lxB9NsGD/duAGaXOZzKUgLIE2jbAc3INJkJOSn+IDJHBb8Fx7KOqhv72Pxh2w1Nxd4jIPg1m1EiSoZ/icNEL6GgU50eWdbuOHj5Wivya1q7f7LMZVVvj/mncw3XEoqd59kIJ1uZb8z224rwSEJwL15q3J30KiWkSyohSbd9dRRjYLo0VPrTOYD5xw6LYvC5pmEheSyOu2OnrYk11jpyS9K++9QdSLorgOy0lyeys8iPjC2let2bfhQLViIZd8sN/A9pzAOL0HopX5LgQynsAQc+Kzcf7lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10793.eurprd04.prod.outlook.com (2603:10a6:102:485::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 02:39:22 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%4]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 02:39:22 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 27 Apr 2026 10:41:25 +0800
Subject: [PATCH v4 2/3] remoteproc: imx_rproc: Program non-zero SM CPU/LMM
 reset vector
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-imx943-rproc-v4-2-68d7c7253acd@nxp.com>
References: <20260427-imx943-rproc-v4-0-68d7c7253acd@nxp.com>
In-Reply-To: <20260427-imx943-rproc-v4-0-68d7c7253acd@nxp.com>
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
X-ClientProxiedBy: MAXP287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::23) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10793:EE_
X-MS-Office365-Filtering-Correlation-Id: 182188c9-dcc2-4c6d-c639-08dea4063038
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|52116014|376014|366016|1800799024|921020|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	6TlhmmCbnPYCZB92nkHHkkmW0bklWSQG6iNVVAGBwijkhEIlP8oTZhDNhz2Dhjb+YuaF70zoCfW4D28sgqjyrdO0/pCTiSfCBdPJj+rDJAC1xiosf9sXAffznCFFoDg+8jj6lE+ac8HpUzAF4yS0zLqq/l7nYE3lu3z/u2+jl44B3NpTIHtO2HjBedI7sczQp6/EH3eqkLmDkHLwTJPno9unsdKUgI/THj1va7x3srZlCsY+ygXVq9mDEcuYxS8cv8AW+8SZHnAgdMK1Z5NCJIWn4QzECrOt2MJtv5yObxBhgrKJ9eeC89K5D1Mt/+JTG1Zyvn6x3eqGwJuPc/fXzxlUFSRWZrCr/NoYPSygaJHqj/DiGtU53xwkiLEwu/WUnfYSeojWv4Nn0O8xdGlXpZ+Nx2dgCXo1V5EkI+L9uZJKJgo7fDFWP8J/V/EK24WFnDwwhepZ6FUFLsAUJZ0LEeCY7wHnNGcftqszgTvrkIjyXIJhVc3yW+MHL+GuSvP4UZ5oCmyT66yb4+gNcBXoEiWHEFfs2K1x76Ir3kBhQUmJa45Bcf7zfj8+L7u3WC/nDAI6y/XV593J4VjFk9Bf9bW/EKHEzQKJkZDvjY62ETGIcMWhOoAF7NiZJSB40dDqLMF8ED4cE9jarg2PTwtJfOW1ZmrIzesEMAzQmwfLWjKXQAsPW0tUWFk1oBNxCOOrt3jHmH+1aX+JkOvi6Fj3psxDdZePyKsOL9vca7ulfqAQvekeNqSPFtkpg4h6xDL+34UKPKkQcwY2TvwnVnRwe5GASvOpeaUQDW3W6J1FkOFl+vTDgjRiADcHOEz+VUbV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWUzWFVtbDByeWp0UVlNaVB0eUh6OGlwNXVMNXAvVXlISloybDJpUnFiNGtT?=
 =?utf-8?B?aGx6UHN5b0wvUFd1VHhBZ0hKQmhGVHZMV0FPeEJ3RUwxZXdpSERjb1gyc2xv?=
 =?utf-8?B?aUV0QzNYRWZtWkNTTmpSZFVBZ25uMVlTN0NGK0FJaWYwUnpiK1VaamtIT0pJ?=
 =?utf-8?B?ZXBkTlhnVUF5bFJjWUJnamlocHVEZ3BkdlRsWEZ5eGVhY0VpRVVrV0svdFlk?=
 =?utf-8?B?S1BJYmRzdHNwa291SzlQTFh6VWdNdXNQZGFKajZjNmpYZmNsL09TbXRWb0FG?=
 =?utf-8?B?emR4aDJnRWg2OGNrVE8zRjBXUVFxcFY4NWRKbjhlUjNqOVEvOHZndHQ3Q0JL?=
 =?utf-8?B?aUYvZktsL1c4dTkvZTVxbHdiSjVnRkxsYTU2VDN5QWpseFVPcjRBZCtJcy9x?=
 =?utf-8?B?VVZCQit4eVIrQzFpSEZiOFdzRHBxY2NlMmVTSVFxYkM4ajhXbm5MZkVGblpE?=
 =?utf-8?B?by94YXlpUnhWUWV1SzNyMXJFem8yZGZZNDIySWZmZjUrcThyZVc0UUZRcGJP?=
 =?utf-8?B?YmEweFNaNDI5RncyS0k4c1d0NGFzOGJpM01WUDhGcTN0ZmFMR1dZNCtET01R?=
 =?utf-8?B?S0tldERHL3lSa3J2TThsYTZjRWZwUXlhODl3RnhmWEttdWkxcDNpWGpvRW1Y?=
 =?utf-8?B?MkhrdHBiK1o5UXJpUGl1aUc1eHZpdldUckptOTZRRzh4QkNFMmc0TkdjL21l?=
 =?utf-8?B?Z1I2NlQvZXhjVXcyRkEyczhNeUNabmRqcUIvK2c0SXg4ZVBBS3B6aFc5Zjhm?=
 =?utf-8?B?MWZrdmo1QlNQT1NRRExlc3lqcGFWbytuamlIUVJxWDdPZTJ6a1JaZUVzSVdm?=
 =?utf-8?B?QkFYbjRLUWxueHNHYk5Wb0dmQW5ZVEtjdlNLQ0NLUVFTQjQ5UFhOQ0ZQSjNp?=
 =?utf-8?B?bFg3VlJENnRkdnUrRnJ4NHNpTzZ6b0RuaUFaZitaSURpU0NBRGxhdnNVT2Yv?=
 =?utf-8?B?bUhlRXZ0L3M5ZVdxYUx2ZTZEeFRjYjZBQnFpUm1jamlvUmZiOVdJOVl6WHN1?=
 =?utf-8?B?dHhFRnM3Rk92Tit4a0NEUEY1NWJhWkswaHBmTGtSTi9McDV0OGtSQWZZRmpm?=
 =?utf-8?B?RXc1M2w2V1NFWFFJaU9iaG5jRnNPeE1HOE9UNFM1T09wVG0wOWlFVFdpajdy?=
 =?utf-8?B?eHNJYjQ0VnVXTFllOGhhdzZmaVJPOUhxR00vcDR0cFovazdMZmNrdGVjZ0w3?=
 =?utf-8?B?SDlUU2o1NkdFSXZROXBSL3NPNE5zS2RrQTVjcHRRcldXdkNQcXY0dEhNRVI5?=
 =?utf-8?B?RzVZQTNoaFEyelRKaGlxeFNDb0lNS2EyRVRhc2ljbWp2RmtVWlAxOFRSRndH?=
 =?utf-8?B?bXB3bms1UkRwZEFicDJ0NThaYWowYU41bXY5aXA1WkcwUFViOXdKQ29VUkZN?=
 =?utf-8?B?Vk1kcVh5Z3A0WjhveFU0S0I1S0pqTDVWS3AvZFJGRWdHQmFJZTJCalVHSytX?=
 =?utf-8?B?SkZldCtqb3hJZnJnUmFuMUMzVHY1blhZN3dIdzJGcVVaakhuc3F2UjhxbWRR?=
 =?utf-8?B?ZS9qbDR3WWtzMlFFWkUzNUhRcFN5emJSOFJTRmJ4MUNoTFFZemtOWURqYlp4?=
 =?utf-8?B?WEU1eDVCS3hNSGJBcVNZR2c1bE04ZUxaM2dtR1VtRHJsTG5hNlpVL1pFZTEx?=
 =?utf-8?B?ekFqdHk4eE5nNHpCUHY3em1pdGNBbHhlY3V0SldpNk9paUdjVU9YcVNmbDJp?=
 =?utf-8?B?YXhkL0ExRmlxRmxxRFFtUW9LSnVNaVNtSDFhRzNack9CcmtnMXpZTjQ4NGRE?=
 =?utf-8?B?ekExVVF2aFQyUnFHak04ZGFJemlqL01Tc1FocmtMNTl5Tm9sZXV0eW1Nd2x4?=
 =?utf-8?B?emZrUThuSTN3bkk2L01XSWNkL1hPZE5vdFMvMDBUR3dqNGNTYm5uSWlsckZk?=
 =?utf-8?B?QlVYV201RElJOVozWE16d1hWWXlKN0Y2czNMMmR6QzhTNW0xSmF6ZHRTTGJ0?=
 =?utf-8?B?dDBncUhYOTd5OGlhQ0RNemsreWMvTnQwd0R3MTE2M0pxV0NjZGxWdVZ4MmtF?=
 =?utf-8?B?OCtRcmtxUjFLSHRvbDNCZFlRdU8yYjRsQXQ5Y0FjelRyM1k5anM5Q1dpSThI?=
 =?utf-8?B?RTVkYkE2bmRCZ1EzRnBUUlNZSm5ocFJhTHBHaFhVN0NaRk1sN3Q2S3hRNGoy?=
 =?utf-8?B?MWJoSlpka1JsM2syNmZEaGMvY3Z5eDlqTGQ2WHlTL3p0ZzN6Y0ZFUnVGUDky?=
 =?utf-8?B?UVZ1WTRRajRlTkhqNUJreWY0dkVPSEVPWDNyQVdxeGRIL3VUNmp0UGdJTU16?=
 =?utf-8?B?Wi9lTkMraTVwOW9TL3YxZEVSa0VGbkFQYXowN3JibDNta0xtZ1lDNUVsdmd2?=
 =?utf-8?B?ZVE2dnNqOWM4SHpWU0FPYlU2VHhxU0xCcG1QMXlwcjhJdmVyWkxLQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 182188c9-dcc2-4c6d-c639-08dea4063038
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 02:39:22.0811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BHi+zhr3A/4126S/AXNVNcXfrbyVsn94QJ1Egw8OcbwKD6CoFioLv8hjoMRnai/xduV7xE7yT+y2LbkzxwjTvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10793

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

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
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

