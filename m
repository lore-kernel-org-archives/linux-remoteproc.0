Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013058.outbound.protection.outlook.com [40.107.159.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263E7324B1F;
	Wed,  8 Apr 2026 15:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775663873; cv=fail; b=QTqAC/EL9YI39kv+XfqqdMqrAjQ0tFbDsPGSshGzhXtEUrLItaAfzr+ZWNItjQYSnJlnFoC+y4VWipOrnxi7LtqxjVJa/GJsxge4tI5d+yCLiztBViQHs5MKFcme80+H33qW2QRu4v7Q21X7TcHiQAW8hPuYOY644MaWZWGt5ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775663873; c=relaxed/simple;
	bh=Eul1qg2VbSIYR6i9sl/EZUr0F4wEYn8fjcDHYoz5zbg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Do3zXSqD2wq67azlNKKKswIxlzjA+wolo2VbWTKKMyhfZND/71UuSvOK5Nvaij5MYknDQOlxnctWZ5VQvClX21t/Ewp6UAEs+WBMqpkMKSXiJx8fPY7zlfeQtzVOGKbiTMddTjgBa34TsqxiY9/KxMVhLVmlTnXa6yX20TzLSXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HDXEsEOO; arc=fail smtp.client-ip=40.107.159.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HDXEsEOO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+bt82G/yOd/kHpQyO9eTkpbEOzKLgdOk9OmFvi3Bh+7zF69Q5DQnBfoAVEo6HJL13p9FJFTOUf3BDNq5uIzL8O7XliKi5QbvtBb4MfrNU+jMDhM4Z44ihDYP0+8JxPqKUGGnXArSJBbZcDBhYn67tSJ5NbSFu39ukQJYOrOyIqAnSzKfMxzpCZHQDVcnq0pJe2tpDjcGTyzJz3RBXIx34UObH4Bo/Tu+I1axPNIwP+WV1SGDBr/gc4kyiGFSoBjVxSEwqlDLe3lK8ktECDE5b2iXCZIQLWgxEUlGvCjFmBM2cy5icOaDBeU1ZJFJD3o4et2+koPQ0nDukqvJvxp7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqYuVsb2XjLL2Ixw7DBhfeBFbxiPyVwNWuKIeGN+N+c=;
 b=UX6F3n+lL4UXE2nPNk7cpMJBLe9xDZSmWP5hWpR0ZNT9GCX6ZnNApBBwtbxvklKLjlrpW3PtllVWmjuzkjd6xjaIEAe7fkG8GWcZ6FhZn0zMwo4oAmDKaC0lOi3r364IHQDuizgRRHtzsHK9bOvjaLNQivADFP9IkWu4PJtc6JcMZAj4+avDgsfcN3zZM3PsBLvYM/axpmN5IGKCM1uTQWngBD3YO7lZrbD9FD7GDtrK5xSD5ZfcLQHnJkS95k1/8cnYOLPOdbpTcrjCRm0lUJ5ob2vc5+KAvYnJKJAU1rAFDDWwpuwQBCGBftC42E7l1ayxomzFB4pbeIKvfzyzuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqYuVsb2XjLL2Ixw7DBhfeBFbxiPyVwNWuKIeGN+N+c=;
 b=HDXEsEOOz63yxfthL5p6oJdm9dP9ds6jHcAauZuFL3U8DIhz9Jd32bheqwief3x5PgPjLo6hPjrr5N/qQMS0N5adk4SmGTUA+XAc8rlqjcyD/b/2sDaiHSw5+GHQJU0WX4ugxDSwMDLEmsKVGKl2ArCBmgzhwC2NI3azZEjAmTeCoy1jQzVVYWDsUQkuz1YPhmuSQm4nundikdevOt+sVrZYQJvw10jGUUMgySWqvPVZBHsUfHsWok8lQFJANDfP7UrWc7Uyg0L6vVHVs1AHeX3VZRyNkmKAwInYaefmnmGFjVnWGI9F8AmYLqc+Xr8T54tpYy3hd8d4ujYIREpECg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by OSKPR04MB11317.eurprd04.prod.outlook.com (2603:10a6:e10:99::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 15:57:48 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 15:57:48 +0000
Message-ID: <a9910b12-bffd-42ad-8dad-137f42960432@oss.nxp.com>
Date: Wed, 8 Apr 2026 19:00:56 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to SM CPU/LMM
 reset vector
To: Peng Fan <peng.fan@nxp.com>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
 <20260327-imx943-rproc-v2-2-a547a3588730@nxp.com> <acqjS440STRl2sK2@p14s>
 <acs2PAZq2k3zjmDW@shlinux89> <adUghiyZbe3fmcNX@p14s>
 <PAXPR04MB8459AA009C932EB9D6139A11885BA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <PAXPR04MB8459AA009C932EB9D6139A11885BA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P192CA0045.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::25) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|OSKPR04MB11317:EE_
X-MS-Office365-Filtering-Correlation-Id: 50531c0f-bc04-49fb-7b31-08de95879483
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|19092799006|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OLcvJzNpACPhkP2AsftbBKGPvTv+1rZy/XfaNusRmnX5cnz4xuhYYzsWfv10gqSvZUixvieT3cgQ49WXd5w9RPGOCTa4c9VQDKbhIFLJ929Xv2SXU50EM6wWD5ETzrPMMR4S2h55tp2/mp8I2KzukwCfXVE2IzhEK2MPS3IW8M0oyh7Q93m3LhiehSZQkWPzOpH76f1ZPYMHDLoJSerDGDC5UOwG/kiREbD/qyHMS2OTXPEwPbEQq2PhakK/RcONEIGQ9U9ONVsTufE39DMimA5j2EO1RxrW1w6HT0RWmJt7qu37TcGGcuUNFWuDzRzg+CncKWx5NwvdAM9wQHA0OGmxBWpPU7/nRtUAO8+naQ6tbveAQOIrzt7CZaJr9k3EhM66hUFhl4N2jbMhIXWXKYUIzmqIpJ59X+pzippEiSD2PgaGSMtLi5mDRWNcAlNaBWJv6JvsIpCs04Waofsx2VBzhnZaTXQD2Yrtc60DSFYHQST18xhfy1/BKn7RXbd6QYXc8lgcENd36nHOAFU8UXIT+TyFgnp9dVdhwQOsawBrZlcfq1kH0JuPpX5J77GRjaRYZXoflofYQFKT5PFKrV4zwae+fcyoTEjRRgPF4qAjkc0COwnzTlPEalcGpUEyolErEeGNRB31up+nSEKmHPDBMYmUMxwB0a2LWJ86q4k6vWEoKcwqqvU2YfVL1fT2qKxLsGWN9RjAUQ204lpMGDqqOf6ZBa65lLzKRL77RXk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19092799006)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkR2NUI5RkJVZ1IyallzV0R1OFhqMEI2dTIzemRDWkUwaGFRbWl6M2h6dXY1?=
 =?utf-8?B?YWJBU2ZraVI0aWZBQXVBWWppcEZMS1BrSmYvZFFRR1dqVmgxbmVGVmNieElQ?=
 =?utf-8?B?RnUvQ0grWXcwbTk3TzhaQTdtVWFYc3ltdDUwUEFtTDVlcWhWcUJoREZGb0ZW?=
 =?utf-8?B?MDIvZmprb3I3MnJZczNZT3djaXA0aVVNMmtrZDNxVFRObGZMZlI1NlY3Zm44?=
 =?utf-8?B?MlpRb2VFd2NERDhRT2R0LzJWcHRsRjR1ZG84VTZQYWpBand0dUZIb3pkd25i?=
 =?utf-8?B?VnNhTkxpOWJXMVI3QWc4ckpQOE9VWGcxd0NZSXNZVFFXS1g5TlkxOVBMWXJv?=
 =?utf-8?B?VlVGSUZsZEN4Y2RRbUM2SE1kY25TOUwzUEFacko0THNUeFNJTGhTcjRma2NI?=
 =?utf-8?B?SjBNV0xyelNvelVzM1JRb0Z1anVZQWk4K09sZXUwSWZjTVBhemk5RGJINXk5?=
 =?utf-8?B?YXNrVDYrWktWNmRkUXgwcFhSdTd3WmtoQnBrWGRoOXEyL3pNeFZQT0VJc3JT?=
 =?utf-8?B?Zm5SSlpOUGp6aVlLZ1lqU3ZrZWlXQ3ZaSU9SVDVmaUgrQ1VkSWFoYW9GTWk5?=
 =?utf-8?B?cGV0OUdVYllaMWZhRGxIbkwxU21sNjRsVmtnTmtMenFuZy9sOGI3MlpkVWNR?=
 =?utf-8?B?Q0NsdUFoajBMMWhjQ3BSM2l4V0EwVG1CTVFaSUlIUEsvNmRaRTB3c0VOMGFT?=
 =?utf-8?B?U25uUjg5bzJYelNUNzlyY2dvQ285bHZyT2FKb0d0Rk5wQlVSbDVsVTk2Mi9t?=
 =?utf-8?B?clV3SGhtN3VUb3duZHZFOFFpeXpVQUZ1RVNDYU9TNFFicW4zMVd4R1dOdmZQ?=
 =?utf-8?B?ZnptQjdxTzk5dXo5dzM0ODZJRytxNkdwLzlkNU9naDJ6WlVNZDlFcHJ1NGUx?=
 =?utf-8?B?Wi9WTTdxbHJscHhaZzIrRCs4NldtUzIzd2pWRlVXZE5mWUZ4YVlIZTZtaSt3?=
 =?utf-8?B?My9BT05nUW1zMnBxTGJyaVZFeTh3Y3lZYkVjR2Y2cW1TVzJMTU5aRERkSjI2?=
 =?utf-8?B?Y1plUUxab3l1N2g2Q2JqSm1MYmgrb1poSWtEa2tPQkRRTXltdkVZSndaeFJx?=
 =?utf-8?B?YXVlVm0xTSt3SjNSRkRUL214V2c4WVpGWG1iZVF0WDJ0QkZzU0JpMmx3OVJ2?=
 =?utf-8?B?VHI5VVI2VEx6Y29zeDFHbnFScFMwL214dWMrY25MWkRpVjdmSW03amlKUGpM?=
 =?utf-8?B?NEhFYTlobm9MdSs2N1g5M0dxOHVUK1BOb0huc0R4Mk9jNnk3UllpUjh5ZG1W?=
 =?utf-8?B?ZG9TK1VJS2lXUnJzbnNmZ0RzTEowVHI3bGpWRXluZWRaMTNuOHI4am0rbFVi?=
 =?utf-8?B?eG9zWXlXMm5WcHNvZ3gvakhNTDc1Mit2MnNLdzRlL3NLekVtSGp2YlNkZzli?=
 =?utf-8?B?L3o5eVY0TnkwRGZtVDBXOGpqckM3eEFMd3FGallBVzh3dk96K0lGMzJ5ZHZM?=
 =?utf-8?B?NXRsc2xmQWdqSDAyTHRQZm55REpxclBxMGYxL1ovQVc3WVR4cEExb0Y4WXRY?=
 =?utf-8?B?ekhnYUVpcnlEVUpnSWkrN05sVitPWmpzWTkyQ1ZKdXJrQlZMU3NNRDNCZi8r?=
 =?utf-8?B?V1ExUHgrZkEva0JzS21KaStEa0tkWDd1OXpqZVk5TzJNellkMjVZSkJBL0w2?=
 =?utf-8?B?WWYzenBabjdqWGRpbmRMMjY0Z0R5QWtkbW1tVjZ0ZjJVUEl6eWlVa1ZZaXFI?=
 =?utf-8?B?M05oRlJhRFhLaURqRTJJbG5ZUTRJOUcyNlpQQ1NzOWhEZk9tRGNqWWVGVUIr?=
 =?utf-8?B?eXlSSmZJRk9xVlRHLzlsSzVnUUNDcURvSVFXQ25HYnlRNmk4WmY1YVZDanVS?=
 =?utf-8?B?eFhNNld5cDZBc1QyN0NGWnk1aUpPY2RkeVJqK0RQTjJJVUFaNTlsblJaT1lh?=
 =?utf-8?B?d2dTQ1VQWXNQNDQ1Z1A1QmpFTkcrdElLZlk5Uk5QY1FqU2ZmelJRb241TzN1?=
 =?utf-8?B?SS9LNThRcFhTU05hbkNoeDZKUUlvUFI5SHJRWlRCME5LUUsvcGlDODdoRGxV?=
 =?utf-8?B?WkRmNnhTcWkzRWdiaG5YelErcmNwVzQ4ckR2N1BRbjc3T3Y2ZHVBUklmRWtu?=
 =?utf-8?B?c2FKV0drUzBaZVhKNzAwcUFkc1o4K3lReFhkVmVpckVBK0xBTFlLUi92TFll?=
 =?utf-8?B?TEFBT1E2MmUyUHZGL2tCbmdMb2prcmhCNlJBaWZTTFkrVDlncURQZkh5SDM4?=
 =?utf-8?B?a3dCNUw1T2lFL0JnYkd2Nk1pZ05YRDB3eXArSElMRVM4Q0V5SEJZa1B2TUNH?=
 =?utf-8?B?U09heHlwVlZSZTErR1F5L01IWGdsaDcwRXpWaFpURjdwSjRkOXRDVy9Nckt6?=
 =?utf-8?B?T1dLaG9sTGNzU0U3MTV4QWZ1TkV6TitULy9RL2daWThiSEd3ejdUZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50531c0f-bc04-49fb-7b31-08de95879483
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 15:57:47.9902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hoJP/Lm5MjpleoG2nR5vOylzF+gIIirtSrT9VPXXMesIowCQR03oGNoaXD6kcBAVwfY9svm22z3PFs+9op+kKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11317

