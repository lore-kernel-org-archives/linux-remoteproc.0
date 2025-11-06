Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013067.outbound.protection.outlook.com [52.101.83.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126982E5407;
	Thu,  6 Nov 2025 03:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762399905; cv=fail; b=CwEyY7dV3UiAys+C53rd4zk3hUxXXBHha2cAy/T8YM+rbDp2zL9qA5xtgvxo1ZvTFovDoCBFjNWityxz11D0HtYF+VPFKo+ZuUn4LzfKUfuQt1yY4LcK1p3XmD92vwPdSY/odzkCQyKAr9th+2lzL2oB/h/gWV7GqthcLRkNIUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762399905; c=relaxed/simple;
	bh=H1ZhkDk4Tk2E1SaXT47Xny1BX/Nwutje4gk1jOz/Whs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KADP4nLvsDkzxXWcdXCaIWJBrTqQMoXdWLrV0K8bNnhezt5s85kIFybvSTqYhiaHLfrWO0EXLXSMDKMpJHHebO2VDpTtHQNMenuxbgCR/+PqxPkKLPiQPTVh2eegVKqnxd5trmOHDpvQsYTFNjZKRr9KqLpeOG6MR6VuVCEDS9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KIs5IqWZ; arc=fail smtp.client-ip=52.101.83.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KIs5IqWZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFyPlIeOFS67zw5feeCun2dJcMx15a65poC1CjnagYD3hf4vvCKvdXGqgX1NAiRt96WZw5Qq4S5zEpVOR0Lzy5MAyDaiKnZ0ktN7fBZ/sud4xrIXfGjJoMxrcjigccmugsgEKL/9VjDJXl81xDouV+XSUKx4F2KgUXLA8kNNraOqx6EnHWGheafD7NKatRZj0BzgOozZPWLOwBomY6kj97ukZ/RJWbbBCfV4WSwuW0z0FYj9Qw7cnohDCd2CN9MHx0FpTjJWASa/mIoI2DF1+TMTlF/oPurCOSEr38U3sK9NUoeaj4B7zpzpB2cV1CGiU6meH2YaOc9gE8r89gVvqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLlnU+4jk0CusejujmbrSBdKGICMd53A0UMZL60F7UQ=;
 b=u2hTm7+nwzlIiYz+ieCClQlyR4Wrw8ScztviCzIkjHWhxKYGiKhcfWR0y/7CFNFkODBObnLs7lVEIG1ihIAQLc7pWs64qTLeeaUCMeYC866DuLjTaYoKGjYRD6N298SHL0ZyAzk+qScdd6vX7uyyjWR+tIhCg4mzI109feM3f3wKtWuzSWzpH/TGRNE0BD8HnE4sTDHhK1/f+vB5OVrIp9Zl3WZHYLnScCxq7AkWf4F1DtFN/LLmTTzLjJMheo/Cu7jD+tavBWkO3RB3Z4mo/krIkIYupDCHsuP9Mi/6cKVFI5Pxp9G2wbzZMUKT4MsoR9JCMm940Lm2TjC0btC4KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLlnU+4jk0CusejujmbrSBdKGICMd53A0UMZL60F7UQ=;
 b=KIs5IqWZfUIh79tscsfmr9otK29kUYnFdkP33kdDiutE52cxGtsTfnvKRCEQHYNdTii33c4lOkZV1BD1Z+IcxYq86iA3YhrDflB8t47LcakUtYqL+ckPo4c9DxA6b6MUXeNYVrBG9K7ZX7Nn5LTeOV6V9yvhra6Ke67oMNJSJuM1i2jfkuydWuMAP/os5czRHjjJzNFitkOfcsNEYvkba32I7EU45me5iGItl6BLviuC4oTMX00EeArHMVpirNVRvLrcZ7SX04yYsvJuhunoRd3+inzgG73mv5yh75DlPqIC4dhQPRcKfBvD+OiyzVUZmibWeo9GjVy3TgGlP5FSNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6813.eurprd04.prod.outlook.com (2603:10a6:803:13c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Thu, 6 Nov
 2025 03:31:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 03:31:40 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 06 Nov 2025 11:30:36 +0800
Subject: [PATCH 10/11] remoteproc: imx_dsp_rproc: Simplify
 IMX_RPROC_RESET_CONTROLLER switch case
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-imx-dsp-2025-11-06-v1-10-46028bc3459a@nxp.com>
References: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
In-Reply-To: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762399839; l=5427;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=H1ZhkDk4Tk2E1SaXT47Xny1BX/Nwutje4gk1jOz/Whs=;
 b=tCSum5g07h0195CSOzZl39miEEgeEZr/YUs0zzZfJXObPsp2rs1XyYTec0rEJcUW3tbMvvgs7
 +wvEPMwS/B/DLttWKpCS7qkoMrD2Xfwxt59Iez4Wr5ZOz039iTmgRdu
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::15)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: d782d156-a706-4c09-3e73-08de1ce4ffc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|366016|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WlpTZzVJQVM3bHNicUE1aUo4NHRyYVgwZktNVk1yUXFFVFlPeVBsQmd0UmFl?=
 =?utf-8?B?OXZNWFdYYjFSQXczSjRVMWVqZUZkWkFtdFBUenN0dWdCWUo5b1A2SVNGdXpl?=
 =?utf-8?B?N0hsQXloem12bzAvMmNiUk9yWm9MaG9PUmw2VWQwSXRtR1ZLdE02dlhndTBK?=
 =?utf-8?B?S3RmcFY3RlBEY1FUWXVURUl5aXZkR1RsTmJqem1EOWV3YnpyQmZDdUo4a241?=
 =?utf-8?B?Zm1YcFFTdmFlWEFKSlo3Sk1BRk9aZjc1a28yZmtnRnVKLzljSjVhblNhMnI2?=
 =?utf-8?B?dHhIcjFWN3oreDQzR3V1WUtsTlFWSkdCcHJ2V0lSWEcvSzViOW5UUDltalRR?=
 =?utf-8?B?NXhjbVlzaHNiODkreitNUS90c1dLclpyZHJiUTkzVHFwLzFzeld6dG43TUpV?=
 =?utf-8?B?WE9ha3pKelRCVTk5eDREb1EyNXZQRHJRN1ZQNCtheS81ampYMHhMMHZBSzRG?=
 =?utf-8?B?YmpNUUZzN1M3U2oxa2FlTDBNcnF1bTV4ZUd3OFRhNGlBd0liOXBkaUNYR080?=
 =?utf-8?B?MG5LbWp3YjBhYXZZTUNLTGgrbnRnc0lKU1NPMHVLOTFDSmRWQTMwVFpJZHMv?=
 =?utf-8?B?SDR5RzBxajdidHQwV1BiTUI5QkNzRUJ3NWc5d0g5anU4eEhnTm93eGJEaFFN?=
 =?utf-8?B?S1A0eUZpSGhiVVdGM0FYUE55ZFM5Y2I2dGJ0TThSMTMwQmRBZWtabW1Idi9l?=
 =?utf-8?B?YkRSY3QvNHgwcS91Qit3NXFyOEV3ck5Ed1E3aW55MWtiTVBTUi9WNmNUNExr?=
 =?utf-8?B?N0lkNCtkaXIzcUxUQ3BCUWFSU2RxbkVxSUNSU3M2b2l0VnVpTmxXMkVkOUdL?=
 =?utf-8?B?T2ZVQTFkTjRqUnBWeVhKSER5OWZLQTEvVmFlZElrOWhORHJ4MytHVUhCL1Jx?=
 =?utf-8?B?ODQrV3RPTWUzK1MyZ0VYWW0zNlBDZys2MzNEeUhiOGpyVDR1ZkhvY3RZQ0tB?=
 =?utf-8?B?YUFkSXZybFU0SGhvV3VpWit5ZjRmYzVVWFViSTZMM3lVZ0laQlpxRmgzMkRt?=
 =?utf-8?B?ZXhuZ2hlWHZrUUtZQUtUcXpvQnI3QU5TL0p5bnFteDRmVVVGWDZPaDJoV2Ux?=
 =?utf-8?B?dE4zUlRWTjNUaTdIcWtiZ3BHdm1NSnZrTVdyQ0NWK0FUQ0FzenZZKzBYVnpW?=
 =?utf-8?B?Z2p2ZWpMc0JmblZ5bVhlQnA0VFU4b3dkdWh2eXNrdEVEOStFVnpEdnBJM1Fw?=
 =?utf-8?B?alhtWXRwVG9aNldNZWNneFdsamNlNkxzNzh3dlJjckZqeDZkRUowWHhVWDlW?=
 =?utf-8?B?MGdFb2hGbE1PQTk0QzRza1NqWndlOFBWcGxuSjNYQldPUnRoTnpaeDdNdlUr?=
 =?utf-8?B?dklYSklKMlk2czlUYlRQZjRtbVAvdXBHUDJ6WVVGdi9YWHVJQ0g3L1RWcS9r?=
 =?utf-8?B?d3ZZTENrNWhFUDdEaTFrd0tOaHF0RUZ2VWZqWmpSSThDOVdzdXNCbGlJYURD?=
 =?utf-8?B?MGY3eVFjSlFvOElIZEV4OGR6Z0NJNy9oWFppNVdQYWF6WnZ3V201T0xNdlBU?=
 =?utf-8?B?cjlOdWN5Tmc4K3R4Kzc2Y2tQQU4wRzQ2NUxiSGdodFdGcWprL3VaTFYveGpB?=
 =?utf-8?B?bTRpTm83dWJxait3Z3RRVEo1Sm1ldUlLRHlJekFQVTFoWm9RV3VicDdFbnBC?=
 =?utf-8?B?eEljMWJxMDRocG9UMm9Yby9PRDNBRTNoM0ZuS0RhN3E0clpFdjdvTTZMUHR1?=
 =?utf-8?B?TDdIS2xOT1BlRlpVc21FNzE1UmlXK2lYZ3RoVGYxZFgzb3RJNHFWUEpWSm14?=
 =?utf-8?B?WFg3TWV5RXdQTXY3blhHMFVjckhWWTZwZjZvOHc4VUpHTnhHQnU3Tk5HOURr?=
 =?utf-8?B?aTF5ZDg3cFhwVTZsNWM4aWFySGhpeitYdGtZdXlpd0hnQXRGdCtXNGIxdkxR?=
 =?utf-8?B?MURBVUIvT3ZtSGlMZmgxZW5DVjE5bkpYUnh5LzRjN1pxWWtMTkI5SThjN25J?=
 =?utf-8?B?QTRkODM4bmd1L25NcTUyckpJRUFIdk15QlhMUXRLdVZWbXRSYnIvN01mdXow?=
 =?utf-8?B?ZDdOdjE1cDlhMzRuREFrV3pvRVppT2tyVmZsdlhJZzF5R3ROYUlWTmxCZGw5?=
 =?utf-8?B?SmM3cmlCVk5jZGNZS0FXZ3hSUlBtMmFEYys4UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(366016)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bm5oYi9uQyt3QVNBN0JTRmJnMmZsTGVOSnhBWXdjVmUrUzNWYzlZODNJNVBk?=
 =?utf-8?B?N1I1clIxZWc0RFFiQTNUcUhFY1ZKTTlXaUZ5dEcxaVpDMi9JamltTy9LTHNl?=
 =?utf-8?B?eUFHRTJEMjRxdmEyUVJROFA3bW52dHdlckcxVVdrSDUyYjRHQklQcVNCUUtO?=
 =?utf-8?B?eGpCdlN1cHhoMVVQbWNFdFJRVE8zRGtlcXF1RU5GZ1Y0a3Z3UWoxMHJHaklC?=
 =?utf-8?B?TWwwcXd4RVV4ZWN6ckRHNDhmUWJYT0NMcHlPMTFsREhYK0c4djNIV3F2MW40?=
 =?utf-8?B?WDhIMnk2SjBVL09YRmJQL2ZoWnhJTFpJOUFYSnpHM0s2d05paERJUWYvRlIy?=
 =?utf-8?B?dWgvYUtQRnN4cHBSS1hhODI3Vzk4WDh4UjJXay85SVcrU2Q5aDlwZ2R5WWNB?=
 =?utf-8?B?RlE0WXhzS0dOci9QaGU1VWRKTTZsb0hCeUNsQTZzb25VaHV2b1ZhN01pR2wx?=
 =?utf-8?B?YTM5NGwzZmhMeTRqOEE0VmVnalJUNi9iVlBpUW5aUEdJTTlwdkFnN3pPbUZ5?=
 =?utf-8?B?VlFIZTV2VTVDZHRXSWgrd0JGUklNcmh6b0FCbjd3NWZheXJIM3ZvLzlqYkw2?=
 =?utf-8?B?K1UzUk5xdnltckd0MGE0ZnFUa01CcTIvY1RuL1U5N3B1Y2EwRi85UU15YUlr?=
 =?utf-8?B?aXFlb2ViYnNPTmdNY0lUWWFrcXBwQUdZclo1UFFNNGVZRElOTWJZaU04VGkw?=
 =?utf-8?B?dmNFZW5kQllROW9Oc2wzR0pUNTFlelNrR3BtVUwzNC9LQmxPRWFlaEpvQyt4?=
 =?utf-8?B?d0gwWlZEYU9VcFlGSUIzTXU2SW9VUVpXOEhsQnlmUEwvTjVieko5dVlTcW92?=
 =?utf-8?B?YVpMTlB4bVRoZUdVa2k3L1J1QzREUTFVV0dQbjlrdDNaS2RDSTRVblVobmZC?=
 =?utf-8?B?Vk9ZMU5xM3U5WEVpVzVpdmxPVkhlL09nbFNLdVMxczVVRmxidGRxYXdiQi9G?=
 =?utf-8?B?M0JxQmFqdnB3YnNlbGZ3YlI5ZGl2cm00MFFrQlI2WkgwdlJqY1NOdWhIT3Zp?=
 =?utf-8?B?YUJudXVrU1lQeDFzeS9DbEJUdVMrQVBYUW5nazZqN1V4cW9sM1BHL0dpUmNw?=
 =?utf-8?B?R1B1UGhRNERYUkZpL3hlaXplbGU1azhiRWUrVk9hWGtPZTJTVVloZUNJVisy?=
 =?utf-8?B?bUNCMU4rM3NhQ1FBZStqamd4akFDVWZWbkxINGNEMXVwR0N0K1JLYTJBUTk3?=
 =?utf-8?B?amRwbGswV09nV2xkNnRMQVFEckg1bHpkdmFwZVNxN3MxVCtqVmVxbUp2V2Y5?=
 =?utf-8?B?Rk4rT3BxNmZERXFwQzFzNFAvQzFnQjhvOFBDdXhUNlpqK0ZDYzI1a3owcC9F?=
 =?utf-8?B?TUdKcTV4N24ySTNFTS9hOHZLSFRwbEpZbTNTOXovdkk1dG5UTFVXODlrYWp3?=
 =?utf-8?B?MUQ5Sm9oU2pMazlBYkpBVVQ0WUxPbW1xaFdOQUxRbmVnVnFpNGF2VDdRS09N?=
 =?utf-8?B?N0QxdlZNaEJsVzJqWCtNUGFBZ0VPS3Z2ZXdOb29xNjN5TlJsWVFDeDVKOEND?=
 =?utf-8?B?TXV1enVrZ1IzV291WmFVM3owWXRrODZ5a0c3Skp3bHNQL01sT1JXZGxRcDNs?=
 =?utf-8?B?a0RRbFNUMmF0Sm9UWkh1aWVuNG96ZlhEVVQ4NmJodG9LUFl5TWlGYlZXVXpn?=
 =?utf-8?B?REdRcksydnZCNXNFMGVnbEhYSHRNR2RFZ1N0OU5PYWtMY2hIT3pKYTVpa05Q?=
 =?utf-8?B?dlFjWmtOY1E1YU5JTDl4SSs5WnlBU2FBcDlpQy8vbDlVRE9nRmNYUWNJNEtu?=
 =?utf-8?B?QU42SktPc1ZwYmJMQW1RSVVOSnFjREJWV2l3NHBtR3FhZXhaUVdZK3FacVhF?=
 =?utf-8?B?aWtITmJmR0RQTWJidklCdzdHa0NLMnpnN0l5NVFCZ1FldWlRb3NPUTVWQUhi?=
 =?utf-8?B?UTc0ZVZqeE1ocjZ4K1VRQjJXaXdSUERyQU95djhIMTFvKzMzaU1JVFhwdEo4?=
 =?utf-8?B?Tk05dlNlSk9CL0t3Vmg3b3oyM1MxUjZtbTZlVUkvZE8vZWN0OEwraUZkdzR6?=
 =?utf-8?B?NTdyK3Bkc3lyVERGSkhTYktEMG1NNEtOMm45NVpxcjBJaVNrMmkyUkN3NitV?=
 =?utf-8?B?cWN0U09CRE5kSFQ2UjN0QnJBMTF0TitJNG00SlNtd2NOamdPMUo5ZjdJd2Zi?=
 =?utf-8?Q?fiFGvYTDgCoEKteocxVQbhTFd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d782d156-a706-4c09-3e73-08de1ce4ffc7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 03:31:40.4147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iKl15s7CYQ/yCDsFFiGuKQaJv0k3fezkK7svlbywlXV3l/3bsClHMVdgCnasC7tDM7BsV8yLvpasqetPhhuMfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6813

Introduce imx_dsp_rproc_reset_ctr_{start, stop, detect_mode}() helper
functions for i.MX variants using IMX_RPROC_RESET_CONTROLLER to manage
remote processors.

Allows the removal of the IMX_RPROC_RESET_CONTROLLER switch-case blocks
from imx_dsp_rproc_[start,stop,detect_mode](), resulting in cleaner and
more maintainable code.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 69 +++++++++++++++++++++-----------------
 drivers/remoteproc/imx_rproc.h     |  2 --
 2 files changed, 38 insertions(+), 33 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 91d041c15ac19f527f48c8189421f71fb7c9745e..6237e8db2eff759c2b7fcce5fb4a44e4ebaec8cf 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -346,6 +346,13 @@ static int imx_dsp_rproc_mmio_start(struct rproc *rproc)
 	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
 }
 
