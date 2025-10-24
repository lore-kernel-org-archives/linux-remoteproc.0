Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012004.outbound.protection.outlook.com [52.101.66.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5B926FD84;
	Fri, 24 Oct 2025 02:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761274324; cv=fail; b=uSbzxfaXtdyU1+u8OQWfBK1C09Xcxrpg5yD0j8SWylsGNd9o9jVv/bjPxuKzy+Ya40AjMW3CtbKfLswyQoI/XMXtnRnPTgMxjM3TqHnBEhedQ/smoeRsTWfk/ge2pmc+/Aiu2AQk8DYbdR7NEKZ1CLcov6dVEbNqKaV8T6IVKqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761274324; c=relaxed/simple;
	bh=VXYpdHvUw57i+0LvSXSztrq0W9UubBlIsjx2j57GckM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lTZTxvgUsWrHL4dIZib4qY3SkmUIxFMaePsKVljvCk5t97eWnqwbdmmLXFioXR9cVVw+hEmk9AJhAZUzIHA98hYvYpK8TcMfKgRR0iDtyY2xeNB5FprnxH5ySkFhEmKi7kbcavaPbMUmDh3QVmwXGvGFKzDTQlDwhSpLJ109bdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Loufd/hU; arc=fail smtp.client-ip=52.101.66.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Loufd/hU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rn2CwQ3gLUjRq0iTsCs7tyxxnWkLKJUXJIGaL5rT18peEIV9ABLS8bAncvWXoWFOArGajofoKXjqemm4svImtUQenppDbnitIr9LLFUMOuhNJMBt/3it8nlvXBS0/y2rXd5c88B0Fu0qBXLdhtFZs6tqEqulJZy4/QvwP3SFZflMOmr6BKlvi2SO3zA6zrHqeOrzhqpsArPM89AsFVDQ3bd+7TWc21tyTSUJZOywPqmqpmxu6nHPSrnbVVBQMSs9KY8UBAemnh4vyBX2gmOrMkEW65QBwTgPzkGC1tRNH1V/dekfsHH7JJhHs4eCB5m8XXi7Pk8DxpZn2zNP/AHg+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPWpybrGn6jf5Y+4QJCjSXIb0B5LyOL5jkhUOnY+GXk=;
 b=R2CbTt0cViLd4ygv24avE3y9xqZojL/EpZJysbqeZq6ExnKVm00m9L2jn4yWMgtwa2HHI7JAzUz2Yzqi1yPYwGplqozcjBYjuO58sgZW6jrYgtxntmd1BWURSR+pQzTforvgFzs9+z3H2pVg/6MJYwXZDShBJMpSR80lxcoqRi+zzn3CyYbRjLtf1dkjyJz01s2XO6AnM1FAc+97kD1Fgnnp8AQY104bWKjuJ+fifJW/XM78mpTcP9EzZiVL4kIO1sHrFsyGjFRMw9ftme2FF1g0FZRSkj1C+EXaZo1Je0+or3ARnDXHLMwXwi8fBfaTDUYSnYfCySXSQQk9hqPFvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPWpybrGn6jf5Y+4QJCjSXIb0B5LyOL5jkhUOnY+GXk=;
 b=Loufd/hUyZLQqmEAqUUuYZNovJIl/jasD+ePcP/RsvTS71XlL6c0XDTyj4L1TLBlop4fDSe95r4IOSAQHT4iAm9qGvX8RuKzG5VEBhO4oD61nCuvCEVTMh6fHrrq+ZZLZRaI5E3yMFZu/UIRVjaqaYGTIW5UzThOUyNVkT7B+pnKquNDwOLoR/VKnM5Zct8nRQl5cb4Zuhwf+ExMHLqVY+xAozrFsCCY7PEBvj4ooBof3T7rwqm+1/7HsObaJAOEGNK5K557pDEljss1Fh4CgoNqbY9RSsVXI8HJuzkHEksqKlqzM15PrSFKvLxZDIaQKcXLLBEWX/uonvM67P9AnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8197.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 02:51:58 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 02:51:58 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 24 Oct 2025 10:51:29 +0800
Subject: [PATCH v4 2/4] remoteproc: imx_rproc: Make detach operation
 platform-specific
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-imx_rproc_c4-v4-2-af83ed3fdbba@nxp.com>
References: <20251024-imx_rproc_c4-v4-0-af83ed3fdbba@nxp.com>
In-Reply-To: <20251024-imx_rproc_c4-v4-0-af83ed3fdbba@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761274300; l=2976;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=VXYpdHvUw57i+0LvSXSztrq0W9UubBlIsjx2j57GckM=;
 b=AdKEzGHtaFk+Ui73DqfLjJt5LRn9XqORIuKs9NfKL6VpYXoj63bgAgByKsBDfRwHyOld2NeTE
 T8UVb6B2L6cAKzd1dE1WTVNpul7NQkPnRSlCmuFflKuS+93+OIzjRk9
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: 2895e375-8960-4233-0e57-08de12a84c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHZJY2ZaT1pOYkNrWVJ1R0RBS3ZDOHc4RUM0b053bkJtYmorOVJCWmpDdllL?=
 =?utf-8?B?RG40bWlSazdLQ0tya2pCNEtIOTk5USsxdktIaVM4RFJzQm9OY3doL1NXSW14?=
 =?utf-8?B?S2lrNjJpQjRJUHdDU2NCWnNmRVMySFJkSWFJVkcrRks3Q2x0dkVXVWVZR3VP?=
 =?utf-8?B?QWpESXQ5Y3EvOWxXZzRyY1dIVHVibGJUdTM5a1krVXBoOXV1U2pPajMxZFpn?=
 =?utf-8?B?N0d6MHkzc1VGWWx3bC91YWE5VkJCUjcrcVUrVVhNT0QwbWhkYTcwSDlpSTJp?=
 =?utf-8?B?YnNpZG9CTHl6MGRld1NaWmFSQzFGZ0phaWdiMFJDajl1NThkS0Z2OUdmbHh6?=
 =?utf-8?B?VHdlcW9nUUFSS1R6OS9lWUtTbTBmbkpWZ3lmRHJyc29OWjRiM3c2bnUyWUpV?=
 =?utf-8?B?bnFsRjBQYjBPMmFqdGp2TklkSEY0WlpHdHBrcXFBa0RwM3d2eGpWcE1iM2lZ?=
 =?utf-8?B?QnJLck5TWUkxMjlLOFNzb2FrdjA1WVdMN2hUbWtlTFhsQ0d0SXB6RENXYmpm?=
 =?utf-8?B?SG1CMWE1M2h6R3JzRFU1d0tNRU5QRmcvQlc2Z1VYU3JaVHQwUjdpb0JyQkZC?=
 =?utf-8?B?SHRFRno2UHBTK2pBQXVka0R6QkZSdWwxOVNNR3FBWXVldExzRzNIai92MWRk?=
 =?utf-8?B?M3BvbzVaY2lBM3ZWMW9OR3Fib29yZGVkcTBsZWl0MkFUMDk5M2pSNGE5SUF4?=
 =?utf-8?B?N1IyazE1LzBBbGsvYlhSMjgxZ1JlZnphdHVsdDk4QzNudmd3TXNWNXl1TFpP?=
 =?utf-8?B?d2VNMUlEdFBJQVVjVGF6bXRzNU0zNEFBZGJVUGU2eCtpQjBaYXRUVkRkRTIz?=
 =?utf-8?B?a283SWpxdXRYcUVKNWZuWHVYK1c1cXViVWcwTEh5aUZSYVcxeHJ5TzZWeEF1?=
 =?utf-8?B?UlBBLzduMWZkZm9HSURvek5YazRkT25LZWxPR0w3TkJPbkd5TjlKY3pIdzda?=
 =?utf-8?B?VlhhcDI3WXdZWlY4bHM4VkdaTmJNaXFIZFR1aDhCenhHbThVaG1UTk0xd3Rj?=
 =?utf-8?B?MzE2THpidFNGL3FsMHI2MmMxRjNTVDY1c0RpRi9TL2FDQ1hzM0dpUVE3R2lP?=
 =?utf-8?B?alBoVWJWK2htVFR3WWRRbHg3aUl5a0hsN0RMc1UwN0YwaXUyRnEza0VZWlpq?=
 =?utf-8?B?VSs0d1lsQkVZNFdpZDlraDFLZG1Ia1pCKzVHeFlPa3dVMVhjSDE4eEY1d3JH?=
 =?utf-8?B?NTRLbW1zVGptNzdweExpUE0rbmZzeFlXaUhKaldGSjJNdGlBZ1JnTENPUndl?=
 =?utf-8?B?d0tOYS9zcis4eUJuTE16ZWNhSmR0TERxeWZycGI3NjB5NWNIc0p5TXhQSDZI?=
 =?utf-8?B?c1A0Qlp4clJiTUE4Q254YXMyQWk1c1RTaVNMQVZiU2NZbGg4NkdvNjUrT09j?=
 =?utf-8?B?MHJneHFuUXd3MlB3VXcxYkRhUmltOVNaN3RQUEpyc2k1WGUwN3UrQlVyK083?=
 =?utf-8?B?RVdha2EzMS9kQ2QydmNHSCttSGV5MldFcFZoU08rTkVXU2VnWFROanRSUVNK?=
 =?utf-8?B?ZUU0cmUxRlFTY2wyaEJ3bk8wS3RJVXQ5YnRFVyswdTBFbzlMMnlWZ0RjaFJk?=
 =?utf-8?B?d3RjUElpL1UyYXQzT290Z04rd3E4Qk5pRmZMbmFtb3d3Q0pscFpSc1FwRGNq?=
 =?utf-8?B?c0MraU5JZVU3RkZENHc1U1B2T3BzZE1rN0RBOEF2VXVXQVJsSTgrZ3djZnJp?=
 =?utf-8?B?VTIraXJEMGdRSU5sbThKRFpYbFJGVllzQUFSbmZwQTZZTy9JMVJOaUF6dFFs?=
 =?utf-8?B?cDZ0S2FBRENSOXIwcW1EQk4xU2VvQzlETjhnL3hXZG41d1NsQTdpQ1ZUU3hn?=
 =?utf-8?B?YzRJQUN6WlhlUFk1b3RUYlVZNlJkSDd6bjBVUjhESDJnd3dwZHdMSDYvN012?=
 =?utf-8?B?c08vVk5lWEdxbHU5eFJLalg0RXBtbS83c2RXcnNjU001dUYzbU1Ya2tSVTJq?=
 =?utf-8?B?ZmJRVVA5aEhLK3BtRy9LUXlNMi9IYXNhN1cvN2p0NUNUVlJObXk2NFczazI5?=
 =?utf-8?B?b1I4MVV0RUpQbnpqa0Q0cWx5UDg2L0JtRTNObUgrNDg0UnoxQXY3NEF1Ynd5?=
 =?utf-8?Q?p//6Sx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDIxK3ZraUtua1d1bm9oUzh5ZCtXRXByalZDeis4cVFFbkx0MEhJSk0wdGl2?=
 =?utf-8?B?ck52T3lYMjVnamVvcGJQcTdhckhYMzRxTFR0U3o2Tks1T01aQUJ0Y1RsVFN5?=
 =?utf-8?B?a3laZGdiSXZwaWppbGdMUmJaRHZ1RVZhNTgzb3VxbDh2d1hvMktzc01Lc0Qw?=
 =?utf-8?B?MUJuS3JMSmczN0NxV3dQcG5rNnN5VlYxZnRaVWRuK1BnbGJzTGhvNmFnVTls?=
 =?utf-8?B?UDA3emhaOXMveldIUFpIWXlBK01OYXZPdzZwZDVwY0p2eTJQVU1KOWUwS2Ex?=
 =?utf-8?B?Ymc1UHdaUlVFWnhRUFczVHh1cXJVamtlSDZUSUh4NStIV3JFUnkzUEJmMjlI?=
 =?utf-8?B?dlV3Z1VkSHdjVVh2dzRPVCs0UEVEMEltWVVTU3h4MFZtc0lCRm9IcitITHFm?=
 =?utf-8?B?cjZHZlQ1Wmw1bDB0R0Z5aU0xWmFybG50TnpvTlpWL3M4Qmo3ZmFBZjJhbXIx?=
 =?utf-8?B?NlhqWFRzT1drcitVcmtQamZnbHJBcmlsWWNES3g3cHl0R0toaEtqYU9iRUlB?=
 =?utf-8?B?UGhNa3FyTGF6cm5FY1RWZ1VGL3ZqMlFSdVdSVkZrTDhubUhUSDVySTh2OHBU?=
 =?utf-8?B?b3dNUDM3TkdpWDlyWGd5TmVRUnhhczNUMEZPUGpFTjZOdkc4UUlZeW9pYU0z?=
 =?utf-8?B?YSsza1o4MHhscWI3azllaEFMVXFrZVBpQ2k1cFdoTHVSaFkvbkdnQWRNTURa?=
 =?utf-8?B?QzQzckpsa2VWM3ZjeVpEempOblFTaVMvK05pR3R4YTMxcEpKREVzczlmMUdm?=
 =?utf-8?B?YXF4TkxvVGFWY1c1dWdTdkNkTmVPTE1qS0FlK1FQUUk5M20zT0g2c1VHRElP?=
 =?utf-8?B?aTdEY2Fkdk5WTlVnZ2VQa081TEZjUkNqN0RBUmxrMUNHSk9CbkxNRnNMZHJ4?=
 =?utf-8?B?TTJmWXV4czl2blJYM1lGdU5JaGpxdGd0RDZ4dk5JbzlpY3RvVEhGaEtOVFpV?=
 =?utf-8?B?NDFuQm9pZ2JQRGdGV2tIeHc2VDdpZGk2ZFlhNFlPa1B6ZEZrWlNWWXRuNjVl?=
 =?utf-8?B?NVdkS041cE1PeXVjd0ZwcEMxM3hiai9BUThtQVlDczFybzM2bWo3a1FVbWpY?=
 =?utf-8?B?Skc5alZ5YXhpeW4zUFMyQTNTV3JkOTZNVDR5WG1ld2JZMjJIcG9sNG5ZKzdH?=
 =?utf-8?B?VUpZV0RPb2xpVU04eVU4V3lMOVNKQVhOdVBaZFJBMk5jSHVVaEtySFp3QmRs?=
 =?utf-8?B?NzcvdWEyWFE1NVZCaEptVnROUjBlazFZbndENmxWckFKNjZYYmgxN0JxbGR1?=
 =?utf-8?B?SUsyMzFJUU1Ta1Z1Z1haeU5EVk16bUNhN3Mzd0xiSU5pZDVUN2cvM2NIVnQ0?=
 =?utf-8?B?WUxtbXdpa2xUajIxVmVuQm41MFZXV1hkV3AyYk1RZytTT3Q5K2N3RkMwRUgr?=
 =?utf-8?B?akpEenhmaUtjdUdqdUNhampvQ2pWcGZabStycFpUWGE0Y2o4elhRK2JJRjR1?=
 =?utf-8?B?WUJGWWd2WmZkemNUelFRN1lpRld0TVhHWjF4cC80Z2VhVFVqaGtJbytzTHlE?=
 =?utf-8?B?STBUSkRPTnhtY3RieDhMeElSVTdNL01zYU12cmh4eHVLOURrYmJvcGEyNG9C?=
 =?utf-8?B?V00yTjR0V05zT1dsV0FlSEhYbDl6UmkvblBWSE5JTDh6dlhkVmFBcWZMeHpY?=
 =?utf-8?B?bS9vcWczQVpqU2g2S1ROeE1Qd0xPalFNRTMvSy92NkwzZUNVMnhSUVRXSFdJ?=
 =?utf-8?B?YnF4aXFvZUZSbkMwa20xVGE1eE5PSzhnZ1l4d3Mwc0Q5UmJvMmNxMGw3SE0y?=
 =?utf-8?B?UnJFMzR0SnpJZXd3bkRLSFZmQWZNM2JCNHFTTzd5TndOOHpmWnJYN2l2R3Nr?=
 =?utf-8?B?dXFTNU15RFozbVowbE9pb1NIZnVCZ2M2ZXl6dGM4MHlhRjR5eDI5bHFiYnhN?=
 =?utf-8?B?amdjdGMwcGtja3dMOUtuUVdiS2xHdzR6enZSU1IzQWxya09RM2xwcytuOTRJ?=
 =?utf-8?B?cVlQK3lmYUpqT05sNzlsTFhZNTgyM0lKc2VhMHBDd3BzMHVJeWNXc2FMdnBC?=
 =?utf-8?B?Z2x2STFlZDV6V2QxaEQ3eHkxWm9TU3NuTjhwaHJlOGN2U3lPbHAwS1hOSGdX?=
 =?utf-8?B?N09GNWJCMHFydElBbmtuckY2UFJFRmQza2MxNzdWMU5TdlJZWkhWbDdQWUJC?=
 =?utf-8?Q?S1++l/WZl1j+CMz4ekibVTKL+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2895e375-8960-4233-0e57-08de12a84c88
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 02:51:58.4674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CtQhVCb5vM6tGQjoLBxGHyE6FwPR4Ygh0eGOf5G8zeRoJ8aQ3UyRlztWJNCljTGVm8jdTUQsh9AiFk9w9TLz2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8197

Refactor the detach logic to support platform-specific implementations via
the dcfg->ops->detach callback. Allow finer control over detach behavior
depending on the remote processor management method, and make it easier
to add detach support for new SoCs.

The previous hardcoded SCU API detach logic is now moved into a dedicated
imx_rproc_scu_api_detach() function, and registered via the plat ops
structure. The generic imx_rproc_detach() now delegates to the
platform-specific handler if available.

Also, the dcfg->method check with IMX_RPROC_SCU_API is removed.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 18 +++++++++++++-----
 drivers/remoteproc/imx_rproc.h |  1 +
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 2a71863c09e917719301e02c3cd535a2852abbea..820b0cd5adbb17ce5665e7ec2786bca23f1a67ea 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -575,13 +575,9 @@ static int imx_rproc_attach(struct rproc *rproc)
 	return imx_rproc_xtr_mbox_init(rproc, true);
 }
 
