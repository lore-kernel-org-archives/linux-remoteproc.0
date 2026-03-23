Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013023.outbound.protection.outlook.com [40.107.159.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC013B6364;
	Mon, 23 Mar 2026 15:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774278792; cv=fail; b=ITiqNAfLlHHrVmOJleee3CUB5ATOqKPZdxAHfE6/5GszDTPHkBCqJeccvWFKblsBchucraYXAn2PlwGXDnr1FaIdchh2eu9vwsXjBhVqo6sAVcPTAhbBdSTGsUEPGrUzkpbeNQg+/NyCfnTNYHrzGw0UMqKRwtAlI28u41jiJP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774278792; c=relaxed/simple;
	bh=vcJSPWYzS0lPIOHGMTi6pUbXF32o83BB3k8e+JFWEwM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lS84ztvUvMD+K3pWUlnlS05anK5Yt8oj0KCq4ctGiTEl5xpWtamLn6mEUyoV2pIzXRumQ33ilJT1vVbL+MW/9JO0RMiOWoYXelsMA3G3KNedcH6J1QoRZq4J6OMfxFCXExHe4sr/22MqW+SAg/aYTqyH0R7V/inCNErqOO++e5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MmrxB42G; arc=fail smtp.client-ip=40.107.159.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MmrxB42G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQ/Aco+qHhekCNebkGjQG5xZYSmZjCCVqyXpRiNEe3whsbQyPzyyUqOmqxo8O8f8FdQo6BgvK6i28kNU4Tz+/RjPMkWuoHdFOqJRfE0uiDOI/ku4ejfxlc206l75gz0cFCNJACjOmJBe6l1/0JH1TzZvjfJFjULto4U9hl6INoCHubSm85TQTVU3JT0p2CQ4duQY9rtpMzTMrP8iJQJPrwwuiMs9Z7QuKxna0RAUs+TIQtzh30Z4Ol8Lmi1eQtvrbLBfzNuGeC89RRc+HFWsw1HPDYcyV3PZpbAlr11T9H4eMY3XmZhTTfQMVk6pWIHa9zig1YMdc8R7m+I1pcJZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Th394ncQCs3Kh40Hvs0LbO7LZwJCHzz6crYYomWJRS8=;
 b=uwBB39anTUS1xNE4eg5XR995DxVeyQEQGtEzFcDjTKEW7SkldaUWkCXKMthPrPcGY41jFMV0t9MeIFER/OT1m5/AYpgd9m6yooGaHIPGIDmgK/p9dPT1gI5RkgreadDvhlT1iTmXlA3sc4zOTfnWK7b4M0qBONhWU+vjfN04dTyhwY0qRXttinxzpBPBglm16CtIyXPJnYPR7GsebKuA6zY7D7iHKXCiHT8gCnvJjV7XjrccRG+ZtXjY3FrK7glvS+62bgNo+sVC6roqW9bplZySIeDwvO5BVCi6g+3Ypy3lgUah4138Fn+mVb/pRb7dmy+dXiCc1jT+1+VWVTWGHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Th394ncQCs3Kh40Hvs0LbO7LZwJCHzz6crYYomWJRS8=;
 b=MmrxB42G56jx+9ioLpouZDTCPzOStGqXbD1/ODBZseUcj6+CymZVRwA7NEkum55cXhqbrLBVlIhHGZ6p3kg/NboRwnQO+VP0+CO90c3jGLkIuHGQ1KFmNXAE9PwKXjWuR+pLuqkfzorNHnNZBy4No9bq4QIb5DU8zk+KlddrUJuduARaZOLc2gp0J9Ic8l0qAkaUhsebBhtfVtbzC2CDGCtVJkd1/cqh0MYCoMQ3qdct5zCl34c7vkIrmY0U9x7ntwk0+nSx79N5dZ06DyLiSiYR/ADdt6iD1xxD0HpuUWj+vpbeMWA21AY9vPufnwuzaLh/TdSyOlIHy1WQJh7IAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by DU4PR04MB11860.eurprd04.prod.outlook.com (2603:10a6:10:628::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Mon, 23 Mar
 2026 15:12:41 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 15:12:55 +0000
Message-ID: <a7982125-1782-4655-9800-235f99fc913e@oss.nxp.com>
Date: Mon, 23 Mar 2026 17:15:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: imx-rproc: Introduce
 fsl,reset-vector-mask
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>
References: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
 <20260312-imx943-rproc-v1-1-3e66596592a8@nxp.com>
 <3e1a3f07-8c0c-4757-afd2-b9e6574a6274@oss.nxp.com>
 <ab1D2qIUh+KPnS7p@shlinux89>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <ab1D2qIUh+KPnS7p@shlinux89>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0224.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::14) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|DU4PR04MB11860:EE_
X-MS-Office365-Filtering-Correlation-Id: c5ecba83-2dd5-44da-3e7e-08de88eea931
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	jQUSYHN2B6V99tZQGgw9MjHiMdEqFAyOnakg+NL9bJ7icz566mMWa3hZBX3XrLJLFgDm44TcxVw98GcWG7DGIED5WUakSjiu5Td4Fnom74nRl0RySdka6JQCUjhLih0P5sZ6uY/Sn5Atq8De+bsY6rMdJt3qdHOMZ1XL097iNL6WObMlfozZ2yrIPUd/tL5Dq6ysUI1OlZD25WWC/fBygAQ1FAO1Tzz3bBmAosKZy2Cec86wEt2jYiKVLSXqJr/HvT7zsUyBxjGrtVd1SqbwJiJ2lEkab/UIr0pikct/k+O4juq6CHj5YoOJ7guEJobshPJMV6D1ZCYR6fXQKVXT9UniPveRJqj2PQSz4kKtrXEp98VQoJ1JRCdN1lupwjfJTVYRW8uzvciS0onIdQPCjzmfwci7CfPSZ7Qk/nB87YGIJ0ZOG90FluPgF4kd0whcJhh+ZGDYzFxrS5Oq/INShMZky8/eRwyf4aCe5xi4QVqgt9I8r7/LDPm61xvJZmENweK23MBEDhuvxdCNZKee4J4pjvBsFrkz3QjA8BtfOl6LtFRsHk5hos0fv+9is2zYcjyTSgoudFttacuuE4pBYT6ph3A0FYIJuHA8/kmATO/3dTA4UDH8gGveNw0U3r6FapvsSgsjllJVZLPWo0sm/ZxPePT62LxxMPJRiawPQoh0GoXcPxezV+MRqswUxpkW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjExb1R4OFlXbUljdDJMMlhodlgxaDhQc1R0TDk2ei96NXlrd01rSzMvMEY4?=
 =?utf-8?B?YWhvS1ROVGZmdmU3MFBxVVRXMzl6bFBtY0YwZGs4a1g3UFpUZVJLM2NNRlZ5?=
 =?utf-8?B?cXpUcmxCUnpOVWVnWVNkSEFTNFFtb2lMOFZGSHV4bk4xMlpEeG9qd0RFNFVs?=
 =?utf-8?B?Mjc0K3FBWVpUSHN2OGhXcytJUGVCMGJYTVRaWEJUbkFWTHhrczd6citHbVhT?=
 =?utf-8?B?d0dqNEw0emdXcUtXa0ZGbHhGeU9KajcrUEtqT0lnZWZBQ0xaYTJTc3dRb01I?=
 =?utf-8?B?VGJ2Rm92b1hkNGhnUlI1Z0VTSkp4VExlZndPSHRxT1J4dmdVemJMd2lMakRN?=
 =?utf-8?B?OEFmRlRtcFkvOUFKbURweG5RWloyN0NQOFlwZ0pZWDVFTVZrZjdNN00yVHBj?=
 =?utf-8?B?SHJIV045NnNLMkFWU1lhTXVQWHExY2RQLzE2aWNjb3dSUDY2ak5pNmdmMXZC?=
 =?utf-8?B?dENlMFJDN1gxZlFWM2FISWxEL0lEckhhdU5yRnFDQkJRUmRLMXl0aFNPZks5?=
 =?utf-8?B?TlFiVVduR3VmS0lSeHdvYmdETGRlVDI4TXErTHRKYnBpUnNNTTVCTnJKYWZR?=
 =?utf-8?B?VWt2bUdPVTdLWk5BOVNmemp1alExeE5BRzk5YzdWaFM3ZmZ5MnNpM0lhQmVT?=
 =?utf-8?B?UkJueGFhSTZWd3JWc09NOHVRTWxNaWFzZUlqTHgxaEpnNWVRYVlHNDI1Z1dT?=
 =?utf-8?B?YWZEdGNPWFhnc1pYdEpWa0wwcktTVkJxY2tjTm5kMWwwWllOUWFFSmptMkVD?=
 =?utf-8?B?N3ZWL0lMdGx1K29mamh5YkpPUHJrWEVzckRVaVVJTFdzcExlY0Y3SUhjZVlQ?=
 =?utf-8?B?UW1tK3hpalBKUGVqdjhZYUorVUtnOW1XUnI2OVQwUEFmRGpBdEpUVFFKb1U0?=
 =?utf-8?B?MkUvdVBTNHN5S1dyM3QxNkt4cjFNM0Ftc0Z1L2tvVmN5VFhLVjFlV2t3UXNN?=
 =?utf-8?B?Z3dkZzFlVkZDaE82T3RaR1pFbWlRS1c2YTJ3ZWhCemt3Zml3WHZMVVI0OFA0?=
 =?utf-8?B?QnRtdXBsZzErdy9RaGUrN0lLdytaMWJObm4wa05DLzhKWGVuQmdnUGovQzcy?=
 =?utf-8?B?R3BNa25xOTRSbWJJaFZoVnhpMEkzaDN0d3hhY2dQVDlzZHlUUnFyaVJyZWc3?=
 =?utf-8?B?a25nUStkZU1uZWNKQXNGNFNZWWhRT05senRrTkxKaFJ3V3BGdmVuTGU1elFn?=
 =?utf-8?B?ZG1WbXB3SWlVZDdkVjdXM1dzOVdhYWJTVUE5VGlMK0kwKzV5RFJNeFdNQVgy?=
 =?utf-8?B?UzNKMmcwN2p3Z1NJdm96Q2NhTHVUSW93UzJEV0FibkNYcll6NlI0M1g1L2Zm?=
 =?utf-8?B?OGk0YnhsSk5sQnpMRkUxVUhua200bjIzQWhvVW1TTS90SVJvYnZWd1JpUjRG?=
 =?utf-8?B?aXV6eGxBTTNYeWxRRGFjTElMbDVkSEdLcG5yNjdyeUJqZ0Vqc0ttWmFZTUU1?=
 =?utf-8?B?MkRTVjZhSERlU1d0Rk9BOC9HMzRGWExGdG9QbDVoUVo2bWt1MDlVbGpuNVcx?=
 =?utf-8?B?QlkzOG5mZnhPNEdIWnhFZkxNTVN4NXJUUHBENFlVbFN1ZlpwWlI0N2Zpa1dU?=
 =?utf-8?B?UHcyQ1pTNGlLTkFNa1VSSXRQRXdXQ2FHNEVhdjNrVUZ0aVErbkhnMkNmVzBZ?=
 =?utf-8?B?cnBUSDV5OWo2ZGhXUGd3ejRMMTdJTStlQVVLZTllMTR6THU5RTNnWTVveTUr?=
 =?utf-8?B?S050V0ZtQS9ZMjloeENldXBlTUlaN3RqWFNRRkNCNWp2WWZFWWNQbnpwUS9z?=
 =?utf-8?B?Z1pZRXZVUGN2TWtqRERZWE1NRFYyTUlQZjdEMGc0VXUxR1Fybzc5Vk1ualE1?=
 =?utf-8?B?L2hTVm85YnpHSXl3NGJUSHR1TkJsclh6YVdORkhJNnF2OU5seURFOE95UlRo?=
 =?utf-8?B?L1NSQ1loUXhRREo1WWZRdGNubWhNL1pRQVRSU1JiN1VmcDlEY1ltejZQdmMw?=
 =?utf-8?B?Z2lRdWRaTzZKcE82T3lPSklVa0hIeWFQb0NFZGppSGVORkdpWWgva2dpYWs4?=
 =?utf-8?B?N251RWFhUWJtYVV3WnppQmlMRVo5ZXZleEVUUXNDR3A4RG5zSjdFR3NpWkNZ?=
 =?utf-8?B?aTgybEZndUxnUDhqcEY3M2VxelBONytwOEw2a1pNcFVsNTR3ZW5BVFJETk1O?=
 =?utf-8?B?emRtVGcyVDQyZURiTitGYmZJM0FVSTF6OUZ2NlUrYzNMMnJlMkd5am1ZRGpv?=
 =?utf-8?B?RThBNE01NTBxN0lxa0diOUJ2enRpY3J4cE9Db05zSkJGTGtpZHFEM2dBY2NI?=
 =?utf-8?B?NE9ZaXU1SUpmQTJRa3pieDFjazV6a1podHFmOWFTaGVFakZ0MER5ZHYxSkg0?=
 =?utf-8?B?MklYSGo3SFkxZDNqV2cwZlZoR04yNXl0SzcrTG9rTUZBRlBSNkgyQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ecba83-2dd5-44da-3e7e-08de88eea931
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 15:12:55.7819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nx5v9HbHnPflcP41VB2Bbt8daj1ZrVrvH7LodLJbNKEh83xBaHAQTZEipArkksaEuPDh4o0ZVtwGoay4HGkO1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11860

On 3/20/26 15:02, Peng Fan wrote:
> Hi Daniel,
>
> On Fri, Mar 20, 2026 at 11:46:53AM +0200, Daniel Baluta wrote:

Hi Peng,


Thanks for your explanation. Few comments inline so that we can

find the most scalable solution for all IMX platforms.

>> On 3/12/26 14:36, Peng Fan (OSS) wrote:
>>> From: Peng Fan <peng.fan@nxp.com>
>>>
>>> Cortex-M[7,33] processors use a fixed reset vector table format:
>>>
>>>   0x00  Initial SP value
>>>   0x04  Reset vector
>>>   0x08  NMI
>>>   0x0C  ...
>>>   ...
>>>   IRQ[n]
>>>
>>> In ELF images, the corresponding layout is:
>>>
>>> reset_vectors:  --> hardware reset address

Is the hardware reset address fixed by the hardware team? Can it be modified at runtime by software (e.g SM or any other firmware)?

For example, with M7 on i.MX8MP the M7 core will always boot at address 0.
See table and explanation here: https://docs.zephyrproject.org/latest/boards/nxp/imx8mp_evk/doc/index.html
So even if you build an ELF to run in DDR the reset vector won't be placed in the DDR. But instead you need

to add a small romstart code in ITCM that is you put the reset vectors in ITCM then you jump to DDR.

>>>         .word __stack_end__
>>>         .word Reset_Handler
>>>         .word NMI_Handler
>>>         .word HardFault_Handler
>>>         ...
>>>         .word UART_IRQHandler
>>>         .word SPI_IRQHandler
>>>         ...
>>>
>>> Reset_Handler:  --> ELF entry point address
>>>         ...
>>>
>>> The hardware fetches the first two words from reset_vectors and populates
>>> SP with __stack_end__ and PC with Reset_Handler. Execution proceeds from
>>> Reset_Handler.
>>>
>>> However, the ELF entry point does not always match the hardware reset
>>> address. For example, on i.MX94 CM33S:
>>>
>>>   ELF entry point:           0x0ffc211d
>>>   CM33S hardware reset base: 0x0ffc0000
>>>
>>> To derive the correct hardware reset address, the unused lower bits must
>>> be masked off. The boot code should apply a SoC‑specific mask before
>>> programming the reset address registers, e.g.:
>>>
>>>   reset_address = entry & reset-vector-mask
>>
>> What do you think about this idea:
>>
>> Use fsl,reset-vector-base instead of a mask. It could happen that for example
>>
>> a CM7 instance has explicit requirements to boot from TCM but the entry point is in DRAM.
>> Then masking won't help.
>>
>> fsl,reset-vector-base is always fixed hardware integration dependent and you can always
>>
>> specify it in DT.
>>
> Thanks for sharing ideas. But this not work:
> 1. User start an elf which is built to run in TCM. the reset vector is in TCM.
> 2. User stop remote processor
> 3. User start an elf which is built to run in DDR. the reset vector is in DDR.
>
> So a fixed fsl,reset-vector-base not work. We need a per elf reset vector base.

Ok, I see. So a fixed reset-vector-base won't work! But in your case above a fixed

reset-mask won't work unless you always know that for both cases (TCM, DDR) the

entry point is within a fixed interval relative to the reset vectors.

> For the case you list about boot from TCM, entry is DRAM. this is i.MX8M DDR
> elf demo. The hardware always fetches PC/STACK from 0, but elf entry is in
> DDR. We always use 0 as boot address for i.MX8M, no matter what elf entry is.
>
> For i.MX95/943, there is an register to configure M7 or M33S start address,
> If the image is designed to run in DDR, user should set reset vector and elf
> entry both in DDR. If the image is designed to run TCM, but space is not enough,
> DDR is also used, the reset vector and elf entry should be both in TCM.
>
> Per my talk with NXP SDK team, It is less that 16KB from reset vector to
> elf entry address.

I think with this assumption it will work. Please mention this in the commit message

and we will go with your initial idea.

