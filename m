Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013018.outbound.protection.outlook.com [40.107.159.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8D8186294;
	Sat, 22 Nov 2025 00:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763773127; cv=fail; b=mU3YoLYXPJiyJG9oSfLWlXZ6OdfO1BiHqstbXqhbctFQfkDlvPROeyfo9+AUaf/Cfj0gVBlgSApRaGj7oJRPTBjG2JISlxwGyscb0Rq+jJy6kk3SNriDUvuHyK3cROuQj9fIvrwpuO8p/7EFk1IjhXUi8VilvZVKlE48R5F0CAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763773127; c=relaxed/simple;
	bh=gKqdscI570xp49WSI0nI2ORUSPj/tVJBhoLKOtQTtbw=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Sx+Cyc+ezKHuPSGhqQxIpa92iPF8+qiyM1d8v6hBqEo8NtZ2oBGC3dkUQ6OJBp8ku0cv4PO6JvsTS6u6jxLMFtd9hOUsb5RnsahqKu2Q3WFdCrxm4a2bniOO94wXuSHFB9SRyTERUZQxjAq/yRfwoSdqZGt8gNAG9Oi/215v2zA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KY/4W5dR; arc=fail smtp.client-ip=40.107.159.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KY/4W5dR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZoOaPQ+EtJXnUfAzcnHIvufzl+pXIr4/ibTE0dVZLZkJs5ZzDCqUTEAUURdcZQTXK5n2Xs7J/Xv6cwRcyLzn8vIg1WSp2H6pZKdaiF6VfLl902Te6foberaBAgrwffhf4yZJ1zWYTIp4jq0GGd0tfLMuZOZO/oyjESVB5Iskg/sAuF/AJ7bqtS2mKV1iw+RqY+XAwgm6NqSkJM7PucGJgXRcpWC8roS1ZJeV6abrjUDhVtBANfsx8fQnYUZSuJbUJvoyWlFFxxOjLVeui0wnc3HQYYoImON+urRRVOy9SZC9UbrimDq5Kimm9gqjyCDROcy+g37TMyJ2zClPV93wtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6PMuvKu1ZWKwWn2pk8Q/Z1Ibn8UQyJomQXCflIBg0cs=;
 b=zKaoiZLEYuj5S7SRiHhJBn4DEo5tFmXuHXdYkiRURhCguzIt6gEK2MR/f9940/NlNA3B0xbI4gwq722fHmHuJMohPoXWlbvCurhv+uoG3R6iV+VdkthIbfpseLyxz7PKpi3vASbmCQPmAkr5MwuHiQDgdxZOkKEyPlsUaX3pQvCKs+J5XNMJ4rvQDahOEBu2pxKzUMhk21suThy4lZDueHUzxHDlG7Ztn1Q6QvHZEq1KXuNshbHu/IDUz9Kf0DA3eneEO6ulzAyF//NSNy8OI0ceWxX0nC1N1bKajSbv97nNakcNFP0Nl3gQpd919XnggNSwoDn6fxplGo6h8anq5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6PMuvKu1ZWKwWn2pk8Q/Z1Ibn8UQyJomQXCflIBg0cs=;
 b=KY/4W5dRlFmD/YrdNVXfTW/zfAyaJc9RHHHMQ9RgfzTRVSF12mKNpmAK27lguXuMxm2voQFlU/vQ1YYqfVv4XTtkmjF9rCWM9S4o4bt0b5FP9ljgEv6xl2k2U5siKDsJQLraUCJSU3Y5scmFiXppy9pWeoCsczR4Ag0Aae2MrU5v/eIFBpVPP7i5wa9ZvqWSw2tntdAmlp1eS8W6S5lvaEA/egmGSJK9LyV/Eh6OZDlXXGx5LGLbBstCI0lrHvYGZli0NsTmUYJWMkj3/avVaXiR5HzRmE1zjZgdbUlxgtA0TDj32ogPAYaMwJ21xg+zjmR88v8Qfw98p2Zm9dyqAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DUZPR04MB9917.eurprd04.prod.outlook.com (2603:10a6:10:4d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Sat, 22 Nov
 2025 00:58:39 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9343.009; Sat, 22 Nov 2025
 00:58:39 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v3 0/5] remoteproc: imx_rproc: Support i.MX95
Date: Sat, 22 Nov 2025 08:58:15 +0800
Message-Id: <20251122-imx95-rproc-2025-11-20-v3-0-9ae6ee619a78@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKgKIWkC/x2MSwqAMAwFryJZG+gHK/Uq4qJq1Cy0JQURxLtbX
 Q0z8N4NmYQpQ1fdIHRy5ngUsXUF0xaOlZDn4mCUabQ2Cnm/fIOSJE74RdS6EO3orfOuVbMLUMZ
 JaOHrP+6H53kB8hytHWgAAAA=
X-Change-ID: 20251120-imx95-rproc-2025-11-20-3b9369670d6a
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
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
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
X-MS-Office365-Filtering-Correlation-Id: d65963e5-5bcb-4685-4378-08de29624603
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|7416014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NmFHVFFRdzcxVUJMUTRqVmxkcVdzYlZZWkNBcnhFM01xR1o0cit5eTI0b1BB?=
 =?utf-8?B?TjZtb1pldWxjYlExdVZxbEdrK1NJek95VzViTU5SSXRIQ2t3KzV0T3dEbjhv?=
 =?utf-8?B?R0lxZGVjQlhETTl2NkR3WDdSUzZXQVd4Y2I0cVBNOGlUckNra0RBZHRzQ1VS?=
 =?utf-8?B?aVZ2MGxNaUZrc01pUGZMRTBqMGZiejN6RThFdHJ1T0NrbWNwM0g0TTgzNzJa?=
 =?utf-8?B?ejR1WHFVWUtLOW1SQUtNVGp1YWdKRllKc2tIS1UyZnlxR1BWZGJFdGQ5eW5S?=
 =?utf-8?B?VWx3cWpsT0gydjlpZzBIYUloOW9zc2VKa0llMFp3T2l3Rmd0T2xWVjdMdjJH?=
 =?utf-8?B?SmJhK3R1ZXZvYklGN0R1VXhEL1hnRkptYkQrZmtNQjNCTVdHb296UmZEOUI1?=
 =?utf-8?B?dzdSYzQxWWg1aTJPbTRCeXZpOURpdWwwUzRaK2MzVUVIaTh5amZ4RWlDZWhK?=
 =?utf-8?B?b053TzJ5N3k3WWk5dGM3NFBLNG0wajZreGgvcFM5QVlkQmJhMmFIY0JIenRB?=
 =?utf-8?B?Mzdqc3ZPNER2dWtqbjdNVnlyYjd3cHVPY1BHaHUrN0FUT3RBWkRuSkxJazcv?=
 =?utf-8?B?RU1aeWJCK0lYNlpLdmZPK1ZwVGU3UFJ6RU84cVJGcFE2MHI0aFVraDMwdThJ?=
 =?utf-8?B?SkNVS2U1YjlET2wxa2ViZHFpem5iSjFtSW9Ua21wYjRWbCtEVm1POXVKeVFO?=
 =?utf-8?B?R3JRa0ZndXVUaTQxa3ZHU3VhdUVJRkxHbU8xd21TZ2lqdHU3eXdoTXkwNmI0?=
 =?utf-8?B?djQxb0RkSWtHUDBYYVhXcXhNY2QzVnVGSnJ4cGVPVjRXUlVhV1ROUGVHZnZM?=
 =?utf-8?B?VkVkcURKOEhpL3lVWjhGekpReWVrTENicGxhR0ZUcWpzemVIdUJuVEJwaDJZ?=
 =?utf-8?B?S012b3dXdUlvcUxBdlowemltS295V2RMZjFwNkd2Wk5pc3NJUFBCdnFJTDUz?=
 =?utf-8?B?bWdLenFzVWI0b1phd0tqWGR6aE5sWlU3RGY5bUNzMTM1dUNnZzFqbzFLMFhy?=
 =?utf-8?B?L292RTdGMFdoTVpPQ2xwZDhHOGdvYkg4Z1lHd0ZqMmIrdERBVkhqRFd6NkJN?=
 =?utf-8?B?RythRk9Ib25iN3JwVitSZXZIUlpzbHl5YWZndVZzYXVSSjE2eEYxQUpWQWVl?=
 =?utf-8?B?eTYzUzBvdXhDdW1wZjdoWDF6TWQxWGhoVEdJZndFczJHZXRpQTkrZGpYU1ZV?=
 =?utf-8?B?Z244eERCdmpGTk5PZnJ4Y1dORUVEN0krOVNDR0dvL09zOVoraysyeVFCZnor?=
 =?utf-8?B?dXRjNDRtZW95TlkzVTI4NERzUWd1eXVENmZrWDlJczVMakZpUGs2MGgvNVlr?=
 =?utf-8?B?WEF0NkMzMTRJRmE0dFZiV3l2MUovcEhZK0V1QnVmVVpoUGdYWExoanJYeTht?=
 =?utf-8?B?SDRJb2xWc3V3eGppQW0zNjF1bkg4UThHaWo2c1MyWFdveXFKTUxqK3pBckZU?=
 =?utf-8?B?YlJ5MUU1VDdtVURBS0hyMW8xbmJwd0dtQ1I5aFJsZCtCOWRBRkd1TWdvNmZC?=
 =?utf-8?B?ZEUrOXRSV2dldFI5R1lsQVIyY28yZ3hyVGtZcThRTjlSN2F2aVRZSUo1UnR0?=
 =?utf-8?B?eFlUT2tvbUREWm1mZEo5OW51TVRqdGZYblAzMGxvdXYwNnhZaWo1QlVmRm5C?=
 =?utf-8?B?N0txaW5Vb091WFBGVnJINjBFdTdEOCtpcXFzekdXNk55SFkzWlJTbzNZMGor?=
 =?utf-8?B?QVZackJIN0Naa2t4QkZaUGtCUmR3cXh4Nng0K1dadVpueS83RXVsTkxBS3Ex?=
 =?utf-8?B?czRTSTBHMHZwSTVhWFBVSmNxNlFGeDZYNFgwdkdBVFNVT2VQbUxxcXZoZ2Rp?=
 =?utf-8?B?ZDJHMkRra3pObTg5elNSSloyZ1h0OTRranc3cUxUOHhlN09ibUx2eEVBd25k?=
 =?utf-8?B?OTdSWXNjUVlKR09SbGl0bGxMUEc5UE5VOFZLM0d2TkgvV1RjY0czdUdHT3Nw?=
 =?utf-8?B?c0FMYklSVHoxcDBkS0VON0V5NngrQjJpSmZMeGZiQno5YjQzZTJ5b1hMWmdV?=
 =?utf-8?B?WDVLRGJXMTFaSlBaVzBCSDZyTkJnMlA4UG94aWJZdHNjZzRpbHVuODVBS1Jq?=
 =?utf-8?B?bTJFU2RYMGduUEgzK2IybFBuSkF6VDI4REI4MFdNNlFlNlk2ZTN3NVMveUg3?=
 =?utf-8?Q?tsyM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(7416014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGNDZEs4N2tkMDZjN2M2Tnk2cjRBZElrK3NjbEFQejRFcnIvWXFyVjRFOHVZ?=
 =?utf-8?B?SldnQ3pkZ1FWUzNVeXB4UDUxSEFmanlkdHpOd2poQ1JTZ01MRS9VSDIxWWYz?=
 =?utf-8?B?YmpDRVdoTWpRT0g4QUxFREMvUkFWK0V2bFFXc3ovU2ZWa2dva05DNmZwb3NS?=
 =?utf-8?B?VXVCYzl0OGhCeC8xQytHd0NlKzQzVkhRVngvRWxPSElaY1Bab3hxUW1MMHZm?=
 =?utf-8?B?bUl4bldmdUxnZ3dOdDR0K0tMVmVybHBYeDNtYXhnaTVhTkVEMWpDbTMxdUdE?=
 =?utf-8?B?MnQyTGZtV2xYakwwamhoak1ZZXBDbTdUVjBRWHEycnUwU2pHNlRQQVJBd1Fv?=
 =?utf-8?B?STQzUVhpQzcxbjkzY1RGck5CQUF1aXkxcVVnYnhLVndXaXkrWFo4cHF6UnVI?=
 =?utf-8?B?ZWhFdUMzWE40MWVmUG9sM0g0cXRRcTN4NUZqTk5vdjlFbXh2WEhIRytvanNP?=
 =?utf-8?B?ZHVNdnUyZmFad3lIWkg3ZDVvWFNLaEhpMG0vVDNsZWFGMEdnTi8ydFZmZk5D?=
 =?utf-8?B?YWZNQ0N4bHlCMjMzTGNmQ09tZkREai9jUVRwam5EVFZNS2N4WTRpdVRWc0RR?=
 =?utf-8?B?ZXQ5SEFUSEl3bXorNDhpekExajFSd05VWWpBTWhYR0Q1R2FsbGRFOHh5Y0hz?=
 =?utf-8?B?MUxJVXoxTVRqaDZVZk1sSUp2YjZJRWovdW93UlpGa1hFenZmQytxNmtnS2NZ?=
 =?utf-8?B?TVJFam9kU0VSY0ZsSTVwRFlsbW9QYmlsVlUxeTRqYWNDeTVSazh4cWhVV3NT?=
 =?utf-8?B?NTQyOGE0cXBsTFNVaUxLY3pVcVMwdzh2SEVxNjVRMG9Cbk5zU1NndjRQTGlt?=
 =?utf-8?B?d2c3RFRKUnM1Vk1mOGU0V3poYlhUSU9Wd1N5KzlMd0xkemErTkd5KzFFVmRx?=
 =?utf-8?B?cjRZbHp1RUtjL3pEQU5pOEVvdzlkbXVHdUViRk00bHhYZFNKT1N5ZHVlZENx?=
 =?utf-8?B?dlk3YzEySFR6RTFLVSs5ZmlnUGM5MTE4VFQyN3k2OVNSUkthRFJJNzgrU09E?=
 =?utf-8?B?alo5TDVCV0NxYnFmeEJhb0l1VHcyQS9SL3djUjF4L0k3ODdrOW9Ic0tNMnRV?=
 =?utf-8?B?ZHFVS21yYVd4ai9rY09EU1hkeVdoUzVvNDgxNTkvbEpoTkRNclQySDUwbnhJ?=
 =?utf-8?B?WmlNT2lndWVwMSt5emRrWDE3MlB1NkFPQUlaa21KMk5SMEI5R2RMVkh0bjFu?=
 =?utf-8?B?ejhyWEIrS1Nrbnd5SWlXM0FNTy9QS1UvbGlacHJCWWpna0o5Zk9rVjRubkdH?=
 =?utf-8?B?eUdlQTNnbEJMamZFOGlGNjZvSHljQzUvZWp1N0xHUW94TGE1cjREM2puUnNl?=
 =?utf-8?B?VWRuZDUyRTE0RWxMRk1hK2xnQWo3ZFA1dkdGTXRRSUMwM1ZDTC9oSDRvejdT?=
 =?utf-8?B?TEdjRmFGT2pzZWRhTHA5dmNEMC9vVzBCdmE2Z3JuVkwzQUdKRFBEL0l5RFpP?=
 =?utf-8?B?V2cwclJuUzJXVTFxVjBWeFlrL2k0NXRMYzlPZCtoczN2MVBYclc2VDhycVlp?=
 =?utf-8?B?VG1qcENsa3VuZ1hlOER1TFg2Snd4cjVuZ2hZYTVESTk2R2I1L1NyM0M4MnlK?=
 =?utf-8?B?QnF4bmVoUTJock9mVlNnSXFwdHVmZGgyUDZwV2dueThGc2FYU2xXWnhTUTNv?=
 =?utf-8?B?WXJCclhRejBwdmR2dkwrV1h0di9vNjZzYzIwT2JuSDhDMWk0TU02UlRPUitM?=
 =?utf-8?B?amNxQnlESDZqMGJvQ0lBc0pYMWNleERsMVZKUnlHVG5LUTAzMVlqSTdmclVa?=
 =?utf-8?B?TzJVd3V2Q3RJSHBCNk00SlBxQmhNd3lKZEJTcHYrejVmZ0Z1R0dNaEcycEtp?=
 =?utf-8?B?R2N1ZXRTU2Vnbjdvd3AwVkpUbTdqNjdLOVE5VVErRnpxWVdhNGFTUHR5OVpM?=
 =?utf-8?B?eDNzaFNmZURoWWtNRTlxNElmTDhYWnlNVTJzTXNlYkpOSlcyTlpBNHNzakdF?=
 =?utf-8?B?UHUyd2FGem4zWm1sbzVteW5vNnJsSDNSTVo5eUl3OU51VDQ5a21STUs4MzhU?=
 =?utf-8?B?TjcrTEtCQ0dvU2xiVjB4WXd0cC8xNW40eG9ucHZpRnJnQ3FySDJKSVg3RkRy?=
 =?utf-8?B?bHNIaWRaRFBZT0UwWHU0b1Z6S2thWHBJODQwMXArNmVEMTJJbUwvZ1RTNUNR?=
 =?utf-8?Q?h+PaLaeRxhwjJuWEZxRO9MPaW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d65963e5-5bcb-4685-4378-08de29624603
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 00:58:39.3703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQCY0Eh+xcATjhyO3pMuIbJkq6Wy0ceuE1jhXWErT5J0xcDZnoXqICxCPLMPLrEewN6MDoT7ifPP6PtUEb+sZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9917

This patchset is pick up a previous patchset [1] with rebased on
next-20251030, and some changes applied.
 - Add runtime ops to separate cpu ops and lmm ops
 - added more comments
 - moved some check imx_sm_rproc_detect_mode() from imx_rproc_sm_prepare().

No changes to the dt-binding patch, so R-b/A-b are kept.
More info could be found in commit message of each patch and below.

[1]https://lore.kernel.org/linux-remoteproc/20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com/

i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
one Cortex-M7 core. The System Control Management Interface(SCMI)
firmware runs on the M33 core. The i.MX95 SCMI firmware named System
Manager(SM) includes vendor extension protocols, Logical Machine
Management(LMM) protocol and CPU protocol and etc.

There are three cases for M7:
(1) M7 in a separate Logical Machine(LM) that Linux couldn't control it.
(2) M7 in a separate Logical Machine that Linux could control it using
    LMM protocol
(3) M7 runs in same Logical Machine as A55, so Linux could control it
    using CPU protocol

In patch 3, Use LMM and CPU protocol to manage M7. More info could be
found in the patch commit log
    Current setup relies on pre-Linux software(U-Boot) to do
M7 TCM ECC initialization. In future, we could add the support in Linux

Patchset was tested with below boot images when the patchset based on next-20251030:
imx-boot-variant-rpmsg-imx95-19x19-lpddr5-evk-sd.bin-flash_lpboot_sm_a55 (Use LMM protocol)
imx-boot-variant-alt-imx95-19x19-lpddr5-evk-sd.bin-flash_alt (Use CPU protocol)
imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_all (M7 not under A55 control)

Also tested i.MX8MP/8ULP-EVK.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v3:
- Add R-b for patch 2,3,5
- Patch 4:
  Rename imx_rproc_ops_sm to imx_rproc_ops_sm_lmm.
  Add more comments in code
  Simplify if check in imx_rproc_sm_lmm_prepare()
  Update commit log
  Use dev_err for failure path
- Link to v2: https://lore.kernel.org/linux-remoteproc/20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com/T/#t

Changes in v2:
- Patch 2: Change to const pointer for ops, update commit log and add R-b from Frank
- Patch 3: New patch, introduce prepare ops
- Patch 4: Rename imx_rproc_sm_prepare to imx_rproc_sm_lmm_prepare
           drop IMX_RPROC_FLAGS_SM_CPU_OP and IMX_RPROC_FLAGS_SM_LMM_OP
           Add a bool for dcfg->lmid and info->lmid check.
           Provide separate plat ops for lmm and cpu setup.
           Move LM permission check to a separate function.
- Patch 5: Drop macro IMX95_M7_CPUID and IMX95_M7_LMID
- Link to v1: https://lore.kernel.org/r/20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com

---
Peng Fan (5):
      dt-bindings: remoteproc: fsl,imx-rproc: Add support for i.MX95
      remoteproc: imx_rproc: Add runtime ops copy to support dynamic behavior
      remoteproc: imx_rproc: Introduce prepare ops for imx_rproc_dcfg
      remoteproc: imx_rproc: Add support for System Manager API
      remoteproc: imx_rproc: Add support for i.MX95

 .../bindings/remoteproc/fsl,imx-rproc.yaml         |   1 +
 drivers/remoteproc/Kconfig                         |   2 +
 drivers/remoteproc/imx_rproc.c                     | 245 +++++++++++++++++++--
 drivers/remoteproc/imx_rproc.h                     |   4 +
 4 files changed, 238 insertions(+), 14 deletions(-)
---
base-commit: 88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
change-id: 20251120-imx95-rproc-2025-11-20-3b9369670d6a

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

