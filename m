Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011049.outbound.protection.outlook.com [52.101.70.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC5424A047;
	Thu, 18 Sep 2025 11:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196302; cv=fail; b=WaS46rbDsINOY6j3m8mkBe00uzS3rlwKJbinjwztCj6lUhuz6ke42yP37yQghJ1N2UyLtfFSDkFcfLFzrMSa1wzD+X9TgJNnoQnFZloavSYUz0+Bxbbn4GT1QqDljb9i1AilXZZNebBcHERjJIT5dQ2Y9OCtgdktpBIlZ0SbMZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196302; c=relaxed/simple;
	bh=6DSMFhOLO163xNtDtKLJMLCMN09EW0L46C0soBDXYc8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=kIJJYjn27hS+iNqMl5GLd2O24VXrifq+pmTH+40mNW308gcw0TwUJnSJpEglz2bIQk2Uq68o/jMJRa9oF24/V70DvmDTLgLdl03mfSLhax02LTJGi3QF6ql8RauLx8Nkqh47m75NEVw4cU2QgnRcB5xfqb7ToqV6uqaHUr59XoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UKuxQR3H; arc=fail smtp.client-ip=52.101.70.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UKuxQR3H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ux1IEJYlXcYneXxJ+NsEK70LOVBorU38qaWNmZqbE22tPYACBqJS67ZJHAJCFm2+Q66QJOnmkATctNl3D4zNOU6j9am6n36NlNpgZhcl91Qiz7InqWl/lNTRng2jC5x9sSz/srT1OwaOvv357OXo+n0nVL6Qp1CFDzdIhtGSJ8HqylSWtr6F4J8cIODEOVffCEcP2CqZEKiEpfleb9+XME71qfFJiBabJ3XijdVEas+FYS5GDFI6JD1CF/4v5rjzcIimWqm1Wq4db06kQaqknby3zFLHtdysjl1V2XriJRABhy22lXtN+0AXtsrl4MHEYMviHIZAcRMdSdK8+qc4aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ss9FLqKgjaGRvIa2tVwjhwp8Qb1+yPSU/myK0/X5vs8=;
 b=n9JyVFlCUFc7OpCnfuuaMJ1jCc0u5/WzwAXprYJG6iZSwnbOtXC8y7BI1GbXQAPlnmg+TJjWb2DgcNPcewDzlX6AD64t1pI3rqygC0YiUMSkaSTw1IE3xyisZhX7EqDM0R+avu5R1d6iL8AhPBTq5Sg+3v7iedkk3SL5ImVXn7CG4pkbKGCLb79tvNYoTvjcFE43BQQ84m0KnjHgXUs1ZFqsQc1vxg/AK8QtzgXzvKPwR9pmApjGEyIOIgMp+5wsoNCg09LOgq4u5DML6Sh9iJydKcJVEKfSBtLbv9eA8VjbAi8SluVL3gr5c6vIgU3jkYfns/f8wdWfC/qgM58C1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ss9FLqKgjaGRvIa2tVwjhwp8Qb1+yPSU/myK0/X5vs8=;
 b=UKuxQR3HrOoVQE13alhjC09MOJry1ydeNTd1DZ5hv3fU+8NOBNyJI1mTpQ3wXAK9zyvtwoxBwUG14UKmT2uunw39LgeL1okvnFFHle0GZUiMeNJ0PGuPu0Vl89bwd8iLH2xF1rNlqlq4eucXNRzsbihIXVoiFXdDlkesJuVTy8snuOsF2v2Oaa4t9SKi4vwUw4/n2GjDirsic/Q/8K/qh9lY3PtCCMcHloNs/nCzKfW2nnPAyp0WvXajfLKqIqu3TPSJAGqAmLLc7uccj1hPe+D2+Dvg4pAnjG1Ws7vBO9tBJVQZTMDZaf3RxmXcEruar0smaGp7X/TBBbw4/qA57w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10450.eurprd04.prod.outlook.com (2603:10a6:150:1e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 11:51:34 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 11:51:34 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 0/5] remoteproc: imx_rproc: misc clean up
Date: Thu, 18 Sep 2025 19:51:15 +0800
Message-Id: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADTyy2gC/3XN0QqCMBTG8VeRXbfYjmu6rnqPCNGzY+5CJzPEE
 N+9KVERdfkd+P3PzAYKjgZ2TGYWaHSD810ccpcwbMruStzZuBkIOAgjNXftVIQ+eCwQOFSmtFm
 eQ60si6QPVLtpy50vcTduuPlw3+qjXK9/QqPkgluFuiZVKiPTUzf1e/TtWn2S7AcRAglSiwY1v
 cj6eYTPb98UIoVSC4IKRWbsmy7L8gDKFXDyFAEAAA==
X-Change-ID: 20250916-imx_rproc_c2-2b9ad7882f4d
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758196288; l=1702;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=6DSMFhOLO163xNtDtKLJMLCMN09EW0L46C0soBDXYc8=;
 b=GEs+S+SHdrCSeFYh81fS2iMoIO0lX7YSuHIOj7d7188VQvIuxZPWWg2MTREOoSLygXG9g69BJ
 hbXBjL1WTN0BSFlIsS6ChXuc2WKT2XONLjJStsG0BQAQNOiP4Z8TYrC
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR06CA0235.apcprd06.prod.outlook.com
 (2603:1096:4:ac::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10450:EE_
X-MS-Office365-Filtering-Correlation-Id: be711604-9469-4a28-bc32-08ddf6a9b758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmNweUF3cVYyblI0QmV6R1hnRUhtemlUeUt2bmJoN2o0TnBFbEJtZzdoQTNm?=
 =?utf-8?B?ZjRuL0Jnc3RHR1NjTm5pOEZiNGl0UE5OdEF2NlBWWWl2dWUybmNhbUZpV2Js?=
 =?utf-8?B?TUw0ZnRSWE5WWWtUdk5RWkVkRFRvNjI0eWl3WGU3V1pjVFlQRFo1UVZGcGgz?=
 =?utf-8?B?dVJTVmtueTVHam1STUNFSkoyQ01KTUFVS21qZXBpTWYwVGl4S1AzeG5BcmUy?=
 =?utf-8?B?MklvNDVuZUpCRnREbC9VSjE3eDE0cXlNVHQrbmlhR29qdXNjNDgzd0ZRdk92?=
 =?utf-8?B?ZjRHdHdIVHdianN5SStqSU1Jbk9zejdYV0U3emRYZExrSDlpOUlwMFdDNFVt?=
 =?utf-8?B?UldMNk9UejY3N3pxdXdWb0lkYTQzVFJQTWZReFNwK0NDMXRFa3RNUEhHbmlD?=
 =?utf-8?B?UXhzTmxTSXlsbmxBOTRBbVN2OFhhcklnU0pjRFNObDZYdlNJWCttZDdnUDdT?=
 =?utf-8?B?Vk1CeGQ1bWt4Ry9WTllOV2RCaGswY1JoV05zUHIvZUVxcUR4ZUpGNFE0clpt?=
 =?utf-8?B?MXJudk5sV2t1bHAxNTFueUIwN040ZWpzZG9iNzUxWDlPRnAwZkd2NWpRTHVt?=
 =?utf-8?B?RFdQNlZGOWxqRnhUeHNaSFRGVmhFT2V3cDF3TUJmb0pkQ0FJeE1RWm5meU1Z?=
 =?utf-8?B?YkJIejVCelZkT1FnTS9ndnI2Vzh2b3Q0VTFSVGdvRVlHYUIyMXBJUkVlUUpN?=
 =?utf-8?B?cVVkUGVZVzdlTE8yT2dJYjkzWVkrN2F5b2RralFTbXdBeUM0bGgzdGU3S2tN?=
 =?utf-8?B?MGsrcFQvbGp4T0FwY3JiVWdYc3hNd0JiMDRXcWNjU0lFMzRTMVZqaWY1VDFu?=
 =?utf-8?B?dFBSOW9KQTM2bzZzZW96bWhXSG5HNDVCL29zNlNrd29UaWo3dEJmZGhLQmE3?=
 =?utf-8?B?MEltTkl3VEE1UGZhOS9TRzR2Y0tpRFEydjd5TTZ3VGt6S042WVFVRXRDMG51?=
 =?utf-8?B?aVA1ZGJ4OGliYnlXUFFkVGdkcjBjZHRUK3RuVU45dzhOeHlIUURRMjkrNk9n?=
 =?utf-8?B?cG1oaFh0MjJ5Qml6Z3JrRFcyUWk4RmIyaWt3V1g4M3JtNjhlOEdsMDVGWVNN?=
 =?utf-8?B?eUlwak1IeDF5SlIzUzZmc3ZrWTR0VlJzK1VHYWhEczd0Zllmb2xWVTNBL3gy?=
 =?utf-8?B?QVRycHBQdVZabnlaNXRFR1Z0WFZXaVNjckROMGdQSG04dC9nQkFZMVhlNENC?=
 =?utf-8?B?VHArRk1MUmhkbEhXL1RFeXQwMUw0ZjFOYWlGZUhhZWxlZjVrb202aE9EeHMz?=
 =?utf-8?B?aTAwbGpFVjRmNkM5Wk5TTUxDZlVPbjdjY0Z1STVWQktEcWxCQWNFOGRwUWh6?=
 =?utf-8?B?Z3RMTFRKRGFzNEw0dVBXU0g4S0lwdWcwVTdaMGd1dm4zRUxJMHBBTU1ybG53?=
 =?utf-8?B?Qzg5QWlZRXovMGZkQk9OUEpjVS85SEdzUG9lZ3VBeER2bHdaQVB5U1BtOEt0?=
 =?utf-8?B?RXdibDNYK01ZeDdoelRBT014TktxeGdyUmIzSjQ1NnhmUThCMm8xbFA2RnF0?=
 =?utf-8?B?QW1jcVNDTU8wWHl6K3A3d2JjY2R6Q20veUVoenJDSVRHRUEweVBqSVN3NHAy?=
 =?utf-8?B?bWg5TlBRMHU4YnQ1QlQzcVRhZUFHRlRuUGxiKzJpWTRxWmx5Q2V1MExwck5n?=
 =?utf-8?B?UEw5RldyMmlEVGZFS21sMGRsYlFIVmdJZWZUT3hzMzlidmdvaFFSS1cyM0dl?=
 =?utf-8?B?S3QzV1NncmdYRUUxT2V4eUFYd1B6RytoRktwNENpVmNYSm1vQlRnaUYzdzd3?=
 =?utf-8?B?U1Npa1VBNm1mdGtLOHJkdk9FV2diMFV2TEZKL0o1b0VUQWw0TTBsQ085K1lk?=
 =?utf-8?B?eVAyTWFMZlNiUmZUWHNVZTRkcFRoR2dKNGdIRTIzNXRjUlNtQm9Da3VjN000?=
 =?utf-8?B?UnBlNElBSUVJTGpCZndaU3Y2a1c0aFZYZWxVbG5TbHlBY2RkaFF0Y3pMc1JI?=
 =?utf-8?Q?dj/+nUwsIVw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVhwY2dBazE1Slo1RHUrQU1VcnBKY0JieFBpK2VjT0E0UE8zc04yMS9XTTNw?=
 =?utf-8?B?OUJSMDRjYlNSeGRmcEFPeUw1WUV4T2RFYjcwL1FKZ1d3Y0V2c2lmc3RmNTBW?=
 =?utf-8?B?WUEwWWlzaVlybjFWMHNaVE83VkNIMVdkdGxnOXN6cDhlQU05TUlBVjFaSEtG?=
 =?utf-8?B?SWc0RlBhMmM1OHZsOUc4cEdUeWh6K2VrNHoyUXJKQUpWa2wzSURUakpBVjNw?=
 =?utf-8?B?T3YvMWd0VVhDYzI0WlNuNkx2Tk9yYmptYjVLRlpxc0plang1aTdzNGE4VEE3?=
 =?utf-8?B?T3lwMDFENWZXUnYzS0lyVVp0N2RocTljdGcyYTZUZTk3ME04QU8xVkZORTFx?=
 =?utf-8?B?dFZ3emxZdDc4VWpjSXhuY283blJDZTNSMW1jaTVzL0hOSEg1V0hudnBaRk9E?=
 =?utf-8?B?ZEN0M3RUeTQzWmRBemNONU1XOEt6UTNMUm5EbXQ1QVdXMEVzQWxmZkVlWVpw?=
 =?utf-8?B?MHh1d3ZSTUxvdVhiKy9lMVNha3RXc3NGbmRpM1NjYlJnellHR0drcndyblpM?=
 =?utf-8?B?QTRhZ2VGbmc5dDJPREVMR1lueGRCUitGeGh2L3RzbkhrdXErVTI3VzlIMUc2?=
 =?utf-8?B?blZTcW9sRE5SdUZWZ1MyMC85eWVpdG5tS1gweDRCSUJUTVc2a0svTDhiMjRP?=
 =?utf-8?B?YzBTeVdhdWd2M0FSQ0Fma2hwVkNQMFlyZ25TOGRVczNyVVV5OG1zR0kzcnFS?=
 =?utf-8?B?K3ovdnFVMEhYVy9xckFXYnkrOWRMOTdYZnU1eHoraWtmK2sxcFJJQ3dMZzFV?=
 =?utf-8?B?Y2FnclpVdWY5ajNtZFp5OHRHRzRCTEdVckZUSUFlbWRpV0M1K0NRZW9CUS9a?=
 =?utf-8?B?QkxzVG1HMW5GSzBKVG04N0grWGRoMEd1bEFGRjhWYU5NSWljK09vMFV5Qmth?=
 =?utf-8?B?RHhKd1NvN1l5QVJ6NWQ1Z2FuVWtJeWdYRmU4aG1lZEZaeG1LUFI1QXlZQ2hn?=
 =?utf-8?B?bjZybWgvYXdnNWV4SHkxRmdWanVLdmU4SVBwY3oyYzl6QWdhelZxZUN6NUNl?=
 =?utf-8?B?OGtvaFI2dElRdzU5VER0clQ5RFQ3UWtia1cydzlzeGY1ODV3dFJ6T0I5V0p6?=
 =?utf-8?B?ZXMyc1pkVG4zZ1ZOZ3FEVzloNENFMkVKNG1ja0hXVy9tbVh1ckRIQWIrRVdj?=
 =?utf-8?B?R3BqT3RXQUFYQzBlTFlWT3g5Nk9MS0Nxd0JYTk9LWHpnZ3pQYjVWRDM4WTFJ?=
 =?utf-8?B?c1M1RmdwYjg3U0lQNDF5amNuMWlXS21XUHV6T0MxekpESTZUZUhCMmtoM2Yw?=
 =?utf-8?B?OUxIalV2ZHNENzRSWStlT2ZPd0ZJZFFlMkVkNDlKSWJ4ZjFPYjdKRkwzaEd6?=
 =?utf-8?B?OGpuTkpjbUt6elNMTTlWaEdiL1VXaTFMSGpPVEZ2TG1uQi9Fbk1HVHJFRGtQ?=
 =?utf-8?B?SjFJZXJyeWZxZHlud1hmUWtxRG9uQzVVNDBIcUtTcTJwWk9lVWFnS3VjZy90?=
 =?utf-8?B?UHlkL29Ea0NVTm0wcXpSbFFRd3ViY3Uvd09wcFhSbWlBaGZzWmllcWk5T1Bz?=
 =?utf-8?B?ZjViM2NBWWQvTEVWekp4S1hGZ3hDaUhONFpVNGVNMjZOeW1WRW9xZU5sMzRJ?=
 =?utf-8?B?RmNBdml4ajMwbVJ1SVVxL3N1cTFmbDlJcEtCeFNRY2hVY2d5UHNYVWJyUVpy?=
 =?utf-8?B?VFVpQThPc2pBd042elUrWXFCVU1tLzUwVTJWRS9ZaG1hS3c2dytGcFhRWnJT?=
 =?utf-8?B?RktmeStiN0RjT08wY0hwR2E3Z1VXenVnNVlDU0YzWFl4Uzd2ZzVPZVlPY3lS?=
 =?utf-8?B?VWFQaklvZktNVjE0YnhJSWxuNlpkQWtXeDRBN2lWNElzUDBYVnNNYm9rU2Vq?=
 =?utf-8?B?ZEh5M2xRWkZNMFZMblU3Tm5mNmdDTHFJODhHdFlEOVpyU0JISjJCYWc1SGlu?=
 =?utf-8?B?cVhKMTBlekU3T0RzRVJwUDZORWoyQ0RsS05IN0U3dlhwc1p2VHNUVHBTd0dt?=
 =?utf-8?B?b2g4QVpiMDVBRVhzU1prMnJtcllhTUY1ekFkdWw3L0V0aXphNWkva3R2MGN3?=
 =?utf-8?B?c1hzanBNWktCemQ5NENkSEpVMENCaEVYQWlBS0pkYUtrczBieTlhRzg4ZVRh?=
 =?utf-8?B?YTAzMHpNY0dBeUoxVFg2VGhVUUFsOFdOTnM5aVVKd3FoZmtNeHF0ZWRTZXI4?=
 =?utf-8?Q?xJHJXa33CoP6iFgB5Md1rAOVY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be711604-9469-4a28-bc32-08ddf6a9b758
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 11:51:34.4671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MWhdv1P4E1fqfGq9gz+vH1uvJlan2dzT7vWYLcK9qleAk3MWY6Hq7tnOI7qaBcC6mooCB1LptnlcWNiGaaPBYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10450

This is the 3rd series to cleanup the driver. This patchset is based
on the 2nd patchset [1] for the clean-up

Patch 1: simplify clock enable logic
Patch 2: Add a platform detach ops which will be easier to support new
         platforms
Patch 3: Enable runtime for all
Patch 4: Drop method assignment
Patch 5: Add an MAINTAINER entry for i.MX remoteproc drivers with
         Daniel and me as maintainer

This is the last patchset to do the clean up for imx_rproc.c.
After imx_dsp_rproc.c moved to use platform ops with swith-case removed,
the method entry from dcfg could be removed in the end.

Tested on
i.MX8MP-EVK, i.MX8MM-EVK, i.MX93-11x11-EVK, i.MX8QXP-MEK, and i.MX8ULP-EVK.

Thanks to Daniel and Frank for the internal reviewing.

[1] https://lore.kernel.org/linux-remoteproc/CAEnQRZD=1hxMmR98qfpoH_RFFrSrYMQ6ithFkjyqVgtqWKB_+Q@mail.gmail.com/T/#mc08d4cbf10e913d9e680ed93f5467603be37228a

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (5):
      remoteproc: imx_rproc: Simplify clock enable logic using dcfg flags
      remoteproc: imx_rproc: Make detach operation platform-specific
      remoteproc: imx_rproc: Enable PM runtime support unconditionally
      remoteproc: imx_rproc: Remove the assignement to method
      MAINTAINERS: Add an entry for i.MX remoteproc driver

 MAINTAINERS                    |  8 ++++
 drivers/remoteproc/imx_rproc.c | 85 +++++++++++++++++-------------------------
 drivers/remoteproc/imx_rproc.h |  2 +
 3 files changed, 44 insertions(+), 51 deletions(-)
---
base-commit: 872c1e97ca571f8e1afff2659006a2948b9fb483
change-id: 20250916-imx_rproc_c2-2b9ad7882f4d

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

