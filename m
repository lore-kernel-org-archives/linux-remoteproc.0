Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012064.outbound.protection.outlook.com [52.101.66.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315B22E2F1F;
	Thu,  6 Nov 2025 03:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762399909; cv=fail; b=NIBcxowKrnhjgpU0KdNHQ+dp/S+cF+hKbq58Ua7BpN1oQyw9qoM7c64It+C5QOUyGl0Pgn1kOrxQ9cIU2yWnerKz4gby1DLRHLNeIxSmPl+LPL4sBiFehVdIzKwyOnPKzGa8NnOujgfCecBXzmaruzC4lXbDvq7sc0v5A6mexCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762399909; c=relaxed/simple;
	bh=wpplMwcEJ3v7rrfEfqpOXt5gQqU5ZoZirvtf/OXL3a4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=s4fl6sQkS9JWgaUy+CvmW82HsTERO9yXNhrN6YH2PbsceF5MKzjmfqarFqR7rkVLxGJPmaysunkxkhzJQOoYqPf6vG4rh/uAbAmafReLJAsCyb+T9LVd+opsAjxxDaPMm6fOoFOkIMdflBCj4lbqqedH9znuIydqXrUQVmkswuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WycDnRnq; arc=fail smtp.client-ip=52.101.66.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WycDnRnq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qXn5FUDUhhJm+H4Gpsd3551e4sNqG/raMO9W6A7QHnFo/R805A1s3V92b6Pmzd+/YQmBFkwi3WklkQIj7z3dYwa5TDym3KFcf+ILsqcAI9k7cmZ0js2Rq6r9pTp/oiMM6gT8Uu0FMBUirHzJ/pgBCx0qvEdBLYix0hUkVlw3zJYUJxEvuRjFgTPh0n/g/j6cQUg6YKCZwlzzqI9e68SQqMN2xqVvbo9iJJ7vlh3uGQIKCYcsyWu72VLgj8A/IiW0Go9PBtTPMELBqYPR+Vp/TMmZa6RbMg1E+gcfv+PWGy8T4aDXuQ8lrpXBBHtdzpj2bGWkT07eZ/nWRTweTaqcow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sf2whmWQN5dKodqoBrvEqYVleht56eGLU0oBXzmOtqk=;
 b=yi5E/4SpAYTi9C+eccD9CkywOX0vvV/U2up3/eOYTsNuEvPsJwNxvQKhkO5bDjdV6o5Syqr3lhoOHaWm09ehM8neT9h/Gens9Kcla7KJfffRhzEEGql5vUzmhrmeVRTsIZ/pSJpaWQV+nxwWUk7u9VezLYc31DGHGl0Ju9lHQeNbNGUGZprdUN3ABsmxOg/a8Nz2ILVyv8xGIDYrI7YRJqPKJzGm51WAVnvne5+jfWtvrY9YvKzJ2ZAnBMvcFcGaMMdIPyUgJbehSxwQUeEH/dCVWdiTG8gFR2loSTlTXHTx4ezRivCm0ENJJW5/qv5xewm32gA0OmkYRUldkjzzqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sf2whmWQN5dKodqoBrvEqYVleht56eGLU0oBXzmOtqk=;
 b=WycDnRnqXoOe+SaSsweXgXvh6OCfn43lRVnnpI+efux3AVooBH4nEc+N/soMkEsdXJjSxKDy5HWkMuz/yI3EQ9Io0rsMWVT6KhO4yCYkGUgbDL4/SpsjoDu/Hg/X4dCGvMmWqI7PCcatElEvQfKhZvUbSYwpo4tTZuzfOKJz8PXoDxKPkG+D8C7WsWYOE9+5DlRdh7Quz0R5oOOzhfSc9ssv2pDUD6R9X7RAF/6E+V9ag6iXPC0i2a3EgmwTMmvT+p4MjZnIe8QAEdQuOVDbHKu6J1QYMcQ1yi/ZU2a0e3APVbv/CoIE6VpVynNfgqNKPQXvEpLK/Dw7R/g0excXfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6813.eurprd04.prod.outlook.com (2603:10a6:803:13c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Thu, 6 Nov
 2025 03:31:45 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 03:31:45 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 06 Nov 2025 11:30:37 +0800
Subject: [PATCH 11/11] remoteproc: imx_rproc: Remove enum imx_rproc_method
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-imx-dsp-2025-11-06-v1-11-46028bc3459a@nxp.com>
References: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
In-Reply-To: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762399839; l=1152;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=wpplMwcEJ3v7rrfEfqpOXt5gQqU5ZoZirvtf/OXL3a4=;
 b=vj1IgdJldm1iMAS3NXi31nVGg4in/O16Ipu86ErtjiOVoizWv4CbBPFtXrw+BCu/DLxfaBjwL
 KLqTfmeZBiqAeUXDLRD4PvRlX5rWWXcCZA8y8OYeetxwNVj6KDN0X/n
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::15)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: d4f68b3a-3656-4089-642c-08de1ce502d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|366016|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?THEvVVJPRG8xWFNxbTlEL210Q0VIbEpFVXlROUN0eXAwYWNPWWtrbzFLeHNl?=
 =?utf-8?B?MnNyNnVrK2hrV3ljYmhITEpJZnppYVk4Z3FGQlFnTHpaWE1MNW0rZWdPYnJC?=
 =?utf-8?B?djlrNWJaNWRZOUp5MUltTU81UjdKRDFYTDlSMWxhNjBiUXNmV3R5Ums0c0Zt?=
 =?utf-8?B?NFo1YU1yaGpScEVBMnBBVG00SEx5OUc2eUt3VHFmUnlCRDg3SW5lQ2JqWHhP?=
 =?utf-8?B?WDlialNSanVET2J5MCtwOExVMitsaUhoS0xrYjV1d0J6VHVHanpXOEJPSjJw?=
 =?utf-8?B?aitKYlc4RnlGeGVBTUMzWUpqMzQwNUthZlpXQWVJTndGaWV0Rlk2bzdoeFQ4?=
 =?utf-8?B?L2RYNjJGQTNRSVVoZW5SaHUxMFpxdXpabUhDbFFRZEN1cjNYYTkwRnlWdzJZ?=
 =?utf-8?B?SlhqRlFacCthSnhNeUFmRFp2YVhYSGFMRFJFQlZ0YXVpSU1Rd3pFQkNDdUl2?=
 =?utf-8?B?OTVyUmlwcnVCL2pqM0EvNEdqNXJqOEcxWSsrT2t6OVNmNFpzV3hDMlFWc3k3?=
 =?utf-8?B?Qmh5eFhJYWEyeXZlbFgvQkQ4akRoazd2clo0dUIyTGFWVXZGenl1S1Rpb1Bi?=
 =?utf-8?B?YzlvbCtlQ3R3TGd1d0pGMUpYZmdFS1piNjRndjk5RXlDa05aTXQ4VklFSmZj?=
 =?utf-8?B?K3ZKMy9LRnlESGJGTXNVaVJXb0w5TkNmSGl1eUNncVI4SVY2dU9Wb0p0bVJh?=
 =?utf-8?B?bzRUNFRsYmpKQWIzbFllbENPZDd4WWJXYWJzNjFHY2UySWNWMno2b0FGamZz?=
 =?utf-8?B?WFJJbFA5cVIzODFOWjlDR1VDYmNHY0xydjJDYTl0K0d2ZGVJT0tvNWxiRXNn?=
 =?utf-8?B?eHdUWU1YblQwc05FekFNNStleThxZjRQK1JoeHFZbFVUaTEyejNwSG1laGpz?=
 =?utf-8?B?REI1NUR4MVBsVk9HcmthYk9kVlVZUjlBM25Vc1VLTjRPMVEyN0pxUCsxeHlS?=
 =?utf-8?B?VG9Gd29FbHNMSk5tVzF2OWZqRjIyb21jQjJ6Tk5oSkM4cXh1UTdpWk5hSU1l?=
 =?utf-8?B?dUtoa3VUcU9ZNnQ2MUtnNzV6YzFBK0FScGF5MVJQZmdodE92OVROTXl6akVJ?=
 =?utf-8?B?dmROekRIUUsvdE1JaXRIMDh2UjhYQ1UxMGFicWRxMjNwblB5RVc4UnVvK2Fu?=
 =?utf-8?B?MExJL044VkdmSUZVbWw5VDA0YmljQktvN2QrblErZVM5U0prSFEwNk9ORjBS?=
 =?utf-8?B?cno1VFhJckVjYXhtR0w0Z3VBTDJBbkJmNHNqbXgxZDhlYi9SZHkvZFpwaUNR?=
 =?utf-8?B?NkhHaHhXNCtObDdxb2RvYVBNajcrbmJUSzVOcFNQK0VQOFcwQklxSmFScmRT?=
 =?utf-8?B?Ti9aTE5NdnFGckF5a3krLzVCdGZKTjlyTFBGWHRXTmNYMjV1Z1RtK1hYZEc0?=
 =?utf-8?B?YXc1Tng4WE5xK2NWbGZ2cG1RdVlWYUtVT2M1QU5NektvTXRsZi9HbjI3QjJV?=
 =?utf-8?B?UmhRR1BMcjZoOEl5aFlhSGR3em5jRXZLSVVuQVhlQ1V6WlloZEFadW42N1kw?=
 =?utf-8?B?Z2p3bm9RZVhDOWl5d3JNZHB6NnZ4alluMnFCTURnRVlvQ3FxWlZaaHVnS1dw?=
 =?utf-8?B?L0FJaENBOHZXNDljcjJSS1BxWHhhSUlpSkFOeWtEYU1Qb2JVd21iVC9aRXBv?=
 =?utf-8?B?UHg4ZS90T1pzSzF0TkRkM3ZiWE95WGZOT3hvNHcvdjR6OXJzREJNZC9jcHA2?=
 =?utf-8?B?UjhRK29hMXFyKzJKclE4RzRxVXlsdjlPbFI4Q0w5TFd5SUZ5R2ZoczJkMlN2?=
 =?utf-8?B?NVo3RmR2VjJyMFVOQzJRb0xkaFllVTJtMTJZRDRlTlY5aUs4MUxKV20yTklC?=
 =?utf-8?B?NEZpbk9PVWF1QmVNVGRsT0N6TU4wZ1o1TFJDUkp0aXhYQTFwS3RTdFM2bXNS?=
 =?utf-8?B?bHFTQ2JVbDM4VFg0ZWpQS0dMYzdXM1dGZ2VnSk94SFNZWVU2eTM0K1ZTb0Fl?=
 =?utf-8?B?ei9Ma0VVcFhHaFVsMEhPU1JreEZWdGxURXFaSmI4dDhYWElnMWRjRUNyUDgx?=
 =?utf-8?B?Y3Vjb1BxaTM2dGVCajN5MkZtTENnUU9qcUNZVHZTekZkdWovOGU3bElCc1BT?=
 =?utf-8?B?ZWUrdm05VFdXaUNZYW04Unh2bEhudGtlM25ZUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(366016)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3RvN2U3RVZrbDFUMWg4anJpb0Zhb2RmU2hPSFZNVDFMNEJ2SW9wd2RRRG45?=
 =?utf-8?B?YnpKM1paeS9zdmFwWDRudll6SGZ6cTJISG9zWkd3UjJVR2tZS0IrRDF5N2xK?=
 =?utf-8?B?S0Q3V3lOTlBPMGJQSW9wZktiYUUrNzMzNnJveGlkeGNFNUFHZW1TMDdGWWFF?=
 =?utf-8?B?QllYK3N0WmRVdGNLT1lNays1TlVUVmtaVDRLUXZtOVFUaks5c1VXZmhTNzZD?=
 =?utf-8?B?aStieVp3cVZ6alBwQnVrM283TGhyQlRDbWZ1ejlxK2FhYUJwUVVrSkVKWi9L?=
 =?utf-8?B?WVM1YjZYNkcvVjFudFNLOGFvMm1FTlg5RnJaRXZ5YjNia0N1TFQwYnhrTC9s?=
 =?utf-8?B?S0JHMWVXbmRIVXFUdGRWakZSY0Y0WXNsUHVnd243cTZKTzhQS1c5eG10N1dG?=
 =?utf-8?B?NVM3ZXJBdHhtTTVhczRGVng4UFJSM3ltOHo1YUhjekN0WlJid1EzMXlNbEFM?=
 =?utf-8?B?NDlwR3VGblpFMUQ4V0taMTJ5UlF4bzJGTGFLdFZYTXIwTjMyWm9pTFRnVFZP?=
 =?utf-8?B?WFdsMnI2Tmc1VmFrTE1wRHJWRXpuWXRTRzIwTVRyQVBrNEJqdnVRV0pGejdk?=
 =?utf-8?B?a0ZxOStsVVRkUVk5NXMxRXE0QmgvdGF5OW9ObGxXRUtEakE1OC82b1BOdy9j?=
 =?utf-8?B?clNsRWpqOHhLMit0UmxHWi9hOVVVRFFVZm4yTzNpb3lscWFVbjdzVTNibTR6?=
 =?utf-8?B?RWdXS3VhVzIxMWV4Q1B0VUtnNC9UUWVFV0F2Ull3OWwzSmJMdWxSSlZMWVVL?=
 =?utf-8?B?a0xybGpPU2d1QWxsek5BZGJxV2ZkNUZvRE9ScW9KU2h2WmR0Sm1leHJhQ29z?=
 =?utf-8?B?Umc1c3BIOUZ4UUdEMjQ0NldhUWhXL1hzZG54NzMvUC9CdzJNaStVZUlyM2hH?=
 =?utf-8?B?WlJSZXV2ZTVZU0NGaURWM05XV2JmVHppTzlpdmdkQkNFSnJnejR1UmVUZGUv?=
 =?utf-8?B?RmN6aTRqWUdpUFhrcFB6K08zQWhuT2Q0UUJGUzhNTHdIalFDZG0vSmJjQWYx?=
 =?utf-8?B?ZjMwbEJqLy9kREpVNVRMU0ZweXZBSzBPVXhYR0x0M3I4ek5Gc1IwaVZoSDc3?=
 =?utf-8?B?ZWpEU3k0eEpIbFVCVzNLOUorc0xhLzROeHRTUXBSVGhBRCtGeFByRlpVa1h6?=
 =?utf-8?B?MDJkK2NQWnVBREwxVDNxVndZSE1relQza3BJWlFZRkdQNVkzQmpFOURtQ0FN?=
 =?utf-8?B?ME92cFljbFRRU2pTRzl0TWtUa3Ztdis3ODdTTlNwa2pzekRmc3hOTUlRWVA3?=
 =?utf-8?B?dW9sVE1VcUpiaG5PQlh0TDZaZTRwdzBFT0V0M1NSV2FHVnN3L1h6VVBnWHJs?=
 =?utf-8?B?SmwwczRac2FvTzM4OHNpbkF0R2doeFBqeWdYenFBRDlBRGNQNDVKcXNaOHEx?=
 =?utf-8?B?UjhLYURycXUybDcvMHRYUVdscDJRMW9LUUp5NVF5bmpoc3BSMmZQZzNnRjcr?=
 =?utf-8?B?YlhmbkR2L254d1FnTlRZL2VIc01pOEFmc2hPbnhnbWd2dlhsWWdkYTIwdFRY?=
 =?utf-8?B?aVBodFJYakVCVEhxdnRvajBxTHhVUTdqekpIWjdPbEt5M2NXd2dkejBRK21h?=
 =?utf-8?B?ekgvLzIraWhjV2hoMFFhZ3Y0OUZiejFoVVYxZUdHcnBYZko3UzVUb1orS0Rx?=
 =?utf-8?B?N2s4WkFCNFlhNng0WHJTRFFvd1FLQncvbDE3UUdCZWVhdHRDV0ovZWNZTG5Z?=
 =?utf-8?B?M3N0RnNQMzFTcmxwNXpVMTl6cTVMazJwRzdnTUFxKy8xWVJ0QmVSaUlESVI0?=
 =?utf-8?B?dDZPeTZuSGcxdlg4RElTZHk2MEpINnZOSFlLL2p0Y3cwSjNxU093RVh1a3VG?=
 =?utf-8?B?OW8zYmhmYmwwL2ZHWGNuc1RDd3oxTmQ4QVJzbEhRUVpKZVN0RTZHc2dJTTFy?=
 =?utf-8?B?NmdzMmZEZnkrcmxUZjNsRG1VS2JrMUthUHdIVExRRWp1c0k3d2pocjgxSEhj?=
 =?utf-8?B?OHNrazZCbVFmTU13QjhITUthbHBCYlBwYmdrdlB1ZVQ1aVhxc3F5dnJlQzha?=
 =?utf-8?B?TGRqdzFMc3RNYUJWRzBTY2E4MGh1RnBTeXUyU0pQTE9xRUZoUkQ1R0Q5Njkx?=
 =?utf-8?B?WmIvM2dqYkk4cDhiZzh3dVdVbjltMnp6dGNqRUxad2lQSnBUOVBrZmpQT0tG?=
 =?utf-8?Q?njEryOIQy6nFqB8jeIRviVfUs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f68b3a-3656-4089-642c-08de1ce502d9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 03:31:45.6391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yx00SnGn1UUG8xb77tA08TNjY9Qj6Cbtw8HRyLO2PtL56G7TMk2S9l9UGG2mea2fxlxn+489+QnusfXSiacSwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6813

There is no user of enum imx_rproc_method after moved to ops based
method. Remove it.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 6a7359f05178a937d02b027fe4166319068bd65c..1b2d9f4d6d19dcdc215be97f7e2ab3488281916a 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -15,13 +15,6 @@ struct imx_rproc_att {
 	int flags;
 };
 
-/* Remote core start/stop method */
-enum imx_rproc_method {
-	IMX_RPROC_NONE,
-	/* Through ARM SMCCC */
-	IMX_RPROC_SMC,
-};
-
 /* dcfg flags */
 #define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
 #define IMX_RPROC_NEED_CLKS		BIT(1)
@@ -42,7 +35,6 @@ struct imx_rproc_dcfg {
 	u32				gpr_wait;
 	const struct imx_rproc_att	*att;
 	size_t				att_size;
-	enum imx_rproc_method		method;
 	u32				flags;
 	const struct imx_rproc_plat_ops	*ops;
 };

-- 
2.37.1

