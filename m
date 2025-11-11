Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011013.outbound.protection.outlook.com [52.101.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD66347FC0;
	Tue, 11 Nov 2025 01:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762825320; cv=fail; b=f0B+1JzKruBSE9pmNAMEDR30AKizD5rzQd0NcVecmflrFufyxpMvGe0Via4KFeVoFQ6/H+TjIwsE/C8bhQcvIdXMTUWLdt7XuRfTXPB9lX+NgoJGG7GGIpsY2FfE1zFEOiJcrBT1kDUKs2MnfykvikZp04TdQqKOlpcm9bdgo18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762825320; c=relaxed/simple;
	bh=UOhUAHwHq7YiRbYpE3ZSLm+md8L+fYlfo0TA5OP2kQA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QKBthktoUMnqs+4Rz3ts+BKToTTBbAIg/UkiUTVwLE6aCpPYtxzxxJuptL+xuFG1wzSGBfr7bTSzYFfDrt0HRjioEsNbRqaT8T4hMye5rfGeQF2Gr93/kfAmv+kbAQd7gzhqQ0MmVDGOeIJH2Ibdkn24SWJ7UMQg7+QkdKNqhqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ApZ9fm1a; arc=fail smtp.client-ip=52.101.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ApZ9fm1a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HcQP+5KUcXSpOEMSXsepxjrC/StQSZ6FoN37x9og9FtX3n8aFswQd8rPayA4RkBvI+mF0l3v2Dv+vuENoiVU56iGD8pRx6pbInTxqkmqBqoHsi5gZjN7i/oC40JryT4uouXZ8N2qDK8my152qclcK+5lvsqbQHgfibgOrdubi1N35BHD7xcYrgQLw3qexi8mxumwXSK+sJdKKmlMisbjCI+zF2UsbbVlER62EH4cjUP3aCwpRjg9qJLsxRyDb6BdG/jxvZ0bpuTfCRelSsegdL+VqvrczZR/KvqubKRDT0kQNKWPIbK4hr5PpW5ULmgfeVVHYkONIKTcNUlWubv2KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOGdix019KvufUcdeKWPJEJT1GFK9Go8n254/HS6bAU=;
 b=JKLySOPv1X1L8SwQQ9C0xleXGf89z+QsVSSZ7vIbmkmN3av2/hjyTGgdrtlll6ftDT6GaZlga7I9N3LApMWMJBeMuUBPg1qkqs4a5EjoDXVNrawE8Tda2enGhXJm+DhBT/J6YedXiEztUVRlcYEGLXcB7Eg9y5Sfmo7jlk28S44feIS5kcqvbceIEswWYxgfEF/8d/WFKpSD+AIb78sgbR3AOsTIY7o9IXrH1sZnqYwl194q4QZouTTtLv9jSzs51w94WWhdvMlBDPPWoci74WvLi6SjxbWEL5jB3B/nDlfBWMwETVd++s+ccigHTiTMGwmsXv9i0XQgIUhVXwnWLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOGdix019KvufUcdeKWPJEJT1GFK9Go8n254/HS6bAU=;
 b=ApZ9fm1aA7U9fMp7V9fdM8Sfvp3VBibr+m0mUFlQGC1yJaQ7JfPblAYEa6Lz1tURKBflPBckjhP1yp3Nm0i2DXRFFUJZWO3V0C1lrEWHGWFm1LcQHDCg3M3LHhK4a80BrCA5tBduzNlad7TJVIj3EjoPwJGOF/K03T+2iQeYeRbkwnPDfh9puIlbDGYjIoHjpDXAZjr+Jb9VQUX01qGhTSw+nz/msuP3OHwdwrCM8g0+rxDz9uiqF3XDD72bLZw0lerckxpwgo0fvQf561af177NiXHDrMVEwuPMl+BWxBi/j9X3i2Uxbboal/L3mh1hjfAttck+ssoqTvDXvptXpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8039.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:41:55 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:41:55 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 11 Nov 2025 09:41:17 +0800
Subject: [PATCH v3 06/11] remoteproc: imx_dsp_rproc: Use
 start/stop/detect_mode ops from imx_rproc_dcfg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-imx-dsp-2025-11-11-v3-6-d05dcba737fa@nxp.com>
References: <20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com>
In-Reply-To: <20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8039:EE_
X-MS-Office365-Filtering-Correlation-Id: 126af67f-8fd3-4f65-2fa8-08de20c37eeb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dEdiYTRsOHdDTUlNMFQrbjR0Qzl3ZFdGdmRFa0tWOE0rMTFBOVIweGRBMVUz?=
 =?utf-8?B?WGpoSmJzRHdnY2VONDhXR1J1bEJrbmhXNlY2ZU1FN0ozeUtqVE44VTg1dE1E?=
 =?utf-8?B?OUh2NHc4Z1FMSXk0S2hjWEQvS2l6d08wRVVQRnVMc05qT2Y3SGxMQnRvMGEw?=
 =?utf-8?B?R0hkNUpueWpmOEFETTZJK2ZTL1lWRjJXRi94ZldSYW53Wmd1eU8ya1JvTHVC?=
 =?utf-8?B?aXlVZkhQWkhPOUdYZlUraElPa2dvY0JQTmh4aC83T1FneUhPSHBLUllzTjFm?=
 =?utf-8?B?NzhjU3hvQzRKekZjUDhMQW1keUg1b25QUzEyUnB3cElqb2RpMjJGaEFvQU4w?=
 =?utf-8?B?ejN2eGx6N0Z0ZmR0Y2ZtT0VTS0ZaNUZXaVRqdHNnSlN4UlRGOXdHbG5tMWdT?=
 =?utf-8?B?U09tWEQ0aXRoOExBMnZQT2dZN0NoMFhXUVBwNkJKRWExL1E0Y1VsVVpXb0hH?=
 =?utf-8?B?L3Z5WDlJcEpwcWk5RWIwYkFmdnlNTUNraCtLMHRubFBtVDZzaElkY3FJZStL?=
 =?utf-8?B?Rm13RjNBNGJPZmpJdWl1bnUxZW1majRxcGZnZE9zbzROVGQ0YTdlaWFiQjY4?=
 =?utf-8?B?eng0YU1WLzlzMFdOdnNyTCsrZHlwMU5PelJOM21rdk9Wc29vbDhncEc0R203?=
 =?utf-8?B?c0E1Wk1wY2NDc2I3L2xqMlNxdlQ5ckkxVFlWUlRiWXZTdkY2Tm10YWF6WFNV?=
 =?utf-8?B?SlZDMnpjcHR4clJ5ZWhxcGN2Zk1IWUpCbmdwZUptRHYrYXd3a2FWVS94RUNS?=
 =?utf-8?B?eHB0bUJaRXgwcm5Kbk56VjN5Rnphd1dNNm52Q09Zd0NwZ2E4RHlDRXZkbko2?=
 =?utf-8?B?ekQwbGZtZmxFakZlY1gxV3Y4dkVwOWhUUnUzK0g2L0FtajJYTERXVUZDUUMw?=
 =?utf-8?B?L3RyM3NyUTZzTEs1aXE0Q3ZjRlZGYlQ1RjhaeVp3czg0U3FFdnFESjdTaVht?=
 =?utf-8?B?V0VwTEY1enovS2VFOFk0Vy9Ud3ltdWJhQURJYW81czNUU3NtWGRsQmNzV2lP?=
 =?utf-8?B?MlA0a3lQTXZ1c1B4TjdCcXBwMFErZ2djK3FIcXd0aXI4NXg4KzJ4NWdVaU9P?=
 =?utf-8?B?Q2VLZGx3bHhJZWlIMlNJNU5Ud1dydE1ycHNuRVhkTTA5S2VuRk16QklYYU02?=
 =?utf-8?B?NlZLNUZvOHlrQW9LNFRoMFRmaFhvN3N5Tk9na1JxRnFSUFNEYThtemhzZ1I4?=
 =?utf-8?B?TU9ka3BKZm1oMmh4ZVJXUVNaRjl5UGNuYThzMS9DcXBZWlhGZnpyelBvVlhJ?=
 =?utf-8?B?YTF6NzRodVBCczY3VVVRc3dJNjlWS1BHZWxwSUlvemJEbVY5VWdyQ0ZxVkFo?=
 =?utf-8?B?amdCZHB3ZjBIMjd5N2tVZ2N5c0tDbTBlUTZXKzlQaFpUR0VtNmFGTHk4TDY4?=
 =?utf-8?B?NU9SK1o2cEVmOFhWaXZXVnhrYTlUNitSYW9VcU94TnB4cHAzeWRkYURnOEVP?=
 =?utf-8?B?RUZVdGUyZStOZnlQUUU2T1ZiSjlWL2JWb2pETC9QQWJaTTRnRHd2TWRNbkpN?=
 =?utf-8?B?ZDhpT0RDUS9WZTZhNzhscVNRL3dxdTNlejIvYjZqN2pzZTJWUjQrdGg1eXlX?=
 =?utf-8?B?THNKR29sWGgyUS9YTmk4TXh5SVdnb054b3I5bjJRbkNXa3VoaHdvZ09yemdI?=
 =?utf-8?B?cUh1VGxXVzhlVXVicVp2VHh2cVNTZFdMb2JQNGhmaUt1cld0aGNic3FSeXQw?=
 =?utf-8?B?RmZER2lLWnNsUmNnNVRZSjM3Z1ZwR1JQS0JZRDBZNXNaQ1lIZkxObkp0N0VE?=
 =?utf-8?B?eEV1Mm1nd3JuRHFaNCttQlVBcm5JRDBWVC93V1JNUEI0d1ZSc3JBY3A0eTZN?=
 =?utf-8?B?T1NFbUlkcFNNUVcydjQxQUNYUXBDb1drL2FjYUpBU1VQWGhPdVRzSXBGeUlx?=
 =?utf-8?B?cDhNaWh3cEFtb1FuTEFJYnZJS1NkbWd5UnMzSEd6WGR5WUx4UEZPQU55QnFV?=
 =?utf-8?B?aldHS0pLalM3TFhnbE14UVdrMHprQmgzQUhMbWNCVEM5bGtUMUlLRUJtWDFY?=
 =?utf-8?B?UGtFc1J0bUErU2RKS1F2V0pwY2loR1N3NVFoU2RvaEJoalpqMnRxMElFWUN0?=
 =?utf-8?Q?WJ/r2V?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGV5aTZJTUg0SUhvQUJmam9vaWZKSmdEMDV4L29tc1oyb0lGTDNGVERCdlJP?=
 =?utf-8?B?RTI4bDRvQWZtYklxT0krc2RwcE1wZEtackpHNXl3KzNha3FHcjk4aEJWUC9L?=
 =?utf-8?B?bG81Zko2VVJwWFF3N0xybVV0Z3JmYm15UU1zYzdHZlZQY2dFN09YQXJJOVhQ?=
 =?utf-8?B?aGtteDc3eng0M1BRYWJ0QzV6L3N5QVN6NGRMVk45QjB4UklMZmV4L3NUdnEw?=
 =?utf-8?B?T3Z0cEw2amc0NnNzODc3M3JqL3pVZDU2bEdHZ1dBV1VadmZIcDVHL3RickhM?=
 =?utf-8?B?QjNWaENyamhSVDlFSFh2elArZ3NrL1BjS1VWUXEvU2FZTkFuRkJ5citQYU0w?=
 =?utf-8?B?Ykp1d0ZURFFmclMxQnhBc3lNREhPUDZmZVZVZHBZR004alQ2Y1NPTExZUk9G?=
 =?utf-8?B?U3Z5VzRuM1R4UDNvTzhraHpuQTl6eW1Wc3hBeWZYVFNSMFlVUkgzZDJkdXJG?=
 =?utf-8?B?blE4dzd4V3AzWk9Yc3JxdW13VlhMQWtwckhlWkc1VDRzeExBNCtNTnVFdStQ?=
 =?utf-8?B?Y2UxTU1MQXBVWW5xbklhOCtYTG41a1RyVmJYMVNlakdnUzBkZnRoZ2pJSVFD?=
 =?utf-8?B?MGRmeUxGT2Z1bVpCbW5qSFZpZTIxclU2d0x1eTBleTl5ZGV1NzlzV2dkZUVS?=
 =?utf-8?B?U2lHMzFxaXBEclV3WHcrRExiT2w5ZHp4aE1IVjRCK3dsK2dxVEhhQXVQYVp6?=
 =?utf-8?B?QWYxanhObkZ0UERTUEUyekxRRmthS0FEZXVqV1g1Ulo3eHMwV25wbEVFY3VM?=
 =?utf-8?B?Mks1OVdiQk5xbjdwMUhrVDExMHZBeS9LUWd6OE9CSnhqbGpTQnpHWUdla2ti?=
 =?utf-8?B?TWFyVnIvbG9BNG9GYktOaUQwNGhCbmlqWXVaQnBLaHErMDgwK3NzTndCVTBY?=
 =?utf-8?B?ZjB1c0xHcFR2YzZCTVd0TW40VlNvUzVjYjdNT1YycmVqK1MzUHZVSmJpcjBV?=
 =?utf-8?B?QUx5dlpIUnlYM3pZRmRSYmVIaTh4TzRzY1hVSDJ3MVJ1TjRQNURUbE1RMys2?=
 =?utf-8?B?V1hUcEhjR3REQVFwTGV4eGdWRFBXdEREN2g4RGNBSG5TMHpqbk8xZnArNXJ1?=
 =?utf-8?B?NGdZZURSR2s4aUM1KzF3T1JYTklxMlRvZWtDd0pWNXJaYXp3alNtR2d4WlNW?=
 =?utf-8?B?RUFyMEJmYkV5ZUg5UjMvU0wwbUpmL1MxdENMOXR1dEVrSERmc0RTSDZyay9V?=
 =?utf-8?B?WUZHazlDK0hOUzAreWJlNys0WjVwdXR3UmVFd1VlOXVLYWRjem1ITUlvR0Vn?=
 =?utf-8?B?WmQxMlM2RE5DOXJLOHVjbHBVNkNabzJIU1NiR0ZKQTRnbUR6VUFKUXU4bTVm?=
 =?utf-8?B?ZFEwZTljQ1NiUE03NlJkSjd1RnNuVXYyZVlNZGt3WHN4TnA3azBOKy9NWEJC?=
 =?utf-8?B?YmtDS3R6VklkM3pJUEExMG0rM1BPRnIzcXIvR0o2d29oMmgxV3B2VFRwK2Vp?=
 =?utf-8?B?MERKVXp0N1d4bkNUZkpQSWdFUklwbEJSS3g2ZmdoOW5hNE9vSkJVWE5KU1Zh?=
 =?utf-8?B?dlZTTE90ZHBxc1VrSkxhZzlvQmJsK21PZ2xxazFtT2xSeDJabDdUbVowMTVy?=
 =?utf-8?B?NUVabURFdXNrMGR1c3k3eGl5Y0duS01uQW9iMUhKTHdKNEJvZHd2dFlCMHEy?=
 =?utf-8?B?U3pNVTBMNHVxTFp0bys4TC9pQU05b0JQTm9GeHNJVWhUdURTVS91UlgyOUlQ?=
 =?utf-8?B?REVtdFBxRFRrOWhPU2RRR3d6SC96QWtteGgrUFNLbUpkd2M5SDgrUjFFRCtq?=
 =?utf-8?B?NUJ0TkprVU1lMGRhYWZjMEtjQ0dZRlFrQXlnaTY0Z0RzN09GS3hEd0l4cWlT?=
 =?utf-8?B?dEhUZjdoR0RZd095NjVlc3FNK1BBN3crODZDbGVjSnlaOUcyLzFGU1lOUENv?=
 =?utf-8?B?Y2ptSm91ai9UN3R4THJCdVBBZ2ROZkdhMko1Wko4RFpFRmVXTCtHc0p6SW8x?=
 =?utf-8?B?aCtDVmZxRi9BVFVaQXpCTVV3dTZ2Tmt6QmhRZ1ZPVlZpREJ2b0FXWUNwVGhX?=
 =?utf-8?B?d2piM3U5ODF0OVRZeVh0djdPcUM1M0JOWTRmRGdYTzVRa1hVenFHc0NUWEh4?=
 =?utf-8?B?M0lnMWpkcW9JZDUyLzJWbm1MKzVvN2YvampBZUtwT1RNcWRHOEFja1FpaWlJ?=
 =?utf-8?Q?QXG2k7BE/PMMKYg6z9LJdIIKO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 126af67f-8fd3-4f65-2fa8-08de20c37eeb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:41:55.4579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TaIE82tMtJIqCHPoyL+vlqTksdNBr9uc/xdi0ORGexAOcqrxi5F4z0nYiUrXxu/YiYXJCWoakQ5fhoicMggdQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8039

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

