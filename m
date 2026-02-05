Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012035.outbound.protection.outlook.com [52.101.66.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B0B3002D7;
	Thu,  5 Feb 2026 17:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770314340; cv=fail; b=JswGs7dyUwAhAuSnEAPF9yJf0IZtp6tJsysw8Nnn3MDPD7VOCBEbc31rQ98/QuIsmVSOe2M3BoZ7LLo8+kEIfBIglvkaQtrKsC8W/RGmUj+G83SzIjXBy83O+71Afl4pLXw90pfhybx2a63z0TFKQXdTFHlHrRu/rohuDMyLc3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770314340; c=relaxed/simple;
	bh=EexoLw24yOZEVqJ1y+DtXY/r7eOM1+2Ei3gzx4EIXnA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=dCPLBsZ3G117xRngAXrS70qCi/NNrmAbU3T+aNGoY7Ye0XX8bmacZAx2aL3hf+yblQ6ploH7577LI5HeWPbJkFZtnRyeyR19ljut/XJmEDejjbo4XyD2nKSb70EZm5TD0CJ7CvjQGRkN3MbrYev3JnjMuOD99aZvuzkXGx2Urnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Ly8x3Qvq; arc=fail smtp.client-ip=52.101.66.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Ly8x3Qvq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLpdQNXgoT1fUpR6rRfKOPpbKwYTF/Nzc4l/fMDSKksQ1ljzB7k17i9bn30QPf88uf7jv5E87Q5VivUw1vuj8rOd1RuTrQjchfZUyoJYh+sdq8r4VVwZ+ZZm13VyGPAtGq/+lKlL30xSrZLyx4VPCZu+KJim1zUrIsFFE7k7qv/bj+DNj/eW4OpqP9+QVM6RdBDmjhx6iVvAAPkFkD3Q2shJcYc9XtX9/uaOylQwQbUAjODxQDQGOI/vuwKEe+8p2tyBUJFsaxqjudA1iiHhnB2mI6cN85y/dasUemPehOWpS/63eeNOtLb3gUpL7hJYi8UwbZz6E48GupB877dYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SS1veu7Q1BC95ycaNL5rSk/gzl3ub25YbVD4Up4j+k4=;
 b=G45XudLyCITx6KKrSXfKXtz24DBeSzNNWc101qZspreJo2PB9/5UCNbRqvW9Ep2QYVhpCdhNBYjdPiVeoNgWgDNz1U4ErwONH6qjbmJxN+wSen9OaB4kzc1lFxHMx3+gfGuL9MIz853KJr+N8zFpRwrIAvD3yG3jh9aa/d9mm6/QbZbh5rqdUjdKOKXUhFXs4I6O8sNSKMIZJnLfdIatwD//uVBimkBELQzzalPUUQsrzDVVZa/D/JD6IQITlJIMtbK7SPU2R29r3PKgZtpiI8oBs2cvt2UxFRuKh2wsw37Gp/+Pdw1MFWwAvbbRL8bq8jhPKU9SLirNfrT5o4Ix1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=ti.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SS1veu7Q1BC95ycaNL5rSk/gzl3ub25YbVD4Up4j+k4=;
 b=Ly8x3QvqPjEbvzp3xDMTV9ETlMSFY6cjEAbhmVCVTh2TUCK6H/bc8DHyHZa30arst03HMI93HvhEjuxd9Sev7/vm0gHUxCVcbEV+P1njurMEK6j0cc/pyRhaVGUrHLVSMuokwm4hL9pyVAoTszp7I5YLtENOvylFVUtk3taMa+QObMiW2tJHYyPdF/rVcRs1G5/nTKYD8nKyNuocQ6ZrEL3ZU132IEKbMIVB/QBs43SMqHzjSGZM9Wyyc2a1n2rRzf/z4yzfxzBWXTsDP0CJyk3OXxZPUDtEpVPorUc64ILdP5rzkEiezdmuXstqgQqq18H9UoCdSt2Qotbvee/RDQ==
Received: from DUZPR01CA0143.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::8) by GV1PR10MB8420.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:1ca::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 17:58:52 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com
 (2603:10a6:10:4bd:cafe::59) by DUZPR01CA0143.outlook.office365.com
 (2603:10a6:10:4bd::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 17:58:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 17:58:51 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Feb
 2026 19:00:38 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Feb
 2026 18:58:50 +0100
Message-ID: <1a175145-d29f-426a-a163-1d185b8b0348@foss.st.com>
Date: Thu, 5 Feb 2026 18:58:49 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Subject: Re: [PATCH v3 1/2] remoteproc: core: support fixed device index from
 DT aliases
To: Andrew Davis <afd@ti.com>, Bjorn Andersson <andersson@kernel.org>,
	"Mathieu Poirier" <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
References: <20260204105216.3929071-1-arnaud.pouliquen@foss.st.com>
 <20260204105216.3929071-2-arnaud.pouliquen@foss.st.com>
 <4a4e50f4-9e02-4ca2-8b3f-b01caa7df35e@ti.com>
Content-Language: en-US
In-Reply-To: <4a4e50f4-9e02-4ca2-8b3f-b01caa7df35e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61F:EE_|GV1PR10MB8420:EE_
X-MS-Office365-Filtering-Correlation-Id: cab80ac1-dd0b-46c1-3e46-08de64e03874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmZUVjFFTHdIWTJEN3M5MWJPSEFaWXNPNjl6bktkRi9Gbk9CMHhlZjVRakQw?=
 =?utf-8?B?dlVlZjZrNitHdERvQXc0b052NUNxVWtYT1c5ZC9NZzdWSEdOSit6WmZOc2d3?=
 =?utf-8?B?VS9iaUhrdG00YWxBSnIwR2ZUbitrdXZ0ekVqK3VSUkpMaUZMSlVmV0Z3NVJY?=
 =?utf-8?B?RGlrSU9QcWtiZjlGY0kvdE5HemJlTlB6a29kMHhKVDBtTjd5TzZwNndzZFNj?=
 =?utf-8?B?SnpDeDZMR3RCc3M2R2RTU1dNQURPejZxbGU1cFphcHc0QjRCWlpTRjVQaVJi?=
 =?utf-8?B?UFN5dTVwSmZhSkNoRDhKVEJMaHRiT0RnZldyRVc5d0ZQQXZzUTRiV3ZNWmRG?=
 =?utf-8?B?RmR6NmkyYUR2QW5rdHpEVnExYjA4SXhXaFRrUGlxejduNVlTYmozbUlSSEFp?=
 =?utf-8?B?aFJkZHFNd2hVcG9RYmJVUHBwczZDK2tsWnArbXZRTzBaRUhheXBaT3lyZzBu?=
 =?utf-8?B?N3prOG5kT1daYzhUck1zRU1zMDdmL2xONHlqc0tabkRPRitNMnBUa1ZXOXlK?=
 =?utf-8?B?aDZKWkRFSWZJT2JYenB2d1BpZHBvZHpIOVN6NEJSY29JUWhFUUFZNENNaHRm?=
 =?utf-8?B?TjNJMkgvL25yRWd2YzZsZ04rQ0lkOHJQWHI0bE9BajBMYmdtbjB1NVh3Y3Q3?=
 =?utf-8?B?VjNBbTVRZnZOOHZlVFUzdjdPWkF3UjJxT1RYN3pwWkNQb1F2ZHk2dG50OUpR?=
 =?utf-8?B?OUgzbzhYTWxac0RlZkg4SEZmalh2VExqWGlwL0FoU3VhNTVFMnJHbUFRSUFz?=
 =?utf-8?B?TTNyVW0zY3FCR3JsZGVtVmZwWm1lYlBuSEwzZ2dtZjIrSlJqbEs4MmdCY3p2?=
 =?utf-8?B?WlNzdzJRUGtSTmpXYXNuTjA5UEF6Y1oya1AxVENFTXZpWHliMjhYTFJsamxV?=
 =?utf-8?B?WmhkOVNDOGZJbWZaclM5SklsZVV4akhybExVdDJtOHRZYUc4bC9CbERTd1RU?=
 =?utf-8?B?RkxuSDBmMjV1ZEk5SE40aG4rb010Rkk4U0hiNFFJeHN0NmFiT1hlaDdTN2J0?=
 =?utf-8?B?Qmd4Nkh0dXoxK3BaM1hRejlOMVpyNVVaWTR6MXlBNzhBVnYxaXVrZGdyNUdp?=
 =?utf-8?B?cTZBTzdZNy8wMUxyNTgzSFRSd241QmhwSzN4MDcvMis5amJGbE55L0xKUzJp?=
 =?utf-8?B?SGtiMkdmOUxtY2lyWG9Vd2x6dVJFU3FvTWFQVEJFUlpBMXR1QTh2Y3krd3Fs?=
 =?utf-8?B?SWlibzExUVgrWksxYXU1NXMyRmF4MVJqWUdtSFNsU0RYOTRMUU40TjVDMkVV?=
 =?utf-8?B?TGZxUEJPWXJtOFRvK3JxMEUxa1lwK3pPeFNKSjVKcEJiSEk3S1J1Q0JidlV6?=
 =?utf-8?B?WGRoWUhUSVNNR2l6NFZHSDBpTG9IZjlsM0hvQnpFWEFRaE5aVUZua0xlTThs?=
 =?utf-8?B?aTdpZjVRUHRkbFZXZlhnelQ4U0dhbktwT0NrbVBleHAzVXllSmNFY2tMenN3?=
 =?utf-8?B?cmhmc3RUbVlLY3hzQmwyaDFqVG9Gb0Y3a3lJUlBCeHRnaG1JeTZvaU0ySFVz?=
 =?utf-8?B?NWwreG56TE1vU0JTNjVPZll0ekJqQklLRjFVKzhkbXlOOXdBd2lHUGw3aFYz?=
 =?utf-8?B?cFBFQWtzUlBqSlJXejB2MFZvRGs0VDhveVZkdkM4dkJnOXQyN1o3VWVhN0Np?=
 =?utf-8?B?SHBNbGxTSGpEMVphVFZVTzZ6RFZzNDlEZnVyZERadFVrTXp6bkl1MnpPZ05E?=
 =?utf-8?B?OTBkN3hzeEZLV2tZSndzcit4OHZqQTFMNEN4bnd2RnZXNFNRVkRuRjZMQ2pP?=
 =?utf-8?B?K2pWa1lBbUg1L1c0OVphSERyNVhNQ1JKOUVHNlVndHdVeDFQY0dFZ3JxaDM5?=
 =?utf-8?B?Z1h2TVNpSVpiVXdqd3RvVzg2dEE1bDB1Y1llbmUvaUNqYlN6Z3hJeUExc3Nr?=
 =?utf-8?B?dFJsWjlzYmxDNTkrVXZVcHRFbWtGQmNtUVVwQTdCZ1I1Z09vbkpiUy9teXIy?=
 =?utf-8?B?c1ZlOTZUaTVFWDlBUkhxNm9ndythVlY1NTR0RVVQWjBNaDR3L3BxRGhxT2JH?=
 =?utf-8?B?dmJRYUI3UXR5cXJXNmROS09kNEFtTHdwRzdlcktXVFUwUkNwLzJNQ2tTdVZY?=
 =?utf-8?B?Zk1nT3o5OXoyZUcyaXZ5bzU5ZjVtWmlROGdZcENjU3ZxUWVQMmw4ZEQ2OStp?=
 =?utf-8?B?bkFvRUI3VlEva0FKS3ByN2MxaDlZUXp6U05qNU11VHcvMUJxc1RiU29JbmR0?=
 =?utf-8?B?YmJocjFlODdmK3FhZ1hTQ0x0VzZQN3dCSnYvTUZnR2k2U3cxS3N5eGNCbWd2?=
 =?utf-8?B?THQ1OEJ2TTBVbFpOaGtBRTdKOXlRPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Kj2YnEXOMC632jsv0KMqcoNPQbsdQBZV/OTy2R7/QA6GEXaRO3Sb35I5bBJ1sUZO4BpIObUGUf6vUH6Lk+47Ucb2l9fKD9vo392NAD7CpUP+HS3TwT28bhBF8LCPg5xaYvX1M/TzQrcjbe4VdzzvJVfZbwN8M/CIhRGVrhvT9pc9Fe3CtsatPErUQDsrM7hDaaaP3uc8YfLo7es4aLCyxGR42My7eXnytEdV8XmoPo5FyLcFVjJkvke9I59wtWWuaMTQNR+F0uRYSxpS26KR+9wmxW78+Eo/EgAt0XveRSKkyiubgbHlnJCAsN1tjdoS+xBfCMWFszUMZxsadz+EuXwlsP80OvVF/7OFIOjY/mSMdeGRoXL3LZEaIP/IUJoZuMN5LCuMtjM+j6D5NBk/s+v8oTyHo3KYGFWxT2rn9ddsPeUwbBt1hWNioQjL2iTO
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 17:58:51.4633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cab80ac1-dd0b-46c1-3e46-08de64e03874
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8420

Hello,

On 2/4/26 15:57, Andrew Davis wrote:
> On 2/4/26 4:52 AM, Arnaud Pouliquen wrote:
>> On systems with multiple remote processors, the remoteproc device
>> enumeration is not stable as it depends on the probe ordering.
>> As a result, the /sys/class/remoteproc/remoteproc<x> entries do not
>> always refer to the same remote processor instance, which complicates
>> userspace applications.
>>
> 
> While I will agree it is slightly more complicated in userspace to lookup
> the device by name string rather than by some static number, there seems to
> be a good reason for not doing this also.
> 
> Much like network interfaces where the /dev/eth<x> can change each boot and
> attempts to make that static from kernel has been turned down: having 
> static
> indexes doesn't make userspace software any more portable.
> 
> Say you lock your M33 core to rproc<1> on one SoC, it doesn't mean your 
> next
> SoC will have the same rproc order, or even have a M33 at all. So you still
> need your userspace code to lookup and check the name, otherwise you make
> bad assumptions. Not having static IDs forces software to do the correct
> thing here.

That was also my initial approach, but it is difficult to impose on our 
customers who have legacy applications, especially since they are 
accustomed to using fixed indexes with other framework ABIs.

> 
> The only valid reason I can think up is maybe this makes board specific
> documentation easier. One can say:
> 
> "On the STM32MP257F-DK, check that the M33 has booted by running
> `cat /sys/class/remoteproc/remoteproc3/status`"
> 
> without having to first find the right number by checking each
> `remoteproc<x>/name`. But wouldn't adding something like a named
> sysfs dir syslinks work even better?
> 
> `cat /sys/class/remoteproc/m33@76000000/status`

The only benefit I can see in checking 
/sys/class/remoteproc/<name>/status instead of 
/sys/class/remoteproc/remoteproc<x>/name is to avoid iterating over 
devices by name. However, in both cases, the application still needs to 
know the remote processor name, which is platform-dependent and usually 
defined by the device tree.

At the end, using an index here is simply an optional alternative to the 
name, as seen in other framework implementations.

Regards,
Arnaud

> 
> (and yes I know someone here at TI did this alias naming for our
> keystone platforms, but if not for possible backwards compat breaks
> I'd love to remove that one also)
> 
> Andrew
> 
>> Inspired by the SPI implementation, this commit allows board-specific
>> numbering to be defined in device tree while still supporting dynamically
>> registered remote processors.
>>
>> For instance, on STM32MP25 Soc this can be used by defining:
>>
>>      aliases {
>>          rproc0 = &m33_rproc;
>>          rproc1 = &m0_rproc;
>>      };
>>
>> When a "rproc<x>" DT alias is present, use it to assign a fixed
>> "/sys/class/remoteproc/remoteproc<x>" entry.
>> If no remoteproc alias is defined, keep the legacy index allocation.
>> If only some remoteproc instances have an alias, allocate dynamic
>> index starting after the highest alias index declared.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> Tested-by: Peng Fan <peng.fan@nxp.com>
>> ---
>> V3:
>> - fix double space typo
>> - add Peng Fan's Tested-by
>>
>> V2:
>> - Introduces rproc_get_index based on Mathieu Poirier's suggestion.
>>    An update compared to Mathieu's version is that the call to
>>    ida_alloc_range is retained if an alias is found for the remote 
>> device,
>>    to balance with ida_free().
>> - Rename DT alias stem from "remoteproc" to "rproc" to be consistent with
>>    keytone driver.
>> ---
>>   drivers/remoteproc/remoteproc_core.c | 40 ++++++++++++++++++++++++++--
>>   include/linux/remoteproc.h           |  3 +++
>>   2 files changed, 41 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/ 
>> remoteproc/remoteproc_core.c
>> index aada2780b343..4a02814c5d04 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -2433,6 +2433,43 @@ static int rproc_alloc_ops(struct rproc *rproc, 
>> const struct rproc_ops *ops)
>>       return 0;
>>   }
>> +/**
>> + * rproc_get_index - assign a unique device index for a remote processor
>> + * @dev: device associated with the remote processor
>> + *
>> + * Look for a static index coming from the "rproc" DT alias
>> + * (e.g. "rproc0"). If none is found, start allocating
>> + * dynamic IDs after the highest alias in use.
>> + *
>> + * Return: a non-negative index on success, or a negative error code 
>> on failure.
>> + */
>> +static int rproc_get_index(struct device *dev)
>> +{
>> +    int index;
>> +
>> +    /* No DT to deal with */
>> +    if (!dev->of_node)
>> +        goto legacy;
>> +
>> +    /* See if an alias has been assigned to this remoteproc */
>> +    index = of_alias_get_id(dev->of_node, RPROC_ALIAS);
>> +    if (index >= 0)
>> +        return ida_alloc_range(&rproc_dev_index, index, index,
>> +                       GFP_KERNEL);
>> +    /*
>> +     * No alias has been assigned to this remoteproc device. See if any
>> +     * "rproc" aliases have been assigned and start allocating after
>> +     * the highest one if it is the case.
>> +     */
>> +    index = of_alias_get_highest_id(RPROC_ALIAS);
>> +    if (index >= 0)
>> +        return ida_alloc_range(&rproc_dev_index, index + 1, ~0,
>> +                       GFP_KERNEL);
>> +
>> +legacy:
>> +    return ida_alloc(&rproc_dev_index, GFP_KERNEL);
>> +}
>> +
>>   /**
>>    * rproc_alloc() - allocate a remote processor handle
>>    * @dev: the underlying device
>> @@ -2481,8 +2518,7 @@ struct rproc *rproc_alloc(struct device *dev, 
>> const char *name,
>>       rproc->dev.driver_data = rproc;
>>       idr_init(&rproc->notifyids);
>> -    /* Assign a unique device index and name */
>> -    rproc->index = ida_alloc(&rproc_dev_index, GFP_KERNEL);
>> +    rproc->index = rproc_get_index(dev);
>>       if (rproc->index < 0) {
>>           dev_err(dev, "ida_alloc failed: %d\n", rproc->index);
>>           goto put_device;
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index b4795698d8c2..3feb2456ecc4 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -503,6 +503,9 @@ enum rproc_features {
>>       RPROC_MAX_FEATURES,
>>   };
>> + /* device tree remoteproc Alias stem */
>> + #define RPROC_ALIAS "rproc"
>> +
>>   /**
>>    * struct rproc - represents a physical remote processor device
>>    * @node: list node of this rproc object
> 

