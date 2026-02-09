Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011012.outbound.protection.outlook.com [52.101.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1742833B6F8;
	Mon,  9 Feb 2026 09:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770630677; cv=fail; b=jTEtWddC47cnGgn2eyLiaNqr7jkfPm01nyTCMO79oP+wA9nNcRXAUO+DuLVvbonKy2pK9vjqt/Cl6QSvdncn7wQMuaMeac2QVIitvk+4AUyxH1U4TIYPnxN+IDZ4zc8DEtHv3oUHqdsJku+3a82pk1jmx3BjJfWHVmSvq1vq9Mc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770630677; c=relaxed/simple;
	bh=ba+eMi1k3P0uNqZYcAlqYktRswHfK/eMxNIGvUg2T3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JqnWyQX/HUPG+ODCoSHDYwsWofQS8u8gxzVDgwQDjv1spY6EXsLEjxWAibl+QObLxYxixCR0zlPFkyyNhVOL1aWuXUiy8btmrKWRLxwlxGVmJaplfqBjyoyVP3MVqehFPK2K5u/T8eo7NiOgD+5OzdVY5nORnrrwhkZvM4AR1g4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=GDjV45TB; arc=fail smtp.client-ip=52.101.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="GDjV45TB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ir2csE89TFmq1UvqOUleItHS4QDKEmIZAqg4IfiyJBlBWpqlOB3a5uWWjcF65tKByZaB9/qvGC8j2Wa98QVAUcMMGvIeDOvq5VVdZGhIODtLeWb4iRwZUlW07PDurph9gyzkUn4Zjxd89qYIarT9NnssDBi3EZoJYzNwURZoWrMAVtz5Oz7tB6wobSPOkedx+hjUSTltMbesbjemE/eVfUUcLRfxyArvbzR1O75ddIefpt0L97rPRRRFq2UNaHd3fcwUNk8gBUTV+E8BmfCiARLOtqa/rpTawiehqKLYxG6WprtKgsRIwAe8/miDtm/8+mQbJNPrcbx1DnTxKvCMgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mudINonzp1eCXVwUPChBb7YXOZvuoIe8YvmOVFwdu7A=;
 b=OOalrrOXk7GROB2FzU6z5fKIUViTS8iFBshKXDMmbW/OVotTjlM6hkWEj+4DMa4Vrkcelc7cK1/6YqgbShIDL6oY4O7NFv23aomyui8HMNACKyss5bljX0gyKPEn21msGuuuSDfrIxwTGg3Fhs/26AM46um542j2m9QcQUJ0HPvU9sNLRpeiAvaRBcgGjBMbg+pAp7Tn+YXp32Ebs6yjujLYOU7N2D7YvFBMtXcvEMkG0yjRMjHuaDWUmtExhMxpAP0alL7mOwiD4pDvOHTxQeM1+SxPEB7oZNEM9Y9k+cVZPCMs2Ymvg5n4D7kOd+A6kSGtOMayBWD6K1zRa8yM2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=ti.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mudINonzp1eCXVwUPChBb7YXOZvuoIe8YvmOVFwdu7A=;
 b=GDjV45TBek76VZGwRpq43XT/3Y5IiDsX1gpkA9HdrUhmJRAhfJCYLg0yjecygH8tB3y2Uwt0BLp8mGUr3t5iiWcChqXZ8NRrnsMzB26mzXH09OloXOrYfPZoRqYdgeeHKJOJq54VqRzrPtxgxVL3IB6wh5yEbHzjRYLthkJi4Hn5s6zXeU0+oNGCYNYy5L1M4B96oC+z9E2I5OWWMJFWWxTWfDy+BrM7qtgS+SLUrGaq2X6lGgK5syFIXEaB90uS04pDH6OgEWdms/Zt/QHeMkUX3XYPSzlCrRyXLv2KwsANB1+4+dINjemS5rRldGeBlKzK2QU1rd0lyrUxYBAljQ==
Received: from DUZPR01CA0176.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::12) by DB9PR10MB6665.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:3d3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Mon, 9 Feb
 2026 09:51:10 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::2c) by DUZPR01CA0176.outlook.office365.com
 (2603:10a6:10:4b3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 09:51:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 09:51:09 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 10:52:59 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 10:51:08 +0100
Message-ID: <25df6720-da97-4f81-9124-bdb7e9542d56@foss.st.com>
Date: Mon, 9 Feb 2026 10:51:07 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] remoteproc: core: support fixed device index from
 DT aliases
