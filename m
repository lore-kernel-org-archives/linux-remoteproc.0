Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010054.outbound.protection.outlook.com [52.101.69.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963D8142629;
	Fri, 12 Jul 2024 08:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720772777; cv=fail; b=F6C67ZbwvbJzMrSvtTInjrSGQ01qWsr7m+55EhekZdG8nHuTyfp7Xs0W+2dMFwgPJaaP2DhbyTMWM8BShoTgRfRs90Fq5WG4mYewbDy6hGFIXtljc6WxuvOuDk1u580pujH4YpgJLK9uB08IBB95+Xll0cO21MNrIWUCw5EThls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720772777; c=relaxed/simple;
	bh=CNxlFZ8jAhmwyqBOtKbo7+o+NMALO64s4M/n9ETrV70=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VFfL5R1rEHNOhVGho8CkMZoGUcKJYy7fM6P4oAzNa9ykc+2nE3Se9iggXHhX8knKimObdEQVf1FEMr4nNYb9z+3kslU4Ys6bX4Rq38qojnRegMt65zcDLez70immwknI8PZs2h954CsqA5E6FySIm43hBDra1HBTzYmnF8FRKZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Us3yOxJ1; arc=fail smtp.client-ip=52.101.69.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Us3yOxJ1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRJPCQB3vdXsbbho7rI3u+YFk4SIMLMuMRhV4GHEavG4g4DzkVeWAIeYk+TxGSwRG4YeImXbhFXFJwgd8jGhcHGXzQhw19/Sx8JuRML/oriUMtwC1Dq9iLpL9vqdGT5v7N7JeXN7bmmfwnZ/i03Bs9JvaKrQMV7w+hy9r1oOiVK8w6cX5BHWsUGJIv1XzbwKnDTzU5DWOmnNnrPzJm5EUqfwXc+AjFVoZ1nB12JbUUq9KrGfXq73CxKirniNd2QKDXLzeZIkYpnv9yQ7EbwlI700rmYoxg0OL6ZSykNa1VwrtqQrPSvKl6vBnpQBO3qIMY+x9JM9u8Yc5doeNmZHYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfk6hYeTvAVbb6NwTf8pjeY4ISq3NZVDlCa/ldb3uc0=;
 b=n2j80f8/ujImEDasriMK89KfgHAn2YOW2l3LZuP33c7PyGN1ipbyLhC2LBD1cKBHcp4pSDdox69kRGGymtPSJcxYs+oXWSk0hp2Kl9S5WvUwY6tXC9n70jHZfV4e8zuQOkWp6c0sT11BRDc5lUUbwv9GMGLmNytEaN6DTvG/ekZOkL/r7w92R3bEgsBEWTWJWm0WYRtWSFFGAfep4pESoCS6wLxnbgp1V0Oi4xw4vUh4hVwPH0xZUc6A6wy6uRtTS9x19TYYr2R13Vm+vvnf1FQxctxHY6ylQOsPLD8tK6ibdKYfulcWNxOzM3YRomUYjAlrQe/WEJu38abRSzy9wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfk6hYeTvAVbb6NwTf8pjeY4ISq3NZVDlCa/ldb3uc0=;
 b=Us3yOxJ1Sj1gL1i0DPD5Op7u25K83uw6y8QOCCDvMey0Gda7NpUaYKbNOTTMTF1ehcuHAGYE73nFB+EqW29OjjXjPYvqbWNKCgUxXRtD7aC00k1RZz4bUbL5ETHh033aSf9XSlA4RRznaPCrYT9/n0xek3ROIjB9+nz9SMkzn40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8709.eurprd04.prod.outlook.com (2603:10a6:10:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Fri, 12 Jul
 2024 08:26:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 08:26:13 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 12 Jul 2024 16:34:57 +0800
Subject: [PATCH 4/6] remoteproc: imx_rproc: merge TCML/U
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240712-imx_rproc-v1-4-7bcf6732d328@nxp.com>
References: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
In-Reply-To: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720773307; l=2091;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=7XLi95a2fj18PTwvd4aD+z32TmYp3Rvrd5HBV+VL3fM=;
 b=i9yJfrRLWdMmwag9n5JrflmCc+5Ej4tw+7rRXfX7riI4j/O/t9237XsVxMJVX4n2kOaHqYapQ
 RtTTvaEls7JBLxiDPms8ZWfjYKg7h3RBbnnlQWEyaPZHOZ3wGd9NeAH
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: 20273a52-432e-46e8-ca5b-08dca24c4a5e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGEyOTRFRnY4cFB0RUZDMUdhS1k4Q2pMZWlXZ3kzN1NkUlJsaVg4c2R5ZXl5?=
 =?utf-8?B?cXZIWlZ6dUdzMzF5S0FvaVIvcnowcFcwbjVaeXI1U093Y1NGd0lNMGhmK2tD?=
 =?utf-8?B?REUyeDgvOVdCUzl5L3dscWJTYUlaYWxoN1NrMzRBTmt4Umw0eHFZM3FjdHpW?=
 =?utf-8?B?UWFjeHRpSjZrVExsTkdUT3JLek14S2hqNmxMSEIrMFhLM25SVk1LSG95c2Ji?=
 =?utf-8?B?VlRlLzZSNU5QaDZjQlJXdWhYU2I0N3Z2QWpJMHdYVXk0S2Z1d001WDVMQUti?=
 =?utf-8?B?Syt4eWpCT1IvVzdocnBIM3pLM1FaTGFYWWhwbE9wdVZ6aEhUWXArMXcxakx4?=
 =?utf-8?B?ZVZXb1d6VTVVNXFDUHErSDhzanJKVGVHL2lsSkRHMFFqd0RXVFVTRU80YStp?=
 =?utf-8?B?Zk1ZTUMwdFZBbXdrbW5LVWtGYXVmWWVQbXBxRGwyS0MvdGJucXArS2JjelFZ?=
 =?utf-8?B?ZGtqVjNBUTRDUjNUb1hJM1ljR2x6eVYzUmNkS0VNUmtreFZvSlBrdU9naU5y?=
 =?utf-8?B?S2ErcHpVa3ZSQmlFV2NKbFZ1Q3lsbFFmVk5xeVNaN1ZLMFAwMmZpVVp1SStk?=
 =?utf-8?B?aEZybGNjN3ZsRmt5MkZIdWp0YW0yK0grT0VmZUErbGhJa0xkZGVqS1F0Zkkr?=
 =?utf-8?B?UUpQRnR0bnl1eFY5WWVHbHBmZmNUL1NreUZIdlBpeFZiRFZGR3dNUHNpM1lT?=
 =?utf-8?B?STh4UXEyOUhlREpYYjZWRlRERnZRYWwxWGJsK1dSVHlaNXNxMWY5aTZaSUpw?=
 =?utf-8?B?MUdrNWVIT09kdkVTN0MvaFJYOVExMVQ2enNCbGdxSE1OMngzSVdkTjZjcVY2?=
 =?utf-8?B?UDFoeVQraE5odzhkK1E1Y1FZTzl1WXpvUG9OczdKcnZtNjg4WHJ3ZEh3N0FF?=
 =?utf-8?B?MzhFVC9RUktWSWFaaVpBRjFqMGJMdFRrQlJVbEF3akd5K3NSbGQyUllheldr?=
 =?utf-8?B?aGxxUzdSQzJRL254VE9WQ1JkREt1MmxycVV0ZWpxY1BTRmhLS2NYSVc1bkIy?=
 =?utf-8?B?MzhVcXF4ZHRHUVkwWDRsZUJ0SlovN2dJSXBPU1NnYWZLK253Mkt0Z0dlbnN1?=
 =?utf-8?B?SHFDbktZTkRraHFMZ2Z2dE8wZ2ljckw0eEJyaGFqNDBGUVM5VDQ3aE9sVXVD?=
 =?utf-8?B?QXZyaFBXTzMzbmlwN2FOMWJZVCtIdTAyaTRCNDdnM3d5SEtoS2dSUERpZU5i?=
 =?utf-8?B?Zy9OUCs4d2VneTZHM08ycWtVQmI5dmdldDA3ckpucmFjaUVVMWhtdS8xaXNS?=
 =?utf-8?B?L3JlUW1OcGhZWlhZZGdWMlhQbVBIMEJGb0pQQ0RVT2VVaVA3VldBTkNqRzc0?=
 =?utf-8?B?bEVHKytnSUljK0pNWkIrcE44WVA4Z2daUlFxY0RwR24rN1EreGZEM1RlQ0Y5?=
 =?utf-8?B?TzlvaW0wZUtoTFdJL1AzdU9RRjhQTG5vRVlGTGhCMEJ3Q1c2dVE1aHdLdVhi?=
 =?utf-8?B?M1htKzg1K01DeTB5ZTB2cGdpNlFpbVJyTlZEbkpCc2c3SVoxbzErMzduOENY?=
 =?utf-8?B?QmxmanFUbE9JbERmYW4zVnRhR0ZkSFp1WnNydXJmb05SUzVYUjhpRWcyWHNo?=
 =?utf-8?B?Vis2b3E1OWduTkc5VXBacVhjV2M3dHdlYzJBb051eTNoemhqTE1KaktrUjRZ?=
 =?utf-8?B?WXMvRWRsOUVyU1dGU3RVT1J1Q2pNajM1bXduVmFJRldWaFNhMEVWYTRsdGhp?=
 =?utf-8?B?aGpLSkw1MVl3TUNyb2dXTlZ2TGZJSWRMb095elFyZFcrZy9OYi9sKzdRSEdD?=
 =?utf-8?B?dnBydTBGK0p6eVFZVFZHTEdxVzA4aDRldG5LY3BjK1d3YlMyUTQrcFBqWkJ1?=
 =?utf-8?B?N3NkZytZeG1QRFRqMmY5Mm1TL2F5R1pVTUpTdlQ2ZFFwMmlRUWtNZ3dHVU5s?=
 =?utf-8?B?ZHpVVEhkZFVlTVZYOSt0elkrVHFyWUd3WWdGYkhCdWd2clE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjdRcDRKZ1NtVldBc2ppb2FMMUEvQjZGUmkybjJNVS94OXZXOWRHUnM1UGdz?=
 =?utf-8?B?YkM0ZjVMdUZCQUJ4bi83bVZvdkMxV1Y0K09QcmhVYTVGQlFqZExDTlZ0SzJO?=
 =?utf-8?B?TlFPWWpZdXpqRnk3cUN0cjd1Z0V2dmZNVkZocmR5WXJDQzhzT2RSbzNZamtK?=
 =?utf-8?B?RUw3bWVLa2tKTUExNUc1SXVHTlVIWkdrTHF2eXVyOE16Q0FwaG92eW9VQS9N?=
 =?utf-8?B?VExIb3c4TVY3RU9SRjdRRWNaU0oyMFR5N2dzNVZwbm9pNHlOTzJSU2dic3ZW?=
 =?utf-8?B?UkQyQlhFSHR6SFlDV3NVRThuL1paSVMvbHJvNmpFOTV3VFVEdWY2N0dLWmFN?=
 =?utf-8?B?THVFVHlQdVoxQ0kwZG02STJYbG5QeTNhT3Z1VklnV3FTUGxoL2NuV21iVmFr?=
 =?utf-8?B?eFgwK0djUVF5eXowckxsVy84Yk5RaHRWNzNyK0pkR2Z6ajN0d2VlVjVjNTRO?=
 =?utf-8?B?UWNweDBhZEdIOCtCOXMxRTM4ckJBVC94OXlzSFdnQjBGdWJ5T2xhSzdFWHdT?=
 =?utf-8?B?K3RCaDZOZENpSWYrOWJ4OWFCejdSQlU1dE1adis3QUczMm8yZHZTSUI5SmlI?=
 =?utf-8?B?L3VRMS8vS0RtWXFrSDlpS09QRXlGU2diYW1BbldaNjNmSTFMbFpscE5kQ24z?=
 =?utf-8?B?WU5rT3drbjVhdWQrS1l6RWtFbWxDUEpHOWUyaU1CY1g4SXlRMElKZmFkYU82?=
 =?utf-8?B?L0dTVmZyQkl0ZlAvRGVmR3JEc1ovVHNnRCtlc0FtZE1yNG5GVlZ1V2k4SDRY?=
 =?utf-8?B?Q2xJNFhHWFEvTWtUSjMxdytKRGhvdTV0U0phVXRUd3NEd0VQaVJRUlU3UDBN?=
 =?utf-8?B?bWdFdkN5dFZ6OWIybkk4RG5oQlQ4UmV6dm0zR0xmVWZudHAvdEZzK2dVd0Rl?=
 =?utf-8?B?TkE4STR5SEhzdGdFMnUvTE9YaldJWllueTN5bUdBK0xDei9mRGdPSSt5VXhz?=
 =?utf-8?B?dFQvbGtJemk5UXV0L2o5TWo5N2QyeEdJSmZ4bEtFd2Y3NnlXRVM0NVRzYmlT?=
 =?utf-8?B?aDRIeHcrSUovRmtjWmNFUHhpNXI0c05CZGJRL2dRRTNMa3NlN1dqRFdHdXZl?=
 =?utf-8?B?V0hLakt5QUlOT1pHcHZnMEFTL1haVjkwY0R6czZqTDBTN294OVpNUWtMUTRo?=
 =?utf-8?B?d3dWbHRuUytJQ2NZaEZ5OUl6b3FTTjhKWjFmbWN4V3ViZEVOdXhvaUFnait3?=
 =?utf-8?B?QUE1ZXdqSDUyN2hzZndlVXNNN0FaamRYaEI2UXI0ek1SZ1VzaERveVRnMC9F?=
 =?utf-8?B?VWRJaEljaGhqenp1SUx5d3lzeFM3YzBVeStKVm1JTGc2SnV1ZzZSMVZtYklT?=
 =?utf-8?B?akUyUTVETGYxekUyK3dsWTVsKytFQ2xFQnNJWUd6N1JveVp2NTd5cytteGpP?=
 =?utf-8?B?bTdRY0dtS0cvVzF2RUlFeG1lN21SeFhJWWhRMXNhSGRsMUdYR3lMeEZUdU9Y?=
 =?utf-8?B?Vk9RZmV3WEFDcENBQ2FPMmNQc3Z2WjZhUENzVjBmYi9ncWY5TkdUR1BrbHlW?=
 =?utf-8?B?WVNDbHdUUnhGTlJkUHBtMFFNWXBWSmxIcXROVERMaHRNeEpGQUFlL04vWm1s?=
 =?utf-8?B?anhNL3Vod1VJYkZ1N0pBVjM2dlhYQnIxQUpkbFFLeGpkWk1rZnc0R2VzOUJH?=
 =?utf-8?B?WW1tTVlkeXVQNFdmcGdmMlViRXhNME40b0NyMUV2d09xRlczZ0xSZENzOU94?=
 =?utf-8?B?WFE0YmlrWEZ4b0Q5N3hoRlYwcytzaG1FeHF4bW1NUks4MkNKQ053dnVwdVVR?=
 =?utf-8?B?Uk5QTDlGSnUybndOSnRsTTVXZ0NqdzhRVVlqZjFCYms1UmRsNmRVY3M3Z3Z4?=
 =?utf-8?B?L2pTRWFDM0VtT3VFRGlUcjVzM3dBVEVJcE55VW03U2hQa0pLUi80aWdxVVE0?=
 =?utf-8?B?WXdxNmZ2Z1VxVnpnUXVZSWVJN25HL3lNVXhhYjRpUnhZN1BsK1RoeVdiMCtF?=
 =?utf-8?B?d2tKZGVMM3NGKzN6djh6c3pQemk3UTVXTis5TkRWZG5Ba0ErcGhtZ2kxY3h6?=
 =?utf-8?B?dzM1UGhhVUZhM0grdFc4cGswMUQ4b0ZhdDVMbkw5TkJORCtSUzFhL3pHWFBh?=
 =?utf-8?B?MGtjcXpGc1JTVzNETjhkYVhCdmZESzBDQjA0TEQxOG8yKzlqU01WcGpVdUdE?=
 =?utf-8?Q?YvB8/e2bXrj0GlgQkKBtnWHzo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20273a52-432e-46e8-ca5b-08dca24c4a5e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 08:26:13.0250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UvFAmn9h12OxwDvlHKcqsq0xa8QRxRaADApBavgpyQjAJuvKcJ95n+O/Am+rgG8w2xO1i7OdE7X20JWQ15GUXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8709

From: Peng Fan <peng.fan@nxp.com>

Merge contiguous TCML/U regions into one to avoid load elf files which
has large sections failure.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 9e99bb27c033..552fccebf7e2 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -119,20 +119,16 @@ struct imx_rproc {
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* TCM CODE NON-SECURE */
-	{ 0x0FFC0000, 0x201C0000, 0x00020000, ATT_OWN | ATT_IOMEM },
-	{ 0x0FFE0000, 0x201E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
+	{ 0x0FFC0000, 0x201C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
 
 	/* TCM CODE SECURE */
-	{ 0x1FFC0000, 0x201C0000, 0x00020000, ATT_OWN | ATT_IOMEM },
-	{ 0x1FFE0000, 0x201E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
+	{ 0x1FFC0000, 0x201C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
 
 	/* TCM SYS NON-SECURE*/
-	{ 0x20000000, 0x20200000, 0x00020000, ATT_OWN | ATT_IOMEM },
-	{ 0x20020000, 0x20220000, 0x00020000, ATT_OWN | ATT_IOMEM },
+	{ 0x20000000, 0x20200000, 0x00040000, ATT_OWN | ATT_IOMEM },
 
 	/* TCM SYS SECURE*/
-	{ 0x30000000, 0x20200000, 0x00020000, ATT_OWN | ATT_IOMEM },
-	{ 0x30020000, 0x20220000, 0x00020000, ATT_OWN | ATT_IOMEM },
+	{ 0x30000000, 0x20200000, 0x00040000, ATT_OWN | ATT_IOMEM },
 
 	/* DDR */
 	{ 0x80000000, 0x80000000, 0x10000000, 0 },
@@ -211,10 +207,8 @@ static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
 	{ 0x08000000, 0x08000000, 0x08000000, 0 },
 	/* DDR (Code) - alias */
 	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
-	/* TCML */
-	{ 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN  | ATT_IOMEM},
-	/* TCMU */
-	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN  | ATT_IOMEM},
+	/* TCML/U */
+	{ 0x1FFE0000, 0x007E0000, 0x00040000, ATT_OWN  | ATT_IOMEM},
 	/* OCRAM_S */
 	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
 	/* OCRAM */

-- 
2.37.1

