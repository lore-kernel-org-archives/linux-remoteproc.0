Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010018.outbound.protection.outlook.com [52.101.84.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B09C13D51E;
	Tue, 31 Mar 2026 02:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774925247; cv=fail; b=sxM0z+OWnzZA1vb+6Ya3mvWZHYWWq6og+SL12VbZmURaDHA1Kg5O6yS3tiEi+BPc7Q+kwgCD8fwcQo3bltYTDlb5UvLbVrdqYdolkFTUB+UlrFLa8HSzacY6sYpuYqrbo7R55Og/9RDY83bRBLx1H7rM+2fJEhGsKzK2hbSBEnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774925247; c=relaxed/simple;
	bh=ict/icGZOY5qFx/rQ+AUJh8HIhtNJdNOmKHj9nafs0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CWGoZYFCoZjR0Yl5GaPavHmzbMOOyGIUOWEMPT1pwPLMd0welHktrPPNrLp8miyW8Pwd3YTQooVJeOk9u1UYxqSdOG8F98aFGwA5gzmL/gAMuS8QBCc9mqlagW383bOMtcm6vdmd7zfvCZAWG0WONpYg0UMbReHFAb6hOPcuc74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EUt3OXN9; arc=fail smtp.client-ip=52.101.84.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EUt3OXN9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNI1WgphYywYAyaUE91dY4+ZaGrjgY/BH/hqUy4TcIqxYC2xh1ivCa648qfh83IIPG431qVMpHKnHHrkV2jFL1byOD0nErmut4pyudKJXjHX9kGz3P6H/O5YnoaJj5ga54NqIwVGPjUnbxv/Z0YNy4lCxb/E9Z/Hab97XtrMAYIob7jINzqSjXHjeWi+gAWSLJmCFnaUg7z3yzP+qf+wo5wnAh/w8wtDRs1fHooQ6NIOteMg0W7vPUABD2YstbIM5vzDagg8XwKUYdCWe/2+Q0pAPlvSfaQbBgXwtFUTNGOWmPsoR0rWbuIglFOX42a/AgL3yiAQ2lG0pMHSMTR8VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jw1x0LDOX/5NR67YnAFJ7jjKL/UvtoDbCOF3rHiXh0U=;
 b=tlfzrWXEO4qs7gb5UBGbC/L0/znMn0cUfDLxKTUG8OGzyOwd1VMb+Tso5clrVudO68WuU0I5TLRAZA0LCJLjmFM2yATivOTbjGVa1ojbrLaPMPpXiWS8j40EK8rYGqaxyPXr5d1auXE3R0fgCQrQmhvhcWQfqgRa7u1AH1YxMM7FZMZpt23bhqq3NdtiW4vMY37lUw9QOZg6gxzJRg8AwDyYonizNdHh1P8GEWh/hkWok1g7y6bMdzIrw/uilbKH+sFUT/EnpcRv2gp+yNOAWnT5G1rX6rkxHGb7BLprA9O+J9sQUkoMuFKbShfN2/pnQfrXwIv2IyHCyar01X6Ksw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jw1x0LDOX/5NR67YnAFJ7jjKL/UvtoDbCOF3rHiXh0U=;
 b=EUt3OXN9CaR4H3NzONSJYhZnJR/+IZTBQcfgtLSyI/EX4eyk0+Kf7IuKldAQ05OEh/UV2mReZb1qXNL0yK31QGQyRT5fFT/ILRbLU4uiOmYB1AJu6iHhQDmso5pyW1j1PgJryoh/DRCcBePFqx+VGJFosrSseDXRca0X6tMu+0oeq33iLHoW4tQSc0/U+va6vavrFPeG1zPTEGWp2bYX75XxthloVzQ3MhEuY0ZAKl1LlEFyE3DrRtA1FL9fNK+tp6YyRoErNi0odMu+KuNhSlU+VkMFa4Uf8TYpDE2oVnkRkhZcnfzxjN6O1l5lBKYAdgQLTnhA8iAUVvPVgJdxRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB7094.eurprd04.prod.outlook.com (2603:10a6:20b:11f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 02:47:22 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Tue, 31 Mar 2026
 02:46:52 +0000
Date: Tue, 31 Mar 2026 10:49:32 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to SM
 CPU/LMM reset vector
Message-ID: <acs2PAZq2k3zjmDW@shlinux89>
References: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
 <20260327-imx943-rproc-v2-2-a547a3588730@nxp.com>
 <acqjS440STRl2sK2@p14s>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acqjS440STRl2sK2@p14s>
X-ClientProxiedBy: MA5PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM7PR04MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de3b470-27fa-467a-27ae-08de8ecfc389
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|19092799006|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	v6gYBHzGaP4+eFrenahmSu1nfhMJ4j97Yb6TCv6kjHBhHy61q2FP3Fdndexq2d/LA+cnaOlbPd5sT2CgXvIwX3zPmz2d3JQC9/jgkUxPf2u4+qRq/XY11QMca5mVRZ3mbjntmgBNxOFRTL009PxoG9s5RJeowwNmyFa/O8yrdKCDSNqPoioRTHLY1LCEGRo+N/PQJ0jxcFq8K2sBVaMj867OJ48N26RgbQ5/xTjJZvM73EIQKeq3PAS1AzL9qVFNhFeKA7V2HXUMITJ+aGQJATbkSIQ3ibqr7InZ1fV/g4ET/9Ywo463/Dn7Vsfdhdlhq2ihZRzAMJNFokheysjO/eoexwbIm4dd6nY9pcQIkrVVdJ7LoOCL8WYzFnYogmge+UEnxxIFqcCfW2GWkOouOiVsO26QgBY6as3C1d2AEYTkLHllMnYreBzrokuPhoF0FxO+lkaYGKd+bauTnRB3c5oSwBPi+7L1XvWjrlkg4uwaynLL2w4XnLO8IdI6mEr7Db8CPG+qKBRCVymFE8HmXmUNm/C6pUofg6zmmyRvy3kq2jUWB+aYp/SpwVcLB1VFfVToYOUT6k8/VLhLKF42FUwTjlfjReyHZ4WENrKnPMAdXwQVh3l6OtD2yKOx2vntdFUgB58+0+jxZgRTtd4Vym4JjMAw7DLxGJuRJRSYhVeokaKdBkiNSb7GzsSitpgZyycKXcszZb16nY8KPHgPxedw05X1CelHKMB6t4vZcrkRoxmV9MoG9FbCtwdaaE74
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(19092799006)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTcwMGllYy9URlpNTE52aktyMzBVakcxdVpwdVV5TW5KdFlERlRrM0xNRHlO?=
 =?utf-8?B?a2laMXk1NHdYV29LbThWUDdTWXIrQVVrZVVlRVkrd3MxTmZnMlVVNDBweDRQ?=
 =?utf-8?B?NXBMN0RzdzUzN04rQ2gxUWxERWpkM3lkR09hM3VGY2NmcDcwbnJBR210T2Fh?=
 =?utf-8?B?T0JFYzJ5ZkNKSEhDN1BCUUFNNENJSmFhM25BV3pEa2FKRnRVYUxiaUUrbDJx?=
 =?utf-8?B?UTF4R3htREVnRHV6OTQrK2RLeWFpSHI0L1l4ZEVQSHZtZEJ3MEc0dldsS09I?=
 =?utf-8?B?MWRKWDVmbDhVcmovdk5mNWRxZU5VVTRLQUM1eTBUN245bXhWdks1YjRiRW5E?=
 =?utf-8?B?QTVMbEl5aUpmVWtxTEFHWUhtcmU3WnY4d1dZaC8yNkNYRlNnR3FkZmZxTGpo?=
 =?utf-8?B?OGRlODAwbUNVQ3pBTGw5bnJYYks4azVOeUpnMXAzMGdLcGZlMnRWYUtFWVl6?=
 =?utf-8?B?VCsyYVRYT1NGY2xodVRwaUwraDgxWlJkcktIM1pPNG5OMWlESUJNaGZvek9q?=
 =?utf-8?B?OXIwdm5oN3BBV0U4VTdrT3B6TlQzMnRZWW81NE1UQUV6cG8vWHJvTW53cU5P?=
 =?utf-8?B?YnFCb3dRVGRwWHEyejYzVmdlYjBzYk5yMEhUZEg1OUQ2dXFNYWtwektrZFJY?=
 =?utf-8?B?VTY3bXFLUys3SHZPUVBQU0dMRzA4RG9HV1RYcHBVeTFGblBsQVV4M255TUVj?=
 =?utf-8?B?Rk91S20wb2Z2TU5wRjdPaDN0YXltUlJtei9OekFlSDQyMHFBNk93Wi9HRm9h?=
 =?utf-8?B?OFRXRmVWTkVZcnRwbDhWbEVDdGRtK212VFFkSEVXdVZIOUhvOUJkcE53TVQz?=
 =?utf-8?B?d0pHdDlYelVKK1B6eTJkeXFQbjV3VnJscmZTdmcvUGw2TGplQXNJSHY1V09G?=
 =?utf-8?B?Q3JvRUpRa0FqUktUb1IvWGNRRVpKeXR1Vm5QQTdxSHBFT1hqQUp5NVJUeGho?=
 =?utf-8?B?eVpvaE52MmQxendZbnNZSjk2SmlEdktXTGUva1lycEZRdGRBbVd4MGVVMzRm?=
 =?utf-8?B?NkYvcXF2SWYxVWMwbWdHZTVvbDhSNnBaQXVManYzVXB4enVKZ3RXelpva1RO?=
 =?utf-8?B?MEh0dUxwalM4VEVSWU16eDFWTXR6ekJ0MXppeERrMFRLOWVqZWR6S3dmVDQx?=
 =?utf-8?B?MG1rRmpNV3BkK2Y4eitZTkhONjdYT0thVnNPRmlYSGNNYTZBNlRKTDB5ZUVH?=
 =?utf-8?B?eEdVNGNGVmEra1djdVJua3R0UmE4dUpxYVJhQmNkMTZoa1ZUNTBnaXh3KzhL?=
 =?utf-8?B?TGIxOXRMYVpabXl2RDNTdVdjTGdRTTc4TlcwcVNSQ0hhYms3OGJjS3NKTXQ1?=
 =?utf-8?B?c2toUldNdytGQU1lRk01RmZRaUJJaE9jbW9LUDhJa0lVQTNXSW5RN3hoUUxa?=
 =?utf-8?B?a1M5RWRrK0ZuUnZiQTBmNlpZTWxZVURwenJBVjE1R2hkdFQxcWNTL0d4cG1G?=
 =?utf-8?B?UUltdnBDN3E1eW5NaGs5RGkyVEZwNHArdHc3eVNxRFpyUk16bVpoSXpkSGpw?=
 =?utf-8?B?U1I5QUpGTlBwRDUzT0JvWmNhQUZQK3VaUE5JQWlGREJtTTFKYTVpY0pMN2V2?=
 =?utf-8?B?WS9EOWZjaUpXYms0TnozRHB0RkVrRE9Zek1lcndkU3packVkTmhLOWZvWHVG?=
 =?utf-8?B?R3NCWEgxZVlrV2UxNTZMQ01hWXhJTHZSYXl0NGYzM3RNM3JVTmdYRzVpZkVZ?=
 =?utf-8?B?S0NtRW9rUWFVbEc1dDdLK0lBc1RZNVRiajJlWkFIbEI2UnByMnIrWUpqdy9u?=
 =?utf-8?B?ZWppdE43NHFnVHViUUZyN3lLSzJmSzhIaFM5ay9pNmFBWjYxMTZoN3JMODUz?=
 =?utf-8?B?VVZub2RpMDA1QnZSdDFLdW5RVHZwM0x5MC80bkcvOHVzZm42OVdwZ0dMSmg1?=
 =?utf-8?B?Yyt0cVFPQkxITWxWSU1lNEFXSG93NkZhTWx2cWRvakMvNlJNYzNrWUN4dWEw?=
 =?utf-8?B?MnJYNmhObmhKaC82NWRGaU0wMWxHYUlaNDBZK0F3a1VEa2FPZWtUb2l6d0d6?=
 =?utf-8?B?MERYNThybUN6czJFdndsd21SNGx3YzVBZEppUGFaUCs2L3QwRTVYeXJCR1B3?=
 =?utf-8?B?SXU3UEF5elVQMTBnZ05qWFpZekxTRFdrLzBTQUEyWTltZHREbUhHajFlcjQ3?=
 =?utf-8?B?WHlCaEZpY0RsK0RBUnJra2pwL3VmWUs2VXlEeXhJWWE2VUxnOXhhV1BId1M3?=
 =?utf-8?B?OGlobnZTUmoyZzYvS2doNlJiaEZ1WE9FTGxXbFNHRjRVckpVWTI2Rk14MHV5?=
 =?utf-8?B?QW14WDF2Z0JHLzVzZUdRa3NhQWZGaDFhcHJRRk4vTW9icW4zd3EyNlU1TVBk?=
 =?utf-8?B?SFFKczFnOTBJWmdDUytXVnFkc1RWZVpNY3FzVm55OUhiVWZ0RVJadz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de3b470-27fa-467a-27ae-08de8ecfc389
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 02:46:52.5741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6fJoTkuq9Ers8kjfHB5COBVM+F2MUOHV93ZQVFaTMvKJCOZ+KjEidCqyulksRcbN9E8mT11UMN4zLHlRukQS9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7094

On Mon, Mar 30, 2026 at 10:22:35AM -0600, Mathieu Poirier wrote:
>On Fri, Mar 27, 2026 at 10:42:03AM +0800, Peng Fan (OSS) wrote:
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
>>   ELF entry point:     0x0ffc211d
>>   hardware reset base: 0x0ffc0000 (default reset value, sw programmable)
>>
>
>But why?  Why can't the ELF image be set to the right reset base?

Per zephyr general link script[1]:
ENTRY(CONFIG_KERNEL_ENTRY)

CONFIG_KERNEL_ENTRY(_start) is the first instruction that Cortex-M starts to
execute.

config KERNEL_ENTRY
        string "Kernel entry symbol"
        default "__start"
        help
          Code entry symbol, to be set at linking phase.

The hardware reset base is different: it is the address where the hardware
fetches the initial MSP and PC values from the vector table. Hardware uses
this base to initialize the stack pointer and program counter, and only then
does the Cortex‑M begin execution at the reset handler.

Aligning the ELF entry point with the hardware reset base on Cortex‑M systems
is possible, but it comes with several risks.
1, Semantic mismatch (ELF vs. hardware behavior)
2, Debuggers may attempt to set breakpoints or start execution at the entry symbol

[1] https://elixir.bootlin.com/zephyr/v4.4.0-rc1/source/include/zephyr/arch/arm/cortex_m/scripts/linker.ld#L103

Regards
Peng.
> 