To: Andrew Davis <afd@ti.com>, Bjorn Andersson <andersson@kernel.org>,
	"Mathieu Poirier" <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
References: <20260204105216.3929071-1-arnaud.pouliquen@foss.st.com>
 <20260204105216.3929071-2-arnaud.pouliquen@foss.st.com>
 <4a4e50f4-9e02-4ca2-8b3f-b01caa7df35e@ti.com>
 <1a175145-d29f-426a-a163-1d185b8b0348@foss.st.com>
 <b9b478ea-cec7-4b5b-8ae9-d0574c4eb02a@ti.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <b9b478ea-cec7-4b5b-8ae9-d0574c4eb02a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E4:EE_|DB9PR10MB6665:EE_
X-MS-Office365-Filtering-Correlation-Id: ed237a67-ade2-4aad-b2c2-08de67c0c0b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cU95ZFUwYjd1elpvNjBXU202aU52Nmp3Y2I3UkhFVlJYU1ZuS3JSck42VTVQ?=
 =?utf-8?B?S0d5ZUpVVmptSjJEa1BWUUdtcEFEK3NGb2FubUQ1cElJWkt6K2g4bjhpTk4w?=
 =?utf-8?B?K1lJb2lwYU85VmE0dTVVdmxWcnk2cHFzb3IwSFlRcTVaVmFuYXNYenVRaHly?=
 =?utf-8?B?MFYrWkV5M2c5V0FCSGZDMEFCVkNMNXJ3R0Fhc1pTZFM2NUVUUWNadVQvZzJw?=
 =?utf-8?B?SkhlcWhMZU9VQjJYeFNKaElYSUhVNklIRWhRWTRhd2lTTDNEY0ticVhrVkpq?=
 =?utf-8?B?SktNbm5WQnd0NkYrSFJ1S0hIb0U4YXJwQ0luSDlpbmdpTmdkZ0VEdm9HcFhO?=
 =?utf-8?B?V1ZOUGl4V1I3V2gzay82eXlLRjVqdFp2N0todTV1Qkw1QWF3VGsxOVkrRUlL?=
 =?utf-8?B?MjErTm5Hck4rTkJSSGg3WFpQUWJJU2FGREJYa1hyY2xGblFlMXhNcTRqWXJa?=
 =?utf-8?B?L0VrbmRnVUJOWHVHZDhNR1BnS0pGL0YrWjJkRzc0RHNoTkQxRWxrcWE5dE5Z?=
 =?utf-8?B?WHFtekIxK2U4eFRZNFFjM3QyS3J3K05vbnQzWGVMamEzMGZVZkNoUFhZUlN0?=
 =?utf-8?B?U3F4OXdVYmpVeW90Tm1oMHlvSUM1MW92cUpxc1ducW02RWZLMG9HRE04bkl5?=
 =?utf-8?B?NFNoWE13R3BkSEVPMHdmbk5KczhGNWZWUUhyQldhYjZzTkY2eHRCU01vLzNJ?=
 =?utf-8?B?VUZGRDV4RlcvUmRlRTdLbGJUWFdScnV5RU52ZDBqNjlta2o0U2dSVXVTRmdI?=
 =?utf-8?B?N3ZQSmkxd3BhaFBTbmFFN2duMzMzeFFpeEZreUJCNkIvUHMyNjZ3K2RZdG80?=
 =?utf-8?B?RGZpRTMxM09pWFpMaG9PN0o4Q1llT1ZTbFlNakJwOXRYNGc2S3JRMFpXMWd1?=
 =?utf-8?B?eWdkc3JsaTE1cXRUMk94ZVR1UGNyNEdza2RCR1dSS1Y2amtYR2k5anNJbWhW?=
 =?utf-8?B?R2ROMXRULzFhazFCTTYyaE8xSjZOb3oxZmFveVRLQ1lKZXR6a2IzNWtIZUdD?=
 =?utf-8?B?aVEwZTNFWEtocHFveHkyc3ljTFpuS2RGVTFzQ0lpZkdHVFVjQUZ4Q29HbmNq?=
 =?utf-8?B?Y09nU1Q0R1Jqa3Bqb1UyMFVTUlhFcTRybzZwKzM4NytkWnlpZ1NtUkhIdk9C?=
 =?utf-8?B?S3IzY1ZMdGJOWFc5Y3AvWGtoZDFuUnFiaThrL25mWElpOTZzTVJUb0JFUjcx?=
 =?utf-8?B?Q2YvcW9JeGp1ZGVvZWxIRmFUVEUxby9UTGFsUHQxOFZXTkRFQ251bURHY2Qy?=
 =?utf-8?B?VjV5WUV6WEhqRFA5eHFZWjJad0pxclNSVW5rNStGMTdzRWoyQk9UM0dMVlk3?=
 =?utf-8?B?cERzaHJmbXJ6NTJzMUI2Z1h5ZUlDZVFxYzdCT3RTWUF6NDYveVN5RG5GaEpi?=
 =?utf-8?B?Z0ZXbDdveENYVjVoTVNodVZVU1pva2NtNmVtMWlOQnBpbjBzVDEyb25yOFhQ?=
 =?utf-8?B?amcraVE0NWN5WmR0bFp6ckZkT1lDZzZlZ3pTWmlkeXA5ZDdKdEIydkZmUmhX?=
 =?utf-8?B?RzNQcVkrRE9BRmpRUzd1emhLUDlZWE9QOVhXRXZ5Wkg4MnlvY0txSjdldXRn?=
 =?utf-8?B?ZU1EYVZWUUNRZ2lxSWR3MzcxRTlpNGMxVE5LRFE0MFZLNVBJUDRVdE1YMGJF?=
 =?utf-8?B?bitIc2d2OEkvVjhlWnRIVnhlZEl3SVdHN2drM2FGSDcyU0ZIUXM2N2x0MkRO?=
 =?utf-8?B?c3ZRRk9FZXZtMytVSGJEZEhVeHhkc1NldjhnbEFOUlk1Z3NtZzlEQmZ6Z2l2?=
 =?utf-8?B?NWxad3haa1lWTnZacll1Y1JaSUsxMUVacWdZaDJDTEJtTXBIQ1Blek41dWtF?=
 =?utf-8?B?V2dmd0E2WmloL040ZHlOUkpESWF5dWFDRWtRT3Q2QmZUODhmWmVzb3JZNFpG?=
 =?utf-8?B?a0lQc3hSNVAyd00zUzNsNm52VVBNb0ZwMnZzMnR5UGxRc2dhdGlTaXBGSHAy?=
 =?utf-8?B?T1ZubW9DekRQNWFoSzBmaDdIWEZYZGt5QXY3ZzRQV1lJTUEwVWZaakRkNEVB?=
 =?utf-8?B?eEJ6WTBqcEtKeExrd3QxaHlpOUJKMklLVkQ3UENKdTA3QkRPNEpxVUMrTC83?=
 =?utf-8?B?d1RPaEhWcE04T1djTVhXazRNYWpvcjhhcmNYUEFFMmVpWW1Ia0lDaldBUXdr?=
 =?utf-8?B?azdvLy9va1B4eTZ0M3ZNRlJpN3VKcEpzb0NlVHJIM2Mxa0o2elVKVHhmR2Nr?=
 =?utf-8?B?RnkxSWpibE5nYlZYMk82ZmhOUERsNTNVUkpVR2o2d3hGRWhxTWY0dzdJSk5N?=
 =?utf-8?B?VGFERnRXWTBwQUZYNWRndzB1ZXd3PT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mTOGKraCQUVi6g9dib2AaYgrw+xDG76eVSf/fzk2EtAJBolyGlwA309Ys/29AG6iXKXIUUJuRQUvl1wGB0L74MXdxyCJYcxJDe6DHpfC7eDgR1N19z/+rZKF0zV2c8WvJEiWEWgyiNRi1uO5dqmwzcNHdABRhXgv6bjzvl2lpCIlyHxVawemMFUUjnIlSV7UG4KKVKkNz/y9XHW++fsglLfj7QcTR10dCBH7NYUQ3JIGCMHAeXiq77DhZ32BWVBJKgO5L/ZJBTW00Ic8bGWCCjtdQ/b2+NRBR9uT06PpfTvgBXcBJzCkkqFlz/7w1HnyqbIUJw7y/P2nOvfe/TQyHbuQIXgZmbzB6AmA7V1Y1tXTXRNpQGMcKxsEVEuUTcGIvHKoAWeQM+xUhUZvu6z5psHls3scPzkwlnI5M6b5fsXSFpfy+h8X0+x6W70ma0CT
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 09:51:09.6646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed237a67-ade2-4aad-b2c2-08de67c0c0b5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6665



