Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011021.outbound.protection.outlook.com [52.101.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBE0156F5E;
	Sat, 20 Sep 2025 13:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758374098; cv=fail; b=c/cjgqchV+7fOa/rXORuf9zG2/nMRQpdMCOgJcTRgmYeonyg8VCM9drTPU1+E5n5tnbQenoqhQoHrxwoRAQg5KlWrMNWrR262xgz2UpOPmSvr+/wogKkXYUp3IJgualssn80qpDJ/SgHjZwzosOkWYobzG3KOIYssCaIZD9tvsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758374098; c=relaxed/simple;
	bh=98gATFBx0dzYYaKLMQIusZXTKYuy1ePGpya0sT1cTO8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=KdW6RM8Hz8W9PZbYr9t1am8LCLnBfSS7RGvLAFQHrqDvymwkzrgKBKi9i0as4Y2t9CzFgGV3exL7my5dD7Feo2ZqZHVHxyEDD4npTIBn8NnK/SX5MKXpDTpHRqDkV7eSZJi+FPYD0FF/sSM5wQBJT1RAL40BkCj5BOm14aCdeTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=b0kb+KsH; arc=fail smtp.client-ip=52.101.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="b0kb+KsH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkCx9c3adUThKHnvrQQLM53KVI3+OUdMEsvv+3hyufVPq0M9bP9Kd676V5mKMMq7CiJjK/7ap3AruMagxcKrR/OmshAWbEAPtGE6yGOCOyvg9TPkeNxWKRy+QNls7gDeoV4KpTg2rYLfce1OhJYiponMIo6cCCR/7KfdPnR0OQq7oonFrP1gfAJu5S+q+lEmDOJ7gVjOd1gYz/NLJXsFReg5IGyxf3ZAXizKz6vA1bufc/nWPFBe+BfIJAoD6hjs30AtrCQczMEd5XzC44wtcTAQGtArzs345bYbONjdyaervISRHUkYbDoQf4U2/KJOLVxVMlHhwXzaEcBQJhHtVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/sAuwmIGdSamct0yEWyTSRmcHpvIIWpeKWMzcNbqtM=;
 b=E2TEpLl1ia/hgARpfcS9wMLyKzTqp9f9w1Pejx0b9MFf+qNowhFnL9YXjZc0HQTs6IGzvTgxeJk+i04lUlVQb2hXxH8u6YZ6C4wpxXz2qbyMZlChnMUQ6zp3X16+sh4ptB0rSOr7I36Foc6UVxdp0VhoYwkRfG3gJ6OJfKYIqFS3VAdy8Jp9AJT5Jct/9BoqogdOGMrsyqw1WNYm09UPfnzcDxkglQhp+wd5Xi68xwRR0gegf+PBVcNejZFD6ZeqOhExymqKEpFtVUGfoZZ65UVl/rh+Cxqn22VrWnszanP37VO+CuOXNT3PRwjTRmy0HxeJxBOPU7Zh8jkOxpK5tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/sAuwmIGdSamct0yEWyTSRmcHpvIIWpeKWMzcNbqtM=;
 b=b0kb+KsHMRViQxKZqJZCI8qsLliJvnOOQQRw2t5wh+CIz2sf+EGO3Umm/qcwKgOnFpdvw4wTcGXAgV8Z1i3WaGxMC/bVe2MzmFwpohddMu+zPh27xzwHNQd6AwegzfwumgFPLM2eNaed40e9eOro7l8cifU6/74JZIk87NYdlBfDDT8mBSHkN2RaVuXVmmIn+Lx4MklLBEaIX1bIqWkpTwC8mQHGFxO8EBeR0eNOEbz/dm5zeICTG3N7b81IUkxpnluHlewZ69QxAAod+mf6AVb8RuAr35hyLE/Px5KryX+g8Xl59q/Zqs3qGACmH6nzizrJWA3ew3ZSpkuZwfXc/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Sat, 20 Sep
 2025 13:14:52 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.017; Sat, 20 Sep 2025
 13:14:52 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 0/5] remoteproc: imx_rproc: misc clean up
