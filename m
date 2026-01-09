Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013066.outbound.protection.outlook.com [52.101.72.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0170D35A95A;
	Fri,  9 Jan 2026 12:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767960535; cv=fail; b=uESc5fNkt6UZX0HVUx79Hw6ngi8RXOU3pM+H0mLjXHlurlFiJXcAX9V9PZH2oX8n8agXMoQVz+cWTNI3mH9oUVyeUKTLagC1VFnJpeeMj5j8phLzQ/jR+0mKwy5D54J9AjOGv4y7C/dJqIzQkVA2f8KVH/EkVFmRcCV+/YrxVL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767960535; c=relaxed/simple;
	bh=/da9HsSVp46EvLv8cuNHzAPzee2l8iRAX/1sAHdAVvU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iPDd1jsP/ixmFt8yqQWpeSB6/e8DXyNOL3ExUlmEhb4AFubjFWNYjA2c3uLixpFEFvamO3Km31Ea4VrHGcxUZUzAr2TatSjOD4Xy5zi0BO51KyVTqBjHJs9BLDFJ2GiqHfp+9Xne/YCD7iegjJH4GVy9YFkefQ0YFp3HehBEGAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=U6hSib1T; arc=fail smtp.client-ip=52.101.72.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="U6hSib1T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vCoVrswS57kkWrwN6bu/wagGBkbycEJYt660Nr4MS/TDp8l6K8FbntFKbrpHPTsZvmK/74+Bzz/QboysWOn9pX6bFXDWuEg5edhpViypUpE12c685L3KJsncI0gI85mUQJgTbb0IBLMVry7cAErAVIpPjrgAwgRBMHuTnDXOHjz2udnkNAVh5pY19ZKVPJB4HcSgPIjCvAC5gQxT9hPpTPv2/sY5id79xUnyZrJC0X0hCffq/QmcBMZTBf2AZKl0xFwx7kffiuzR1yjK1e/4WYcJb7h8cbxoelSWX1/wVpObHBuw/Kw6SIWC1fPMRLCClh3riJcmmyzenDRrybyCTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9D9hkYtF/DfoJ6Glj9Dhu6WidfuYZqWOtVyftlAqg4Y=;
 b=DxV2rwrbiCc05nElhB8eNZjXwnHR22hiPHluOLyN3ciUl/Dtf2BR9xPsoIWrdddQAc+hy/FBpIWPH74uqeHpYFa6OH71/xoIdyZopNQuYBzJcpAGGR8p//kI0NI/VHHiE3gDo7XhHSzPaNDaEaKxf2Q10Ikgkb3AGPK+M1ex+sNcV3Q95/USq5PUWK42yY1mIoIq8Ce6iZ6+nk8ra28yRzzObI+fv1IPafD5f2e5oZ1u29jvU/b5sfOyh9r5Q7w382gsZkMn3tkP001Rk2yVz9bzzmF3Qwd/ruPWYdhxRR2Gl0TgZbJFK33zNS+9Hi9v4ezd4JsqP4KCRz7+GoLJlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9D9hkYtF/DfoJ6Glj9Dhu6WidfuYZqWOtVyftlAqg4Y=;
 b=U6hSib1Ttz6kWmYyx16XiOvkAMaJQU800h99h2Gp21VwnHZWRQDq3HGfzaDm6vLuL6zlNp4nc6+GMrPVHAhEBwf5T4inwKC91vPGPhTYZNymgBTyViUl8fDgA0audBiZN0KvD3SIYb2ZXTkVda0P+XZ/lfOi40TWRiX47zcSqVId05BB7AfGLwefNAKltpi9chfCezR8cn72D+EYBBLLefnguxdnmzg5QEXHvAVrnMcsH/6n1bSRKnsLtu0wn3sY+EdT2/+CVdbylguaR81FRqQ3P2phsAQ6zDcgi5N+EHtORfQK77KrBP2eiQpJS64NEWP8lETrnrujGaeXCRB4gQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9480.eurprd04.prod.outlook.com (2603:10a6:20b:4d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 9 Jan
 2026 12:08:45 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 12:08:45 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 09 Jan 2026 20:08:04 +0800
Subject: [PATCH v6 4/6] remoteproc: imx_rproc: Add support for System
 Manager LMM API
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-imx95-rproc-2026-1-8-v6-4-d2fefb36263d@nxp.com>
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
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1e3bd2e6-b219-4390-772e-08de4f77d66d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|52116014|376014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OW02bmc4UzZ1U1I5a0krZlhTQ3FsTlFjYlhvUHhLNUFhUUFXWklJL05Mekhw?=
 =?utf-8?B?cFE2Vmk5UmNCY212QTZCOGlDbXEwY3phdlpPYzJBcEFTVUgwMU5uUUpDTDBh?=
 =?utf-8?B?bTFiS1JrSEw1c3RvMFp1NmloRnF2eGRnb2dQVlNWbU1pSzh1NnRKS292U0Mz?=
 =?utf-8?B?RHVPcnUyUFdoTk1LbXlMaUZ4OTI3NjIxOHRjZmQwbE5DNG9maElQWTB5V3NE?=
 =?utf-8?B?SXBSME5YNjBMdG5SUytpQ3lnR2syVVpqQmhDNFF3cXNiV21rdHFBY0gyTG1s?=
 =?utf-8?B?ZU1pSk9xSTFoSGROMnhyMGhPekJkOWd0U3V3R3FsL0N1OUVOTUpmN1hrSWY3?=
 =?utf-8?B?dVFjSVVrT1QrWWw0QkJ0dTJzTVU4L29tbldkUWdObFI5ZE1EVUtQaDJCQzlV?=
 =?utf-8?B?dTUwNG5abDQ2clZsRENrZXdhZjFZdGpDbC95dy9nY0VPQy9vVkhVVlAyQVFi?=
 =?utf-8?B?VFhVN0VtdkljaU53b0dUanlMb3MwVDBCbkRmbU9RdjFXUEhmV3BjOUFrMzJ6?=
 =?utf-8?B?NVdraWZkdjEwRmtwVzRURlUzcXhkT2ZSWEUyU0JUT29ROFJHdVAyRTcrYm9h?=
 =?utf-8?B?a3VxZ0trMUxtV0R3ajVKTmpHMGFaRDY4K1VIeExkQjBGQUhpQ1JLVWdGeElI?=
 =?utf-8?B?dGFXMURGN1hZZ0hhYWZ2RVZrNjl2ZU11TE9EVGtLR25WT0RFNndTSk5IUFNZ?=
 =?utf-8?B?aTEvRUhRekJkYmpYRFFKUi9OM2xtKzNUSEc3RGZKMktWQXR1d0dxSTNGM1Bo?=
 =?utf-8?B?WVlqRTAxTDJudlZGZnh4a0xxMlF1OUpCNmt3WDF3YkFKaW5sbnRNNG5ZZEZI?=
 =?utf-8?B?UjlDaE05dnkzMlI5WFhzWnFlUlRTTFpJdFhFdjAxUVZML1dOWTN1bnJVU1dj?=
 =?utf-8?B?akQ4aCt0VjhxWDJiSnBSY01ybEVjeTJIemNFdU9GTm9EQmUrbENhbkpxNmpp?=
 =?utf-8?B?RkdDWDVHYmQ2c2RVSEF2a3pCYTN6UDN3ZFJGQzRjV3N6WGJuS3ZjUjV5Kyts?=
 =?utf-8?B?dTNiSzdIMnc1RlBVUW5TYzNWSXN3emlHTXhyL2VDbnJvQnpQdVMrR2puQmll?=
 =?utf-8?B?NEc3bldxTWtOTUMveWF2UHBObHAybVo0L3oyOW9ybmlianNKWEM5K3puNXJi?=
 =?utf-8?B?Uk93TVRCWnZmaFNDdFJ6V1NkRjcyRi9CL2s5WEhKWFp5QktZZzk1eUc4dzhy?=
 =?utf-8?B?UVU3cTNXaWpmTDBVb0p1SXZ6MHE4MWM3U1ltTXNzVWV4YlBHVGJrZ2lPMS9k?=
 =?utf-8?B?cFFZTVlSbEFJb1k1V0dTa29UTkpYelpvWVpoZmd0QnVCaEZSa1hlVFpCcllB?=
 =?utf-8?B?TDlaZ2tPdzVOK0ZtdVZ0K1E3NFh2MGlqOTd4OVE2ejNrSmx4d1psWG5tTjBh?=
 =?utf-8?B?R2dXclBrbHhoQ21ub2hGdlJYdXRDeEJXbmc3TjVUODlEcGsrYnJFSGhoVEZp?=
 =?utf-8?B?Z0dEcTBTNEk5Y0ZremVtS3JqK0VFZzkwSWlzN2RTVmVsU1NJQktRUEJjeG0x?=
 =?utf-8?B?WDhBLzlzWHg2VDJ4dllGZERPc0tJOVhKbysyWUZsRUZ6bGZabE11QlVudU1Q?=
 =?utf-8?B?VEJHbTVzZzVpalFTbGV3c2QwUHo4bUsxSllYUXRGQ0VHSTVzTVI1T3lURlUv?=
 =?utf-8?B?ZlJ0NU1zV1p1bzNwY1BoK3FhVWsrM3NiOWJ6WE1zZ0JPTlJuWGdOY1daTnhw?=
 =?utf-8?B?cGtMaEdqcS9jN2gvVUVpczJtSSs1SUl3ZHg4dW9TdXp2amV2YldHeVp2TExD?=
 =?utf-8?B?ODZVQkIrQ0F5V3JKKzZUaFBFNjBoSkdZYkZoM0tvTEVEKzRDcnJES01GZXRJ?=
 =?utf-8?B?Q0t5M2F5cTJQKzZreXYrUEFnTTB3L0lZWUw0eGVlNTN0elVyNFBHTDBUcXlL?=
 =?utf-8?B?MjJwTmtuTVVlVDFrMTFtVW56c2lTUnZDME9hSnB1WVhsSlkzeW9hVDgxa1VQ?=
 =?utf-8?B?MGRLSVFSbk1JL2p5K09ieGx5VkF5MzdaRnQyUzBFWE9ZQzlWQ3Y5eG5hZUs5?=
 =?utf-8?B?cWNlVFFjYVZ0Sk9vQXBJQnlIN2pPVjJZMWpYMHpkZXMrOUY3RGZsN3ZiTzV1?=
 =?utf-8?B?S20rNVR5TEdKbXZrNXRYWWJGZ3JvT0tKWFVhUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(52116014)(376014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFRsclRGLzN1WjJQM1A1VVFUS1VMOHRHTmVYYUI4dWFLSWd3ckJLSGcrcXJx?=
 =?utf-8?B?YjdZQ2tVdDB6TzMxa24yWGMwSkJGV3hrR3JheUo5TEV4KzdsbUQvcDJuOXpx?=
 =?utf-8?B?NVdWeWhvM3VzT2hsN2NneVVpY3FXcUpVYXM0S2JUbENsMmdQOEY0dnp5V2JQ?=
 =?utf-8?B?aWgxREhLM0lKcUdjMW9XcXQxeEtnTHZHWmZuUW9oblVDK2U5VWQvUVA4VzlV?=
 =?utf-8?B?dUMrNmwrd3FlTitEeEpiNUNjMGxJMHJYZFQ2SFUwVTJybXVIUkQyandSRHJ1?=
 =?utf-8?B?WjhqR00wNms4bXB1N0kxUFNVUEM5UkFTNG5ZSWFBYmp5YVZvVXNXQWREQy9V?=
 =?utf-8?B?VWVjWXI5U2w3OEo1VDEyRmpxQkVnZXBBSmh3R05KQkp5U2gzYUpud0hRRlRn?=
 =?utf-8?B?T1VRNDVGeStLdzNScDJGbHdIODVPeEtJb3hpWHNOMWJSYTZuRGVkZEs2a3FH?=
 =?utf-8?B?Ymw3ZHZ2ZG5hcmloakVnL2RSVnJNSVpnMFpjRWcwWXJTZmhNYlZLWEp2djV6?=
 =?utf-8?B?U3BtWExzUk9ldnNocTVFWE5QSVN1NEkzMy85QkRKeEozVmN2QWJTeHZZT3Vq?=
 =?utf-8?B?cElJS0dqemZmZFkzTGpwU3pHdEY3V05tRUFtTmRLWHVEUC9mSkY3a0w2WENI?=
 =?utf-8?B?dks0bTFiMWZ4V0FsZS9mN3g3NHYxUnNxUCs1VWN4V1J1VUdmeGN2by9vQmpV?=
 =?utf-8?B?TW1DZnJEbytLcEx3Zy9HU296NUZpK1IwTUNjcmxqYTlySTZRRWw2MGpqMEcy?=
 =?utf-8?B?MWNaMGVGeEJrU0paNzdMT0hqTzdRVTRFQXlkNkN6dzFSNjhnazVsN3VmdE82?=
 =?utf-8?B?SUlQZVBiQXFVcFY5eEtzekc2VGFmSkhXU2hwSjExTytIQmRSMkJwUkFia1Fv?=
 =?utf-8?B?MjJPWnMyeUkwTVRlUlJYK0w4eXZNYzdFOXkxeHlvWnlrWG5BTzk4bnoyRTVw?=
 =?utf-8?B?V0lRZTVWbDgwOWhjSk52K2t5N2dXcXNNYzJVZE9Xd0FkbTJpWFBpMThtOVpn?=
 =?utf-8?B?M3ZBelZxZXlUemVjQVhIWGc3ZFdqZXpMVWFaaGFBOVMwb043MjdCdWhibDJw?=
 =?utf-8?B?d0lTZE5vRDVwT2t6N3I1VVRMSWxBYlBrT0x2TVZkS2FpTTd0ek5ySmpTcE0y?=
 =?utf-8?B?azBHa0E0NGhwOVlqYWNpNFlaMk5Wa3RvQldCblR1RHNzRXJEOXdCQ0tPUVpr?=
 =?utf-8?B?RWxhWXU0c0R2MmN0YXZpK0JnQ3ZUeTk2b0EvMHV6YUZWVXFVN09KRHJBTkI5?=
 =?utf-8?B?Z1N5VnVhOFB1V3JHS0RZR05zY1FINzlqWWd6WE1VVFM1cjUyNUMySDZFOVBn?=
 =?utf-8?B?dDdFdThWaVJmb1RyM3B2bEtyRjFzUloyOFZWbzdmeE9KNThDNGZmcVpYc1ls?=
 =?utf-8?B?WHpkbDlRSkovVXZwdkFNVDBSUzlKZ2UvcHdtZlZBOG8wUzRwdlY4U3F4TlRY?=
 =?utf-8?B?ajRqNmp0OW1PYXNMSCsrR0YvUFVZTTRlZ3hJeTdlbVJhQ3BKaVBIbTVpUnAx?=
 =?utf-8?B?MTNTdzBjbFRlSjRvek5TMXBLRnozY1gyOFA5dFlBaVNnYzZESHorRm9VYStm?=
 =?utf-8?B?ZU10Q2ZSWkgxa0dCcjgzdjE0OGNsRFNYdzRnZU9xaGF3MUlYbHF6dXlsYnQ2?=
 =?utf-8?B?eXA0NGx0ckVSLzQ4U3Rqd3laK0xSZERrSWhBbVo2SXdyMzBUUUF4VkRDRDl3?=
 =?utf-8?B?ZzREYld6V2xGSjFNUFdsU0FNY0NGR0NyU2ZCR3l3OWdzNmYybGZtNG5NTjVK?=
 =?utf-8?B?MUlpTWZLbVQ5UDFsOWdZQzBJNlRXVzBwMUVkclBoTzFmbHU2ZGdhMmJrVERH?=
 =?utf-8?B?ZkE1a0RlVnI1RWRxbkE4MWVTU1RoWVlNS0FHWlNaRGVkOGFtOTlUQ0dVYThY?=
 =?utf-8?B?L0NDTWMybFBjaEFiTkkvL05yUnAyaUlJUlBFdE9SWGkxSEVySC9QZVlvNWNz?=
 =?utf-8?B?ZitJOXJGT2NMUkk2NklrSWNHY3hISW5VWVRMYzhwdkthV0ptY1dyWFRrM1px?=
 =?utf-8?B?MStBVzZCdWFGRzZ2d0c1M3YrZ3Bkcmt4OGt3aTFJNWZLUzhBczJBcEVoQ3Fu?=
 =?utf-8?B?UVpuRmVGZGptYk4xcXNmNXhkOGVhcDRLMXRtUGwxRDc2RmY2dmxJMWJmb3Vn?=
 =?utf-8?B?b1NiZFd6NHZ0aU1OVHlZcFI5VndsdTdFTUxGT2t3QTRBQXFXRlB4bzdHbXpO?=
 =?utf-8?B?bmlhdlhOeFBUeFlqVThkZ3Y1dUxnMDNIVldjTytFWm52VmtVdVVlWmp5cExK?=
 =?utf-8?B?aGtiSStPaEZvZlI0V1hhbHI1Q2l1a0EvU2xBclpxN2FyTzd6RjVhbkMrajN5?=
 =?utf-8?B?Zy85VXYzNUF1dEkwQ1lYK0QycmRWVkI3NEJrWnZVU0xVdm50aHFlQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e3bd2e6-b219-4390-772e-08de4f77d66d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 12:08:45.1721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwE0U54BA2izA4lZvao4G1fj/p2pnEC0u2R4+6FJGb5Jcl3nrc9eq6D4xZs0tpiR1r26AJ8a+57BuLvpx8MAqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9480

From: Peng Fan <peng.fan@nxp.com>

i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
one Cortex-M7 core. The System Control Management Interface(SCMI)
firmware runs on the M33 core. The i.MX95 SCMI firmware named System
Manager(SM) includes vendor extension protocols, Logical Machine
Management(LMM) protocol and CPU protocol and etc.

Depending on SM configuration, M7 can be used as follows:
 (1) M7 in a separate Logical Machine (LM) from A55 cores, that Linux
     can't control
 (2) M7 in a separate LM from A55 cores that Linux can control using LMM
     protocol.
 (3) M7 runs in same Logical Machine as A55 cores, so Linux can control it
     using CPU protocol

So extend the driver to using LMM and CPU protocol to manage the M7 core.
 - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
   is fixed as 1 in SM firmware if M7 is in a separate LM),
   if Linux LM ID is not same as M7 LM ID(linux and M7 in same LM), use
   LMM protocol to start/stop. CPU protocol support will be added in the
   following patch. Whether using CPU or LMM protocol to start/stop, the
   M7 status detection could use CPU protocol to detect started or not. So
   in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
   status of M7.
 - For above case (1) and (2), Use SCMI_IMX_LMM_POWER_ON to detect whether
   the M7 LM is under control of A55 LM.
 - For above case , after using SCMI_IMX_LMM_POWER_ON to check
   permission, SCMI_IMX_LMM_SHUTDOWN API should be called to shutdown
   the M7 LM to save power only when M7 LM is going to be started by
   remoteproc framework. Otherwise bypass SCMI_IMX_LMM_SHUTDOWN API if
   M7 LM is started before booting Linux.

Current setup relies on pre-Linux software(U-Boot) to do M7 TCM ECC
initialization. In future, we could add the support in Linux to decouple
U-Boot and Linux.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/Kconfig     |   2 +
 drivers/remoteproc/imx_rproc.c | 166 +++++++++++++++++++++++++++++++++++++++++
 drivers/remoteproc/imx_rproc.h |   3 +
 3 files changed, 171 insertions(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 48a0d3a69ed08057716f1e7ea950899f60bbe0cf..ee54436fea5ad08a9c198ce74d44ce7a9aa206de 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -27,6 +27,8 @@ config IMX_REMOTEPROC
 	tristate "i.MX remoteproc support"
 	depends on ARCH_MXC
 	depends on HAVE_ARM_SMCCC
+	depends on IMX_SCMI_CPU_DRV || !IMX_SCMI_CPU_DRV
+	depends on IMX_SCMI_LMM_DRV || !IMX_SCMI_LMM_DRV
 	select MAILBOX
 	help
 	  Say y here to support iMX's remote processors via the remote
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index b0857a1a9660503ee7cd5473c06dacb5262286b8..b254045d45eaf751c55280fb6ecc4a042f47d7ce 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/firmware/imx/sci.h>
+#include <linux/firmware/imx/sm.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_client.h>
@@ -22,6 +23,7 @@
 #include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
+#include <linux/scmi_imx_protocol.h>
 #include <linux/workqueue.h>
 
 #include "imx_rproc.h"
@@ -92,9 +94,15 @@ struct imx_rproc_mem {
 #define ATT_CORE_MASK   0xffff
 #define ATT_CORE(I)     BIT((I))
 
+/* Linux has permission to handle the Logical Machine of remote cores */
+#define IMX_RPROC_FLAGS_SM_LMM_CTRL	BIT(0)
+
 static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
 static void imx_rproc_free_mbox(void *data);
 
+/* Forward declarations for platform operations */
+static const struct imx_rproc_plat_ops imx_rproc_ops_sm_lmm;
+
 struct imx_rproc {
 	struct device			*dev;
 	struct regmap			*regmap;
@@ -117,6 +125,11 @@ struct imx_rproc {
 	u32				core_index;
 	struct dev_pm_domain_list	*pd_list;
 	const struct imx_rproc_plat_ops	*ops;
+	/*
+	 * For i.MX System Manager based systems
+	 * BIT 0: IMX_RPROC_FLAGS_SM_LMM_CTRL(RPROC LM is under Linux control )
+	 */
+	u32				flags;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
@@ -313,6 +326,33 @@ static int imx_rproc_scu_api_start(struct rproc *rproc)
 	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
 }
 
+static int imx_rproc_sm_lmm_start(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct device *dev = priv->dev;
+	int ret;
+
+	/*
+	 * If the remoteproc core can't start the M7, it will already be
+	 * handled in imx_rproc_sm_lmm_prepare().
+	 */
+	ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
+	if (ret) {
+		dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
+			dcfg->lmid, dcfg->cpuid, ret);
+		return ret;
+	}
+
+	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_BOOT, 0);
+	if (ret) {
+		dev_err(dev, "Failed to boot lmm(%d): %d\n", dcfg->lmid, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int imx_rproc_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -369,6 +409,17 @@ static int imx_rproc_scu_api_stop(struct rproc *rproc)
 	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
 }
 
+static int imx_rproc_sm_lmm_stop(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_CTRL))
+		return -EACCES;
+
+	return scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
+}
+
 static int imx_rproc_stop(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -485,6 +536,36 @@ static int imx_rproc_mem_release(struct rproc *rproc,
 	return 0;
 }
 
+static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+
+	/*
+	 * IMX_RPROC_FLAGS_SM_LMM_CTRL not set indicates Linux is not able
+	 * to start/stop M7, then if rproc is not in detached state,
+	 * prepare should fail. If in detached state, this is in rproc_attach()
+	 * path.
+	 */
+	if (rproc->state == RPROC_DETACHED)
+		return 0;
+
+	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_CTRL))
+		return -EACCES;
+
+	/* Power on the Logical Machine to make sure TCM is available. */
+	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
+	if (ret) {
+		dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", dcfg->lmid, ret);
+		return ret;
+	}
+
+	dev_info(priv->dev, "lmm(%d) powered on by Linux\n", dcfg->lmid);
+
+	return 0;
+}
+
 static int imx_rproc_prepare(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -980,6 +1061,84 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
 	return 0;
 }
 
+/* Check whether remoteproc core is responsible for M7 lifecycle */
+static int imx_rproc_sm_lmm_check(struct rproc *rproc, bool started)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct device *dev = priv->dev;
+	int ret;
+
+	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
+	if (ret) {
+		if (ret == -EACCES) {
+			/*
+			 * M7 is booted before Linux and not under Linux Control, so only
+			 * do IPC between RPROC and Linux, not return failure
+			 */
+			dev_info(dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
+			return 0;
+		}
+
+		dev_err(dev, "power on lmm(%d) failed: %d\n", dcfg->lmid, ret);
+		return ret;
+	}
+
+	/* Shutdown remote processor if not started */
+	if (!started) {
+		ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
+		if (ret) {
+			dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
+			return ret;
+		}
+	}
+
+	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_CTRL;
+
+	return 0;
+}
+
+static int imx_rproc_sm_detect_mode(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct device *dev = priv->dev;
+	struct scmi_imx_lmm_info info;
+	bool started = false;
+	int ret;
+
+	ret = scmi_imx_cpu_started(dcfg->cpuid, &started);
+	if (ret) {
+		dev_err(dev, "Failed to detect cpu(%d) status: %d\n", dcfg->cpuid, ret);
+		return ret;
+	}
+
+	if (started)
+		priv->rproc->state = RPROC_DETACHED;
+
+	/* Get current Linux Logical Machine ID */
+	ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
+	if (ret) {
+		dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Check whether M7 is in the same LM as host core(running Linux)
+	 * If yes, use CPU protocol API to manage M7.
+	 * If no, use Logical Machine API to manage M7.
+	 */
+	if (dcfg->lmid == info.lmid) {
+		dev_err(dev, "CPU Protocol OPS is not supported\n");
+		return -EOPNOTSUPP;
+	}
+
+	priv->ops = &imx_rproc_ops_sm_lmm;
+	dev_info(dev, "Using LMM Protocol OPS\n");
+
+	return imx_rproc_sm_lmm_check(rproc, started);
+}
+
 static int imx_rproc_detect_mode(struct imx_rproc *priv)
 {
 	/*
@@ -1155,6 +1314,13 @@ static const struct imx_rproc_plat_ops imx_rproc_ops_scu_api = {
 	.detect_mode	= imx_rproc_scu_api_detect_mode,
 };
 
+static const struct imx_rproc_plat_ops imx_rproc_ops_sm_lmm = {
+	.detect_mode	= imx_rproc_sm_detect_mode,
+	.prepare	= imx_rproc_sm_lmm_prepare,
+	.start		= imx_rproc_sm_lmm_start,
+	.stop		= imx_rproc_sm_lmm_stop,
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
 	.src_reg	= IMX7D_SRC_SCR,
 	.src_mask	= IMX7D_M4_RST_MASK,
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 37417568a0ade2ae4d6a4e3d0f139ea52b185254..d37e6f90548cec727b4aeb874680b42af85bdbb4 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -38,6 +38,9 @@ struct imx_rproc_dcfg {
 	size_t				att_size;
 	u32				flags;
 	const struct imx_rproc_plat_ops	*ops;
+	/* For System Manager(SM) based SoCs */
+	u32				cpuid; /* ID of the remote core */
+	u32				lmid;  /* ID of the Logcial Machine */
 };
 
 #endif /* _IMX_RPROC_H */

-- 
2.37.1

