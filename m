Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011058.outbound.protection.outlook.com [40.107.130.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69C52FE06E;
	Wed, 19 Nov 2025 04:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763526156; cv=fail; b=tFMb2jky/nq4fIUxvYO5yYWQseHw9uMFFJ2DfKw8Bm9aNfgCPGC1FEWsHFZCf4JrPEeZnxpz6vNtbFVY0onm/QhRwjHOLvtzgYVyw3xDNm+GBffBDAcv/Jl+YT5+yYRQJk2ZpxQynKjuzvlav60l+evv+DY0/iFFNMGFniz6FSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763526156; c=relaxed/simple;
	bh=0fVi+DXNDnvp75NR5ct9+nbWfZyNiBunVDNskhHjUH4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=C8O5+HSmcZeN5QClq7IYwuL4+kD5tnxNTtcKZqS4trXrDcWobLkAZXz7SCS8xuVDc8UVTQfqSQ6znFYFnCpUxRFsGlTsNz1UxrZLL8e+pK2rW8Dp5qKvMHiZRuu/J8DmmS3lXwoah25AFuDORPPd2YucVJXvce7VT1QlWUVnltw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FI3pZT54; arc=fail smtp.client-ip=40.107.130.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FI3pZT54"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUVqMwvjp1aHRXjTm6uGgOpYpOx9aV80dBPoUhgYgZ7OUmfQ4HLHtXeYBnFco+NO1FXcXUx5JeK0yklhSmQsZtcwxVY4LaZOIKbju/2UK2LVbek10ANcJpEJCD1XQvI87MivincyDcfMiyqe1ABWdjH5qO4mHu0HE4HJ+ymYSihZ6e8ZHH+iKJXQpBH0OORj07KL6JuE4aixoi2tPbqYW4n5AseSTIZb2gUb7P49C33CSWluJiTfAXV5ag9Ec/k/Pc9hjUoI6RBBou1U2g5Kytk9WnCwFaPJWqh/GLYhcmr/FpRnX3T9LhWdfpdjPUA8jgC4L5SpJL8P5dhWXjan+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Y7SYcudo63ECcgyg+VBfGXG8L6Yowci40fwsz//UYs=;
 b=rGuJwIzWawgd5CemwcTlz8Vmc/HBEz1sjvry/bbYhFRp/wCwbcgU7GKeBVg4pS5WWsR1UDeTdY0yPsXxGQmQ6bRdyf0YbRkxaOLQa7nrRTajjymhz4GfOp+ESyBwtCyq36yUPf5IYylIyHnJBcT5ZQlJAGXTE0b/mMO5yTI2h4DRK2ZiqAkwjGN4hXGCebZVoo4zj6vC/E087SCgs4GxhXmUjsM8M5XK84wCOyM6bRM9qtaqzdWml14ltxQGy+1vpwhHV7l7hNXvQebQps5Zfeoc5Vw+5dY/6wrXggmbrrsvTHnq9QKtGYUwJhuATkE2mtcM64zYINf2c/QkGIi5IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Y7SYcudo63ECcgyg+VBfGXG8L6Yowci40fwsz//UYs=;
 b=FI3pZT54OlXAsYhuGwTxHicDreijdwZ6KgBxStwQ3lWMRGEkGPBJq+V570Mojnaj3P8lXyu15nJWsgcUkCooF+x9YoeYkw+DCh0wHXC9ZYSrts6hqxCbgmL4KiLZju+zd0om274aV4epIeQYpKokd0NH43dJAy2lQfxMvzqECLc64EsdB5+LlckfvApeMcn215/OIErltx02w7n8V9R4mf4x5h4TR4M1mnc9gij5GUXBgxce3RVxkMAi9GW7g8Q2Cgt9Cs0p/MuL6ZRBec74uv6k31DLb0RdM/4wvLfA1yXrCIkeY6MSR+6akARQKLHhhIQqy6DFss0tO2/hlp2UFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9319.eurprd04.prod.outlook.com (2603:10a6:102:2a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 04:22:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9320.013; Wed, 19 Nov 2025
 04:22:30 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 19 Nov 2025 12:21:51 +0800
Subject: [PATCH v4 06/12] remoteproc: imx_dsp_rproc: Use
 start/stop/detect_mode ops from imx_rproc_dcfg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-imx-dsp-2025-11-19-v4-6-adafd342d07b@nxp.com>
References: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>
In-Reply-To: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB9319:EE_
X-MS-Office365-Filtering-Correlation-Id: a7f7cd7d-74b0-4c4e-4868-08de27234121
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODlTQlhjK2RSRWRwcmhnQll5NlBBN093RVJsVUVDTHlmQ0E3V3Vob0NuN21m?=
 =?utf-8?B?ZlR6ZStSdFRMaDVJVjgya1JHOGpuc0ljcGo0cXVXVjBaSDhvWDBVUWpKM21w?=
 =?utf-8?B?NFB1eXFOM2hkWFpJQk5FOHF1SFVaWFRtbFhPNUZqS3FtNVFwd2tISDRwZEx0?=
 =?utf-8?B?OGY5bk9hQ0hPRVBVTXU0NDZWakttMFppRWNKWks4Y2dRY3FNb01jWWpvSlZk?=
 =?utf-8?B?TnBFVEVUZEpkanhxRTVIUXV6ZzdlY0c2V1VUZ25tZm1Ma0wyY291ZXBsK1NL?=
 =?utf-8?B?bHRSZWE4RC8veFBJUGNrUjNXL0NZSkRDVHZ5U2krOHNhMDZzK2RLREM3ekJi?=
 =?utf-8?B?cEhrSWx2VmNaeTNkbHpYdnk3SVdLaVZkR0pYd2RhTTNWYjBRUEErK0V3YUxD?=
 =?utf-8?B?NW5zZnRKNmlSN3BvYm1PdGVUMWxBRlVDVUloRzB3UkhSWFNkaDZ1U0srQ01R?=
 =?utf-8?B?SEIvYzkwcERJSllhWDRxZW5GY2taSVVVdFdZUDJZVU5UQlhTZ2R5bWYxcEU2?=
 =?utf-8?B?dUZYSklOOFlFMVVwKzlJcFFpVXRDdE9aL0xmOGhBbUVHRjB5c3E3V2t0QXpE?=
 =?utf-8?B?Q2VkWTFscGlQNk9VWDNkVTdKcnpLN1Z6VzJhODRpbjZad1dmUnJJQjZGdjR3?=
 =?utf-8?B?RkFPS0N0Q2tQMDM3LzNhRnZKNzZIaWN5bXRld3pnUVYrZXBDVDdnYmpoS1o1?=
 =?utf-8?B?b2ZKWWE0SlQwVjJlbERQcldXMjJMZDl1WmgwNkhIUzZXcS9yNVlWN1hWWGNZ?=
 =?utf-8?B?WnFJSkx2cmF4Zk4wekFiMzc0d2UzN1lnTEllNVpKTzRNdWZ1TEV5UzJPb0di?=
 =?utf-8?B?Ylc4K1RQU2U4a0IvUWhtaFRLVTBvNlBXYVAvNkxlSzJiWUJzdFR5THJ5TVFa?=
 =?utf-8?B?cUVzek0xamk3RFZTYms0UUtHSHJFbmpDemU0TGVkcE44eTBKQm5NbDhCNDN1?=
 =?utf-8?B?V21HRU1UUjR4U2F5VWZxOThSNlhsWjVVa0E0S0lxTnhrK3BIUUpUUDRuTWNJ?=
 =?utf-8?B?UHpMUHpIdlF5SWFmV0p1MTNLdGFLVTFNRmNRNDlPOVl2ekpsdW8zZVUvaWU5?=
 =?utf-8?B?U3Z1OFU1VWsvdVFLMnI1WjNXOUNXNWttVjZZRm12SlBjbFYyYkZnaTV1V1NR?=
 =?utf-8?B?dHdHaDMxc3haNnlseXdXUHhqOEtjWElHdWVhdytjY2hOb0dUeFMrNWRnOXQ1?=
 =?utf-8?B?VHFNWjNjOHZQMlhEY0hFR2RQenZuNGRzZ0NMNlJNd2VkclJTRVVvYk5LSER5?=
 =?utf-8?B?MVZ2MndoeWl4U2ZZMnpDNUlNK2h6dmJjeHFWVlVKcS9RYXlRb2k1enlOcGtj?=
 =?utf-8?B?dDhqbmxHa2hDVmxmSFJWUGlmcVB6eG5JRHltQkU4OHdiWXFqYVV2SXlraXMz?=
 =?utf-8?B?U05wcnFWS1NjSW1naUxVRGY2M3VudlBBdjh1dURoZ0wzVmVRSEYvazh2VVZN?=
 =?utf-8?B?ZXk0TXpMMVYxUDdBUW1XbytEaCsxT0Nib043bCttUFZRYkdXNGFTK3BLWExo?=
 =?utf-8?B?eEtxclowOVdsV09UWkFveEsvSEVDQWtPMXhpc0xmWnhrZndwWmVQMVlJM3Jq?=
 =?utf-8?B?Z1dHNmJ0ejdTMnlBTC9ZMnR2cWRtay9aNjhRZE9OUTVZbHhpakpxeFBqeDln?=
 =?utf-8?B?TGE3eHVFbXA5cHNrQzZKWHh2TnRrY09XRi91aVZvRTlMZGVGRy81SGFabjYv?=
 =?utf-8?B?NVg2TkwrendSQko4bU9oR09WWVBQaGlHSzNSWmJ4ZjhrSmpWVkNsWDE0LzNn?=
 =?utf-8?B?WWZlSzVheXhLYWhuR2JCRWJNNFlrU1lmQmtXZ09HWENhWmQ4UjV2alVQaGx0?=
 =?utf-8?B?cFczbUZGOGhVakVZMzhlNVlzMzhlc0tuaC9CM2krM200ZW5OR2lnQWllSVVK?=
 =?utf-8?B?SXFkd1UwY28rNDZJdEZINFFKdi85Um9UMm96dTBaTDVsUnI5NFgvTTA4QkVL?=
 =?utf-8?B?dGlFYk14bnQ1UjhWOFdaVnVZZ3UrKzdKSVl5MXJBdEtIRWhma3dZVFVGSm03?=
 =?utf-8?B?YUNwZk1vVnlPU1VaUXU2aklYZFVUOEFJNUNscGRRL2J1NDQ5Yk5LdktpU3BO?=
 =?utf-8?B?Z3JkMmZQYVJQNXBxamV0N1ZMVVhkMDRpbU9MZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STdkL2c0Y2hvc0d1U0RIVjBsbWZsSnJkRjA1RnUrZnpPMjRSZzJZSVFQQlEw?=
 =?utf-8?B?Q3g1TGZSL0ZxUVJIZmZwLzJnOStWRmx6ZTR6ZHNzczY4RWYwMWJab3N1cW9q?=
 =?utf-8?B?Z1puREdjdUVYM1RPU0FCSFlCY0RQZkhuUisxZU9reWRBbTIxWDU4bnZ6Y0Nj?=
 =?utf-8?B?YlNtTXphTkhSeEVGbVh5KzhCUjR5Y3Niczh6WnFueEJPMGJhV0pXVk5DUkpq?=
 =?utf-8?B?SUlJbjlPTDZKREhUbXB5TGtNb2FBbC9CYUwzYWxFMnV3Qm1HeXpicmh3aXI1?=
 =?utf-8?B?V3drYU5sTTFMOXFkNTcwQS91dGtjTURmWFpRWDFOc2pIRnI1VHN2L0hVMFUy?=
 =?utf-8?B?NXEzSll6SW16U3dEaVg4YnJvc0RuM2JrM0lZK241TXdHckpwaEZrQUJYN3Zo?=
 =?utf-8?B?MjVQVzV2K2p2VlpSR0RZeWc3NmVPUi9aSlg5U3dsaklSVEE1QU5rem0zcG1B?=
 =?utf-8?B?R2xhZUdFRVZEc3QzbGhTdjRQZ1pORnFsQTdsRUJFbXo4RjFsdzlrTm1wQ1NN?=
 =?utf-8?B?cmNsbFB4bmplZHkxYzhERDZLcDJhYUh4Rkp2TjZqV0NQZkhOWFpYaXNHQ0s0?=
 =?utf-8?B?L25JV3lDb3M0VHFyaGhnNTNHMEFjQTFCMlV6aXphZDB1UWxFcklSVEM5TDhQ?=
 =?utf-8?B?MmdwdXlOQ3ZEODZTUnNvSFV0NHlHa3o2UGZtWkpkWmdlZWlwOGhoYVc0clRT?=
 =?utf-8?B?VVF5VWpWaEZNSkVzejNBZzQzYVBOYXBySEhYVWhRU3hJQVNNOEI1Q0FDTHEw?=
 =?utf-8?B?M1l3WldOWmtiUnE0QXZTSHpZNlVlME1NZS9ySWFSSXdrS05iY3RQYTZUSWF5?=
 =?utf-8?B?eVFCM0ZaZVVRQXN5empaVm5OSlBIME82RTkzdHNDUTNpRTE4QzBpK250VWlz?=
 =?utf-8?B?M1EzZ2tWYU9UTzBFN2FPN0NDS2NRQnFpNSs1NmN1N2xyL1BuL1ZCeUwzeG52?=
 =?utf-8?B?SDc4QXcrZzl6MHpjMGFDaFpLVjdkMHd4NWN0bzdQelZXa2MxV2hQRWFNSjJF?=
 =?utf-8?B?eVJnMGpFTS9vcUVZdHU2YmFvMGFqSzB6MEg4SFFac1J4bEh5Zms1M1BuMEM3?=
 =?utf-8?B?ZC9XOFdzaFpUUk80WUcyQVI4VzloUjcvWkx1UXN6Lzh2Q25uMThCWU5JM251?=
 =?utf-8?B?U1NOOXA0SWs1SWo2MXNKZkt0b2NhOWdCUmpoTDRzSEhXL0ZEU3NsaCtlQktC?=
 =?utf-8?B?RmNLSmZ2SDd3bU9td1h6eEhWT3k1WGxRZExKTm0wRUZJN0pSZjQzdVVhZzI0?=
 =?utf-8?B?VnNBUU9PWnQrRkFZWWNNT3p2Um5VcXROMTFRWWdiNlFMZ0h0eVJSa3lxazBu?=
 =?utf-8?B?bmZRMXZGV3Mra0V0blJ3VVhEMFZGSXJWS3llaDBPakdKUTgxSWd3Q2Y3TjRv?=
 =?utf-8?B?TFJ0UkNMTEpWVGJ0anlmS3p1VlBTVjAwa3o1cXM3bm9DemNPNm9CT1Fidmdp?=
 =?utf-8?B?djJTcFYrUklVVUh3VDBZTVlGY3RPWGV1M0c4dmxTRHRCeDd6aUtwMHh5S3Mw?=
 =?utf-8?B?aG0yLzZPa0t5RXZ6a0RTMVE2RVNxSXlVc0cvbXVVVzhrS2ZocXpnc3FNN3lV?=
 =?utf-8?B?QVp2eExTczVYSllteDhvQWhuU2F6aFk2clZKeUtKeGxkYjRrVmtTdGI4SXhU?=
 =?utf-8?B?U0J2TUM5ZXlSK1Y1MXlHdVRWclIvdUovbEdFR09MMEJHU3ozcEljK0Z6ajRm?=
 =?utf-8?B?ZGU3WjFoTTdGWWFGYmVmck9WMHgzdkFXWXJvSENtaENXeTNQSFdYSGsrQllF?=
 =?utf-8?B?TzF2R3FNNFNGUlpQQURSYkJXdXVLalVyM2dSa1EyZGFuZGN2UnBjcVFYaW9C?=
 =?utf-8?B?L2tuVXRlY2VkUTBBSjZ4ekZScGhISHBlNWwvNGs3cWRTY3g5OGlsV3Z5YVVI?=
 =?utf-8?B?K3p3VG81ZFZJcGovRXBFYUp5aTJEaHdNVngrTSsyK3VUUEd1S1hTZTlscHNr?=
 =?utf-8?B?eThQbFp4d245eVZxNEZzaEVvL0xXencyUXJUL053MzRQNXYrWWJxblVoUkhx?=
 =?utf-8?B?WE5uWU5DUHRoYUJXVzBXS3ptMlE0ZzdML0JSc0lvY2VsTGVBVDRiakJqK3JV?=
 =?utf-8?B?UlNUb1UreHkyZUlJa3ordTYwN1dXTDNQRlcvTm5oM1JlYTNNMzkyUTFodEZN?=
 =?utf-8?Q?euEYS46h7rc+S4a46Ls+yvM4b?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f7cd7d-74b0-4c4e-4868-08de27234121
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 04:22:30.5065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2VIUIvSK/n+vk3d6jlXnadtVRES7JcPAGyEcEI2kQtpEeZZP4UB2fBSdyk8gYb0FnaPIOt/uVm6If/czmhgR7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9319

From: Peng Fan <peng.fan@nxp.com>

Allow each platform to provide its own implementation of start/stop/
detect_mode operations, and prepare to eliminate the need for multiple
switch-case statements.

Improve code readability and maintainability by encapsulating
platform-specific behavior.

No functional changes.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Tested-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 1726aaa1eafb9ac1a913e3e2caea73801b86dc09..833b1bd4019614157f0bedf09bd348caab802eef 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -404,6 +404,11 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 	struct device *dev = rproc->dev.parent;
 	int ret;
 
+	if (dcfg->ops && dcfg->ops->start) {
+		ret = dcfg->ops->start(rproc);
+		goto start_ret;
+	}
+
 	switch (dcfg->method) {
 	case IMX_RPROC_MMIO:
 		ret = regmap_update_bits(priv->regmap,
@@ -424,6 +429,7 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 		return -EOPNOTSUPP;
 	}
 
+start_ret:
 	if (ret)
 		dev_err(dev, "Failed to enable remote core!\n");
 	else if (priv->flags & WAIT_FW_READY)
@@ -449,6 +455,11 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
 		return 0;
 	}
 
+	if (dcfg->ops && dcfg->ops->stop) {
+		ret = dcfg->ops->stop(rproc);
+		goto stop_ret;
+	}
+
 	switch (dcfg->method) {
 	case IMX_RPROC_MMIO:
 		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
@@ -467,6 +478,7 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
 		return -EOPNOTSUPP;
 	}
 
+stop_ret:
 	if (ret)
 		dev_err(dev, "Failed to stop remote core\n");
 	else
@@ -1085,10 +1097,14 @@ static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
 static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
 {
 	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
+	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
 	struct device *dev = priv->rproc->dev.parent;
 	struct regmap *regmap;
 	int ret = 0;
 
+	if (dcfg->ops && dcfg->ops->detect_mode)
+		return dcfg->ops->detect_mode(priv->rproc);
+
 	switch (dsp_dcfg->dcfg->method) {
 	case IMX_RPROC_SCU_API:
 		ret = imx_scu_get_handle(&priv->ipc_handle);

-- 
2.37.1