-static int imx_rproc_detach(struct rproc *rproc)
+static int imx_rproc_scu_api_detach(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
-
-	if (dcfg->method != IMX_RPROC_SCU_API)
-		return -EOPNOTSUPP;
 
 	if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id))
 		return -EOPNOTSUPP;
@@ -591,6 +587,17 @@ static int imx_rproc_detach(struct rproc *rproc)
 	return 0;
 }
 
+static int imx_rproc_detach(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	if (!dcfg->ops || !dcfg->ops->detach)
+		return -EOPNOTSUPP;
+
+	return dcfg->ops->detach(rproc);
+}
+
 static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -1162,6 +1169,7 @@ static const struct imx_rproc_plat_ops imx_rproc_ops_mmio = {
 static const struct imx_rproc_plat_ops imx_rproc_ops_scu_api = {
 	.start		= imx_rproc_scu_api_start,
 	.stop		= imx_rproc_scu_api_stop,
+	.detach		= imx_rproc_scu_api_detach,
 	.detect_mode	= imx_rproc_scu_api_detect_mode,
 };
 
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index a9cba623560c85ea37e47401c392c06dada500aa..aeed08bdfb5619c7afd7201589f417cfd6745818 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -35,6 +35,7 @@ enum imx_rproc_method {
 struct imx_rproc_plat_ops {
 	int (*start)(struct rproc *rproc);
 	int (*stop)(struct rproc *rproc);
+	int (*detach)(struct rproc *rproc);
 	int (*detect_mode)(struct rproc *rproc);
 };
 

-- 
2.37.1

