Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013005.outbound.protection.outlook.com [40.107.162.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B19302CDC;
	Wed, 17 Sep 2025 13:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758115200; cv=fail; b=Ha5GyS+9I9yWg4/6SErWl0qqUG+7vJRzG3QWtbnBlviRAirWTTNTtASocrAc4/rABmxIhiaECZfCr1Np5QQdt8RJjR8AE5dHa4HQdAKzP35o0ZEwpCoO5rfECBvRt9omj7+7Epc4UoGBRfZf93LapBr2J4OEtq+B9Yn3AOT2Q3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758115200; c=relaxed/simple;
	bh=+/j8JncNqpu74Wr3O9zlH+chJ0/pE8cr+NTap46Pfec=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JP0R7AHbxcYEsrZPhrBot0mnY6si+r0hNCf3u04hjxsuf2mFf418hUN1GrT040DpPe5RSiAqGQiUg9fM3abofww5O2Vl3cQ71KDagVHfkjsv6yAZ45LrsGudXK4sQlyBI+W/S9cmoaqeT8hwYsI9ApblF4QCu3mSIIkJQuoSQyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dIxXn0Kw; arc=fail smtp.client-ip=40.107.162.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dIxXn0Kw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YnkcBSA37biifpdaG6Fw2jDx3SnX8F9731G5jVPGsgqaeXjaGgV6nXbBg4YpugzC5lKtBq+LMFL3kPtjt01fhN5RRkghdGU8YNbRLZYihH1R2G+3YxSXqNrC8Xw5IEBHm0vcanQOnsQA+0jMNlBoJfdyMzAUDafeGYSe9mGu816uXq985IPA9A7FKmP+dFo1huk7LFBtVpdgX3V/CcbMDUNK5H7Bax/R16OMJ1riBujkISq4U+o9T2HICQcCquvbBRk24l16RqslxuZe1woYz1/GgFHKBEnIjUKQC1PrtfLg+zc7YT7UglvECmI64ABeACBJzcliB8aygF+oEZF48Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=psArSojbc7wN+nR4x68M0aGnL0UwIgNU3PmNssBv8eQ=;
 b=XaSNkMHsoBzSZk8ZGfQaZuB6cN6I/nkZFfcVhhHNFKA4J/VT6BMfh4EcbRWkWdVl+Az6STjradU30Llzf7U3KupkkJP3zZjMlQz3zPkFBd6BV7NaL8+moTcGbV4zC0xc2HWB7D2BX6xZcFCLD4rL4toHJ2dSlL0qZHWSS29pqO2KJ1gkMlpvytkKtATrlIs3GuaPzip8c1SeSgk6ffDzAY9z8GEEXeaxZ6VT/4YdiBJDd5xuwZWvKK99ABvO9l4Emm/BHVFF1L/WA+2JygmvuedNZERbY3es+F90O4nkXKp9wkj4MGg9AeYloUOiqD2QTVVa7CQjQnAuEbi5xhIS4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=psArSojbc7wN+nR4x68M0aGnL0UwIgNU3PmNssBv8eQ=;
 b=dIxXn0KwidWXVLoc30mHWfpazhmL5uyrtbSSNTQ7ZggZX9Pkf97b4Qdh+1bZFUL2Z6ra6SzpUKpVy3StB6b5oyG0LkPv/ffIMc+ITtPZz/M6GTZn09v0kvXldvAvxzec76Zjsx03g1ceErXYEj5bA0P2KwERDOGZkrPh5SjSxjr5ar8Hy8osgUM3SRbEcwQk7Yz/Sy/h8gkq0CWk+AHHfB1OGHBBtZU/Sn4sG+Mb/mhKw5wcVX+A3ukBR1w5Mk7ovMbrckhrA+0QoEj2a2k67ceOgBPKsVFcd/SkUMTZi8jl9qL94dKEo7TU1O0GeqaZ9UjRRZ0SKcR7j9Dxs2Xurw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9751.eurprd04.prod.outlook.com (2603:10a6:10:4ce::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.11; Wed, 17 Sep
 2025 13:19:55 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 13:19:55 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 17 Sep 2025 21:19:16 +0800
Subject: [PATCH 4/6] remoteproc: imx_rproc: Use devm_clk_get_enabled() and
 simplify cleanup
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-imx_rproc_c2-v1-4-00ce23dc9c6e@nxp.com>
References: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
In-Reply-To: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Hiago De Franco <hiago.franco@toradex.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758115170; l=3567;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=+/j8JncNqpu74Wr3O9zlH+chJ0/pE8cr+NTap46Pfec=;
 b=GYifSUDnkclxB/nkeeJLitzJRLm/57ASyRV52kPoZRAdQTLbgv3z6KSwgNXJ5p8rHEPqjidj+
 zwcJ1dFvIzOAqH40PjE3DDUu5cURALGGgBuzq/hbBeiVsk0Xt7Q72Sc
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG3P274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::28)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB9751:EE_
X-MS-Office365-Filtering-Correlation-Id: e1890f15-4e07-49a6-f292-08ddf5ece4af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|19092799006|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUh2REVHU1o5VWNkMUtzK3d6MnBqQ2NrMzB2QUwvYVorZFp6aFBpZFEwZC9i?=
 =?utf-8?B?ZXRwVEJHTnRuMGhmQjhGUjVmYmxaVEZiWXZabmgvUzBpRGc3bkQ5YTJHUjF6?=
 =?utf-8?B?dzRpcDY1Mlc3K0l3THp0UzV3SEZSWngzSDU1aUpNUFE5TGxZQ0lxcUJINmVj?=
 =?utf-8?B?a3NDdmI2cEE0TVRwSGZuQ2lEZTVXWUZKVGNHcFFNUUwwUUVUYkFrL09XUnBQ?=
 =?utf-8?B?Tkw4SDdBRFNlM3dxYkw4cXhuQllrN01HM3JyUHNGNkhyU2paRmxYR205c0xG?=
 =?utf-8?B?bThUUVZBWEVMQzVlR01iK3dYcC9tc0dCdkdwRXUvTkRLeVc4Yi9jYVdLZDJw?=
 =?utf-8?B?aS9tWW14ZSt4OGx2dTRpY3EzYitwYVZzR0xocDBlYW1pc3hnZXFwWkh0YXd5?=
 =?utf-8?B?TTlocHRqaE1DWUo2eVY4UE43bCtZcDNBQUVxd3gxOUdqMXZTT0VaVW1Vc2Ez?=
 =?utf-8?B?Z1VZbXN5MVFzVFhoRVp3bThEWFVqbUhGeGgyZ21uQndOVmtDV2E2WFBJQWNQ?=
 =?utf-8?B?Z0cxVXhhT0dVM3IyZDRmNEV6R3FpNG42RFhreUVzUDN0aWx1aTJsT3JOZG5k?=
 =?utf-8?B?eUdIMXJ3elJCeExlVm1VcGtoN05UdURwNmluSVh0cHlvOXM1MkdNN0lnQi9v?=
 =?utf-8?B?K1R5TkFGSG16Smo4MGxCVmp2YklEbG1YS044OHU3WmRiUisxaFM1c1AydC9N?=
 =?utf-8?B?UjNVQURoN1lNeUZ2OVZzMXMrREo3bWp0WWRQYmlROG9vQUllLzBiQVdra0Jw?=
 =?utf-8?B?YUUwVkEvU0VjQ1hEb0VnNmJpV0NYTWdoQkFZb2RHNHo3S2VDaUNlOGR2b0w3?=
 =?utf-8?B?K3l4Rm1KV2NrY2dOTTZGeitTazJDMHEvMHF4cXRpdnFWWmYra1Z2U3g1K3Nr?=
 =?utf-8?B?UmR4c0NKbytjQ29uNzNDdmF5M2N0S29LWVpCSGYzSE8zaHdmR0R1KzhUMy9m?=
 =?utf-8?B?Z1BrNm5nNlJLa1dybnZRaVN2UlhiU24rTkRzRlIrWDhZSkRzWjdRVGpkbmVy?=
 =?utf-8?B?dVp5TjUzeHJKbUhQclk0V3hqTlQwcFF1dFJiSkN4V3Z4K2d6SVZZejJNcGkw?=
 =?utf-8?B?UmdRMC9WYUlucy9PMFRnWGQvcTNrV1h5NzIxMGxVZjZhaVlWNHB0cVExQ1Q5?=
 =?utf-8?B?MzhDdDlMcnp2K2E3WnpHTG5kY0x3dXk4MzBJR2xXK2lhUHRnSHF2ME85eHFt?=
 =?utf-8?B?bXplekNnYlYrYVFDakhRRzlaUDBUSzdib0daRnV5QkRRWTZUZmJmbEp3alFn?=
 =?utf-8?B?clptcmdjNGJzbjBjRlRTaHFsN1Q2K0Qycm9hZ29ocWlJL2NpTWVGb2VFajNF?=
 =?utf-8?B?WjR1ODB3bHlNNzFyQnVxK0xGbGdyOGV3ZDdSREFxbVVTSGhibWh0ZjNMUEtz?=
 =?utf-8?B?QmU2aWxrUlJkUDI2VlJKVFdWNzdIQVdNeVVVUWlNL0xMamJHaGsrWUloenJU?=
 =?utf-8?B?Ynh2MVNxdmgrNldxZG5YSUNFelh5Qm95cEkrenRaeVdBTFlHWGs2cHB4WFds?=
 =?utf-8?B?UDdWNGtnRjFXMEN1ZFc4UGV1cjJ2NmtwaEsyeC8rc3M5NUowalVtQUZwWmVU?=
 =?utf-8?B?NnRKTTRrR3NtSG1ROE5pS2VLTEdXVDB3dktGS0VMN3RSSGhHYTVaTUwwRHkw?=
 =?utf-8?B?ckgvdTR4WjhoUEV2N1VrRVAyMit5eGpyUENLMGtFZHp1RWRaWVRlZDZ5Z0pC?=
 =?utf-8?B?cFhDbGlyRlMxRGk2cHg0QURHT1V6eTlXeDhXRGVzOS81VnpHNkdiUjlNUWR1?=
 =?utf-8?B?cmc2YlB6K0NKOU96cWhOWitObC83MGVvWTJwMTNGY2N1RjFid1dQVGlTam9V?=
 =?utf-8?B?MkFIQUdwczNXdVpTUUZETUxaYUdkVGhMUlNUcjZKVzBVTDNnMHBmVjJoajBS?=
 =?utf-8?B?cms0ZUIyWHVnZGw5S2IrTnptZmdLNVJsSHJjbUVmaHFLWTdzSEtKSWE0cHYr?=
 =?utf-8?B?YjJUdVFncU01TWVsc2NsZEpjeU0wNkZPQXQ1QUFURWlsYlpwWTJVWldONlBT?=
 =?utf-8?B?USthV092WmdRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(19092799006)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OU1peUpNWjJPNlVwKy9jWndyTDUxbXNBQ1l0SzhJSkFQSGFLYXQrMG1DaHQ4?=
 =?utf-8?B?cDhBa0NGZCtiKzUrcUhiU2xzc3ZCdWVyZWljYnhOU3V5N2l5ellJSUZmRGFK?=
 =?utf-8?B?MFVRdGJwOHJUQmdSZzltNmNrZDVaS2VVMklMTkViUTBTd0FHaml2M05QbXp5?=
 =?utf-8?B?N1dUa1JjRjg2Y3MzUHBxbXNUMmZqUjhBcW1BdFhjZG4yOGJQVFVzYndSQzVO?=
 =?utf-8?B?dDJFUmdHci9nUElCUnd0UzV5cWpPNjJSbXR0RnZ3ZGxZYmtDY2M2VkhmVlc0?=
 =?utf-8?B?Zi8xb004MVNzZkM1QmZLZXdHUER1dEhpWDc1am9UcE1mNzFYaU5uZmpVcWlC?=
 =?utf-8?B?MENoN2cwTnhOYTBWWWdEcE40eHlnUXZWZjlzaC9zNEgzeVMzTWlCNmo0cXdw?=
 =?utf-8?B?bEFpeld5dERwM1VSbm5haGNDdVdFODJ0MEs2WjMrNXl2R0haNmc0dE5DM29I?=
 =?utf-8?B?Nkhpbk8yNUR4Vm5xdXY2Z1B3aE1KY3BrSDdYUnc5ZGZSQThRNGlrbjZ6dTl0?=
 =?utf-8?B?YXY3Wkx1c3k2Y0RlVU9FL3prRkNxZ1oySWYwQlZQRk5qOVZzMWtHaVJPZnZC?=
 =?utf-8?B?NTRyVnFWYk5MZmcyeDJHOUdwV254SWhvQU1oOUZLTUlzQW9MUmdoTEZlS0Zu?=
 =?utf-8?B?cEdESy9HbTlBTFRpeFlWaE91SVpSRms0cDNldzB2NnhCVjJxdUp2SEFBSVpk?=
 =?utf-8?B?eFY4bkRuMFNNcVhPRHBERHVFd3BJcm5PMnZxQUhaNjd3aTRQN1pDWHhicmNL?=
 =?utf-8?B?WlJ6dTBXT3BJMGVaTkgwd2l2dGxmaWFvbG1XSGtmUEJiUkQwV1N5WStGeDlm?=
 =?utf-8?B?Yzl4bGhpem1CWkRienFvWWgzcEhrU0piT1YwL1doYlUzb0svZ3hId2h0R0M0?=
 =?utf-8?B?bEw1d3p6eXV1ZXg0bXRIa1BNRnI3WlpIMko4UngwNGlDWWxKRDZkM0tzbGRH?=
 =?utf-8?B?VG12WTJhVEZ4MUVuVGpTL2xTMDdxQitwbHVXVlpoeWhoTVRUZnRhNVBqNzdH?=
 =?utf-8?B?TXBEWGk5Y1pwekc0YjlkYm5zNFB4ZGxPRElQRkpGSm0wcmlDcU1WQzUzaU9E?=
 =?utf-8?B?ZUNubnVkZVNFZitCS2t2OFpLZitOVEovK1FVV24yV1N5OFZwRXRFdzFIS1l0?=
 =?utf-8?B?Ulc5T3F1MGFrVzNIemxkU2pveGhtQnhtbzRoN2tYSVBDYU9xcnVQbm9nU3lM?=
 =?utf-8?B?R1lGWFhVQ1c0K3duV0x4dXVxbS9zazJTZXRBT1o5cHZLSHdka0NCSUpYellG?=
 =?utf-8?B?YzZsUVZwdWRiOTZQQ0duNjJNdjJEZER3R25XSUtCN2FaU1VuKy9qWUNKSkc4?=
 =?utf-8?B?ai8weGxFQU40WkpzYk55MHNPODRxaUhFYjBJelBnS0dmeW1YRGhaVitjL1pq?=
 =?utf-8?B?STR4ZHN5cFRsVURxT2FVc2tKS2pFSWJibFhjSWgybnJRWkZtNWFZajhFWi9B?=
 =?utf-8?B?dW9TV05MZFhoR1JRajBXTENZTitBQjUzaVRsVE91dnk2UWIwMi8vWTJ1UGRN?=
 =?utf-8?B?NU9vZTlaMGFxaERyczBBbkxtdXQvZFMwWEQxSEpycmd5SXk1TldNU3RyMmo4?=
 =?utf-8?B?QytkSjc2T3Z0SGdZYzY4S0dLcjZPVHN4alc3eldCTTN4Q2xkZmFqenpUdHND?=
 =?utf-8?B?VGtmWkVUbHdTL2ZSRnkyOTZmR0xUSnVqL3RPQjAxbHF3b3BnbFRHd1dXb0xO?=
 =?utf-8?B?ZjRzSXhaRjN1b0VsaWJ4M0VxczM4MGR2YTNOeWx2UlhPZllYNE5Rd2xJR1VO?=
 =?utf-8?B?V0Q2THhISmRMb0JCTUZudE9qNE9LUmVON1BJTFZQRjh1My81VitiUmw5eDJq?=
 =?utf-8?B?Z1IveFlVY0VFNTZzbnl2ZmZoSlU1WkdvbzFHTW5CdW5VdE5Jc2pKb1REKzZ3?=
 =?utf-8?B?MDlyVkt6b0ZGUnRxcVVrQ25zVUNibncwTlRjb1Z2VUpxRStZMU94YzcxNlUy?=
 =?utf-8?B?VnNCbTBwZlAyNFdlLy9WcXQ1Z1Y0RkdzSDRYRm90RWQ3bGpZaysvQm1Yb3R3?=
 =?utf-8?B?OE5MNG1JMk5WR2tVNnpkYmxjejhTY2E0ZWwrRkpiK0hEcnFiREdndm15VzU4?=
 =?utf-8?B?NXZTVDFkUWVBYU5Vbkl0U0ZEaE9FQ3drWDN4cG9rUGZ6RWgvSVJqb0kxMzA4?=
 =?utf-8?Q?OByeFSC3kVI5byqLYbRyzhFUG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1890f15-4e07-49a6-f292-08ddf5ece4af
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 13:19:55.6052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5SwsxAg+v6uvoAMC1NQMhoLIqevs7TDZ62sz5FLSIVGfg14cx/85vEJb/J/S0yrLN1J1wbm39DRodJEvNO0uzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9751

Replace separate calls to devm_clk_get() and clk_prepare_enable() with
devm_clk_get_enabled(), which combines clock acquisition and enabling
into a single managed step. Simplify the probe logic and remove the need
for manual clock disable in error and remove paths.

Also, update error handling to eliminate redundant cleanup steps and use
return-based error propagation where appropriate. Improve code clarity and
reduce the chance of resource leaks or incorrect ordering in cleanup paths.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index e30b61ee39dacc88f9e938f8c6ffe61fef63dbda..c6cfb308ddb376f370fd4492f8a84f734602bac8 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1006,26 +1006,19 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
 {
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
-	int ret;
 
 	/* Remote core is not under control of Linux or it is managed by SCU API */
 	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
 		return 0;
 
-	priv->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "Failed to get clock\n");
-		return PTR_ERR(priv->clk);
-	}
-
 	/*
 	 * clk for M4 block including memory. Should be
 	 * enabled before .start for FW transfer.
 	 */