On 4/8/26 04:30, Peng Fan wrote:
>> Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to
>> SM CPU/LMM reset vector
>>
> [...]
>>> Aligning the ELF entry point with the hardware reset base on
>> Cortex‑M
>>> systems is possible, but it comes with several risks.
>> I'm not asking to align the ELF entry point with the hardware reset base.
>> All I want is to have the correct start address embedded in the ELF file
>> to avoid having to use a mask.
> I see, per my understanding:
> FreeRTOS typically exposes __isr_vector, which corresponds to the hardware
> reset / vector table base.
> Zephyr (Cortex‑M) exposes _vector_table, which serves the same purpose.
> I am not certain about other RTOSes, but the pattern seems consistent:
> the vector table base is already available as a named ELF symbol.
>
> Given that, if the preferred approach is to parse the ELF and explicitly
> retrieve the hardware reset base, I can update the implementation accordingly.
> If you prefer to parse the elf file to get the hardware reset base,
> I could update to use them.
>
> Options1: Something as below:
> 1. Include rproc_elf_find_symbol in remoteproc_elf_loader.c
> 2. Use below in imx_rproc.c
> ret = rproc_elf_find_symbol(rproc, fw, "__isr_vector", &vector_base);
> if (ret)
>     ret = rproc_elf_find_symbol(rproc, fw, "__vector_table", &vector_base);
>
> if (!ret)
>     rproc->bootaddr = vector_base
> else
>    dev_info(dev, "no __isr_vector or __vector_table\n")
>
> This makes the hardware reset base explicit, avoids masking e_entry.
>
> Option 2: User‑provided reset symbol via sysfs 
> As an alternative, we could expose a sysfs attribute,
> e.g. reset_symbol, allowing users to specify the symbol name
> to be used as the reset base:
>
> echo __isr_vector > /sys/class/remoteproc/remoteprocX/reset_symbol
>
> The remoteproc core would then resolve that symbol from
> the ELF and set rproc->bootaddr accordingly.
> This provides maximum flexibility but does introduce a new user‑visible ABI,
> so I see it more as an opt‑in or fallback mechanism.
>
> Please let me know which approach you prefer, and I will update
> this series accordingly in v3..

I would go with option 1) as this and having something like this:

#define IMX_RPROC_DEFAULT_RST_VECTOR_NAME "..."

later we can expand that with a configurable name via sysfs.

This was along my initial proposal where you would determine

the reset vector address from the elf file.

