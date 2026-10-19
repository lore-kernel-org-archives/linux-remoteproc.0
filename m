Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792436175;
	b=n83Z9xCgywUZrApgfclQU4rWaXFR7/7V2KDa1cOb+OhQcmJz3CK5mVgIsjWc5SznUqmO
	 xDRLJbZvUiH2TTZSM4/h2NNjevK0NtwY5q7G4CG+ZMSdYhzQqv/giMyRmxTK8+3UF03ul
	 p0jC7u1JPkCtl8RH0bhcM0uYgTr5IACX9d27OdGXBks0NJKeMyVz2TkbyAii8edH8xTMr
	 B82q2LBbdqTsnIYdAF0WYf0tAmnnnz5r1XLUyUPr56y1Jrpyj0EWi4E+2YpdGJCQm6LWM
	 R/K4pPVLnt//ftQDkeEEl22q3M2WkVmTbYuNjkCTWEhdJ1ONT2sKBaT1dfCdQd4RF7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436175;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=uGHbKarSVvJ8e0iO3Wy+X5HEDCA5C6vjHXEoArEb7qQ=;
	b=fS2jEnWqSvfxVz6aAOnNRNcgN0xZRNqmtGzS86YmomaqxaVS0dOEVT/0uq91QNBqPyhX
	 tUxDMipZmy4HbNZ57QZI+lbRAhwvWORAYavUTzc8IgIp4XYDVCrZNoxqE5GFeTmC7F8dh
	 R3zfGw7llL4wk1C8mQXwWSbZrIFUxO7JVvxJ0gclU+ziqiHyjLGJYi3EaO4hyL+SqCchj
	 /BKEKHsn9GN3nrQb0e1pafSBuko5bZOV+z0QrEeR+iBbairImdOs4t71zL7rsQDFo32M5
	 gEKRuvKpUzliGv1RQadSbne0IK/lGV2/8Pvy46O//2BpEvu975Tel8ifQccso+iAdHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=nrD5Fi60;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.30
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011030.outbound.protection.outlook.com [40.107.130.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F14606A338;
	Mon, 19 Oct 2026 18:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37F14606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=nrD5Fi60
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wnh4i7Tznci4DDwPSu5p3sKqpTJMQUfk1idXJRfeFSrKwGZI6AhYPA4QD+etZKN5RyTZzPtF5IgDySB5mCE9thPjcuBaWMGcP6KDfqrpNFSMR0NAr+S4fczQqkZCaBrsO5iAclEii+ICFJ1SUKUyft3qD1/5gWn4w5FE9DhMdaL+hKbUZuxtQOcxU6IX3DPMLZKSMjhh+DKFKr0FKB/KMG3oHj+Kd6teH8YtY11DOviogax6AZ3dCM/gfWfckndQOhLn6wz5fzw6GWASbkw11+35B9sLkMmgfTmD7MRHgpFUQfRmnR05r/FBbhnIhK/mRMPII3w/n8MCJDSrLLml1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGHbKarSVvJ8e0iO3Wy+X5HEDCA5C6vjHXEoArEb7qQ=;
 b=shejl8A0CWBmK57hCpcjC1PZnJ/OeqLEGANPGGZCaDJi03k6HinKE7zS1P1ynwv3GP5c9nsT7mipRnttwAHku6GvOHlzWoR8tlhU8kjkzgQ+nLB/ut5w4D0ZNhbsEZWsF5A7I7B8a/7bzFptkgPYzqyiln6unj6iGfW7GrnjE5VZNUqLls5BxkVjq2V1YtWkBo1w5sUIWYXlfMbiPPlav3ImypMdtG1cOteEfkcTyvQzMlTNYGmSVJcSJ52BGVQzUe0cM40fUp6uhu1Bmd/ulc1QvQSRKxymQoXIqllc6XRq2CwElVRLXTUT844RKaqMRD23kpyAN/R4OZVdwWA30A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGHbKarSVvJ8e0iO3Wy+X5HEDCA5C6vjHXEoArEb7qQ=;
 b=nrD5Fi60J1MtRXqFiE2SAr6DP11l+AjBx5IA82Orsb38hUmB/ODBXDS7Y2DvyHGdTzdeQU1Mi2G1l5o7U8kvxhEtAwKrbf3pf/shrgr/7veLz4ijE6yLkpwa42NiX6wGPx0onzTt0/hbD+TSBaE116PQjupfiifoOH2vn6UzuvTohBtx9I7D8AceivSOYKlSH4Hmfw12/BqGz0UKePkQEeveHUVHnz0PoMZpKRgT3GjXJr4hmdrC9OO1/49429ihej5DAGYm+ROxYk5b5BwnrR+5AyemUlmKmeUamhGVSjLSeXV63r1qbhRjJcsYGtK/6tws8qgAqStl0xnQlLd5bg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM9PR04MB7713.eurprd04.prod.outlook.com (2603:10a6:20b:2d4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 18:56:10 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:56:10 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 19 Oct 2026 14:55:50 -0400
Subject: [PATCH v6 3/3] arm64: dts: freescale: add DT overlay for
 MX95-15x15-FRDM RPMSG usage
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-memory-region-name-v6-3-2e46b2e7d667@nxp.com>
References: <20261019-memory-region-name-v6-0-2e46b2e7d667@nxp.com>
In-Reply-To: <20261019-memory-region-name-v6-0-2e46b2e7d667@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792436151; l=4726;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=n/zSJfVATQlqA0JFT6AInE5qZK4oGFL27OuLWpTTb2k=;
 b=2BHXoYpE5Z5VdjeXOrdckjPV5WIkMcw7t3vjdMkry58B8rS42qFiYcNQEtGnV90CO0qihmAvt
 wccDjDbzz21D8m/ilcZxDS9R51MtzFQnDOeSOT+6XB9x/jL9XsIXnrK
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8P220CA0051.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::34) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM9PR04MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: 50f85809-e6fb-4343-42ba-08df2e12a3e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|23010399003|11063799006|56012099006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	/KDHtcQB1nlzdnI2u/LSS4vVSKhI70OYUmC2RNDaHhemaOIzI7A7wYJkGqZ6m3VedtYEQkXbyOhXMVQ2C9f4FbtxN73FTp2KFKH/Fprz+q5yZE32lwa9hIQTbrLWsWFcI8nBuA5jO+YkW6nHdltQ60eOnwgHXkZw1/ZFXHkHbqqNVdwqIPJfWwP4XlUI07cs4JG8YdlV3ZcOMe1xTHwQjKSoXX3f6GRE/4NL+7dTlvYZRG+uP1yB8ffVogfmBGSZZP73v+eusjF5SWJN00um5poQnwQJD3RBd7N8EIdPXW4sKPsbr+4QSHrqRHjg1kGnUSemEVbp39I9jQDfFLrdvw3+3vRd/5k4ZYrGIQpW89DJ+AuuKfweeWW/6jT2AZGBHrk74fkU/xGeLzRmc5WbUyI5QZx07Ty54N3PrHVuAMQn8VXeQlcsEf2b4lmXtDy9avrCJ+a2a4Iu4XmphSOAbwUhD32ZggFHWaFsSA3kt/EXF40tIRqYH3ajvR1341V1x96OSPuVJLcgynieWgLoOz7yuNTCMSW7HNZ7kWJHPHP0FW7wUmunRWh6o9MNbx5ttmdVld20EkHDbJIGwvDsSwXXOC6ICyK4rUj5Z3EH+fSL7ZLNu7Asz0SVkXcTE62H/rBWa7hrQMayNvZ4STjWLS45IaNj1uWE0bOY9rPXqUQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(23010399003)(11063799006)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkNSREdWcitiRU5Ra1VwckRLdkdIV012R0dGWmIxSXBUKzFCZFM5VFRtL3F5?=
 =?utf-8?B?dzIvZHdNRGorQWJaT2I2bXZodHJ0VHBhdXZ6a2kxRGdLS08xYnJKWEl6b1U2?=
 =?utf-8?B?RzZiV2llenFMVnVLZzdnVEFrbVI4bzdZUlVpS2s2YUhlYk50L1k2aXhyaWRn?=
 =?utf-8?B?YlF2OERjVVZsUDFkZlI3OUZ2RmtSQ3grYmozUUdtV1FsVXJkQi9scExrcm1Y?=
 =?utf-8?B?V1ZIaDRqMTEra0Zkdi9xNzRuQVdrWndsbTZoTS9tQlkzc1k3Z2k4bEladThC?=
 =?utf-8?B?aUJjc1M4SWFlSWNmOHcyTC9SK1NnY1kzVktvOTFTUzVpUWNScnlBSGcybndt?=
 =?utf-8?B?QW1pVmtpOVJ5bko3N0p4ZGdOZlp4SlI5d3lWUW9iRmh0ZFhqVitOdE1GazRX?=
 =?utf-8?B?b2ZmZGNqb2FLbG1uVGMzUlpTLytwcFgxM2QwRmJuTjRlenNTZGhTT0I3VWpD?=
 =?utf-8?B?V3V4QW1tdWl2L2o5Q0huS3U1enA3QVJTNUtzM0lFc3pqejZvVHZNZUUvd2FN?=
 =?utf-8?B?RmFrem9pK2Qxb3lPY3VZMmRDTEVMajI2TnRVT0hWY1dSVWxyWXdma1YxUHZP?=
 =?utf-8?B?OWh1d29OQytFanZCTmFqSHFLUnRraTJ2aUxlNEpOQWsvOEl2YkJBclA3NnBI?=
 =?utf-8?B?QTQzMEtST2V4QUdnZjNSYU5KYk1taGJvVW1zZzZoZjgya2ZwS3RYY0ZDT0xk?=
 =?utf-8?B?QVhFQ1N2QnBObi9pcUhTUzNvU0RBbDE4TWhxWThjbE1ZK1ExblFzWnhZOHpy?=
 =?utf-8?B?dUxkbUdJSE9tTFgvNXJ3Vk9ZNUpXcGdubXNXcFZZSThoc2RkOXZMdER4TXJV?=
 =?utf-8?B?TUFyZ1dMTW4rM1JFVWswbUlLc2ZvVmxXcHlZRE1JeTZiQWZGZjFqT2hyckpS?=
 =?utf-8?B?NjhQd0lpVTRWNXdhbW5uUjZvcGNkdXZJd3MzS1dTazNSS0g2Zis5R3hUOXFP?=
 =?utf-8?B?QW9EWEQvaDA5TkJtNWdTQnQvMktveDNDNkN3Z3BKQXNrWHlSZE9xS3JBQWdz?=
 =?utf-8?B?cHVDR1FYRFdrTVdLd3lkWi9JRHgrOEdMU0RZTHdIZlgzcUJ0MWF0cnBGTTVY?=
 =?utf-8?B?MWZpd0NhQWhOYjhDcXZjUk4zNkxORVdETzR0eGoxQTZHN3J3YU1wRU1aaTBD?=
 =?utf-8?B?TElSblRxN2hSeWk2dnB0WHBBYzYwNTBrb3FYWExTTkdjYk4wUm9mbDB6cXQ4?=
 =?utf-8?B?Rzl1Zk9WSk1kVEtYWmV2L0dHWGFyZUdTR1N3K2hrSnpOVzZJcjRuV0F5WVZ2?=
 =?utf-8?B?VFNrSmpKZlJnWjdNeU5ub2FpcXkybm5mcVoyMm4ycGduRzFCWXFwdk42blhO?=
 =?utf-8?B?bURoUk5YVGVtUHZBTmxIRStxbXBDbmpmR0dROWJWVDZOYWtZQ0RXTC9wcS93?=
 =?utf-8?B?SHhaV2dZU3p5amdQalprR2lsYkNWUzNzRlBWVHQ2V0J5TUYxbGFDdDcrTUVW?=
 =?utf-8?B?MFZ1MG9pa2UzN0dwTjNxRitVQjc3SExXY2M3b1cycmJiWjNzaFZwTzBCMHBI?=
 =?utf-8?B?RHowQVBmd1RGNWREbVlBbG9QdkZ4bUl0RmcxemhIOWYxMFplekc4NnZrbGFC?=
 =?utf-8?B?MDNoWUdSSHk5QWZseG5wZ3d5ZFY5N3Zna2pRbmo4VHV3aVdkdWdMTjZzN1ly?=
 =?utf-8?B?Nm5GTHRuSCtQK2lIMHNyK0hJTWFVM0s2YmJpQlcvUTI5SE5qaHQ3QlVDV0d5?=
 =?utf-8?B?eFEreHBYWE1vcmx2T0VzWDNLaGgyb3JsekhFbkFZaElCZjlKWWtwb0kwc0hJ?=
 =?utf-8?B?OUJYVk1QcHpudTI0OXpaWnZBanlqVkxKK3Q1UUJUZmVmcjUwMGRjYzJ1WlE4?=
 =?utf-8?B?ZFpVNzdGcDRGcnhVdFpKc1VnbklIUG5MRW9ubFZlVnpjV2RIZndoUDhDVVlx?=
 =?utf-8?B?TkdITy9ONnIwNjl6QzdNL0tqY3F2OUIwdnZ3Q3I5UExycXVTbVVhallENG5t?=
 =?utf-8?B?cXZJZUJ4bEI3dmpRZ1gzVVRIbjViQ3NnQURqM3h1Umdjd2JoTHR0MHdCOU9s?=
 =?utf-8?B?YWJuVXdkN3NvRlFkRnE5Z3FLUTVBNHpsVHNlb2pzblg0ZW5xdTdpQXBuMUR6?=
 =?utf-8?B?dTFuN1RPVWlVNThyM1ZCbFNRUEdmYlBMRmNHaEpaOTJSRUNhaWhaQU9jSURB?=
 =?utf-8?B?cEhhM0tBT054ejNxMWg5UXRkakZlMDJQeTUzMzVIM1Eyd3lPVXRIYW9nc0wy?=
 =?utf-8?B?QTlDeUVBaldYcmllZWl4OVUrUkJKd0hFNHZrUmVNUWJubnMwMDUzc3lpOFBl?=
 =?utf-8?B?SlR1bDBWMzhZenlmc0w3amFvVUtYZ1ZjNDFOVkdzQTZ5eXBUOGFSSnowUTNU?=
 =?utf-8?B?SEJ1alpUTGhsNVVKMmNZOEtnaUN3cy8xbVEzMEpjNXRRTm9YWUpqZCtpUGox?=
 =?utf-8?Q?E/1OBB/hZqvACEaqnBoM9lVPDdQ/9ip2x2UoM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f85809-e6fb-4343-42ba-08df2e12a3e5
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:56:10.4955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+sQMj92gwG0aczM4rKGEaI3IHmIf93Kd/d1OczVHxd0PGSvq4ysGVjEHjhnuqFv1qcaAiPuKNYYKuKnVpdzGhcUn+HtLq3q67xOMTsPTTFTM/YmpMnJdbWQHQi6owUo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7713

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Move related memory region to overlay files.

Add RPMSG DT overlay for the MX95-15x15-FRDM board. This overlay is meant
to be used with the mx95evkrpmsg system manager configuration for
remoteproc and audio over rpmsg-usecases.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  3 +
 .../boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 31 ---------
 3 files changed, 84 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb56..f3b19f3b1488e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -960,6 +960,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk-mqs.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm-rpmsg.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
@@ -984,6 +985,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-15x15-frdm-rpmsg-dtbs = imx95-15x15-frdm.dtb imx95-15x15-frdm-rpmsg.dtbo
+
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
new file mode 100644
index 0000000000000..c3deb277edabf
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ *
+ * This DT overlay is meant to be used alongside the mx95evkrpmsg SM
+ * configuration for remoteproc and audio over rpmsg.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	remoteproc-cm7 {
+		compatible = "fsl,imx95-cm7";
+		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
+		mbox-names = "tx", "rx", "rxdb";
+		memory-region = <&vdev0buffer>,
+				<&vdev0vring0>, <&vdev0vring1>,
+				<&vdev1vring0>, <&vdev1vring1>,
+				<&rsc_table>;
+		memory-region-names = "vdev0buffer",
+				      "vdev0vring0", "vdev0vring1",
+				      "vdev1vring0", "vdev1vring1",
+				      "rsc-table";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		vdev0vring0: memory@88000000 {
+			reg = <0 0x88000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@88008000 {
+			reg = <0 0x88008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: memory@88010000 {
+			reg = <0 0x88010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: memory@88018000 {
+			reg = <0 0x88018000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0buffer: memory@88020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x88020000 0 0x100000>;
+			no-map;
+		};
+
+		rsc_table: memory@88220000 {
+			reg = <0 0x88220000 0 0x1000>;
+			no-map;
+		};
+	};
+
+	sound-micfil {
+		status = "disabled";
+	};
+};
+
+&edma1 {
+	/* reserved for M7 */
+	dma-channel-mask = <0x40>;
+};
+
+&edma2 {
+	/* reserved for M7 and V2X */
+	dma-channel-mask = <0xf>;
+};
+
+&micfil {
+	/* reserved for M7 */
+	status = "reserved";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index f82e149323d34..3ab679e5a4740 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -189,37 +189,6 @@ linux_cma: linux,cma {
 			linux,cma-default;
 		};
 
-		vdev0vring0: vdev0vring0@88000000 {
-			reg = <0 0x88000000 0 0x8000>;
-			no-map;
-		};
-
-		vdev0vring1: vdev0vring1@88008000 {
-			reg = <0 0x88008000 0 0x8000>;
-			no-map;
-		};
-
-		vdev1vring0: vdev1vring0@88010000 {
-			reg = <0 0x88010000 0 0x8000>;
-			no-map;
-		};
-
-		vdev1vring1: vdev1vring1@88018000 {
-			reg = <0 0x88018000 0 0x8000>;
-			no-map;
-		};
-
-		vdev0buffer: vdev0buffer@88020000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x88020000 0 0x100000>;
-			no-map;
-		};
-
-		rsc_table: rsc-table@88220000 {
-			reg = <0 0x88220000 0 0x1000>;
-			no-map;
-		};
-
 		vpu_boot: memory@a0000000 {
 			reg = <0 0xa0000000 0 0x100000>;
 			no-map;

-- 
2.43.0

