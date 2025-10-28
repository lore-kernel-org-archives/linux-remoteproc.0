Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013021.outbound.protection.outlook.com [52.101.72.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BB02D7DED;
	Tue, 28 Oct 2025 08:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761639515; cv=fail; b=rT8FznqrDGZ0vKMoDnwockePgcDjnr4POM0lana3C3aq1kucj8lXdMVp1yfnH+llSj3B4DmUS9/jTvs53z+UCgMesl7zZi525hi+g0/B5a8Dnt74M8VLfWXOpKg/9GQ2jDbGtWTb3RLSS0pCnBcEqRF1LxvG+bgPjJ+vb7FH+lM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761639515; c=relaxed/simple;
	bh=xHK/S60PS6KNOnfKoUQfhlXjqB+AWb/fdKDyp5XO5yM=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=AHMdngFpfwcdMLvFYDJMCpLDs7SX2bdFG/n1nDzz6qkz3frxc1Y9W/IQNgSVLatYNxNDAweB/dIz+cDpN7IcVzts1posnsrQPTXz/7tyS+/4fLJfdOxfem3/QIn/wUYy759W7BOUbTYYT1vEnYALAM9w3xIe0YPh4qGprO08W9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ewiOMTgY; arc=fail smtp.client-ip=52.101.72.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ewiOMTgY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=um0MWWqhh/aK7eXHs7L+SNvkcbZYbVkUJ/PAkqJXcWL09QoOrFBI/4FA+1N40co0tmwMSWij3boG3JRxIq3XHoUoOsF/D7dlQLOlcz8FJxnKxGILWQWnT31M3ZnLT+lZMPCIk9+99d5QmUh9y/K70B+Y/QJICUAG/yD3yXvoDPY+4wpFyx8DYP7UvOQUOc1JhyVpvkn767muoHPuODdLVgPSsdNIf+Y4987MTKZPiBIXNsNDKjlHkZVKk3FJjFLTXvsPXfkqJv9ncnyLOQv+TNud+0KaDnyO1N+Lc7tGr7dH8VuB0KBQdXqgVhfBML5IXBGjaCXh2K+dtuRqN2FnGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2N8AOpZtXL90kxMW408k7sDHUVRifvBajw+0G3SRJog=;
 b=HjwzqNzM1M8PStWmq9ruS0P3+WablTSulWCJmF1pKd3luH9/Mb7k4rH10aBMg+Jn3ExjtNXAmo9JqPsnOCU3wr0m917UpVDWhzwh3lvIWK7FBOvqy5rLXedO4yPAh2bH5KNAB3TnBJWQSJ8MIBVmOae/vxc/BgQCF4oh6nVGeibM8FfhfoultKKH7eb6PD+ZOFig9x3KlNvDPW5IfHQH3YJetqqnEB7rvC0bg+O69p8ELe5nyONaTrYV3SzagJCceMKbGoFrNHLwLKMg7zbrDjyBdC2qKeGSEWIsmpydwIfOM6mirEquOSGagJWaFq5TmoWnUmN7nU0KA+Wsr+EtvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2N8AOpZtXL90kxMW408k7sDHUVRifvBajw+0G3SRJog=;
 b=ewiOMTgYqDIYa9Bs6LBw7pu554ZSsBdtrJDwFzz9KLVv3n+jGkrVKOlqT/XKUxWpjJxxAIP5GMfe8nvvMAjnjPV6JX0BPdqdzyiflv7PvMn1PQrbrMvXoFOdHwgVijiTesZ/VjicLYItN5RE+pr/0NT+AgjGZT2KxuRYiHf1dMDbOVIC/YA0ra03Yrxl/DbSATncFjb8xQpYCN6q6Jdh0yt6fSiIJiGl2W39k0TulauL0w1PNA2qv/iOfK8BZmPf5+ImwrOtu57CjtIU3oEYZiLuEsrbKEnv5888F8XPCo0ke5BeY3c+5GjMcskljfOLTzbzz0g0HSgydYp7UXijPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7020.eurprd04.prod.outlook.com (2603:10a6:10:126::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 08:18:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 08:18:30 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 0/4] remoteproc: imx_rproc: Support i.MX95
Date: Tue, 28 Oct 2025 16:18:00 +0800
Message-Id: <20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADh8AGkC/x2MSQqAMAwAvyI5G2iK+1fEg9ioOaglBSkU/271O
 AMzCQKrcIChSKB8S5DrzEBlAcs+nxujuMxgja3J2A7liH2N6vVa8JNIBrOeG+valpuKmCDHXnm
 V+I/H6XleHmwiDGgAAAA=
X-Change-ID: 20251028-imx95-rproc-2025-10-28-a62d77e641e1
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761639500; l=2716;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=xHK/S60PS6KNOnfKoUQfhlXjqB+AWb/fdKDyp5XO5yM=;
 b=0HGfU6XmWHz9hKkwgwYqfnMGQo5vLbBmuUEdZmJ7v2AlCsgIPo1YyNhQ/Fu77JQU/ac/3anyJ
 YU2maoiiGiYBwnvpMSeyxF4UnoSbSZFuJnaN8FGmJzsuiY9hD9EquDB
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: bfc280f3-eeda-4737-4018-08de15fa9410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVNTMXJBenUyVEZqUFdNa3l6Vm1kZVN6L2pVNTdDa0NnUkJoVFlCZ3lyZHFC?=
 =?utf-8?B?Q0pZSThGUFg2QlpSMEV1TGk0RGpiOS9heW5tVElMbzdVS3ZvSUNwNzdORkRU?=
 =?utf-8?B?T3lNL294cm1VMGRDZFgyUDdmYm5Wc3FJR0RLNTNuZjMya2J1QWRDclRwSEl1?=
 =?utf-8?B?TDhHTUdCbzU1elNJM0ZxNW4vTnQ4ZFFwOEJlN2ZhMVdEY2d3SjRHdEJBbGZF?=
 =?utf-8?B?QklodEN6Z0NQeVlrc1hyL0lKZE51TC9DOWFPMlNSS0RvOG9KTlJmWWV5czJj?=
 =?utf-8?B?a2pCTmlGRW9kb0RoREFnQkhvbEpCUHJUU2FLckltdUhKS0J1cURsSjNwRG8y?=
 =?utf-8?B?Zy9jNHRwNDM1bmtUTTREOFcyNW1lUkl4VVBWRjdmb25tNitsb21jWm1KQ0NH?=
 =?utf-8?B?OStPblFpbzZ1SmNiWkhabTNDdjR3QW1tMDBUWWhrOEJuaUc4U0k3ZVJzb3ds?=
 =?utf-8?B?WVpFdmg5RkE4ZVNsNWJpbXlsRHBoY0RiSlNPU1FtZUJyT2ZSUUt5N0Rxcmtx?=
 =?utf-8?B?NjdJSWwvb1NlSGMvZWVWLzJXNmNjOXd1RFo1aEdzMFlSWDQvN1E0dlBFZmF6?=
 =?utf-8?B?YW1LdHpQcFd1dzJFSnlEQzVwMG1GSlM1YzRlczNldUdWMDd1MlJINTBsMjg5?=
 =?utf-8?B?ajRYQ1plR29qR1pDMGJqNXNIaGxYaEVLdHdxYWIvTkFhVStkeVlTa2N2cmtl?=
 =?utf-8?B?ampnN2kzY1IzUUtGdjNTb3Y3MmpDQm11NnZMQ0szSlNIa29GMUFGWnRlQ2Y5?=
 =?utf-8?B?YkFNZVNYS1J6dUpsMEVpd1p2YmdqL3pmQ2dQVHR1NW1UYmJWeFU0VmpqYXdJ?=
 =?utf-8?B?NkN5aUhGZ1lZdlhMWGVYNm9OVTZ0WnVGRi9LREYvWksybGk4Zy9kYXUzVjF3?=
 =?utf-8?B?aURuU3RyQ0JqTFpBR0JBQkpxMjhGRmhTQ1lINHQ5Q0VnalEwRFQvMzRGdDJs?=
 =?utf-8?B?VUN5Z2p2S1NYRmN1Ti9HM05rbVJtSVdUdGluT21nb2ZFb0RmMTFneDdFb2Vs?=
 =?utf-8?B?clVnMlZ1bE9tYk51ZTZFYUxRSk94SEtmNFdzUVdXaXp6TWVRK01BYjR5d1gz?=
 =?utf-8?B?RUcyU1BZTjI3UDdRTldmRHc0NFE3blVjSm1CY2tySEVBS3BoQzNYeGZoY1k5?=
 =?utf-8?B?NzRveFpESzBlY2dJMDQ3WEhHVC9aL3ZhWmg4NU81N29NMjBuNTMzOGY0Rll0?=
 =?utf-8?B?WE8yK2dYWWhuanp2ZnpiNlArdURwaWlySW9HQ2pkd3p0SmFrVTZORkhXb2Nt?=
 =?utf-8?B?Nk5qQ3lzUE1RKytpUVNTM0JpWHdSOER6NytuUkNOSHZ0UEdvTklOV05ZTWY1?=
 =?utf-8?B?cE5YRGdGNW42VlliQ3libDI5RGdaR3prbGpNTGlwakVuSVVseGg4dDVqZnAw?=
 =?utf-8?B?cUlzUjR0aVlJMEJDVHdXdHZiWjBsbFNyRUx1bWxIclUvUlFETlZ4WXZoTWFp?=
 =?utf-8?B?d1pHYW5mVEQ0d002cGFjekgrVTBZNjlMbkx3R3VsVXo5QzFtY21CbU5td3ha?=
 =?utf-8?B?bWV5QUJBV2h6TEFjMVhYS0hjTDVBTWFmY0VpL1M0M2l4Mk5jdXp4anhNVStD?=
 =?utf-8?B?ek9OcnBsZ3FBaGlwblE4Y1lmeEFuMW9WTllUZ3NqaWhHdjR5L2MvV3cyTFRr?=
 =?utf-8?B?RmJCYWNuRFJJRW93am5zc1JYTU9GTS9MZHJLcjRtb21oYUdsQmxLalpyVVkz?=
 =?utf-8?B?bTdJaG91a2NHelN6dmpYU1ZiRzVqaUFaSlBuYVFWcm9kTXZHYUE3MEVSb1Zp?=
 =?utf-8?B?anJ6Wkk0bXFveWp4OENMNDRwT2FEcjQ0YllaUXVzOVQzOEdyRzFtM1lGai84?=
 =?utf-8?B?OUEvbUtEbGF0OGtBMlBqUUJXV043Tk9QQlV3TmZWenp0V1pVSVlOYkNqSjg5?=
 =?utf-8?B?UFdYdEF5SE5Qend2Sno5eG9wSURNTjNzOUpvb0J1cjBDT01Xb0k1QW1xSlNT?=
 =?utf-8?B?MzdLYU93aVJMeHFMdjZyRjRLTHNPTkRDSXNPcHNuektqbElRVFBPQUZFUGhR?=
 =?utf-8?Q?qD+wzWdBVckPH02QHSC46/u8OvBLgo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVZnaWZBOUZzOXZlSmIwbk05b29vM0hSblZvZVUyUlRDMGxGWElsWEZvQ3Ew?=
 =?utf-8?B?WTlVMjRkOVcvWGlKSG9WdDR5RFJ5S21pb2cxVkFSSUsya0hiekJpMUZ0TmxZ?=
 =?utf-8?B?U2Z5UnZ5UFdsU3kwQmdPWkxlZTlkNElVN1VrVEJLWGxHZmI2SERvSWVFd2Nu?=
 =?utf-8?B?OFAvNENtQkZjc0JoUmxZclVyclVkaHhBUXluVUR5aUo0dE9wZ1J2aDY4MVFo?=
 =?utf-8?B?NlNFVDIzQTlvTEZ3TXYva09zUUFMVlJzNVhra3VZNDBMYndoQkRSWG82Rnk1?=
 =?utf-8?B?QWVPaWI2MDBKd2QvTG9EV1FoaDBLeVVkc0xxcW8vVFY0YkZoT0U0UjI0QXVi?=
 =?utf-8?B?MVAxdk40ZXFMYnVNenpQVEZTeFFhVjRzT1g0NjA0UVhXK29OOENuR3ZCYUxu?=
 =?utf-8?B?TnJmZlNYY0tIbE5aQUM1VkVFcVRkTXcxR3VsRG51ejVyRUlHMk1CWC91SDRa?=
 =?utf-8?B?azVNaHp0T0VQZTVvclZOQ0JXS1JJQ3NWQUM4eUFLTHhRalZlWVlzZkF5U0dT?=
 =?utf-8?B?R0E1cVRzb0NzYTM2UTBRY1owaE9UbTliSlVhTFd4c0lxNGdTOG42TVZ4cC93?=
 =?utf-8?B?cWpPOHIwaTRPQ2tMLzBiWXRiaGF1V2U0dXl1elRtbndXdXcxMU9TQzdMWUdz?=
 =?utf-8?B?bnlTa2xaNXZSSjlneUFtL2RHVSt5bjFMVXhWRXZHbXdqeDlxUGRQaWJnbDF1?=
 =?utf-8?B?QVBGOTVQdzM2alRUaVUwMHUrNXcyNHl2TitKbGZ4ejZMWVBpTXRPblpEY2JQ?=
 =?utf-8?B?YnBqcHYyWEdRZlNMaTZBZHFxZ29hdDN6M21Tb0dOcVVRQzBCNytEYS9mazhp?=
 =?utf-8?B?emlycDNWV2V1NzNibE9jbTk1UTdKZU1LaDBlSlh2OVN5bE9LN29heWh0aDBQ?=
 =?utf-8?B?bXZtazRhY0hUYTIwY25GSTFIalV3MGh2RFluYU9QRVVYeXh2Z0Q5ZGFVRjI1?=
 =?utf-8?B?eGFjdGwwRUlvSXhjdUVQZWN6TDAxbDJRaXVIbHh2ckg0a3F0b2xaS3ZGcTRY?=
 =?utf-8?B?Mk9FZ09ySlhoN002dFptcDBNQVo1TGtqSTY0YzZPbnRTbnpDYWZtekZkZ0cv?=
 =?utf-8?B?d0dWZE40QThXb2xJVW9UaTZrbXg4cVFxaEJCLzRTZWpxTEEvTHNtTHR0ZzBs?=
 =?utf-8?B?bFZWV1Vnb1F4Y3FyYUhNZkdNM2Nva281UXpsZ1hYcmVXc1ZtZFBxNnBDa1FY?=
 =?utf-8?B?dHMyaGNhdjNHZmJoSVZ6QTZ5alR0R2Zxa2FSZ28zRXA0bXFtdElLbXByN3Rz?=
 =?utf-8?B?cFBjend0bWJ3SG8xd1psUG90Y1AxQjd0QzNoT0tSenhES29wR3N6c2lqVXB1?=
 =?utf-8?B?ZmFmV0YrSnk4VjkrY0VzRzRZcStIL3hFd3VrNXdmZkZQZ0hEbEJFZDNZTmN1?=
 =?utf-8?B?Y1crUktFRHdHUGFFOWF1NG1XOWJrdHJDcWRBMzM2RWFrSWpFQlEzTXYzTnRh?=
 =?utf-8?B?d2I5NFRNRUpaQVhzVXdqS0lERUdDVlk0UEMzZVMzWDNiVUd6SSs3YzlQbFlh?=
 =?utf-8?B?YkRQbzRtclNYajNSVjZDbmZ1eGhXK3hIdjBKbzRORlVxWnNYSk92OEpBZk0r?=
 =?utf-8?B?WWdDeXRzVWFRbUJ2NVlYT1VKSTZhSVFYWjhJZk5kNlJLdFp6NGdqL09XTHFu?=
 =?utf-8?B?VlR1V0p4bGNIanpWTHI5d3dGa0VoVmpDa21mc1NucEl5b09MNCtkcmpKYjgw?=
 =?utf-8?B?Y25xYVYyRXdreG1YSFFXazA0N3o5WGxieXZsRUNYdDQ1SG5CMDBRZUI1Nks4?=
 =?utf-8?B?WGx3UFVOYWY3WFZaZUV6TjNlYjMwNGo3U0xnaXNKYjE4QlYyVkJ2RFdRNGNN?=
 =?utf-8?B?RWxXMmlHckFLbkp1TUd6UmVaSUs4dGxPYmQ5eUI5S0wxRDF1dFRFcDFWTGhV?=
 =?utf-8?B?QzNVeE0wbWZ0SndMNEM0SFQ2RHd3ZHNBYWc3SEpySCtQbkRRTVdnRGFvTk5p?=
 =?utf-8?B?cENvT0xJWlRWRkQ2ZDQ0QU1oYVNqQXR3WE9oTVErTG5rZWN2NmplZ0NFVDlj?=
 =?utf-8?B?OTZGQ3BNcEtOMUt2OXl1cWZGVDJIMnBVblY4V1JXRjJ2bkJ6d1RUakxLUmhS?=
 =?utf-8?B?MjZGL3NqWTNOSUZ0SkhCdmhXc084ckw4b3pXV2tRRnprbncrUGRtWHY3OTFF?=
 =?utf-8?Q?QXIm5mvFegdtEORzJUWagMHtw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc280f3-eeda-4737-4018-08de15fa9410
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 08:18:30.4996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: voG3AQak/GBWT2RTQDeIynO8DW8z+J/rBrq3lZ+KeX+n9e0Dm3DbBfAAE9D40EmSSz96S0PqWtSasRyLOaX4cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7020

This patchset is pick up a previous patchset [1] with rebased on
next-20251027, and some changes applied.
 - Add runtime ops to separate cpu ops and lmm ops
 - added more comments
 - moved some check imx_sm_rproc_detect_mode() from imx_rproc_sm_prepare().

No changes to the dt-binding patch, so R-b/A-b are kept.
More info could be found in commit message of each patch and below.

[1]https://lore.kernel.org/linux-remoteproc/20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com/

i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
one Cortex-M7 core. The System Control Management Interface(SCMI)
firmware runs on the M33 core. The i.MX95 SCMI firmware named System
Manager(SM) includes vendor extension protocols, Logical Machine
Management(LMM) protocol and CPU protocol and etc.

There are three cases for M7:
Management(LMM) protocol and CPU protocol and etc.

There are three cases for M7:
(1) M7 in a separate Logical Machine(LM) that Linux couldn't control it.
(2) M7 in a separate Logical Machine that Linux could control it using
    LMM protocol
(3) M7 runs in same Logical Machine as A55, so Linux could control it
    using CPU protocol

In patch 3, Use LMM and CPU protocol to manage M7. More info could be
found in the patch commit log

Current setup relies on pre-Linux software(U-Boot) to do
M7 TCM ECC initialization. In future, we could add the support in Linux
to decouple U-Boot and Linux.

Patchset was tested with below boot images when the patchset based on next-20251027:
imx-boot-variant-rpmsg-imx95-19x19-lpddr5-evk-sd.bin-flash_lpboot_sm_a55 (Use LMM protocol)
imx-boot-variant-alt-imx95-19x19-lpddr5-evk-sd.bin-flash_alt (Use CPU protocol)
imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_a55 (M7 not under A55 control)
imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_all (M7 not under A55 control)

Also tested i.MX8MP-EVK.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (4):
      dt-bindings: remoteproc: fsl,imx-rproc: Add support for i.MX95
      remoteproc: imx_rproc: Add runtime ops copy to support dynamic behavior
      remoteproc: imx_rproc: Add support for System Manager API
      remoteproc: imx_rproc: Add support for i.MX95

 .../bindings/remoteproc/fsl,imx-rproc.yaml         |   1 +
 drivers/remoteproc/Kconfig                         |   2 +
 drivers/remoteproc/imx_rproc.c                     | 243 +++++++++++++++++++--
 drivers/remoteproc/imx_rproc.h                     |   3 +
 4 files changed, 235 insertions(+), 14 deletions(-)
---
base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
change-id: 20251028-imx95-rproc-2025-10-28-a62d77e641e1

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

