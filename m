Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010060.outbound.protection.outlook.com [52.101.84.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB373081C6;
	Wed, 10 Sep 2025 07:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488341; cv=fail; b=sBG9pWT9RU40sDU64FSHW8kleJJ5SU7GwEqeyxIdF5D/QI0Ec2NU1z4kbVBvTfbRavH/B+P7Mme+4dB1/VMN2/5l2jPHfhivcSlDzEUrhECauZaqim/gXu42OmuR3hDB1ZXM/vEL4T1Ns+ovyJdqbZkhnlgvmRhdhoAmzoEW+fU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488341; c=relaxed/simple;
	bh=MxPqiI4U065RSyuo0Fc5C1TukjAl3ocnsj1bgtyxtvw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CLOmXWrcUtboQXSz//ciT8p1dxVv/A6KLaSkC684Rqf393w2IG1T9+9Y+BVHbK2qAxqgtA+36tAfOX8N79pGo7OXgIHXwtx4jQiMoPXXHyEmEYtQDxihPVK/JEx/hTj+xWFKDjia/vJzoB32VkcO2qs4HEkkQIEIvPHkDo/n9MQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=V+a/CVvd; arc=fail smtp.client-ip=52.101.84.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="V+a/CVvd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1yxvHIo2rUxKSQhr0eG+cRQ4U0sAgZIaMPSgHORZ4Ju11/fNmmtsSKR2QQmIAjuFiP94cYV8VmSxnIM5VfDMnZ9yr7Kvi6vQ0pflS8xKOfjI9yfFzcHA2RRA4X1v9qLpRksh21djKGYW4qbc+B+86D+L1PxvFmOas6kws1fnb+UEVgZI71DPjhH6fzvocKmAdril/zOv3wOt8eOR5z4sc3NBhAFFs5TIe+gfWnNVKmIj0VxYV9bwMdaqcjFgkgKf17bFd1sxwHuHM1nPgy1yaIYcRVEuEPSeGxlo4PS7CCWjWHTMlF29hMS3vrvelz/WCf1MSEZRWy/8XKnMivmfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDEKoSArVPdMPuANJoGHAvJ3uo+wS/0ZT6ya2G/PudA=;
 b=Pk0I2Tw0zfM4shkCe+Zeha5TfXgXxJClXxEgP7kLWuLeNUJntA8zEI4yygrUA9mux2S3kFWVMG7d2FbuD4q1EQRQQvhcSL4+00wZPXNCuh4VY0jneS/X2Qr5P4XGF04puEiivhN/8+0bXHlQFWYRfZ/ZH6+sO3q1+25UeHYlX9VfDtWqQxCc6NKwTow+lNP5MrikXxZejb4mIARbO+3+G2k8TbZ2x6SxAv7AsEp5WAH9wsXtG7qn1okRduLiqja8q8OL9d+ODMcTB9S4c0v3kGY8YsCS6BbgbH3bxy7mw7A2EuJsAEqV0KmEcNBPm6rLUur0Ut4S8qjVYCrVAPzBDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDEKoSArVPdMPuANJoGHAvJ3uo+wS/0ZT6ya2G/PudA=;
 b=V+a/CVvdQrpPz97+NdbVfFhKEyZWjvuUO6lfsEGFRyBrkerjv2H5wrc/xD87e2P+XBQA1lE2q0OI7R8ojUcayVqXOo8d25Ced9Tsznh3b9yRks34lmCd7CqiNei2e7LDqo5Ulk/O8W82N9PQ74opIl7MPW1aSOS5fRvTBLTXnXpWHosz2vbJt6uc4hNPrTneQuFrPNp/ktdg1K0bTWqRBHGSMW+4qp4E1MZLgxriSZ+hyIteZvVzLZWI3cJUNyKMz1bB7Txei1BAuq5im68ascTkC917i/pLSS2JiNMnaeue5fdKBI6UNr8uJgD6HurqlPeyFJv3yuAq4/VUXhming==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9358.eurprd04.prod.outlook.com (2603:10a6:20b:4dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Wed, 10 Sep
 2025 07:12:15 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 07:12:15 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 10 Sep 2025 15:11:46 +0800
Subject: [PATCH v2 2/6] remoteproc: imx_rproc: Move imx_rproc_dcfg closer
 to imx_rproc_of_match
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-imx-rproc-cleanup-v2-2-10386685b8a9@nxp.com>
References: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
In-Reply-To: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <frank.li@nxp.com>
Cc: Hiago De Franco <hiago.franco@toradex.com>, 
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757488317; l=6438;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=MxPqiI4U065RSyuo0Fc5C1TukjAl3ocnsj1bgtyxtvw=;
 b=ykJbpOA1arBYFksakgrsNK7jOxiiSRfVJjPpN45dgOfPsYUxqoE0b8+x8CKFD62PK8x3qkDXU
 J5q6BdID1y+BltHgCuhejDc/hp/WfLUJkhhyO2tjdOW92UMAmyk6dUv
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::18) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS1PR04MB9358:EE_
X-MS-Office365-Filtering-Correlation-Id: 66618d4f-b77d-4f4a-fd35-08ddf0395eb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXptRXVZOXlLclg4WEppcUlHZ1NES0lNQnhGaVFQN3NXUUs0T04xTHpLWWsz?=
 =?utf-8?B?RXp4VmgydDlqdmdjMDF3WmFOZDMybDRBd1hwMi9oNDNWUmw4VUNkMTd0KzFa?=
 =?utf-8?B?UXNLMmY4ZmRKWUlBWWJ5QkhuZDl5NU9vQkpWak85c05SekJ2dDd1bkdwOWtV?=
 =?utf-8?B?Rm9TTXp1a1JZd0JQbEcvNk91anNKQWN5V3crajJDSVlkZElqd0pCVEw2WWdq?=
 =?utf-8?B?bms3bGY1MklZZVI0aEViank5TUhIb1hkRHhDMmhOaWpWSTMwYjZYSG5YbzNs?=
 =?utf-8?B?Q1lJdWdsMWZYMFVzMS96dTlFV3RFQjFvVitvWFZZSDFFR0pkc0ltTHc1OEQ3?=
 =?utf-8?B?bURvT1ZsNkRSRlY3RHNwdUZwUmdVeVdhM0U0cmc2TGRVdTRwcHJIWjhqSGRF?=
 =?utf-8?B?K0k1bUpYUEI3eldlbG5zUHcxbkJwWUkzKzRLNmlvM2tnOFREeCs1czRPWkx1?=
 =?utf-8?B?Si9DSStMcGs1ZnNIelZjV3hBRzlITWptWENRcFdkVHhCd3ptSDZqV0sxZFkz?=
 =?utf-8?B?R3RzZDZ4S2Zva0pDaXRQY29MeUMvSUxrdytkcG4vN2JXTmJ5SWxHd3dJTnFl?=
 =?utf-8?B?US9WRFBxNlhYN1FQek04ZEdxKzBuRE5WMTVXUUFYM2Z4SXBVTFdnbUhUbWdE?=
 =?utf-8?B?STY0NkpBa0RsRzd6MktORnRpODJ6NUtaVTNZUDJnZUl3NFFTTmZ1ZUJJMEhm?=
 =?utf-8?B?eHVTZU42YXVNU3g4V0pPaVl5ejFEQ01DRzJzeFlkU0tKNTROUGs0ZEV0YW5F?=
 =?utf-8?B?V2VUcEhnQ1RTeXFsOHAxb0t0WmF1UzBZK213Zm8reTlya0VDM2xIcVhQYWVE?=
 =?utf-8?B?cWJhRjVMWExiTTFVNXlmNzF1bm5JZnZmVW9YQkw2RmhFNFlkbVhqZnRqV0Nv?=
 =?utf-8?B?Y0QvcE5KOHpDT0xPZVVoQ0pOMlc5aUwzVnBCVFlJVEgydmR5bWdRVGwxTXR5?=
 =?utf-8?B?Uk5iUWpqb29mU01SY2ZDNTNNNGw1V1lEZFJObm1XSGwreW1WTlJubGJZdnlS?=
 =?utf-8?B?TkorbHNQWGMwV09ESnZCdEpUNk1kazU1bXhEcHJMMXk0N0xrbHplQWJpMWZN?=
 =?utf-8?B?ZTlKWWV1ZkZlTldSandCY0cyR0Izc0dLYjl4cHlHUHFWRk9nTmhEMDAvc29H?=
 =?utf-8?B?eXhxZWNXYXpFSlB4QlE1clNoWlJ1U3JPbnZWcmFBaitvNWxLU0Z6SnVlZzd5?=
 =?utf-8?B?c2RBK2xFWVhxc3BpUnlvSklnZWRuRThHSHpmMFY2MnFYM245ZUlpVDRCbEVv?=
 =?utf-8?B?MXo1dWxVS1Z0d1V3MGEwRnNWOXgyY0owaFpFN2xnN0ZrS0ZEc01jQjN4cC9T?=
 =?utf-8?B?VWcxUDZvYWU5Ly9YQmdGWEdCMnJ6RjdtVDFSRkh4ai9odGhNMkRTWkhKTVhU?=
 =?utf-8?B?ODYyaTk5MUczM3dFcnZSZk1ZMEdZem5sKzZIVHNSTjhrYlBEYlVVaXFtejdp?=
 =?utf-8?B?R0VWd0JtVHk0RE9KbHFocEdFZzUrYnNLUCs2amVyY0d4WXdCZDhRaGdYYit6?=
 =?utf-8?B?akRqUUhuQzk0a2k3NUhPQWFBK3Z2eDFQUVZOWjBVNkd1UW1mSnFrblVrQnBQ?=
 =?utf-8?B?Q0xtdFdjSDM5ZDRmQ0xqYU5vRDVPMnVMdThydVVqMWxjWGlKU3lZUlRtQUpF?=
 =?utf-8?B?bmxENjhhdjBLU2NqZWpXQVhhdjIwVTdpYVRCVk11WERZS2NaTUFCNjhzOGh2?=
 =?utf-8?B?STJhcmpIbFBscWlIWVFFZ3RQTThzODBFUkJsN1ErQmt4MTF3R0JCbThjVEM2?=
 =?utf-8?B?NklEQmVFV3lZdzJGbGlhZlFNN3owYXIxTnRScnhVbW5tOEJQQzJiV2RtLzU3?=
 =?utf-8?B?UDZwVmg4Q25pWjZxTklxOHh1RlNBWmRQenFBYllrd2ZvYXh4R3E3NVhUQUlO?=
 =?utf-8?B?Yldkc0xybDZrWUNQckNVL1Z3TmZLQXplaS9pOEpsNlBNYkUxMVcyelB2a254?=
 =?utf-8?B?NnRkUW81cHIyY0RYVCtUTjJKbnk5T1hyWTZtRDA1YkcxYzZnZDFKdHQ1TkhI?=
 =?utf-8?Q?P3GWtVwGYBv6NmbWjLIrgkvl5JIuvk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emI2MmtWL1VHS0FzdFdpNzN0WW4wbERDUWs4cVd2ZUdpRUYrTzdxZ0ZvMHA2?=
 =?utf-8?B?MUZaNjJlY0lPY1h2S2crdXNNbnhESkkxRDBFLytxQk5LVnZMYUlUdFBxb3l1?=
 =?utf-8?B?YS9ScWxPNS9EbjRoWjJKcFpNMUJMT29YUjNiY1RyckNWNjEveXlBa0dOcGtU?=
 =?utf-8?B?MVlBUzRrYzhmdE16UEhqeDVFbTV1RVg2c0s0eGFUUFVYb1B6Mmx6UlhQL0xk?=
 =?utf-8?B?YUZWRWFpalFsdThyYUdkQjJQMTB3dkN5SG8ra09hVlBuRWQzaWUvWlA3allS?=
 =?utf-8?B?Sk90QWJYRzhxeHF4OHVmUi9vTVZqTkJ2Ny96aWJDNHd3RHhuT01yeGtFYzU5?=
 =?utf-8?B?SkphakVzTVVjdm5DVjZWMVZtNVBiUitrQkpxNUdiclgrVGNBQWluVU9FMTlq?=
 =?utf-8?B?T0l5amwxTzhRb1Q3TFdnUUdzSGhkSWlad0lGN1EydlE0U1dkY1VRRjBPTmg2?=
 =?utf-8?B?NjhXeVdCY0thTm44T0tJTEVNZ3RNRU4ya0JXbzFmYWZ4N2Q2UThCOTR4SkVN?=
 =?utf-8?B?RUNkWENvN05SN1NldGU3d0tOYmxSUDBQZHpHVTltWkVmTXNicm9xeEtlVEwz?=
 =?utf-8?B?VEpmSDdXbGV5bWROdzQ0TTExSGI2V2MyTFhNRlJpOFk2U3k3SkdrTUd6WjZt?=
 =?utf-8?B?VnJ0a0RxZlgwUHVCR254NXlLQS9ZY3d5clBzOWZkUjVaZ0R6MWk4L0hMRW14?=
 =?utf-8?B?WnNuWXphSGVIelV3Qzg5eEpNRVNCbjJCRlhUSUxTb0R4dDN0TjM2S3NBVnVp?=
 =?utf-8?B?ZjBaZXlxa2VwblJwK2ViS3k5c2J1a3JBcDlrdUN3Znc2TEp1OTRaNzR3dm50?=
 =?utf-8?B?K21aRGx5VkM4UElQOEtsSUF1WXJDRUZsNUdmcXdiYVIvaDJlOFhVNlVqejZr?=
 =?utf-8?B?WForR1Y1TzV3c2V6bXV2aTNzRmREN1Exc3o0T2ozeXJ5NitJS2xsaGRaNEtS?=
 =?utf-8?B?K29ZMzdqdzk4aWM4aGxDRkZxQXgvQ0ZkK0F3VDMrQmxVbE9Rc0JOaW91L01F?=
 =?utf-8?B?a0dNcWRocFV5S3pZTHoxb0ZPalREeXpjdlBrNDV1WDFLUWw1V3pLSXJsWGZU?=
 =?utf-8?B?TmthQWx0NTFvKytVZytCa2drbE5qUXBMclVWa0dWR1lWUGFIdzhFdng0YSs1?=
 =?utf-8?B?RDFJOWhuMzIvcExicno3Rmt0c0ZOZ09CbzNNUEtBbWd1eXRTMnlESWRjM0Jx?=
 =?utf-8?B?a2Z5cWVvN0l5MENjQWIyc1NQKzllSWxVY2NnR2dYYlVtRGRCV24vd1o1RFJs?=
 =?utf-8?B?bzdWMEV0R0UzRXZBbXdRVktDcGc4MlA0VmFLNjI4cU54a1I0dFg3TVZOS091?=
 =?utf-8?B?UW1rT2xtNFhsR1VqSmJGK0NIclJhUkIvS1NqdWxscWVqL0pnbWJpL21wUEFi?=
 =?utf-8?B?L2hWSGtwMmtKRVJxRit0aEIwMXMzbFJlU2VTTVoyVFBsSUtURzVTdFRmYkpa?=
 =?utf-8?B?OUdjWTdKV1B5eTFzbm5USjFuckZjTHh2bXRLdUVhdHNjbVNmVFNXa2ZZU3da?=
 =?utf-8?B?b01PKzlaVERmS0k3aXMrdmFPemlSRVVjMDVISnB5ejZ2MzdtZ2lhSXpvZ1lW?=
 =?utf-8?B?YmU5bUN4N2hXN0hZN0x5NzYxR2hvMjdOR1BmQVU3Umc2Zms0clk4Y2NzZldl?=
 =?utf-8?B?MFFCZzFsV1lnTWw1dzJPNXdyaGhIT29qNVgwZEFoVjVYYzZoUmVpVDFNSXlQ?=
 =?utf-8?B?MkhCVVEzcFJXUzVJVktFaDR2NGtoTFcxQUcrQTFzWTBtOVBwTGh2eng3bXU3?=
 =?utf-8?B?d1pJcWM0WVdJTE9iYk9MYmZuWWoxd0pCdm9QNFpoU3Rrd3VIR1gvSVZpUElN?=
 =?utf-8?B?WS9ZSXpOU3ByM2IrNThrKzNsK0xJam81bVgwVVM2MkVETFloUGg2WXBNM05s?=
 =?utf-8?B?MVQ0bDRYbnVzc1hCVnpuKzFUM0R5VXExeGZPMTQ5VUlSWG4zdVd5RXZOckxl?=
 =?utf-8?B?M3BqVUhNRnAvUldSQ3MvME1mdDFDNFgzWjJOR1JBeE9uV1JxMEoxUjdOanIv?=
 =?utf-8?B?a2w1eHZHcUEzeVdtT1RkakMxeitQVmFWT2pVZ3lsTWY1Qi9DK3JqbWVzbzZ1?=
 =?utf-8?B?alk1VWtVc2lPa2dYRHZGQmRFVWIzeHluYWxoLytPbnptcTk4OHNjMStSb2RV?=
 =?utf-8?Q?TCxmHAbOS+4UAvds94Y0df5nL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66618d4f-b77d-4f4a-fd35-08ddf0395eb0
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:12:15.2643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQguGtGZ4XI+nleOwaxYeAU9j5JAXyLywsynpiCugAp9NbIQ683b3mGR7z+hPi2akeNbrbYaVar30gRT2bmMRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9358

Move the imx_rproc_dcfg structure definitions closer to imx_rproc_of_match
to prepare for adding start/stop/detect_mode ops for each i.MX variant.

This relocation avoids the need to declare function prototypes such as
'static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)'
at the beginning of the file, improving code organization and readability.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 158 ++++++++++++++++++++---------------------
 1 file changed, 79 insertions(+), 79 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 5cdc5045e57566e817170ed3c708dad6108d2e46..af7b69d750deed734668cb413b29378e5ca7c64e 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -285,85 +285,6 @@ static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
 	{ 0x80000000, 0x80000000, 0x60000000, 0 },
 };
 
