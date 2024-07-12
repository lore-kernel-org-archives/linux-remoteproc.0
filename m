Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013008.outbound.protection.outlook.com [52.101.67.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D3213F43C;
	Fri, 12 Jul 2024 08:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720772765; cv=fail; b=uvf1dG6MB03TZzLPbT9NlNmyGTGTTlfXfDDai5ZD/NEhc9uXHD7zXFlrLkWiNT6NtzNYlwW7AZ2I956Gy7+z9yeHJr7tMuyAmo2nxOw3SVkVShOtz9zPCZoowcKGDv83WBQNPdE3ifvGItbemX5NyW5b5rDEvKVrb8Pa1FntBa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720772765; c=relaxed/simple;
	bh=yBltRPZSBqPJXYOTtuOZ5dC3ORrqcMalBv/utjeYxp8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=a5XfJo7jkIE9hQLHlWkIBfHDsOIvJkGy+Q+8Fih4SOI2aZHNQ5KHN6LOcU9r5V1dsgqeNWLQbk0CpDssId9iYoF33rhmsLdDYKo3HqP0c9QVX+/cS3azIs+Pwe+XJqGb5NZNrsHguWO87732Nq0+2wyBpz3i4xzH6P/LboqAgwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XKM9mks5; arc=fail smtp.client-ip=52.101.67.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XKM9mks5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Od5ETVQUG4l32j+DR62HuZk8TWbU1rOb7ZK0aX+qXIWk9GI0BPvC9RyzrsUoGeRBX14Qj2ctK8YYLE7FOAMC3qzhunh3CNPKKDNChgQmjvVcvPgC+SVTn4dWD7F9TnPrrP2UaCMck4hCwIKQvtUsuSNvDDI22DZe+KfvHz6ujmHA6IB9G3nIe33LGceYB0oJo9yitmO/mLbvcccrJNx5Dwuy4Mk/F62pE5g8/QN/OusgAd0sMiPMxgfLIijFytOLlWXDQOIvL3fFZKXPbFBcDE7IpcnBEjNJ6HvRDPqo1DzyOsj7wnG7nXNFjeVxlfMDIekBJLAISv3RkEGIc/lOow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kB+3xJaFvfwf/JManv1fdklR8ALp01O8x0/PpiIplJw=;
 b=UU2QvAyqotHVzmMruSSnjH8VOVmzZsLNEwOGmDvMwdLbOr6O4vBcYM2nXN6FqE+Bh5NJDybvxPlgpC8l9xYDiFCbBo/wiCFTTBNwsczuqeb+OQ3vvnrKUZG6bI2CYCJaJcGea0nxJ21EJT/dM71ZOzU2xbt/Qfo4mVoilUz4G9wYteYw5XlCOjpLrHLj8JPaLh9VEt/c5ISgvi1oRwxxmcQUAmMhWaI7bDDysggTpaOy3FjAHU4zBADi2Sxr8YUghduQnzk3NP/YbuD89wDWp/gDSlUq2Q+DRGjfMKZxdL0O0dNf/UeCF35yWllWaGjtMsHCXOiH1itcIoTKn9hT7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kB+3xJaFvfwf/JManv1fdklR8ALp01O8x0/PpiIplJw=;
 b=XKM9mks53fKc0LYHdkIDhaDMk0/gtWocWyTRlnyhUl5I+SyAfeiPGgIsx8guHwfnY8ZfARqr2NENO0Ysd+LfrjPiSdm4pwDo4mwsPBaQ7FbDFM/5ykzjqO+ku+n1v+f3BZSKrqv8CIbvzpjylRLw2R2e2JMByvh9d3nDpHHlCkY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10865.eurprd04.prod.outlook.com (2603:10a6:102:48a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 08:26:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 08:26:01 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 12 Jul 2024 16:34:54 +0800
Subject: [PATCH 1/6] remoteproc: imx_rproc: correct ddr alias for i.MX8M
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240712-imx_rproc-v1-1-7bcf6732d328@nxp.com>
References: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
In-Reply-To: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Terry Lv <terry.lv@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720773307; l=903;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=2+8kRplRmHc3aTFiCtafaWWSL4i4VNI7oxPsLD0O6o0=;
 b=wP3Z6hHrUJ9pUfcZAnblIThjkibnSqFon0qu5V8q4MmO/C6/3Yu9QAbSY71H8XFbIicLHLcLZ
 EeOaVM7mfATCSwh3Aogr//YU6BOvYckpriVsfxk7MRPsO0BfTgopLjI
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10865:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e42fedb-8201-4e9b-5805-08dca24c43bf
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cE94SFQwWGduU2tWWU1KcXk5VTE0dWZrK2w1dTJiTmlHdVRzL01Xbk9ub0gx?=
 =?utf-8?B?YThkVmVyTitQMDBUZWJETXBDN1BDY0VWWEgrdEFFeW1vVmw0T2V5TGRTUlFj?=
 =?utf-8?B?VUwrRVV2bGYrS2E0akRLbTQzU2hDMTdnNUYvVzlwVjdYMFNKbi8xU01uazln?=
 =?utf-8?B?d0JkZzJsaG5oN1hGaWhaeW9BdWlMOVJNakFoZUtFZndBUTdEYnlhN0Q5ZUhY?=
 =?utf-8?B?WVdLbXB0dlNYQm1Ld2MvT2wyc1BuRk4yOE5rNnplYmkvTVRlb3ZFQVNYQ0hE?=
 =?utf-8?B?aVdPejdHQm1GbWZFN20yNXVqbUFNSndsSkxBTExhY0RtWTdseHJMaWZCMTBa?=
 =?utf-8?B?L2VIVzBHSkg4eSs3N1dsMk5SVEhqcWpidkhtL1Y0TVVyc2VVaVRScTJZK3JF?=
 =?utf-8?B?RzQ3RkMyTVVlUW5wZ2xXcDRNa2I3ZEl4dWpOaXc5SjRueTNjSC9POUt2R21y?=
 =?utf-8?B?Q2QvaTFTaEpPYmgwZkFDN3lNYlVacE5jOU9BaXprTysrLzlEY1RSQUljY3RB?=
 =?utf-8?B?ZlVGbWd3d3FZc1cySG94cENpakRlT21JdDFBc0lFWjF3Q0dlRVhPZ3g3L0x2?=
 =?utf-8?B?cEM3c0psU0RxRzBSWXg0RlpZWUR4cHVIN1pUdlJtZnkxMWhiUENxSENQQ2VG?=
 =?utf-8?B?MW5rRmk1TVlCU1ArMW9MRE5XbkxaZHlaVDhaSk5ZR3lyNVJ4SDRoZFRtYlRG?=
 =?utf-8?B?ME1JdGJQSkdLR0JzVEtVelFaL3J3bExSQ3AvSmpYNVF2WHpnRHZXN21sYTRp?=
 =?utf-8?B?cVpjaGVCUHlJZ3lkWm1IcVFaTG4yVWI2QUV4aVpOaDdSa0xhOExranpxWEc1?=
 =?utf-8?B?dFFtZEVyRjNsdmJVRVAwMDRlWXVhcGVIU2drdlVac3FMcXo4MEhlVkUyckx4?=
 =?utf-8?B?MXh4eGhiT3FWbnhOa0wxekFBWU5WdFd0LzdSMVN1SUhzdTY1dDdEUXhtZFpn?=
 =?utf-8?B?djFjNFZMeHprLzA2bGtnYkI4Y3czZ0puWldMNnNSWTNKQmJzNEN3M1V4TEk0?=
 =?utf-8?B?cithZFdvYTFaYVBzRDlMZW0zbEx1WG4vOVB1NEZJdG9UWEdxSjc1ekdQdEZU?=
 =?utf-8?B?L1pkVXNqdEhjd003aWZsWTE0QjZmK1RzWFRIVHQ3MXdvT3lYSUd3UStNS29E?=
 =?utf-8?B?aGRkSlAzdng0WFhVenZjVUtvc3pOSjhsYjZNTjJOWkplQ05FeWR1amdvOHZU?=
 =?utf-8?B?ZWIvN0JGbzRtQVhvOGdXekllbFNVcVlQWk5rTFEwcVlKYnNQdXdVOE8vQjhI?=
 =?utf-8?B?RjBocGFZcnJiUkxpM2ZFeDFFQ3d5aHZGT1BKMzRkUSt0V2lBZE4waGZJUUF3?=
 =?utf-8?B?aFpoeVdBUVZ6UERlZ2txVmxEQW9ZMjFxRmwwOFdPdkdaNDdvZXE0eStVSTRu?=
 =?utf-8?B?L0dSZUEzcVpGYTE0VFZ3Uk9FZU5qVHB2QUp1a1VJcnppWS9KM1lwczNpOFI5?=
 =?utf-8?B?V3U3KzB3T084ZEx5cGRkOEswL2Q5elZ5aDIrRVB1aU0vR3dqdEhsZlNxUFIw?=
 =?utf-8?B?dElsaFRUL011UEFwMzZLeHRzWW1HcklaTk1ZeUdPSVhHdGZqMW1jUERHdGNs?=
 =?utf-8?B?ejh5SUpxRHJKL0RqWFNXemovZFJvcFVqUHlNUXIxTnVzbUx5TmpDcEN2OGZq?=
 =?utf-8?B?VlgvYWNWQ1RWckJmbTVheEhyRzZzT2E0QXBBMDV3TW9jdGx5ZVd6MncyUmwz?=
 =?utf-8?B?RXNEbFNIMlpKR3pDQ3d2WG5oSU9aR3UvWlN4cFBHZ05VS1l5NmVsaG5EQlFH?=
 =?utf-8?B?SzNJdXBBTVpDcjVoYU1nb0RCbnJXUlVqRmdlUERSaHowd1NhRkYrR20yK3lW?=
 =?utf-8?B?TnRSUnQ0WmJ3NGM3SGtLTDdGSktleVFvTTVkOE4rS0FzSCt5OTlLZmRBbnJL?=
 =?utf-8?B?RW9YcFRxM0ZQSk9vNnJCblpONlNuRE5WeUErYjF1ZXFjMlE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTBSYzhYTk9YNy9TZHlJWVE2a2hTcGxoYWhmekxONVZjbUV2ajFvR2IvYjlX?=
 =?utf-8?B?NGUrNW9YaUNSL3NwWTBJVzdVSTN0Q0swTXFMVWNCcTltSU1XK29lYzRLMVdk?=
 =?utf-8?B?cXB6ejEwK09od3dYTUdMU0VFRFZHR0xaZ2dEMzdUOW5MaGVNa2hQR2hiNnFR?=
 =?utf-8?B?Vml0T2VzUFBmZERHUmRtWFJsQmFBQVZWcG9PNHhoZ1NjWmUwcDJ5WnZ5SE9t?=
 =?utf-8?B?aGE3eFFsUkZVejR4ZUI2aG1nei9CMXJ4SHM4OWRxbFZ2TG1LbUJJTDlpN2lL?=
 =?utf-8?B?OCtpTjFJSjlvL1MyTEYxYmZJNkx6Y2ZlNlZ5STFDT1N1ZkxvSThpVjhGdVVa?=
 =?utf-8?B?Uzc2TEFINDJDakVpTzE2ZEc4OTdTUFVtN0orTjJCamJ6TUdvTHlSanM2c09h?=
 =?utf-8?B?ZEI2UytkMVJXTkhMWi8rd2txZGtjNHZ6WnlhM3lzSlhJQXdWWWIrYU5oSkZ2?=
 =?utf-8?B?UHIxNVFMZFc2RHU0TnpxVWtlV0FSb2R1bThEWGZmbkFtU3d3VHRMcUFKaURD?=
 =?utf-8?B?OVorZmxSREFuMjB3QzVNeDF6bUNnRkxDZi9iQjk3WDJHOGZ5M1llbk9hUnlN?=
 =?utf-8?B?Q01SendscTFleTNMQThsNU5oNThKdk1aQ0VrdVhCRk1XQnNaZVlXdXJLbGNP?=
 =?utf-8?B?Ukl4Y1VZTnREUTVoQWhtU2pUVEo2R0t3cHEya05nT29kOERiZTZtY2lIcHhi?=
 =?utf-8?B?dFJJQlRob1haUzN2M0MwbGVUcTZuUzZPZy9yYWVVTTU4MGpmeGR2QUVESjd4?=
 =?utf-8?B?Z2w2TEJmUDlKR04zSzVZR3dHanlCKzVyam9CQzFJUXAwRWE3YjIzSjBxS3FB?=
 =?utf-8?B?dDZWaTlUVHM4Uk5Ia0xheGUvalhQTFp3VVZnMmNnMC9vMEpFa0RkRnNPNEdp?=
 =?utf-8?B?eXU4UUJsMVlWRkx2UzdsdGljejR3NGEzeWlYdmNrQnFYcXM5N3VNZHdCMlph?=
 =?utf-8?B?Y0VMUS9IdkwyaVpsWHAyRzFRdzZqbXVBdHRkSG10OE5nSWdyWENFR1YvZVBM?=
 =?utf-8?B?RXBUUStKN2FFWWMxeDhUMlB6ZkhwRmNKNk80WU9rWlVvTjMxSlVKUmhxZHZR?=
 =?utf-8?B?SGU3cEdTVm5IZGtWRFBmY0ZxMGNpVTFkenN3dmVrZWJaOGdZMFNmcGl0eWlN?=
 =?utf-8?B?alNjUVc5MHRuK1V1WGxUWC9jRWxMVGFkOUpycUs5WlJnK2RxVllPOCtJU0p3?=
 =?utf-8?B?b25WZUhLL2J1S3o1UWNBL09zRkJXL3pNRHRsalJpVlM1WHp1ZGZjUVp1VzBK?=
 =?utf-8?B?UUl6Nm5zQzl5eFdTcmdWbmRBQlVUdkUwbTU2SW5QMnNId2FFSEo1VmhYZ045?=
 =?utf-8?B?eDh3cmhyRndJbHd4Y1RwL2c3aXpsZGVnOENLczJlbURQeHNRQ2EwenQybG1O?=
 =?utf-8?B?KzUrYWtqbEptRG1DT0d1RTJrMmcxTk5CeXRWU2hVL3RxcWlEK25iTk1XS1pH?=
 =?utf-8?B?ayt5UU1IRy9PUFBRYXJ5ZWpDMXozM1RWQTIvRlpDbHFQSVJMcHFHRmxzR3JO?=
 =?utf-8?B?OHYvbmxOZUFWc0ZnVVAxOTl0cUYvaWFxWDYwZE5Ua2ZEWnMyUEtTMGFWM2lC?=
 =?utf-8?B?RzI0UDcrdGtKVjBFRndjNldSU2hyd0J6ZS9SaXpnb3N4dFBWQ1RJTzVVaEpv?=
 =?utf-8?B?UkdZSXdqK2xuT0U4eFlORmlsdVlQUzN3VUtrNTB3RGR0ZVFnNWkyQlVzNkpo?=
 =?utf-8?B?YzROeEF4T3V1V2xwMk5RZ3ZYZjBHTjJIR0owUjNMMFgyOWN5eXdYemZKa0RY?=
 =?utf-8?B?K1d6bStDcEJtTzljY0dvcFl4aE9RUHA4WkZDekozSnRGNUF0YVB0WUptNGhD?=
 =?utf-8?B?UVB2YzZycFRnaGJVMVQwSFd4eUxZSk5aZ1RWY1F4TngwWW1UMXZtbkxOVnp4?=
 =?utf-8?B?VTRsUlVRbDdWLzNmVVFkSVBmS0Z3NEtXOXJLM1NZekFiYzV0dG9hMGF1L3hw?=
 =?utf-8?B?SlBtNXRpYmk0bGpuZEVhb3pjV3R6cEROWkIydHJQSVZ3N3QzbHliVWh5R2Vj?=
 =?utf-8?B?R1Q5dnp6eHJqYmk5bEI3Z3hmQmVvdTV4TVdEZ1Z5dDhIVGFMSEJhb0JlWUU0?=
 =?utf-8?B?S1JEckkzVmFzVDg2WEVBYkY2N2ZMQXFRWUZFNDVMMG1DUk1PaUxlYTB4ZXNk?=
 =?utf-8?Q?WRg9zlh4k9K/lgi37jhIMQ7hC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e42fedb-8201-4e9b-5805-08dca24c43bf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 08:26:01.8851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yoyrIpgalJC9D/GqCmf0ssQbo8DQ1hWsIWVj6Vpy31JqbgG1W3PJ+2kvbzh1luGS9abmFYujF3PNGx30VpEkOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10865

From: Peng Fan <peng.fan@nxp.com>

The DDR Alias address should be 0x40000000 according to RM, so correct
it.

Fixes: 4ab8f9607aad ("remoteproc: imx_rproc: support i.MX8MQ/M")
Reported-by: Terry Lv <terry.lv@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 144c8e9a642e..3c8b64db8823 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -210,7 +210,7 @@ static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
 	/* QSPI Code - alias */
 	{ 0x08000000, 0x08000000, 0x08000000, 0 },
 	/* DDR (Code) - alias */
-	{ 0x10000000, 0x80000000, 0x0FFE0000, 0 },
+	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
 	/* TCML */
 	{ 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN  | ATT_IOMEM},
 	/* TCMU */

-- 
2.37.1

