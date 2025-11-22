Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011043.outbound.protection.outlook.com [52.101.70.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22EE24E4A1;
	Sat, 22 Nov 2025 00:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763773134; cv=fail; b=rBcUI7DKCu19I0lJQRtgKx3cfSw/62e8RXbGQvCQSQvYIEh5W4IRwe4WlXVxiCuO9fbgXQtRHsXHhA++rQgUlcOVdTNVPZwaK+vVwTt6kwmKLDVPL9pr0FXmhZxjyyI9xO4yO0JTNJCTQ0VpkMAnPSENFaQ7LhpIrKhhwNlZ0tI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763773134; c=relaxed/simple;
	bh=gG0bGhqp9XF3OONvUskPPdPwCz8bB0ntxwpQNT3TiIc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Tpv8+airJZSOYV+ZtZD4eJlQ2aRwsBZDMrY6mrAtt1UrR+IZzzTqB1ODbpypUOHzQBk04yawPJSRAt7dEt97BCEwcFQGlNTbK9rioRwLj/5yI0P6VbiDPHP5RzpKB7+cxcI0JEeOVR1BDzxFGaqJmgDN7iHwJGQmmxpos+JKF+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NEja6aC6; arc=fail smtp.client-ip=52.101.70.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NEja6aC6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sq1gbNxA4qBtTSJ+XsDiXCt5JZnNSdiNA9RysQi/ezPqe5UD/I3Dg22XY3p4/gcVm2Oajtfk09Yli+YmYL7EFRnIzKhR1B3zn6q5Qs3cFJ2bk4+fgy6mhcyT16qRQVAfJdckdpKL2KyjaIfqCMFawahYKyboBOq9UWjDq+MoO+qCK+01hQMUS4MQSUdaFO7smev+imMSMhks8pHDDjbnohdTCsfSnwmy6YsR/g9LT0eBJQIJqfiUOXYxN6Vq5p5WImUvF5DKyHzrnGBkv9Vc/yUGRGSG8E+HktHoXGOqtNpoogR2jD0v+G+axMwiGf+BQ5etem1G6HuGzMUMcicxRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5W1tSS6vHtezhgpHNUE7wsR+YFWy3UFq63ExjrNmFao=;
 b=Bj+IA/W/MQVAE0V3l+V/XawrTqEasVOfxE2HF1AruqaO5juS5H4kfKdFofrtoV+Sg8uGfHVUcfrM32j7MkavZPcDd9CTJigYfw7Q1XoqWr9IoFAPT08fbcmlAm+ZCFO7A7ggAJg3GepS1rhEEV8x62hoQM8JBOpiL51WtRzqhIcPPgTpeDAgwBvkpSYJs6F8Tdg5koK2Gm9n9+TapgVgjltLDCBAmZP9R2cxMCgVWQQk8MONltU6hy50+KwFnf5r9uzfAGpazAqX2tkCq92Tm4HjADWuRlNX6/w0t71T2UROcatnL+KkKWmVj/j+tJ7PtD13XAGSNJ27kbC8F7KJiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5W1tSS6vHtezhgpHNUE7wsR+YFWy3UFq63ExjrNmFao=;
 b=NEja6aC6Qt4hGPlkvNMVRMu2sLr186uDBP0IGNIbc9X3Lv/s+AenwpJiaSFSvlZMkOdi+5aQ2ldAcm4eKGqu+4rrZSxH98MwJ/H2aTp2w3ZrVReuUy76aTPbzHYTqIU8EmJb4mEV1EO1rxLTxNCeRJJ85M5vA5x1u+/hrgvUcj+DYKLI4X6xxFmwcFQSjLOPVpPydhrxve1IpB8WYJLB2PtsiJiMI14imnPvrf+TzE6TA5xUswJwljgN79qyYeN9ROSGIvPNR+5oyY8l4sOGW1NdoIbX6SDpbXJQDOWaw+FA2jS9RlMMkK+so/YEle+Otxqb9B/E45UEgtXLmYJxeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DUZPR04MB9917.eurprd04.prod.outlook.com (2603:10a6:10:4d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Sat, 22 Nov
 2025 00:58:49 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9343.009; Sat, 22 Nov 2025
 00:58:49 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 22 Nov 2025 08:58:17 +0800
Subject: [PATCH v3 2/5] remoteproc: imx_rproc: Add runtime ops copy to
 support dynamic behavior
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-imx95-rproc-2025-11-20-v3-2-9ae6ee619a78@nxp.com>
References: <20251122-imx95-rproc-2025-11-20-v3-0-9ae6ee619a78@nxp.com>
In-Reply-To: <20251122-imx95-rproc-2025-11-20-v3-0-9ae6ee619a78@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::9) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DUZPR04MB9917:EE_
X-MS-Office365-Filtering-Correlation-Id: d2a75e0c-4467-436f-d3db-08de29624c1e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|7416014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aHBVT1E3SVVTdnhMbVExeHZxSDl6cDJvd3VYTFR2WXJOSnl6WEVmSHU3Znh2?=
 =?utf-8?B?cWJvZUJ2SEdodWE3Z0dVejJuQjl6ek1hQlprMktjRWdVT2tyVmMyYzNsM2hm?=
 =?utf-8?B?c1ZuMVdWTU5ieXVZRTlaZ25PT2h6WE93ak1qbmo5SzM2LzlXUlBEK1V3WTRt?=
 =?utf-8?B?djRHZEhFT1kwWjVsYU5iMzlhZ0ZtaEJ6OGszK1hKVXNLa1N0WW82c0kwaStr?=
 =?utf-8?B?cmNRbUtJZ3AxTlJadWtlWXBrMWkrZkUzRmZQN3F4cjZjTm1mYTRCY3JXTWhU?=
 =?utf-8?B?U1BqSE0vUDBSZ3ppa0xzNmIrR3JwNFNDZVFLb0NTSDFOWGVKbnR5YTJWRDZ4?=
 =?utf-8?B?V1c3cGRGVmQ4Y3ptYUcxeEdhMHpBeHYwN2U5cHRTbUw3K0xhZS8vQkx2aTZi?=
 =?utf-8?B?TjRGY281bjJZc3FGY3V3S1p0c0xaaGg5TTBYSFc2V1NybXNpZ1NydVNmYjN2?=
 =?utf-8?B?MFBQd1FqL08zUklsTEJpWFZ0bnc2TzZ4NEFMdERqOUlUYkN4MTRUdVNWZmpS?=
 =?utf-8?B?R0JxSnhEVmZxNVQ3bHcvd3dIL1NuSnF6MnR1eHA2eVpWVWFhVFhNUmYwNjZK?=
 =?utf-8?B?WWh1VXh2K0pjbEZ6d3JhRm9SN1diV1RsTE93bXIvUkk4M0hqZWd0NDZTS1VU?=
 =?utf-8?B?VTRnQlFMMEhieTBReUcyLzNSZU9EL2x2dzhxcll3ZGZaSEZIZTRpdThkOUl5?=
 =?utf-8?B?N0tBWGtpTUlnYUhXWGVGNno2SjZOdE1hZ1lEOE5PbDV6bWFETGJtREw0Mm9p?=
 =?utf-8?B?QXIzSzBqVUFiUEd0TU1hVjY3WjZ4S3E5MHIvSnJrL3RHREhuTzZpb3N4MkZy?=
 =?utf-8?B?UWlBaXV2UFdLWXh1QjAwcjNuV29xV01GRUVtejZiaitBTjg3VXRJaStBb0R1?=
 =?utf-8?B?U05VK295NnZxeDBXckpCL1Y2cC9kREZMUy9CamVCWlBnQ1RtWGFTNzJCOHVi?=
 =?utf-8?B?YUZvRzRod2VwZEo3b1R3c1RPMlhRYmFqNWtBMEJLbENVV1daS2R0dThpV0V6?=
 =?utf-8?B?elRwTnFybitDa0JFNWRwUlh4bGs2TmFPTitvOUpLRUErZGFjZHpoMWdsK2t6?=
 =?utf-8?B?SHNLVFozUGc3UmdmUHcxUWpHMFhHYU9lODZWZ29FMHJKeTBhRkUyTklKVXRJ?=
 =?utf-8?B?OVl6cHY0RGw4aUcybHBiNjBFY1UyOEZoZ0pKS0didEtqcjcvdVFWMng0Zk1C?=
 =?utf-8?B?T1pRb3kvMnFWUzh5MGNzVkhwUzlIWnFLakpldFdxZzh6Wk9abTVmTWtoUy9E?=
 =?utf-8?B?UzNhbDZTcTlOMkdrK3RJdXBBMmJZY1Z4NVRscC9uNi9oUHZCdm8zazFGL25D?=
 =?utf-8?B?UTlOemd4dld5eUdrQmJMNWhBSlh2NmtzOTd3NVdITlR6dGZCZC8wZlRTOXlX?=
 =?utf-8?B?dUR3Tk5BWkp2NEt3aDZsNndxN1lYdi9lWUJXckVKVmRUVHBBV1pjZ21mNDdV?=
 =?utf-8?B?SGhHQjBOSHhZQTNERiszTmgrSFdxb0JHWDRKTXNqVTJxK29BNSs3eG9DNWVF?=
 =?utf-8?B?T2p0N2k0aER4ejZwOXJCNFhnMWRscDQreTJSVVkvYmVvZGZ1cEFYY014Z0Jv?=
 =?utf-8?B?NzdXM2tvR3RqM01LM1hQMW9sVmJ6YlUzMzY0eTRIRUoyRkF6YWpIdEZUdTI2?=
 =?utf-8?B?VHZnK1VzT2JjU1pXbWJkbWlDQU9xbGVpaGIzTDRxeEpSdTMzbGVDdnR0WExm?=
 =?utf-8?B?SXY2S3NCTXZWQUNkUVd1VGl2SWtkbThZOGNkUGE4eFp6aDA3dWpqaDk1SUJ2?=
 =?utf-8?B?ejloU0pndUJJaGw3K3A1NXM3a0tzZ3RNQ1VJWTlFeEhCMG1XQWsxREpXRHhH?=
 =?utf-8?B?L24yYmxtS2dHazVVN2NWMVU1aWlOOGJiRWRDcityL3NGbFBPOGpSTnlpLzBM?=
 =?utf-8?B?UlpHU1BhM3FWak45UzUwTDc4a2ZSVWxiTXdMcDhoSnBZNDhIUG5jYldYMG1h?=
 =?utf-8?B?b3NzNENKYTFNVGRYeVlzWUp1R00rVVV0cE1RcTNUYzBnOW11TGJZTGpSQWsw?=
 =?utf-8?B?anZPYlhtQUNRMXRNYXVYRlRGYyt0VENHRjF5M0xhVDRzVStqdm0weTRkbXUw?=
 =?utf-8?B?WUNnWDJlOXdyM2llWFV4VDhJSzVVeGhBQjdZZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(7416014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TE1NUDNWS3FBRGlKSW5iSzI5eDlhSFRjTWFJMkduR0pWU2tOUFBVTFBIeFZR?=
 =?utf-8?B?NDZTelJobndreS9Lc2tuQTg1Z2VGYWMrR1Fsb3JGK0FFRDgzSHhLZlo2clRy?=
 =?utf-8?B?aGN6T3NQMmlNUWdLZEZMYktDZWhYYkVXclpweExscmNkQWV5TDR3aG9rYzRx?=
 =?utf-8?B?a055QjhyZDBVbmV5cXhTMythZXE4Y2N4blBTbHgwSDNoNWRFUGpDUExzelBp?=
 =?utf-8?B?VnVuYlVNaW5HV0tQVnpDVUxCQ29velk1bCtnTU5kYUZvOThacFFLWHlsbDNX?=
 =?utf-8?B?UmRPbjNhSDRoTkdZM2d0TXU4STdjK1Uyb2ZheFBEdWpNbDdEemUxVEpsakZI?=
 =?utf-8?B?Um9DQWtSOTlCM0doeVBXRXFHK2M3em5oR2FNYjNEWVlhWE5wK05TSFNTTDJD?=
 =?utf-8?B?emt1V0M2aUJIbHhlNmhyTnB4aUE0VHR6SWV6V3NSSC9SRmJIMlpWcUp1dnRO?=
 =?utf-8?B?bm1ua2RzTE5YWUYvaVhmd2RXK09TMUtVTTFMcXJwVTh5R05waFJVNHhSd2pz?=
 =?utf-8?B?alBRZ1RJTmkrV0pCL1lIOUpKdHdKUXRwSExkQTZ6eW9MMVA1SUgvWmtoYVBo?=
 =?utf-8?B?eWZtS3Z1bUMvSmRRN2xsRFMrMTJHaEVKMFhpQncxWEFhZ2kxOWsvSlp6TzhX?=
 =?utf-8?B?c2o4NEx5KzlvS2xMRnNqdWZXcG14MXBISWhKOUF4YVJ5WUdOZUVlcUJGWWlu?=
 =?utf-8?B?L1RxOWlqQzc2Q1puamg5UTFuVEgyVnpySDg2dUw4ak56Sy94aUlvTGZRUUFX?=
 =?utf-8?B?VGFuNlZPUkxGZzgrVVNUNk9XZkVLT2xwUjdQR3JjZkdOT1NlbDE4QVpMcHZp?=
 =?utf-8?B?b3E5dnBmc2h0UnlwaHl1c1c3Z0tZV0VWUXFheXFxZis3TC9BeXVWWlQ0OHJL?=
 =?utf-8?B?dFc3a2I5ekhveHZXYSsyeERhayswbmdQeUI3RjZybzA3bzRCckxUczRCOWFk?=
 =?utf-8?B?aGlyYTdGS2RBV1p2dThjcFpFSExVTktQZUJGZGRYOUlPbjJ3NE0vTzkvSUU3?=
 =?utf-8?B?T2oxSTBVVVVDQkFKT2plZkUrbXFGcTRzK0xVN09CWVphemdrSVdCZFZaTGV1?=
 =?utf-8?B?TXpad2VjbitRd1FPYkJ5bXZEdnl0TUV4TkEwZkxwS3lsNjI3S0hlQ2dpNEJ5?=
 =?utf-8?B?RDVFVEQ4elZHbzh1QXZKMVVJbVFKOEtSTlFiakdFT0NxNXJBaS8zUjdQc1pW?=
 =?utf-8?B?L2VIeE4rWUFRdnh6Z01HLzN0MXNtMjJxYWY4ZGZzYnRRRGRmVGZqMWZ3VEM4?=
 =?utf-8?B?ZWVWVy9hQWhqWjBCUTZ6eXMvOURLMnErbkx6SG53YXFiVVYycFhTV3lvZERQ?=
 =?utf-8?B?MmtuYWt0a3lqcmFwaWV6d1l5M2xyR2x0ZE5iMTYvbFlJVnhyYzFNTDB2NkZL?=
 =?utf-8?B?K21sc0pQanhVeVk1UkRuUVd4L3pacVBkd1hRNWJCL1M0bzlqU3dtbDF3cDIy?=
 =?utf-8?B?MjRnZXVGMDViQ2xUUEJaRVlWOEc1YUZQZVlwTnpQdmxEME42b1BRZGtFdGE0?=
 =?utf-8?B?MlE0RjZTRnZSQmU2RWNpNXBEeDBoazlSbHhvZ0ZqVjVza0lYOWYraDVFSXMv?=
 =?utf-8?B?VU4vVko0WDJ3YUdIajA4V1p4K3IvT3hXbWFGeUdlRWxoeFo2ZCtJV3Fqd250?=
 =?utf-8?B?dmcyZ3plNWp4WHBKZzlqVFlVNnU2ZVhYeHVlSE1wUU9OWmRSdFMzWnhQMmty?=
 =?utf-8?B?ZmU1Vll2VUZBSTdaT09BeU8xYy9JQUpqbCtxbnVrRjMwUEFlZ0VobWI1c2Zr?=
 =?utf-8?B?WSs4cjJsS2g1UWYxTkxzSUQ5a0VKb0ZzQTBrMFl2ZXhxOWI5STlmdGViWVFJ?=
 =?utf-8?B?Z3hxa0JIR3U5aXZPdnBseWE5bUVnVzdGV3pmbTNEV1JpTmpJdXYvM1duNjVt?=
 =?utf-8?B?VWFLMWQxbnRLTGlKQ2NFM09rNkNUZDYraUc4bWYyNS9XYVg3bnJuWTA1OGdl?=
 =?utf-8?B?RVhXOTB0WFFrcU9pWUtycnErQWc3S2RnKzJvOVB3SEZPUCtSZFBqdGdWcEJL?=
 =?utf-8?B?ZUl4VlhOOE9GaWduMUJDRnZ4eG9OZUI5YzQ1UnN2RmNxUTBxaFYrc0prODQ5?=
 =?utf-8?B?YUllM2hTbjQ4Zk10aHlJVkZtZkpoRFc2MUZkVVduT0lxZnRRZTBxeDBsK2RH?=
 =?utf-8?Q?xBI/zwzgd9hFJwkMiGD7snk4D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a75e0c-4467-436f-d3db-08de29624c1e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 00:58:49.4956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGVlqQ+cisoFgNDEft92JDvTyvYIBI+99sGl4kqiNMy+8RR2qJssypOMr98Q3XxQ5NupoUmpwxmd3D5rZO8GbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9917

From: Peng Fan <peng.fan@nxp.com>

Structure imx_rproc_dcfg contains a const pointer to imx_rproc_plat_ops,
which defines the start/stop/detect_mode operations for a remote processor.
To preserve the const correctness of the static configuration while
allowing runtime modification of ops behavior, introduce a new
imx_rproc_plat_ops member in struct imx_rproc named `ops`.

During initialization, dcfg->ops is assigned to priv->ops.
Enable the driver to safely override ops at runtime without affecting the
original const configuration.

Improve flexibility for platforms that require dynamic operation switching
(e.g. i.MX95 Logical Machine ops and CPU ops).

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 02e155e967942d745de4ccd96f9008e4211f9b36..82cb8c7866ccb79061c46068d2039f38feebbb3c 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -116,6 +116,7 @@ struct imx_rproc {
 	u32				entry;		/* cpu start address */
 	u32				core_index;
 	struct dev_pm_domain_list	*pd_list;
+	const struct imx_rproc_plat_ops	*ops;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
@@ -315,7 +316,6 @@ static int imx_rproc_scu_api_start(struct rproc *rproc)
 static int imx_rproc_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
 	int ret;
 
@@ -323,10 +323,10 @@ static int imx_rproc_start(struct rproc *rproc)
 	if (ret)
 		return ret;
 
-	if (!dcfg->ops || !dcfg->ops->start)
+	if (!priv->ops || !priv->ops->start)
 		return -EOPNOTSUPP;
 
-	ret = dcfg->ops->start(rproc);
+	ret = priv->ops->start(rproc);
 	if (ret)
 		dev_err(dev, "Failed to enable remote core!\n");
 
@@ -372,14 +372,13 @@ static int imx_rproc_scu_api_stop(struct rproc *rproc)
 static int imx_rproc_stop(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
 	int ret;
 
-	if (!dcfg->ops || !dcfg->ops->stop)
+	if (!priv->ops || !priv->ops->stop)
 		return -EOPNOTSUPP;
 
-	ret = dcfg->ops->stop(rproc);
+	ret = priv->ops->stop(rproc);
 	if (ret)
 		dev_err(dev, "Failed to stop remote core\n");
 	else
@@ -590,12 +589,11 @@ static int imx_rproc_scu_api_detach(struct rproc *rproc)
 static int imx_rproc_detach(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 
-	if (!dcfg->ops || !dcfg->ops->detach)
+	if (!priv->ops || !priv->ops->detach)
 		return -EOPNOTSUPP;
 
-	return dcfg->ops->detach(rproc);
+	return priv->ops->detach(rproc);
 }
 
 static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
@@ -995,18 +993,16 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
 
 static int imx_rproc_detect_mode(struct imx_rproc *priv)
 {
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
-
 	/*
 	 * To i.MX{7,8} ULP, Linux is under control of RTOS, no need
-	 * dcfg->ops or dcfg->ops->detect_mode, it is state RPROC_DETACHED.
+	 * priv->ops or priv->ops->detect_mode, it is state RPROC_DETACHED.
 	 */
-	if (!dcfg->ops || !dcfg->ops->detect_mode) {
+	if (!priv->ops || !priv->ops->detect_mode) {
 		priv->rproc->state = RPROC_DETACHED;
 		return 0;
 	}
 
-	return dcfg->ops->detect_mode(priv->rproc);
+	return priv->ops->detect_mode(priv->rproc);
 }
 
 static int imx_rproc_sys_off_handler(struct sys_off_data *data)
@@ -1056,6 +1052,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	priv->dcfg = dcfg;
 	priv->dev = dev;
 
+	if (dcfg->ops)
+		priv->ops = dcfg->ops;
+
 	dev_set_drvdata(dev, rproc);
 	priv->workqueue = create_workqueue(dev_name(dev));
 	if (!priv->workqueue) {

-- 
2.37.1