On 2/5/26 21:07, Andrew Davis wrote:
> On 2/5/26 11:58 AM, Arnaud POULIQUEN wrote:
>> Hello,
>>
>> On 2/4/26 15:57, Andrew Davis wrote:
>>> On 2/4/26 4:52 AM, Arnaud Pouliquen wrote:
>>>> On systems with multiple remote processors, the remoteproc device
>>>> enumeration is not stable as it depends on the probe ordering.
>>>> As a result, the /sys/class/remoteproc/remoteproc<x> entries do not
>>>> always refer to the same remote processor instance, which complicates
>>>> userspace applications.
>>>>
>>>
>>> While I will agree it is slightly more complicated in userspace to 
>>> lookup
>>> the device by name string rather than by some static number, there 
>>> seems to
>>> be a good reason for not doing this also.
>>>
>>> Much like network interfaces where the /dev/eth<x> can change each 
>>> boot and
>>> attempts to make that static from kernel has been turned down: having 
>>> static
>>> indexes doesn't make userspace software any more portable.
>>>
>>> Say you lock your M33 core to rproc<1> on one SoC, it doesn't mean 
>>> your next
>>> SoC will have the same rproc order, or even have a M33 at all. So you 
>>> still
>>> need your userspace code to lookup and check the name, otherwise you 
>>> make
>>> bad assumptions. Not having static IDs forces software to do the correct
>>> thing here.
>>
>> That was also my initial approach, but it is difficult to impose on 
>> our customers who have legacy applications, especially since they are 
>> accustomed to using fixed indexes with other framework ABIs.
>>
>>>
>>> The only valid reason I can think up is maybe this makes board specific
>>> documentation easier. One can say:
>>>
>>> "On the STM32MP257F-DK, check that the M33 has booted by running
>>> `cat /sys/class/remoteproc/remoteproc3/status`"
>>>
>>> without having to first find the right number by checking each
>>> `remoteproc<x>/name`. But wouldn't adding something like a named
>>> sysfs dir syslinks work even better?
>>>
>>> `cat /sys/class/remoteproc/m33@76000000/status`
>>
>> The only benefit I can see in checking /sys/class/remoteproc/<name>/ 
>> status instead of /sys/class/remoteproc/remoteproc<x>/name is to avoid 
>> iterating over devices by name. However, in both cases, the 
>> application still needs to know the remote processor name, which is 
>> platform-dependent and usually defined by the device tree.
>>
>> At the end, using an index here is simply an optional alternative to 
>> the name, as seen in other framework implementations.
>>
> 
> Yes, both name and number based indexing will be platform-dependent, but
> they are not purely equivalent. The thing I want to avoid about number 
> based
> lookup is in documentation. I see docs already that say something like
> 
>> To start the R5F core run this command:
>> echo start > /sys/class/remoteproc/remoteproc2/state
> 
> And folks (or LLMs being trained on the docs) might assume this is in
> any way a portable thing to do. Which we know it is not, the number might
> change even between two platforms from the same vendor. Where as if the
> instructions said:
> 
>> echo start > /sys/class/remoteproc/78000000.r5f/state


