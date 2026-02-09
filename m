Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011008.outbound.protection.outlook.com [40.107.130.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B392FE07D;
	Mon,  9 Feb 2026 18:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770661694; cv=fail; b=RQI6AJWt54KppKA/jmquuUqmzDFkB06HG6QXomJm7M7FQaUJFrotiC97wLbJBD4B3YFcfuP9/3yvBmzaJmwKlIRnQtDSbnXjJWH8UpfgGojmx3zsLBwu4ZZEMSpw4jcJuWwjrD8/euI7lOX+79UVldgN2A9vmh4iwyRNYTb+YZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770661694; c=relaxed/simple;
	bh=W9StN5IWg5hRkl5Codzb96NpESTDwm10RH7/Uyn0bLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NEf5Pnd/lxokVFQj31mo1dasKitkUDDG42rv8fWEQBWPEoJ6IzXbGuuJjM8PEAEwo+GQIfNnPHkJAuA/GDRiPpw0ZQQ9jqTrRxaRO9IB0Q0SY1rPy14nuDCyfJ+KxK+djr9FWl+XsG9gawQo4/waTw6IfYXhKTvYZg3NH6jQAYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=gi1zEAhM; arc=fail smtp.client-ip=40.107.130.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="gi1zEAhM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lh85Ewx22aBl6DhuytzJm9V7y50AX4DyCR3IGOnJA5tgN54PWgLquUHW+GsUmhxXRKpiRZkFT078N26DuY8pbxmiJ/1AMhGjOtviQwsqjP8aeoeYrrCXyW/RsLkCsHKwRFrtHxEa69u1/T/3tkXp5RTM3L5tIZ/SeEnu3VAH+DO8+UEWX7MM3TsS+x7uEDjuDKqvEVfvLPtqmtOc5co3980PM4c0OxTMz+5ypNwdnIhouDiJpFowWw2n64sdrLiOFcrkM5qeV2O3jXa8QxOSg515QF+k/XonUolxnA1aqPbSdV51G29UuR+eO3VBtE4aBBuKfWKKxqghUvRSPL6yCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mjo27vN7cBFgD/2OAPatQamLLaF1lARvpPFQNmi9fk=;
 b=ySkCdt+3wFTtPoEsKSMwPicw+VmOf+3jnvkIbb1xzyADTVYTxHi0HNneyJBNAT6oci0umqmjr+lbxQhx2vXOKr8IcT5fneSU7JezARE457pcW+baA+Y2Ql7rQwuKN9mYeagt9IbIhAJ0Q1mesVEezz4U0f7yygP6kCkjYxNCwx+x+WowNnA4MR4jLLHdQQ45ZVz8GCnohFcuuOPyL9zZCQq3dgnTZ1x6+gRR3imDwWE3zUOIZ7KKysfkvshRFOC1/oBY3FoAE6UrPrAsBAvacGQ31NDuCk2jVsR5iTdXUba3gfogbfC4oLMS9ZP1nswMKcLs3gngINbGinf+Pwf2IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mjo27vN7cBFgD/2OAPatQamLLaF1lARvpPFQNmi9fk=;
 b=gi1zEAhMRPri4B+re3TWrTxW34jUTSjvqV3q36/YY7ya9jy+7zyDwtMw1U5dNtTm39vnlMUPzxEosK/b+bxFt5/HyfMqe/cdqZwOaGFgdQ+e5R52iG7BhzKlLtOzXxv2xB5Ubzm3wfJ/bes62W03FxG/Ba/iXQKsJHSCg5NsDTZfcIFQ7O5NCU1H7xf8ThZQhKdLdI+hLa3B0ny3GVB72elsWfy09OargDwa2oyVh5zp5L4STl5aBUfHBEqgWi7lA3KN15sjO7ONp8RTsyTTfL9E+mVuyrWiUOMhoNYEcKphuAotZgSDTY/UPJahsvGmPX/CdmzBjDZG3RUBNMWotQ==
Received: from CWLP123CA0013.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:56::25)
 by AM9PR10MB4101.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 18:28:09 +0000
