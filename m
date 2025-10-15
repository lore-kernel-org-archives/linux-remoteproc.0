Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011014.outbound.protection.outlook.com [40.107.130.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0459123D7ED;
	Wed, 15 Oct 2025 13:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760536434; cv=fail; b=VmxU5/b8x5h0lUYD+W3BmRVnhDz5FZzxRX7OU6KFCrtNpg6XIkqrgIvL9TmRKODJlIMTCQ7mBg9TislBWQaEIW7P4OXVg/FqAqWpXutM0yQY5xOmeLlgbe7HtrWrB2FZpW/gzVUJnBwjd6D6zBdRTEWE7aUIenGfx0iODaOYZg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760536434; c=relaxed/simple;
	bh=Fdunh3LTwIZwep3qLyqzEC1Ig1SD5r+kiO2NSB4J/rw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=g4jtR457YoBMcS/gkS7yyt5BzaYRz7Ay043XZEA1t6HD1awSzc9z9E9EGHLshmq2h71PWGwgaJ8NCjzj/7U9WtXUU4P6ArSUxy9hnzZk0b9vp2WvpSFMfevkcaBwi/dJE2gd0cV116sOQNC4HKGCgcvthTZgZMF4dCvBiY6FvVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YMfe57SR; arc=fail smtp.client-ip=40.107.130.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YMfe57SR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vzioyhwXTBBUPtjEnStgKJG/GftfbslruVMLWx/Wal0RuwXxqHpuhgPmQ+gvvg9w5m1skEoiXda5kAC3FvaLwmeELNMndsOy7sGJDUOf9vFw4ZA/ImLg/pXKI2SJgBvDYV4OTpLyHJnwHrj0FCIwTrlWkUhM4uQQlCAomIW2rGRC4x017LpnS+xu+/G7mQS53Y1SHSHVl5xzbGpUGaP1f3TTpmSC439ApDZWOe251UuePim7tk9EMJizE0CW9kyxEAllLd7mE+8bB7TSBZ+2IlbFLOGD3oqnG6YSoc5tUwEAqFGWHZtnEDOn6p4xF9zFtRNy6GMHRfmdXroZzyN+Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqU3T65sndTvej+H4c1EhoRwe8TsgtHT+nJHsTL6s0I=;
 b=Hu0rZwd4B2Ie6hJutK8H4kJ5L63wiXaHU+LAoZS4eE3U09+ePGCi8t4AO2/GzIYgBIynq3nl18o08YNsM6Ujl52eKKXKmyRAjk8t970GQCEMX7ed7tLIW1rJZdwGAnzP8exR/FNFatoOc45Hc18yd5TnbiicJVhoM0/50CkXKa/G3S6ra31kAl2/vraocBqQOuf/lBv/cyOUhLQxxa61s0BI4kF2CgORHQwf5qqnwHzhEPsDd7zrGqLdNqmneOQk6wUAUn8eNrYwPwAnQgvUEMvrtQZ5fnKlEl65mlaOAd1rE4ZATk/r3l8hPseTjdcMyXAETnaLMl2sosK4+R3tmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqU3T65sndTvej+H4c1EhoRwe8TsgtHT+nJHsTL6s0I=;
 b=YMfe57SRN6PD3WxKWc4rguuE3BtwFozvmGLXEoQ8QisKL3HD6WmzasMgvOwRk3PUgYBaZOwQwSt+XiHm0g7aO12Q4Rj+jo5Jbxnpuxcpb+NIFWaMVFPd2hd7T2CN3YToAO7ndSjMiwYJY4fN8bP1LFg+iIu5NcKcptETgxDNACvHvepbwvoXJm9E1UpRGPdF4WUgpWZHn/rAU8VBIbVhyEpWfogjoMsEO9Tscu4Ka1vA2VeZWPs9JuEJEad8BYNabWuCXdtCKssLZhoQ+0lZRCCkmVQFvokjL7jxP1/UWnkb17Mnz4wT06bCBqKstvGARb99STX+cMWbj15JQ2iMEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10251.eurprd04.prod.outlook.com (2603:10a6:150:1aa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 13:53:48 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 13:53:48 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 15 Oct 2025 21:52:59 +0800
Subject: [PATCH v3 5/5] MAINTAINERS: Add an entry for i.MX remoteproc
 driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-imx-rproc-c3_1-v3-5-b4baa247358d@nxp.com>
References: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com>
In-Reply-To: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760536394; l=952;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Fdunh3LTwIZwep3qLyqzEC1Ig1SD5r+kiO2NSB4J/rw=;
 b=d+Fw9XFPsnH15kvg80flpCQ7LFX/hYmFF8l2yWp04xkbekOxt6ufQfBsSaWZwyijFdlJvU40E
 vAYI6Js4SiWBxRy9IRvMB7LjxxurhZPdfWyh/oi3etDxpgeFr6BW/J8
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0110.apcprd02.prod.outlook.com
 (2603:1096:4:92::26) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10251:EE_
X-MS-Office365-Filtering-Correlation-Id: b9676fa1-8e60-402a-a093-08de0bf243ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHc0S3N1dU1MUW8yMnZzb2d2QjdLbUJQWndlWG54SHdhdkVnbXRkODdvTU5l?=
 =?utf-8?B?WmdxRWxMRGl1Q29YcGRBVWFQcFV5UWJ5dmI5aE9uZ2IyVHFxQkNXU3g0SHNF?=
 =?utf-8?B?ekRIRXpCS1dSWVpIMXhMOEJXVjRUNW9ZMzFSVDlxazh2dGd2NnBLaFlLRU5Q?=
 =?utf-8?B?bXdjQ3BoK2trYm1JTFp6d3VPWmlDQlBzL3Y2ejhodUhua2RHSjhEbkJPblov?=
 =?utf-8?B?ZUNPenJPMGhLRUZ2Qkt4UUc0K1hxVVhoSlpJSjhxSTJkeVVHUjJtdkpPdHk0?=
 =?utf-8?B?VWhqU1pONmkydUxTU1EyUDRsK3NuOCs3WUlYS0dNVjB1U2wzeGcyTHdFcFpx?=
 =?utf-8?B?a2hEVyswaUoyS29WNFlCdFNyZHFtR29QRjJzbFk2R0l4MjNPV1loelVjTnJS?=
 =?utf-8?B?MFZYa3dSZDFGYXdSRkxpVk5hcFA0SEM2bXphNWY4Y0IwQTFvRG9jbERKaHFz?=
 =?utf-8?B?ZlBHZ01FakFjdHVlc2tJVFJ4SzBqNU02VXEyWW92bVE0OWFCZ00xbkpUWWU3?=
 =?utf-8?B?eEwwT3dIZlRsbzlYaU84VE4zbE02NjNDdjl1YzNyRlhjMmNXNFFFdnRFZkRT?=
 =?utf-8?B?YnVQbDZJaXBEU25DUFlyZGZ3YTdVWmVFWGllZnF2NkJkZ2d4WTRkVkpVNERN?=
 =?utf-8?B?b2dDVXoydGsxeHZ2QTJObVFWNWtlY3pSYlRVSjYxWmVZUlVpVnozSWZWaUM1?=
 =?utf-8?B?VzhPK21Fd0JMZ3IyRkErNVRaRDZvVFo0bXhaRWh2QVh3WStqS1hmQ0NYV2x1?=
 =?utf-8?B?cXpGNU95T054RnNhdU1qbmk4NTBuUzlZSVdyVklGNXNLbFdmNFh2aXU1MFRp?=
 =?utf-8?B?MEJLZTNwT3k5YWtMYVlKdkVDWmZZZzQ5aGdmQVF3ZGNpSEZPbFFldGZqRkhL?=
 =?utf-8?B?SWRuR0c2Q1hFYi9jK3hqcjlUUFpqSkQzeEpreWFOQm9EU2VPN2dKTGFZKzhY?=
 =?utf-8?B?eThwejEvWTBZbFNJYUZ6OFNTZ2oyZVZXUjhjYjAzZGE3T1RDTHk1b0tkdkk2?=
 =?utf-8?B?dDkvTG1MZjBCZlhvUTM4UUVGcnNQcWZaMERlRFUzUC9JUEtwd2RpUnZKZEdi?=
 =?utf-8?B?MkpWK2FlT3pLYklMUFp4VzU5S29USVFLeGZmQkZMNFdlSmN1YXU2TThSc0dN?=
 =?utf-8?B?L1hQTEZNc2JpZUdpbEV0RUF4em5JZ29rR1ZqVSs0VXhFeHZKTlE2MUdVV3g3?=
 =?utf-8?B?bEtZM2dxK2ZzOHQ1TThnL3dERmhoamEzMzhhbEhlM3hKZkZJWG5JWUhjam5F?=
 =?utf-8?B?MVBOUFNJcGZZdkN2Q1d4bE9QUjJYTkpGTmFUMjh3cjlzdlhvdVd5OVJIR3py?=
 =?utf-8?B?eFBkYmNVTGRLb2FvUUtpN2ZJZGphS0dkeHh1NUZaSjFuckFrclZUamF6MkdN?=
 =?utf-8?B?bDBiWGR0bnM0K2FBMW55ZWh1b2phdFNTQ2VFaXhaTy9kYTc2WlFnK0lWd0Iw?=
 =?utf-8?B?WWhCRHgrNFZ4ZW1Wd2FHK0pCcE1Tb1Mxb0xkSUVOU3J5cWF3aUR2VzhySEdh?=
 =?utf-8?B?QVdEbUh5SlBKWjU4enFPWEtyU3JGeFJLbklaUytkKzRHK2tFM2dFU2JTREJ0?=
 =?utf-8?B?eloxcTBHQlBhOTVDNzJpLzBQMEIvUks3SXhXUFdWM1NLRlFjNVprZTI2MUNL?=
 =?utf-8?B?cGViWE5GeDJTb0UzbFIzSnlLSnJvL2RiWVFHUzY2cjNjMm9qSEhRKzIvbnc5?=
 =?utf-8?B?WlJ5ci9Gcm1RYWowOFlEMTkzWjRGNHRYTHN5WnorajRHS1FsY2xMRnhWYVlW?=
 =?utf-8?B?TitVQXJTTUxKRVZQWk5JT01yeCtSQ1N3WUJNUm5QeHBYTHEvZGJUM2tNSWFm?=
 =?utf-8?B?bUQyUlRLSjhLZ0UvS3RxdFNEOGdEMXBKdU1DQml3S2tSQlRsNDNPTWNqMXZN?=
 =?utf-8?B?eGtQS25pSjY0ZWpydUZVYko2VGYwbGMyUmFoWEExYk9PSTFvUGx6SGMxRVNY?=
 =?utf-8?B?QlFBVlk5L2g3M1dJRDhCcHBZYjhVR0V0Zzk0enNSRExYendMdGhvVTRabGIx?=
 =?utf-8?B?a2owZ1FUSnZUMVlJRFdrbkNMdkNLQVFIQm8zcXc0T2tIcFFQSkErU0w0bmNn?=
 =?utf-8?Q?MWUmng?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkxwRVZwVFlUOHdGb1B5bkFsYTZBenN6RWZBb2Z2VUF5SkttSEZaR3VrOE8x?=
 =?utf-8?B?dUYzd2FadWVIRnFHQnpEcDZuTHNRQkcydldYNW5jRnNYWUYwQUw3RThYaFNH?=
 =?utf-8?B?UnN4YVZKNEhGNm1tUUVxZ1NCcE1PcTJ6Qm1WZE1YOUNWbzJCNHl4NThLbHBY?=
 =?utf-8?B?WEo2SlE2L1IvN2NzWTJuVzhNNWF1eC85cTVDM1Q5L3F5bU1MRSsySTV5NTNV?=
 =?utf-8?B?OXZJY2JtK1JzNWU1WlpQNUJjN0JQUklGTE10cHRBUnZzT0lNMUlQdDhXRS9H?=
 =?utf-8?B?T000ekZaZ2FSZDlCeVBuaVdxcU45ckNKL2R2UlhCL1dTNDI5eC8wMldKRTZU?=
 =?utf-8?B?T09JOFZsWFlQV2dtei9UZFJHcE1pRVk4NDFTZmxiZHN2Nkl3QnZkM1l5SkNa?=
 =?utf-8?B?RWdXeHRkNEVZTG5sMjFSZkJTZDV1ZVc3N2tKd0RjZ05oVXk3eFI0NUJKUC9Z?=
 =?utf-8?B?MEx3L2luQ1YwR2l5WmVYcSt1OVVIU1JuWGwwejF5VnBDT2EvTW9DWU9CUXZZ?=
 =?utf-8?B?L2NRbUFkbjB4T1krcTA2MXMwbHRMaytBM1VuOTBBUi9EaERDWmp4ZU9IcUJE?=
 =?utf-8?B?WVZtcXBVdjIyYXpZR280WnBlT0JTbFA2VGxNSzBkaVppTlNCdGpMTUdReEdy?=
 =?utf-8?B?Uzg5Q0d2dUZHQ3NacDRzMUx2RWxkYnlKVHBGd2VRd1lRQ2pJVXVFazg3Zmg3?=
 =?utf-8?B?clh3RnFvb09tUko2aXFIYWVUV21wbnJTNElqbW1QMEV6ZEFHUjJNbitqb2Nu?=
 =?utf-8?B?eVEzSTlQRFk4WTVWWEtTZXdNSFdZcWFnOHpORHB1TUwySmE3cjJFcTl3c2Iv?=
 =?utf-8?B?OXYvSmVoWVZtaW44SVhRbWdXVFhzM25GSFdRK0RaUW9hZmJBdXdpNG9zckpU?=
 =?utf-8?B?N052KzkxTThmQlluWG4xeXM2YkNrOHFlYjhGZmNLZHZqY0NEM212dDBhMnF4?=
 =?utf-8?B?M3MxNmx6dG5ZcEloR3lvWWxKWGdsZXNMRjZzYkwxejZ0QXdjeXNPOUNRM1pz?=
 =?utf-8?B?VXgzZE8wSDIwdWdIWW82U1JkWU1GUWNQVzBSeHdhZEIrMTB0TXRyNWZHaXpE?=
 =?utf-8?B?Ym5LNlFqcHRhN2JiS2QwSC9GS3JlWUpsWVE2UlZkbEhVaklrelRMSURKV3Y4?=
 =?utf-8?B?VWVsV3BGc1h1ZnVDVGxtMS9FN1VQaVY4K05oWXpEYXBlYzhRdDFjMjlTVTdy?=
 =?utf-8?B?NHFxRUU3allRdVYxMmRvTG1melZlbmQ0alNtUWhoTVFWN2U0SU9HWmdXL0p5?=
 =?utf-8?B?M0JnZkYzTlR2T1gwNklnOWtHTGxGRDdjOXVvS0dLaXduYmw5MGhYcGN0ck14?=
 =?utf-8?B?T015dDBhRlVEMjFDYm43a1pYR1IzcjdRQ0UrTlZrYXdMeUYyQmM2SEJOakxp?=
 =?utf-8?B?RGhrakNWTDNmWWZzbHdkYUFad1dDL0RzWXBOTmF0ZjhRUng4UG8wNW5WSnkx?=
 =?utf-8?B?bGNJdHlyVDR6R2VYWml6U1d5TnhBcm1mNzRJZzV6MXVTMUZOYWd1T1pBSVJE?=
 =?utf-8?B?WlNpcVh4M0VEWjBzOEY4ZmQyUVlEajZKNFRTUWMvLzU1YjcwWGkxaWxkNS81?=
 =?utf-8?B?elZLOWdZVEN4U0JHekoxTS9wVnl6NjhMMHVkamt1ajZUVUdrMDdJSXp4S3Zu?=
 =?utf-8?B?b0hscnVsUDJ5bHJ4NW1mR05adTBQY01NYTVTdzk3TVB1TlBCZ1BTMHpiRE1R?=
 =?utf-8?B?S3QwVVdJemtLWDZUaEp6NElpaE5RKzFHZVhMcHZVVEpkTEVvRm9FZjhVS1pq?=
 =?utf-8?B?Ni9KQlZSa0I2OFM0a1VqeE5COHlVSlpkejE5MEtqeXJpNXFaeHZKY1ZpbmZm?=
 =?utf-8?B?R0pzWHgwZUgydXpVU05jWlYwdkxkSmtacFB4WXFpcE9BWGI2YUtrdnBhaFN5?=
 =?utf-8?B?NjQ0Rjk5SkNOMWRIWmJudlB0K0t3ZWtoWlVHQjJZNlZjRDBnTG5ZT05hcGNj?=
 =?utf-8?B?eWRyem5DeGdlUGticmVhQTkrdmNuU2NSVFJyR1JuOW1hZXhXVlRXeUlHY2Qx?=
 =?utf-8?B?aEdyOHQ2WU5CV0Z3R1dyaTBFYXpFeVkwVVMvNjRmdkZCQ2pZaXJzcDJnVXNH?=
 =?utf-8?B?WnFyNHNyV2RLdHJKZ29VL0IreXFCQVpHVzE5VDZQaGh3T05vWUNPSXI4N3Zw?=
 =?utf-8?Q?KHziMnS1aOH79LZ3L44kkg2Uc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9676fa1-8e60-402a-a093-08de0bf243ce
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 13:53:48.2307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eWu9dgOW2v1W1is5SHdcrshX70ryjaEm6qS5NHbLyGLQ1OkH/ECPaAaiLI3Vv79Dm0AwlcBRCHUcl6kThf17EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10251

Add an entry for the i.MX remoteproc driver

Acked-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c9cdb95dc150a55df405adc3cb853c61f4c2b467..02dea709a5a5d591f156becd35640dfd93fe62e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18610,6 +18610,15 @@ F:	Documentation/devicetree/bindings/clock/*imx*
 F:	drivers/clk/imx/
 F:	include/dt-bindings/clock/*imx*
 
+NXP i.MX REMOTEPROC DRIVERS
+M:	Peng Fan <peng.fan@nxp.com>
+M:	Daniel Baluta <daniel.baluta@nxp.com>
+M:	Shengjiu Wang <shengjiu.wang@nxp.com>
+L:	linux-remoteproc@vger.kernel.org
+L:	imx@lists.linux.dev
+S:	Maintained
+F:	drivers/remoteproc/imx*
+
 NXP NETC TIMER PTP CLOCK DRIVER
 M:	Wei Fang <wei.fang@nxp.com>
 M:	Clark Wang <xiaoning.wang@nxp.com>

-- 
2.37.1