+static int imx_dsp_rproc_reset_ctrl_start(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+
+	return reset_control_deassert(priv->run_stall);
+}
+
 static int imx_dsp_rproc_scu_api_start(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -374,13 +381,7 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 		goto start_ret;
 	}
 
-	switch (dcfg->method) {
-	case IMX_RPROC_RESET_CONTROLLER:
-		ret = reset_control_deassert(priv->run_stall);
-		break;
-	default:
-		return -EOPNOTSUPP;
-	}
+	return -EOPNOTSUPP;
 
 start_ret:
 	if (ret)
@@ -399,6 +400,13 @@ static int imx_dsp_rproc_mmio_stop(struct rproc *rproc)
 	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
 }
 
+static int imx_dsp_rproc_reset_ctrl_stop(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+
+	return reset_control_assert(priv->run_stall);
+}
+
 static int imx_dsp_rproc_scu_api_stop(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -428,13 +436,7 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
 		goto stop_ret;
 	}
 
-	switch (dcfg->method) {
-	case IMX_RPROC_RESET_CONTROLLER:
-		ret = reset_control_assert(priv->run_stall);
-		break;
-	default:
-		return -EOPNOTSUPP;
-	}
+	return -EOPNOTSUPP;
 
 stop_ret:
 	if (ret)
