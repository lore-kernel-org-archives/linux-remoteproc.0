Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013036.outbound.protection.outlook.com [52.101.83.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AF135A932;
	Fri,  9 Jan 2026 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767960513; cv=fail; b=dCK3Ubl+6ZCxMXYM2LhenLO5ri7wvSs9I4N4h4N4hyhVzoaJKBtRIwC/+Q0quDOjW3Dzo4E4VhLCpNuqfkXp6MrVprSOEfMoQSy//mYzBo49f4b10xE6zNfwPoVcK6I4yzsthUMs5+s6b4h8rY2Lu0VegA4GyLa4i5hA8nQ9xak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767960513; c=relaxed/simple;
	bh=xjhYLecQKz0G6giV4lzIQwYZKWTErLuevPE144Vv6Go=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RwDST8IrYl633hI8e8c/u5VFzjPEC2yFzmORrLMtXPcGCeCapZ0VhSIoWC1L5U04XWVWJ3xU/MHCGiGDVp6IU4pXB2n9OTwo7qhC2QRqKr6xxLYQq3CU1MmNQMeaixr2bUvoT46/Y3r9u+iTJxaa3xY7HDYXYaUD/5CI/3hbncg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VPqmswWR; arc=fail smtp.client-ip=52.101.83.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VPqmswWR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWvxX2oiB4gJ1D5vWMeQgdzRRA9PRhbMIf1OIvUsHKJXlwe9yLDinG0DTbeBI36Wyc8swI5txlOlO+0sDkzZAXsIXymxhiAiETJWz6H5zfgvry6OH+kc9/TQSJhz3u7Adn4f8++uQ/yYbALtIQTwrxDPdPTpGiMsC/HdAsX9A05F8KhO43JKHBCtmuSCENb5RaXtcf40XCEGNEJbMn6qiIzFdfms+IxkQVRHW5HF9xSwpqPUA4En1ke/9KdGztuQYXXiBOsypX2nQsbu50IcsnjYCxDWGiQFmuKjBIRpZtuMBt4QJrpG5rBAi7ztuYV9qBkVyfR+TPcy6CTto+TwgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UFkVWEbuXlEyhQIYx0Mov0Bl+koyt1S1wlVHUGASKs=;
 b=px45NlLiqN+223tj/6ZnylTxQqn2tkOMbcLaRmIegbGoyi2alky1SZ4UUUXT19gsr3aYhmFMq/lTqwDDTKKDw+hg4LTEE33adf9/7QWcNI4JqTB4E+qy8+LHHl3RMSnyxD7ucrHIshYSh1J/GxQlcf+U4bjPv4CMpTZC8c1JhrBBr9F/XFwQl/fF9Umo3sIYRDYgm5pfUTV9Yd5WdKpotKs0oDvpe+tFRocJsaRXllqc2b2r8hci5PRu7/03XOfjMnknJC/kp5KKo/s/7adENnkrIQc0Dl+wJRAeNXAgJ1ysZSmaxnWfun3zRkALovrKX7lsqqBrQ3+gajuwmhlPYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UFkVWEbuXlEyhQIYx0Mov0Bl+koyt1S1wlVHUGASKs=;
 b=VPqmswWRU9jYP83TKDhOl6TWX21uSAwdCy8BHqVTMdpSwzJ9Jv+VvDSR4Ew4hNtEyQXPYp/ijgxHyw0pawsHD4oS58FFvyEsRYN7Lb+OGHuf/yleBQQ29t4O+OAxJsYb3tChLc2s2NG2WByNhzG3JfQCXnS62N39bl8cAIDD5ea98RR+bjMWPuO7+lxgt8ZX9XmNU9uQuOhvP4c3TKTPeXuNsDmfqT50MmNFGP+/2X1QTiU7FnnaLz3dH7CT7ZNSZkiIn01ebquCViu3k5PuOfzMrz08hOjzGzjSDHjqT55lzwfRgtwUElh12hidlmW3TO80O0Ob5qTyC8jVNUpgPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9480.eurprd04.prod.outlook.com (2603:10a6:20b:4d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 9 Jan
 2026 12:08:29 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 12:08:28 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 09 Jan 2026 20:08:01 +0800
Subject: [PATCH v6 1/6] dt-bindings: remoteproc: fsl,imx-rproc: Add support
 for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-imx95-rproc-2026-1-8-v6-1-d2fefb36263d@nxp.com>
References: <20260109-imx95-rproc-2026-1-8-v6-0-d2fefb36263d@nxp.com>
In-Reply-To: <20260109-imx95-rproc-2026-1-8-v6-0-d2fefb36263d@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS1PR04MB9480:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f3e577-ad46-4e21-ea7d-08de4f77cc92
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|52116014|376014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUdlR3RNdExlbVVVSWN3b05HUGI1NlprL2Q1OFJsZU8yWXNZZmdsdzllUkU2?=
 =?utf-8?B?NjN5RFByOVNFRGovcStnemZ5VTdITDh6eEdOUnAzbXh1VnNZclZCUlR5ZThW?=
 =?utf-8?B?dTFSbHQ3dUp3b1h5WXB4OUhFczJwMmdIU2J1TVArU2dVME1WUXJEdmM0YXZL?=
 =?utf-8?B?MWxHTmwrMEdtbGJ5UzZKa1J4d21oTXpKSmZpanZ5STNKQUVpVC81QTl4a1Za?=
 =?utf-8?B?TFB6MjlpMFFka1A3eVd2NHdoR0ljQkJydWMxTVp5aHYxNmpQWE5DeEl1b1Bo?=
 =?utf-8?B?VDZsT3VEcGRVdis5ZkxmTTc0WDg4RUY4cXVXVFBQNDVKQ2drREFJUGVubTJk?=
 =?utf-8?B?MlBPNjJNc1VpMGhJd3VXY0k4RDdscjNNL1lNT0pQWFlLWmtKSjRyVnVWQmM1?=
 =?utf-8?B?TlJYT0RrSTJEMkt3dmdSci9OV1FTL1pGTWFPZVhzUHU2QXBoYThQSHRac3Bl?=
 =?utf-8?B?bjRINDRyb0Exc2EzRFRPUXpiaThXOUZ5VmpTbFcyUk91ZTdFUFBLRWN3MTN0?=
 =?utf-8?B?ckdzcC9ibGQ4VVdRdkIweUZlVm5scC9wZzN1WTNrVzVRajdKcm1yakZtOFJG?=
 =?utf-8?B?R2U3SnVEbDJ3Sko5dTVyZDhhdXZjR1NjdUtnb2RsRk9lYzIzK1BJeGw0OVNn?=
 =?utf-8?B?Z0RtTVpPaE1obVA0R1FWektqazRoTEhHdnptRktoajN4TEZhUFJkbTg0UXBK?=
 =?utf-8?B?UjVnOWpNLzRCeWFUMXh3ZHhQelVJSnM2UFZtWnhlUXB5YWIvRkFURmZVb3JJ?=
 =?utf-8?B?LzR1UGh0djJ6a0lEU2JWckkyMHJIbUJpR0hnRzNrQUFiMmluREtzaEZOZmxz?=
 =?utf-8?B?T0IyTjEzWFUxRTdPRXIxV3lVdjlldGU1OWk5bEVwUnNqRm9VYVhRaW5vK01P?=
 =?utf-8?B?Z29leUNwUTIzanhKSDc3cWcxZm5FaW51YVBkeXlFSlBybW9ZTnhFWWQ0L2VD?=
 =?utf-8?B?NU5nMzZtSEJyZGN0WTVKbDVlMlpyam1hQ3VBUy9FUkFaQ0piWHo1Z091UVhn?=
 =?utf-8?B?allueUlzUEk1NWp2VFhiZk5GenlGa0YvdWVrVTNycGZOSDdEV29ldWNiOWRz?=
 =?utf-8?B?bi9HV0VpT01yQWhaWFhCR0hLMkJwUVc4cnYrYnlzeWs5SXNxYy9nRC82RENi?=
 =?utf-8?B?alZlSkx3MkJiSC9OSm1DNllTbm1LNjUyNFBDR1oxUmpZZXk0MFlQNEoxczNm?=
 =?utf-8?B?eG5YT24wWGJQQXBsTkVTdXlLWFhjUmVwNENKT29DRTFNNGZuMTRySWtmWXZG?=
 =?utf-8?B?WXBxNmxHMVlPTC9SMEFnMzdHQ2xHeHB2N1Buc2JBeVZZTjBLWmRrTlozTnYv?=
 =?utf-8?B?b21WS1R2SVZwWHcwbE5KRnBxalg2S21RUlN2eHphbkYxV2Q2dGMwZUxLU3J2?=
 =?utf-8?B?ZVhmSG5yb203UlAvaUtKMFVBK0crbkxKYzBERHZsY1B1cDQzKy9waVV0Wk96?=
 =?utf-8?B?N3hmVDlWRWhCU2lSWmdFK2EwZDA2b0VvZzhNd0Z0VGJEOFNGNWJ1SlA4VTNZ?=
 =?utf-8?B?eE8wSGp4d2xLdFBXQm1OdWhKeUhJaEVpUkc3U3FXbk1xVmtqaS9udEMrYW9n?=
 =?utf-8?B?eGVIZVplY3lKbTJ0RnVraUNjb3JIaHAwalhwQlo1WTFzR1NnMngwOHJLNWdW?=
 =?utf-8?B?R2JHOTVxVHdLeDhVMG1RSFNneDR0SmpGdCtmN0xtOEJkMmlRbTB3OUwxNGlz?=
 =?utf-8?B?RDBpVS9oVXhGejNGMEJwSmNSdXJtMmh1cW9TWmxsdDczMnd6d0NtcUxlMWpZ?=
 =?utf-8?B?M3RzSHVXdkZxdTd5bXJTOU5GZDVMSFNxbHRzcUtPRHdBWDRDbGthUFplQ0pP?=
 =?utf-8?B?Qy9NeUNIZ3laQkxhTDA4dlpqVlRIR2loSWlnNXJidWtOWFArWTROS1FOdndj?=
 =?utf-8?B?QjJWV205S1ErOTlzNm9oVXErSXBQYnV3VUVlZGd6eFBxV2RoWXIwQU5tb3Zi?=
 =?utf-8?B?dEliRXBqTzkxUFc0cmk5UWtpWnVCeUwzM2pkSU0wRGNpeERkOHlFOEZLU3lD?=
 =?utf-8?B?cWsxT0dhNkU3SW9Edm1TbzZSeFN5anY3WDBMeW1KcWFNZVNJQTNaUER4cFRT?=
 =?utf-8?B?OFRoNlBYODFMY1lRem9ueTVGb25XSzdrL1pSQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(52116014)(376014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXNzTm8zTk9xRGVuNmJ6NXdGMkZPQnRHa1JFRDVTenJkdlUvNFNFVC9qWnh2?=
 =?utf-8?B?TnVWeVVKSWJuRVNaNlVpRGFnTytRVmFKZVgvT0JKa3JXY3hKRnl0aXdXb2tG?=
 =?utf-8?B?SFFrdGQ0VlRoanM4dUFCRzlvOWpUejFTZkEzdUVpVmxFcnVzTzZzdTVSZTA5?=
 =?utf-8?B?MWpwTU9DMnp6RGJQN0pZRHcySFRjNnFLT0ZNVlhDalk5NDVpN1R4ZWExaThV?=
 =?utf-8?B?SHozeHh1cXcydVBsYTN4TXh6M3FINzllNmpBanJtSEl1VEZ6V25jL2o2S204?=
 =?utf-8?B?bGcxa1A3NjFvd2pHNktYZ0RnYUlPVkVkV0NsSmF3dlpIU2EySHlMaUVvZ3Zn?=
 =?utf-8?B?S1NSRmVqV1dBakkyU2krSmhqUExDaUtoYS9pQmM4ZmFZSEIzMDlyV0RMcG5z?=
 =?utf-8?B?eFZEbEtFaFlSSGpUeG5NbGZNZThhQUhQWEhPOE40dWZPM2k4bkxhcC9ZcDdF?=
 =?utf-8?B?aC9xdEpLNmV0SFlsNmswMHZ6cU1BbHh5RGR2T21lT1Z2SGJiVEtXS3Y4RXp4?=
 =?utf-8?B?VU4ydWpQUUZvMlFzc3JYY0ZZbHpXckpTNTk1THFOSyt3VXEvQWlleVFEYnJJ?=
 =?utf-8?B?WHk0UTI4SlJVbmJkekg0RmFGa0FaelQvUkRBM25waXVnWFVQQTJPUVJ2ZzJs?=
 =?utf-8?B?YjZTbjAva1pUZXdzSWpPL3lETHdnU01BL2NqbWRjZFkwempBTGpuWmU3c1RP?=
 =?utf-8?B?MVZ3ZmNNMi9IU2VyQy82NlFrT1hJYnFPY081aTV2ZG5qSGNPQmhxaUNSS0or?=
 =?utf-8?B?MUZnWTdYTEM3akFldmphak81VU5jUnpkVW9oSXc5M1dIb1BDc1pMQWQ0ZW84?=
 =?utf-8?B?d0V2RFRoSit3ZnVzM2RKOSt5Vko1ZG5KSW1NNlFIZGVGckVPMStWYVJueGFu?=
 =?utf-8?B?OGY5TFdXb3hLeDBzQk1xVTAvWDIyK0cwR3F4QVlmNzJVb3BWS3o2Y1VSam02?=
 =?utf-8?B?VTdYTXhobi9FU0REYnd6UW85cE9pb3RocWFlMkQzbk5zSjluY3ZuaTQvVmZL?=
 =?utf-8?B?aGlsQkdjMUpCcTBQTU5UR3RQN2ZIdkZBaTdXZXAvcFQ5TTJwSit4MVJsWEFF?=
 =?utf-8?B?OGlZdHlzR20xL21qeEdZcmV0aVlqL2k4MWN2NEsvVW0rWkdBamtHR2lPdWJ4?=
 =?utf-8?B?RER6dFdlVjlibytSWlBobXJWVUdYblBzVlhvOG5CMTM5Y2dnblFlLyt2RTFz?=
 =?utf-8?B?TUxnTXRneERqMVc5Z2pBcjBxOE02LzFUYmFCWkZnZTJsY2hDV1QrOGNmem9v?=
 =?utf-8?B?TzVJYy8rSWsrczhxMkpPOU9vSXVoamRzMFlIVytRUnlrbEFiaThaSzhEcndE?=
 =?utf-8?B?QUpmVkZwakhKUFZpc0NjTDRWL2E0SUZRTFBoS2hLdTVhQWd1eGZiWTdrT1dJ?=
 =?utf-8?B?bTFaRVU5akI3SUJBTllUck9iR1Iya2lITHloTGszby9FWEtWM2l4MDdRcHF0?=
 =?utf-8?B?WUtYM2JQVHdQWklSemIzUlhHZjVoVnFwbnk2eURERXhWR1lqK0toS2s3azFI?=
 =?utf-8?B?ajk4RGk5YXRxb01iUjhUT3VzckNaUjB5S2NYQU9xUmRNQ1RFQkhVTjVaZ3ZU?=
 =?utf-8?B?SVVxbVp6SFpaRi9tT29wM1ZTL3Y3ZmhONFNwYThMdmxEOExWZE1NazhzU1Nr?=
 =?utf-8?B?cU5sNnZLd2J1blA4cVRtK2ptZGFZQ0RhV1FzbG9IRjdBQjAvbnNUc0k3WEpG?=
 =?utf-8?B?VW4vcFBwRHRJVUNCUVNvNXdZZnowYnF2NU5nQ0RhcmFFTXlyK1lRZHQ0Qndn?=
 =?utf-8?B?NlFHZXN3ejVlN2FXeS9mbjN2RmJvV1VPbUNFaGZTM1MrUXBUb0pKblJzSXFh?=
 =?utf-8?B?L2xvcmJ2b0owVWZ1WGdyb3k1eEdVVXN6TWZ4UVJvcXlGd2ZuM3NSRnNIZWU4?=
 =?utf-8?B?RVZSRGY1MGs3UU8wL1RrZXREN0hac1Jya2MybklYM1A2SFFKZCt0MzJNQ1Bt?=
 =?utf-8?B?TFR1NmwvcE1DNWFkUk1UWmZyUVo5SzYvNGZkOGdpUTBPLy9GaFNoblUydVZK?=
 =?utf-8?B?YVJPSmRESmVNZDI5Q1FCeXg4SjdJelgwS1pZWWUwYXptT3I2S3dRNjAzZk1p?=
 =?utf-8?B?RGpLK2FYUXJDcTBNdmRPVXNLWnlKZ2krT1NhNkR1d2ZXcnQwek4rUmtpY000?=
 =?utf-8?B?eG1QTUdNMzA4cDJ3QzF1OFdSWWZadThBQTNPZ2N4TU1XS1NEb0tQOEVmYkhT?=
 =?utf-8?B?UUQxVCt5T2Vua0FOVmRUalIrTW92bUhQTXdYNDdEbUdocXRPbzltV29iR0Mr?=
 =?utf-8?B?K2V1VVg3ZEFmQnpIN0g1V1RiSXJKTzdUUmxxQmJzZGVYSHNEUExrMnNpQVpS?=
 =?utf-8?B?ZXAwY0RMV0ZVY1FUM3V3ZEszWkxySElrUXZKS0hEazJXZEpLOExYdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f3e577-ad46-4e21-ea7d-08de4f77cc92
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 12:08:28.8512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HggpcR6IiBkGp8DsKB+q5s4MHOWG0DZJcAVYW4U706R35U3UMxBEjbRADAXEGpX1DMAhrrBsaiXey757/Qhvtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9480

From: Peng Fan <peng.fan@nxp.com>

Add compatible string for the Cortex-M7 core in i.MX95

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 57d75acb0b5e52ca49d1361176fdebc18a0bf7a2..ce8ec0119469c8fc0979a192b6e3d3a03108d7d2 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -28,6 +28,7 @@ properties:
       - fsl,imx8qxp-cm4
       - fsl,imx8ulp-cm33
       - fsl,imx93-cm33
+      - fsl,imx95-cm7
 
   clocks:
     maxItems: 1

-- 
2.37.1

