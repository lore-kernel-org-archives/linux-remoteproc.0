Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013041.outbound.protection.outlook.com [52.101.72.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5BF279795;
	Fri, 31 Oct 2025 02:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761877537; cv=fail; b=aCzeRzHNHyhPRPAC6LulW9ZFhqR6TfUTR3TKdqHkCWpa+k0yuDuwNofzo9oS51TpqWOQEuFBQG+Tf1QgfS/R50RUpWDxcHFhW01tH5To3pu41C4GvtVPtbzZOvDIhL8boV6MVHp3JXaHDi8oc6QibawV5ZNlXTBp3eWLwKVHUZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761877537; c=relaxed/simple;
	bh=Gn8AanCwjay2JI77GrtpgXF6F5gweYuV9gKPS2j8sc0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Tg+335XdKQ/B9r2klInZv6m9Za3YW6fPp0qpCrZLYGkwRebT8eMuPXz3Q0KKnRQHYWVrMnk2g0JEimzkhtjpvTAYnYUehU6uiYOQt3RFk1snv4Uz4C5xw7jQfaw5+EOzf85x2eYSr1vox8xlzzUF1qYQV+Q8Ml64fH+1Qxcf37M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UwUHqqMM; arc=fail smtp.client-ip=52.101.72.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UwUHqqMM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7Hrbpx9LA+Z1W8vM1kV39v/aGKua8C5eZG7hqPBu3dAjbKFJB+r6ZoOtAsbiw3OopAPvPvKndHh+JlDhshZIpoL8wUmzgD+I1/sCe72mpy4q3yer/ylksS3QoU/Dv8fOuCGBImh5ZSysP0hZSDeST8wGgp/aAuap964shz9i1MRCnoYralmktevxZFaaGhIivqI4tm/rDWeBCAM722uXM2WocK92jIV7W1pshFkpOuM7RmKRUvbmWk+awKTkpBvuCnefRnu/dQr9hH5TRji2NDkisxjsnNLaw58cDyhFOiXlReudN/q0RsGZ3Ah0SPTEA6yMQJxR+9xoeP1g32aVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mq0NmtgjYej1VQuxWa5z1Q2xl6VISmwm3tPi1mnGGeo=;
 b=VxWxlYwRgdw5q87koC+tyyaTWEoeJH59zEd2o0Ozi80ZZ7vs8WflHoPxZbpyxXB9FfruCdqXjTBRTrhspemU1WyZFzXm5WFZf/Y5fxl8Lh5abR3KRGR0DsAoQoI3oRCdnAsjyoewN9P3v5vNtSphVkt/+0RT0WegEPq7r1XPvR5tM0ZuIgRWeE+GTK6SQRGwTXqePUBWLSJtM8Az5/EM/Bw8q/reJhp27ATb4mlvYKOiSlCi5j5kwk/P5mJ3hQ//Ucg+mGsbilP1HUXqdqGDnVFP4zTu3QNJSXeo3PaqS5Y8ELC6F35DBOe6JjNJhlR/Qwj8uUTnw8K8Pd5Ystkk3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mq0NmtgjYej1VQuxWa5z1Q2xl6VISmwm3tPi1mnGGeo=;
 b=UwUHqqMM+VO5tZpF0gyqfK5DoU2MYYkywYqg/IZqbVVyHmOdr4FaKVse0RFWz2ZbB0JSGYO43in4xn6I4BdGbBcP7jCt6UyZ2YzkKX9xWcF4ojpahDsxsFUL/ajkBfLWQM3fzjgu7Ntuo7rBWiXNMnSCFnXfTyVx0yrCEeCnf3C+rECeO8gzWRTLCiMxdKs3aB4OGIJsfZv8DGDVJdJrrttmo+ZA8dkltzB+E8zUQNZ3FUGhmrP4hmS/moSVcTDPnlj7Tr8tbKYXHY8uzm900M07b1lh+K4QyLit384ECw9WtYwwZrazbFyRPeMXAUWV9+bgrck+G6S3UqCUcjLKxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA6PR04MB11952.eurprd04.prod.outlook.com (2603:10a6:102:51b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 02:25:33 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 02:25:33 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 31 Oct 2025 10:24:52 +0800
Subject: [PATCH v2 1/5] dt-bindings: remoteproc: fsl,imx-rproc: Add support
 for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-imx95-rproc-2025-10-31-v2-1-758b2e547a55@nxp.com>
References: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com>
In-Reply-To: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <frank.li@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761877517; l=884;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Gn8AanCwjay2JI77GrtpgXF6F5gweYuV9gKPS2j8sc0=;
 b=OFzGGiaW05QTFnI4vHKC9URbVWTksw9fTQkbw9FQKUY6GKobYKI4KXSsRQ/Axbt3ZsngMHJRI
 5r05Vq37EYLDZu3XJxkytvoM7Y4iWle662GKpnJLbF3QiznEstBBpV4
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0155.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::35) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA6PR04MB11952:EE_
X-MS-Office365-Filtering-Correlation-Id: cd24e92d-d05f-4e6f-7c85-08de1824c4a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b0RBcWpTcHNUN01DZDN3elJZdVRQd3ZEV1JjT0dxM3JJME05UU9qNWhibkdh?=
 =?utf-8?B?UDVIZkRNM2hveXI4R0F1T3A5STNScVhiTFMxYWtjbEkxa2RxMzJ3cmpjbk92?=
 =?utf-8?B?aG1uOWw5SnExc3JOY0FaYUViRkI5aGVSVFh5eXJWMHNtOUFST0xVMUVtZkRW?=
 =?utf-8?B?azErSTV2Q2JmUlgwZ1Y4bWpVdnZJZkFCcmM1SEpJYmcrSGpHUndFb2NtNE5S?=
 =?utf-8?B?cklydm5seHlJSDZlakhoMlhMTTNzbGl3TXNiMytLK0RrOGVRMXgrZW5URExp?=
 =?utf-8?B?bmhPMElZQWRBeTJVcHptSTVkRXVpYitONm9YWVRMNmlBVnNVZmdMa05RMzJn?=
 =?utf-8?B?SWxIOHcrS1NTUVBUVzRVWWo4RytDTFFzeVFjbENkVGdNOHdEaW0weUJETk5v?=
 =?utf-8?B?MzRLRWYxK2lxNzN1dFNRQXBOZnU2MllqVEM5RkJmdS9MS3p6RW91VGNnWEdr?=
 =?utf-8?B?VkRLWWM1bHQ0R2QzRE1NSVhRV3RxZnBBMmlmM0YvNHZMRElFUEk3V2JaRENa?=
 =?utf-8?B?UC9SUG5CNldXY2JGenF4aEFqdU4yQzJldFhqcjBUcjNJc2Y0b24zT3Z6SGtC?=
 =?utf-8?B?b1FvY0k1aC93enVSYk8rYXlwc0ZRZ2xEM2MycmxpODdzemc3ZkplTEtvUmNo?=
 =?utf-8?B?MFE4Z2tCVU44TTUyY0ZtUGpNZ2FsSy9HNm14K1Mvc2lUR2xPVmIyd3IzOEU3?=
 =?utf-8?B?b1pDMDBaTWRSL2pMR3NDV1dPTUVhVFlnVS9FLzFLM25oS2pJN2MxVmRrM3F6?=
 =?utf-8?B?VzE3aWVCZHdpMWlySUxLaU1ia3cvZGsvWTBYYWFUV29Qa3FSRytMZCsvRFNJ?=
 =?utf-8?B?R05PamxGN1ZLMWJjOXFUcUtEUHNrdGIreXdlUzc4NDBHcGVzT29mSEtpeHNh?=
 =?utf-8?B?YlhFc2FRbC9qcisxenpLVHREVkJMMTBoZWNDM3RFVlZ6bWRHNW41MnlKV1kw?=
 =?utf-8?B?T2lGL3c1ZlBKL1lOaEpLTUxqdmxwNGhyTXRjT2R1NlFyRUpoU011YWttWHIw?=
 =?utf-8?B?LzlndUY5TXNOOFBrMWVhcXdiMysrQk4zU3JDVGhlVURTOXFxQVlQWEpQU2xQ?=
 =?utf-8?B?ZjR4WW5TbUZ5N0ZCeE84d3V0eGZnelhNU0tKQzRYY3MyOWlxUmZmY2ZKRWxP?=
 =?utf-8?B?MUdBbk1TbHRFTUFUMDArOTRURUsweUVxcWh4aGttcU5rTXpTL3VHcStScS9l?=
 =?utf-8?B?L1Z3RExlL2hIODZVS3I0bXoyeHFDWGtwQkVOekp6cWdLblZEUThnNENET0Z2?=
 =?utf-8?B?Q2FXMFZvZ1lUN3dNYTgwTFhPR3BQeDRhY0k5elVNNWk3N21wZzM0dGJRZHd5?=
 =?utf-8?B?M3QrWk5xOVAxOWllL2lXTmhnZmx4UEpLanE4SVQ0eTBtRWdOUUFyZnZJQjRU?=
 =?utf-8?B?L2drTSs5bHM2RW12WU1vNnY4UEV4c256WVNTc0RUaE15WGxGTlRna2lSeGJM?=
 =?utf-8?B?N3ZRem9POGplVitLR2tSdHdCL2RXNnlYN2ZDQU5WL2h1V0dLQU5rcExSYjMw?=
 =?utf-8?B?dVBPRkQ0Z0NDYzVyVUEyZHZnN1cvUHZBOUcrM0xUQVdWdU1tS0w5bGJRN3V1?=
 =?utf-8?B?YnlxRkVZbEtQV2VHcFBBbDZYd1hPTEZ2bVRBd2tiOTRwK28rY3hvL05xbTVX?=
 =?utf-8?B?eVhYaU52S1ZySDZiTENDQ3VLRUhuOGUwL2d0ekdUSWhGbENScGdYbUpySHpx?=
 =?utf-8?B?bnhGYkdzTjVJWHI5ZFUraHlqeldkT1dDK1k2NWdiUU5aS2RFeUU3S3NZOXY2?=
 =?utf-8?B?NjBhVzk0Y0FXdUZ3ME53UGQxVDdzT1lJNkVKbTZsUEszYzBmVEM4S1VYZ05O?=
 =?utf-8?B?NlZhVGgvOUxGVkxwUzl0dnlwYk1rZUdFMlVlSDdiS3VXSkpLSm9Sbi9iVFlV?=
 =?utf-8?B?R3k0d1dCNlRac1FCU2l6QWE5WG1YNy9pdU5qNHFOY25uak03SThqc0ltKzlI?=
 =?utf-8?B?bWhEZ3l4Z2lHVTI0L29tbFhLc2U2cy91T3lGbXhjc1lRelRMaUF6bGpsVW9O?=
 =?utf-8?B?WjNtbzd0UzJEOFVLR3A3UzNBbHZKZzBqYVZXVStkeS8rS2FmcmM0c0R4OEVa?=
 =?utf-8?B?OCtKVFRDeWV6QU9Bd0wyRnJHNHcvRThUWjNuQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFpUbHhmeTJiZjVWZEZLQmM5VUpaYzF1S1hqYk4zZ1FqWDJ0RlUybmxsK0hw?=
 =?utf-8?B?RWJ2OWlxclNIZy92cmRFZzJHWU9SVnVDVmdjMjJmaS85ZUtTSnBPZ2QxejdT?=
 =?utf-8?B?eWdBUGlTby9ZeTlST3VJQlRTWDMrSHdKRTBlalVJOG10aW9uRzdEZ25XSHdR?=
 =?utf-8?B?NVNHeDZrKzZlb2Q4T0tnTGFLeDhuWTdGTHZHU1p5SUpxVUdlY1ArQktMcWdm?=
 =?utf-8?B?c25rc1J5Z3NVU2ZITE5lS2IxLzFFZ1RIZFpsajA4REhJVmk4Y2F0STVseHlJ?=
 =?utf-8?B?QWdvQVlMU1RpUU5ZSUdad2xNdGtyMVRXNjFoOGtLT01wL25kN0lSaWM3Ukp1?=
 =?utf-8?B?bnZLVFlpZE8zbFUrNzV0T0R4aS9rNGZEVlE4S0VRTlp3VWlyRVNCN3JjUE5o?=
 =?utf-8?B?VS85WkJHOHZ6RnlFbDNaWG1rWXh0YVJrVDhDdFZiVk9ackNiVXFyUTB3MDVU?=
 =?utf-8?B?bDJvRnhSWWFCdTZpamIvSWNWZnBZaDZ2bEpRTXB3KytCZmRHRXEyeWVxY0gv?=
 =?utf-8?B?Qm5MNHFnVlgxd2t5YnRzS0NYMEk2a3lHZmpXSWF3R0o0ODRkNCtSUWxsMUU5?=
 =?utf-8?B?ZnpGQTh5TVh4c2FuaGlvMGw5UmZYUElyZlZXZEZBRFNDbTFURG9JaHRWV3dL?=
 =?utf-8?B?Qkxud3BGN1p4RktlNTZEWWgwMG02YVpRaVZVK21uTlV2bmNWK0c0RlFXSWtJ?=
 =?utf-8?B?SzR2S09EWENXRzNzSHRWeHlSckN2Wldrb0kvMmhpc2F4dTJ2R0wzUnhkaFhR?=
 =?utf-8?B?aEt0MG90L0R5Ri84VHpOdDhZT21mclpJQ3UydGJ4NDVWcDhIM0dWeEFpb25J?=
 =?utf-8?B?UGJWZWsrcEVxTEdrdTB3NEhuNGJ3Zkphc2x1bDV6d2s3YXZuMnlCemlpK1Ew?=
 =?utf-8?B?K1I5c01CSGNHbUJaZWRQeGdKUTNjYnAza3JYM1lZaXJMdWY5ZVExYzJiREl4?=
 =?utf-8?B?YVNjblUzbHYvalhJZUIzcTlxV3RKV2NTL0pFRGhVOVd3SmVrc3c4N1d5SHhI?=
 =?utf-8?B?YXRBbU4rR1NnTHNHWlY2VnI5QXIwS28raE9FTVZwQUtEbHEwektLdW5HdE5U?=
 =?utf-8?B?VFVSNUlhRFV0OGJhZXpHODNxUTM3NkhrUWtWRWlOTjRKSHFXZFNuY0V5TWJq?=
 =?utf-8?B?blVINlBRdDlYdTFNeS9LeEdFNHIzZnJ2VVFvUGFoSUo2cWVYNzJxRHVLQURq?=
 =?utf-8?B?QVFadXpjcm1PTmNlNHZjNHdKY0hzenRjcUUrTEZFUUxGMGpJSVlMTWMwckVh?=
 =?utf-8?B?UXFxY2JHdzQrTXdlRUplVEpmb3JTVEY2UGhIS2ZickhEOEN0SldOYlR4K0FK?=
 =?utf-8?B?STJWcTZva1FvMEZZQ2FoM0tnZ2YyTEJZSjZUTmJxYk5FTlFCakpHVzJtMVVj?=
 =?utf-8?B?a0h0SkIycnp6SkZXRnlNZkRKSzAyVGZ5a2tmNFVPeVd1V2duczdlbE9welpw?=
 =?utf-8?B?WGNFMkU3anhZaTU1ODZ1YlV5WVBNajJzUnpoMjdNTXZZWHhSUlJFNWpmYjlp?=
 =?utf-8?B?clU2UUU5OFd3bUI2WUxqVFhoUW1TRWt0Wnl3dlhVVHNWTjhrQ0lFYm5ucFBy?=
 =?utf-8?B?NnNiaGIrUWRVTEJwNmlsSWhaekl2OWFyUDhRZWZkVGlPb2tiKzNUQ3BRSkVh?=
 =?utf-8?B?M043VEE4dFhsY0FiQ3NPNS9YUFpwak51Wm9xVUVXQnJGMXpvWnZYejljdGtQ?=
 =?utf-8?B?SGtLWEhSd21pRC8xb0hYMHVKa243anFveS8zU1VNMTllRERkcXZsbVNoS2lO?=
 =?utf-8?B?bzh5SkplTUEwVFNmWmN6cjRPS2FjMmpHU0VOck5Lbmp1bjVtOGp3OVluL29T?=
 =?utf-8?B?T04zazVlM01GZ2tpZlhXRXg4a1hUV0dERW5nMnVhbUY0L3dXcjZiS1NNNXhm?=
 =?utf-8?B?QnNJVmhycnA5ZGZhYnJQejErbzlrNmNpelhnSFJvZnROTDZ3b0xhUVhUNFFH?=
 =?utf-8?B?ajNYQnB2NUZUbG5KNFVVb1RER2haU0swZG4vYVpSUTlyK1FVUGNvdkJsTTNv?=
 =?utf-8?B?QXVMTi8wbHo1dFVWWS9RWWtMdkhsWlY5UzdXMmxnbTJCZUtFR3o1cGVsNE1t?=
 =?utf-8?B?WmlsUGZtb2ZaNzlYQ2VXVlgrOFgrK1hIcHVLcUV5NDlmMjJsajFUdGFvMUdU?=
 =?utf-8?Q?mxHOrciIJ91J3zNZpBYhocN4g?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd24e92d-d05f-4e6f-7c85-08de1824c4a4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 02:25:33.1610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGRjFV8zwC+LfCmoFLpoeEEvRwusEyKJDRc3b7LAsGaihlB50dJan2PQBO5QK61iIKkaJ5JWZMuefv6b0hygOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11952

Add compatible string for the Cortex-M7 core in i.MX95

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 57d75acb0b5e52ca49d1361176fdebc18a0bf7a2..ce8ec0119469c8fc0979a192b6e3d3a03108d7d2 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -28,6 +28,7 @@ properties:
       - fsl,imx8qxp-cm4
       - fsl,imx8ulp-cm33
       - fsl,imx93-cm33
+      - fsl,imx95-cm7
 
   clocks:
     maxItems: 1

-- 
2.37.1