@@ -1057,6 +1059,20 @@ static int imx_dsp_rproc_mmio_detect_mode(struct rproc *rproc)
 	return 0;
 }
 
+static int imx_dsp_rproc_reset_ctrl_detect_mode(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+	struct device *dev = rproc->dev.parent;
+
+	priv->run_stall = devm_reset_control_get_exclusive(dev, "runstall");
+	if (IS_ERR(priv->run_stall)) {
+		dev_err(dev, "Failed to get DSP runstall reset control\n");
+		return PTR_ERR(priv->run_stall);
+	}
+
+	return 0;
+}
+
 static int imx_dsp_rproc_scu_api_detect_mode(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -1080,26 +1096,11 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
 {
 	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
 	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
-	struct device *dev = priv->rproc->dev.parent;
-	int ret = 0;
 
 	if (dcfg->ops && dcfg->ops->detect_mode)
 		return dcfg->ops->detect_mode(priv->rproc);
 
-	switch (dsp_dcfg->dcfg->method) {
-	case IMX_RPROC_RESET_CONTROLLER:
-		priv->run_stall = devm_reset_control_get_exclusive(dev, "runstall");
-		if (IS_ERR(priv->run_stall)) {
-			dev_err(dev, "Failed to get DSP runstall reset control\n");
-			return PTR_ERR(priv->run_stall);
-		}
-		break;
-	default:
-		ret = -EOPNOTSUPP;
-		break;
-	}
-
-	return ret;
+	return -EOPNOTSUPP;
 }
 
 static const char *imx_dsp_clks_names[DSP_RPROC_CLK_MAX] = {
@@ -1324,6 +1325,12 @@ static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_mmio = {
 	.detect_mode	= imx_dsp_rproc_mmio_detect_mode,
 };
 
+static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_reset_ctrl = {
+	.start		= imx_dsp_rproc_reset_ctrl_start,
+	.stop		= imx_dsp_rproc_reset_ctrl_stop,
+	.detect_mode	= imx_dsp_rproc_reset_ctrl_detect_mode,
+};
+
 static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_scu_api = {
 	.start		= imx_dsp_rproc_scu_api_start,
 	.stop		= imx_dsp_rproc_scu_api_stop,
@@ -1334,7 +1341,7 @@ static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_scu_api = {
 static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8mp = {
 	.att		= imx_dsp_rproc_att_imx8mp,
 	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8mp),
-	.method		= IMX_RPROC_RESET_CONTROLLER,
+	.ops		= &imx_dsp_rproc_ops_reset_ctrl,
 };
 
 static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8mp = {
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index a6b4625e8be76c6eb6a5d8ef45eb5f3aec5fe375..6a7359f05178a937d02b027fe4166319068bd65c 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -20,8 +20,6 @@ enum imx_rproc_method {
 	IMX_RPROC_NONE,
 	/* Through ARM SMCCC */
 	IMX_RPROC_SMC,
-	/* Through Reset Controller API */
-	IMX_RPROC_RESET_CONTROLLER,
 };
 
 /* dcfg flags */

-- 
2.37.1

