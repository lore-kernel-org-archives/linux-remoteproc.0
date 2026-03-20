Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011031.outbound.protection.outlook.com [40.107.130.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C661254AFF;
	Fri, 20 Mar 2026 13:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774011623; cv=fail; b=gOpoVFxAH7DFKxFadjXyuqF28aFwSyabtoDmGqhBJ7Bp3TPVS8Ow3I17wVH0huxuGK7JjJnfzC+1Lka4UF/dhLcXO+4/RZfvR5ICQhDApjyW7udOEX+86tNT+nN4MrOCG6gg5/ZMp14M7pcNtWblPsH9bd00suIuKcNkN7uHYgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774011623; c=relaxed/simple;
	bh=DyslPCJP+GuAJTXPazBVEk7VeH3IB5GmwgN1/6vka9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UwmS4q8WQ+llK9Fp+WuXfd8xewTtQz7NaOsxWYfFQc2R4ARbnAIGXeMNq4koIu1YDicUY6iFumymLzBJ4HTQ4GKnA3eq+WxTYU0huSip4s9ioAkdQFmP4ti/6gqcO6Y1QLh97JjwaVFoYAYx0mknVuFUNB25Prj+yonZ3L1pxXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=x6ongXN3; arc=fail smtp.client-ip=40.107.130.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="x6ongXN3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NaIQRqf4cKWQnRkj1/dsMuBTCRNO7PNLT3uIJHuV4HFGLhUF4cUalnwsmlBnHUJ3g3jK2aen39DtCwCjhv/Tmq9LzLqt5KVQtvtkKyznJuG1jhtTaQDcnnhLa4IowcF8wEjMdXNaWV1IMqo13ksu8KVmGgY4smAb5wqWuhutSQ322+TxLBIRrX5o+HEL58D/SdPUW+D0SwMrtao0i695tSt4pJJafhh0gl41g2fa/VYqAttOP4bAGLK/IR6RjuNCe0QW/FMK2JytFQAeJtmYKQygzHnCun8MCiWKHdb53jY380rnWVhjQKCDDGMdUvk1dyQywwNTdMRf027bSSziTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GASYZA+41SrmAiZMoiHKrSzsuezaQznfduUPyVl1rKs=;
 b=PF0GcblrpqupieyyhmPgKQnOLr4YjuzRHCgxHNyBhczZBlmgmae3d+ApTyDgByEdW/dNsuFKXv9IvGX/AEfhsjUn9sBugLTlFx3UKWx3UY01N0++2EyDLVGrlevydWz32MwK+gonU+94TUK0OqY2GFBwN2j7AQ9zG5YVdiJKzriypzuOAFo7xTMK1YDzdYTwpckL163B9hJ/oJFQyhSBGYsnP6hnGKyFqK1SA1iyAl3SkHH+rZ6sZENaaLwcQrAeSCvZl8SjUUrdnH/sqCjRvfHmiFmuazyVSFduYXFVDavfH7+uPOtPMyDjcGOEfZOEzFMG71wZ5dTKF3Jn7hrd5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GASYZA+41SrmAiZMoiHKrSzsuezaQznfduUPyVl1rKs=;
 b=x6ongXN3Dh357CXV2J5yWLDjpi64HDlIPYHu1JHxa54k329fqWUzqCkZ+4BUPD0xYiVPeMDK3Fu26c70nYEHzj4Xcw9R2kPq0pdVe6tRKS6iEWA7kkfrtCmvT3447l/3NyQK09UtsfhRvWqntdBiYOFcJlLZb6C3MTbCDdyC4fDVVke3c+F7WzebpkaENSo/uIw5uzNmwKY2kbz4ZiFS/KQtDrtLAwriQPsN1cddXhm0qNaoz8v1pZdstXD6mKNnYTS0QOzAfySSTeGUe8hPOHm88BU2aWiUDDFppPUFs1I5EYdaz5iNLtH2nt55Z4dGkefIwW3D0t1iwqVco4qc0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV2PR04MB11800.eurprd04.prod.outlook.com (2603:10a6:150:2d1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Fri, 20 Mar
 2026 13:00:06 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 13:00:11 +0000
Date: Fri, 20 Mar 2026 21:02:19 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: imx-rproc: Introduce
 fsl,reset-vector-mask
Message-ID: <ab1D2qIUh+KPnS7p@shlinux89>
References: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
 <20260312-imx943-rproc-v1-1-3e66596592a8@nxp.com>
 <3e1a3f07-8c0c-4757-afd2-b9e6574a6274@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e1a3f07-8c0c-4757-afd2-b9e6574a6274@oss.nxp.com>
X-ClientProxiedBy: MA5P287CA0261.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV2PR04MB11800:EE_
X-MS-Office365-Filtering-Correlation-Id: dcc9739d-2e2e-4918-b292-08de86809e94
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|19092799006|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	OLuLc96GyRvNYF8aTlOZcaYbCjNrMzi2zLfkjJSrvOJTFxZuB133ixiy2Vv18pKxPSHW8pOHvtqZ2RcaBbnY6xflWQEvfqe2zMsm3MOyD1kdXis0HPo36WhudrlBIqY8GVTnsOacJy9B8JB7+un8p+bCNqpwr8pI5+LMAEwhn1P7blo74rkZRLR13btArVzHDlwTeRnnVmV0LtuNyerleiL3GZoim0Ss4gjfK9D5RAThz6zuQ2imwZvw/jPCVbN+PtretOyBF7/C44PsK7X6Hf/nzX28h7wGMY2/Ccjci4w0jW215iVgUEmNCA6rixsG/Ob3kIY00ZvM0XtgGm9OqkaGiGQ8qKfwSsWb0bVr4x0NnmDXOqSQggyX/HBWyFuq7zebRwcM0pqOt+4c4qO+i7X856rm/NzIjy1Pu0InJPs0XZBvODtrzIDvut2KafHOKZs8SrU/dCQOQnOI9m+YPQ/aJUW6NkWIga2s06+T2tWodIdseSugGnEjqJbbFDxQsIGva9RDYqQcCVKojmisziryblSh81HHsawptoeu9Sv+P1Vuu1qV6BDfZ0CWpl7Z+MC+39ivPN2JLWrBhfC5rsOhGO7vahTGdvmR1BgQEUaFV8RgBukR8IZ0ZCh5Pt61EQ1ksoLhO2QOeN61lh+VqkA2vg7FjH1ahD2e7kjYSCDgFtgMXXFxQwMpCbmLXUXthni+IKr+B6T1Lc1PMCS3U7NEGqehk9OgPJSE2vR3+ubQpxi6TLemmHzfTFZgPEuG/AO0x+tGx9wbxKwiHNdQCMH7H52kG5sylR7H0M1RRDY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(19092799006)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3FsU0xCbkRBTmVKNDlObjhjY3JPN0oreVAyWW1uMlVVa2lOZTBEUHhnUHJZ?=
 =?utf-8?B?aHQzY2xvL2ZDUG03bjhKQU9INGJnN3AxT1ZaeGdTVTlzSUdEYXN6YUloTFRV?=
 =?utf-8?B?Wmd0bzZrM1FwUGhRSWNZTCtSMklUUWthWVp0Y3kwM2RRTEpJWmFWREtMTTR2?=
 =?utf-8?B?dFdNekJPT3hlY015Q3dicVd3eWxUVzBJbEpBWUFVUkNEZmJSRG5tdHE2Mmxt?=
 =?utf-8?B?WEdJcGFvbVhyT0MxeXMrL3NiQVp5czU0MHhjd0ZjbG5JMktXY3ZneEowK2pU?=
 =?utf-8?B?azNLNUtsUGVMeU5lbzhVVzdPZGNIb2l3UlA3VnpJR0o2VTNyc1M3cGpTNU44?=
 =?utf-8?B?MXU5dEk5RUNyVEoydys3ZnIyYkhmdHhnOExaUmVwcDNvV2lWR2h6RzI2K1dq?=
 =?utf-8?B?VU9jSThQczgxZ1ZHNUl4Q0V6cmdiOGgwTnVOTHorNGRUem5kRGExbFpGTHpo?=
 =?utf-8?B?UXYzK3ZlSUkrR3UzZU5xUHNMWlJWUHh6MHFScDIxVEZGcVR5dUZJdUM4Vm5J?=
 =?utf-8?B?ZWV1MmJLT2VBanNYdDlpZkhEMi9wRUpMYzVhU1ZFbll6dG9TMWc5UkNvS0M2?=
 =?utf-8?B?SnVWdUZUQmVmZE81Ui9sakJ3Uyt1a0J6TUUxTjJWWCtTRUpDbXUra1lLWmcx?=
 =?utf-8?B?Q241SkE5cEgrQjgwdVdOY3Y3VjN5MGJKTlE5cDNBa2xMVkdnQUVqalVMNUZ5?=
 =?utf-8?B?Nnp6L05KOTd6eTNOOWEvMnVuQWRLL0FRWEhVbWt4TEo2TlpTdjg1blB0Q3hw?=
 =?utf-8?B?UnFsRmM0QWJPeGFCazhOZUJ2SjlwYXNaejRmbUVhMFArM0o2VDFhK0NPdWQ4?=
 =?utf-8?B?dEV6Um5OeHpsZDVPT1JWZFRLSmJBZVRIa3V1bzB1L0duM2crYllqV3lVdjB1?=
 =?utf-8?B?N0F5VCtsSXVkSW9EeHJKL3I4NmhqNitPZWJPSENFZ2tZV09jb1NCc2lVcHBZ?=
 =?utf-8?B?Q2tWUXVaNVpOcXB1Q3c2UmthdklSNjZzOXBmd2ZEcEtTUHM1VXN1dFJMN3U5?=
 =?utf-8?B?K3g0bXFoRFhhUDFNYWtVRVFFYXh1UzlJd1JYREovM3hyTnJySGJZb3FTbVlC?=
 =?utf-8?B?bzhxTEJ1bm02WnBNQUNnNm9LdGNab0lsaUVzandOMEc5WVZBRS9BYTlZemdq?=
 =?utf-8?B?WkdiNUdHSklVVlFzOVRVTGV1YnF1WVRYNVJ2YXBqK0oxWkFiaTNFaWt1dEgv?=
 =?utf-8?B?YXJLbHNnKzN5ekxaVlpFWDA5OFNSZm9GMkVjNUNyOWJxRWxpdTVjTDFUUTZW?=
 =?utf-8?B?MTZEbXJoN3BodjlINUthRGw1L2NaeUFtbXdjVEEyQ04ydk5UNFVEVC9td2FO?=
 =?utf-8?B?T0JaTHMzeTRkd0RXUXU1OWdDcXY3bXlRY2FxTUsyeDkxMlRGdysvSnA5YUhE?=
 =?utf-8?B?OHA2SlAxSGNNK2YwVXpvNXVoRkUyUUJsZkczUnBscFMxampMZStaRnRoUUlm?=
 =?utf-8?B?STArZG9KcE9tV0ZXWDBNM2txRk1rSkIwZ1hHRnhsSnFlc2dVM1hBcUQ2Q2RD?=
 =?utf-8?B?NkUySjRWQ1RJUDJVa2tkNU9wb0Q1Q2k3WUMxWURrbWl0VFI1bWdKaXJncURO?=
 =?utf-8?B?VlhGd0VraXc3eHpMUEpmQk1nZ1VqSU9tVFFRUHlrVG1BZ3VXUmNUUGJWd08z?=
 =?utf-8?B?ejBEbERqMkZTQW1leVJtNDBKZ0FYUGRDNnRwL2h4Y0QvcmFsR2dTZ1prRzND?=
 =?utf-8?B?QThySjRCMENFYjV3a0dUenMyRFdWa2Vibkt6Y2J5UGNvSVozSmdpN0JtVlNn?=
 =?utf-8?B?UFpjMllwOUhQYzZHLzM3d0FxOGZPaHpMT2NmeWsvV1FmM1BkYVFyT280aTdS?=
 =?utf-8?B?OHlMc2J6Vm1YYUJtMGpVS1Yra0Qzc2pqTWVMc1IzaGhKWGUzTmJTQnRhd1hR?=
 =?utf-8?B?b3Vac3M2SGlSZE9VclV3UXFPdEVtckl6NVVGZ3NVUFdtMkNXWlN3M3lKTGJ6?=
 =?utf-8?B?OU1lZTdHd1pXeUloUWJja1prQWVIYkZrTVRVeTFVb2R0V0YvRUR2SUg3MEtk?=
 =?utf-8?B?Z0JSL2o2VEtJM1RaZTBPNExDWDdpZFBEbDdTeSszSk8rd0lCek9ZQnFyWmtZ?=
 =?utf-8?B?ajF4eEptelFwbmVzNTFCOFlQUGtNa2VQQXcvVW5ZVUxrUktaWkJDSSszTzRH?=
 =?utf-8?B?QmN4RzMrVFgwYUEzSm9VUlFNZHZ0TmRSVzhQUE1iRzZHRW9xOG5YcDZyaHR4?=
 =?utf-8?B?K1pZR3FMS2U1ejIxbGdVdDI2VkVPS2wxSk9icWtlMUozYUFjaXk5WEE1bXMx?=
 =?utf-8?B?TG9XSFlIcTc5ZmVtMXdBcGlyeEsxT0d0SXJaSk9udkp3MXdGQXVMUWQ5eEVn?=
 =?utf-8?B?N3NEM3VOUm1LTGR4bUFPQVZ6WEhPVjFESDhkcmFGZXBRSTlWTEZOUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc9739d-2e2e-4918-b292-08de86809e94
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 13:00:11.1160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zre61LAgrVACjmucpp+SD0ukCq5Y1zTBjBNeQY32VmO22BqaA0nVhOv796/dR80V12gy9KOp9jV4FOGORhKCbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11800


Hi Daniel,

On Fri, Mar 20, 2026 at 11:46:53AM +0200, Daniel Baluta wrote:
>On 3/12/26 14:36, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> Cortex-M[7,33] processors use a fixed reset vector table format:
>>
>>   0x00  Initial SP value
>>   0x04  Reset vector
>>   0x08  NMI
>>   0x0C  ...
>>   ...
>>   IRQ[n]
>>
>> In ELF images, the corresponding layout is:
>>
>> reset_vectors:  --> hardware reset address
>>         .word __stack_end__
>>         .word Reset_Handler
>>         .word NMI_Handler
>>         .word HardFault_Handler
>>         ...
>>         .word UART_IRQHandler
>>         .word SPI_IRQHandler
>>         ...
>>
>> Reset_Handler:  --> ELF entry point address
>>         ...
>>
>> The hardware fetches the first two words from reset_vectors and populates
>> SP with __stack_end__ and PC with Reset_Handler. Execution proceeds from
>> Reset_Handler.
>>
>> However, the ELF entry point does not always match the hardware reset
>> address. For example, on i.MX94 CM33S:
>>
>>   ELF entry point:           0x0ffc211d
>>   CM33S hardware reset base: 0x0ffc0000
>>
>> To derive the correct hardware reset address, the unused lower bits must
>> be masked off. The boot code should apply a SoC‑specific mask before
>> programming the reset address registers, e.g.:
>>
>>   reset_address = entry & reset-vector-mask
>
>
>What do you think about this idea:
>
>Use fsl,reset-vector-base instead of a mask. It could happen that for example
>
>a CM7 instance has explicit requirements to boot from TCM but the entry point is in DRAM.
>Then masking won't help.
>
>fsl,reset-vector-base is always fixed hardware integration dependent and you can always
>
>specify it in DT.
>

Thanks for sharing ideas. But this not work:
1. User start an elf which is built to run in TCM. the reset vector is in TCM.
2. User stop remote processor
3. User start an elf which is built to run in DDR. the reset vector is in DDR.

So a fixed fsl,reset-vector-base not work. We need a per elf reset vector base.

For the case you list about boot from TCM, entry is DRAM. this is i.MX8M DDR
elf demo. The hardware always fetches PC/STACK from 0, but elf entry is in
DDR. We always use 0 as boot address for i.MX8M, no matter what elf entry is.

For i.MX95/943, there is an register to configure M7 or M33S start address,
If the image is designed to run in DDR, user should set reset vector and elf
entry both in DDR. If the image is designed to run TCM, but space is not enough,
DDR is also used, the reset vector and elf entry should be both in TCM.

Per my talk with NXP SDK team, It is less that 16KB from reset vector to
elf entry address.

But in case people really want the case you list, we may use a flag
BIT0: 0 means base
BIT0: 1 means mask

fsl,reset-vector = <0x[x] | BIT(0)>;  --> mask
fsl,reset-vector = <0x[x] & ~BIT(0)>; --> base

Thanks
Peng
>