Received: from AM1PEPF000252DF.eurprd07.prod.outlook.com
 (2603:10a6:401:56:cafe::66) by CWLP123CA0013.outlook.office365.com
 (2603:10a6:401:56::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 18:28:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM1PEPF000252DF.mail.protection.outlook.com (10.167.16.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 18:28:08 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 19:29:43 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 19:28:01 +0100
Message-ID: <05d713dd-ec4b-4ec6-a1b7-4e6453133d8b@foss.st.com>
Date: Mon, 9 Feb 2026 19:28:00 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] remoteproc: core: support fixed device index from
 DT aliases
To: Bjorn Andersson <andersson@kernel.org>
CC: Andrew Davis <afd@ti.com>, Mathieu Poirier <mathieu.poirier@linaro.org>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
References: <20260204105216.3929071-1-arnaud.pouliquen@foss.st.com>
 <20260204105216.3929071-2-arnaud.pouliquen@foss.st.com>
 <4a4e50f4-9e02-4ca2-8b3f-b01caa7df35e@ti.com>
 <1a175145-d29f-426a-a163-1d185b8b0348@foss.st.com>
 <b9b478ea-cec7-4b5b-8ae9-d0574c4eb02a@ti.com>
 <25df6720-da97-4f81-9124-bdb7e9542d56@foss.st.com>
 <a62kzllm4dgqavg47utvhb6m7oswcgenvq5nhw7tutyrs436lr@vtilvllrxkfb>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <a62kzllm4dgqavg47utvhb6m7oswcgenvq5nhw7tutyrs436lr@vtilvllrxkfb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DF:EE_|AM9PR10MB4101:EE_
X-MS-Office365-Filtering-Correlation-Id: 97148f05-5971-4fab-8440-08de6808f970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODJ3VTAwRmpPOGIyemZNak5aZEx6bWx0YmJVbWM1cGRBaWdBdDBhWnNnSmVD?=
 =?utf-8?B?dGxqQmQ1eTg3YmxqaXJTeks2Wms2QVVTWFIvY3FvQ2pJcXBweUdWUmswMFFl?=
 =?utf-8?B?NmkwRm92ZElqa2gySDJBam9IbjMzcjYyd202Q004MmpLSDZwVGpwQ2dFV00w?=
 =?utf-8?B?NE5LN1cxa1RnN2FFMDBhM2J0eFFzZHZBVU1rNHBCWHA4MHdDNUt1R1NNZHR4?=
 =?utf-8?B?MSs2UlIyajFNdHMyaGZnRTJvVG1HVUI5Nm9vbHhjMjJDbXdxNlZ6ZzIzVlNs?=
 =?utf-8?B?S3VSTjV5QlR6ckpxSXNmR1YrZ2FISGNyZGhleGRjaVlvL3p0ZmV2S1R4azVR?=
 =?utf-8?B?WkY5Q0ZKaU9LaWxicGtqdjZjZEZGTDY3Y2xhRk9JeG0xYjRFMTdoVXlXR2Q2?=
 =?utf-8?B?QVE1YzA3cHFsa2lVamsvL0NVRmNxWEVhRS8vMTZ2ZE9iTk1ZVjRMU245MVRR?=
 =?utf-8?B?VHVRSjhXYUhQM1ZWYU0xWGZuVjRWZ0tjcHp4eDM2dVdhV2J1VFIwTjg2Y0lo?=
 =?utf-8?B?NnRQK3o2M0Q1QzEyYloxSmhVOEV6Y1BxWThyN1M4d2xMYUx4d2tiYmk3Mkti?=
 =?utf-8?B?OXJrTWYyaEdXSjJaQm9OYWtqQXk0N1hlRUxUOVA5ZnRYSXNLOUp5UUF0Q1ov?=
 =?utf-8?B?Vm4zRHIrTCtjZ0FpcGZnc09MV3NLSk5oblI1TWtBekk1SjVWZWk5Y0ZEY3F3?=
 =?utf-8?B?allVOGp5Mm5JOXBXTUFwaEtLSFdKTlU5ZTJpSHU1TDlRWWdwUzBYbWNsSHJ3?=
 =?utf-8?B?VzI3Ry9JUzRPdG9PanBjdTJNNmxIaWVqWjRUVGs5VDcxN0QvRXAzUjdoZ1NF?=
 =?utf-8?B?cWMrbE1FYW1kLzRLQVE0TnlTcy8xOVI1WWY4L055L2hmZElVSHBVYkNOcUdZ?=
 =?utf-8?B?L2daMkpMNEtVUEQyeksxS0cvQnVkRjQ3Nng3czBXbXV5V3F6NmFxMWJIQXlZ?=
 =?utf-8?B?bVdXak1PNnN4VjdKRU9FYUI3Mjk2eUI1clJkZGtmS0MrbDNSRHcybVR0TEZW?=
 =?utf-8?B?V3UxSUFMMUg3bHZGeUlxRUtvOUt2c0dVR0pvWUU5RWF0RWZsTVRiQkxFV0lS?=
 =?utf-8?B?OHBjUGsyazhpdm95TlFGVDd0bWo0UUJmejZKbGxMYjNBZ2hIOTNVSG9MVjBl?=
 =?utf-8?B?RDU4VlY1UnhmckZMNlZhMjFDcU56M2VjYUNHNW5xZ08wNFJrK2U3ZHFreXVq?=
 =?utf-8?B?N09kbndPTndrTjEzNTFiUVZKNUZnUDhkWTVNaDdFR3V3a083bG9aakFUZ1A2?=
 =?utf-8?B?K3RTVWJEdkxvSHVNWDRYVUdUNWRPeW5VNHZRS0kxVHhZLzRyQjkwS2xtQTZS?=
 =?utf-8?B?eGNGODY1WHUvd0NtS2t5MWt1MG5xMFpMUi9KZnppa1lwMjNFNDdEd2xVWlBq?=
 =?utf-8?B?OFlCeE9JTlFhSUF1V2gzbDNpM2ZySFJ0Z1JVQ0U2ZWNTaG55TFkyM2pyZ2dj?=
 =?utf-8?B?cWN3YlMzanlQS2xLQi9IQ2t4aCtkcGtDNnJHMDdoVmRway9VaFJCdWJQeGlZ?=
 =?utf-8?B?N3ZxZlRERmNYcVdFT2JSazNEMVpSMFR1Vkt4NmZwYUdJOXdMNWZ0YTNqSVRM?=
 =?utf-8?B?WGF1TEx5WmNkR0p4Q3gzTW5maHJLb3ZWRytpeXVLb1RsdUtDME1kSG1YZ0gv?=
 =?utf-8?B?eTVXZHJOOEY1VXMwaVBNT0NiNFBsVWFFeUkvZGlNVjN0Q05DM2phNWpsOUVB?=
 =?utf-8?B?eDFxWXZNbVkxaTdxZXphUHIxS1ZYUkVuaGx6bXlnWDNnRll0YlFlMVRmNUZx?=
 =?utf-8?B?Mmk4ek9HNUh3djZvdkFhcng4TXpLVUJ5aVZrRHAxL043NkV6c2JRQ1JsVWVx?=
 =?utf-8?B?a0VkL3VHZkpjNEpqd3VtWCtTQlZaQ1pPckh3VjE2ME1vejhuR0dHemE0TS9o?=
 =?utf-8?B?eDBVTG1Ta0lMZHRWRzZrUzFBdStlbTdvd3hMK3hzQnp2WHJ4bzc4YUJHb3ZT?=
 =?utf-8?B?VG1uWXg3dzEzSm9ueXZ1eTVzMGVEcmJpRFZKWm5TTERiNkxTVXRNQjNBK3cz?=
 =?utf-8?B?UlZaZUlQVytqYW9XRlFWTnlpYTlFWngzWGM3b1NiSmtJdjV3THYwa3loUy9x?=
 =?utf-8?B?Y3VsVFRCN005bEFJZ1h3Wk9CWElHSlhpRTVMRnBIUEt6YzFmTFdWVjhGTnNQ?=
 =?utf-8?B?cGhFWDV6RlZHTHk3YnUvZ1B2UnRteGliRHFZZFdIUzNzQlZhTGZFY2NFSUZT?=
 =?utf-8?B?UFEvajMwVDRBNjE4UUVmbXVKbXFwbU43dGNHbHROekN4T0w3dUk5ZjUzNDZY?=
 =?utf-8?B?Q3ArZlpOT1RBUDNvYXcwczRubFFBPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sdT1xITQYFv+WkqNZaeqrLMBjF0DBTIx2wiEY3v4P5RvhkNoEwCMBRr/yOLBSpCQzeKgKMknDWquH0Ql7/Syt7tnNWReNinp/f0h2gWZCW4D8NB6IY4WNiC1n6DlmzVB+M1nDXAlFu2LhWAaOrHZCwdoEKZOUvDoqWdt+XO1KogtWW0PoZPaVJpnNzVGZSXmqHZLzkpJPvoRF7zR6wwpU+UnSrUHwEHccJKkkPRgDQQTJKRABIFaNfbX2e/iNCykDOpg9vEENqgEkMp+QOFStGLA02SyuMhRmKF5Syk8WttxQRFAqo+CXpjt/tSgzW6c+dqhO7UK+wSrf/KBLeUSPpW1gw6qLa+Apw49rC5eoctPayd55QFxi6gHFcUeltdmeilWj7q/R6xJwbdts9s9zmZB6jS5b1t86gUz29kpiays7L+V2DJNGaWIPWTsXN/3
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:28:08.6320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97148f05-5971-4fab-8440-08de6808f970
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4101

hello,

On 2/9/26 16:23, Bjorn Andersson wrote:
> On Mon, Feb 09, 2026 at 10:51:07AM +0100, Arnaud POULIQUEN wrote:
>> On 2/5/26 21:07, Andrew Davis wrote:
>>> On 2/5/26 11:58 AM, Arnaud POULIQUEN wrote:
>>>> On 2/4/26 15:57, Andrew Davis wrote:
>>>>> On 2/4/26 4:52 AM, Arnaud Pouliquen wrote:
> [..]
>>>
>>> It becomes immediately obvious this is valid only for a given platform.
>>>
>>> The other thing I want to avoid is the ever-growing alias lists in DT.
>>
>> For my understanding, is this only your expectation, or is it a general
>> direction recommended by the Linux maintainers?
>>
> 
> If I remember correctly I did stand by the idea of using aliases to get
> stable numbering in /sys/class/remoteproc when we spoke about it several
> years ago (6-7?). But remoteprocs are coming and going, and any
> information we would have encoded in those numbers would have been
> confusing.
> 
> A big problem is that your numbering scheme will not be consistent over
> time and as such prevent your customers from reusing the same userspace
> between different platforms.

Precisely by setting the alias in the DT on their board, they should be able
to reuse legacy application. The index provides an abstraction layer.

> 
> Another one is for the developer, who need to remember that on platform
> A the R5F is id 2, but on platform B it's id 3 - when they sit and write
> their echo commands.

They are already facing this issue because the remoteproc device name 
set in stm32_rproc_probe() is derived from the device tree (DT) node 
name. This may also be true for other platforms. Consequently, the 
application must know the name defined in the DT. If the DT name 
changes, userspace must be updated accordingly.

Alternatively, we would probably have to update the device name by 
handling it within the driver to break the dependency between the 
application and the DT. But it will also impact legacy applications.

> 
> Replying on properly maintained rproc->name handles both of these cases
> for you.
> 
>>> Could be done without having to add a list of aliases to every DT. Is
>>> there no other heuristic that we could use to produce an static ordering?
>>
>> Other alternatives I can see are:
>> - use of the reg property: whould break legacy.
> 
> That obviously wouldn't work if you remoteproc is a mmio device.
> 
>> - add a new proc node property: would do the same than the
>>    existing alias.
> 
> If we decide that a global id-scheme is the right way to go, then alias
> is the mechanism to express that. There's no reason to hack around it...

Should we consider this as a solution or just an optional alternative? 
I’m quite confused as to why we cannot propose this mechanism and allow 
userspace to decide which approach to use.

> 
> But I don't think it is the right solution. How about providing our
> users a reference snippet, licensed as public domain, that just resolves
> a remoteproc by the name property?


If this series is not accepted, we plan to implement it downstream to 
facilitate legacy application porting between our STM32MP1 and STM32MP2 
series, with ST documentation to explain both alternatives.

Thanks and regards,
Arnaud

> 
> Regards,
> Bjorn