Date: Sat, 20 Sep 2025 21:14:33 +0800
Message-Id: <20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALmozmgC/3WOyw6CMBREf4V0bU17ebWu/A9jCNxepAsoKYZgC
 P9uIUaNweVMcs7MzAbylgZ2imbmabSDdV0IcIgYNmV3I25NyAwEpELLjNt2KnzvHRYIHCpdmlw
 pqBPDAtJ7qu206S7XkBs73J1/bPZRru0f0Si54CbBrKakTLSMz93UH9G1q/WF5DuIEEgQG9SY0
 Q6i9laIUEkVS5XWb2Q9O8L3wd81CCiUmSCoUOTafNBlWZ7nZWwwRwEAAA==
X-Change-ID: 20250916-imx_rproc_c2-2b9ad7882f4d
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758374085; l=1971;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=98gATFBx0dzYYaKLMQIusZXTKYuy1ePGpya0sT1cTO8=;
 b=Mx3Da8hyJhccuJEyTna/dsnAu5J957AMym4uPMmdIywsM2kEUh5fZkxwsnJ0FXe4qLk8dRXhl
 dsm5DxSPyYKBCd6S10wm30lsPOfliTZ3KN+6Hscc8clszRv0jqcfHC4
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SGXP274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::15)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e01cb5d-5e38-41ef-343b-08ddf847af26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmgzdFd4VlgyR1RyQVNOU00rSU0xL1dCVW15VExNMlUwSHQ2by82WEN5RVVT?=
 =?utf-8?B?R1o0cE1xNXBaenNsSWx1dUtPdjc4ZktPM2VQSU9rRUNHTG9GcmZRcStwbkNq?=
 =?utf-8?B?MTVRZkRWdDdlanA2K1p1VEFrK0FpRldSczViN282eUdaQURCdDRTNk5VYjRa?=
 =?utf-8?B?ZXhnYndPZ21zejJiSU1WUWZQd2xiSnBmVGtZMVZ2dmxyYjFualFIWDlqZVYv?=
 =?utf-8?B?TGVITmZlOUJydWlrRmtKci9YbU9OTmxYM2xTL2xINGh2UXFUZUxLeUo4dkJa?=
 =?utf-8?B?Qi96YjZmZktvMDNCMlJaVXNRUWprcDhVb2hBeFUzUXU0cU1Uc3ZMWVhuM3cz?=
 =?utf-8?B?ZGhJckl6WVpwMG9VbUd2TEpXdzJObzVnTG1qTThyZm1zV2I5dk5FYnJmUGZW?=
 =?utf-8?B?akxtam5OVW1ld3A5ME15Qnc1ZW9TQW9zN2dCUExVaU03SUNOcTNrWEhBVkRM?=
 =?utf-8?B?b2d6VXJNQWFEVnFDekhtL1lENng3MDhDZms5cWhnTG9uVjNCMG9OMjdWbkxY?=
 =?utf-8?B?ZGxiNUhEWkM1cGd5N0pLNTh6c2l2cEwwNGxmVGpFQ3YrV205S3k4Z1dXd0NN?=
 =?utf-8?B?K2pLcDRsRUFqRHJESmlNU3lQN3c1WjFRczRXTzZ2U1hUN05ORVQ5VGFGR0Mx?=
 =?utf-8?B?Y3pRMzdzcW0zRlVsYnc4Q0xDR3lyenZrQUNaK3FHUzhIajFkRWhrL0o3a3F2?=
 =?utf-8?B?elFxR0UrUS90L20zdENhN1JkMGZhbXRoSS9LTUFIcnJNeWFTaVRFb2xUay9t?=
 =?utf-8?B?bEk0R012aDU0ejFXS0E0b2daZ2hsV1ZlVWtwTTJkWE9kUk53Q0l5eS9XQnN5?=
 =?utf-8?B?N2V6Slg3YWtlZjdDM3NVQnlDMStqWkVMMVJmTjBiaFJhL2VnU0lick43dCtz?=
 =?utf-8?B?TlI3dDE5bDByYVJjS0F5U1kxV3Zrem9OSmE1WEN6RHlyRGNTNnQxQitSTlZv?=
 =?utf-8?B?MlRscXdtMlZKRVdtKzQ5Y1RNWGFtK2cyYTYxbVNpL21CZXU2R29tMGluQkRs?=
 =?utf-8?B?RFRQNi8vN1k0WndNa2NCb1UxTEh3TjFjSVN0YnkwVUxmQlZ5MktNcTBhWmdY?=
 =?utf-8?B?aHJwblI1RUw1aFcxUXluVWNJclNHbllmQ2dQNXJUMjMxTCsveFB5bHMzNlRv?=
 =?utf-8?B?QWlTSnpYbSttWkkzT1RTbWlSYldzYnNNa1ozK2lvL2h1M3JuVmQ2akhvbVNs?=
 =?utf-8?B?cC9xd1M5MHA4S2E2SmxvZlNyRFRIVE9EWUo4OEJERUVuRmdFRjcrbEtaVGZy?=
 =?utf-8?B?R2Q2QlVzSG91RGtUZmdTYXdoOE5Udm41eHVuTEcwbEFXSTRlWEpYVU4relJS?=
 =?utf-8?B?SjY2SmRQN3ZrelZsSzdSS083Q2lMVC9Ra1o5R1c2K0FHSVExcWc2T09aVW5L?=
 =?utf-8?B?Q29qZEdmQVpYWlJGZVZiZUc5cGlhYTFzdzFEdHNtNXVSR1BEaXBlUThhQ1Zz?=
 =?utf-8?B?Rk1QcEVTeVQ4VXY2ZVlKZGZWaCtTOWlFR0VmL2s2ZXJFZThkbStiSHdRaTNv?=
 =?utf-8?B?Sk0rRjZsYVpPaTFpd1E1OFkybm1wYzBaZDVLak1YMGVISTRuanJNWmVpTHFF?=
 =?utf-8?B?a1ZqdFpLaXJJdUxWMW90Y0IzalZMcXpraVU0Wm1RVUljaFdjY2hiaHhFak5G?=
 =?utf-8?B?czBuZVJFWTRFTEVFYmZRSnRoM1ZVbjUwOEFqK3JnNVdoOEhDWXE1WWZFUS9h?=
 =?utf-8?B?bE9GbzlyeElJZjdPMGg0em9WRk5HTm1vMnVSNW1MNS9wSmFpS2MzRDBodHJq?=
 =?utf-8?B?dmdyRHB2V2w2enZ6MjZGTTNsRzBLeHlFY0o1MjlSZWRiMnV2NEhHaksvQVdm?=
 =?utf-8?B?a0Y0ZlZPdEdZQWx1ZnlmVUJWcmJaWWtkMUoxa3NyL3ljS3ZTYkdLRFZYWmFQ?=
 =?utf-8?B?OFVFL0ZrSjAzbmtySWlraDJ4MXlHOW9UL1lMWC84amJUMy9BRDdIaFgxKzNP?=
 =?utf-8?Q?omSf1n2WQ5HH20rT7u2iRRvaBNiHkLM3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDJ4RmdQcGZTVGpIY2tLQXNlU3lUUHpXUU9mR0F6K3hhcW55RklCQ25sM2Rp?=
 =?utf-8?B?Y2VQOHU3WlRKYjIzeDFsRDZ1SjhzZGh3WlB3YjBhWlhjaW9ZSjZ1Sjd6SFQ1?=
 =?utf-8?B?VFpIekNvUGZTNE1qMFhUUmZxbGYyQWlyOVQ3OWZjbUM3NzZQY3dwdGhDSXhz?=
 =?utf-8?B?dEZtY0ZhVHBXd2QzRk91eWJVQmZ3SHNsaTR2UWFNbDZxTEhEL05CTUlYZlR2?=
 =?utf-8?B?S09kdmxzSENDVmtwanI1VTJZMGRzNVZReGR4S1c1cnl0N3lJQXBiK2VaaXll?=
 =?utf-8?B?dWdFZjgzWFEzcnkwTWhRVjB1VENPZDdMcGtWL3VhLzljaUIwNlJNMUF4akQ4?=
 =?utf-8?B?eUVEZm1BQlo5dnJhUm9rYmRjajJBbXhUclJiK05lQy9QVTNQUVNRNVdBL2RC?=
 =?utf-8?B?aWR1YXhqeFlDS0ZRRXU0Q1k5RDNPRkE2MWhDYkUxV3lqN3duN3hxaVptdmhU?=
 =?utf-8?B?Z3luYVhKRDVIcWVISkNsYTU2T1BvR2NvWTB0NVYwanQ3SXdqOStwb0RUak5X?=
 =?utf-8?B?ckRqZGd5cU82c0V1WTJwTjQrYUZuK1JVVkpEV29kTHFhZjV6UytOTkoyYzVm?=
 =?utf-8?B?WVFSd0FRM1RIa1hVVnBjNS9TVktqQWRHZmNZeUpwWnlMMGdROGNkejlqa2RI?=
 =?utf-8?B?MFdhU0hyMGhwM2FRdWVERDhWRFdwamd5d01pUmZlSlJKaVR2WDNOQW10MmVm?=
 =?utf-8?B?ek13UUtKM0xEeVJBaC9YVk05b1JDUnR3WFJkTzdFMWRmUjN3UUNocHlHdDNB?=
 =?utf-8?B?eXQ4ZDZ2V0N2RmlDWW1BcnE1alJBaUt0YlVyUlh5RWhYeGJuenRlbUp4NS83?=
 =?utf-8?B?aWJwNUkzUDdWS3MzK1MxQjRNeGhIa1NBUno4VmlHNzI1WDQzZGZGTDlMWklD?=
 =?utf-8?B?Yi9zVEtHRFZFMU43VFlKeEExTzR3VEJ6T0lDQVVIMklUWUhTWTJyQlY2MUJJ?=
 =?utf-8?B?VmR3YThiMGhPRjB4VU9JamRtVmNhcUpVay92R29LSW5KOTZiNHZZMUZzMEdh?=
 =?utf-8?B?NWJhdzV5K2hQR3BXRjRmUSs5UDVPQkFwd2FVVU9IRnBsNFVieURrYi9IWWFr?=
 =?utf-8?B?L2tYSE5oK003dGlISE8zRDhWUFljZ0I3dk5RNmdXZWlMbWwxanI4T05wYVBZ?=
 =?utf-8?B?OXJEeVdaS3FWRjlSSzBaOHFUc0lpQTBPalY2WlphMERzYlhFYUtONGtQYS9v?=
 =?utf-8?B?dGVsV0N3dEVXZlB3NUtmWVRJMHJURkhQdURFa1VMTTRhaHBVam95WXVjQWsw?=
 =?utf-8?B?S1FyTFV5SDl0aXFzc1plZi91aVlMRjhrV2hscksyY1psaENUaU93bUptQy8z?=
 =?utf-8?B?Qmo4VlRLeUZCQWtORlJDWGxjaUlEMHBwWnJNWWpaL04rcDNRU0VUZWlNM2dp?=
 =?utf-8?B?Uk42RCtvVU5QdFJ5ZGdiVXhCZ1E1ZzU4UHhFS1VxWjByZGpsbWtnV2NIUnBP?=
 =?utf-8?B?Zm8yOHBTUEF3eDJDUWoxMldydm5xQzIvOXg2YjdhYkZiNjdzc2VJNTNYQnln?=
 =?utf-8?B?Z2VJR2VERFpha1VvRUJnZ1FHYmh6cFJIWFR3UVlTVEtkY0NjWTZoczFTWFFZ?=
 =?utf-8?B?MndWTS9KOTIzREc1VWhlek9CdXM3UlhzdytzajFyVVZIV0xNc1pxcDV2RVZz?=
 =?utf-8?B?eXRicWZqc1VKNUpzcXVNTmhlemkvcHdVSUpkL29qWkhYKzVhbW9QcFArWnZ4?=
 =?utf-8?B?bHRLbGtNUjZrazROTS9IQU14c01JclZIUG1iVkFVQmlON01mNTB0VENYK0NQ?=
 =?utf-8?B?dU8zcjl4a2FlNXF6aWVtMXA3bGhaaCtkTlZCank1dHFrMEU4Q0FoVGYxQ2dB?=
 =?utf-8?B?eDdRL3BYSjFMZk5abEkxNXZFcEpYc0J0b090U0ZHNEtRaEdmUzlhQlhhMVB3?=
 =?utf-8?B?NGhLN2R2N2ZKVDNCV1NqdlNxNk1JR1UybndVUmN3YzFKRzNqV0NhVFZPa1RY?=
 =?utf-8?B?Uk90NGczYnY3dlZheldodE1oUWJuL0tER1BMckZqNGd2d21ZdjlvdDB2ODNi?=
 =?utf-8?B?NWdmbjI4ZUtKRkZNd1RZWGVqY0xYYTArMENpWUJXKzdoOHJiRE1WdWVXenpj?=
 =?utf-8?B?NE56ZjBJOWI2L3NsamVrL2RTbzlxbmtTQjduMDVkNjloOWR3Ukg4djJ0eExI?=
 =?utf-8?Q?6i1L3cLbEscRlj2U7XOZ1gxqJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e01cb5d-5e38-41ef-343b-08ddf847af26
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2025 13:14:52.3555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYzgnz1u+kVrujFsQQmp3KtUtZGJevBy1jLFSXVcYFx21A8s1KwQ45jJQxtc8gvq87BKTBbwjcw89zS5qhLkZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8833

