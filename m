Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013066.outbound.protection.outlook.com [52.101.72.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6662635B121;
	Fri,  9 Jan 2026 12:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767960536; cv=fail; b=CRWGEXFnpzJsOJCdyRl/+T1IqRRXURQ49aD8wEw1XfFD7UJnUTsRyAGm7zTiytnuH3ii9HJge0AsR1qXGmVWdEYuDJIf/Q0j1f2SubH8FgidsrKGxDYKQWfsjnbZzVJh/YPmkE1Qsg36wrxR5OWi+6RiPtWjaG+eLlQ4XkJ7aFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767960536; c=relaxed/simple;
	bh=XYPJwgAUiJJk7k4vk8mnWitdqvpyFjFYPCpRkZm8Afo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sebLtwaU2/Xgt/WUHxRXBpcDrfZe6qtKKrMlumFPTMRgeHgOOidu/5CWB+qMjNOrlrqx8XbuZc9ZUtXARRB/DFhCn38ORJWOpXJlEW6lZMx9/i75/VBMf0otyWZS3gpc4h+f47QWs08rnwb1+38LUcvJQb7p1ab1bnD86IGF/Es=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SXj96L6h; arc=fail smtp.client-ip=52.101.72.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SXj96L6h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lv9wGWC+Vu33mlOOsWyaYbhB/UO1ydMyTJ1J8T52xIs4WOHEDjX4Wvh8AByGmEH/A+y7rslD8WYHAgS1iBKwgn3HcKfqXbIz3ERZJzM9JFhHbLtkHXramcLvio5w4X+RmS4VWlxBiiVOCyvMq6eerbTaEaBIbjLb/D/n1Qmj9rRzfxV28oliJqvsArvXDEkdtbBM5mW/mkun4Y4cCoy/e6yve99twn5qSks8cuYj6z1h6ZM6NwbZ4DOegwZ/SGJXGXFUIV8gVLX6/dZtRqt6uvsrUI8FYYcYk3A7z2s9KbTh3RsTAH2XPkZGIQ6n7x4Jcybu+nIosFFuMjOPcsPJbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQu6A4/BleBV2NRfBlr5jtFnDzIkS9VuRUZ9SVM6EYc=;
 b=AJFXbXC9ZmPsNLqYu7YGFnzi3KZwe93bukstCMoI8DQhBBgORSBdCbhr2TxXiOomPKtuRor0SBxJKc0fScz5n7JoroJ+LS9NhbMVfVlF9Mv+luZw9ADSa6muKpPB/uQG541mxV6EberMfVR4eJm13UoEKDPpmFBtR6bilyw2YYI+3j7LA5kWyvwWxHKa7yQaylTqwVVKM9JKlTW1l+E86+Awcdisjr4hgDAvJSwWLFENtVoJ8+CHwBrwFofO59XfD2sUn3C93GxEf998/EG3Ob54QfQO0yYo86djMFWJJcL+hm69ijD5+lJh6R5doXB6+CakTtZqEqsebLD6IzA4JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQu6A4/BleBV2NRfBlr5jtFnDzIkS9VuRUZ9SVM6EYc=;
 b=SXj96L6ht3IRQ2xFSmDGXMAzmhkTpkSMpIabksZ4TFSI+pBAtd8LR21LUhd09vApk1M8VuB8utwMrINc43oRypbcQJbFL8W35+EQv1z6cCrgN6jY2+jZE/5M4nEsKXNmZ+A0E2UpQhApd3txZb9laIK2IMqHcq31Ac76R1SQYrPhNb9N5u/GsT65Rm0BR2r9u52dqIlEM5GcLYpAbt6LLyUki+5+n9qWPrW1VRCFO83Yk6N2ewGYF/5gcr5U5b4qu+4Z2gXld6SEXimi2TbEMB5gtIchdB0jo5UpE8+eQFr/ZMeZTHhWxC/in7eAjV5DzF3ybfICNJtrDsJHY9caUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9480.eurprd04.prod.outlook.com (2603:10a6:20b:4d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 9 Jan
 2026 12:08:50 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 12:08:49 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 09 Jan 2026 20:08:05 +0800
Subject: [PATCH v6 5/6] remoteproc: imx_rproc: Add support for System
 Manager CPU API
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-imx95-rproc-2026-1-8-v6-5-d2fefb36263d@nxp.com>
References: <20260109-imx95-rproc-2026-1-8-v6-0-d2fefb36263d@nxp.com>
In-Reply-To: <20260109-imx95-rproc-2026-1-8-v6-0-d2fefb36263d@nxp.com>
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
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 745eec99-6644-484d-467c-08de4f77d937
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|52116014|376014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OTRERWRBV1lONkk2QWtEdnFQd1RhVjNqc2NwMGtxN0ZVNHBBV0RtRWU1bVNt?=
 =?utf-8?B?c0lqRjFuQWFtK3E3VVNjUGFWS2RrTysvbHdqdW4veDU3QnRUQXpUZGdaVW15?=
 =?utf-8?B?MWw2Ym5jMVhNLzZ1MU94dk82bDhnVUZWbXIzSWZuYSs5NVdHZEFKUEd6NTB0?=
 =?utf-8?B?MkN5N2RmU3pRUTQxMUE3bFZXV3hJNUpNeFNCR3FpWkZzQlFqV093MzZ6Vlpn?=
 =?utf-8?B?alRaaTJtM0hia0V0R2gxVmlFZE5rZEJxK0t6dk5kMmMxbjl0RVZtTlo3SjFr?=
 =?utf-8?B?MGxmQnpibi9IMzNMN1BqNmhMQ3A3RFhiZ0c1OU1Gb3daSmcxQWRrTzNaeHRs?=
 =?utf-8?B?SytFK1NmU09TVjQrUVE0UnhubDh2U09LVjRkc3dGTnR6V2Z1Q2VWT0hBa2ti?=
 =?utf-8?B?NHN4NGFRTHdRdzF2NjVKSCtLRDcwdkd6eVkvSWZ0K05JUVdydTJCR1B5VDVH?=
 =?utf-8?B?Umk2czhNZWVpV3cvZy80OWI0U2VzeEg4MWJHN1l2MEt1RERQalZPU3ZpMnRS?=
 =?utf-8?B?MkF1bHlEKzIzZXh1R0N4QVp3NC9RbXVid1NGcWlBcGpJVE12QlN0YmdYbHhD?=
 =?utf-8?B?VWxtS1VqQ0ZqdUdkeGtwVnBQSm1uU294eFBnWjhxZlEyRGhLTlNPd3pVNG1m?=
 =?utf-8?B?R2hNYjUyUWdGS2h0Y2lldjlRekRGa3FJYjVlWEZaanhNY0laWmMzbmxLM2xv?=
 =?utf-8?B?WmY1Um1WMy9rZVR1VkFhNkQ2Y0ExMjhicE5HMFliaUZEdUV1Y0JLREIwZ1By?=
 =?utf-8?B?U2ZRZllZb0J0L0ppK1lNSjcwM0o0bTUzaHFFNkZMajl0c2VFQU9oWHN6bUR0?=
 =?utf-8?B?cGUvc1YzK2R6NzdjRUlianoraHZqLzQwS2cxUElhSlNEbnV3VnFBS01Dd0xU?=
 =?utf-8?B?RjQ5THFITHBVUDU4MW9tdmZQdnlKVE9PWElmRCs0YTI4RUVlOWhkREFIcUJO?=
 =?utf-8?B?UE5MVkljZ3VWc25DZEkrYTJyeVpzeXNpclVRc1M2djhhMVVRTXBGMUw1TExG?=
 =?utf-8?B?dlFCaDd4RVlkeitITElEK0ZYUUFsNEdnODhmYWhlczlzclZVNGUzRWtPNlBj?=
 =?utf-8?B?ZzJrdDljSGNBSzVmNUMzbUVqdGFNcTAvS1BaS1RPMHdCZzJVbmFKVy9aSlRk?=
 =?utf-8?B?WUpUTy91Q2VWRFJZQU9FdU0yQlQvNlVLUFJlUmFXVHRCOGJNc0o4OFNNUmc1?=
 =?utf-8?B?N3hzK3FlcnFGdTh2MjNRK3Q3MmM4cjUzVUFZajh2NEJzdnRkSDRPaHRhYlU2?=
 =?utf-8?B?TnYwcUZMbUVGa0lhZ3B1aFJ0UWg1aXkxbHBXc2prMmROeHgrOTBITmVsZmJi?=
 =?utf-8?B?UVh3Rjg0bEQ2cGVpanhZYzNMNnZPdGVJSVA1bUxYdG03eEY3WG9DMUFpRitL?=
 =?utf-8?B?RHlNRHNYVFhnU0tqNnJCRnJoWTdWd2tFWnV5bzNZOHUyb3YzVFhoUUNhckRZ?=
 =?utf-8?B?U0Z0SndwMTloRkJ4b1JqSXozY1BTbFZBeG1iOUJFdFNrcTFEanlrWTNENFJT?=
 =?utf-8?B?aTFqck1CS1dvbm9QVDhET0xNZ3pBNGNSaExwZnEvd0doQWU3d0xuSWNSb1JU?=
 =?utf-8?B?UXZEQVljRXVsZ21ZY3M3cmRDS0Z6b1NFNXBYM1ZCTGFORnp5STJaUU9FQ3V6?=
 =?utf-8?B?SU9ieWNQSVJiR1RqMDNWQ0l1NGM3ZE5RQ1BOMCtueUtDM2s1eUx2Z2NvNTFO?=
 =?utf-8?B?VGRXbHJRTWpjcG93N2tZYllHT1lqTEc4c3RYTDdXOFJ6SGVSbDU2aktteW9O?=
 =?utf-8?B?VkkrOUtacDFXVjBjcG9OSU50d1VZZkVXVVZUVFlRRkVPZzRENCtMaXhNWEM3?=
 =?utf-8?B?TnBJT0xlNXRtOHZodnhLN3h2YkRzRjRjZXNSQmttYitONFVNdUQ1MGhSR2My?=
 =?utf-8?B?VjlGQjRDZi8zcUh2bWw0YkhicnNWU1ViOE4wQjR5OGszTUlDRW1NVkFWRTJj?=
 =?utf-8?B?SnJYVWJEWXFjbEVBNi94VVZjZzBkZU1BVTdzeVVnN2FRU1ZYNithUnVXWjhn?=
 =?utf-8?B?TVltN1N1YkVJUXpMRDg0YXl0MkFRcnZnK3RDT2FNVHN4MzFvVlpBNHhOSDd6?=
 =?utf-8?B?YVgwemxaWTJMM3BvYklLSHFpSFFEbTJrNzR5dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(52116014)(376014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDlVcEQrNWlvazhPTDFocGpBWVBvdkpiY2cvbzUxQmJvSWc3b2lEa3EvZHhz?=
 =?utf-8?B?MmZRTVdrdlFOdFo2QmNhNnNKaGhwYzRpTThwamFrS1E4OVBtbzIyYmh0Qmgz?=
 =?utf-8?B?YzFSWHIyWmc4QVE5Uy9YbXBvME9wSmdDa2JqYUE1UzZxelFpQTNmdTBUY3dq?=
 =?utf-8?B?YlFTSGJsMlVJVks2aWtBRXQ0dncrd1dzLyswUG9RdTNRN2ljQzc4bjFOeFNj?=
 =?utf-8?B?cHNrK0p2SHZsQll3cGZNcHQvZE1MYUpuUW1GYW1FdVp0azNFa3RGRERxTlVW?=
 =?utf-8?B?cFd1S1ZWRVFyZVViOGY4QW9kRjJzVWFkOXdQWjBxdkNPanpGeXJreEREQWhi?=
 =?utf-8?B?elduN3BWenIzV2gyd0p4OVpqMm9lMmxjNDNFRUovUVhEaVp0WkRSWEhBRFR5?=
 =?utf-8?B?QTJlNzJvemN0Mit6RlhsUGJBNDRPUzd0SmRmcWgvbld6NDB0R0Ftbkg1TDNT?=
 =?utf-8?B?N3lPWlNwY2xhT2tUSGt5M0JhN0YzV0M0dnhYbkFUalRDdGMzQ1VZY09oWWI0?=
 =?utf-8?B?dFVxQnk2LzdWWkVTQTlKemVQaEJPOER5c0Zyb3VlcWx5SjJKaWJqb2ErRnNJ?=
 =?utf-8?B?cHd1OEdzd0pVQkZpOUJsK0kya0d5S1pYVHdsL1gwREI0djlVNllOUzlOaitx?=
 =?utf-8?B?cERPcG5SYVVKTlErcWJDQjJPRzBFZ2E1Z3grWWVYbm1GUkw1MUpJUXR5SWdF?=
 =?utf-8?B?T2RpdE4yUWNub1BwQ1dENnpNZHR6b3VFcWE1Q3NvRTVyZG1iYjk2cVZxdENt?=
 =?utf-8?B?TU10VmpZVmdDOTd1S2hnamtVUUZDVFVlMlhmb2dXVmlvdzBUbnU5ZU8xTWJo?=
 =?utf-8?B?ejFJSGFMVDBhRzJlYmxrYjIxQnpKODl2Z0xHUFAwYzFuM2daVExHVk1wQ0FI?=
 =?utf-8?B?SG5veDdhZU9oRkZZTFRKV1VOR0N3NkZFKzZMK1Y0ODg5a0NWaGpSOHViaXFl?=
 =?utf-8?B?NXpQdVVDalFWenpQSjd5NVVWT2dRSXg0bEhBaFZpU0R4S0o5SW5pWGJ1NHdU?=
 =?utf-8?B?NGRvZXQ1d1R1SEJIQXFGSWE3d2VGL0o3cjZVejZzb01paG5wSHRkSDVMSHQ2?=
 =?utf-8?B?aVhvQ1JOY0JoSkZUNm8xcmxkOVlxdklwVGVNZWtwWHAzN2NLbXhoZWxvVkZ2?=
 =?utf-8?B?Z2dZNEtuMUlIQUtwYTVFK3ozWDVzQjE4OUZJQTlDQWlYd1RVWTdCUDltNXBF?=
 =?utf-8?B?bEZjWWNaTVhxVUw4aGg2TGU5QXVub1M4ZkxuV3JzR2pjTFhURGZmeTZvQmM1?=
 =?utf-8?B?K0pQVUN5Tnh4RXJadTFLd2t1YU42Umo5MHdCYmg3aklEZGhrblhkZlk0eVVv?=
 =?utf-8?B?c2c4TlByQTZ3M3krM2VoY1hqWnNDK2VTUFFESjZaV2xESjVZbFhjTXpIOXhm?=
 =?utf-8?B?eG5sNTQ3QklXN0NmbGliaW9zbXNlc1VLRDN4YWJTRGcveFdQRjZnenV0dExw?=
 =?utf-8?B?WmFQODZrZDE4S2NnYmJDY1k5SnIrMWZVUEpjdC9BWkM3VWhUVXRtSjcxWCtD?=
 =?utf-8?B?aVg2L3E3ZXZXMGw2djFTUS9KeEFRazNLWDFWMUxwSVZieU5BdEpoa0xibld6?=
 =?utf-8?B?UXFoVUhXNytZalQ3aXBad1hSREtZdVJDY1ZrSTZsREZRNm1wZnVHT2lpNUph?=
 =?utf-8?B?L3JQOGdlZGgzS0J1cjFNbFdWYm5qSUtOeXRXNGVMb2wxSDlRWXVwZ0I4TElF?=
 =?utf-8?B?dU9TU01Ga3dycFU1Tlp5QXAwYXQzM0oxRjRreEUwZE1rOENWaEVTbTV5aTVS?=
 =?utf-8?B?SEJ2MytKa2l5YnZaYUZ3RTNINHVlbzQrWUJXRFZ4UDdNN2JqVXpMR3MzNTZo?=
 =?utf-8?B?SFV2bSt5bDJEam1Ybm9wbVhxT0hmMk91QWp1azkxc1l6SFR3S0dCV3NCWkpY?=
 =?utf-8?B?YWVDb3VCTzI5TlB4YnRQRTcwS1RBNkxnZ3lvRzh6UGI2ZnQwTENveXdaeFQ3?=
 =?utf-8?B?Zm5Gdi9reFJEOEh4UGYrb2tYRVFuOHBvbXdraDZJSjFCSXFVa1BhYWZMNy8z?=
 =?utf-8?B?Vml5dSs3UEpyMWFyUGRGTmIveWtHUmE0MHdxSnA4NlFEZEVzdDVqQ0JDQVFs?=
 =?utf-8?B?azVjTEJXZDdTSys3bzFmV3VkdXJnZ0ZxQkZ0bFdSSHpQa2hNTFI4VDZJRGVw?=
 =?utf-8?B?SGNDdE5LY1h1OS9FMUFpVEVKUWNKSVA1NERNMGFocU5McC9TUWt1WGlpUzh3?=
 =?utf-8?B?MXh6Y25JeW5CUmFhTE9vYk14bldHTFpsZHdMQnZMNnNWcWIvazZaRDNpa2Fi?=
 =?utf-8?B?UUNiMlNrTHJhMmM2cnd1WDVoaEVLNFpvMlROYk80QlV6cXA5L2FsaU5SRlBP?=
 =?utf-8?B?SzVrQURKS08vZ1paNDY3RWtraVZxMzhkL3h0MXN0ZDRjQ3NPSnQrZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 745eec99-6644-484d-467c-08de4f77d937
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 12:08:49.8771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zqh+SyBPR3B3GGFY2+90YEcMGuy5ohCGzMUgXI0yilk5mLFQ8Lmkx59hbPQznL/NIqHvocbznVMH15xzy2/0PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9480

From: Peng Fan <peng.fan@nxp.com>

When the System Manager configuration places the M7 core in the same
Logical Machine(LM) as the A55 cores (M7 LM ID equals A55 LM ID), Linux
can control M7 using the CPU protocol API. For more details, see the
previous patch that adds LMM API support.

Changes include:
- Introduce imx_rproc_ops_sm_cpu for CPU API operations.
- Reuse imx_rproc_sm_detect_mode to detect shared LM and set priv->ops to
  imx_rproc_ops_sm_cpu.
- Implement imx_rproc_sm_cpu_{start,stop} to handle M7 start and stop.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index b254045d45eaf751c55280fb6ecc4a042f47d7ce..09f168d9ebbecee5d26b0ed4e3523f0030275f31 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -102,6 +102,7 @@ static void imx_rproc_free_mbox(void *data);
 
 /* Forward declarations for platform operations */
 static const struct imx_rproc_plat_ops imx_rproc_ops_sm_lmm;
+static const struct imx_rproc_plat_ops imx_rproc_ops_sm_cpu;
 
 struct imx_rproc {
 	struct device			*dev;
@@ -326,6 +327,21 @@ static int imx_rproc_scu_api_start(struct rproc *rproc)
 	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
 }
 
+static int imx_rproc_sm_cpu_start(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+
+	ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
+	if (ret) {
+		dev_err(priv->dev, "Failed to set reset vector cpuid(%u): %d\n", dcfg->cpuid, ret);
+		return ret;
+	}
+
+	return scmi_imx_cpu_start(dcfg->cpuid, true);
+}
+
 static int imx_rproc_sm_lmm_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -409,6 +425,14 @@ static int imx_rproc_scu_api_stop(struct rproc *rproc)
 	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
 }
 
+static int imx_rproc_sm_cpu_stop(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	return scmi_imx_cpu_start(dcfg->cpuid, false);
+}
+
 static int imx_rproc_sm_lmm_stop(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -1129,8 +1153,9 @@ static int imx_rproc_sm_detect_mode(struct rproc *rproc)
 	 * If no, use Logical Machine API to manage M7.
 	 */
 	if (dcfg->lmid == info.lmid) {
-		dev_err(dev, "CPU Protocol OPS is not supported\n");
-		return -EOPNOTSUPP;
+		priv->ops = &imx_rproc_ops_sm_cpu;
+		dev_info(dev, "Using CPU Protocol OPS\n");
+		return 0;
 	}
 
 	priv->ops = &imx_rproc_ops_sm_lmm;
@@ -1321,6 +1346,12 @@ static const struct imx_rproc_plat_ops imx_rproc_ops_sm_lmm = {
 	.stop		= imx_rproc_sm_lmm_stop,
 };
 
+static const struct imx_rproc_plat_ops imx_rproc_ops_sm_cpu = {
+	.detect_mode	= imx_rproc_sm_detect_mode,
+	.start		= imx_rproc_sm_cpu_start,
+	.stop		= imx_rproc_sm_cpu_stop,
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
 	.src_reg	= IMX7D_SRC_SCR,
 	.src_mask	= IMX7D_M4_RST_MASK,

-- 
2.37.1

