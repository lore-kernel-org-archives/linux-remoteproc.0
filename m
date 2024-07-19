Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012039.outbound.protection.outlook.com [52.101.66.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3680D78C76;
	Fri, 19 Jul 2024 08:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721377650; cv=fail; b=MNDPuDud2AYXVJxqWjkkdwAvu3uuMIB4EqvYUEuDYpAYCldjwDTk0+AL/mWjDCLOQ6uAjhO5bp5yTTEvCU8ctdwv8DXglmH2cGKxX/d3vs6HSaElhq0tlc51cOcacNYhOLfSeQGIwl+hU5tOtJxGvKFrHjZDJya2N5gzPer+3pM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721377650; c=relaxed/simple;
	bh=KcE2Uu/odF2E0tU1n03ysWU1QrPJ4yDr0Gk84AlRTYs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DXA/Fql2ULITdYLI4pAYAHPnKPZDw6YAqAELFiV+wYa4Nt+f+nx5asPNMjUZ9/4Q6Zq7eCJcVo9Z+TlLF0/nW25u4VX3JLhbZHk5LnLhFUxzEZe9rObuKbIpOZL57vbaFgURukTNx8p7y7JiUK5PROUaQKRCYphiNZTc1l011MM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hdY1e9ag; arc=fail smtp.client-ip=52.101.66.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hdY1e9ag"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wB60dij9esiL3gTpL1guP+Snvn0AovkFr8375RnJ4MrCV1mEcki0pY0pVnjoF3g8tYr7oDROcMnqWj3DaDx0NyHNUS00dTBnRADXNBN/Hv+46psF5jj0/nJnWoYX30oejdJVmyaYN5T3FvhO5LA5okRPJ4IdxwnGfV4xbrPsrUaU8BMQAZIZMrajdsS9VF00qncfu0GEZFUKmYhJVYNThp9o4aXw60yakXvN7sS5Lr18JakloSQvMDi3J8RY1EHlEzVz3kEbi9uQSHSfICDFzipvBpD7lCF7DHMR+J9GR1jmKd67fR3VXncxW6WGxw1X4+gYg57CoWDOhDsQ4G6etA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNKaS7fUoM3FwI6TqITKPI7NTovw6Ya4YHiU8stizyA=;
 b=IKPEoVD8VvvV7BBlTUAb9LM4WAgHcec8aXNbJxdVBiiqJC1KqJtjp5zkTHthQ16zqJiiZlvNiDvjbGXyHHtuUayjNuj7cs0NreuQLlnLC9Y3SQKCvmVfOmFPHVAOBCYiMOZU1z68gTzi0OBAmucdMQ05+COeXWvRvQ757YvXdxmc//ToNzfwkT8kFA/TZeIFiimTByYrujp3RTzE9CQkhkPTuz37bCjSIrZLJebYB72rxEiZXBcMdvNxFkQeAm7+EAVMF/Z6YLovA88cvLjvVQHRUV28AkrhYDgL7823VYOeDbPDf+5yB3am2AXRfL57qmFzVz6/krbMpydmBMK+tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNKaS7fUoM3FwI6TqITKPI7NTovw6Ya4YHiU8stizyA=;
 b=hdY1e9ag3YLmWMS5IX64JDmNDL/mnMUcy5LzAmoit6/IgZmCi4uZX+i/sYUOS2d/CsfpxLAfOZMZLQkKgt+RApuRgNg06RMzNkHtdtczA8vtcR6DIS8tNN2vLjVZy+XyncN+A07IikUzGIuu+eVYsrgGKbybjmgyoKkufaWe4i0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10993.eurprd04.prod.outlook.com (2603:10a6:150:226::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.31; Fri, 19 Jul
 2024 08:27:26 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Fri, 19 Jul 2024
 08:27:26 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 19 Jul 2024 16:36:12 +0800
Subject: [PATCH v2 2/4] remoteproc: imx_rproc: use imx specific hook for
 find_loaded_rsc_table
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-imx_rproc-v2-2-10d0268c7eb1@nxp.com>
References: <20240719-imx_rproc-v2-0-10d0268c7eb1@nxp.com>
In-Reply-To: <20240719-imx_rproc-v2-0-10d0268c7eb1@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>, Marek Vasut <marex@denx.de>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721378185; l=2234;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=wd7mw4EohSzycQxzYHfyQ3npQrgFZ41qvhJqdiqbWFo=;
 b=sdWoq91BF4xlQ5RE0ILY3LiDuz+cJxZl7nRrpVytgq21H2CrMXameWq8DvnDABdyIeq+84kD8
 saY6iUCCvgSCuCksiU1N9JGJdTRkkI87DFSJNzfa+l/bAyqT2ytqyaK
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR06CA0232.apcprd06.prod.outlook.com
 (2603:1096:4:ac::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10993:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c31cb1-dd48-4d7a-b14d-08dca7cc9f16
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dDlIU0V5enlxVkRvSGY4U010NGdmcitSRUU3MG9BYUx2cDBRc09pSFZyejd5?=
 =?utf-8?B?bkprZVJqN3FOd1dBQXVXaWp6YXpxRGZEaVZwZG0vQzh1TW0rNmtEd0lPU2Uz?=
 =?utf-8?B?bGNBcFZwam9FQXRkRTNkWCtWUkt1YmVJSUJnRTBDTmVJbC8vQnBZaUdxU2Z1?=
 =?utf-8?B?RlQ5OXEwWFFxU3FCMTFNekZKeGJVanQwUzI2MVd2ZENzZEdaeUp1M1VMUjRM?=
 =?utf-8?B?RnNMc0prNGFIeVI3emo2NjRHdnV3dm9kOWIxTExrWlBzZlN1MXJwQmVLVWZo?=
 =?utf-8?B?QTN4dm1LR1htMmNvMjJJNmtkZ3BhMDN0S01WRElIY1J3bmZ0dnBJTGY1ZVhM?=
 =?utf-8?B?UUwwcHdmTXZxdWxSN0laaWdIZFYzSENRTkN1VDBVUnAvaGsyY014YWJ1Uk9Q?=
 =?utf-8?B?NE81a3c2N3orblg2ZUFpelpWckI0eFp4blZLZHJONGJxVmZXbW12N29kZWZZ?=
 =?utf-8?B?SGs2QkJzOUVvMDhsT2lPdkpMSVlmV29sc1FYZ01VODNyTVdUODdiV3M2TFp4?=
 =?utf-8?B?OFNISXhLMWRXVFJCb05rNWU3RWtBNG5Nd0F6Y20zZVR0RjdlTGNsWnB3MDNO?=
 =?utf-8?B?bXhGQ0thTFNITVoxQVdqcWwreFhuL2RpTmlJaTRtZGQ3aUF3VWp1Vmg2eDVu?=
 =?utf-8?B?UzRZQnhMSFFMVGw1dEU1NU1yRXJvUjRHbkZUYzUxN1B1OU8rTXFVSUNHalJj?=
 =?utf-8?B?QXVaeTc2bUh2SkMzcGhkSFRGRHZmZjBwaE1PTkhlUm5SK1RQbkp5aURSNDFi?=
 =?utf-8?B?NTJiTXdCc0RzL2lycGZ4RXFTd2dtZU5jYmtnTHdwQXdtUWgyWXoreURJTnVT?=
 =?utf-8?B?ZVJxSWFYV25UcTk0cUM1NWVWaWFUSTEzNGlYV3R4R3FrSnFRSTNzaSsvaU1n?=
 =?utf-8?B?Vjd1aDgrcmgrNzh3YitNU3VlZVBzRkRkWUlCOWRDb3BsdS8zY2toWWI0NEE2?=
 =?utf-8?B?Y3J4QmhCbUpKaXZqWHlSeDdWWUZsaXdWd05qTVM2Qk1kYmxvSXNqZFIxK1Bp?=
 =?utf-8?B?RnNDS0lIOHJlZVlaS0p3eTdWQWxtVzh6ejhucTh6d1N4d1V6SDE1ZGZNcG5m?=
 =?utf-8?B?QXJsZnhrS1dVWW1kUEw2SGppR25VRnVKbmpQVUN5SmRFMDJsRkRwWXU2OHhw?=
 =?utf-8?B?VVg5VUVTMWt1b1Z5YnFEZ0xGekt0OURBeWRpRjdTemtUeVU1Lzg0K0FoTWp4?=
 =?utf-8?B?cElBRDdDdUtwVUF5c0Y3Q2d2aXZMeEFmVktuQ1ZIWlcrMjZBb29QQkYwbEhI?=
 =?utf-8?B?NWMwMlFEZzZMZFlSYjM3b2hrREVwcjZmR0FLYk5CN01hNjRpYWJFYWtpT0h0?=
 =?utf-8?B?K0dkbGVyTjNLMCtZZ05rQzk2bTlOMnJDSFZyQndVL0FnUHFkcS9wNnlpMHNs?=
 =?utf-8?B?cUNHWmxhbHMrdDgxR2Q3UkNuRzd0NW91dmhZWE9OMk00dDlMcExIZG1Nay9Y?=
 =?utf-8?B?NE1EbURQZkwvZTJSWXpQZ1lCKy9YYmFrMjZvdklVRGUvUmJpNlUzT3FpUHJF?=
 =?utf-8?B?VDJOUnJSbkx6RXR0VzNUNVVuOEZjT2szZjVRMXBPcVRHdTNNc1BwNittV0Fv?=
 =?utf-8?B?RmVqUTdXdXhEZ1gyS2RVeVN1NHl1OFhXeEpMeU5USTN4eDJYMkFQVjMzMDla?=
 =?utf-8?B?LzRWOHpxb3NYWk1wSXdZWnAzWW5UVWxwS3JwYmtYYXh6V0VhbDlXVzNVSHZT?=
 =?utf-8?B?aVNpTmpMZ0ovekRlSEh5MnFCOU8yeU53blA5U2JRMGh4YkFIK25jN2xSODNj?=
 =?utf-8?B?Z2ZOUkVXVDFHL1ZCZ1FRYXovVGhTaG5LMUNKNExSSHdlcmdaYkV3bGxSQy9Q?=
 =?utf-8?B?M0g1ZVd5ancvcHpxY2xYZHRqQkxLWlhEajE0MkptUHFRVXFadTZTOVdBTGpG?=
 =?utf-8?B?UU5VcmRRdFBuaDB0VWYvd2VBeGlvWEMzcGx2VDRGN1gzVkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUs5WGJncUE1QUFJdHB0Q1l0bytrelMzMmFqcGFuSDRFeGk1Vys1ZjlCd3lS?=
 =?utf-8?B?UjJsVDkxbHU1djV4TDhpdnR3dnZSZjNFeHVPdDVNb2JwYkFXaEE1bzZLZTRS?=
 =?utf-8?B?enVmSmdGd1lGTW1zWkVVbVA5cjJuMjhUeVNlbmdYRlRnUkFiK2RxTU0vaXVt?=
 =?utf-8?B?bU1CK3pKYmVsOTdHV0JBeVBkMHJLbTZGYXg5NTF0OTlLMjJXSS9aMDh6eWhm?=
 =?utf-8?B?Zm5RQUhxSW4vWWpqblpUbXBvRnJnUU9CYVd5bHoxbWcyN1BGN2g2eER5YUxP?=
 =?utf-8?B?QnVpNm9xdzhEdHh5c0hOT21EVVRBK0Z5d0dkZW83OVRNdnJYcWhQcisvdDJy?=
 =?utf-8?B?UWl4TEdoeWxxNUpldjY1eWs3Vm9RTzU1c2RUdldrTjlvL1VHTDB6eCt6Q0tB?=
 =?utf-8?B?ZHJBVTVnMGRUL2p0R0h0VDNaSEthR0Rkek1PVTZxWGF2NHR6L0dobFFlLzBN?=
 =?utf-8?B?bnhIb1FFYnlWd1VBcytETVBpY3lZQ016VnpVSkZUdEVQS1FzNEY2WitxM1Ra?=
 =?utf-8?B?NGJERURDN0NyZVZzVEtNT2UrSHZPTzVRcDZsY1hqVlV4OGh6cmJxNlZ2VGk1?=
 =?utf-8?B?aW9uS2I4TFJEdDhBTmUyLy9LTUJWWTJ5RXY5b3BPR1YyMi9lci9ueXVtMDRU?=
 =?utf-8?B?NnoxSzBBc2c3SEtmQUhxMDg3OFU0Rm93dUdhTDNrTzVaZTMrN0F3bUV5VkF3?=
 =?utf-8?B?SFRuK3F1bmpLVXlTaGdQUDlZaHc1MFFoQzhIaStCVWovbnpBTld4YTNyLzdG?=
 =?utf-8?B?dXRLd0U5VmVGOUpaUHJqRWJET2dtdXNQM1hnRVJZL1htSUlsUUZwSUpaRDdC?=
 =?utf-8?B?cFhCbEtSNGRNeGhXMXBScldERktxSlFhdmllMjJsWnZkQ2JGbCtGTWY0YzZ0?=
 =?utf-8?B?OUhiRlh0T1NFSWdOOTI4SlMvWUVrSFhYazRCQlRuMkJrMmp4RVpUOXNBL2lW?=
 =?utf-8?B?QXVvOGppV2xrOUw0a3BHRVlyMjJ2YnpWTUdvMmJ5ZTBNaGdsdXhkdXJIZ05F?=
 =?utf-8?B?OVd2RkJoTEREMXk5MDUrZHlLQUJ2OGRMTXV5RWNpRG1Dc0x1UGFXNWpYdUlI?=
 =?utf-8?B?KzA0Y3VSSHl3UkEyOVZVRWw5K1lEUzNUZ05HVjkyZ2Z2MDN3Ny9tZE9DQVlP?=
 =?utf-8?B?Z1g4M1Znd3pQem1wZ2tvdmJrSVlQbU8vbXBTcEwwRVVoMWpPbXVjTS9JamFL?=
 =?utf-8?B?a1hFc05WYTdTY2xlWnZ4QXJobkJDbnlIS1NxWkpaOW1uMWJBNXFsa3pudUhx?=
 =?utf-8?B?cy9Sd0loUFFERTliZ0U1K2psc2s4ME0ySVY1eEtsRXpDUzlPcXpPQUpDYmM4?=
 =?utf-8?B?VFhxL3ZJNXplN0liTWE3dThsUG9UUFY4WG9zQkpJanlyNUtxaFFOai9paytW?=
 =?utf-8?B?dm0yWXF1Q3BRazAvR0F4SXl1djlIa2hqZEJ3djUvVzlVV1FCeDVxcU5hU1pP?=
 =?utf-8?B?YTVVdFBHSUtXUHkwelVONGNTaW1yN0M2cVl5d2twZlErNFFDTFhKMUFkdlg0?=
 =?utf-8?B?SU1VNmlnWDVac2VxZ1FJVGJ1MkRyck9PM0E2enhRdlpMbEtlbE1PWm0yRk5F?=
 =?utf-8?B?V1haUGJHcVVmcVhKTWNtQzdUdHJpMmFLeUJRVWZiZDFEeFpEKzRJVDlGMmFk?=
 =?utf-8?B?dkE3Sjh3NEZvd090ekJFcHlVTWNBSlpVR0YzVnhEL2xNVlYwN0RuR29abmsw?=
 =?utf-8?B?ZHN2RTF2NVZKTzVjYnAwdWtMSjI1L0I4NWlBZWdvVWJ6K0RUejZweTZZd01h?=
 =?utf-8?B?V2wwMW9pTnh6OXVyMFNTS0ZmZTVWTmFTM2h4ZlNIVk9OWDZxQVdOSmMvUzRX?=
 =?utf-8?B?aWVsYnBEb01vZk1wbUlqQlRWT3lWK3pJUzhscXVXUFBsMnZDRVpOMEpKVEdw?=
 =?utf-8?B?eEV1Nlo3dmtYdlE1ZUdjZmIzN0VoQ2k5Rms4U0EwZ09CRkhPVGR2bk5oM3dG?=
 =?utf-8?B?N2Fiai9SS3FSanpoclVpVTdaclNCM055c1RwL0lVY3ZMOWxIdmhHY2ZPdzZD?=
 =?utf-8?B?QjZiYm10cXRnVmtzZWh1UTZsRmZESXp3VFd3RTdTNE55REU2QUxscHloRXBT?=
 =?utf-8?B?YkdSaEZGY2ZSaCtPWVVId0ttcVkxWmdQU2VrZGZMdDQvcHh1RkhvbW43b0lI?=
 =?utf-8?Q?qmgTs7fBrCmWGuEDANlLgOYq0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c31cb1-dd48-4d7a-b14d-08dca7cc9f16
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 08:27:26.4805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38wrAw1PRwyLnew/H8SVZXGBvNarRK9rj/4cYOzzeCsDXPszuS7y8t2JSofkvRd5g0baPyPOyFdDiAAqjRD7Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10993

From: Peng Fan <peng.fan@nxp.com>

If there is a resource table device tree node, use the address as
the resource table address, otherwise use the address(where
.resource_table section loaded) inside the Cortex-M elf file.

And there is an update in NXP SDK that Resource Domain Control(RDC)
enabled to protect TCM, linux not able to write the TCM space when
updating resource table status and cause kernel dump. So use the address
from device tree could avoid kernel dump.

Note: NXP M4 SDK not check resource table update, so it does not matter
use whether resource table address specified in elf file or in device
tree. But to reflect the fact that if people specific resource table
address in device tree, it means people are aware and going to use it,
not the address specified in elf file.

Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 3c8b64db8823..48c48b53a3aa 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -666,6 +666,17 @@ static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc
 	return (struct resource_table *)priv->rsc_table;
 }
 
+static struct resource_table *
+imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *fw)
+{
+	struct imx_rproc *priv = rproc->priv;
+
+	if (priv->rsc_table)
+		return (struct resource_table *)priv->rsc_table;
+
+	return rproc_elf_find_loaded_rsc_table(rproc, fw);
+}
+
 static const struct rproc_ops imx_rproc_ops = {
 	.prepare	= imx_rproc_prepare,
 	.attach		= imx_rproc_attach,
@@ -676,7 +687,7 @@ static const struct rproc_ops imx_rproc_ops = {
 	.da_to_va       = imx_rproc_da_to_va,
 	.load		= rproc_elf_load_segments,
 	.parse_fw	= imx_rproc_parse_fw,
-	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
+	.find_loaded_rsc_table = imx_rproc_elf_find_loaded_rsc_table,
 	.get_loaded_rsc_table = imx_rproc_get_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
 	.get_boot_addr	= rproc_elf_get_boot_addr,

-- 
2.37.1

