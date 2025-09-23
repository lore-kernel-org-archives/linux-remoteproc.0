Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013048.outbound.protection.outlook.com [52.101.83.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4537230E855;
	Tue, 23 Sep 2025 05:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758604630; cv=fail; b=ftz/GvnE+Gg9m1VmRqUfTZvcesbIHtTMQpIAxGK08gLmTXUpWm+Z63jF93deErhw25e91gTSqHXw1KUc8bgjP6N1Nv1+l4bFtaqAsw2V0K3EfpM4JZR6IUTA5qAdeIb7SDjJbj8fYuz1So6jB1OQafWsPD9h46hkqvEohe1ld+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758604630; c=relaxed/simple;
	bh=eHBGbbwMKXW6Tt64gF4m2/5IPbR4bc2ekN+6KeHXBO8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iJTbLqcbQ0nuGlPGybqQrXlSsZ9BUulDrKeloqvDGR/6HTf7PLM27lMdy11E6BcvD2H5U6MMdYqb4n7FMx/kLqk7EdrQKaAeB9sXf/1dzy0uUkGvMaEj/kDPWCYhpA0BNNpCpwcQ4BkcjBcR2QKteMnYTvlj5UJ+GwUXMnwq6dE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kUAeKqCs; arc=fail smtp.client-ip=52.101.83.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kUAeKqCs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F6+oa1/Tlbh4gwROJytRc6EjIcfSDP8nqjmtx2lY0/OS+JEXO41Vv9vFl+9qLSTbR3bCxJi9j437mog2bSc4zBtgO5e9pZ6k3WR9Nzq+5cLrUBnTdHmkRO99fPNzG05/A76bF383Tn372aoVdhstQ6npk1vpVTYPDc5ySy30bk+Sx1mviaM1qKEQvhurocCkDSN/iqY4syABXKKSnsTSt5LIGIIFY+lA1fNCJLmeDm3890tg+boOUkiTCPdrqdfkNQHeqFI9auny83MrK64HX+uLUBq0auFZQZ2MO2Ngty1Dd4NAdO+hCjigphaPjnG30fUR/Jk74JU1t4suH5ea8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkxd9y2vx5fluWOPImTUFvS6ZwXY79JcAC4N9a+3Q2A=;
 b=JwrrOmhmr4nh0uH9P5IZ7xz0nSAapSUjMe3nM66oAJY2GDHxl3JcrxIpHIDOk4A8FI+VI9IBhE/YXTiD9xrgP3i8Jdjrf2nP3wOsqgplB7zjhTa+bJSThY8c4uRd1g64hNYeRmR08wfnIaE42WPOQRrXDGHylt1JOR2mrmGQtfc4QH2PyQ9d7YTm7H8mrpNMnHCki0TiRaLyB2IT5RFGChIchbq/YL2NR/lrcrRg3VbSpKlx9VaWhbNGXhcesfhLRPLCiyDFBEpX5ySNmefht6tBKwvo304fd19oz+G7BZhtvKsaE11FykfDcxLgVkJmteBCHxlegJuCSjCmOy3E7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkxd9y2vx5fluWOPImTUFvS6ZwXY79JcAC4N9a+3Q2A=;
 b=kUAeKqCsHU0WT0DnrsKRYOtwCJ8kmAAXZVpI0HZ/wwQuPdGOXMZI8ND+24WsBNGaIWRiN0ZWvqxlUZgNqP15SmX2kwOXHRQybOAd+24PNTBcfdH1KnS/n+yaRP1SX+xCD3W55QA15LfP++lnG39Z44hcO6Y43LxO1kVqMOv+aCLtVVG9VO9SmL4eP+4zo0yQvsRF+rptSHueycVFGVVP02Rdi8nQGt06cej4FGPgzanaJd+dN6jsmCTaffkwdLk4rHhq+pnBoNo0sG6pi8o6I7xiFMIK1BQBSrnY743YJ+ZUuafLWw5i9soD0wM3cVnOXWcA+ETr8QOqy0MYjAASAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS4PR04MB9340.eurprd04.prod.outlook.com (2603:10a6:20b:4e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 05:17:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 05:17:04 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 23 Sep 2025 13:16:34 +0800
Subject: [PATCH v2 2/6] remoteproc: imx_rproc: Use
 devm_add_action_or_reset() for workqueue cleanup
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-imx_rproc_c2-v2-2-d31c437507e5@nxp.com>
References: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com>
In-Reply-To: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Hiago De Franco <hiago.franco@toradex.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758604605; l=2185;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=eHBGbbwMKXW6Tt64gF4m2/5IPbR4bc2ekN+6KeHXBO8=;
 b=DdSPYKQziWvN9QQI11VHPEYPblg/M2nUXUMK+JSZ9n8w8ks7JcJEQ/3wbWo8sAVnQN/Vsn4mF
 9MOf2E1TdFwALs3hAV9b53VGASKaf8hDA2tRA1q3u1efRujK4XbDWqc
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS4PR04MB9340:EE_
X-MS-Office365-Filtering-Correlation-Id: f53cdd89-4906-48f0-b6ae-08ddfa606f35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUFxNWVBcWx1RlpmSG1adDNreXJZYktrK2RUT3lRZytKTEM4RUw0RG9iemxR?=
 =?utf-8?B?dklaUEN2UDJvcXZWN2ROVTZFQnhvU2JORjg0aUg0UGR2RXkwQWR2bUMwU1Vk?=
 =?utf-8?B?TXdpQ3BlWW9JYXIwVlQwTFJKQktXajZZMERSN0Q4TjJkYmNOSCtIb3YzVjYy?=
 =?utf-8?B?eWMrbUxzYjMvWFNmb3VhSS9oeDRFTE41MnBSc2JEM2JqYWlSL29KUnE0RHRB?=
 =?utf-8?B?LzBtV0tCdkFRU1RnM3VVT1NvNlQ4OHo5SDdJbE9mTUdtNkdhQjRSeWZKUU54?=
 =?utf-8?B?VXMyeERGOFJheGI3ZFcyMkc4OWNMUmFxc0RhUTNzR081a2xYZU1GOWh2Qmw0?=
 =?utf-8?B?K3hKTnlWQWlRYU1jL0N3bTAvSUdRYnIva2liWDVrUWI4bjN6Y3lialJNOW8r?=
 =?utf-8?B?SjROTXpTbHZ1VFhidDNJN0QxR01sSlJCbjRZbTZJbGg5eGFkTXlXYzhuVm1B?=
 =?utf-8?B?Q2xkZXczQmswczBWSWwrZXNRRGw1K04rKzRBeksrUy9sb1NiQlZvTy9NRlVs?=
 =?utf-8?B?aGE4dzgzMDRzRjI3YTlEUDJJSTAzdUs5ZUNrdFdFallYbyttSkpzN05xMW9p?=
 =?utf-8?B?S3BSODFBVDJtSWIvWDRjQkxsTzNRS09jelBhSXh1RFN1ekRkTWl4d0xBWEJa?=
 =?utf-8?B?YXFUSCtDeldwSHNoS3JTSGN1SG9lSTFRVUJ4RjN3YlRDeFdLY3IzT1dtQlNL?=
 =?utf-8?B?NUlNOHFGU0M3NTZRbDA3TDNtRkhvT2JSdkdJUTJhcG1VN2VnWGJ4M01IY25N?=
 =?utf-8?B?UzFNaU9mVTBNczlxczV0aXJMSkVWeWlzV1B5djNxUkxwamJNY1RDS2J0Q0V5?=
 =?utf-8?B?ckxvYnlncGMyME80RUhhdWh6SG94dzM1VUNyakoxaTVjTjlOWTFTN1B6dDNs?=
 =?utf-8?B?VkYwdSs1VWxJMFQxTWlEM054YjZlOVZxVklGWUZNMkl3RW8wMVYwZ3Focm53?=
 =?utf-8?B?MStqd0pmOW9QQWNxaDFOV2RlSTVzUU5HbG02Zi9LbktwSDJkdmthYk4zOTJt?=
 =?utf-8?B?SGk1MFF6ZzZTZXlHQ0pmZ0d0Nks1OVo5c0hUM0dtenVMZDYzbXkraGNIQy9D?=
 =?utf-8?B?WDdXSWZCMTV4UWRDdWp2V1FaLzJOSldTRnVRTWRvOVBYZGJlVytjb09FUnY2?=
 =?utf-8?B?SStxOXJkS21acHloUjVnZXd0dCs3cVBJWDF5bUJsVUU1NzZucHJwNWlqVlFs?=
 =?utf-8?B?R0ZLRmt0REFhQWgrMDRNYTNnWU9Fa0JKQi80aXdvVHRHcktVbmpiUERrMjNB?=
 =?utf-8?B?bHJUWHBjT1dyeWh2aDNGOGFPNVF5MlFsbHAvckdpRmlrT0RHZmk1RDhKTmZq?=
 =?utf-8?B?UTNTNUNuOEpMdnc4UG5oR01lM3lubFBzRHJhRVM1dERwbXloOUloMEtoRVpl?=
 =?utf-8?B?bmo0YktSeHR0OTBZUG1hYjhYVzBSbVV6Y2REU1hHOFRFZUtIOTFNTXJEbkli?=
 =?utf-8?B?ZEJDK2V2OE1odmlNb3k4dkkxRlhaT3Y5MDlKRWtuaG1Ickp5TXl1NEVYckdV?=
 =?utf-8?B?dThlbGVnZkM0aXVNemlmOVIzQU9CV0hhQzBNekxsL25YVTk4b3lqd1JFa2xn?=
 =?utf-8?B?bnhybjlSamN3Y2tCWTlzc3d2SmsvcHVKanFQMldCNURxdDF0U3o1SGtsOWRv?=
 =?utf-8?B?UWhTR1lSbG9WTjZvbXB1UE80bVVYSWx1MytIYzk5cGRBUTFEa3ltRG0zOE0z?=
 =?utf-8?B?SEpkczViYWlJVTJNN29qc1NTMWFPNUVMcVJjbGZUQWxnS2ljVWIrNkg3UlJq?=
 =?utf-8?B?TDJadU9vZ3lydXRxYWNqZmdpaE1xNHpqdUxxUlpabldNTjFmOUxVdW1iNnY1?=
 =?utf-8?B?cjVxeVk2V0ZBSW1HbXRucmkzWWV1RHRVUXdhdTQybVFsa01lSVNnU3BHZHMx?=
 =?utf-8?B?ckZVby9Wc2ZMMDUzVWc5dkNHRXF3L0dONEFQbWRrSk1zN1cvMTdYUnkxaU8v?=
 =?utf-8?B?c1hWWUs3T3BKYTFqSUYvbytqMlUycjJKcm9ocmFCU211STZPRjlLU2ZWS0p1?=
 =?utf-8?B?a1VDVHdNQ0tnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDR3WC9PanJpTVZPQ2ZCNEx5RWNFMVhyT0ZqNkEzQXlZbk13eXR3K3pGMW9v?=
 =?utf-8?B?RnpGQ2hsQjJFbWVKclNBdjdyUmJFblZhUko0TUhxbHZPeXd4aVhFcXRSdzR5?=
 =?utf-8?B?NEt2TlBUb1FaUllWWjNWNUpHR25yby9xeE93aDkwVHkwWTE2WWdMaVBNUzY4?=
 =?utf-8?B?M3M1a21uVWd3TXp1TzRFenNyQXMxTlpZRGZZL2pRMWdLZXBpZy8wK3JReHRq?=
 =?utf-8?B?VUkzbXc1VVZ2MkVFRTJHMWY1UU52VitlWjJXOGQvRUdOaVdpd0o1UUVyK3Mz?=
 =?utf-8?B?bmxnZjlaWllSaTRZd3Nsb1lRdU8ycHFrajRlNWg0M3Q4T3NSZTZZSkJoT0Vx?=
 =?utf-8?B?VzN5N1FrMlJ5dEcxajJhbGk1Zk5iRUU4SFJ4MkFrdVM0anpPbTZweGQ4S0dU?=
 =?utf-8?B?UzRmODQxZlJtRjJuOW9YWkdsUlp4WHFjWkoxSzllWW9YaFFVTDdpdG1vcElh?=
 =?utf-8?B?MmRDanRwcDFkTUNmRExwZmJNQW9qd2d0MDVLYnJMWWFmRU1rZTZvaDJiQTg5?=
 =?utf-8?B?cUtuanF1REFFVHJGSUdNeGR6YUxiTWJKSU10eFZXVi9xdUU4ZVJCK09XeXBF?=
 =?utf-8?B?ajd6V1VNYVp3TjY2bTBjUFo1RlQyMmZkdGZSZzh2d0FvcEE0TG9mZ0E3RDFP?=
 =?utf-8?B?ZW5iQ0hWTG1JWTFGYU01b294VmVwRmxwTyszb1ViT2hBV2pvWGFaeCt4UTFT?=
 =?utf-8?B?WTh6cEJ5dklObTFVcGV6aFFZNFVrbjZ6TlhrUTRLM1kyZVNIQlhFRnJlMys2?=
 =?utf-8?B?bkxhWXdQeW1TN1ZPVzNMeURmWWhxTEsvcUhGZFdLSndvclhMZFFYVUdNSE93?=
 =?utf-8?B?L21LUk5OMmVNOThWKzBrTEFXRHhtQnZicldTZ0VsaVdzaFdOWU1CcmFINElp?=
 =?utf-8?B?RVRyUC9JaVpHQW96KytydVhyRkhIN3NpREZtaTN4aTNlUHp5cXk5cmNYUG5q?=
 =?utf-8?B?WHYydzJ3aWxRdCtJRXBQYm1HTkFOZk92aFlIbWhCTExZK2VZQ05FaU1vc2pZ?=
 =?utf-8?B?UVQ3b05Vd2NoalI3eHBlZENvd0NQN3czdUNTd1V2YlFGNkJRZnRIa21IYUJP?=
 =?utf-8?B?MzB6NTVOcm1XRllscGQ0Z0ZQQ1F5TFVUY1A3MTBMb2oyZmhZcDVSZjRSenNK?=
 =?utf-8?B?VWN5UXRQakpzR1VoY1IwdVlOeVQ0OHNlOHVsZ01tWkl0eEozRTFpNXlzdXhK?=
 =?utf-8?B?RHdYd2FNSzNzMSsyTUd4N0tZY2x3eFZTcWlwdHFxQ0Z2dnZPYUpaSVE3YXVx?=
 =?utf-8?B?Y1FQVWJJcVAxaEZUQlhISG5NUWFIOFowNEQya216RmYvMEVxNy9UM3hGaXlE?=
 =?utf-8?B?ZS9MY3pvS3pMcGJuL25qUmk1alZrUTMrRkQvLyt3MGtZcEF1ZDNIZEFZOGta?=
 =?utf-8?B?cTZCbWI1UC9vZTZzcU9KWElhdW1xSTBpWm1sUGl1NGVSUVU5YjEwU2pFZWht?=
 =?utf-8?B?VDBqNDhRd1B6UEZ1UXhVYVZVZ083UURwM21WR1prVnJGMXU2Z1pBZ3RvRVhN?=
 =?utf-8?B?U3o3aFp0QlhRZTFqMWd2YWhpZXZGQmVNcFNheGJDc3lUMmozK2tEOUIxR0o1?=
 =?utf-8?B?YXZmZkUvcWZTVjkxVGwyUjlNUE9KbDJQcEFyTkowNGpMcEFlVmhHdDFPOXo3?=
 =?utf-8?B?SjZCU3ByWDJPbFZ6dndSaUZRclg4MlNVUzY0ZFpJTmF6ZkZoOVBIeFlEZ3JR?=
 =?utf-8?B?bWgzRW5HQnNDZHFkb0NIaHkyMkt0SVRMU1JvV0ZCYU85TzhBbHp0UDdHWi9o?=
 =?utf-8?B?NE1QZ01zU2NHbDBTSjBmM2I5RG4wbUN1amovYmdQemYzdTVJYjZUSEIwRVJu?=
 =?utf-8?B?RExHaTdkYml5RDgvUnE2S3BLMExQZ1lDV2NvY3JUejN0UjRMWTZUTlhaMFFL?=
 =?utf-8?B?ZnNueFMxTnhEQyt6MHFZZUdkV3NwZk10Y2dpK0s0VWpXaFNidWpkc29Ka0Jj?=
 =?utf-8?B?Y1VMRlNzOTJybW8xZjlGV2xlUVlENWI5RXVLYXJ6TVkrVENUVjB6SlRmWVh1?=
 =?utf-8?B?eFFHbWNpN0N1QUkrTWtPSUpuUTFlSUI0V3hWL0xycEpBMWw2YkJ5eUJNK3Bx?=
 =?utf-8?B?MFJtVFpSZjV4YXJUMW9yR1BjdURZNFBwL3BOVVFuNkpRZWtBUjlJRXVqMTV6?=
 =?utf-8?Q?qYo9YVFQmoYVigR8C4G1bBOvs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f53cdd89-4906-48f0-b6ae-08ddfa606f35
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 05:17:04.7057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2fMmhTe7huJqdbxEV7ZmHxXZdmSgIBMVxg+CBUl9ccO1CTopAAJRcTNYHHDX1qKDfTykh6g7xCkQdkomFzwVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9340

Replace manual destroy_workqueue() calls in error and remove paths with a
devm_add_action_or_reset() helper. Ensure the workqueue is properly
cleaned up with the device lifecycle, and simplify error handling in probe
by removing now-unnecessary labels and cleanup steps.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 12305f36552fb5265b0953a099ea0d561880e3ff..cc776f5d75f1f614943c05250877f17537837068 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1046,6 +1046,13 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
+static void imx_rproc_destroy_workqueue(void *data)
+{
+	struct workqueue_struct *workqueue = data;
+
+	destroy_workqueue(workqueue);
+}
+
 static void imx_rproc_pm_runtime_put(void *data)
 {
 	struct device *dev = data;
@@ -1084,11 +1091,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	ret = devm_add_action_or_reset(dev, imx_rproc_destroy_workqueue, priv->workqueue);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add devm destroy workqueue action\n");
+
 	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
 
 	ret = imx_rproc_xtr_mbox_init(rproc, true);
 	if (ret)
-		goto err_put_wkq;
+		return ret;
 
 	ret = imx_rproc_addr_init(priv, pdev);
 	if (ret) {
@@ -1165,8 +1176,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	imx_rproc_put_scu(rproc);
 err_put_mbox:
 	imx_rproc_free_mbox(rproc);
-err_put_wkq:
-	destroy_workqueue(priv->workqueue);
 
 	return ret;
 }
@@ -1180,7 +1189,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
 	rproc_del(rproc);
 	imx_rproc_put_scu(rproc);
 	imx_rproc_free_mbox(rproc);
-	destroy_workqueue(priv->workqueue);
 }
 
 static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {

-- 
2.37.1