This is the 3rd series to cleanup the driver. This patchset is based
on the 2nd patchset [1] for the clean-up

Patch 1: simplify clock enable logic
Patch 2: Add a platform detach ops which will be easier to support new
         platforms
Patch 3: Enable runtime for all
Patch 4: Drop method assignment
Patch 5: Add an MAINTAINER entry for i.MX remoteproc drivers with
         Daniel and me as maintainer

This is the last patchset to do the clean up for imx_rproc.c.
After imx_dsp_rproc.c moved to use platform ops with swith-case removed,
the method entry from dcfg could be removed in the end.

Tested on
i.MX8MP-EVK, i.MX8MM-EVK, i.MX93-11x11-EVK, i.MX8QXP-MEK, and i.MX8ULP-EVK.

Thanks to Daniel and Frank for the internal reviewing.

[1] https://lore.kernel.org/linux-remoteproc/CAEnQRZD=1hxMmR98qfpoH_RFFrSrYMQ6ithFkjyqVgtqWKB_+Q@mail.gmail.com/T/#mc08d4cbf10e913d9e680ed93f5467603be37228a

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Add R-b from Daniel and Frank
- Update comment in patch 1 (from Daniel)
- Update commit log in patch 4 (from Daniel)
- Include Shengjiu as maintainer
- Link to v1: https://lore.kernel.org/r/20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com

---
Peng Fan (5):
      remoteproc: imx_rproc: Simplify clock enable logic using dcfg flags
      remoteproc: imx_rproc: Make detach operation platform-specific
      remoteproc: imx_rproc: Enable PM runtime support unconditionally
      remoteproc: imx_rproc: Remove the assignement to method
      MAINTAINERS: Add an entry for i.MX remoteproc driver

 MAINTAINERS                    |  9 +++++
 drivers/remoteproc/imx_rproc.c | 88 ++++++++++++++++++------------------------
 drivers/remoteproc/imx_rproc.h |  2 +
 3 files changed, 48 insertions(+), 51 deletions(-)
---
base-commit: 872c1e97ca571f8e1afff2659006a2948b9fb483
change-id: 20250916-imx_rproc_c2-2b9ad7882f4d

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

