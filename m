Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013036.outbound.protection.outlook.com [52.101.83.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698A8334C24;
	Fri,  9 Jan 2026 12:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767960511; cv=fail; b=lcdR0DMIsHb8O8u36s5cq9dNJPcPAZqOADMSue3W15jwiuJfBMpHusBCkt3amk7Y8kaS5RJImMh5kJXvOYY9WhN/aAGIlRUvPJhQc10EQ12IUhZyL3AwbtexWz0Vo/nP/NryLXAdg/bE7RbDY6efrdMXuPikX9OoD8geeMO92DM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767960511; c=relaxed/simple;
	bh=V8tvkLWnZ0U9Vw6ewkfLNytYygg6537Y8Y6JqxmrWac=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=d0RKFvfypxRgQ9VNT5PG4n9zMY4LcUR4/Bu2w4qwCrWbxeRs1dBT2MPWynouUB5Z+NJATuUC7ljucdej/SjI8tN3jpc3V39U0bpJzD84XB1nB6Fj3HCWVyXLs3K6lXmFB8gS8gMxRceA6AQKkvJ1xLt2AuX4rFof3DQrxuHSwHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xOf7B9K+; arc=fail smtp.client-ip=52.101.83.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xOf7B9K+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUoWX2GvjenND5lQUAvjx96BWCvnSHsTuteDjapHbY+wwFkIq9j8Obs0DT5lPPuUBwJbEjryWwFD31+a2ldStPVYqbnv0mE3oDsLK/reN+Ulu8mP6ipLIpzsi/psAWdvDu/7ThV8JuphLOlEd0HfBJkAQ/4po5cWT2qErIsrS9BHlLXtzDKNI9mnew/6nHQgiK/L4/8jGsN16FExzPRjVl0leWd1FKvawlx5RseApIKQVeHACEwp5aAFsbZL8hEHkU2Yy7zcoUfYUuOB3KMN7RDBm/I5k/vO2pywSCpXAnqHmjEXOQmPMDeEqBUI/zhAsftq/ESG7CO64iT9ixOEtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6bQ0b3g81JVoGSgISk8REfTpQrcnEgoLt1QXoD4X/M=;
 b=AdkdlbxePhdyQJobcuEN3JqGXMop1oAufIUWkvw8ZIIF7e9pffBVHu/XUJUpFGBkZ0DgiefAi2CyUq9UFc3W0p5rffPZr0NU4OrvT8pUxFHnM4sgYauAUy/5F96RxEnmtqn6j+7V92QJptVl9tNXHoWfJm/Effp/tcv0D+ZvxyY8938n6V0Sf7IB2BE9Jv1v0mUiQuRY8KhNgN4vx3JN82fd1YRb7voMnX9WCeO552jAFoggCE6QjhPJpycgdDs1egxLUn8o45q+HVG0N/ovb6LVRDtUOqHc7XkHtnxCuUGEAGhsq0iXrqbhR1b1KEwE65roYlLls/fAZKyqIKvkng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6bQ0b3g81JVoGSgISk8REfTpQrcnEgoLt1QXoD4X/M=;
 b=xOf7B9K+mLOY8wdO2yhHGln4aq3rgfx9MvMyOLq57ENtbdQ5h7y0WRAuG9nA3avT6YwdT4Ot0L3JfXukx6xt9JwFdctCCNRkz+o+OgU4O9KD5X/nOWBvJ0ws6Slbv5i/GCHWCk/UYsg1rpzqr/SZt0cvdO3TclsdjghAdCqDjrguQMgFv4tf0jL0sd808uhiNLuHJEOb+S8+q8OLPqiNJq/peMvEZPsqY7Lh+rAgGPbAVmOQJ7L6OZBg4zrjjlALUPNqbf7myJ0t1k/dzMmbGODjCbnHiv4cj48aoLuriDAkC2tkGC7muwfVXYjFckOiTyNdWJmTwd248rAPGX5AXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9480.eurprd04.prod.outlook.com (2603:10a6:20b:4d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 9 Jan
 2026 12:08:23 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 12:08:23 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v6 0/6] remoteproc: imx_rproc: Support i.MX95
Date: Fri, 09 Jan 2026 20:08:00 +0800
Message-Id: <20260109-imx95-rproc-2026-1-8-v6-0-d2fefb36263d@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKDvYGkC/x2MSQqAMAwAv1JyNhCLS+tXxINo1BzUkoIIxb9bP
 c7ATILIKhyhMwmUL4lyHhmawsC0jcfKKHNmsGQbKsmh7LevUYOeE34SS3RI1dLW3nlqKws5Dcq
 L3P+2H57nBUp6yB9mAAAA
X-Change-ID: 20260108-imx95-rproc-2026-1-8-04f759890742
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
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
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
X-MS-Office365-Filtering-Correlation-Id: dc406e8e-415d-415b-ae67-08de4f77c97c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|52116014|376014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXlXdzVpOEZraU5UZEhlL1FManE0VkliUkc4U1I3WXRoNEdQN2h0ci9nU1FT?=
 =?utf-8?B?QVd4VGN2QTVTQ2VTb1ZnQjRrUDJXS0lRU2I5THlzV1VlYlZHeUdLcVcvUmxh?=
 =?utf-8?B?QmU2MDJPQ2ZxNDR2STBHU0JTeFhKSGxsVDlEOFNyNUk1aXRySno4UUtzNEQ0?=
 =?utf-8?B?dWN0S0lhWThyQWgyNEJpUkFlK1F0TlhzaEVsRWtxeDMyVndOVjM5aXFYLzNL?=
 =?utf-8?B?Z0dHV0lOMVJKbWNFRGtZQWNoNUZuN1hpMkdGT0cyaGlhcjlRWE9LTzM0Zjc5?=
 =?utf-8?B?em0xamF6aEZxd1liYklyN1BhczZTRlhRVnM5SU5yR014dnZXVHpZMzcrOGlj?=
 =?utf-8?B?dEE5REp3ZHUxOHoyZWFKNmVMRnN0emZkMk0yN2VIZU5WYjQ4c2d1S2hVOXUw?=
 =?utf-8?B?bnQ5WVdZNklTejEvZlNyVVhkdnl6SGxWQUhERVRpREVwVWp6dDNMT1ZUcUxO?=
 =?utf-8?B?SEdTc3I5dWsyY1FxNjQ1NkNYbCs0OVA3UTl0aDZ3Vi82UWFLZ01ZYUdFVWV1?=
 =?utf-8?B?a0Q5dVRhWkE4aHlBUUlUQTNTTUVrU080MThQdGZSOTN1dFFGSmlITjBteUE0?=
 =?utf-8?B?T3lFL3gyZ2tGWkFOVXRlcFZLYXNNL0FIbEJNY0R5bklweUhXZC9KS0NtbUcv?=
 =?utf-8?B?NktZdGVKeDVjeG5PTkJmSzhHVFREdjB1djVtWFFZeGpETEFCQmxlNERiVWZR?=
 =?utf-8?B?b2lRbHlTcWJMazErOWxtQXN5MTh3cEdMVFB4QVhOUVVINnozVDRmWjc5Q3F3?=
 =?utf-8?B?bkFWL2JPb1ArekRwSHN5dzZtcytQdGRqMUprSlpVK3dQajhydWZGb0pJa1NW?=
 =?utf-8?B?RUZva0c0UkZucmRrdDdQSytQcTFLRzFMKzZHQUpaMjBza3pyRWZXa2pTTDB4?=
 =?utf-8?B?ajZQWWJRR2I3VkxXMXRxa3BsZFVQSkJIbVl5VmZGVjhGUGU1c0hVbnBkSENt?=
 =?utf-8?B?UVhaTEdBczJDYkJxYmIyZEVuVGdYZnpIMVZ3ekw0cG5UYXdwcjUxTVhiaHo1?=
 =?utf-8?B?YmwyVDZFblZOZUswdzI0YnlyaFdGbGpXbkFYVWtkMTRQamdqaG5ncWttL0lB?=
 =?utf-8?B?bzZnNXMvQlYwL0RDcEtoOEVFaDh6V1A1bzF2d05ENURnb243R0JrVC96Lzho?=
 =?utf-8?B?Q2kxcUdkaXA3Wjk4eEFxS2FJM25scTZiM2lwOHFNY0pXT3BPYkI1ZGFrZWgr?=
 =?utf-8?B?OFhFRm9XcWlCVnFiUkxqRDZKNWNlOVJPZEpZaFFJeERDc1NuNTNPRjBTdUQy?=
 =?utf-8?B?V1JPcmc0Q3I0UVNJTzBzQWFSQlo1NFJlTVZ5cVdTZjQ5S010ZTVWNWZMU1F6?=
 =?utf-8?B?V3JkbktTT1drWlV3NW45VXV5VVZIeTJDa1dqUm5XeitESjRERW1pUGtXSFZQ?=
 =?utf-8?B?c2hLSTRLTG8rangxd0RkYWcyMkJYK1BUb2c4emhlcE5uY0txWGp0bzhHRlFH?=
 =?utf-8?B?VzhmTmRaTmk4c3htdE5rQWVPU0p6YWt1YzVvTVQwQ2lBMzJ3cng4VkxWQWVZ?=
 =?utf-8?B?NlBRK1l2ZFo0NHM4dXNYQ01pWENxMTBua0piQ04wSVJOYXh2YmptNzNGRS9F?=
 =?utf-8?B?YXlFanp2MldVVTc3V2dGN3YyQ3o5UVZlZmVKdUwzTlhEN3hkUWU3bEtueTl3?=
 =?utf-8?B?SStXZ2dnNTk5UEhBS2t2UGtqYW9ZMGpwM3JqblJsc3Bpd3VJTHRYS3VISDV4?=
 =?utf-8?B?VUcxT1NnSWMxa0c2Q2FiZXNiOFY2RWdlRDZhN3pQN2NUaUpzRFRwbzVBRHQr?=
 =?utf-8?B?Z1VwUm5zNmpmZXIzdk5ONjhBNUhvUDJPY0JLaW9mM1BYMWI1cElsOTllMXF5?=
 =?utf-8?B?WkUxM3ZKY2lvSWNjdVd4V1FaVzRSWVJtSEEvWStBcXJxbVF6a2NyMURFbnBw?=
 =?utf-8?B?eEZ3aGxQT0poTjlRMjFhUUROU0Vlam9NMFh0b2Q5THR1ZHB3cjcrRXlZUlli?=
 =?utf-8?B?NTVhci9pRk9Hb2lLVkpVZk1Tc1FEbWNhVkE4QkhTWG1HUk02dnhLQTdaeTdP?=
 =?utf-8?B?bU5mZ254bVEwQXdGNUNuRitVVTRHVDhZa2JRTG9aMWxnZG4zNDUyK2wyejdR?=
 =?utf-8?B?UEFuemh5NlFoNVVSekdrd2daOVlKWmx4UWRUUHNXcHMzRnpjWk1DUm1oMDA0?=
 =?utf-8?Q?A3YM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(52116014)(376014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEtTb2xXejF2bTZBMGxONzJ3bldsSmIvL2dXSXFSRGl3WmZRM28wS21WS1Fj?=
 =?utf-8?B?M0ZYVW1xQlJneGdXNmlKc05nWWhsUk1PQjRYV3BibFErL3RaaVh0TitzbXQ0?=
 =?utf-8?B?Um1yMjBKOGEycXlPOGRoS0F1U2hCS0N4dXFzWHF6VzhDZ3NrSUlITDRPN1Mr?=
 =?utf-8?B?WDJpS0hxVEJ5aTNYaHpUTWxKb21wK1h5alhCeWMramdlV0NuZ1VEaFVGdkRQ?=
 =?utf-8?B?TzhDNjVZaGZxYkZ4MkxCNlo0dW10ZzF2MSs4N1JGS2c5NnZ3MjhVUXFTMFBn?=
 =?utf-8?B?RHpPbTA2cjcrNnJ4RUFtVnRwbU9hUy9ybUVOY2psa2d5U3dZbkl5eWxYNHps?=
 =?utf-8?B?VDA3aERVeTVWQy9BY3V4UmV2cEszT0pqdENHUURlSGEyd3lxNUtOeERkL1c5?=
 =?utf-8?B?K1prZUZzZ0pvQlB0ODc5YWJpZUM2ZkU2amNPUUh1N1Jld0VqbU1MS3o5K1Bp?=
 =?utf-8?B?SXR2Rk1EL1QvL3IwZlFsVjVYa3V1RE9OUzhkdDVUM003Ny9GRHg4RlhPRVVk?=
 =?utf-8?B?bW5vSHJ3RFVZR2g4Smp5RDJnbHpXUkEwOGNJb25TSEhZdFRudHc3VzhId2lS?=
 =?utf-8?B?M3VGdVE2dFJqRnhtSjZYdmlrY1hCNDhPOWI1dDFnLzk0WjlzUDFWL3pWMHhV?=
 =?utf-8?B?aXNqSUU1TzdKSE1BK3pidnNvU2RtS1FrOWxzT2JmZUJVcFE4Q29IMGRDd1JH?=
 =?utf-8?B?YlNpa2FMRTBkN1gvSWJCQkdJMWhaLzhjaGxYd1g4WUtBYnNCR2EyRDcyNXpx?=
 =?utf-8?B?anhVSjFEOFAvRm9WV2V3RVl3SFpTc1N6Wi9SbXpqVng5YWMxYjJqSkFBUHFO?=
 =?utf-8?B?aXBjRVdWUEFEVVZkYW1LeVJlaDVBS3BMZnZORk5ET3VxZldaZFVEVFN1VTVk?=
 =?utf-8?B?Wmk2YndYa0l1ZWljRHBGRS8wYzdrdFRtQzVoTHV6MVNtZnZIL1k1Wm9za0lW?=
 =?utf-8?B?eXhyOVgxV2o5YnZFaFlKL1dBNFdyOXlENTBxWVEvSm80SXRNSkZpVHVuSUtF?=
 =?utf-8?B?Ynd6bGtlaGM2UkhVZm9TbStoeTloU0ZRTHBOalh6WHdTYnFMajJrWFhkU1hD?=
 =?utf-8?B?cjEyMDYvd2M0ZDZWTTBNSW41cS9hT3lBVFZwWVpkczRuNDhtWG1oendTUXZl?=
 =?utf-8?B?MkVRWlB6K25STGJCU0REY1VlNmUrZ3dHcHlsZllZTHF1MVhvL0dIbzBpajVt?=
 =?utf-8?B?SDhDYytGZ1M3c1VldVkrdEE2dUdKem5TblNMdmdjY3RSS1pTa0JiTDh3TkpN?=
 =?utf-8?B?UVgyOUNjZEtUSHJxckZ5TENQVTlva0lBOXVoU0J6d1YyUmxDSDZMTE9mdzRo?=
 =?utf-8?B?eWpUNzh1c2VvUHhQeGx2OXhGai9DaG1hVkhtYzVVT1ZTcm8wR1BmUVdZdmVV?=
 =?utf-8?B?UXVPMUhwV0JaVE5hWkMvVkd0OVpGYjBLc2NGcGc5QmYybWh4SlEvVHlxMGQ5?=
 =?utf-8?B?T2Y5YjM2aHlKaGFRVmFlUnRZdWU5VXIzaU1JOUExWHYwNUk3RnExRUlUbVdm?=
 =?utf-8?B?ZmJJa2ZsR3JUaDVwNU9IcEZZWE1RQXFORDJESkpxN1VqRnFHNnhJQVFHeVVu?=
 =?utf-8?B?aXcraXlXckUxV2o2Z2pWejQ3TmxNQlpxQS9HTDRpZWlGR0dTK2VoMXpjUGFI?=
 =?utf-8?B?VENNczk1SytyMFB5WU52cU1vODdLNHFYTGJGeWRHOHJpTTJ2RkYybE92SW9E?=
 =?utf-8?B?VlNjOWtVZE8rR0dyYXRYVndnV1ZEbjJNdmxGRGNybmZJMnhJZHNVeGVENUVH?=
 =?utf-8?B?YkxZeVJnYldhd3NVM0c1amI4cjFYNWJheTRjQnRYdmJIMFk3N25pVzVOVWQ3?=
 =?utf-8?B?MEtsa1A1dVgyUHNwOGdEdy9RYXU4SS9kckkyWURLWVdRcmZFM29oVERmOG1t?=
 =?utf-8?B?d3p3Ukx4alR3SjdLd3lkK1VsNnZ4UlZwU1Q1ZHY2b21BZ1B0Tm5VOHgyYldj?=
 =?utf-8?B?dWY3T0VWQzNRRXQ0eC9EaVRBRnZIcFdSc1BWOWVCemlYcGRyQ0dPMWc4WjI0?=
 =?utf-8?B?RE5yRjRKaGIvMUJUcEdNZmpQTVlIUU9NMENzVm1pcW8waGxRYlFVRU5XTzVh?=
 =?utf-8?B?dHZES29JcVBhdnV4K1BpbnJsZUNDZExSUi9GbTlsNk9mOHhpbTNZSCszR3lr?=
 =?utf-8?B?cC9EY2F3MElGT3FUWGMzejUxdWN6Qk9HUFNQY2duT08vcDFnRUZzSzBLZ0tR?=
 =?utf-8?B?OWh6UCtDOVFKMnZFdExVam1reW9xekJXQnJjNG5CMEs4bXh0Vi9nSFlqVEY4?=
 =?utf-8?B?Z2wvMmtiNE1qc2IxMHZnUEZBY0JEQnQ0NkM3aW83RUdmT085NkFmY0k1S2t0?=
 =?utf-8?B?dWVNbCtBeUtLcW5XeFAzVmxsR25hc2VGWFBueGNqcFhNd0g1NTFHUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc406e8e-415d-415b-ae67-08de4f77c97c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 12:08:23.5427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZqMZ8dR8SMh3dRrNkUdb9qOHj/+9QWRmg71wpwcm+swqpKYvjQwtrwBn1UGAkbtKZ4r4W4VLic+96Ml0WUhtkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9480

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
Changes in v6:
Added R-b from Frank for patch 4
Following Mathieu's suggestions for patch 4
 - Renamed IMX_RPROC_FLAGS_SM_LMM_AVAIL to IMX_RPROC_FLAGS_SM_LMM_CTRL
 - Added comment in imx_rproc_sm_lmm_start and add comment for
   imx_rproc_sm_lmm_check, and update comment to use "M7"
 - Following the suggested code snippets, update imx_rproc_sm_lmm_prepare
   and imx_rproc_sm_lmm_check
 - With above done, separate the CPU API support into a separate patch,
   no other changes.

Changes in v5:
- Add R-b from Daniel for patch 4
- Patch 4, per Mathieu's comments:
  Move imx_rproc_ops_sm_lmm and imx_rproc_ops_sm_cpu to bottom of the file.
  Set IMX_RPROC_FLAGS_SM_LMM_AVAIL when scmi_imx_lmm_operation(shutdown)
  pass or m7 is started before Linux.
- Link to v4: https://lore.kernel.org/r/20251216-imx95-rproc-2025-12-15-v4-0-bf1064ea8daf@nxp.com

Changes in V4:
- Rebased to 6.19-rc1 to resolve conflicts.
- Address Frank's comment patch 4 regarding "if (ret != 0)" -> "if (ret)"
- Link to v3: https://lore.kernel.org/linux-remoteproc/20251122-imx95-rproc-2025-11-20-v3-0-9ae6ee619a78@nxp.com/#t

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
Peng Fan (6):
      dt-bindings: remoteproc: fsl,imx-rproc: Add support for i.MX95
      remoteproc: imx_rproc: Add runtime ops copy to support dynamic behavior
      remoteproc: imx_rproc: Introduce prepare ops for imx_rproc_dcfg
      remoteproc: imx_rproc: Add support for System Manager LMM API
      remoteproc: imx_rproc: Add support for System Manager CPU API
      remoteproc: imx_rproc: Add support for i.MX95

 .../bindings/remoteproc/fsl,imx-rproc.yaml         |   1 +
 drivers/remoteproc/Kconfig                         |   2 +
 drivers/remoteproc/imx_rproc.c                     | 249 +++++++++++++++++++--
 drivers/remoteproc/imx_rproc.h                     |   4 +
 4 files changed, 243 insertions(+), 13 deletions(-)
---
base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
change-id: 20260108-imx95-rproc-2026-1-8-04f759890742

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