-static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
-	.src_reg	= IMX7D_SRC_SCR,
-	.src_mask	= IMX7D_M4_RST_MASK,
-	.src_start	= IMX7D_M4_START,
-	.src_stop	= IMX8M_M7_STOP,
-	.gpr_reg	= IMX8M_GPR22,
-	.gpr_wait	= IMX8M_GPR22_CM7_CPUWAIT,
-	.att		= imx_rproc_att_imx8mn,
-	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
-	.method		= IMX_RPROC_MMIO,
-};
-
-static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
-	.att		= imx_rproc_att_imx8mn,
-	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
-	.method		= IMX_RPROC_SMC,
-};
-
-static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
-	.src_reg	= IMX7D_SRC_SCR,
-	.src_mask	= IMX7D_M4_RST_MASK,
-	.src_start	= IMX7D_M4_START,
-	.src_stop	= IMX7D_M4_STOP,
-	.att		= imx_rproc_att_imx8mq,
-	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
-	.method		= IMX_RPROC_MMIO,
-};
-
-static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
-	.att            = imx_rproc_att_imx8qm,
-	.att_size       = ARRAY_SIZE(imx_rproc_att_imx8qm),
-	.method         = IMX_RPROC_SCU_API,
-};
-
-static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qxp = {
-	.att		= imx_rproc_att_imx8qxp,
-	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8qxp),
-	.method		= IMX_RPROC_SCU_API,
-};
-
-static const struct imx_rproc_dcfg imx_rproc_cfg_imx8ulp = {
-	.att		= imx_rproc_att_imx8ulp,
-	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8ulp),
-	.method		= IMX_RPROC_NONE,
-};
-
-static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
-	.att		= imx_rproc_att_imx7ulp,
-	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
-	.method		= IMX_RPROC_NONE,
-	.flags		= IMX_RPROC_NEED_SYSTEM_OFF,
-};
-
-static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
-	.src_reg	= IMX7D_SRC_SCR,
-	.src_mask	= IMX7D_M4_RST_MASK,
-	.src_start	= IMX7D_M4_START,
-	.src_stop	= IMX7D_M4_STOP,
-	.att		= imx_rproc_att_imx7d,
-	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
-	.method		= IMX_RPROC_MMIO,
-};
-
-static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
-	.src_reg	= IMX6SX_SRC_SCR,
-	.src_mask	= IMX6SX_M4_RST_MASK,
-	.src_start	= IMX6SX_M4_START,
-	.src_stop	= IMX6SX_M4_STOP,
-	.att		= imx_rproc_att_imx6sx,
-	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
-	.method		= IMX_RPROC_MMIO,
-};
-
-static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
-	.att		= imx_rproc_att_imx93,
-	.att_size	= ARRAY_SIZE(imx_rproc_att_imx93),
-	.method		= IMX_RPROC_SMC,
-};
-
 static int imx_rproc_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -1222,6 +1143,85 @@ static void imx_rproc_remove(struct platform_device *pdev)
 	destroy_workqueue(priv->workqueue);
 }
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
+	.src_reg	= IMX7D_SRC_SCR,
+	.src_mask	= IMX7D_M4_RST_MASK,
+	.src_start	= IMX7D_M4_START,
+	.src_stop	= IMX8M_M7_STOP,
+	.gpr_reg	= IMX8M_GPR22,
+	.gpr_wait	= IMX8M_GPR22_CM7_CPUWAIT,
+	.att		= imx_rproc_att_imx8mn,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
+	.method		= IMX_RPROC_MMIO,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
+	.att		= imx_rproc_att_imx8mn,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
+	.method		= IMX_RPROC_SMC,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
+	.src_reg	= IMX7D_SRC_SCR,
+	.src_mask	= IMX7D_M4_RST_MASK,
+	.src_start	= IMX7D_M4_START,
+	.src_stop	= IMX7D_M4_STOP,
+	.att		= imx_rproc_att_imx8mq,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
+	.method		= IMX_RPROC_MMIO,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
+	.att            = imx_rproc_att_imx8qm,
+	.att_size       = ARRAY_SIZE(imx_rproc_att_imx8qm),
+	.method         = IMX_RPROC_SCU_API,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qxp = {
+	.att		= imx_rproc_att_imx8qxp,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8qxp),
+	.method		= IMX_RPROC_SCU_API,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8ulp = {
+	.att		= imx_rproc_att_imx8ulp,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8ulp),
+	.method		= IMX_RPROC_NONE,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
+	.att		= imx_rproc_att_imx7ulp,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
+	.method		= IMX_RPROC_NONE,
+	.flags		= IMX_RPROC_NEED_SYSTEM_OFF,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
+	.src_reg	= IMX7D_SRC_SCR,
+	.src_mask	= IMX7D_M4_RST_MASK,
+	.src_start	= IMX7D_M4_START,
+	.src_stop	= IMX7D_M4_STOP,
+	.att		= imx_rproc_att_imx7d,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
+	.method		= IMX_RPROC_MMIO,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
+	.src_reg	= IMX6SX_SRC_SCR,
+	.src_mask	= IMX6SX_M4_RST_MASK,
+	.src_start	= IMX6SX_M4_START,
+	.src_stop	= IMX6SX_M4_STOP,
+	.att		= imx_rproc_att_imx6sx,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
+	.method		= IMX_RPROC_MMIO,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
+	.att		= imx_rproc_att_imx93,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx93),
+	.method		= IMX_RPROC_SMC,
+};
+
 static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx7ulp-cm4", .data = &imx_rproc_cfg_imx7ulp },
 	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },

-- 
2.37.1

