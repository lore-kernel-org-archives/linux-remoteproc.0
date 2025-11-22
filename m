Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011020.outbound.protection.outlook.com [40.107.130.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71DD257845;
	Sat, 22 Nov 2025 00:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763773139; cv=fail; b=G4+GtiNXorWkpLZx/ioKpBmoo8YLf9mA/Yp7+tQPfAG0b6Relg9zEEm+1uxxMPyhiJsv85vxSKM4F3FhUgXFigmfEAnxFTMutC4JwqE5wiYHayT3k177+o9HLFNWAh99HJzjOjjDwwD48PyAoumTqD47WpIhPD4viJxrHpaWJI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763773139; c=relaxed/simple;
	bh=fi1nZ4uNm+RVKdBZilpCVWADu9pEkM+cSJrROU+75fw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TIoYQNxWkKATgKQqtLzTlinMm5uhYZdIhcf9E44nxe31WC18YMCi5kMzNyoZnfI5cjIWtE3QrGoXT1nxIk3dntRkRthiCX31zbklD3Ca4fMgvL/lS5cIgT96ETjPeA+86SfivajV8n4ZjZ7GVT/3vx24imlW5SSALPRXaY2FS1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eo8D77JN; arc=fail smtp.client-ip=40.107.130.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eo8D77JN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rjH5y1z/83FEyIX71AQ1mSdFvcOLvCTAqeieSDAbYQBJwQgNgSSYswZ+QTeCVmt1UuDVKLBN87R7mZ4lK2mBmQAeBPvQFGC6n6xFe8vSY1FN6KYLeeF/LS0B8OD2tuA8LaxdRv9FvuTLtEm7DzzUSqzQMZFN/mHp3j3NisLKYdwTbP1EJJEWMAWf7K+Akpr9xxcYxIZTpLCXjchP9MEc61WhpapF2nwFSpFj8A5KR3EFKDA2nQvfOlYV7e1RUq5WAXaRpzWFgvpqSSSM407etIUtElFJF9cEfB0Dtp/hoDmWKVi/i7TH1pLYZq64ZF49F7HzruAyUAGDGefLHcRYdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoLMY+IfmuCVwCBWcJlDpSxARGW43eKJ/WcRI5cRl4A=;
 b=DZyXvKxJlaNcUFh67jYqqLAMF92pIJYBWSDzTBkbVnqxNYQDqOn0KubfR6XgW7xHRjxIRVH3uP/mZzKB/1RVn7Xjkk19XRpSs57CGOVztC/UMiicKmUZ1tOjiQN+XOhy/+nh/nlbtUrWsfF41q/l0X1Zxq0X4lCPZGojx76bw8fxo4BUhI91Xj3PrBhKyCA/8R5xmTTEd+3s9kkWdxA2gzLoIt8JlH/0p572+RU3tPUMHqvdr7jUpowbq1cWbtO+3ZS8ttqdPNxVrphHCjC8tuKbiwCqoQ6Mrcnj2fUQSbI4jM+J0Nrl89TM5TD7mCx07OHEpoqVRdDsao48MRVrgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoLMY+IfmuCVwCBWcJlDpSxARGW43eKJ/WcRI5cRl4A=;
 b=eo8D77JNaNdof9yZaA9pF0jz54UEfWIS4NYsbpCc1KEP+fWMICsjLUcOOUk8YgFxBAeYcWcIyJGsKNnD3+fdzhdtaS52unmjBz2Kj1NttuFpBzZEsE2wMgRJtnXph/irN01kpOri5hFWgVmckToezKtdsdNROzWqpqM3AfgLHhNSNzvAKNGbYGnIQBP7jrfuFDwg83H7vtKgLCnp3nSxeFj/TVcy//kuXDJR6OCQrXSAXcird/0a3JS7kkKibKpwPhlgpWzmIEKM0o1hQJVaASGlJ9H1M3RFVFfKxrnT7pvb2xEbMMRU4JsFyaMKYEQtK4ZSFwO++EzKLxxIccYo1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DUZPR04MB9917.eurprd04.prod.outlook.com (2603:10a6:10:4d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Sat, 22 Nov
 2025 00:58:54 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9343.009; Sat, 22 Nov 2025
 00:58:54 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 22 Nov 2025 08:58:18 +0800
Subject: [PATCH v3 3/5] remoteproc: imx_rproc: Introduce prepare ops for
 imx_rproc_dcfg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-imx95-rproc-2025-11-20-v3-3-9ae6ee619a78@nxp.com>
References: <20251122-imx95-rproc-2025-11-20-v3-0-9ae6ee619a78@nxp.com>
In-Reply-To: <20251122-imx95-rproc-2025-11-20-v3-0-9ae6ee619a78@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::9) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DUZPR04MB9917:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f5cb99d-b700-4aa0-6e81-08de29624ee4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|7416014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWR1eTdCcjZ3QWNwMG9DL2NRZ3Q4dzVWdyt6QTFoSElxdlVaZmFpeWhPcXc1?=
 =?utf-8?B?QVBtZTg5MTRVTUs4dHc5Q0w2ZUZsTHFUamlXVlpySDI2amVGWTFpa2F2UnRw?=
 =?utf-8?B?N0tmYjlyUWhPTmp0Z1N3WlVMa1JobEVuQWtnR3pXc2JIcTJZT1laeFFuYWZn?=
 =?utf-8?B?eFZUbUZNMDFOeXllUm1mcFFDeDFNT1Z5bW5Wb1dqZC9oajZjQXZSYXozS294?=
 =?utf-8?B?TnE1TmJrYUpadzBjSzhHWjdLL3kzck5ncDAycmpRbTlOeGFTN0J5UEVnNG9C?=
 =?utf-8?B?bDRGT3lXRGlEOGJFWU9aalJVemxFT3dBTWkyNTdMbFVNZURySXQrekVDSUpy?=
 =?utf-8?B?ajhSRlo1T0pkeXo5akNsMXVKbzZQUDdDejFJYzR0N2krV3d2cDVCelIwdTlv?=
 =?utf-8?B?akRucURFUVo1MkxVQ2ZyNDVhK1JiOGRDWm56TnZjdUptZzJRTjV3U2JxTDNJ?=
 =?utf-8?B?M0UxdjBaNGlta2lwelNwcWFVVWFvM3NPa0t5SWVZY2diR1lsK1ppRGVQbjFV?=
 =?utf-8?B?SEFYSDMyRkRxRzBSU2FON1hnL2hQMHg4eDRkNndmcURVSVBUSDlSajkxMVAr?=
 =?utf-8?B?RUZuYW1pSEE2NWY1UzBVRmhTV2ZDbjNwancxRzhEZEE1eHBZYmdzcW04Wmk1?=
 =?utf-8?B?OUNQazVOcVlraDZvUjcwcnd6bWlISzhDYVk3b3BmNWlEN09rR3VObEMwTFpN?=
 =?utf-8?B?VmdkOVZsanAwS28rQ2FjMUZENXNGdHZvU3A0U1hVZDltay92ZnluYnZzZVlN?=
 =?utf-8?B?T1Q1Q1hacnRKWWxtcEpsNU9mdjIwVDI1SDlTamdOM1A5dXFkY1p0dEdsYUlv?=
 =?utf-8?B?c3M3ZXdSQVBBTE1JdzY5cCtFTGUwTXUrVzVrNnNiNS9GODVVblZqNGthaEcx?=
 =?utf-8?B?OVFCV29mTmxFOWN5b01NYjgxSUlQK3V1VUh2dWl3Sm4reTF1US9TQ1Z5MDJO?=
 =?utf-8?B?ekw1ekxGYzNEbVFNTGw0WUVaNXIxVzFMMVNpOWZBUjlybjB5ZXZFSElrdXVM?=
 =?utf-8?B?MzBYMnZKUGxtV2srNjJNT3FudGxPSklFNWJIU2xLOFhaVXZEZVpzcmtIUXdr?=
 =?utf-8?B?QUx3RXQ0QTJ5alFrTitkWkFUVlR1Z2l2RXRlaUR4bVkrTW9ZSU5XMFhBU0Fr?=
 =?utf-8?B?enNoZlhGTk1LOHpId3ZhUFhUMnZSY252Ri9hdmQ0Z3N1ejJUZFg5MjRkRzhs?=
 =?utf-8?B?Vzh6bE92Y09pRExialRWMU5iUCtDeElGZWhmMEVQeEF3cDlBMi9Zb2lnNDZi?=
 =?utf-8?B?VVBXSVVFNmZQM1pBR2JzOHNBWmMreFZ3cUtGTEM4Z292cWI4aGVPRC9Jdnhi?=
 =?utf-8?B?MTJSbVhRRVoyMGkvQkE0T08vRWJMNVhmQXkrSEdKbFB6eHczN21SZmQ2YWtE?=
 =?utf-8?B?akhoQWFOWThPZEJYa1BOM09rUGprOVQ1ZC8wU002WHNSNDJwTXJZN3hGNXc3?=
 =?utf-8?B?TlowMTMvM29KMFlxWGR3dVBRQ1RaampVUEQrZE1uQ0VMM1J3Nzk4UmcxaXds?=
 =?utf-8?B?ZHVWaWR5aTRMRTZsYkFrTE5ndk95WVZ4a2UwNTlXM0lncjRMV0pnbDd6K1U3?=
 =?utf-8?B?NVpPdFlHeEhHUjBmcEkwUzMxQXlsM2VqRVMyT1U0T3RHTXpvZytIZEdRVCts?=
 =?utf-8?B?Y2JoOHZqZVAyVzFQWTFpWlc5YXRoK1gxT3BXNCsrL1dtVThsS0tjSGdsd2tQ?=
 =?utf-8?B?MHZYSERnQkExYXlWdUg1RzZERXpQWlRIUTM0cU9vY21ITG1TVXBCeTFORnY2?=
 =?utf-8?B?K2tHYk02NDY1M3lkcDhmVTFKRU9RK3NFVlpOajVqQXlZMXNTZUpyK09zTSs4?=
 =?utf-8?B?ODVyd1dNUFc2bldRMDFaNXlCNFdpWVJQbEs3eDVBLzR5QTE3T2FqL0FnZHF1?=
 =?utf-8?B?ckRObGFkYlFoYUgveEp1RFFvVWdZaG0ya0twT0FTWHEyM3N0bVZ6dDlwV0Vr?=
 =?utf-8?B?V0pETE1FZ1I1Mnd5dFJqU2VUdGRDQXNtcUtSeVRGNURtZ000VFozdlQxT2hl?=
 =?utf-8?B?cHRkK1BvdWV0UllVUE9KZjJIQUYxVTVpcmFkazNkcVJ1UVJuaExTNlpHSlJl?=
 =?utf-8?B?c3NWK3hPNlVteFBuKzBnTld1MWFzTVM2dFpjdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(7416014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUlJNkFOa2h1aXNGSnlaaVlNWGNseFZzMUU2ZjZ6KzRjb0ZxeVBPWEd3bVl3?=
 =?utf-8?B?YTdyZlVicnEzUDlhN28wY1hIRnBHQ0RucmVVSU9NVFhSOTFUUzViRFA5cXIw?=
 =?utf-8?B?SCt2VnRwOHpyRWxvQTZtWkhqdDRIT01hRFZJL2JkNkJxcXZKSXlKRlpQZHNQ?=
 =?utf-8?B?ZFdVakRFMDVlV1FCZXF5QW9xR3N2cWtGU2hKQWlpNklYcVdZeU1MNkdBajhY?=
 =?utf-8?B?VHZiZ0l6eXBTVFNZM3FTWTVBWlFoNEVJRmhyMWxpVEZNZUtjbERxYnNZVWhp?=
 =?utf-8?B?M3draFlWcGs3MHJuR3NRV0NUQnMvaVZlclJlL1BJQXM0cDh4a0pBS2E5dEh3?=
 =?utf-8?B?RytHb1p4emtoUzkzbHF6N3RBaktScHpNMHByUGVPNytpc3cvQ1QraC9haXZl?=
 =?utf-8?B?V1lZN3pSaGVtWFEydk80TFdlZ1Q5STRabWNSREszRm1wb1RvWnJCdWZRQWRH?=
 =?utf-8?B?VGRuU2U5VXp3WU95a1BpaU5IcjJLZXV5TFd5WWtsVnpvNjBIUEEzMlZGOFBu?=
 =?utf-8?B?OVpudlhMN24vclozVjRWVGNKQWphaUU5eGI3L0hSVVVsNVQxVWdxYkUwNktp?=
 =?utf-8?B?SkZ2MGlIMWd1ejBjQk5MQ21mRmRNb2x5YlRxR1VaWHR5WXNHdXVkMVAwUjdS?=
 =?utf-8?B?bkRNclcxTC9pdFJyTkt4eDFwTWJYeEUzMnpBdVZPTUZvRDNjejRwMU5zbFY3?=
 =?utf-8?B?dmgva1FiUVlKWjB1N0JTMzBzd1hZeXo2QUZLekNVSGhrTjlaK3JNNUZqWXQ3?=
 =?utf-8?B?cm90Wng0eit0WWZRbWNJenA5d3c5c25TV0huVXc2a3RvTkdodWZWbzJERTZn?=
 =?utf-8?B?bmlCcWJqdlExamVxR1lXQ0ZJamh2V3NoZFlpaE5BdmF3YjRQYjdYNHlocUIx?=
 =?utf-8?B?T29nenI5VUlOdGxtaUJJMEhoSzhLV3AxMjJhelkvVDJ1UTU2dmxZbWNaLytz?=
 =?utf-8?B?Mkg3Z2RMTHNXSHdMQkJPK2l2OVpKdVQ3Ujc5SlJRWXJkTmxLWTRNTktZRG5u?=
 =?utf-8?B?WVo5SzV3S1UzK0habzZLOGxxOUIrNU9RWE81VTdwWlo3NmFabDRNQU9MRFk0?=
 =?utf-8?B?eHRTQ1F6anQvcnVIZytna3hXNWZjM2tMUTB0bHZPaUtzby8wNG9ZUVR2RjFZ?=
 =?utf-8?B?TW9tSXRnU1NhQWdPaEJ6RUhNWnBqYjNnWklLYlp3TzRGc2x0REkvMDRpWXlu?=
 =?utf-8?B?MjU1eDVGM2JUTU5RdkVwMDBkOVlPRGx4VjIrbStQVDhLQzlzWnRoZ09NcHlT?=
 =?utf-8?B?TlRPVTA0VDBTb3Q5SzM4QmJRVTdqY25BMElFUlB3V1VtN0Y2bHA1SUoxcFhG?=
 =?utf-8?B?SWR6ZkZXZXJ0bWtFRXRpbDZIck5NWTdOSEpBR0NJMURTTDJRbnJFd2FPUGVt?=
 =?utf-8?B?N3JHZU9YSG9EZkxESEJrclpYRGNVYnJQWVY4cEJoaWFQVzZIazFSbk9VdlZP?=
 =?utf-8?B?MTJCZG1vWkQweUQxVm5FVkY1eXdDNUZZK0E0VVRtZy91VU9qYzhoSmYvVGJt?=
 =?utf-8?B?UUo2cmZ3aG9qNmtoUnY2QWFhcnZDNDArRjByYU96Y3Q1U0RuUjVma1JmamVD?=
 =?utf-8?B?SGg3QXNXMENHOThMNG1nTEtrYW9WaDNhalBMd3Q2VHdKVXVib0NJRWdMUFdm?=
 =?utf-8?B?ME1UTGNLNk1CdjMvcFJyMmt0V09ObEdmK0FmUjIxMHM1SDZ0Vk9oZ0xqUjhJ?=
 =?utf-8?B?b1lneWVyTU91dXZQVlN2RnlQQlhlLzhRUS9ZZDNTNlNmNEZhM0ZtV1d6T2tK?=
 =?utf-8?B?dVA3eG9RU2IrZjlja3JqRmtHTHo5eGVEWjVrT1kxd3VGaUhlWGgwdnBmMzZ6?=
 =?utf-8?B?L0tyVWFmUldtUmIzQ0tqNHBiam9DL1pjZ05rbkYvRWprSmNLSXN1WHpiNFZX?=
 =?utf-8?B?aTAxQTFLeDlEZmxUdWZNbnpKZ1hpNzRTcEorRm40b1JGUU1GcCs1Y2M5RW52?=
 =?utf-8?B?cHJQRjUyL1hXLzllT3N5Ukc1ZmVVWjhQRS80T2t0bmRLZVhmdXlsTlJKZkY2?=
 =?utf-8?B?SFJhbERwS0hNaEQxcDlRT29hTE9jSllqbW1oRW40NjM5OVdBaE4vektvcEVz?=
 =?utf-8?B?OWtEV2pZQlpGU1EwWG1uMEhRRDlqMGpvT3VSRGt4WkM5Zk5KUE5GR3gzSVBS?=
 =?utf-8?Q?bYxuEYNQLUJJ3M95YODVIVVoN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5cb99d-b700-4aa0-6e81-08de29624ee4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 00:58:54.3131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wpKgCF49exZyw8UFw7iqlurLhALgk9K7II1kV27IAzrZA0t0lB8jyeNNKsZkJfMJ0L747CsMXq0cCGP8qMdedA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9917

From: Peng Fan <peng.fan@nxp.com>

Allow each platform to provide its own prepare operations, preparing
for i.MX95 LMM and CPU ops support.

No functional changes.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 5 ++++-
 drivers/remoteproc/imx_rproc.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 82cb8c7866ccb79061c46068d2039f38feebbb3c..232eb91e0b5dc2432131b1c140d6688b073fea1d 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -532,7 +532,10 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		rproc_add_carveout(rproc, mem);
 	}
 
-	return  0;
+	if (priv->ops && priv->ops->prepare)
+		return priv->ops->prepare(rproc);
+
+	return 0;
 }
 
 static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 1b2d9f4d6d19dcdc215be97f7e2ab3488281916a..37417568a0ade2ae4d6a4e3d0f139ea52b185254 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -24,6 +24,7 @@ struct imx_rproc_plat_ops {
 	int (*stop)(struct rproc *rproc);
 	int (*detach)(struct rproc *rproc);
 	int (*detect_mode)(struct rproc *rproc);
+	int (*prepare)(struct rproc *rproc);
 };
 
 struct imx_rproc_dcfg {

-- 
2.37.1

