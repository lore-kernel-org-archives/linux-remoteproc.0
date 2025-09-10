Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011070.outbound.protection.outlook.com [52.101.70.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EA6309EEF;
	Wed, 10 Sep 2025 07:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488363; cv=fail; b=eoEE/WFmgEN3kjsUDywRSw+s0l9BMFS1AJhp9ZcxTyV9V/0cWdHeE+buuYUuoRQYLOSRocKOJUtls12E3y2yuYkL5Tyy5VM0BnPMo7eNcTJtLCO25K9002RjUakbYbszHFQlsPZgPIdGWNKCmWzD+SMa/HQsuxn7hoMuLpcAeGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488363; c=relaxed/simple;
	bh=6bUT57s9fapRCG926oPzv2uzLrH2NhQ1Hw6lDEDb254=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dVFckaliDp974q2iHsIJx7H486F4mzZVmDpZkdZL0HuieYhSGN5RYHqmvKUhBt34ij3k++Osp0AoCfVBhmNUvxgFr7I4OXvCdwC6gnjgQvTQLRuF8b1Mo9Sh1Z8u+6or8miihKh6y6ukRi99zayU4BIYf4BcqD6kjQmn1+gN05o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=L0+OwibT; arc=fail smtp.client-ip=52.101.70.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="L0+OwibT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cz4WIvQd7d6T2ihcgMHmpamz7LijTGnKHtLHUonJblDHom/pNlPyCZRmaGRjgP9pn/u88xNEgNh9ha3Ls+lhQpXJNYpkzm4QkS4pzGe1jKlIxOxPnvrxYYthx0U+4ihNc0nocXYv+1dzBSZTpmFLjhJI0dazh2oKeKDN6D3r6M6OC1QLSjPqlb3sNhnOBaYrCOpEsc0eHLl0YViCRsvUmOTXCHhTC/d3P3uZq6AhK5P0M7pSB5Ye2PWGbyQO5wHJ60NG7VwsMbcm4MjZfI9Fyy3WSgzpQrDMEPIeY4jowIfYN7uPvIfdB47yHPIPWLoiF1Ahz0BZogSCd86uV1RRKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxuOz1cJ7Yy+WziRSFQ+FYeaQapncnxwqIwD3jZRdmM=;
 b=aXmxIHX/8vflYe1RsZaei4016GyziyQ5+wSDmsb8xj9f87jjOIKjoGCECOW7RTZcy9bgMm5nXBmrh0DZu71KEGhwhZemYAYr1qCUwrouftPLBUQSCjjWO2jwgCt8CacwzMxEU4GQxHrR//yNhx4qIfjIt4w1q3ihAuCTZwU63ee3dPfhTaePytt141Sye78h6YvFhvg+/ligxwl2hyJTdhaon+DEzcu4H9FwkOZVD1m+ZXG81/5jQ923UUef4OsCp3jMJ5SYOyIX7VS6MWcMSGI9EaOmZYy6haWTKgfobBwrJcRgsGeIvwjR/lemtia/6r9/KMa0K3mzBM8nwSpZaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxuOz1cJ7Yy+WziRSFQ+FYeaQapncnxwqIwD3jZRdmM=;
 b=L0+OwibTI31+b0OJvbiRuhmTm9i/VNGz/skUovRkLgX/XIQDDVn1vReI+RPwLLQb2gCyven0eQiAtwkIwC1c+LnN0niGLnWG3u8rHvPfk0UKp+MEvu0R1FHvcXNSEzXQilJInNi4SWm87MemnMTyY9j3CdVThsvQDWruCqMtiWDuj0kbkxYOyv7imvngNVgn/2fmXPQbmM8M1AjHcRWQMosfMa5UXN3L4rHOMPO/DdFB8Y/s1kW6y+bk3hrRkrA8MBwTjXdnLcEPrkiv9Q6YNUxNpMicki1qfytmGn+KLBsspEOb8OyNgO4xrfUEwziBSzlGB5EQu6sABESKF3TV3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9358.eurprd04.prod.outlook.com (2603:10a6:20b:4dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Wed, 10 Sep
 2025 07:12:36 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 07:12:36 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 10 Sep 2025 15:11:50 +0800
Subject: [PATCH v2 6/6] remoteproc: imx_rproc: Clean up after ops
 introduction
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-imx-rproc-cleanup-v2-6-10386685b8a9@nxp.com>
References: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
In-Reply-To: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <frank.li@nxp.com>
Cc: Hiago De Franco <hiago.franco@toradex.com>, 
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757488317; l=2326;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=6bUT57s9fapRCG926oPzv2uzLrH2NhQ1Hw6lDEDb254=;
 b=K+YlsDxS+mxD+Dey8D3G314a+8EvB+tfIDn4Ei+SaDgBhiONPh+JjlQJoWD1crJjgoH5/aI1G
 oxzdS00a1e1BBcr4GduAmbjoCSHcnqR36G6PoIOIQumaJuMiNntS+k+
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::18) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS1PR04MB9358:EE_
X-MS-Office365-Filtering-Correlation-Id: ea0f8fcf-40d0-4ea9-9234-08ddf0396b59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnVSVWlhVDk2NnlpcnVRa3FDSDh6WHU3U2hmNWo4VHNsWHI0c1gyK2JFd0tN?=
 =?utf-8?B?VDdjeldiazlBUTFiR1prRjY0YXJPQ0RTL3BxVWV6N0VUeHVnaXIybHIyYk83?=
 =?utf-8?B?N2ZueFBrcEdDbXhsQ01ERCs4VTlKUFFXTzhOeXdpOEVpb3JTbTZIU3JEYkdT?=
 =?utf-8?B?eTNBUnpVbkdha2VlaCticHl2RUp5aTBsbjdXbEdzRkN1OEVXR0E2aXE3T3ln?=
 =?utf-8?B?cEJxQnFvczhESHl5a3REZDFWdUoyVnBJeHJBNVBXYnlSeUpVZDVvb2lRaklP?=
 =?utf-8?B?VEhrUlpkdjVDenZSMWlkdmdCc3JUNWpoSXZHaFJuVDE1V1dVS0pLR1FmQXBz?=
 =?utf-8?B?NGNpSGNCTitSV0E5dkduVTlLemI3WGRSWXFvdmp6bFRhNjBlbFlsUFN2ZzQ0?=
 =?utf-8?B?Yk1vMTFxTlo1T1BkTHNWRVk4Y2s0VlJKdng4MXgwMkY4WVpNYU5wTmJZa1d1?=
 =?utf-8?B?NCtKdHhUcUszSHNZNlhEQmk1aUFtaDNmcTRxYWgwd0Z3UTR5d3pmeDFKU25G?=
 =?utf-8?B?WUU4M3RRUzVQVk4zNjBseDFray8wWkRxaENBNDlBU3ZoT1JBcExRcCtLMGZH?=
 =?utf-8?B?cjdKU2pEcWpHZ09tZEE5Nkx5TnhWN04vdER1aWpiVU5YT2U4Tld2NFZrV2hI?=
 =?utf-8?B?Y2VkRDJKTEg0cU1DMWdGOGE5Z2sxQ0ZaYWlYdzJsbUZwYmx6aWNSOUNMSDh2?=
 =?utf-8?B?QlJHRlloK2VMNDQzSTE5L0tReVlVVW1NdkM2NWhqamZYNWNxTFg0Y2pnbGNC?=
 =?utf-8?B?OVJjWUhmYVJsa1l5TUg1ZFEraDQrblVqczNjSjd5elF6d29BRDNlUkJ1U21m?=
 =?utf-8?B?YXVkdVNqZzVEYmphYThqNnVIcU9CVXRMU3dOYXVublUzL2RXVUJpRmxMLzJW?=
 =?utf-8?B?NWxnZStZL1JLZXZWVUJuaGI3bm44SCtlSnR4U0draTlvRWVPMlgzUFhtTmV4?=
 =?utf-8?B?dm9oNWZYQmNveC85eDRhVTVrd3NkMUI1U1BBTnZqcFlnTnJsemtUbi8wQWlj?=
 =?utf-8?B?Q09YZnExOUc4NjdnVExDYnIvTXA2dXNyWWk3MURyYXRRMW9wODR3TEVqMU9y?=
 =?utf-8?B?M3B2WmloK1JLTmZ0a0JDeUkydktXVEpKZythdzhFa0V6VFJnalJ3aW9zWWpp?=
 =?utf-8?B?dUtPM3lOcTVmem16TlBSQUlBdnBqOHBiOXhUNTZRc3B2TzZVMElJdngrYWM3?=
 =?utf-8?B?V1gwTnZMdC9ldE04T3FUS2M0Z1JkOHVCazNMYnNLcEJHVmgrSTFEOFp0V0xG?=
 =?utf-8?B?K0ZvYU44RVl2YndMTE1obzc5MEljKzI5UW5kWnJZelhJOFY2YWJPVVV0aG9o?=
 =?utf-8?B?eHllVTFZa3dycW9oNE9nYTFLYUIxV3pPckFaazRSTEFncGlLQmNJYUJkdUdD?=
 =?utf-8?B?QXhGZ2h0MU1GbzNZWEFKUkRaN2lOaUlJMnpzOVpXZWs5cm9NdVlPY0dONm5m?=
 =?utf-8?B?SURJRTJmeUNCNG96MHVtMFQvL2E1RVBVUXNSL1YxSzVnblMzZ21ZVGx5Qmpi?=
 =?utf-8?B?RnFxV3AxU29rbkFYdCtGSDM2aGI4VlIyd1B0TTNFUWZmcURTN09EQ0xBMkZP?=
 =?utf-8?B?aTBMUlFqcm0wNzRDbmxZL21oVFJDdGRLV2kxYkN2VDhVRlBNMkhOc2RyOUFW?=
 =?utf-8?B?QmI4akRWdmVTUTVsaGwrZzNzVk0xeFhqOVNYNzhISDgvTDdlREhyVHZZakwx?=
 =?utf-8?B?b2Radzh0TmpMK2JTMkRJYVRONUVWSE80TlNUQzFGbzlpbHFkYStzTDEwbmIy?=
 =?utf-8?B?RFdFWWdSWUprNGx2SkZPUVpBVWZhRUx5MUU1MEZreVFFT0pxNjhLelprUHF2?=
 =?utf-8?B?SGJFaXNKMjlKcGdUVkZBa1RIb3V3T0t2Z0x6WlNLRUVka0l5Q05ZQVRJQ2U0?=
 =?utf-8?B?RFFSNHhtRXVSZ3hKNFBjTStMR0gvUGRwYjRCaElxdnhya1BhOGl3NVpSWWt0?=
 =?utf-8?B?L0dGR25Qc3VKUnNHcm9KTWtjaE91UHdLN0ZNbzNuWWNNNlViTmZqdjVGL0pF?=
 =?utf-8?B?UU5jU1JPdEJRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enJtUzJTSGdBTjhvcXorQkxxZk44VGFOellUSjFuVC9vSmpaaHEwMjdzMzkv?=
 =?utf-8?B?L0crR2QwaEZqbVBBYXFhRWgzOVdVQURYTWwwdCtmZ0JEYmh1L2xUakQxMExT?=
 =?utf-8?B?emNJUlFqRllGaFJuUDhsUnRwNTRnQXdUVDZITzFMZE1Xd0ZXZXR5SEtnUUZ4?=
 =?utf-8?B?b29VK3V0cnRoQ092K2NBcVJsVDNYelpRaXFNMTVjdjV3UHRXK05YVTJVWHdV?=
 =?utf-8?B?OStpV3lwTFZybDR0cGNYUzJEZG5QanNYMmhtN1U2clNCY25vTEpaZUV1V2Mz?=
 =?utf-8?B?ZGhzNHNzZTVkMkRhOEVweTFMS3BYMHVFZFNDWHpYR29VbU1PZmtzZzA3aTJC?=
 =?utf-8?B?S20zaCtsRmsrcGwxWkc3aW50NjFqQzhoZkIwZDVTMy9Fa2lCZU9NMXQyRW40?=
 =?utf-8?B?MXpqTy9jdHV4NS8xS1RDN2thT3NSZEJEdUhMZHVZRHhoanVUNUVEODhlVUlX?=
 =?utf-8?B?SS95aFpNM0F6WjREaG1MVk9aRTVabnFXRmlIay8vbEZyeTRXRVF6SUlldXh2?=
 =?utf-8?B?VUlBcW9DMjhQdUtNTWYwWjRsVzJjRnFjd0hDczByRVliUDlySDVhTTc4di9N?=
 =?utf-8?B?a3ZtL0pMUFUxczRNMHh6VmlFODRtdmNKalZLVnE5WGoyVHJSQkt5VEg4Mkp5?=
 =?utf-8?B?MDBzQUFTek5FSk5VRmxxZUdvMkZhZWlhUmgyYXhaN2twLzNNS1gzNlJ4NXpm?=
 =?utf-8?B?NjRmUE9DcHFURWpVWGpqMkozVGh3MFlkVU9ibnVIeG45SWN2ampXWWQ2U2oz?=
 =?utf-8?B?MWx0b0pPbHZVL2Q2SDFoL2R3a2wzcEdqeXJ6T1o2bVJTUFVGNmRpMmhsbHk1?=
 =?utf-8?B?SFVCdnlQejl5VGxWVzVxb0haajBvVEFTSDNTOTdNcDJSMmo5ZUhrN0JNZ01N?=
 =?utf-8?B?QlY1eVFJSUJOM1JjMitSRUc4MlBVWnRkMHo1cG1TUndzWVdTTGxYbHU1TXlX?=
 =?utf-8?B?NWZkS2FPTndtOTRGbnN4YlhNUEo5V1pnSmVVcTY4ZWplcDZ4NXpoc2htWmY4?=
 =?utf-8?B?QnozYmhsNmU5N0RkSGFSSU0zMVdNZ21vcEo0UU15ZThMWjA3UWhGSWpHSUdi?=
 =?utf-8?B?NGNWZGNsRHhQbWZvaTJid3YwL3hUY3FYbXhPSHNYdDNFQ2NUY3RJQVYxRzdu?=
 =?utf-8?B?bUFxL2grNmsxWGhjcitsZjRDWGRrd1VKbkJjTlJlMG5IaUE2V3kydE44eEEv?=
 =?utf-8?B?MEJHbFdWRmVOcEpuT0VoaDFqdlRSanYwWWhDUkNvQWZWejJpL2QvMVIxZ3dj?=
 =?utf-8?B?TFlWeXh0NS82YWtyM0dLamRhQ3VHRmJCZUpjbTlzVWpCQ0FmcXZGTUJFRTlD?=
 =?utf-8?B?dTkwRnpxSXp1SUVvTUFXSjFNN0J5TENyR1NTZjFLV0g5YlMwV0NxUGVIcGpx?=
 =?utf-8?B?TkV3TWJubHRUUU5IaDlkeDlRZFFXZ0dneG14WDJJSnFrOWJEZTdKMlB6M1Ex?=
 =?utf-8?B?a0o2RFlsU3Z4dG1ObThPUDYrSEF3Y0ZxMysvdVZVYVBleGl6amhGaEM4QjEw?=
 =?utf-8?B?REMxV1pJZ09yZGZtY09zRi85UiszbGtDWDU5ZEFNZGFYbGh1bGV0Z0JyYmVX?=
 =?utf-8?B?YU9pdkY3OWw2S1pEdWVJRVdBVGRYRkRNZlNheUFqSFYyMXBIN1hpOEFpNk5y?=
 =?utf-8?B?eG5mLzdnQ0oycUNrWW9JT2FQZjhwNm5RdmNYT0VhSXN5L0I0T2lJb2lQR2ht?=
 =?utf-8?B?TWZnVU8vWG9vcmwyU3hzdXlialhYZ0VpR095MisrYVN0SFdlRHd1RzRwbUQz?=
 =?utf-8?B?cm5DNGhzOEFWWndISTNWdXpVV2V5OHJ5NGJzOGZ4OEFMdit6czF4eHhFMkkz?=
 =?utf-8?B?QWNTbmZSYkFMYyszQ1JNZVRRMEwyeUJzQUpjNGRFa3FXemgwS2pwc0E2Nnlz?=
 =?utf-8?B?SVJJZncvais2MHpza2JwZUpESnE0LzErSU5rQmNBOHN6UTBndmFmVXRBRGVn?=
 =?utf-8?B?UWJyM3I1NDVhcWwrbllVWWgrNDkwRUFNUVYwcEVOSVRzbTc2T2RiZ3lsUzBv?=
 =?utf-8?B?VENPdHNqOGMxeWY1M1RNdHc1QlRRUkNHcklzRk5HWFJTa3hQS0oxeHRVRy90?=
 =?utf-8?B?NG5NNXppV3VlNHNhR3JlU0FhaVZzazEvcW0xUzVoY2kyakNjeTh3MlZsajV0?=
 =?utf-8?Q?hOA6yWVgdIWg8eewT1qyLddKC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0f8fcf-40d0-4ea9-9234-08ddf0396b59
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:12:36.5302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SorHm9fKZyjDh5TnIRgofOH/YdjEppN+He3X9AWiwgNIQz6FqZhhh3UtP/bm5A6VkSK9Le4nBmzo31b2pMbzzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9358

With the switch-case in imx_rproc_{start,stop}{} removed, simplify
the code logic by removing 'goto'. The last switch-case in
imx_rproc_detect_mode() are no longer needed and can be removed.

This cleanup improves code readability and aligns with the new ops-based
design.

No functional changes.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 34 ++++++++++++----------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 5fa729f4286f6ac939357c32fef41d7d97e5f860..bb25221a4a8987ff427d68e2a5535f0e156b0097 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -323,14 +323,10 @@ static int imx_rproc_start(struct rproc *rproc)
 	if (ret)
 		return ret;
 
-	if (dcfg->ops && dcfg->ops->start) {
-		ret = dcfg->ops->start(rproc);
-		goto start_ret;
-	}
-
-	return -EOPNOTSUPP;
+	if (!dcfg->ops || !dcfg->ops->start)
+		return -EOPNOTSUPP;
 
-start_ret:
+	ret = dcfg->ops->start(rproc);
 	if (ret)
 		dev_err(dev, "Failed to enable remote core!\n");
 
@@ -380,14 +376,10 @@ static int imx_rproc_stop(struct rproc *rproc)
 	struct device *dev = priv->dev;
 	int ret;
 
-	if (dcfg->ops && dcfg->ops->stop) {
-		ret = dcfg->ops->stop(rproc);
-		goto stop_ret;
-	}
-
-	return -EOPNOTSUPP;
+	if (!dcfg->ops || !dcfg->ops->stop)
+		return -EOPNOTSUPP;
 
-stop_ret:
+	ret = dcfg->ops->stop(rproc);
 	if (ret)
 		dev_err(dev, "Failed to stop remote core\n");
 	else
@@ -997,18 +989,16 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 {
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 
-	if (dcfg->ops && dcfg->ops->detect_mode)
-		return dcfg->ops->detect_mode(priv->rproc);
-
-	switch (dcfg->method) {
-	case IMX_RPROC_NONE:
+	/*
+	 * To i.MX{7,8} ULP, Linux is under control of RTOS, no need
+	 * dcfg->ops or dcfg->ops->detect_mode, it is state RPROC_DETACHED.
+	 */
+	if (!dcfg->ops || !dcfg->ops->detect_mode) {
 		priv->rproc->state = RPROC_DETACHED;
 		return 0;
-	default:
-		break;
 	}
 
-	return 0;
+	return dcfg->ops->detect_mode(priv->rproc);
 }
 
 static int imx_rproc_clk_enable(struct imx_rproc *priv)

-- 
2.37.1

