Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011025.outbound.protection.outlook.com [40.107.130.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07B22F6923;
	Tue, 11 Nov 2025 01:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762825295; cv=fail; b=SgR56rNrGEMFcObgbfakFYC5VdDN05/OgHXHnN4PmFy6OVtqxjzA8wXYqxGKhwt4evv8QCuwEQW1jgcsU5WVtrrtCsIcDJF4bayatNaqT7YIWOLmGQGscP4biJmeBgZpAE4AA33YzDFpnvI19Kp8cxi2Nc7w3LPdulVtltd6X+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762825295; c=relaxed/simple;
	bh=o9uf+gi3lDkRYY3aPqlZs+ofFr4t2fyOGLLDzjDKVAE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=SPBSARUMHMyiNVLX7/vbTuH8FEu4b7BjTuN5aOA/P0JCTdH+byd7RtlVFXLnHUXqjkCz+SQUI9azcFcopdgBVzmsTiMsEiCtXIcXkU9gjI4YOZ/iNcyH8fqXVwbhYoLN1sfY/qHAsDItramADs4O3xEtWjTQNz2H6wGFP+PQZzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=h3HxCkDb; arc=fail smtp.client-ip=40.107.130.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="h3HxCkDb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FlXrbr4ekH6NP4Yfeq5v3qR9Ts7UVbp4ALT6ZGJvHgvL7ZtKRMYFYh4xRepgUCuMoC2GXP70Kk/ntO/qcGK7F33mG8bUe6QzedSA6y7hFaru41edwAkx6CIyedK8ZCpWeEiPg2MWnmcyagKzGJi70dODX7aaFp8H7B6D8uI/+DFj1ejdOICocrNng1grdIN6A90zU5P7oSsUVNylAM7MEzas0xCZkYD7HBcYuxDwGU5fUxgRpjnW8DTgA3RSyxsnSAqxnQMAXCQb18kZvaXQ00BGClsmGKt2+JKdlq/zP6d9rGNs6ts3S4flCXEKzu/zTm0nukpw5SyGUQ1MFHNW/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEzRN/UI3H/ku2rTsMyGCYs6S2uhqlDTXKlXv9wrbQc=;
 b=CTzVrujHxkkf8LTT6hyzjGGGAr7hmrweGX8gcit6mar9qMc5WkZVOsFenL6WZFD8xjXfniFQRJzS/5XkfHy4YWrmODvARHeo1ApQmTk3DcLQMNxyBrlfFo71yVpbHDcsxUx2od8R3nGrWXURiU78sg/KGV1bQcryPqKWjT7F87hLBv+8qno6OIjq9ZIAaPwXdJb1ox7afJ8s0sJLMs7GYCVsqIvvnhhmk2APbBeCFyPQAF3zGc9vMhR7ow4U5nXi3k3GC96eyl0dc8KflRb9KLfoAOyDEK7DD3ue5qO127A4UFM8zmcOoMK1nO/uSE5Nt7ENPFiHjv5Fbo1m1bFsUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEzRN/UI3H/ku2rTsMyGCYs6S2uhqlDTXKlXv9wrbQc=;
 b=h3HxCkDbTdNJTHKVy+M0wP0SRv+BlWEdfjqolzcqrNy8yNIVTNelYX3Dqxm216/j63mR3HqvERYwPZ1Z65cMFn3T3zsaPMvskfyLtFV6xJDJTDao+GLB0Cs0ZeUu0/DGWlM7Ds5hHqIJGi3byPayr36/h+6Gj6BfP12tHIIbK3g5AeUiSpZmBqxI8LSur3GAIr+BTg0CRFSVCwH/4LvPegH/fQON0CiX6Q9/TSpNQZ9uX6zuC5CdBcrtf9dbC77XevIY53tTk/W9bRaPZYqw6hASEGyVf1rwKgBKSOuieGVu++sdBdX0rTzvvd9F1w1yn3xXj5JpE+V9d0LLe7bCyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8455.eurprd04.prod.outlook.com (2603:10a6:20b:414::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:41:28 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:41:28 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v3 00/11] remoteproc: imx_dsp_rproc: Refactor to use new
 ops and remove switch-case logic
Date: Tue, 11 Nov 2025 09:41:11 +0800
Message-Id: <20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADeUEmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1NDINDNzK3QTSku0AUJ6AL5IJRkYGlqnmqSnGaarATUWFCUmpZZATY0Ora
 2FgDH9nOZZAAAAA==
X-Change-ID: 20251111-imx-dsp-2025-11-11-1b0957e4cf5c
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d8592a8-7f09-46e3-76af-08de20c36ecc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VXhTR1JqcCtiZHZiN2JneTBNSEJnTHlMdmsrUmg5WjFGNmhtWjdNL2hDdTVs?=
 =?utf-8?B?ckh4cWhYRXdZRlJLamJOcnA3K01zdlZnK0x0MlVqckNCM2RpYUc4OWRoUzd1?=
 =?utf-8?B?QTlHcVkxRW9wVVpicVJoUzZscGRTcS8rY0F0OExyVzBkbm91dW1XcDJ6NXB3?=
 =?utf-8?B?Z3NBQzh0TDQwUnNyb0t5YkNrU0RZRk1LU3hFQ2dUOEFIY1VYSlIwc3lPWE9B?=
 =?utf-8?B?YTBSMkdvMWpLY2ZGbDdwUGdMQ3pGWHBTMGh6WlRNSlEyU01XMlNFUlZjWkg5?=
 =?utf-8?B?SjBKOThGeGJSY2NDODFrZ1JQSkRhUUN2TGZtSDZHYUhkcmsxd3RHSXNBRWk3?=
 =?utf-8?B?TnBDOWMvRk05Y20ydWg1MnF3ZG1wUEM4blprSUpPUUFqWm14YmQvQnBTdnhD?=
 =?utf-8?B?MExkQVgzVUwvRlQ3anY4aGNaUTloVnpZckZsdGZBSVdHNFBwaHovd3p3dUFk?=
 =?utf-8?B?NTloN1lyeVowTDJwMUk5Yk12elBFdktRQ0xoajhHdzBXY3Q2d3dXRWJPcWNQ?=
 =?utf-8?B?VzNZdW5qWXUvRlJvR2tOa1RTV1ZnKzNjekdEN2MrRmtmNklVa01US0V1Zlhn?=
 =?utf-8?B?bTY2ZHB3VlFVbzZqaWZGaUYyYTJrWENEblFjYmk4Q3NmR2dmdG5mUytRRXBs?=
 =?utf-8?B?WHJ3QUlPWGlFbkhoMWNldS91UlJIZjZYT2JRSXhYMDh3UEtwYlFLMFJ6UHZD?=
 =?utf-8?B?amUrWmh5OUZkejA5SUwybDFnWk5TbjlqZk9jT3Q1aEwzVUorWVZ0ME9BS2NZ?=
 =?utf-8?B?ang4cDMrM2hUbTR4Y3YzRWFrSDVtT3QxVWNaNmNXdStvSEcvRTNlT1l0SmpL?=
 =?utf-8?B?NGhOK3ovcWdIMFczYU44UHpvdmFPRjFPYnNlcXUrV3h2N0x6RFdTUUJhYzk2?=
 =?utf-8?B?b3FHYk1GcTUzaUNQc3B6b1BRRm1mc3JGTmJwV0ZxVzNMTHl2aFZJM0RLUVZ1?=
 =?utf-8?B?S3VCYWFCTFZaSWsyMVFUN3BiQmROSmRTMEYwQ0Zhc1lOZzRTYUkvcXNJYklM?=
 =?utf-8?B?RlllSXBMc0RPK2FodnVCZUQ5N2txOFc2N1pnc0tmSmlFUWpXZW5TWHJZV05w?=
 =?utf-8?B?RGljNjlaM0ttQ1RSN0lDNWhqNEwwOGJlemdFR2pWMjlReTlqVlduNjJuR1p1?=
 =?utf-8?B?RXZVRVRwU3oxaXVhS0pReHZESU8yMURKRXVZMWVRc0Y5bStYQ2wxOXM5VHJm?=
 =?utf-8?B?Um5QMlJJM0I4ZFAxTFNVUU9RRERWTGoyeXB3cm0zWHZCOUwzV3RhOU5MY1RE?=
 =?utf-8?B?YzBMeGZoMnNrdDRVbzFUeDNKSXhVWFMwemZTRFViSGJ4N1pRbHJwZ2Rva3g2?=
 =?utf-8?B?TEZXd3JKdG5vc3Q0V2lKcUgxTExTRk1QN2FVQjNGVXZtREM5bWpNSGhXbEFO?=
 =?utf-8?B?M0FQTUltNTZKYW5GazU1SXRGOEpaY3lhUGRpNWU2L2w4Zk4rdFRVR0IvU21p?=
 =?utf-8?B?cDZnY2ZzcDBYQ0lqNzQzb28rVFZ6dzNISGVYOHNtME9EYzFjNldLdFNKc2tk?=
 =?utf-8?B?SEVpT3ovVk9NOWs1MXdJV296T0grY3hDQ0hOR0pqdnRlQXpTM0ZSeC9UQmFB?=
 =?utf-8?B?OHJBMHZtQ0hpdEtPZXhER0xSdk8xU2FGcFdGZ0ZoWkxCOVVnamM5aTNjaEJm?=
 =?utf-8?B?L3NyWE9UVFdsY0d1REQyMmlzUk12K01QbGVETFBLdmJ6WWc3ZE5vb0NBSnl2?=
 =?utf-8?B?d1hQVlFGNGZGNlZ3ODh6aUZrRzVDWUtSc2lYL0hyYzJUZ09IVW1yUEU5YjZ1?=
 =?utf-8?B?YXhaMWY1dEpOQlJqMnJibVJCOVY5SjROb2tteWZPMDNaTHRHc0pmUW0vZDNh?=
 =?utf-8?B?VktnVi9VUFJjWDBXVkhxZ0k2UlBUYitNdCtvaWFRbDhUd2syNWhoVjNDeGVB?=
 =?utf-8?B?eStNODBzK0dQdUE3UGg2eVVFU3RYenkvbmhabnFNQkIwcmo4Q25oa0lpMSsw?=
 =?utf-8?B?c0l6NGdhTWxoWDFvMXJ6MmpZaVZYNzlDSUhzMnJmd0dmbHhUR0FZak45ZFBC?=
 =?utf-8?B?NFp6bjAvN2dBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NU5ocjd4enR3VUZ6UWRoenVZc09tWExGUkJjazgreXVkNkF1TkFqcFY0c0N1?=
 =?utf-8?B?WGt0TXN6M3ljenBLNE1kYW9ocVhvYmNpWG5GajhEUWs1NXc0TzJYbXl4T3dk?=
 =?utf-8?B?MXFOY2pSMVlXL3hiOTBnd05idkIxYUZYcFJsaHRtYUtUbEEzWkRCdUd1eGpq?=
 =?utf-8?B?d001ZDVyS1EvdEFFRGtlN3BMUWVqUUFZMWhuWndlOXJFM0ptSHJ5MkhOdjNa?=
 =?utf-8?B?dXhONHJ3cGtNaHJWb28vQVJKYWpYbUdGU3pWMDVVZ3FaSlc1VHI3d0ZGQlU0?=
 =?utf-8?B?bWZ4VUx6d2VjWXgybUpXRGZhYUk0R3RCVFc4RjRvb0RjYWZ0dmRpZGI2M3dD?=
 =?utf-8?B?VEczYlZPTG5mN25wTlVQWStFRHVRenpMbnFTVHVZUEEvRHMwWld0cnZiSlhY?=
 =?utf-8?B?SnIrTnM2aWhrTmZWYTAzWEt2aEdETW50eDdBbU4xbXNieDhrK1llQmk1clVW?=
 =?utf-8?B?eW92ZWlRaUNHd2N6Nmd1ZEwzYlRsWEsycUIweFFLd3c1dzZ3TnZ4M2YwZXFp?=
 =?utf-8?B?WmxBZ3hYVzZaQlhsRzNoZEJJaDg2OW9NcERRR3JiL09UMFd3VVRqNEJUV1NF?=
 =?utf-8?B?YkZoOFpkNTJCblRrdElSaU90TTkyck1Zem1kYmxzcWl1Y1ZNZzdEVFdXdEc0?=
 =?utf-8?B?NjNzeFphSDUzS1dSaW5QbDhZeGVHWUNTUjFPNlNlWnFQY1dHeXJ6VEVNdnIv?=
 =?utf-8?B?V3ptb1Y3MXNJU0JkU0VUQVVhVnBCWktOdWZLYXNJbU16V1RxcUdlM1BLK0dr?=
 =?utf-8?B?N0svVTNObmVIb0VadWxyRWNoSUJ6V2NyZGdCMTlRRzQ5UEMxV25vR1lNMHE4?=
 =?utf-8?B?R0RQODk3QnYxWUVRZTMxSkVOMk9UcEl1VGkxRG5jeXRNSjJmcHZ1VmYzNGhx?=
 =?utf-8?B?RU1WYS94dGw2dDQ5a01ETnkyY2E4dXVSclZmN0JZa3Rya3VyTVg3Y0F6NmNF?=
 =?utf-8?B?Tm5hNXh3aUozSHZmcTJHTXlWK3ZqT0lKVzB3SDdRK280MTF6UzFNOVUya3Av?=
 =?utf-8?B?SFNMNVhrUFY5NW80ZFVnMWVmNXhib3lzTmJQUS82Z3gySmFxa0pYNktGR2xQ?=
 =?utf-8?B?eDBVTFpoTStvcXdKeWhiTkxWMnBhYk1nbUJtem5ueEZaN2g0ZGZqU1lkQXJj?=
 =?utf-8?B?aHNCemwzOTN0T1d6ZzhDNkF4V29RcTh4b3JicDlBb01oUTJkaTJjSUpMdndW?=
 =?utf-8?B?dVUzKytOM1VnbEEzUjB5Z1pVd2F4ZWc4Mll2c2QwYkY5TFhrWFIrNEhNeWhJ?=
 =?utf-8?B?MWdEa1Fob1FqM3l2K1YvNW05RlFuWE5VbzJ0WUNIWUhuQmFyRUFLV3lDRVZo?=
 =?utf-8?B?bEg1UWcwdk11RVo4M3RnMmU3b29TVys4Uk0zWlZSR21vRWlrRDl6SEFwZXNy?=
 =?utf-8?B?SWRkQklZNC9GRkh6cXJpckwxUlRsR3MwcVdwcitlTnAxeWgvTDYwaml3Q3Aw?=
 =?utf-8?B?NitFK0FRVjBXNThpV2FwdVJzby9zcmF5SGUwMmk5VlNndFRyM1AwWll4VmNL?=
 =?utf-8?B?WGZvMExhUTRJVGVYU2ZWM3NyNXNoTDExUzRIUDhQZDNDSk5LQXpHRndJVVds?=
 =?utf-8?B?eTFYR0NSbFNwUnlqeHlSMEFkN0EvUGtWRjJqM2ViT2JGK0pMTWY0WFdnaDQ2?=
 =?utf-8?B?bXI0dVBWbDNicWZ6L2ROaDRuTGp0N04rTFRUR2ZZMkFTUlpTUVFWQm4rMXRI?=
 =?utf-8?B?ZTBnaDkxaTU5MUZQY3llbjZ2RXc5SE5jdHBacDY2VzJUL0U0ejJhOGFMQVRs?=
 =?utf-8?B?eWxrQlIwRG1CZlcxM1lmdUtSV0VoaHk4V3RQUEtiS2VEcVJSMlp1bUlwQkJo?=
 =?utf-8?B?Q1JNTFRvSHpsMXBGUlorem1NRXNsMEJnSlp4STJ0bTVGL0xqRGFrdkNNNGRR?=
 =?utf-8?B?L2hUMUFSbGRHZC95SUluMFJhNU5BRldPaURBS3BteVFsSTh2UXJnT09UZmY1?=
 =?utf-8?B?VUF1eUFQT2JDQ2pZTmRUNGhrUmNLd2xMTGNKU2JpYXZuSDFYVDcwWHVUbGR3?=
 =?utf-8?B?N25CU1pkbVBlYjJrNzdCTGJrWGRBMW9IR0V3UWtrR2xTeHZtbVlPU3lKMXlZ?=
 =?utf-8?B?aUJJOFRsYzlDSnpRblRCUnZNaDJpaG9DZXJJakgxVXVzcWhQY2hYV3g5SExX?=
 =?utf-8?Q?hlGWEbAVReQTTxi+MHK0DZTnE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8592a8-7f09-46e3-76af-08de20c36ecc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:41:28.4913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kAIIaFjS+s3wf+/ef+pyYrP/a46Ls+J8XXbRiEtnSP/XHGcPt4ijBUJS6G67DVhTDGHjDW/398vIaHtnDamCuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8455

This patchset aligns imx_dsp_rproc with the cleanup and modernization
previously applied to imx_rproc.c. The goal is to simplify the driver by
transitioning to the new ops-based method, eliminating the legacy
switch-case logic for a cleaner and more maintainable design.

Patches 1–5: General cleanup, including code simplification and adoption
             of the devres API.
Patches 6–10: Transition to the new ops-based approach, removing the
              switch-case structure.
Patch 11: Remove the obsolete enum imx_rproc_method.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v3:
- Collected R-b
- Simplify commit log for patch 4 per Frank.
- Link to V2: https://lore.kernel.org/all/20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com/

Changes in v2:
- Collected R-b
- Patch 3: Update commit per Frank/Daniel
- patch 8: Use priv->dsp_dcfg->dcfg to avoid adding "const struct imx_rproc_dsp_dcfg *dsp_dcfg"
- Link to v1: https://lore.kernel.org/linux-remoteproc/CAEnQRZAOTFw=sBppHTYQAdfDBuNqkqk6gVO4FyP0EBsva3Oi+Q@mail.gmail.com/T/#m27c93af9fb1e7fdeb0766bdbffbaae39d79eefab

---
Peng Fan (11):
      remoteproc: imx_dsp_rproc: simplify power domain attach and error handling
      remoteproc: imx_dsp_rproc: Use devm_rproc_add() helper
      remoteproc: imx_dsp_rproc: Use devm_pm_runtime_enable() helper
      remoteproc: imx_dsp_rproc: Use dev_err_probe() for firmware and mode errors
      remoteproc: imx_dsp_rproc: Drop extra space
      remoteproc: imx_dsp_rproc: Use start/stop/detect_mode ops from imx_rproc_dcfg
      remoteproc: imx_dsp_rproc: Move imx_dsp_rproc_dcfg closer to imx_dsp_rproc_of_match
      remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_MMIO switch case
      remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_SCU_API switch case
      remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_RESET_CONTROLLER switch case
      remoteproc: imx_rproc: Remove enum imx_rproc_method

 drivers/remoteproc/imx_dsp_rproc.c | 342 ++++++++++++++++++++-----------------
 drivers/remoteproc/imx_rproc.h     |  14 --
 2 files changed, 182 insertions(+), 174 deletions(-)
---
base-commit: ab40c92c74c6b0c611c89516794502b3a3173966
change-id: 20251111-imx-dsp-2025-11-11-1b0957e4cf5c

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

