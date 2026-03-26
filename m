Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011020.outbound.protection.outlook.com [40.107.130.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49FD3E7145;
	Thu, 26 Mar 2026 12:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774527477; cv=fail; b=qhUghRpb2HBsb85o44DFJpo5HoPwtJIYv7HgOqxZEMbZufHKzRjo6447xO4x3UwitH1Yrj+pKpPpWYT63NxH3+rVWfBYxi82fwEi6KvToiEcWyTMwY5ZZi6c4C6D7REbH64h3PHeHboTzTxI81zN4N/maDgLl1jtXbTmL6bBBr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774527477; c=relaxed/simple;
	bh=Kp2Z3nXUSnCcVHEi80ape2yS2FkOyTfi254l9bmXCTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Oq/AXywOUiiBgrComdbTiJgl05JOTgPWyMKqS3Er7p8vVgAWYvqw9hOAT/j8Ib2tbjYstD+II73p8p5QKULi7h8JLF9fpmy8977nw9NdhlJzxrUWTyJFGWmFLb9+PKTOESnNBfjccoJD7cpl2T0X9pxexAc5q5YrifKvz6P/GDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mTQ5p4Pr; arc=fail smtp.client-ip=40.107.130.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mTQ5p4Pr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p8RbnJtaRcsRYFwcE2E3eJCoiJUoZa3CL/IvQcH5wdIbn9TILXYEZA3rFRnXOgD8IA47iNmba7dYUWPveHrt2/fZFFbI2ILdCNOq+TgYmeCQY5z2Uek9gRbSKSRR+d+O83Ga5rtYsuVodAqee8SulhWWrvpIy+Bwb80LHe7dVbCM7sfUQSqaD72+ZmkRZddyVHY7HPdxa2zzfKbxfFRE2nYa7MEAWL5IVCFaTTysCUhXiCU+IgpniVr+zNz2JCMOFDGd2t3f/j3GnC7frFJvavn6+mXeTmiDEkkr6NB1aYrQfpRzdwRzH/I6fN4mWL01uQNYOf6K9fxNQ9hi1zhLkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQAQsTMDZkqZ3clNWAoD9Tuqcy8i4qiqZDJqp5x03m4=;
 b=b24Yil4nl1GicVjCuwyUIJqXOdow3NAwwlk688RNIAzYNpvUmdrAs2uTDne8ewTHeeJqy1p6tueHb1yn5AiSj2Sv+XDGUz/TfQl1UZ5raU3W98IAFC1r0zLh2CBMFokK8qNvKTQQCw52ZbP8gzIH2xyXSDvM5w/VflvegHxVuX7OxvvGEs1SwbLyCUFLn++tTyjhbDSa0B3D+FeGNcblKeXhcgeLUlhl0jO4r8Yj33vnr5TX1W/bF5db/2wfnZUwc+A8x3r/9XoswXKP0oH3rFwzAOwBxTOXsRVRYUaR6dTj4VaR+rg5a+H6NTzs0WOyn96NHDNbHj9FQFN/g0/A3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQAQsTMDZkqZ3clNWAoD9Tuqcy8i4qiqZDJqp5x03m4=;
 b=mTQ5p4PrqzIBNrgeOaaGDzVUwzVNPrY3m61MjfPBSNur+Oykciam07+VOjgw0o/0Y+I2vWbl4PpmXdu8PzQxsatFjGqcYHVpYHnoE5W2bhYnN+cvo18pqODdpsuJTU4YWAWDasrVgmTUm8lghG50s/GKhd3wgp8QPTywbjVOGITuP4c+UQQglxRyBla/I7M9xa3osesCUN9beEWJAU4xhTtODRyB5XsuGTT5l01AoCwymIW6HSv99rB3EFAL6hsZSVZf/8dd2yWtj73Y+LEyeaMHJhWUSQ9zHXln/Pbo1tUg+ZAveTF1W2lncS34DEMGRILWyBxAm88Ngbu/468UYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8809.eurprd04.prod.outlook.com (2603:10a6:20b:408::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 12:17:52 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 26 Mar 2026
 12:17:29 +0000
Date: Thu, 26 Mar 2026 20:20:00 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/4] Add i.MX94 remoteproc support and reset vector
 handling improvements
Message-ID: <acT7VJP0vZ7bT9mk@shlinux89>
References: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
 <b5e05fe6-97c4-40cd-b7cc-b417d8717aec@oss.nxp.com>
 <acFPGVNOornxsPG6@p14s>
 <80c7815b-26d9-4876-a44f-3e17b6338dc6@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80c7815b-26d9-4876-a44f-3e17b6338dc6@oss.nxp.com>
X-ClientProxiedBy: SG2PR02CA0084.apcprd02.prod.outlook.com
 (2603:1096:4:90::24) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8809:EE_
X-MS-Office365-Filtering-Correlation-Id: 205a8241-e28c-476e-d022-08de8b31a63e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|19092799006|366016|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	0QwBigSm9KNvppmbsNBLyalN28L9Mdph99GWKYDfC7OcIruuaa7oWVovNDp41q5RyF3mlyBAd4ezgkn3TqKD31RZZ2n1Z7aUUzk5pueaUYnC3v32fFUuaE4iDoMhXFoXTkO8CnwxKeOiYp1hbzhEDOksCD0/GW+EwS2ESMxpu+M2XhJIIxMdj2JVF32IAYNALNWmK2hZLXE7R2xtE+fnBKBsfs8eV6ZlaA5YH6R9akX90qNW7b6VSiq+zOVJMmfCzOmK4Ly0KoSN9hlkQ6nDP212iOh1WkUPBuoNzoiJISZDETZY2WUtxQFV+kypVuOc3RjmdIsb/wmqY83ux3FXlXOMbB/UXXwY4PIsvwGRCCJLGKLO2HuhAzhRRmouZ+vOLpz4BomepA9QfRKW3cOiHm4MpX1c2SidPOQrAvUz3RpHcdEcqLjM1c9dCTyONgrnQclAT/sCgVfpxA2uh+dTaRemJS3ZUxtDi73e5z2cUJJtJng+6O1ianT+nQsl0uqfzkKm8vEFXyGwVmVYIUjR0eogoDb4NCrkUgtbmLYEN0eZVfatBknCCMzj5Y7NL9fE7D5j84EdtHKZSGRR4NGVTd5ccMwKQtD2IMMnMa//jSyFVXvrGFifR59SOKOVlAfo8Vc0M5sbRVmORLaxVFyY1DbJLK1QNN1Pz65mVlnNFdEkdYu+pWLuqi2cfHZec0IUxTSI+jBIJPLK/Fe9TpkVDOjw0DT88K+EUwPU/fmoBB36IrjTITzYNg8ioGm4sgA5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(19092799006)(366016)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MG43VXZMR1RITmpFZGJjaXc1TXJKZHBXMURtVjN2M0o0RVJXbFpSaG51bjl5?=
 =?utf-8?B?VjlSZ3FDTkhsZGRhOHVrMWVSbEV4bGQvaTgzaDlPTkEyS1BUNm1UbXMvcWs1?=
 =?utf-8?B?T041NWVoakxiWWNaVTBmNEFMSnhnOFFOeGdpbDM1NkRCNmZFYTRRV09CMWxS?=
 =?utf-8?B?bUhZQ0VyUk9ZUlY4cC90aElnTzZTZ08xRkFMZjM4NUdSYjlmNnNNb3hyNXZC?=
 =?utf-8?B?UEd5ejd4amJPd1pyd1hMRnZUVDZVUnRqcnF1V1BCRjFVSElYcnFicEJ5Rzhn?=
 =?utf-8?B?RGErSHRlb2NEY2Z3cFl5TmZONmFoOGpMYmcxZVk5ZmFuOGJLVVRpR3p6dTJr?=
 =?utf-8?B?VGI2S2xLU3VScVlNOC9OQ2JkZ0lQRnpUVnI0bkZmZWhPMFhJbzRReU5GcGtN?=
 =?utf-8?B?MUhaS2QwL01TcWcrbk51MHhEYkdSSHIwMm5wV2hyUFpTSFVxR3NnRWJxQ1Jx?=
 =?utf-8?B?NEF5SGRKYmwzTjYxNUQxTzE2Rld0YTNqeXZDMkM1OFY2aW03V0ZCTGQ3bTEx?=
 =?utf-8?B?YVZBeE50N0RtanViTHRsb1NUTkEwaXpiSFl6Z3lYZTJydXVUNGx0NVd0Ylgy?=
 =?utf-8?B?cGVLaS9DeFlwcDBPN214WGhueTF1OVdOTHBFdVhlQ3pEMGJnbDBSQzhaL3V0?=
 =?utf-8?B?UVMzV2xaQmp5Y0NBeUNWTTFkYmpRVHV5OUpPTVlsemM4Y2lMMWhIWXlJRmdz?=
 =?utf-8?B?MXVIZHRnTEo0UWZhZ0tuWlQxRkRqdzQvT24wakkxVlZaMFVUT2ozNEZNOXZk?=
 =?utf-8?B?Z0VMVE9oR1R5STB4YzhJeUxBbEVIdWtmbERla21WcnduSURVRjMrSzhITFpk?=
 =?utf-8?B?RlFCbkwvQXJXVTNMUk45TGdodFJIamRTcTc2TkhEMVhkTXhkUEJXdkhKVzZY?=
 =?utf-8?B?cTRMN0pITjZUL2x6L0xvOUdIOGlqek9GTlhKT0NjMVU3cFdGWGxib0NEZy9G?=
 =?utf-8?B?Q2VSY1lEV3FNd0xibmhwUmhWN0gvZVJMc1YxczE5Y1Q3NWxnSWNYV2NreUxU?=
 =?utf-8?B?bDgvbDliQ0c5K291K090MkdqSGxreThUQ2lFL25Qb0ZMQkRUOERLN2hEQXB5?=
 =?utf-8?B?dU5XcHVZR3k4L2xNeWhGOHZFZlpoL0xzcVE0L0hpbEQwNnV0VGUrUER4OW5o?=
 =?utf-8?B?akZ3Wk9DeC9ZS0M0N2dBZ2VQb2RadjMwcFlZeVA3c3p0NlN1RzhocG5scGRO?=
 =?utf-8?B?cXdocG9NM1RGQVRKM3dtemR5SEg0cHVaZ0NIWFpXa0dsa2ZLWHloZUlZRUVN?=
 =?utf-8?B?YXU5cFRzWFNPdlFOU1ZaUVVzQUFhQnNBOTZxUlNFdHd6QXFZTTFzN3JCV21W?=
 =?utf-8?B?VjNMTzJORUQ5cHhaRFdkWVZYRkMySnRSNWpUS1FEZFppamc1TkRxRW5JMW12?=
 =?utf-8?B?K01QbTM2ZEZLOWpnL2lKd2FYdWt3T1BZcittVjB3M3oxTXhOWTE4elJCZHlt?=
 =?utf-8?B?S0dQU2RYalhDSUxoVFNkRGpPcldvb05Wbko1YmNDN2ZRUi9HZURZUUlFSk9t?=
 =?utf-8?B?YzJ3ZTRybDNBU2RrV0hlMnUwcXZDWEp6NVJYMlZkQ2hYdnFSU1JMU1plejRq?=
 =?utf-8?B?Nm9NZmFWTkZpMEpScnM1R1l3b0N6L1RUVzl0aVhpN1puTlhxVHJ5bjJlVlB5?=
 =?utf-8?B?L1hZUzRXWS80NXdWQTFnQktONzdxaytBcUJsK1dabkRscXI5a05VT2lGeHNv?=
 =?utf-8?B?c0xZUXQwY29sYnVGazAyaGQyUzVsbmxOOWpXTTA0a0VKTFhxcFM1LzYzS093?=
 =?utf-8?B?ai94cEpQczI2d0xPNUoyMnFMaFlVY3E2UnJSNmJaeHhNeUkwM3htdXRLK1hz?=
 =?utf-8?B?UWsxbm9PWWJnczdhblZiano5WThaT0w0MzlIZkd0endFUnBZSHVuaXZVeExE?=
 =?utf-8?B?TC95OWVpU1RhRklTZlRlZjFvMDR3NSs5eGE3Qm9JaFJNYXIrc0s1bUdKelRU?=
 =?utf-8?B?VWdpdWM0MWdNeEoxVm5uSXp2MTFLaERUUHp0bDQ2aTExdURrM0l5aE9vRTho?=
 =?utf-8?B?bXVoTTNxQTdTem9wOXZxQ3JVUUJVUlJCTVpuQVFhbEJLanRXLzNDUysyVWlJ?=
 =?utf-8?B?ZXYwY3d5bDF5bE9ScVl6Wjg3MXhoNDluM0pCNnlHVExzd2tKbE9XZTd6Zkp0?=
 =?utf-8?B?QllQSXpnUWhmbmRONXp4KzB1VHAzRGljMnRBL0lwcHRwTitVMEJ3cjdueHBU?=
 =?utf-8?B?NVFOcEt3SEdiMW1UV0lhNndUb1ZtQWUyOFlQUzBjcVlEbTNjcGJjWHNnbWo4?=
 =?utf-8?B?RjczWWphNnc3QndRQlR4b2duTU1XWEcrdXBiUml0WEErMHJVTm1rWUp6SDNN?=
 =?utf-8?B?YzdlTmlRZGp4amtpdDMzNW1vcDZlaU9zZkxsZWdWOFBpYkJ0OGxmZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 205a8241-e28c-476e-d022-08de8b31a63e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 12:17:29.5490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4sSpqMuX+BrUsJIV9B/93WvN07TfjQPVmdALqvhW6pYgoelaALyVaZKFY5UL32Ke219G4t4kZQWJuBZgL4ZZgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8809

On Wed, Mar 25, 2026 at 10:41:29AM +0200, Daniel Baluta wrote:
>On 3/23/26 16:32, Mathieu Poirier wrote:
>> On Fri, Mar 20, 2026 at 11:19:06AM +0200, Daniel Baluta wrote:
>>> On 3/12/26 14:36, Peng Fan (OSS) wrote:
>>>> This series adds remoteproc support for the i.MX94 family, including the
>>>> CM70, CM71, and CM33S cores, and introduces a new device‑tree property to
>>>> correctly derive the hardware reset vector for Cortex‑M processors whose
>>>> ELF entry point does not directly correspond to the actual reset address.
>>>>
>>>> Background:
>>>> Cortex‑M processors fetch their initial SP and PC from a fixed reset vector
>>>> table. While ELF images embed the entry point (e_entry), this value is
>>>> not always aligned to the hardware reset address. On platforms such as
>>>> i.MX94 CM33S, masking is required to compute the correct reset vector
>>>> address before programming the SoC reset registers.
>>> What happens if the reset vector is at 0 and the e_entry point is at 0x800...?
>>>
>>> In this case masking will no longer work! Can we implement a generic approach?
>>>
>> I will wait to see an R-B from Daniel before looking at this set.
>>
>> Thanks,
>> Mathieu
>>  
>>
>Hi Mathieu, Peng,
>
>Patchseries mostly looks good to me. The only blocking issue here is how to correctly specify the hardware reset address.
>
>I see two options here:
>
>1) Create a special section in TCM that holds the PC/Stack initial value as concluded here [1]. But this
>
>doesn't work in all the cases 
>
>2) Add a per device data that holds the hardware reset mask that gets applied to entry address read from ELF.
>
>I'm fine going with option 2) and that's because this change is IMX rproc driver specific, it scales well and will be maintained by Peng.

Thanks, I will go with option 2.

Thanks
Peng

>
>thanks,
>
>Daniel.
>
>[1] https://lore.kernel.org/linux-remoteproc/38476dd0-07a6-310f-1fba-2b3021a5b007@kontron.de/
>
