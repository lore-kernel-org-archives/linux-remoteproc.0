Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011005.outbound.protection.outlook.com [52.101.70.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF802D3EEA;
	Fri, 27 Mar 2026 02:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774579246; cv=fail; b=kAyHjDipMSb560LMhcfrb054IYaH9v7QhNVfG4Fv+A0673mxprBa4HlTuq5RnEn5Y7PjR1zcwAMJTWNd191tUwLomXwM6Jb7tde7hWgIUMgGuC+7NvL4ZDXAc9fdkk6B4qil7uS61I5F3M48DZYV7GfeDXF0tcn0UMPBZWxqNQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774579246; c=relaxed/simple;
	bh=mFSaO9fhTeT3b/cICef6uaxxdaEZmTUjy3X2VsYy+JA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IUXO7IzCoKDYOAsSvx+PuyKWRliPQlRuFaA1uphJToyefLTXkxT/X3IoYfHXq0OaZ3JQWzwYjsM6kvIEDhdRCyGOd1HDq2UKehYfJJi+tbonQy96Hj3NdM7q6oJv0uV18SHoBSC3ViiInqFEB3KLhIM/NoIpQti7UTnpJZI2gs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nSyVnJvq; arc=fail smtp.client-ip=52.101.70.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nSyVnJvq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDM0qZjbWJU1jpRyXijKtu4WObKEnStRjnV4I9AWthWIA28Vin/vDu33f7r7jedKNnNPAofGU4kvXfd/ln5Quu1DXEg4+bdWML4iVLiTlA2W9Wgxd4kIkoOMcTuhqkFXYWY9GDRq6j3MCyIjhmMgk+DcAQg++6zJ/B1ayaa0SmppC6pl6RvQbjB4d6oPzGRjEaRD4pQ9wCATw44cjAcZ80cNAmY0FojQdQ6f8U+mjWrDqzlzQKpeoPuLeJEZwc/BrE0gAZXJgaavvUNvVqOdor+wISO4Y4vXAIQAA6o7+iGqbxIVxYsxviN6MeVyJc5itbteX6AWuePupS9C3d+SNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNMEcp3Jy/VS1vJcPZh81U78iiujHhwpjRwQoj82mIk=;
 b=Y1/e8QH2hW1j3M1Uqxk5QKgRgQJdK3/7L7aFp1l7GARC6LpBYiT3qY7rwcrlJV0Fp5mGtGoWeTaK03NsrJl6JmjaKOuficeDjqAZqsMrhGliedsCyXaoZYbq4u4b/TSL0omfnXy8bGD3m1iyIrlaUSOSjALujhkiA+gIhPy3NbQeN7KbuctyllgurAZa9eOOyaglZmUecQD+eONknUKMspm3HJz56ee2QVcfKYp7WFwVnhPYyrC2scBSLyINGd27upQU8qaDmibL44Y5nZNV7zWeJXZnuFmSaNZtHEw2cYFfuTqz7o3M2AKKIkNvmiDg5+2K03T2j3yCkemzOlZLww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNMEcp3Jy/VS1vJcPZh81U78iiujHhwpjRwQoj82mIk=;
 b=nSyVnJvqy7SAyWGlJlCnCjYegvzRXj0wVvuU1YJb8W+xF1GHG2Y1j/oTz9DGZRo2CTUGsvbThymBE7/gRhVeT+j4Coa4qeBiAN/9E84SiVFLzOImEPoNLs+fkDUA5aaXFAegMFvu8FHFiB+c343L70SGsF3TVkvfw0Q6z5qSSZQV2N1fc5RJ3Y5vVRnjrQx73TF/JJYtDrBCOH7p+U2WuZIIJ7viFZ6becicLHtZ8cQj+Nn9u9sWm5U5aHcqkO2PGHLLIY+k0TPY1Rfzh6DzknMD8FU0PKNN/q9uiCQ4AbgI0K5rCTPNWUogjIziPHqPXp8GLNiIhRsmMAHUIv206w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB11084.eurprd04.prod.outlook.com (2603:10a6:102:492::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 02:40:42 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Fri, 27 Mar 2026
 02:40:19 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 27 Mar 2026 10:42:03 +0800
Subject: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to SM CPU/LMM
 reset vector
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260327-imx943-rproc-v2-2-a547a3588730@nxp.com>
References: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
In-Reply-To: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
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
X-ClientProxiedBy: MA5P287CA0190.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB11084:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bb6bec7-36ad-4a54-f024-08de8baa2f56
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|19092799006|366016|921020|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	q67h210AJhnobNSNwaHPvfAC81FuW2TNnKqRC4Frzog/ClbCGCj0QCL4TA7b3JQux3d03ipjdzpuFvSXP5UQrJ1KP4BBn4Cr62ou0Tzqcm87zESHXK8eA/7pPBqxikK7PMklu2Z7N5mHiL5ne/9YeDhW4QxnMxY6voXM4QjXaIWGP3Dqxg/XUE5JQtQHU/f9yWhf7i1zggBKbk2vXmNIiS2adUrNddTLdqdRiCCIKttfsWA9+PW3PUWqRyo/FvQr2MGN1Ni4d5tHwNMTreVbz+rbHxwrwLGwes8xzt/3pa/2Pksns9RLUaLoE1QIhpNxqNmYqdlTM/StJXzmzFn35D8BDCJl3OLB3uoeH1JSX4i8IfNBV3VDbdai2xQaPes6t5vpsipE3TnTFVDpd2k5UH+o+L6gmfV1Ln8n3bH+7UCwLAAyoiexpvHpyWMZI0Si6B2am/j8E3SXt1gs1JBa85N1HH2iArkqyIA4ep5W1w/JjwDf4hmWUH/1SDis8GwGqeljbYrDNvQsciL5dJ68vRswsEMsLT/f/y4DFLNFAlWiQDkNdAFaEVKlRUch29K5XvZ4VedjhwD4crk59bR1+n9QF+VALeh9mETGdnBlJdmT7c2dUkC5nQ+1ev293s5HowO8v1ABrTGHni83UYjeWVQrPsdiJSnOIxi1g1r9eT5h9IS4aaq60vPkrwWj5Yae6eopfEoRDvKxP8QuE7APD8PYwAHHHTG4y6dP/LmJng1zDeAFdHirnErHDoxaXh1m93V/8f3BiNLR4kv6BiFFS14j7+73AvvorkqkKln9MoLMj3cI5DxeqZwOpjYKYXeH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(19092799006)(366016)(921020)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUhKaEFqVVVVdjFpZUlSTWgya0ZPUjBtWXM4OVdMMG9rSGRDKzRKZDUwZHF0?=
 =?utf-8?B?UTFSRVgwQUJvUXZRWk1zWXVyVGVvMzNPSHBBYVpJSTNxemVQSlZ1ZmpNU2tr?=
 =?utf-8?B?d0E0MmYrMFdjaEIzOFl0QVcrbGkwUXpNNDBycHZtTGtzZXB0MkxuZHh3UExS?=
 =?utf-8?B?b0k1bEV2R1c1cXdYbGN2cWNVY1JxMlVlVnNLS1VnQVBWcUFBN0JjKytPc3Fo?=
 =?utf-8?B?NFk4UUJndVhuU0pWZ0d0TnpSbXpKaU5kdmlxdjlYdENscjAvWUxxeVV3MzNj?=
 =?utf-8?B?WUx5VWtPUzU0QzZpd0ZEUjFBQTlvOTVmOXM5ZFEwZUpiZzdVYmZUYVNuZDl5?=
 =?utf-8?B?cnI5ZGU5dE5uQnBIajdLWVJwdi9jS0xZNC9GRTlJQmhiRDIxREdDTEZPQS9W?=
 =?utf-8?B?RFJGL3pxaFRLakpiZTJyeDNURk5NYXNkc3MxK24wV0t6NlZ3Y1FrWFJCMEZE?=
 =?utf-8?B?ZnF4ODF0djUvb1M0M0JWbFNXcm1xakd6Z2l2TXRKbFl4a0RDdjhPM0llN1Vs?=
 =?utf-8?B?TVJzZ2ZXSENzT3ZXUFpvU0x0QzM5cElBYU1kR2d2NzhhSlB1bVkrdDFPR3JW?=
 =?utf-8?B?VUZrc1BuUEN5NDdCaWJ2OFRaalV6dDAxTEEvbnpRQWJZaEEvM3htV3dTeUN3?=
 =?utf-8?B?bG9OdURCTnBqMEYzUUFWQ0hWRkE1dkQ0Q1Z0c2lpdVNZcW12ZWRWQlR4ZWFz?=
 =?utf-8?B?UFJ2MkVodUVwaGJQQ2tsdlpRKy94eng3Mk9wdjlKY1ZNMTdjRkxycWQ3dTl3?=
 =?utf-8?B?UlBLY3gza2hzZWhnNVBCaEEwQTVvM1RGZm10KzBDWW9FbkF6dWlzYVpNRzVu?=
 =?utf-8?B?ZXZ5V1RLVWJTQkdVaWZpVzdJekE1VXFVWldoby93bTRvSEtiOWVUQ0lPL3N3?=
 =?utf-8?B?RVpndHhYZXBaZ1AzZHU5azBNU1FyVVd0a3FmMjkxeHJ0bWQvdjNLTGkxVWVQ?=
 =?utf-8?B?UVdHYUV2UXFuTS9XYUFzd08zbm1URjJrVTAwYm83SE0vaTFNRm5BMDRaRTI5?=
 =?utf-8?B?c3diaG0vYnpkd1RtNllOQWdVNnUzaXNyenA0ME85WVAydUhGWWxXcklPdXhY?=
 =?utf-8?B?eU0wMWJoWGN6NXJsaHNGalM1UGVqazhxQXR5Zm1YaVN1a1FpMFdmUDNHNWVn?=
 =?utf-8?B?dmE3N3JkdXJqWWtYUlVjTUNRNUpwakN4cFNWcXFTa09CU0p3b1FUMm1lNUVj?=
 =?utf-8?B?aXhFbVF6Y3ArZUFXTnpwV3BHNmFQdy8vTTcrQWFZS3RIM3NGNlN0ZVdZWGY3?=
 =?utf-8?B?WHhmWEEvbmFoZ2VZNE10Y1RNS1czNmFaNHh5NGlHMmhSc1Q5WDJZTmRLTCtY?=
 =?utf-8?B?N3RSMFdXM1IzcUVTMFNXVEx3WWV6RXRoZS9ORkRoR2o5dGdVNHZwa3NWVCt4?=
 =?utf-8?B?eEgrUmg2ZVFOOUhuSm1nVVJpTDVJamJkQk5hbndaVmVVN2JucStuL3ErYXRU?=
 =?utf-8?B?QS9JckVzcWxWTkRGeVI5Tm0rWVc0dEh1NklBMkdSN1B3em1sVDJwSE14cTl1?=
 =?utf-8?B?VjV4dE84ZmRBeWRzNEJZZVB2RHBHQTc4MTgybXVCWHRqT0JuSjczUlNpZlE4?=
 =?utf-8?B?SnJQZXBQc1FodzhFU2JqdkRyZkx2SXhVYzVlTGZkcW5UVkhvUmZWTWQzL0py?=
 =?utf-8?B?MlB3MjZjZmhXR0xhdk1vOE1Wa0hCaks4azVhZU9DV2FydnFodFlZaGRNcXhw?=
 =?utf-8?B?SnNyb2txcjdYNEZpMHRsbmVOWjRIZWJCNGNYKytUV3hyUnJhb2VtaXRHSFp4?=
 =?utf-8?B?dFVFT1hkcTZpaG5tTllwa0dsRmNpYkpFdlBzQ3N2UzRLQzJ2VmdTT3pPWTcr?=
 =?utf-8?B?dkJRaU1wSDBITlMxb1grKzdidTAxVjAwbllQMGFZT2JLQlZUUUF2ZnRHOVZi?=
 =?utf-8?B?K2owTFdKSjYyeDRBLy8vMk1GdXJwZW9SNlhDTk5TNjlNTWVxY2lGakZsN21W?=
 =?utf-8?B?OXZ4R09RbFZ5OGlSTlIzc0FzOHBIM0RwTW4yT205VkNtQm94UHRjTTk4R0E4?=
 =?utf-8?B?aFFsTVhpNTVSL2xSSVdNdkVid3ROY2NHMUtuYUl3c0UrNEdXZ3U4NkdRRHcz?=
 =?utf-8?B?R1RmV2gyVCtGKzd0NEJRMTFhNDNycnp6aTZZb3dRQTRwTUN1QmtoMzBrVm5Q?=
 =?utf-8?B?WlBlY0w3bC9UdytKdGxvWEF0SjdqallWbGJLM3plN1diekpMeUUwNDNxQVlH?=
 =?utf-8?B?RFNpK3ErcG1qRGRrN0dzSjE3SlVhMWNUdmdiM2FHOVZMU01zd0pEN0pkVjJi?=
 =?utf-8?B?UlpIZ1dTNjZ5S3UvS2tYN3FRZWxSL01uQ1V2RGJoUFdzeVNJTW9aMXhzWWFQ?=
 =?utf-8?B?MFFVR2w0NmZraVBxT0lkZWFIZzlua2hqUC9lQ2RodGZtVlgwOUlpdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb6bec7-36ad-4a54-f024-08de8baa2f56
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 02:40:19.0203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04+nVuC7TUCcT8qhKb4Olyzs5R9vRBJG2xI+aHIToQyxWjIRDwNdIyb2YS0HXO6IfpnfRy08oAwpZrYZ16r31w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11084

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

To derive the correct hardware reset address, the unused lower bits must
be masked off. The boot code should apply a SoC-specific mask before
programming the reset address registers, e.g.:

  reset_address = entry & reset_vector_mask

Current driver always programs the reset vector as 0. But i.MX94 CM33S's
default reset base is 0x0ffc0000, so the correct reset vector must be
passed to the SM API; otherwise the M33 Sync core cannot boot successfully.

rproc_elf_get_boot_addr() returns the ELF entry point, which is not the
hardware reset vector address. To derive the proper reset vector, this
patch introduces imx_rproc_get_boot_addr(), which masks the ELF entry
point using the SoC‑specific 'reset_vector_mask'. The resulting reset
vector address is then passed to the SM CPU/LMM reset vector API calls.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 17 ++++++++++++++---
 drivers/remoteproc/imx_rproc.h |  2 ++
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 0dd80e688b0ea3df4c66e5726884dc86c8a5a881..d8ead42640881bd523d605fa7002935ef6e98077 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -345,7 +345,7 @@ static int imx_rproc_sm_cpu_start(struct rproc *rproc)
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	int ret;
 
-	ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
+	ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, rproc->bootaddr, true, false, false);
 	if (ret) {
 		dev_err(priv->dev, "Failed to set reset vector cpuid(%u): %d\n", dcfg->cpuid, ret);
 		return ret;
@@ -365,7 +365,7 @@ static int imx_rproc_sm_lmm_start(struct rproc *rproc)
 	 * If the remoteproc core can't start the M7, it will already be
 	 * handled in imx_rproc_sm_lmm_prepare().
 	 */
-	ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
+	ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, rproc->bootaddr);
 	if (ret) {
 		dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
 			dcfg->lmid, dcfg->cpuid, ret);
@@ -739,6 +739,17 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
 	return rproc_elf_find_loaded_rsc_table(rproc, fw);
 }
 
+static u64 imx_rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
+{
+	struct imx_rproc *priv = rproc->priv;
+	u32 reset_vector_mask = GENMASK_U32(31, 0);
+
+	if (priv->dcfg->reset_vector_mask)
+		reset_vector_mask = priv->dcfg->reset_vector_mask;
+
+	return rproc_elf_get_boot_addr(rproc, fw) & reset_vector_mask;
+}
+
 static const struct rproc_ops imx_rproc_ops = {
 	.prepare	= imx_rproc_prepare,
 	.attach		= imx_rproc_attach,
@@ -752,7 +763,7 @@ static const struct rproc_ops imx_rproc_ops = {
 	.find_loaded_rsc_table = imx_rproc_elf_find_loaded_rsc_table,
 	.get_loaded_rsc_table = imx_rproc_get_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
-	.get_boot_addr	= rproc_elf_get_boot_addr,
+	.get_boot_addr	= imx_rproc_get_boot_addr,
 };
 
 static int imx_rproc_addr_init(struct imx_rproc *priv,
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

