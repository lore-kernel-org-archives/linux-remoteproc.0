Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2074.outbound.protection.outlook.com [40.107.241.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE6C28628C;
	Wed, 19 Feb 2025 02:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739930479; cv=fail; b=pzJLJV2u7vmtYt65jweNhLVkQKZ/nDKOkF41PMLPdVxSaIRDss20IfyN+C0msE1z3mE1aVCO6ve8GsHJ6Wxif9ReM7lb/EVTVmmLrB/qXJGFPjh9VKZjCnjJSJ0SgoMbhfkgOy7knHYHMBhLVarYASNz12v8NTjGMp08EYoqaOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739930479; c=relaxed/simple;
	bh=EL7g50UOcnfkkE8ClILrbdTdq+Gjd+tEtppvxpyzgco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lHutDnZXxU7HEwQcPVyvwq7KaWJ9pd3D0qm+ovX4JF9yVTkIBk1XTYEkqRtGzSRbdEhRf8bpI3CZRcZJJ9Sx8uBVwK99usfzsVOS3P7SUIVgsGwIgJOVwBX3F35BuyN5PcgnQop+eomdcm1mjOqM0nvnGGbZZ9lssKVGnPNZGmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FBe8xNLM; arc=fail smtp.client-ip=40.107.241.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FBe8xNLM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RfFK7gPOCZByltNJX248A8RM3l86Xf7aUQumCRpb0d+S9tR6C31b/sKu/30JFY6hxSs+ZtIklYfhX0uEiM+xTKUTgYZ2a58hpzNh01COrZ2MhpJbTXc4v5cjZAKIilK8Xm29gDdLNpfvBV+1p1bHh20DNhi79AFUk6e7X6NzdRVfmWDiJLMWqW78raYcSS7JzsmuyQpOhZZ6FCfroyHBD3iYcO9Zso8n+QdALN3/ZWAvE+ZDJn7K/Njmf3xrqGpJCm34Lafv0eJP8GQHiEQioJfA8Xy447OPkEInbMMZzKabkNUPbO55tTI9B/zq+rmS7v2KEW17FY3N9sxUyRNzow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EL7g50UOcnfkkE8ClILrbdTdq+Gjd+tEtppvxpyzgco=;
 b=Vh3beiQFMAUs4vlcvhz7TAi+rdIdOnFppO5v9c9jaWAkaKBfXjgB28pElWWnuR7hiBNPAX7Kx1WF6taCQ9RsR5SusP/t9uIOoEY1ObteeiLaOxT6I0P60HiaY1QRhqMGsofELeq5kBinhVYVMv8UoKOWtHjJcB9hxYdghhqhGngapIl3SfUQs4DWv+Lbsl8+4L+W7k3s+1CG7gMmpOYgZE9lMZrC+QqfnJtIH6P+lcwxT7siTe13bqf358qKVYoqdSpeN/3ha2ytCikaY+z/ZABk6X52HlmwMd5LBUU/QBHyGwwA2MhqvnpcjLIODUD0Fw8DegIJtAepW6Z3kN4cmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EL7g50UOcnfkkE8ClILrbdTdq+Gjd+tEtppvxpyzgco=;
 b=FBe8xNLM7yDV2gcIvYa96k6h8fcSHwOAjbcTCair0d3zWI82iBLQ06rdcW8RjXUIqZ1XW/ttNRgiCwufsvGgjRosAnV9ujAnn+w59RXs2qLpDhYq52KhEMSXyA74NXQg740680VKukvQMOxFcVRWJ9xsVc/vvslyKhYyz6mFCDp3RYqHnpPOA4xb6PYOT9dgvjleV54kP3aPWHss7PrYPKUHvzSXezsU9wk9TNqFOEJ23Mzp2kXEPmBA/G8I6/YPIsewE1zJ+81gnbc2QrW/Gn5qNsk4PS8jIsR8/9y+n2kyjIK549Rx7u4Ln2sy1t5v25fWvIubbW+HvSJWlVWNgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PR3PR04MB7227.eurprd04.prod.outlook.com (2603:10a6:102:82::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Wed, 19 Feb
 2025 02:01:10 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 02:01:09 +0000
Date: Wed, 19 Feb 2025 11:08:09 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: p.zabel@pengutronix.de, shawnguo@kernel.org, mathieu.poirier@linaro.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, andersson@kernel.org,
	linux-remoteproc@vger.kernel.org, iuliana.prodan@nxp.com,
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, Frank.Li@nxp.com,
	krzk@kernel.org
Subject: Re: [PATCH 5/5] imx_dsp_rproc: Use reset controller API to control
 the DSP
Message-ID: <20250219030809.GD6537@nxa18884-linux>
References: <20250218085712.66690-1-daniel.baluta@nxp.com>
 <20250218085712.66690-6-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218085712.66690-6-daniel.baluta@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|PR3PR04MB7227:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a27d2ed-4d63-4c1a-cbe8-08dd50894523
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w6PiAkM0NVpZbmRa8A1izrZg+ARjax+V9KCierCCkZyAVB8jglTQwTdP3bpG?=
 =?us-ascii?Q?fwpU9otBWMK0IW9BcLD7Zk9NBdrkG7lUvDS33wryohbpNTKQirHI4eUh40w7?=
 =?us-ascii?Q?iSvE5XOQ73lMzFdD07VGYkdgCcDPcMzjUOR9sz5E+e+945XrmBe/buovvDUY?=
 =?us-ascii?Q?enIUmyw1fzFXTpUTdxVSE333xDH1TtKND4fF0mMsfQBfyXV3jx4VxWKFYWdb?=
 =?us-ascii?Q?2v2oLT21Uh32HnBsZo5xX80HeNJVfij4vUvoiOLTtVmk5DKeJjs/evcnffF1?=
 =?us-ascii?Q?KQNECeiZUiHC5uP+pxDlvYCdlQ39ziG+8zH7dfRJRThKNrukG4O4WHU1c6EJ?=
 =?us-ascii?Q?xummJGAS/Ti12/SDan/lz3OhaAP8vByFfFddLvjoijx3O9KztwTryLaEZy7l?=
 =?us-ascii?Q?bV1sY6i7QRdgkFH1Gf2TX1yjvYRfxCheI/diGn0n1mWgXM6QDKD6boykxCEz?=
 =?us-ascii?Q?ePEXLVec+eYOEhDnqYSkitLbzrDJU8YigZ9Q7XIqM/mjkTUwxawMESGssDw+?=
 =?us-ascii?Q?a3piTYRvYPEUUvWOgsYT7UM71eIV/2koEcbFzBEsMsLQhfEMPRkB3S5InJWR?=
 =?us-ascii?Q?U4GEqUdskspaq7ejuTJinyfV/rzywOd5EsDiEDeJu0uzD5DsCqIHVnkQ8DYm?=
 =?us-ascii?Q?YDuwzTkjieUGms6FlJeYnBsBe3UYJEb352D/SDXkME+z2GtdCLRfn7ZSY4zf?=
 =?us-ascii?Q?KJR5m8N1NJjTvCcEGrZ//q5ZdkOqefqbmjT+E+6fxxEL2X9+GINS8wjwyWuJ?=
 =?us-ascii?Q?FfV5Ho9GHCKhiHGtnkGYuT4Jiulci3EyEE++Td13kJLBFLvDsv37AYKrxEsm?=
 =?us-ascii?Q?uRwnNpu0T5Sgsl1ouxwzXNM9DixUzV7iV4PjKYTxKIwwHKS48v/VSEKMpzKs?=
 =?us-ascii?Q?YyvPw5P5c11C5RX5tPxyJahPWzJhmcQMtYQsyaNM01RI9ymmn38LjoxUWTTm?=
 =?us-ascii?Q?ZKibATB8IkraA8cixC8pakx2YFCHsGmLLw7tNZYZq9sGrvgNPi9X5rlrmjGw?=
 =?us-ascii?Q?TkYR9QC2eTcol/Bp8AuBw8wyFaOjMqFMxG3p2LuV/87y754uzYpCJuMVnT7Q?=
 =?us-ascii?Q?mRiIg+otDDysnnw6DHNk+cK7+63mWTADmSh8vr8O2nkETJCRDkt6D4qKDAA/?=
 =?us-ascii?Q?Zeqo0bD/9lDlYUnXo6VLh2SCYB3Qx2gGLPlN96JoNA0+yeVKbmXYTW0u+Le/?=
 =?us-ascii?Q?bIeFCSEp9625J5NivWSANZgjR49lI01Ga65iuhEWAfE8C6bZyJGG8wgx3heA?=
 =?us-ascii?Q?WvUpm/qKqwO4SMl0bJNuvtm0KMtWSZ3FxHQbu/jSJlSfwit5Jy7/IGZIfjpK?=
 =?us-ascii?Q?k4um8pRiDV1jbQGE9i3N4BKFLcTFzfeYkq0hClhP6vgWz/tL5YgFofw/Woa9?=
 =?us-ascii?Q?3u9iYLGgUrya/kjZb3dO0LJsZ3bYIlQrGmVMTVmkqga0UN5sFtV9alzAG5yU?=
 =?us-ascii?Q?Uq4rIH5oY2JYPwgZW0Roir0MnkMEJIDD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M4XIb1O5QXN/OEjfo4eTxd5roN43L4YORhECb9mbuYdExiv/p2Qq84ddZBEn?=
 =?us-ascii?Q?/QY2KKVTodWbRg/kYF2PeZ5qCQp4riQYxCNP2SSNyTnSG09ZqOqJcYblotSh?=
 =?us-ascii?Q?uNLQgTGXdSB7GrvhAQHXbVsYA0wnz5wtx/Jj2LEtFPIwvwGwYaRd39upXkji?=
 =?us-ascii?Q?ctllk5MxKxC0g0xnN1U+Pm90xeGaFdIR7XBcssUWA+qnIJ5gvqhzSoY8pFWI?=
 =?us-ascii?Q?YzYyMo+cDBXlpBiDk4SAPgamZbU555IYI+CH/a9uynSVgzBlGvgTsRYTl/5G?=
 =?us-ascii?Q?Ys0bbKCauYpLaYOsWxaxSDaj8Ld23SKJ+TMYHCXq6+Qp3DK5D1lQMxHqt3zx?=
 =?us-ascii?Q?ltRZ6r27JFGssK8ZU5qv6AAa8X0Ejzq7SWxY7pRL1x2T+ewfgqVrNm+E0pvL?=
 =?us-ascii?Q?8G5vq3bmdMuDeh4aaTkYYEDl0aTeSLYmzWm/JYlRDzfFGtB+N/gSJpGJmO3J?=
 =?us-ascii?Q?fc1mRseEfO7+3V1lNux4maBIthRqtxjkrww1ksiLhjrdOur0LN+Ma14kM7ha?=
 =?us-ascii?Q?HOGg6w3W3mKfm4ilMDVM4AwV0Z7+qYi5/j/AfAPXkydltad6XjFbexpKjHUn?=
 =?us-ascii?Q?pYlQmJFf5B/estiKCs85kOOj2BBZ8hw36jRi5jvtUeXSCE15oIwe8QVkgS2a?=
 =?us-ascii?Q?+iwEPwJfVUdR6pKXA+keJORAmn/en5LEIiiMo2het2GlKwH/s8ZsVFexMsOf?=
 =?us-ascii?Q?427e71hyz2MMrFn/914jX2HP6VE+/nLvTvCieHUPwPZbSk5adntRjtiXPE4f?=
 =?us-ascii?Q?lnOj9/BAT4fmD7+5VSfe4KdT64HrZ4PDnqwjepX517duwNHaxUI97hzDwLP7?=
 =?us-ascii?Q?uJ/sqkLTICTkoCGSNMnOl3Ugw2Q4+Z0bBFJYPfIuggiab4QzddHMCmV306Br?=
 =?us-ascii?Q?HTA266yDxV2cDbn/D5uYliyjMchbG3gR8ek2Pi88Pvr+Uw0LuolV7FM38ZkJ?=
 =?us-ascii?Q?CwJ1seFYSTIQT9swHjKqU0nqlWfNxyZM2kqzlsJLHGUwisYVHd8axVzD32iA?=
 =?us-ascii?Q?7hZ1tFsFoIdq00Yo3hwD74ZPNN8RTu30zX2nljLTbvEp0NAQPY4mbzTjaZaV?=
 =?us-ascii?Q?/1WwzWnSHpygRA4tZKKh331UQ9bYNf6q+0YXmWD4s1PraMk+VqDEVkuLGxZ6?=
 =?us-ascii?Q?rkhkRpkH0DUgfUtSY2KIFyNN6bJCNZhmUgaWJmz1OjT5osDAAgt1BMq3Gg2B?=
 =?us-ascii?Q?60MkpfR8hfrh8oEHiv399IAy0LL6FS8HQj7aCiceUQ+NbdjGspOurRAwh7vZ?=
 =?us-ascii?Q?Mkr3L8Do6DWM10V1E7z7PHregc3dOkg5dPxi3xixha1ZvOKCdj2eMSbnLFZi?=
 =?us-ascii?Q?0Gwbq8CyPumFa7WXYIQSddP4WfcMwfQuVnKIr35Kp8y8WE90tLqWAd4KV7Dp?=
 =?us-ascii?Q?Re9EOEBuIixcSMFZ9EMQnkJ0vKZDIYvPF4mV6uR4PnxRyJOKCivGsEuib0Zu?=
 =?us-ascii?Q?/PMOgeHlGogpOmbjI1SnKtoGwnSFPPgb4dnKZaeIlVybVNu7GMtJmaCnpFp1?=
 =?us-ascii?Q?0HfZjT1CGMA8McKh8h+t+0+r547Z5CduZnjZhnCTCU8E5d+Z075kAuEyimN6?=
 =?us-ascii?Q?Ww2kUGeUidY6DOsqtJWrMfCWMS/JPS4umCAAKFm3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a27d2ed-4d63-4c1a-cbe8-08dd50894523
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 02:01:08.9111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bBN1jvc+N0taHXM7kC+omtyIo3Dv9cVRRYkMiyrSRC6UCnBdd6ieIekHbMgZAac1gO4lnrhimRF0MCa3JUhjAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7227

On Tue, Feb 18, 2025 at 10:57:12AM +0200, Daniel Baluta wrote:
>Use the reset controller API to control the DSP on i.MX8MP. This way
>we can have a better control of the resources and avoid using a syscon
>to access the audiomix bits.
>
>Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

LGTM: Reviewed-by: Peng Fan <peng.fan@nxp.com>
