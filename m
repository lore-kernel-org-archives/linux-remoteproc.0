Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013039.outbound.protection.outlook.com [52.101.72.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2333D1DFDE;
	Wed, 15 Oct 2025 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760536411; cv=fail; b=Ia6rgqyN6UAAOgT3NvzpNKXSVvny57aZ9PHSLhqYL7sbDBTZyB5y4yUu4ptvcH2e0Vpa2zE20YM1e8fx2+zSbtmd2/BeAhF1HgtcgskZz2tH7rqrrXEJaYNfe/1eT67X179cVwlcPHXJVzW4VtG2dr9E4eKl7HOz0xc/8zt1Ijc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760536411; c=relaxed/simple;
	bh=/JVQ89zJekrgXJbF6yS163m2gUhLlnXOoqBtYEMfH8s=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=oJakCUfpu+MGuLXjkeE0SjoGUBEXAT0z420apDfnqV/vDJ9Tr0sUso6GCCo9Rk/oITQ0ExHEMJL2kiQlP6LJ5UDtGwhX6qT9QPqaJoUNK6wn+sSu6hmJM+5lSKjz0BUqmLn1B9L+5N/wBKAbCmyYYABvQI8t2ISxoceXHCmU1Sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UWI8cuf9; arc=fail smtp.client-ip=52.101.72.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UWI8cuf9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iLdofF6kt9dmzg+oATWPTIXS5jjleFkw/mllEQDQ3JjyK/PhnQs6jj/Xtz/Xb2MWub4jYHJWwrTlxUAJDG+Mcm+FbXcXFSXxA9p2fCkLiZLrGWIBWvczdf+/nx1N3vhBt1PhXSNTuwEHLZ6/8tCWsHvMAwXx4CyuL24DW+Wg8qyxc4PbciVZJnmjwd2KCGumlyKl10ZMpoboda6EgSusMR6hVRJ8+rjbR9TisXlIknnueV0UIKvd7wcrHvcp3Oi5NDQM1MoQ4lPs8+5cuHNOzwOGNrCJUuCqT+ZMfK37ZhxuUniWLM5I9EjgoSEX7T3Try67+J2rOEpLRw9pc1RaLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A18IgAmUFvMw5oLJ77pVwYbFlWpGycZPkNB2tk4oXAY=;
 b=V0j6C7rd6UjMd0UEtj/690pKx0aITMqGeC25jIglOCnvELJMHEZxen267nODTeYrNzE4v8OTvLKU0ezQhftXdCKuUUnxZHIIl8kgi3M2P5xDtCw25B6fIMiIbif8Xfs1ZIwfTo/+y3jV4+f/KA/04slq4X25ZkNPMUQPJKmzmZOmeK529WbbepiRVFegBGUYxUtAKhAnvRJfxFHkTOB8cAWSXPqiTvGRrSrCNgYoR6dgFoJhf3dgig5UJ+ip3snW7ggqXWermCf/uwHfiY8SWAayivTVG9NLhB9upCbZAtVlu60AzJmcZzSMZFuC9+pheeTGn9ffFJBdOLunZvkgMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A18IgAmUFvMw5oLJ77pVwYbFlWpGycZPkNB2tk4oXAY=;
 b=UWI8cuf9eL0kCeNl2t80jv0CHde+7WCcARJchcAatshCEUiSSvyhDF1E2Gz5KH15D5oquOpyS7JTRj4vcE8nZ/OBGgtzuvhDfT1FAcCoX/qWbWnNtp7FdoHqN4/rUHbmRpqmbYtKA71XJyoR4ZwzZfHqF9xHCpBEW77zgCmFaL1MkwwM0y/yyoX09NQybFbLIyRJ4Vw5RUNpcWv5PF8XyQZ0A0XyYGbOONvRc3isfze8ND/W5ND5RAdvtaEod9uLXhaiGp0vRsBi+gbrt8WCyim5p27tgUFFpF1RdmHPsNI2yYWvYgGr3uIbufYZI3UU4qSWkfkOi2z4A0nlIUBccA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB7612.eurprd04.prod.outlook.com (2603:10a6:10:202::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 13:53:23 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 13:53:23 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v3 0/5] remoteproc: imx_rproc: misc clean up
Date: Wed, 15 Oct 2025 21:52:54 +0800
Message-Id: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADan72gC/x3MSQqAMAxA0atI1gY6UEWvIiISU83CgRSkIN7d4
 vIt/n8gsQon6KsHlG9Jch4Fvq6AtvlYGWUpBmdcsMYGlD2jXnoSkp8sRqYmGte1c8dQoks5Sv6
 Hw/i+H+XCa9tgAAAA
X-Change-ID: 20251015-imx-rproc-c3_1-fec6f0297a9e
To: Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760536394; l=2066;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=/JVQ89zJekrgXJbF6yS163m2gUhLlnXOoqBtYEMfH8s=;
 b=sAjN0XnpejLrUsRhx1YL7l00pAQ8rwn7Bt0fwVWlu8Cuwj8+QmNAY7T3SuZeKIVXAWLJjL37O
 OvO7jwzGKWwA2r3Cyb61em5XeaVHVCpKD9wPPtS6PavMqqO6aZDq7Ij
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0110.apcprd02.prod.outlook.com
 (2603:1096:4:92::26) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBBPR04MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: d4031da1-3677-47ef-4bf9-08de0bf234f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|52116014|376014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTNoTEFHdjEzRGNKQ0FBN2hTRWNhY0xZc0FRbHQ5ZXRzWGpSUU5VNE1Hbklt?=
 =?utf-8?B?MjdtREhlcmxnVUR4TlB5ZGlXVVMzbG96c1AwMUZJMlc2Zm8wWW8zTmhWcEo2?=
 =?utf-8?B?N0lrSUpLTUFVWERYV3hNcUc5bHlNSllGSlpsbFdGS3A3Q045R0ZpbWJEazJN?=
 =?utf-8?B?MURyTHZ5SEJvMk9KR25MV1o3NHllRjJWTFhTbGJHZ2dzcmQ5a21idVRWWUVH?=
 =?utf-8?B?RE1mVzQzRWQ5MUtHUXVnL2djR3VYUFBWVkVkMWZoSG9RVm5WZDdQd05iMWI1?=
 =?utf-8?B?QU95WC9la0pxd3ZwY3BvWlRkVnE4T01WV2FMaDRDZ1JkOHE2OHJ5NUIrYnBR?=
 =?utf-8?B?TlJCZzVzK3lLNjVYOTBQNi9Qb1Ftck4yYU54cTg0WlNtTUZ3QkE0b2RtNnJS?=
 =?utf-8?B?OExtcUFpMmVFVXVMbk9BUXBvOUNjU1JxN2VUN1VPcWwwSUlWVDIxZEp5bnM5?=
 =?utf-8?B?VGo3UFZseTc5NHJZbzBJNXlmd2k2bEJlaHlpZUpia1pFYUdjVDVZenNSbFUr?=
 =?utf-8?B?WXhYOHFwRzV0SUJZQVFDc1BiQ0QwQTEzaFJMTzVUdzNaQjkwdUpYLzhVZEJL?=
 =?utf-8?B?cm9HVlZrc2YrMnZlcmJVUHFrdEZsOGR0ZEUzVzZnSDNrUitVdHFnVi8vYUlW?=
 =?utf-8?B?MytERzVjYXU2bTg1dGg5WWRrNXJ6b0lYUGh2YTlPNmNZNTcvSnM3bi9XdGQ1?=
 =?utf-8?B?WTRha1krcUd3NzZsSDJBMUd5dTVkeUJyRVVLQWhlblI5eFRJWjdlWUk0dk1T?=
 =?utf-8?B?NWk4ZDBScWxVSUF1STZJa0lENkpxUVNRcDFpSncvbjZzTXhwa0ZnUUVxQ1BO?=
 =?utf-8?B?TU4vUTB1Y2ErR1FNVlNKK3kwR0RCcStQVS95QjZtaWZZRmRaazZqUDlqTkdW?=
 =?utf-8?B?SUhmeHNERGtTUGV0VXczWlZsdXFkSHBzSVBxeE1GRWxNZkIvWm5HVUc5V2JT?=
 =?utf-8?B?VXNVSmZNNlBJMUpHcVlPYWRqYTc4VFhGUlJuL1NaUjVMcWhMZE9ta2YrTlJ4?=
 =?utf-8?B?eEZ3OFdLaU9tYjhtQ3llL05ONnJaazhVb3B0SkQrdXdlVWUxOTJSNlhJQUk2?=
 =?utf-8?B?SVZMUTc2SGhISEJ3SitQZ2w5SDNPVWdzdDVUcHh2ejdZM0JybkZKRDVqQ0ow?=
 =?utf-8?B?VWNoR0owQ21aL3o0N3JQcVNzVFcweEdCYzhiSTJvdWxOMWhYd3MwVDFQOGxx?=
 =?utf-8?B?VVNlNENFNHBOL0l4Vmg1MnJUY3h6MktVMUZqUXVLYk1Nc0FPRTYvNWtXTHRI?=
 =?utf-8?B?azI0c1M5eXVzYTRDd29sdkNRRmhpRUZMenNNZjlRc1drZHpSYS9VOGEzaDhw?=
 =?utf-8?B?T01pZW5QRkdERm10L3dQejVaalpJZ3Y3Ulgrb2lIeGp6WHJhbEJ3UG1nQk5S?=
 =?utf-8?B?cktrVVhzc0NwTGt2YktuV3hzRkVxd21Fb2xDWU1ueHFDV2JHcjZ0VTZGS3Ja?=
 =?utf-8?B?WHlDaFV2bTFsdUF4K1h3SHZ5UkxrMm5uNk1mNXVZWDkyaEFGcWdqczEzTTJX?=
 =?utf-8?B?ZDdERWdBVTEvYUVjcW12Z3J4UHZQZ2hNZFhURnB3WDBUM3BHSlo4MlRtU0RR?=
 =?utf-8?B?MC85S1JBd1c1bFFMUkVjTm5sRCsrR0YrWVVBNTJkV0w5cDhYQkU5dXpqek1X?=
 =?utf-8?B?TSs3emU3ZHN3UHE5R2RSQUR4WlBnUFc4Q0hvRlZNbW8xUnNkSlJZS1dHQlgw?=
 =?utf-8?B?MnJETHBJSWlEUWNYcHZIL1p0SnN1bDBPWGx6T21Kc1dseTRZbmhkd1RVbG5o?=
 =?utf-8?B?VnBCREd0LzFydlVieWVwaHRzbFBIRjlEdFIxUXJyNEdNSFpmRlpnNkRvRFpN?=
 =?utf-8?B?MzJaWFhuRzN1enBtU2syc0hYRmxXUUF6ZFFHZm5uZk1qUG9rNW9EMTBNYnpw?=
 =?utf-8?B?NWhnZ0dIVkJwV2NxT2Z2dklOc1JCRXBRZFdhQzhZQXlUbDJSRlRLSWpQWS9Y?=
 =?utf-8?B?dU0yMFQ1VmxJUHgzbFExUnVjNEIwT0o1UXVLMEtoenNPeXVibnd4d3ExQ3ln?=
 =?utf-8?B?TnlUQ3E2V3pXS2ZkWWptOUJSbG0wSWZDaGtPbXJMWXl2cUFxbUlOZGdSRG5F?=
 =?utf-8?Q?2owVAr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(52116014)(376014)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmtVYXkzSDlWWmVDajVHNG5ta0Z3VHNKYktrRWRWNGREZS9QREVENC8vQzhS?=
 =?utf-8?B?T0xZT3FhVUxnR3BBQTlDYW9rUStXZU1Md1ZmaGVuTVp3alN5WjF5eERESEkw?=
 =?utf-8?B?UkE1OTluMjFNTFFXdktBZkJJdFRBL1JlK0RvOEhTTCtwOW1PU1dJblEvY0lW?=
 =?utf-8?B?UUVTdjJmMXFHRnFqVHhMSkU2OUY3RktHQ0g1Z1pCdkJUUjd3NStKOVc1bWpl?=
 =?utf-8?B?RlFKZkM0Q1VMOUpib2FweWhhWUxwWjhpV28zSDg2TUlBVzlYemVVQWQ1U0Rt?=
 =?utf-8?B?OTZsbURud1pxQXo5eXZFYXEwR2ZyQ3dYbGQ5VlpBV3JNaUU3dzJZRWU0NjZG?=
 =?utf-8?B?UWJYR0tLZEphL3ErZnA1VUdYamU2NlVxNDMzRU03S0ZyYjkzSFFCdEQ3WlpW?=
 =?utf-8?B?YjduSE0xVGg3Z0Q5R05kTnNyaXlGdlpUSmtPOG9OSDFHdnF3WTJTUXMyZ0Z6?=
 =?utf-8?B?UUNiYm9jdWl6Yms4VHJpbG8zRXlyR1hOd2UzQUg4WGJ2cmJtaDVETzhScGZ4?=
 =?utf-8?B?YW8xMVpsYy9ZbnQ1amc5M1BYa3NJa0RqcWxGbzF5WFZMOW5lYW9VRmFDN1lT?=
 =?utf-8?B?a2JCNE42Y1A3Zi9XR2Z4VGJlNXZnTGZ3MHVVbG10dFVVazBYM3FpQkpMbWxk?=
 =?utf-8?B?Ym5uZlNmbWJ6SjloRkNVemZ6L3pJQW9uUjZuWjcreEJQWmhIYlYrUGprd3Nz?=
 =?utf-8?B?ci81MzVXMnBqVU5lVDhlV0Yzc3dXZHdWbWZGVjBBM2d4ZEt3aGsrdFdDZERE?=
 =?utf-8?B?L0pFWEVtM3VYMjNEdnJPK1JlVFVEcjVLN2RjVmNueHFhcVczWWdvZkVnVmNh?=
 =?utf-8?B?eVdGQXNpN2pHM3B4WS9BS1p4Wkx2Y1hJc0FQQ0RiUGd0aU5ZdUp4a2RsUzd2?=
 =?utf-8?B?SjQ0emhlNmxzbFlGNEQzZ3NUVVZoMS91TkRyRDB1c3FFQzNkdFJOMVNBUWR2?=
 =?utf-8?B?MzI1Z0FyZWY2bzRvRDFzVnlDZVZDY1NITVdDSk1jdmhJNEI0QjlBRzBzS2px?=
 =?utf-8?B?c1VxQkZzRllIVG5DUHNlRDkxNG5qS1QyOFZxUUc5WGlHcys3emNHRzAvbkg2?=
 =?utf-8?B?RmZsRER6L2RyQ0R5RnBjWjBoWEd1YlhIdSs1RU1ocVZHRzRzTnVKSkFBZktJ?=
 =?utf-8?B?bHQrWG9uQVpWVWN2M3kyckNKTnNuVjRHZWFhL28vd2lyM1gzL1hUVE5qZUVr?=
 =?utf-8?B?bnNKL1ZwYldQZjVXQnJiVlYyaWhPb1RjWjM2cG9hSUJOSjBXZFJUTHpGQ3g4?=
 =?utf-8?B?VVZWbHRBMXNqYVRHeVZvVWFQZHRZMFRrVTdBL2NnVjM2ZG1oS015U1MraGcx?=
 =?utf-8?B?WDQzWlUzSjNwa0ZicWlWVzZrbWYyMEZhUkIvQTZLU1RvV3NFak11dzhVOFVs?=
 =?utf-8?B?eEI3eEI5blkwZjMzcE1SMW0xbjh2NnhOZjJkWDN0ZW5tWFkrMXA1YnpkaXk0?=
 =?utf-8?B?c25jTExNajhzWUlsZ3lPMysxZTRoK1d1M1dzZDY5bmpPUXZ0TFRFWTQ0SWkv?=
 =?utf-8?B?STBPYnNkd1V4TWFmdUNWRnYzVW1JcGhKaS95VUkvOUs1b1NmTkdhOWJlay9j?=
 =?utf-8?B?NGpFc044bTAzVjRHN1pmTFNnUlpWN1hiOTFiLzhsMC90YkpzV2pXbDRLTjd5?=
 =?utf-8?B?Q25VeE1WQVc0NXJiU2ljRlJxdnc5eEdvd2VGMDhLRDFzWkRZZ3NUbGwzWE9R?=
 =?utf-8?B?UHNDVDVJTkdpb0hMQnJ4YUd5K0kwM3hrTkJXejN2MkNtQmd0emljTlpnSmhh?=
 =?utf-8?B?c25ybGdWVlA5YVNCWko3d2xqYW1Rc3hVeWM2aEJINEpHOXV0Z3FRajBQaGZq?=
 =?utf-8?B?TUFhRXJlcDFVS3puWmNVUUhqNkVGMDRMbU9nSWo4Rit4MUs1QXRCc2w4Rkhx?=
 =?utf-8?B?WG5sZFZvcHROaVhEVmdkZ1F4bXpMclZEVWRlMzN0TDdNTVZ0bnBrSlhNUGFZ?=
 =?utf-8?B?NDQ5SnpJOE5haHJtTnNmbWxIdDh2MGJYN0ZSUW9wbUdNM3ZERFZmL3FXMlVq?=
 =?utf-8?B?c0tFQ1JtYWJOU0lDaWppRnNpd3R4M1UyRThmUjBHei9CVVJGNnZjaWx5SU9y?=
 =?utf-8?B?SXMzelB3eE1Ua3BDbUR1VzhkM1VoUGNzaXY2U21mbUtXUHNwbGs3QUV1aVEx?=
 =?utf-8?Q?uneLvBB2PVZiVib2+9dmqnozZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4031da1-3677-47ef-4bf9-08de0bf234f3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 13:53:23.3170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6F0JgCbaxTQtlNTWP7Z4JF0cwHFGk1TiW964/elqeL3KWIbrPfINOW2q0SJYYayOy8jhGqanmbo/vDVezLsEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7612

This is the 3rd series to cleanup the driver.

Patch 1: simplify clock enable logic
Patch 2: Add a platform detach ops which will be easier to support new
         platforms
Patch 3: Enable runtime for all
Patch 4: Drop method assignment
Patch 5: Add an MAINTAINER entry for i.MX remoteproc drivers with
         Daniel/Shengjiu and me as maintainer

This is the last patchset to do the clean up for imx_rproc.c.
After imx_dsp_rproc.c moved to use platform ops with swith-case removed,
the method entry from dcfg could be removed in the end.

Tested V3 on
i.MX8MP-EVK, i.MX93-11x11-EVK.

Tested V1/V2 on
i.MX8MP-EVK, i.MX8MM-EVK, i.MX93-11x11-EVK, i.MX8QXP-MEK, and i.MX8ULP-EVK.

Thanks to Daniel and Frank for the internal reviewing.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v3:
- Rebased to latest next branch
- Resolve the conflicts in patch 3 to enable runtime PM for i.MX family.
- Add A-b for patch 5
- Link to v2: https://lore.kernel.org/linux-remoteproc/20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com/#t

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
 drivers/remoteproc/imx_rproc.c | 90 +++++++++++++++++-------------------------
 drivers/remoteproc/imx_rproc.h |  2 +
 3 files changed, 47 insertions(+), 54 deletions(-)
---
base-commit: f4044e1a6edcec2e63adc37a241f08af7fdd2834
change-id: 20251015-imx-rproc-c3_1-fec6f0297a9e

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