-	ret = clk_prepare_enable(priv->clk);
-	if (ret) {
+	priv->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(priv->clk)) {
 		dev_err(dev, "Failed to enable clock\n");
-		return ret;
+		return PTR_ERR(priv->clk);
 	}
 
 	return 0;
@@ -1134,7 +1127,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 						    imx_rproc_sys_off_handler, rproc);
 		if (ret) {
 			dev_err(dev, "register power off handler failure\n");
-			goto err_put_clk;
+			goto err_put_scu;
 		}
 
 		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART_PREPARE,
@@ -1142,7 +1135,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 						    imx_rproc_sys_off_handler, rproc);
 		if (ret) {
 			dev_err(dev, "register restart handler failure\n");
-			goto err_put_clk;
+			goto err_put_scu;
 		}
 	}
 
@@ -1150,32 +1143,30 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		ret = devm_pm_runtime_enable(dev);
 		if (ret) {
 			dev_err(dev, "Failed to enable runtime PM, %d\n", ret);
-			goto err_put_clk;
+			goto err_put_scu;
 		}
 
 		ret = pm_runtime_resume_and_get(dev);
 		if (ret) {
 			dev_err(dev, "pm_runtime get failed: %d\n", ret);
-			goto err_put_clk;
+			goto err_put_scu;
 		}
 
 		ret = devm_add_action_or_reset(dev, imx_rproc_pm_runtime_put, dev);
 		if (ret) {
 			dev_err(dev, "Failed to add devm disable pm action: %d\n", ret);
-			goto err_put_clk;
+			goto err_put_scu;
 		}
 	}
 
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");
-		goto err_put_clk;
+		goto err_put_scu;
 	}
 
 	return 0;
 
-err_put_clk:
-	clk_disable_unprepare(priv->clk);
 err_put_scu:
 	imx_rproc_put_scu(rproc);
 
@@ -1187,7 +1178,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
 	struct rproc *rproc = platform_get_drvdata(pdev);
 	struct imx_rproc *priv = rproc->priv;
 
-	clk_disable_unprepare(priv->clk);
 	rproc_del(rproc);
 	imx_rproc_put_scu(rproc);
 }

-- 
2.37.1

