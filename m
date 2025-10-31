Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013071.outbound.protection.outlook.com [40.107.159.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07828333737;
	Fri, 31 Oct 2025 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901780; cv=fail; b=b1J6GdqOZlAFUFaAmLDwVPJ5UT1ChtVYqwlgl8PaNpOkmsJEJnbItACN6ox3v6dHuxoN/TEYKIU+XT9YPqIsmuC7FNK0sGsoFsrkpM8ZRC3ZbrGAwqIa+/U/fnVE0i6zAbOb94uWbjE7IHIda3QAsVc3vkdjFEaVmkqphEy+NZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901780; c=relaxed/simple;
	bh=F0Pu5PbYhXCcMNpvc6dhR3qAgy30IsI3/b/n/oMTBRs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=c1Ybv1348M/n4Piy4bJi8EDQHGgITjGSgFpXVC3pC+zAbfENvv4vkj0Qp8J/5y1vyqveltT7ZhMAxUmTz36yZguAvFAUVP66gFx6zzNDxAiID6K4uQBBGwkXzfT4q1P0qw1vS+I11xdCMiMLuLnUuou37USAiC6ATBJOzbLvz5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dMcwazh2; arc=fail smtp.client-ip=40.107.159.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dMcwazh2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LN7p2omyfi8LYiN1pKOg0Gnhd+d4b+HYSb1CHoiYztnD6HMNUCkpgmDykmNvNPt7wCmbhLh+i4+YZdNju7+ADPZSTCFbSje/qmAsBgRamk7U77lU37ugvJER/5KHDEqhHmq5b+sgXWNrSKLDNFfiS4qyb9rSAYeP0G6P5X7XY/V22TrnWeaRDC8mCwSjyxEXcMrRKnPmlQFWDIl0dUERirKCv4mhUxwzZlX5fIXoqNj6siRhmxcMcOvcUiior3we+DTH9ZgT0vO7d6bneFMZfL0HuOtIpQfsACugoH3M5geno2XBpzffZY2iQLX9LPQHea0wdjVyRTf4SS0VFpq0ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88S7jDrrnTqx6/BA7hoV+yGW7u4XQudImA9CZUvwv0k=;
 b=jA0LUsdIT3ZP6DrEZM+bkw5U6XfjV4Yxeud/7YKKySgBOLdDJ0WMUbiRxRaXo84XDiiDPKCoRcvqYKh0Iter4C/DLj5aCZjnozI3E46Y1yh6Q8WixdnnFGNQXpQlGpnHFCgQRaKs160k5J5EIEjgCOCsB4KWfQBj4MD4U895lT/VNjbv6Zl5ROG4z1kskknaXCcx8VR7DfnhbRWWY/qf9OILcVHnps78tJbDxLDO+coca+9f+WR3c6bhDmCWyC3Tb84CArPcFe2tG0xRIHXgKLmYjv5pBpAkEMmZbixP7T/0EwF/HYt1jBh6vchvSaNlBoFrBY0WcqbADVm3B1z08w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88S7jDrrnTqx6/BA7hoV+yGW7u4XQudImA9CZUvwv0k=;
 b=dMcwazh2BwXOpquuZYtXo8aV370QUIPKJhegnRSOo8euUO2RmnXXpWTbZoKie2t30negqkuSfwGayktFV/tnKWyaA/q5gEZkT41OIKCwHba2IWoJg8rbdY5zlr5sALJnYrLIXJrgJQrzHZM8TJy03wPWVCm53A5F3dNZXgtEVSa74fCMykqS6coAsvzhf4Eg6iAwvQFQeim4FvTTPjyGGc2LWpCHeb7WhUi2quXD2mSMoHJlDgbXtkqgUBPjK/RfHOqbIAOT2TNT+qHTJE5WzepitSTf+/9NtWI2/ZsaMfr1zmDNC98v1PJYRQH5wO8ou21lyAku+GcUPlqb4VXg1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8093.eurprd04.prod.outlook.com (2603:10a6:102:1c9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 09:09:36 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 09:09:36 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 31 Oct 2025 17:08:37 +0800
Subject: [PATCH 08/11] remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_MMIO
 switch case
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-imx-dsp-2025-10-31-v1-8-282f66f55804@nxp.com>
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
In-Reply-To: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761901729; l=5462;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=F0Pu5PbYhXCcMNpvc6dhR3qAgy30IsI3/b/n/oMTBRs=;
 b=o76M9stiHtHymzmEZ6mGEnYdukqVsnem9h8BPYWglg+8jEb25eGubauLgEFhKUtnkymMj8bVq
 SXlV2fAncLtBaiXM0qIJn1jAVnl5XwFgkUWT6S3ogfIwC/BO6tZ8OzN
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: cf1eff44-f7b9-4019-d713-08de185d36ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ck9xYTBpUWpsWTd3RE1ZSGNLeG80RDNrY25sRFNnU2RSeTV1dFVVVWNvTk5Y?=
 =?utf-8?B?M0pIb2VWdmFIcEdmR3NFL3pLK0RCZ3R6VFM2ZEJtTzl0RGhQOEx5VWRaV1ZC?=
 =?utf-8?B?SkRzc3F4Rjh5akNuS2NMWEV2TE14L2pHdjhoN2xjb2J6TWZram0zd0RyZ1dJ?=
 =?utf-8?B?T3R1dmU2cVNDelkyYjZBVUJWenl6YnVRZzV1UzVTaEJ4ejZCTmVzaUNidmhk?=
 =?utf-8?B?d2JjMHQzZ3dYWnVCOExvVzFueVpVRk5JRDg3Y3dUS01icElkSHpWajNkUURm?=
 =?utf-8?B?ZkpxTlBHMUZLR1VNVFhCbk5nNzdYRVdpRThyQnpQS3dzZVJodS9JK3I3VXc0?=
 =?utf-8?B?UGREd3o4ZHppdG5vdGN5bHRvVlBaNWxoV25XczJCYlJDTjJjL1FNd0wvQXFr?=
 =?utf-8?B?VzZFVi83TnNDTjVkL3piNnVNcFpxZkJySGJjMml0aHZUNzVYNlE4bWNjR2RW?=
 =?utf-8?B?ZkxWaXVLN2JsV1hpZi9CZk5jbDBMT2N1UFplOTdiSWJqNitJNEtheTVwMG9Y?=
 =?utf-8?B?bE5JWnB1T3lldGZKRW9EdGhVblZJL3YwYWJyOUV0MlQxT3ZsOGZETjFMUWhh?=
 =?utf-8?B?UkF1QW56bnVkNjRMelAyQ0NZUVpJYllZaDJIeVUvL2wyMzM2bk5xUXFxZFVV?=
 =?utf-8?B?bUdqaWY4VzNGejRmR1lwVDVOamNNRVF4L0w1NTVRQkNwd3NYRGdOUzd3UUZr?=
 =?utf-8?B?Qit4YU9qcE1sbWJxRjVMTWtKTGpqQmpLZGRtdmVIdlFKeTZ5V2VRWWczQ1hV?=
 =?utf-8?B?Z3RhSXhxVWZ2WWgvczVUMFF4b2dBTnBCMmpPRkVpcTFkZExPelhrcEhXd3ps?=
 =?utf-8?B?UVlIUmo3Q05FaVdGV2E4bng2SWovSC8rUnpaZ1kyUURodU9UYXFBbCtCdjhV?=
 =?utf-8?B?SnlIdGpvdGZPQnVpR09oMk9IYW5ZMmhXZEE4UHlpK3pIYlJUaXh1em1oZkpo?=
 =?utf-8?B?K0VKcno0NExIa0ppSWM3U0pVWGhTT2VFTTRGUzI2RmJLRU5nMzFVa09RZ24x?=
 =?utf-8?B?REtDSXhvT2NZK3N1czNGd2VXYWhSVXdab0xrdlF1UlZDelZibTdkYXFpa2tn?=
 =?utf-8?B?cDFCK1BtV0VWY0tPNWVDVHlTUEN0NlFoa0x6UVRGTFZxWVJVSnN5aUVkMXBE?=
 =?utf-8?B?RmtGa1l3K25rNmZLK2pXYnJ2bXhlVjZTdTV2cHQwQ0hrVnNWYzlCRHgvcGZH?=
 =?utf-8?B?TGRZMkE1bEVyUXZkVEl5ZVlPS1Vac016MzFvcFZLSCs3WHNSVVRBejR6aURa?=
 =?utf-8?B?OFExb3BaODlNREtWZERUNGU1RmNjOWtOUGx4TVg5Z3BEL1l0ZXVIbUR0eFZS?=
 =?utf-8?B?bVhicGRydU1LelROa0o2cUtMZ25iUjI1M050bXRyeUpYRUJLTzc5NkF3WXVJ?=
 =?utf-8?B?QzJjV1ArSkhZNDJzT0EzQ1BlT1dJcklCN01lSDJXYmtqVkRDZzh3ajFyZ0RH?=
 =?utf-8?B?TmZhR090YlBOQXh5VzJ3c1RPVms1NFhrc1BZSlJEWU9JVXlzYW81VFZGSmpP?=
 =?utf-8?B?M1R4dWNQV1BuaUQrNGI2WHQ1U09jS21sc0FYT1lNYVlQa3hNd1FIMVg5cWti?=
 =?utf-8?B?UzhmUnpBWnlraUtMNXdISFNqcGVMZnhYY1d3M0liZXFGZDVtbFluNDZYWkdy?=
 =?utf-8?B?RXY3cjZEWllEQTg1ajUxVEtjaVdxNDQ4QWpENk00cTNoTlUwYXlaclg4QWdw?=
 =?utf-8?B?Z09QdkxPSFkzRGxGUFFmUzN6eXEvYWwzbHlKQXlwc2hrNHdnSHNZZXo5NVND?=
 =?utf-8?B?d20rV29FOUIyL2ZxUFdYS241SlpUeUgrbndjbm1zaWsyck1yWVFjdGEvaDZs?=
 =?utf-8?B?a2xRY2ljTVJ6b3RTTjFKU3FOMlJFaThQVUtJOCtSZXJJckNHbFNRbWQ0ODB5?=
 =?utf-8?B?eVVFcmNyTG9QTmZZdjZ5ZFlnQkd0eXE5MTBTeHQ5VHQwM2RydlpNTTdHZTNW?=
 =?utf-8?B?SFV5QmJJRVlVZ1JJV05CTjMvWXlIMlNXRVE2UlFBbkZkMVl1dVEreElxVHYy?=
 =?utf-8?B?M1VPUzZYdTlxd3FxWUYrbk13VTNudDdLREtPbTZuWFo3YVFtdkp3dHJVdFJF?=
 =?utf-8?B?bTkwRnIxTzVySVA5WjBDYkJiRm5sU3YzbWxtQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUlXSlZvbk5QditiQ09kQVZMVE03cU5weFhZb2I3cmNJRlQxdHR3QWM5QXRk?=
 =?utf-8?B?L2JYN3FvdE54cjU4c1BVVjJMZ1VBQmFHaXQwNUlpVGwyZUVxZm9lcmFLRzVv?=
 =?utf-8?B?bTd3TGpoVDVsaDhJVkc3MGs5dEFIVEdPNXMyMFRrTUlhU3FYaEdFT3JDRHZM?=
 =?utf-8?B?V1crSFppTFR5SGpDZUlrSUFFbElBK09GRHBmTFMwVWIxbVpmbmNUU3c3bVBh?=
 =?utf-8?B?L0h0dTlTbkpkbm8yR0wxVUZDNVMzSHplSGRLNm4rZnEyN1JhZStOblovQXhk?=
 =?utf-8?B?dWo5bHNDSnA1N1poRk9mQVp1Rzd6SWlleXkvVU9oRjgyOGVhdVdzcUlNOW9C?=
 =?utf-8?B?ci8yaDVpUlR6NUNNQ0hRMWhod1NTY1dhS2YxbUtYQmRBMWFFQVYvOW9iOCsv?=
 =?utf-8?B?N0xTdWlrMWtLb3JmUUQ0OVhSenBGUG1SOW1LUEwwbjMraFphbVZQSDE5T1Zl?=
 =?utf-8?B?dVVzbGlDVG9jSzhNdXVhTmpLK0hEOEE0ajlrRTVJTWx5Z2xicEgrbEtqbkpv?=
 =?utf-8?B?VS9qWG0xcTV3UmIxWVlYY0MrZm9QWEYvSlNHak9CbmJxaVVTUlZvbi9DTG5S?=
 =?utf-8?B?QS9DVThZWXltRW05dzc4VmxGeFJ5R0dUVzJLelBkR0hTT0N0WmdwK3NZK2t6?=
 =?utf-8?B?aU5vUldWbzcrSlZBMVVqNkNhYmhxNzhrVi93YnFuREdzU0V6NjB3aGlUd3c1?=
 =?utf-8?B?M05MWCtIbzg1UjJxS1NqeEZWb2d2TXplSFJZZW9nQ2JjcWVSY2tOS0pvRS9H?=
 =?utf-8?B?WEdTMm1LMldLTkpPcUVQWEZReHFrc1NMRGlpUmcxK2Uya3hSOVE4SWFXZW1s?=
 =?utf-8?B?NE9aYnc4MktuNFZaZXBMS29VWkgyY01zOFEzTG0vUlJmK1hlTjJVZUowaW54?=
 =?utf-8?B?Q3hWaWYrSHgzWmxMS1VPUm5hZHZueC9yL2F0TFg1am9HcmJtSVpzemxtQXNE?=
 =?utf-8?B?bmEwcHNoL1YwVGQrUitZUzVPQk1RWjNkNUFKMFJkTHVxaDRTZWphbUh3bHFP?=
 =?utf-8?B?NlFQSjRjbk1OaFpXb1UwT296dmZvWWpLd1ZoRWNZU0dncU9kZUZvWWpJTElv?=
 =?utf-8?B?VXNtZzR4bU1NZ0RFTGhsRitXOUlOdWl5MnBqYWducEZKWEQ0TGdlMXFESXNZ?=
 =?utf-8?B?dldIWno4enBiWklvY3JONUkxRGRDK1RFTWxXQWpURXNiczBzZnp1eGZLN1du?=
 =?utf-8?B?RXkvcmFIeVIrMnRBNUM3ZVJOdkRWRURjdVlCalRmREE1TElab250Y2djYmtW?=
 =?utf-8?B?Y0hicE96a2ZlWUxydnVtMW9KMWFVR1hZWGdadmhydHY5L1dqTmR6b3ZSbVU2?=
 =?utf-8?B?b0ptZVhMS3VrVkZhdHR2Tklsd0RnYlVKQkR2d0xOM2twRkh3TGp4NVF6cUpF?=
 =?utf-8?B?djFuS05naVU0V2U5dkpSeWUzNFQ5RjFPYlhQL3BFNi92M0VyeXV0eEpidlZ5?=
 =?utf-8?B?MUEwb1labnhBN3ZBTlJMdGZ3K2M2b2g4YW9LaGhFQ0tiQ1JnMHVSaWIxVmFm?=
 =?utf-8?B?VUsrcjlibXQyN0VLRWtTcVdDaExIN1ZQclh2Qjlwd0Y0QmxndWp4TGRKZ0Mr?=
 =?utf-8?B?MVh5UkdFSS90RWpwMmZZeGpiRko0dnNTS2RBN200VDdNemVDZHhlS2YzZHBv?=
 =?utf-8?B?dm5zMmpWOGxyQUQyOTlzSjVBbStacVlLbkRUb0o4cnpFa1dqMjlud1dsNjJB?=
 =?utf-8?B?UGwwd0RlVXY2bHQ4ZTUrVGlzdWxMdTJUN0tCSEZhWElreGkzR1JNeDN1dSti?=
 =?utf-8?B?cTRIb21mTFpjdENKMXB6K1BBY3J2M1FMaFlEaUlLZHIrOUdlNzNmYzh1OGlU?=
 =?utf-8?B?VFBrazh3d1lxNXNCMFg0allpbTlQelJTSzQwNCt6NktVRWNpUTZkZ1E5Vjlh?=
 =?utf-8?B?eEhIVXBTaDh2VjVoMkwvUERUTm9PUmpRbDFFSjVKcW1CZjlKQUtYT1lFTXZz?=
 =?utf-8?B?Zmlxc3pCZzhOSG1MQW9Ib1gvL05iMFhjTENZeWpCSkVXRFFOY1VXZVFlVi93?=
 =?utf-8?B?eTRCYmg2SkxYdG51bExsclYzWTZKVWZCZFRIL08rZ204TlA3OFBhVGdPTm1l?=
 =?utf-8?B?Vlo2a2ZhRXhZbVJjWXFRcmpHSVJHVzcrNWg3R1JMZVZNcytBNDFtc24rcC9B?=
 =?utf-8?Q?TArL0afJZmGOazy/CSTimZh3Z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf1eff44-f7b9-4019-d713-08de185d36ab
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 09:09:36.4645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDERwc9cZIPWWQZnXbncwP3h2z0EsS0ZED6ULspl1KKegfs8jcv274jDXhEuEXWTSEtVxJsWfanUTorMXAt3Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8093

Introduce imx_dsp_rproc_mmio_{start, stop, detect_mode}() helper functions
for i.MX variants using IMX_RPROC_MMIO to manage remote processors.

Allows the removal of the IMX_RPROC_MMIO switch-case blocks from
imx_dsp_rproc_[start,stop,detect_mode](), resulting in cleaner and more
maintainable code.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 63 +++++++++++++++++++++++++-------------
 drivers/remoteproc/imx_rproc.h     |  2 --
 2 files changed, 42 insertions(+), 23 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index f28d25cab3f1d89e5cde37a04b528870a59abeed..456a46f163d3d823a25d16d11fb79fa9fceb2ddb 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -338,6 +338,15 @@ static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
 	return RSC_HANDLED;
 }
 
+static int imx_dsp_rproc_mmio_start(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
+	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
+
+	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
+}
+
 /*
  * Start function for rproc_ops
  *
@@ -360,12 +369,6 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 	}
 
 	switch (dcfg->method) {
-	case IMX_RPROC_MMIO:
-		ret = regmap_update_bits(priv->regmap,
-					 dcfg->src_reg,
-					 dcfg->src_mask,
-					 dcfg->src_start);
-		break;
 	case IMX_RPROC_SCU_API:
 		ret = imx_sc_pm_cpu_start(priv->ipc_handle,
 					  IMX_SC_R_DSP,
@@ -388,6 +391,15 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 	return ret;
 }
 
+static int imx_dsp_rproc_mmio_stop(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
+	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
+
+	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
+}
+
 /*
  * Stop function for rproc_ops
  * It clears the REMOTE_IS_READY flags
@@ -411,10 +423,6 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
 	}
 
 	switch (dcfg->method) {
-	case IMX_RPROC_MMIO:
-		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
-					 dcfg->src_stop);
-		break;
 	case IMX_RPROC_SCU_API:
 		ret = imx_sc_pm_cpu_start(priv->ipc_handle,
 					  IMX_SC_R_DSP,
@@ -1032,6 +1040,23 @@ static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
 	return devm_pm_domain_attach_list(dev, NULL, &priv->pd_list);
 }
 
+static int imx_dsp_rproc_mmio_detect_mode(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+	struct device *dev = rproc->dev.parent;
+	struct regmap *regmap;
+
+	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,dsp-ctrl");
+	if (IS_ERR(regmap)) {
+		dev_err(dev, "failed to find syscon\n");
+		return PTR_ERR(regmap);
+	}
+
+	priv->regmap = regmap;
+
+	return 0;
+}
+
 /**
  * imx_dsp_rproc_detect_mode() - detect DSP control mode
  * @priv: private data pointer
@@ -1049,7 +1074,6 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
 	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
 	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
 	struct device *dev = priv->rproc->dev.parent;
-	struct regmap *regmap;
 	int ret = 0;
 
 	if (dcfg->ops && dcfg->ops->detect_mode)
@@ -1061,15 +1085,6 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
 		if (ret)
 			return ret;
 		break;
-	case IMX_RPROC_MMIO:
-		regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,dsp-ctrl");
-		if (IS_ERR(regmap)) {
-			dev_err(dev, "failed to find syscon\n");
-			return PTR_ERR(regmap);
-		}
-
-		priv->regmap = regmap;
-		break;
 	case IMX_RPROC_RESET_CONTROLLER:
 		priv->run_stall = devm_reset_control_get_exclusive(dev, "runstall");
 		if (IS_ERR(priv->run_stall)) {
@@ -1301,6 +1316,12 @@ static const struct dev_pm_ops imx_dsp_rproc_pm_ops = {
 	RUNTIME_PM_OPS(imx_dsp_runtime_suspend, imx_dsp_runtime_resume, NULL)
 };
 
+static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_mmio = {
+	.start		= imx_dsp_rproc_mmio_start,
+	.stop		= imx_dsp_rproc_mmio_stop,
+	.detect_mode	= imx_dsp_rproc_mmio_detect_mode,
+};
+
 /* Specific configuration for i.MX8MP */
 static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8mp = {
 	.att		= imx_dsp_rproc_att_imx8mp,
@@ -1321,7 +1342,7 @@ static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8ulp = {
 	.src_stop	= IMX8ULP_SYSCTRL0_DSP_STALL,
 	.att		= imx_dsp_rproc_att_imx8ulp,
 	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8ulp),
-	.method		= IMX_RPROC_MMIO,
+	.ops		= &imx_dsp_rproc_ops_mmio,
 };
 
 static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8ulp = {
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index aeed08bdfb5619c7afd7201589f417cfd6745818..912827c39c0dedeed76c13740efd42a8e7cf9c45 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -18,8 +18,6 @@ struct imx_rproc_att {
 /* Remote core start/stop method */
 enum imx_rproc_method {
 	IMX_RPROC_NONE,
-	/* Through syscon regmap */
-	IMX_RPROC_MMIO,
 	/* Through ARM SMCCC */
 	IMX_RPROC_SMC,
 	/* Through System Control Unit API */

-- 
2.37.1