For the time being, this approach does not align with other /sys/class/
declarations, which are index-based. You would also need to duplicate the
remoteproc device for legacy support (e.g., 
/sys/class/remoteproc/remoteproc0
and /sys/class/remoteproc/78000000.r5f).

However, if you want to promote this approach, feel free to propose a patch
series. From my perspective, the index mechanism combined with DT aliases
seems like a better compromise.

> 
> It becomes immediately obvious this is valid only for a given platform.
> 
> The other thing I want to avoid is the ever-growing alias lists in DT.

For my understanding, is this only your expectation, or is it a general 
direction recommended by the Linux maintainers?

> Could be done without having to add a list of aliases to every DT. Is
> there no other heuristic that we could use to produce an static ordering?

Other alternatives I can see are:
- use of the reg property: whould break legacy.
- add a new proc node property: would do the same than the
   existing alias.

Regards,
Arnaud

> 
> Andrew
> 
>> Regards,
>> Arnaud
>>
>>>
>>> (and yes I know someone here at TI did this alias naming for our
>>> keystone platforms, but if not for possible backwards compat breaks
>>> I'd love to remove that one also)
>>>
>>> Andrew
>>>
>>>> Inspired by the SPI implementation, this commit allows board-specific
>>>> numbering to be defined in device tree while still supporting 
>>>> dynamically
>>>> registered remote processors.
>>>>
>>>> For instance, on STM32MP25 Soc this can be used by defining:
>>>>
>>>>      aliases {
>>>>          rproc0 = &m33_rproc;
>>>>          rproc1 = &m0_rproc;
>>>>      };
>>>>
>>>> When a "rproc<x>" DT alias is present, use it to assign a fixed
>>>> "/sys/class/remoteproc/remoteproc<x>" entry.
>>>> If no remoteproc alias is defined, keep the legacy index allocation.
>>>> If only some remoteproc instances have an alias, allocate dynamic
>>>> index starting after the highest alias index declared.
>>>>
>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>> Tested-by: Peng Fan <peng.fan@nxp.com>
>>>> ---
>>>> V3:
>>>> - fix double space typo
>>>> - add Peng Fan's Tested-by
>>>>
>>>> V2:
>>>> - Introduces rproc_get_index based on Mathieu Poirier's suggestion.
>>>>    An update compared to Mathieu's version is that the call to
>>>>    ida_alloc_range is retained if an alias is found for the remote 
>>>> device,
>>>>    to balance with ida_free().
>>>> - Rename DT alias stem from "remoteproc" to "rproc" to be consistent 
>>>> with
>>>>    keytone driver.
>>>> ---
>>>>   drivers/remoteproc/remoteproc_core.c | 40 ++++++++++++++++++++++++ 
>>>> ++--
>>>>   include/linux/remoteproc.h           |  3 +++
>>>>   2 files changed, 41 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/ 
>>>> remoteproc/remoteproc_core.c
>>>> index aada2780b343..4a02814c5d04 100644
>>>> --- a/drivers/remoteproc/remoteproc_core.c
>>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>>> @@ -2433,6 +2433,43 @@ static int rproc_alloc_ops(struct rproc 
>>>> *rproc, const struct rproc_ops *ops)
>>>>       return 0;
>>>>   }
>>>> +/**
>>>> + * rproc_get_index - assign a unique device index for a remote 
>>>> processor
>>>> + * @dev: device associated with the remote processor
>>>> + *
>>>> + * Look for a static index coming from the "rproc" DT alias
>>>> + * (e.g. "rproc0"). If none is found, start allocating
>>>> + * dynamic IDs after the highest alias in use.
>>>> + *
>>>> + * Return: a non-negative index on success, or a negative error 
>>>> code on failure.
>>>> + */
>>>> +static int rproc_get_index(struct device *dev)
>>>> +{
>>>> +    int index;
>>>> +
>>>> +    /* No DT to deal with */
>>>> +    if (!dev->of_node)
>>>> +        goto legacy;
>>>> +
>>>> +    /* See if an alias has been assigned to this remoteproc */
>>>> +    index = of_alias_get_id(dev->of_node, RPROC_ALIAS);
>>>> +    if (index >= 0)
>>>> +        return ida_alloc_range(&rproc_dev_index, index, index,
>>>> +                       GFP_KERNEL);
>>>> +    /*
>>>> +     * No alias has been assigned to this remoteproc device. See if 
>>>> any
>>>> +     * "rproc" aliases have been assigned and start allocating after
>>>> +     * the highest one if it is the case.
>>>> +     */
>>>> +    index = of_alias_get_highest_id(RPROC_ALIAS);
>>>> +    if (index >= 0)
>>>> +        return ida_alloc_range(&rproc_dev_index, index + 1, ~0,
>>>> +                       GFP_KERNEL);
>>>> +
>>>> +legacy:
>>>> +    return ida_alloc(&rproc_dev_index, GFP_KERNEL);
>>>> +}
>>>> +
>>>>   /**
>>>>    * rproc_alloc() - allocate a remote processor handle
>>>>    * @dev: the underlying device
>>>> @@ -2481,8 +2518,7 @@ struct rproc *rproc_alloc(struct device *dev, 
>>>> const char *name,
>>>>       rproc->dev.driver_data = rproc;
>>>>       idr_init(&rproc->notifyids);
>>>> -    /* Assign a unique device index and name */
>>>> -    rproc->index = ida_alloc(&rproc_dev_index, GFP_KERNEL);
>>>> +    rproc->index = rproc_get_index(dev);
>>>>       if (rproc->index < 0) {
>>>>           dev_err(dev, "ida_alloc failed: %d\n", rproc->index);
>>>>           goto put_device;
>>>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>>>> index b4795698d8c2..3feb2456ecc4 100644
>>>> --- a/include/linux/remoteproc.h
>>>> +++ b/include/linux/remoteproc.h
>>>> @@ -503,6 +503,9 @@ enum rproc_features {
>>>>       RPROC_MAX_FEATURES,
>>>>   };
>>>> + /* device tree remoteproc Alias stem */
>>>> + #define RPROC_ALIAS "rproc"
>>>> +
>>>>   /**
>>>>    * struct rproc - represents a physical remote processor device
>>>>    * @node: list node of this rproc object
>>>
>>
> 

