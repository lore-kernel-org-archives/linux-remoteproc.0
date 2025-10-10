Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010036.outbound.protection.outlook.com [52.101.84.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C69A2EE274;
	Fri, 10 Oct 2025 12:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760099087; cv=fail; b=bPB2o2Es5auY+j15sr/BzoG05mXqYMqogIOn3fC6rvvm9lpOdpk2vB8e3jamFbULylaBqpMLgOIkH/WDNYtbzs5TQTRXCPvGu34kOj+LUBI+r2IGzlIUtYgqNDQV5HZfRxkGCaSqZSBtz2xF6fQ38n7Fz2Ww0rCSQGG3zEyScbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760099087; c=relaxed/simple;
	bh=H1TADD6qC0zXiJ0NOz4L5Su7sbkZUQ5Rv0bUrA9SWJY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DRWaE/gJWQAultXF11CGigdPRQDHtdMFIuTFYh8+k+0/hlTxKr5rmFJfIZ5I8Bo3eeK09LI5VtSvPSwUgfXhPnBt4xY/I+mETNvTl4ptZd6ChRR08JkDGZArgLQ3tX/g6NijwVOiYkev5GrQVNkXEQGbnJEDLmk7p++r0BUKnWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PEW4A7nT; arc=fail smtp.client-ip=52.101.84.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PEW4A7nT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ieVSoC6Mqu+6EUEJgZ84VB13f7y78uBAHzDN3Q4zdn4oX9jcCi9mUgfwUGhw/dsBYOhy+tUgYFu9rTpOwjSXWBbEjlFHT/DYJlPht3udsOxAbAhSP87vO6p512DyUZGocpZcGHY7LzbK4uJ2VTsTDigaR7o8mJVP2kTnVna3DgyZKWT/127VhC0oGJF8LnEkpZMKGsoc5ysnSGmngVfXBQAEMT7hoc9a95SSYguThnUxrylP68akL+kuqxTxEh9u/qOMJ44qTvd2Iry8AH+5esGiBcHdss/uoOcJh7reaHzMdIEwGz9JuzhG0m/KXFDJNXJpEegopaFTZCjpLHrNTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVHCUXxvsZSjqQcEVbQwOLd3PxbXEThkxkJUmEbPy/o=;
 b=qG2SzJZbA0hZXoa5AufvFzdHX7Lh3abLYHkLc9QI+h1BqZUnDTTu+ERgXQhYu/jazXlxRIn4dLmGLeeihENIQmNak0nyIJ2A5Bs5gegta/FB+XeHFjjJ8AvucPHlxhDyFHftpLiv5z53V5DxUX7j3dbI3itRriPNmeoF/6sTr8fHEBAquvaqlPcNgs80EfaPStkjtmGItAi4fUMNMEj8yyYZQZCA0Lm/+E57Z1jq1Zuov9kRz0jBmSNoil0bCO3/Y16HbLIucgFiJpgazwkeqG/9Ou6wEorgxq7l23E5qXEwFexCKHYauO2KyXyfsAyKn8sup5Zdh3sjZDzVQacE4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVHCUXxvsZSjqQcEVbQwOLd3PxbXEThkxkJUmEbPy/o=;
 b=PEW4A7nTudaMEYjH80L7PYFCQvv7ypucp7xuLESC68zmvx6/fiIwh+j+JwekREDLABD/DCO1Snvh2NToFEKZMDqq2+2TMRKfa6wRMe+L47ZBOXIh5S2iWhakevmReYi7VIA6nGur0wHhR+M7nvmiyaAL40TZMWA2NEVMG5/XURjWDFvCJ/dpv9/6ClbemXUEfeJJQDqJnbHdyNSyOrexRoMWBThX8tbxuTrgEnvtykWUqd7nh2tFbvolyBSUZ82FbwGQ6/z6HdWZR9LzRKs6s50kXES8WizmCUfdIsDuF26Tt7Qul1czVQswxH+zU+cl9UExgi1kEz7oBOtk+QpV2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8449.eurprd04.prod.outlook.com (2603:10a6:20b:407::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 12:24:42 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 12:24:42 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 10 Oct 2025 20:24:13 +0800
Subject: [PATCH v2 2/7] remoteproc: core: Sort header includes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-remoteproc-cleanup-v2-2-7cecf1bfd81c@nxp.com>
References: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
In-Reply-To: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Davis <afd@ti.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760099067; l=1835;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=H1TADD6qC0zXiJ0NOz4L5Su7sbkZUQ5Rv0bUrA9SWJY=;
 b=ZBxNDCN5e/sBUbnNu83gPv3ch9LY8ReceBYJf+T0xzD5HVhcA10A3o/lgSSOfQk1bt+JyOe5H
 tmWHsSzEe0+CGK97ZEHruCB6AGwTlTpQSJ/9MRp9j2FYpfV53EOjaMS
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0134.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: d5f9b612-f976-4c79-46b7-08de07f7fd9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWxNcWVPaDFsYnlUYnhoaFBWakxwZVcvSUpTTkJrVUU1NFAxNCtGamlWSXJN?=
 =?utf-8?B?dkR6aGw3b1doZ09CelMraXhBRWhibUY3S2lOb2F0WGIreHJXd2NqNlE3Wmg0?=
 =?utf-8?B?ZUlBUlNWdndDbkZGNXEzL2pJWXVWRmxBeTZaZlFmMkx6dzY0Z2M5ekJlVFZD?=
 =?utf-8?B?eFc1R0xrMk4vNVp6bEdYNUh6MGRHVmlVQzRnTjZ1VUNnVWZkRzIrKzhwYUpk?=
 =?utf-8?B?b05CUTdrVVp2Vzg4YkYzeHJIbmlXK1BkblJGRUg2azNobXhPQXJCZjd4NVNa?=
 =?utf-8?B?T05DSG1rdjZVZ0lnOXpFZjFtcXF3VXNWMHg2dEVlN1l4SllIT3c4M2t5Nk1R?=
 =?utf-8?B?UTFsNzQ0aVVpSWpLYitIU3hISE41cjJEaVVwa1NKMnZ0cW9DeTA2QUNkR0l1?=
 =?utf-8?B?UlJmb1ZhTXJhMmttOWVMdzZIbFhuSXZQVGtnQ1F2WCs0NWIxVGJKK1RJT3ZR?=
 =?utf-8?B?MGtHUzVyaGV6Q2hLMm1hSFZCNGlueVY3YkNMQTY3YVhaMVhVVmFWcVE0NHdU?=
 =?utf-8?B?aHZUQXFna3lsUU94TzVMTmx1US8vUjdMOFNoSDhDZWhMRlFCUjRjQUFLVS9Y?=
 =?utf-8?B?bE0xMlJENFBUUjREbUVuVFNUZFE3UXQyNXVlVE1UY2RJUVZYc1hkK3BpajVj?=
 =?utf-8?B?WkM0ejV0clU2elUxNzM4bXZUdXNRVWZ6RzRZcHZibDc2RWZHZUlhaDQrQ2hu?=
 =?utf-8?B?ejM2cWhZc3lLdTNlZG9VZitMN0NKc2dONHdVMlVwdG8zMk1vcEkyZ0w4Z2tk?=
 =?utf-8?B?M3hqZ0k2RTdXUHhhWFpzV0RjZ2hTdGxMUXdTUmhwTjNBNDlBdlI2WDdlanpU?=
 =?utf-8?B?ejJQOGp1YXFFT25yb3ZZYXpZaFV5RCtoR2VDSDBpY2t1SkZWdGh1dXlOcHhr?=
 =?utf-8?B?ajNzN25SQnBScy9SK3V3RDFMZ0ovbU4zME9RT1ZwSUgzaVZ4bVp6L0xWOTZq?=
 =?utf-8?B?VkNsYWRXRG1Va1JnZ2N4VmhGVVJBR1JRYlBpN3dXSzZudUZDZnQ3d0hCV0FB?=
 =?utf-8?B?ZkNUVWtlVS95ZGU4a0hqSVI2a0NwZWNTVlcvbG9ZUmxzcG1OZk1WOERMUlla?=
 =?utf-8?B?bjZUY0NaY0xRbWY1MjZqNllHdER2czhDUFV1cS9QaHBJWTcyTmZyWGVBakdU?=
 =?utf-8?B?b0lKZlYyVENXT1JROWppb1JnRW1RRCtQUUhnVGhDcVJWeG1Va0lYcFhEYnM0?=
 =?utf-8?B?cGpROGM2dDAxL0NQYjVPZ2hoekNBT09ObElSTU0zRTB4SVlYTGFxSk9SdkFY?=
 =?utf-8?B?WWxDbEg4STNLdEpQd0FKOGNsVmpmOFVOWTdiYkdtU2hTeHFCd0RJMTlobHRq?=
 =?utf-8?B?WDVxbDJlcmRQUFJEaTZoK2RUeWg1R0V4SXZmeFA5ckV0dEhWNlJ0OGI2VVdG?=
 =?utf-8?B?cUtSbitHUzhtZ2NZV3FKRWpPdDZPaGIyWkwyWjduSG1xcERkelJyejRic1dJ?=
 =?utf-8?B?dU5qNzhtcmpTdnB2ZEVpYm53NFNlSjRTaElkR1Fobkx6a2k2cUlpbHZTUWk3?=
 =?utf-8?B?aXZjNDRqa2NRUTFGL2UwRW0rbHlMUk56SHZDNGdQVCt5Y1kzSlNaTXVzSUsx?=
 =?utf-8?B?bFF2NHhKOTNBbDVvZWNsNnFnRVBCQXVCREI4ZkhFckZWdGlUalR4MzhzaXBq?=
 =?utf-8?B?cGJTTGp5Y3IzRmZBYWoyTExFbG5KaEpvSGwxRFNWMytiVmVtRzdLclp1YXF0?=
 =?utf-8?B?dHZxMGsraklzSENJVWY0Z0hyeDMvZjFLb0U4S0R3aFNDY01PbW81ZUFFSzBG?=
 =?utf-8?B?S09BS2xKYzZYN25IU3hnVkYyNGt6am5DWkMzeituUmo4MDR0Vk84dTA0eVlE?=
 =?utf-8?B?SU5wZWV6ZlFwOGkyeWNZMzA5R0QrVTBPcEUzVitlUkcrTHpoc1VtSjVSaFha?=
 =?utf-8?B?MW95empReEhvbzVFSHBrVlhPMElCeUI1aWlZSzVocW5ONGdWY0drVGtmV1hn?=
 =?utf-8?B?U3ZUell1N2pkQUdOZmd5NUE4VWZXRW5ScFFTOTBSRW5mVnNWMVI4TEg5VlRX?=
 =?utf-8?B?cnNZMCt1THJGenFlUzAyZGJENUo3VC9GTGhpSUVRRS9JcVp2ekY1WWJLOVF6?=
 =?utf-8?Q?KcB9RM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3NZK1ppREtpZTE1UDhnM29BeE1VUTBxSVk5amRXT21EcTh4alpvYVFqNUdB?=
 =?utf-8?B?UmRoYkVYdDBaaTdacTlnWUFtTFdLTWp0ckVVY0NXcjBYZ0ZDZUhyVXEyUTFK?=
 =?utf-8?B?bGdrekVxMVcyc3Y1dWd4NDRYR1QvamcvKzBzLzdDTXhIelVQdEdDbVBpcGFQ?=
 =?utf-8?B?bjRQYWliZWFQcFJPUTN3ZUEwUGFscVFEOFFXSlpPUnc2RDhGdHhETHFHU3k5?=
 =?utf-8?B?eWR2aFVhNE5wNkdXaE1SVnhBOTYwZE1Ed1duQlhRTXNkUVBYenN6eHV1MlMz?=
 =?utf-8?B?SkswYzFPaWlnL1YvMnZnZzF4cFdBVHZ3dHVQbzZFdGt4Y3FhN3dqOUdjOHlN?=
 =?utf-8?B?cHg2V3hmYVZ3amxabFhvVUFURDhQMGhsb1hDM0pWdXYzZTkzVHBkeDZiY1pj?=
 =?utf-8?B?TStxK2RHVnhqdk1QcXJ3MXBZdm1sTHNYV2V3U0lFbjhLZWRINzdiWmZrQ3Vs?=
 =?utf-8?B?NkovQ2dMaER4WCtQQ0VISkYzRmhyNnRGTTgzK3F5a0tORWdyMS9vbEY4dUNB?=
 =?utf-8?B?Q1VyOGxWSE5ZVk4vc3pHM05ac3JEZUpBV3ovejh0cThwQTI4d1d2aVVqR1pn?=
 =?utf-8?B?UFNmdnJmcHdaMGd3aUFyOC9YVjAweEFjR09nRmk3NkwvUFZ2eE1PWmdWTkZC?=
 =?utf-8?B?UHRySG9YbFJFcGl1UXNRNVZDYXBjczhncEhBSElzWFFvd01IeVZhMHVNMmxk?=
 =?utf-8?B?bXFoUDd5RUU1MDZua1hBOE95cnVMOWVOcTNMVnp6cE1PTFd3M0RYMERmbDFa?=
 =?utf-8?B?MkRxMkpoMlVKeDdwblEzaEtmRlByM1lRVDM5Q0VsQkxQZkk1eVRRRUJrVTFa?=
 =?utf-8?B?enM2N0dWQmlvdE5LRm1HcENGbzlLcFRtNkI3OHN5WXdOU1FJNHBaRlNQK1BK?=
 =?utf-8?B?ci9HdUVYRlM0QjEyTUpNWnZCN2VvWFltMXZZZXo5c1JJQ1NvNFkrZlN2ZDl4?=
 =?utf-8?B?bXRQb1dSOFdXTSt1ZXR1OWR1RkNHTWord09uU2JhYUFxNjkwQ1luLzM3azdX?=
 =?utf-8?B?em5rQnFLeWJFamZiMGJodXZkeURWaTFaTUU3cUp0ck9VdVpUZDlaSFR2c2x4?=
 =?utf-8?B?SU0ydVZMVHVXeStsOEZ4ZFY5MTdudHZLNmV4MHlMcmNBMVRreDhaNG1FU1NH?=
 =?utf-8?B?VXRuSXNkTFpiRmU0UTk2Y0FOM2RtNDIwU3g2SnlUS3JaS0lCS1UvRFFveUw1?=
 =?utf-8?B?Vjc0NHVWc0QxNG9VcXJZVG9qVTRUM3JEcDRpaVVUTUZublExV1lVOFZJeUJ2?=
 =?utf-8?B?c3VYSmovM2xyYzBYWVdFT0JkWXZ0Y3Q5WEtoMEpjb3FYbHpUOGcvU25PVnZI?=
 =?utf-8?B?ZFZJcWJMS296dFB4Vmk2MzAwMUdpbmpTMGlGalphNkxaSUZGYUh3K2ZESEVu?=
 =?utf-8?B?c2RicnU5Mmo0RHhKV28wc01PbFRnZHROOUIrdGsxUzBHRFRsNmdEMFljU3Ri?=
 =?utf-8?B?SHVvRVErK2REYXRqSGhoeDZ2bXNMNXhEOFE5emNSM3VQbnZCbHZYTWVQZ2hm?=
 =?utf-8?B?ZUdGT2k0aVZ4S1h5NU1vRVNEYlIzSk1wSVpDVEZzenVPVmNCaVVvV1oyZWdI?=
 =?utf-8?B?SUJSZXJIcXNqSEZidFhGSWFKUGdubDVlTFRXQWpWZnFMR2NpY0RvYVlMandz?=
 =?utf-8?B?NXlLWWorSHNmWFJKRkJTVnU5SFkzemNpWHJsRWZJSE1SQ0U3UExUTWNQNnJ6?=
 =?utf-8?B?clVmcC9uTmo4Vk5TeXFLc2RxNUpCc0pRL1NaOFhWcXN0QTVKVlg5NGFoWisz?=
 =?utf-8?B?UkpyMkorcjRJTjZQTzFVTmNnMlRpRjdZVlpwRWRzTVVVcGliUWdJVnBqN1Iw?=
 =?utf-8?B?aEI5T0tKbGxuS0RTZE9OcHpRaHBBYjQ1MnZNakhNSW5hNHA5MXVaOEVNQVlp?=
 =?utf-8?B?REQwSW1iaHlGZkYvb2cvMWJiaWZVWDZsa1V6SHRzMjFURU5kQ3ZFWmM2S00y?=
 =?utf-8?B?amdnZmN2RTcvL3hOc2M3ektSRFV4L041RnlxcUEra1dBTWptNXZDVHA3RFBr?=
 =?utf-8?B?a3ZxMllhcmEvbkh4blE4bXY0VmJpM1pXaStFcExxZlYramdkRHJzZ2IycERQ?=
 =?utf-8?B?aURzL29kWEVZbXZDbnBScURCOXhSSzZMYVdkYlBQaGp4NkVXeTljZDNkRldo?=
 =?utf-8?Q?fsuTMqlD3EQ7+dtolNnQ767hx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f9b612-f976-4c79-46b7-08de07f7fd9c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 12:24:42.7821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I9WvHP9pOuG2r3SKg3IQ962Xz+g6wrwZK/VpHP2HWEesn7//tO129xAwE/B+iZQvVYE+k8M8f8EJulvuxYkHbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8449

Reordered the header includes in drivers/remoteproc/remoteproc_core.c
to follow alphabetical order to simplify future maintenance.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_core.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 29bbaa349e340eedd122fb553004f7e6a5c46e55..f7d21e99d171667d925de769db003c4e13fe8fe8 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -16,29 +16,29 @@
 
 #define pr_fmt(fmt)    "%s: " fmt, __func__
 
+#include <asm/byteorder.h>
+#include <linux/crc32.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
 #include <linux/device.h>
-#include <linux/panic_notifier.h>
-#include <linux/slab.h>
-#include <linux/mutex.h>
 #include <linux/dma-mapping.h>
+#include <linux/elf.h>
 #include <linux/firmware.h>
-#include <linux/string.h>
-#include <linux/debugfs.h>
-#include <linux/rculist.h>
-#include <linux/remoteproc.h>
-#include <linux/iommu.h>
 #include <linux/idr.h>
-#include <linux/elf.h>
-#include <linux/crc32.h>
+#include <linux/iommu.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/panic_notifier.h>
+#include <linux/platform_device.h>
+#include <linux/rculist.h>
+#include <linux/remoteproc.h>
+#include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/virtio_ids.h>
 #include <linux/virtio_ring.h>
-#include <asm/byteorder.h>
-#include <linux/platform_device.h>
 
 #include "remoteproc_internal.h"
 

-- 
2.37.1

