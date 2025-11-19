Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010044.outbound.protection.outlook.com [52.101.84.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3392FB99C;
	Wed, 19 Nov 2025 04:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763526141; cv=fail; b=K3bsSgJjNlLPGS+QIxPRPsEGx2cFm0BXRk+fEf5WuM+2/qbvZmeiRiivFp+QdKr7jwVWsJWX+uQh2K00xDkh/ObauAFiq5Qo1CbUgvWgvcRMLyWXGnU9Hovpi8bOVYN6M8zXA+IUdnFW0VrGB4tLAv/JBgE3nzRYxyZxrrCTZWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763526141; c=relaxed/simple;
	bh=MgXsFBwAXtEnkDjCeFNXntHYYKuCev1DCwCB/glEwtw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=MISaKXOYAn4apT1mU5sMrObJITJwWCHVV40ps3irkMWsOlLV9QXJcDnHFfslM3aS7ixKXyvq0FbRiTpOH9inqnZF2t+2N+B1696VClMEvvrloC0gDXRhooLMGC41npc1XeyciRccj1y7GBsukUuexVRjPXmWi7Vr7O2tzHTIQXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Hu/0wOz6; arc=fail smtp.client-ip=52.101.84.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Hu/0wOz6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPxNAJQ3ffH17X/DBrkH/2ApBw4hMDOt5pfec0VcyYBiXEDValgdhan43I+jgEdwX9B0mC1R9oc5Ic/yly+aR0RRCg7kecbebwoMQwPE3V7t4jz4HGUY8FUNHRkykPL8NywImbISpm55FD0vD6TIRUuns91hlBTLSQjsFOOSIBD4qKBsjKsXWYo1UgJCxkZGN9RCWD3rmHTWfUDHjhqHpsujGQ5iOY94Fx7y6zyd1cuFgReY/T5q2glF6ZDTFgRp6RDPE9hTaT1166jOWGmDDT1wVzAaLIcrOTEfHcp8j8MPfgg5t4wshe3nialMqQx9IfRYpGzWcT9yUTFWrgbzew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wu+O5LbRRHVB5lna9JDhXW/lbLEYPcYkle6TCANR8hY=;
 b=Ok5NXQRiM2TUXtpxuPg3/OAWo1LpB9QDOOCqjjb47cii2j04nUVFaimx4WHwz/GzJlRmNib1rEEUVQe6URQPbPtjpoDSVwLi0FckiGD6VmbBhoPfGZLwAWw7z+wxqjstlgiMN+tJR6YjbNanDEC39tHVL6gIqbzBi+fIlsqWXnF8SkhkbTEIGjH29FRDoOHryOo+Jq0PdTGiGuUuHe5+w9kgT3+sB9VsXgN0dIkbpqUQt9XKK8ZtEVic8EfBQkX6cDj/muqLoFBkfN2U7U8zXb9lKl17OlYETsqOAYyxaJhUwBbcYaubgbvpCciXedcXiLh7IsNLS6oFPTpU5ybhng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wu+O5LbRRHVB5lna9JDhXW/lbLEYPcYkle6TCANR8hY=;
 b=Hu/0wOz6tKUqpRVuVKpBtpftoa0oGkJcPZPlgmeCGb9yuZOPhjY8s9qYlvwr6X7ZiL+jmIYUupiaaP8QWKwVVm2eI+J8UM4eI01IGw8khOyXFdteGkMfSi8LyIZlBaJvE7a+DdxETsXedfHljoF2pwh/9wPncConf39C8kVgJexIhC6sB2VDjd8DB9bYo6e1VB/aIVBeE4qV9J2dNt6gBFcVFB3j2Di2s9xt9F7Z775C0g9lBiA/wQXVYd1yvuPg4+kTKud4j+XgRIJsplzl5eqQvzLk6GRTW2+56baRNnPKL38T+UHe++ql9JwmTx0KAvyzZ8BzfaEDAhS8dbzJ+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9319.eurprd04.prod.outlook.com (2603:10a6:102:2a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 04:22:16 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9320.013; Wed, 19 Nov 2025
 04:22:16 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 19 Nov 2025 12:21:48 +0800
Subject: [PATCH v4 03/12] remoteproc: imx_dsp_rproc: Use
 devm_pm_runtime_enable() helper
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-imx-dsp-2025-11-19-v4-3-adafd342d07b@nxp.com>
References: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>
In-Reply-To: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB9319:EE_
X-MS-Office365-Filtering-Correlation-Id: a0899237-34ad-4e61-aaa0-08de272338c7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVN5Vlo0NjhhbFJqOTlIckFDbzNOdzhNTWYyTVNIMmVBcHpCNUNBeVJQTkRX?=
 =?utf-8?B?UTBlUkJoRjF2dE1iNTJOMk9YMjkwL3FkNnpGYjVPQlNSbjJLZE5CS0pGVmR4?=
 =?utf-8?B?QlRyREF0M2tZRFhVM0RsdmM3VXRqd0hzcTNLV2MyK0dITWRjbmR2RXE2a0Ew?=
 =?utf-8?B?djU4Qm1yUFllTGs1enZKZlRTSFJVbWhBZlNRa0kyUFcrRFBCSGRHOGNaSVVZ?=
 =?utf-8?B?emFLVC9qcVpxNk9XUkdDVmtrVndVcXd1cTRmY1VjZnZsT04zL3R1MEVTR2VZ?=
 =?utf-8?B?dEptcTYwQXU0QmwyV1JPOTlyMkdkQ3ZGUloycVB3OHF1ZnIvN016N0RmVVlE?=
 =?utf-8?B?cm5WN2VBZXFNUE5qNk1ZUXVqOFk0S1ZjRVg4U3U5NFRjbDYwb2lOMEppVmlK?=
 =?utf-8?B?QzlmWlhja1psdWQyN2twUlR0dkJyOGFLZW1WUVo0RGdVOHNIeVlIS1JNTWFh?=
 =?utf-8?B?VWtUUk5ocElzd2ZSL1ZPSEI1WFVtT3FtK0w3R2Nwd25STmxURWpqSzlJM0Zt?=
 =?utf-8?B?NlBtM3hDcUNBaFlSMHlmeFpvRFBlMmpuTUw3N2dGZ0paY0tOS2NBSVkxL3Vo?=
 =?utf-8?B?OXFIUzZOejJyWUhhZUtFTUZLSk9CRnZqQnYvMFNCMmZ0YW1YWkVEcWt5b2Iv?=
 =?utf-8?B?dDBEd0hCQ1p5Q3dXUmkzVG4wWFpyL0Ztblk1RHZpbnI2d01yamZxYVhUSWdU?=
 =?utf-8?B?VmJpRmthcU5YWTZJK0xqWHZyQXVnbkhOV29vVlZicHZFSHZkUHNZZGpQQVlu?=
 =?utf-8?B?N1lwekFtMjhSQWYveDY4dk5TTmV0TEFXZjdLWThuMnB6M29qMlVFUm01cjJi?=
 =?utf-8?B?N2UwNlQyQitIUFI5T3FSZXpNS0JGbW93cjRVdHAvU1NTM1JqQlZ6cDAvc0sv?=
 =?utf-8?B?c2k3TjhvVmxHOEgwMy9mWEc4SmMyK0hJbld6eFo0a3doWXRVazVRUVNycjBU?=
 =?utf-8?B?WTF6LzVYNTZ2SDZmL0NDMkFLRG9BeEl2M0E5QmlvVTJlSzN4bnpIMkJhYkQ3?=
 =?utf-8?B?MHQyaE5BQWxjL3JZSElCeVczNjlZNW91aFhEQ1RxK0hNZ3pvN001NFl1UU0w?=
 =?utf-8?B?ZXgySWNWc1RBdm1YbFFBR1BCTWlzb3d0M3hjWVZlYTRMdSt6N1BacktGa1dX?=
 =?utf-8?B?U3QxTUxnWEFmUVJTSFJpZDV6OWVJajhYZXAyVnd3Z1psV2RLYnRGUHkwY2ZZ?=
 =?utf-8?B?cEdqaXU0aFhJSG5HNjIybXF5VXRZOHN5OFoxaUh0L1hnWnZ2TThqRFNnaVJQ?=
 =?utf-8?B?dHB2VGVkdzdyNnE0di93Q2xmRk4yaVVxWXM2bDFrREJCaWRmYzlJMFpOL3Y2?=
 =?utf-8?B?UVQ5dzF0bndydTlSWmNpanNRWW4yRE5idXpOVTh4RGlwcWJVUGpuZHBlNmN6?=
 =?utf-8?B?NUtSNmhtNURhemFCdUtVVGMrNmZZY0hscEd3WmNIRGtVM29qb1FIbHB2d0RF?=
 =?utf-8?B?VWI3b1grYXdSSlR1M01IOTRuTERUREdvRTZOOU1vNlZjUGlmemVoKzk2eEZD?=
 =?utf-8?B?c3pYSVhNb2UrWnBscEYzUGlXclZWZmlBU0xlZEdWd2IxTHFnL0FhTEcvc1BJ?=
 =?utf-8?B?ZnptRmRHcGVGZHhIVEJpTm9Hb001RlpPRkl5YjI1bDZPK05HNjVvMjQ3Vkd2?=
 =?utf-8?B?dXZXUFlCQktmdm8xSWNSYm4wNTV0bWRIbWROR0xVSFNqMXV6VHd3blgyay9O?=
 =?utf-8?B?MFg4VHR2MkZLTkVFbWhsT0JQS2tEeDVsSHZZbm5VaUFzV2w1bXgycXkxMXBF?=
 =?utf-8?B?VlZWN0o2TGN5QUovVGdGTEVBZWZBbThXaUtXOCswdjVaVEpPMW4xZk9YaEwy?=
 =?utf-8?B?ak4zUHdFS25HQXRsVVRQUGh3OUlkS1duZVFRQ3Jtb1RZeXlXOTIyQjhCYytj?=
 =?utf-8?B?cVJ4NWtMdnpHZU9qTm1UUzdiY1pGdXkxTjg1RmVOOXExT1ZlV2ZlbWFzUjFq?=
 =?utf-8?B?NDN2NkZJaFI4OStsTlJNWkRPYUozYWJrMm9raVNPT0N2bURvczJwanQ5Tmg0?=
 =?utf-8?B?WjlGczRLbzhxUVh3aG9oOFZTU05XSjkzUDNySitCbkdEMklyb1FVa1JYV2dB?=
 =?utf-8?B?UnBqYnV6c1FGcTlJVElJUnN5WlVaVk9KR2ZlZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2lLbVBFeEplcEgrendGTDBTUG9yZ1VocnpGVjdxeFpCM1FNbkNodnV6WUJX?=
 =?utf-8?B?OVRjaWlZcUQ0OEl0LzJVb0ZnVm9VeU5ROUVacG5kc2NzRGQrRDFVSy9tQnVs?=
 =?utf-8?B?d05PbnBXVVhqRTJzaTNVczRQbkdFQ2ltNXYxNU9BM3V2d1lBVUJzZXhjckdi?=
 =?utf-8?B?bFNURXRtcGhVTTBKa2FVc3l0MWU5SGF2Y3FNNFRMamU4WEN3MnRYaGt6NEdu?=
 =?utf-8?B?OVRWaHJGTUViMjNqUjAzRFBDU3dmMzk5bFp3WjU1TDdkOGhpTTMzVFg2UndD?=
 =?utf-8?B?OXdkLzZleE9GaFcwR0U1UnJoSXpqclNsbTFIcERrbWZ0V0c0UFgwQWFvb2JP?=
 =?utf-8?B?MGEwMkpJcTd1dGxzNmRQMjZLL2NIT2Q1R3lvbjRqNXlJRE9ieGhIOEVDNzR0?=
 =?utf-8?B?OWUzWXRBem1tTVMzcU14TmZYWnBzaklqeVcwMkFvV0pyKythekRkdU0zRXVs?=
 =?utf-8?B?YXdRUTZVSWVOWmU1U2xFeCtjSU5wQzZQVnB4UXdjRndHZTFkZUJ5S0tsQUVB?=
 =?utf-8?B?VngvWXNCakNwc3o4QUhJNWxxYk5ZTWdHc25tdDFybW9aaGd2dWJkNzNTSnJR?=
 =?utf-8?B?UGNUUHhNNndvYmwzd2JwcVlHeVVVYlpKOTBjQ3h5ZnpxVGdQYUpmRWMzS2RU?=
 =?utf-8?B?dlRhOG1XOWtMekJlVmRTc3ZCd2hhV1lKbUdFK3UwbG41Z2JtcDB5MkV5eFVi?=
 =?utf-8?B?dFNDVktrT1Vobi9DV3MzN3R4YVIvWDVoSGUvT0lueXFhVm9pZS9KajZENDEx?=
 =?utf-8?B?cFJmZWd4ZWEvdTNSNytBT0Rjdk85MDFxUjVTUUFIenZUV3ZXNWt2RFZxRjQ1?=
 =?utf-8?B?Q01YUkpNcENYTy85eDBMWXl2dkZrUjdJWGhhM0c0RURkbE9hZitnOFBQb0VI?=
 =?utf-8?B?azZJdnJ2SDE4alpVcGt3dU1RV1BWejlFdFA2b0phVk15QzFTdEtoMDlSUFpi?=
 =?utf-8?B?Y1h0MXh1bmF0T0xzQjJzODB5R3ozTkVRV0Y4dlF1TXhqOUhlZVBSeDJQcGtH?=
 =?utf-8?B?N3NXUUJJNlFOSU1abVJTTStTczJNMDNxOTRVY1FjSmcrL2YzTUVCSzdiOFdT?=
 =?utf-8?B?UlBPWFJKUElvZEZPWHdiTGZpcVZFbGttYnZoV2UyR3l2dlJ1WGpzWlVKRFIy?=
 =?utf-8?B?VjMweHJNd0I0TlJVbWc2TkdCcHRUSFBCUU9UT1ZLbUZ4Ymp1VEc5ZkRNQ2JO?=
 =?utf-8?B?WjkvL3hiTGhiUkRrMUVWMStYOFcrWjlTbHBUc0tVSUdxeTVlcG9HMXpqQ1d6?=
 =?utf-8?B?K05RYitmVGxOK1NJY2V0QTl4WHd1WW1XcTN6TER0N000QW15MkIzYmtJemVV?=
 =?utf-8?B?THF5N1E4U3FCN2QxZFh3Uzg3Q01nMFc3QUpGVUJYdS8xTmkwWlhiQW15UGZo?=
 =?utf-8?B?VmJNcGc1MFRHZ3k2VEEyOHZpeFoycnRpQ0N3M3lnbUJmOW1lM3JPOC9IWldo?=
 =?utf-8?B?OExYcndVeVJDTnFCODFVSSt3UW5PM0habURYVUljVnN3eXNjYU5PRHA4K1ll?=
 =?utf-8?B?bjZ3R2VtK0lHSU1nZ2VlMFJOSVNqcFlvOU0yWFhCYWhHVmZ0S0FNdS9XMmJw?=
 =?utf-8?B?QktBTDZTWHJFbENmNkROalduVE9tWEQ2M3NRQ1ZqWkI2ZHJsSUYxOFVMa2F1?=
 =?utf-8?B?Ym4wWTBzd0FYcTRZbEdFM2xRUjJEbUpvclNDK1JnSmlRY0RUMkovRnhwaHlp?=
 =?utf-8?B?V2hNN09pRjVnckZRN1VEaDVlREhFM0lNL1hqVnpibHpQWmNyNjdhSmhjZ3Qz?=
 =?utf-8?B?clBQVHFmbEFTbUZFUTFweTBpTnFoYVB0dVdyS1pGYWUrd2piVXpZWkcyRGFZ?=
 =?utf-8?B?VGNRN0pDaGU5WDJpRzNHV0trL1hXM0ZFc29vTnpMWjlReUtGNy9mR0wvOHYy?=
 =?utf-8?B?SzQ4UHhkc2gvSlRoNjNuZ0VDQ2IvcHZoTVBCTW1XYWlGWi9nNkwxM2RxWERi?=
 =?utf-8?B?QzhKaWZTZkc4YnpHZjhnTTZNbnZIbTNTMERDbExSL0VDSFVCdTJIMHNVNy9l?=
 =?utf-8?B?a0g0dThGR3EyMzJjNE95Z01DOGs2TEUxdEhDOGdRSHgzL3Jab1Z0QzRzMnBI?=
 =?utf-8?B?L05wL1pZc3E1Y3RaTFhycjVTUERRd3pkcTcwOUFOcEtFYUhFbmQ3b0VkMWUx?=
 =?utf-8?Q?NnjYMLUu/a63UCVQOvM7ggPnF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0899237-34ad-4e61-aaa0-08de272338c7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 04:22:16.5196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cdm/IUrjGP6JR3UTObAyezJyDCnLizPUGsui/T9YVp1O+OxhFMi6M5CDYDu0Dhirw+9/OqghwCOaJqcIQe7pdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9319

From: Peng Fan <peng.fan@nxp.com>

Current code on the cleanup path just disables runtime PM for a device.

Using resource managed version devm_pm_runtime_enable() registers a cleanup
callback that sets autosuspend to false and then disables runtime PM for
a device. So, basically the same functionality as we don't use autosuspend
anyway.

As a result, the .remove callback is no longer needed, reducing boilerplate
code.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Tested-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 418bd3ac70a4aa294b89c5d646a89e4da5ad2c35..f5d0aec52c56664d6074272e276edb0c4175c9ea 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1200,14 +1200,7 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 
 	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
 
-	pm_runtime_enable(dev);
-
-	return 0;
-}
-
-static void imx_dsp_rproc_remove(struct platform_device *pdev)
-{
-	pm_runtime_disable(&pdev->dev);
+	return devm_pm_runtime_enable(dev);
 }
 
 /* pm runtime functions */
@@ -1358,7 +1351,6 @@ MODULE_DEVICE_TABLE(of, imx_dsp_rproc_of_match);
 
 static struct platform_driver imx_dsp_rproc_driver = {
 	.probe = imx_dsp_rproc_probe,
-	.remove = imx_dsp_rproc_remove,
 	.driver = {
 		.name = "imx-dsp-rproc",
 		.of_match_table = imx_dsp_rproc_of_match,

-- 
2.37.1

