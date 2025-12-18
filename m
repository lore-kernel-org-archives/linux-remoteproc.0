Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013026.outbound.protection.outlook.com [52.101.72.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B67319D8A8;
	Thu, 18 Dec 2025 07:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766044297; cv=fail; b=V3ZcpfdqtbzUW9ifsnA0yUfewXrVoUogaYHx5bEEmYeb3F7Qa4S3oeh5IJfaMdumH0sUDP2MQBT7eLKlqC1xEmqNL9KQcB9XGEhEGy0CNKMQWDI+dKMODoeIhyRHKL1PIxYl3EeCgFeRK4FwK3ywWwIYI7NhkvjfD9jn+t+5wxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766044297; c=relaxed/simple;
	bh=LLc6Ch/I4ygITgQCVDgtx1leVb8sfB5ofRtVEf8N9m0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=nSnkngj0Cclo57FDFjEQB8bvCH14RdLsuFVyoHiJDgfK+ib1GJsaWX6nR9JO4BekfczKYd6IFQMOW/Qh1b/oKg3wOSgfsMShjz9evI4Nb4iW28/ZK79QoW5TBtLdAWi0jMJ1nf4Uq3+ncaorC6E5BLi/EQ7tObksZVyHEN2yjhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hwKOrf8i; arc=fail smtp.client-ip=52.101.72.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hwKOrf8i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJ8/xcVfoWgSkll37Rpu3PdmEwRVIdmyJfuHJB9nyz2kOPkkpiO9N0bg4/BEXQS166NSawT6RtthxdbNDNqE7Vvlf6PJIlfTtbOQsI3+kvc/L1dtsKVLslbKxW4K/a1eKVdYg8bU7NexKifuGWaDIgCvuiPZko6HzbAGz162tfHrE5ztO1zIIYh0z5vHE9C93e4d63OyThFrNzpYx3ttesZALS9QFT/bW+L8HM2Qe4l8yuXOzoG75Tzv3dZzK08/gBEHm0ZLQISiNPMSMDVAJ9bubn39iTRmyad6o2V/NyfW2z9/7r022jU1KAWTWix6yscF9WP6/Qnj5mHyTLp+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZ1ZL9Y4le4+fxs5FMQnP45TksBtmC9FytXurOXY4xE=;
 b=pRLYhE5mGSp79EfAOGUfmIWoVxCtnxnDHMRK+OqINVJC5dF1VM0XWQ5o9iKJRC5POBggxEjuQvrARKdgjU88EmK6VcDl/ptQvprMnm6K1kmhtm4+1azIOyAm+4/CKDMKbyY7fNZeRbI7UV99BtnNbf7NwQwM+FnaTPorqEyeBareOtuWvzuA86wQSkaL/HLoiPxyJGb/OsMaVCOaADhraJiOFOsatwOIldJemRMgkDouczWgtIXYZioDSfeEkY352Y4MVheDbncYxtyW1smUcz0709sQ6axdWosWawTSt0+OoaADsX+Cxbvgo/catAtH5bUlUs7ZbX81ry3SctNbPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZ1ZL9Y4le4+fxs5FMQnP45TksBtmC9FytXurOXY4xE=;
 b=hwKOrf8ierQ+jprkA/XYPMINn1aUA+YW0paQYW082RE4FY9vm9k4YI49lEvec/40latLp0XT/mQU7xhqMnwz6/PHSpu5EvHUVLcqNH454B5Apev/5foc7RndC8GAfrVFs63J2eOUQXGA/95kJ/55ih0EqgGn0/zgjs0hfG+6JqP25bgjOFl959rlTPEc9Je95IkjJIBhAuD6LI99n/JwE8E4npH8tntiNl+qOOiLjx/2D7LCc2yW0Nh0MJLKnqoqwchZIFw6zyUvAWMt1YtKvR1J5A0YftZZe9CVAzH/0NCfV1dYZA/qAjPZqGqGatvciAq3e7rPz617naDN7IeoHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PAWPR04MB9839.eurprd04.prod.outlook.com (2603:10a6:102:38b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 05:18:15 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 05:18:15 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 18 Dec 2025 13:17:36 +0800
Subject: [PATCH v5 2/5] remoteproc: imx_rproc: Add runtime ops copy to
 support dynamic behavior
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-imx95-rproc-2025-12-18-v5-2-b56a27d4158f@nxp.com>
References: <20251218-imx95-rproc-2025-12-18-v5-0-b56a27d4158f@nxp.com>
In-Reply-To: <20251218-imx95-rproc-2025-12-18-v5-0-b56a27d4158f@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGBP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::36)
 To DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|PAWPR04MB9839:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a93f1c-99e9-48aa-6579-08de3df4d893
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|19092799006|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bDdrcTJxQVRMbWRVMng2SUpHQ1dNVHhKcUozNUlEMDlpYmlKeDY2M2NrY0ht?=
 =?utf-8?B?TWZIRE55NFBQdCtDWFdQYTlXa1hjZVNFWWd4aWVyRkFmMHlTU0pUMWowTE5R?=
 =?utf-8?B?QmpDNWdFVWIwanJicFAwZmFvc1hqTSthTUxkZnR6dkdpdkhQMGZ0ai9idG5x?=
 =?utf-8?B?L1pJNWlwRC9Jb09qQUpYZHBCc1podzIyc1NTV3c1NU4vaUF3OWMxLzMxVVhh?=
 =?utf-8?B?UktwTTBRRHhIcTNncmQvVjJTNVNRUm5Gb0ZUY2pKMnNxcmdtaDQ5SFRBd1NJ?=
 =?utf-8?B?S0tJRFVkOE9xU1VUdTJnazNzTTlhV1d5S1k4bFlKczNtMVBVeWZwZExaUElS?=
 =?utf-8?B?R0UzTHY0b1Bxd0ZmbnFqbkNlRUdmRnNoeE5leWFvWHFhWGhuRThBMFU0MklN?=
 =?utf-8?B?ZFF0dWwvVmVjTGFzOFdXdTRpaHUrNExlZ3VWMFZpTVBhWUwydGRzU0RoZnZI?=
 =?utf-8?B?S3V3d2FlajNlZWpIVXByaUp2RzdNYXZtSHlpK0crWExIRzByQkF3cGhVZmE2?=
 =?utf-8?B?YkdWdjhFT3BnMllUOUkrYW9HZkpNZnh2ZHhyNkw2SkRxRFBQa3gyRzN6MVdy?=
 =?utf-8?B?VWtlQ1V3TVVSTExOdkZ2bnNOc1luUW1RM09EQnMwQzV0MUpleTZmRXFSNFM3?=
 =?utf-8?B?TjAyV3V1MUc5Wm9GL2MwYmZSUmZRbW15ekRXQ2huWlpCejRRR0FCakI5WXZU?=
 =?utf-8?B?TXFzUFNvcEtyQXpwNDYwd2hIODJLSU1ibVlVZlVaeG1KamlVUXhpQ2g5S3V0?=
 =?utf-8?B?dEQxN2dTREFpa1lldnptU0g3K0pHQWJXb2xkY0E5V2ZlZUVESDUwbzhwLzd5?=
 =?utf-8?B?YzZrTVVrdWNKZmtwNnpYV3V2dk40bEo5M1UyOHRTQ2JjTkxPSFpXQXowbUJ6?=
 =?utf-8?B?eWVtU0w4c2RNVFluN25hQ0hRazd1MGgvZ1N5QkhBdm00clV4b3pkT1Fxc2NG?=
 =?utf-8?B?L1hEZDNkdzdpb3laK3FHb3JTb2ZCZ1IyYXNlUW5qcXV2MnpTc3NtR29JNHcz?=
 =?utf-8?B?b05JWFBLeUZaaFp6aURiYkowc2RIZmRkWGJXNkJzbUJoekU0NmZNMllGczUx?=
 =?utf-8?B?NTB4UUIreHRBb25vblBPdStVaWg5MTVPZk9pWm94OUk5U3d2NmErRTl5N0pG?=
 =?utf-8?B?bTUwR1dnczdocStvbU5LbDhQWUF0OEVVL3VDM1p4Z1lwY0hEYTFkUFBqeDhV?=
 =?utf-8?B?QUFaSDd3ekpvVTE5a0xBd0J4VUlaWHlDbTRMaVkxWGxsMVJRVWI2UWxPbGlO?=
 =?utf-8?B?OC9rUEZxYm1VMExzWWxiUUJlNkhmMXh3cUVRZU1weTRSNjRzN3VTS29Uck1i?=
 =?utf-8?B?c3g0Rk5hME1xRm10SXJ3S2dsTUNQTCtSU2t3K0hJaktsM1VVbWtJdkxiRjd2?=
 =?utf-8?B?SFJEQ09FYUt3R3kzMnpXaUtWUnNJVGI5QkRvZ21ZWXhRNitTUy9vSTFZbGYw?=
 =?utf-8?B?empEU2VqQ3dxeTUvdjQvLzJzM0Exbm05VG5YWnlkVHIwdytJNkVpTHc1cnBs?=
 =?utf-8?B?MjBkZ0N1SmRZT2tCUmhCYS9HVHJCWEdwaFdwcjJNbFZNaTRBQUhqWWliMHV5?=
 =?utf-8?B?MS9seXpIMmsvTkcwc2R1ZjdTcFg0U1A2blNNTVZKcC8rbFlHZElTRHF6V2xF?=
 =?utf-8?B?dmoxNlpJbTlLWEU1T1lwMTRwbjAzWVV1Z2xvQWVPSFNOOWNQUHdJQkt4bytX?=
 =?utf-8?B?MEFXTXQ2cStPZ3RRSmw0VzFlWmpLNUdOUVRFZ2NJeDFVWXdiQ2pYYWRIRG5U?=
 =?utf-8?B?SE5EbWVvOFRlR0t3WDVQREk5bFI5bER0T0pDdUFOKzJ4TFM3eVBqNVdFKzhN?=
 =?utf-8?B?Wmx6NWt2ZWlFL3ZFSGEwWnk0N0k0WXRWRlNZQTZPdXowQ1liTWIzYTZ6Vm9F?=
 =?utf-8?B?MzRFWStlZDVUYmZraTB3NXVGV3NlTzFSQTVtVUVoZ2VlSEI2a1lRa0UxY3hm?=
 =?utf-8?B?c1VIR2ViSWNNSXFmN2tkZWZuN0Nya0xsZG5Zb2RVbGREYWh3SjZrZVNPc2cx?=
 =?utf-8?B?a1hHOWk5ZHlhUFRXTXE0V3ZRZUhlenJvd2hTVlV2N0RNWHNySGdYSGR3WUpY?=
 =?utf-8?B?SlhCMkV5STRsTEhmL3d5MElZa1A3V2ZqMjQxdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(19092799006)(376014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1pkQVV0SDRKdUZZZFpYdjNKbkZhUlNyT05Rd3hXa3I2VjRiWlN2b2YwbWMy?=
 =?utf-8?B?RjhReS9OZ3R1TWdwZTJGcjNqQmcvNjV2RUpZRmtEQWt4UGgvYlZWbGhydjFh?=
 =?utf-8?B?QzVFMHJFMEw5RGZydXUwWm1sQWl0NE0wTUE4NXBGSnp1NTlHNGRlOVFJODB3?=
 =?utf-8?B?T290NThpSVNRMjBFTmxhblN0ZDkvRVRtMzhPek5lRUszMEREYWd6RVB1RTNy?=
 =?utf-8?B?YWpUZU9xR09HVFBWeTYxcERucGZaOUxLTkJZMnlQUGpsS1owak1TMC8zVFp6?=
 =?utf-8?B?YlFLTVVrVGhNaFJpbTFKZGlzdmhjY21EUSt4R3VLa3h3VmRnY2ZXbmg0T3I3?=
 =?utf-8?B?SXFKaHk5bkFaRUZGcW1lQnJsK0ZSbjUrM2JDSldiNDVQRWF2YXZKd0xHSXZQ?=
 =?utf-8?B?dVVuV3RuNXVZVGpreTI5Uk5Ma2hFTkRzTFpmYUdpYzZ6ekcycW9iK09tRXYr?=
 =?utf-8?B?Y1hMb1cxNUsxeVVsTkF4SnliK0ZxVklEQmxXazY1cUZHTDVYWGVRajNkM083?=
 =?utf-8?B?OEM0Q09sTWxWVHF6OGRONmtqTytLS3BGWGpJOEJGSzBNYjFsOXp2U3lod2V0?=
 =?utf-8?B?bEJOZ1pjUGxnS0ZhQ2ptU2pMM2FrZ1orcldZNWU3ejYzMGVhQkJJRlVrTnBq?=
 =?utf-8?B?dktnV1FnZXZLL0k1NXpiczlOd3lKN0hkY3VnaElhRE9JMXRoa2w0MjFNbU1v?=
 =?utf-8?B?VmdQMXNua0EvYVgvdVRuNGZKSkRwRnFJNXRnbjBQWE4wcHl5aWloR3h5WEIr?=
 =?utf-8?B?bVYyZU5hRGNCb0U0YTAxdWY5NVpzRzhmelJOL3lZVlB6NklrY1pGYzNPQ3hl?=
 =?utf-8?B?TG1xT3orOGl0ZG91N1RzTWcxTC9NbzhrOFg1L2FpeUQ5eisxOFpMRytSaUVa?=
 =?utf-8?B?cjZwKytPUTBFU3dIYnJEaVBnYmJOeTZYd0szd3lIVkNoSXJNSnNNWnVnTnY4?=
 =?utf-8?B?bU9YTWtmVjBZaUJNYVpaelpycWNxWThCR0pqQ2pYcHlnbUtsTVRUVEZRaUc1?=
 =?utf-8?B?bWNUcExhTy9DWk5uSU5OaWgwclZuSnAxOEdUcVBETjEvVk90cWl3QUhhNWFv?=
 =?utf-8?B?eDZuRmVvQnpnRjdxUGpOWGM3bFJKQVp6S3VqeDhxQUREV1lXeFZVamFEVDdX?=
 =?utf-8?B?MGhvNW80RktSUDFtckhlSUUra2dQVWE2QnNUbng2SHo5aFhENEo0eGJqZ0sv?=
 =?utf-8?B?QmUwczFrOGlxaFJjbktPWU1qQzJTZ0ZqVGYvSTBWV2dmc1RpMXJFdFlPcEZN?=
 =?utf-8?B?UURMdVVCL3B3VXRHYjlJZzRVNDZDWVh4dy9zNTJDY1JmOTZ3amdGbGh6ZWkx?=
 =?utf-8?B?U3J3T2dKekpuYWFrYktoVGVqVVdoNzVjeXhCYjZreFlmWjNPZ1NZUGNySGtD?=
 =?utf-8?B?MTZmT0RKQTB6d2pOaVNhb3ZIVTBWUHRhcjdGV2hmcTBnWVRQc3dWV2RtUDFx?=
 =?utf-8?B?elhxMTlvVlJ2bzRvN0pmZjFOQXkzdCs0MkI4TVgwa3kxT2EwaDRJcVVoVCsy?=
 =?utf-8?B?QjZ2T1hvcG9oWUM2ZU90M01WWWVEUjA4eVdrdGhnYVdreUFwL0ZEa2RXMUFL?=
 =?utf-8?B?c0tTM0dFWStKWWZmOHdXTnpKL0VqVEZCclQxMmN2SWNvdlhtNmNUa00xRkJu?=
 =?utf-8?B?L01OWVEyYnRmZkRTMmdYUExLV1I0ZFYxNlVZSGJ3bHFFZ0xvVkZGSnk1a0ZR?=
 =?utf-8?B?ekFnWW9NeGg3aVVUU1d3Y2NPcHJXcFdVMFRRZWY3U29yZE5QUFJlbXFzYVda?=
 =?utf-8?B?bW1JOWJqcTllZ3BmQjlibk1yUEZORlFPUGYvcHk1YVRBUCtCR3N6SHMwS2lR?=
 =?utf-8?B?MVNENUNzbHg4MGlKMFJ6MDZNVnpCdTdFUCtJRTFOVU56TmJ2bGRxK3dMRHZB?=
 =?utf-8?B?NG5vMlN3dFFtVWRxbitnOTVTVWNoZi9EMXBwL2JrVlpRWmludS81cC9TK29h?=
 =?utf-8?B?QTZpVERWYktmanNaSVpEODZld2w1RndSeVcxSmpLSnVzZ1VkZEFINnZOdGdw?=
 =?utf-8?B?WG13aTVjNHJHS2poc3BiUWlTUVhRTTU2MFdvcC9OZitSWmtLSW10VE4zQldn?=
 =?utf-8?B?SUJsSm50NFFoMjdHRU9MclZCU21yOGxCWXg4U1phZlFvVzN1VmszYXN2cGxL?=
 =?utf-8?Q?rsBnL0ISLatSD/ReBIAwfXaG6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a93f1c-99e9-48aa-6579-08de3df4d893
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 05:18:14.9936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MLEpYU158zWMt3mTkqbQ141OCZvEtuLprgTB/PdM2MjTAKpUXWZ3XerT4zIn+PU/vkieLejZB5u2hLNtxG70GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9839

From: Peng Fan <peng.fan@nxp.com>

Structure imx_rproc_dcfg contains a const pointer to imx_rproc_plat_ops,
which defines the start/stop/detect_mode operations for a remote processor.
To preserve the const correctness of the static configuration while
allowing runtime modification of ops behavior, introduce a new
imx_rproc_plat_ops member in struct imx_rproc named `ops`.

During initialization, dcfg->ops is assigned to priv->ops.
Enable the driver to safely override ops at runtime without affecting the
original const configuration.

Improve flexibility for platforms that require dynamic operation switching
(e.g. i.MX95 Logical Machine ops and CPU ops).

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 33f21ab24c921135319728ead3d24f1833ea1d64..78659c8fb84d95f3d258c21af76cefea1c82850e 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -116,6 +116,7 @@ struct imx_rproc {
 	u32				entry;		/* cpu start address */
 	u32				core_index;
 	struct dev_pm_domain_list	*pd_list;
+	const struct imx_rproc_plat_ops	*ops;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
@@ -315,7 +316,6 @@ static int imx_rproc_scu_api_start(struct rproc *rproc)
 static int imx_rproc_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
 	int ret;
 
@@ -323,10 +323,10 @@ static int imx_rproc_start(struct rproc *rproc)
 	if (ret)
 		return ret;
 
-	if (!dcfg->ops || !dcfg->ops->start)
+	if (!priv->ops || !priv->ops->start)
 		return -EOPNOTSUPP;
 
-	ret = dcfg->ops->start(rproc);
+	ret = priv->ops->start(rproc);
 	if (ret)
 		dev_err(dev, "Failed to enable remote core!\n");
 
@@ -372,14 +372,13 @@ static int imx_rproc_scu_api_stop(struct rproc *rproc)
 static int imx_rproc_stop(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
 	int ret;
 
-	if (!dcfg->ops || !dcfg->ops->stop)
+	if (!priv->ops || !priv->ops->stop)
 		return -EOPNOTSUPP;
 
-	ret = dcfg->ops->stop(rproc);
+	ret = priv->ops->stop(rproc);
 	if (ret)
 		dev_err(dev, "Failed to stop remote core\n");
 	else
@@ -584,12 +583,11 @@ static int imx_rproc_scu_api_detach(struct rproc *rproc)
 static int imx_rproc_detach(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 
-	if (!dcfg->ops || !dcfg->ops->detach)
+	if (!priv->ops || !priv->ops->detach)
 		return -EOPNOTSUPP;
 
-	return dcfg->ops->detach(rproc);
+	return priv->ops->detach(rproc);
 }
 
 static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
@@ -979,18 +977,16 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
 
 static int imx_rproc_detect_mode(struct imx_rproc *priv)
 {
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
-
 	/*
 	 * To i.MX{7,8} ULP, Linux is under control of RTOS, no need
-	 * dcfg->ops or dcfg->ops->detect_mode, it is state RPROC_DETACHED.
+	 * priv->ops or priv->ops->detect_mode, it is state RPROC_DETACHED.
 	 */
-	if (!dcfg->ops || !dcfg->ops->detect_mode) {
+	if (!priv->ops || !priv->ops->detect_mode) {
 		priv->rproc->state = RPROC_DETACHED;
 		return 0;
 	}
 
-	return dcfg->ops->detect_mode(priv->rproc);
+	return priv->ops->detect_mode(priv->rproc);
 }
 
 static int imx_rproc_sys_off_handler(struct sys_off_data *data)
@@ -1040,6 +1036,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	priv->dcfg = dcfg;
 	priv->dev = dev;
 
+	if (dcfg->ops)
+		priv->ops = dcfg->ops;
+
 	dev_set_drvdata(dev, rproc);
 	priv->workqueue = create_workqueue(dev_name(dev));
 	if (!priv->workqueue) {

-- 
2.37.1

