Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010032.outbound.protection.outlook.com [52.101.46.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC7723D7EF;
	Mon, 29 Sep 2025 19:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759173979; cv=fail; b=r6RdlFWvlRAjS6QbGSVSpYSZHraezwgbJAz4sCKsPFNtstqkChe40HcjPx/JFuyVDueYKpDC5Ywe7h2WNV/nI22gLBK6LLQ/Gd+dVvdfZzoZ0uEhYwbpRr4wOedpNcK8wT3gMB9WVNTapoaAxf3LpScaAM/my/ZLelIjw7nvwuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759173979; c=relaxed/simple;
	bh=2b0FESeT0qod7MY+4TXUW9UGgec+50md6lCoNP9D5io=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uQXSJiD/raSaU7NrW4a77a6RbIbfoJIhHOacXfJE27XS9MkaGaEGsVZedXoTFSOFQz1+p/mVdNBKWixBTkU4o2RaZvaKugb3q6uj6fr4j7/ejs968wEWFbWgFZxEpRUJeeUvw9kglKsKbHq1uxi4NncADgDAdqrguExqGHRav88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Nf04VHCB; arc=fail smtp.client-ip=52.101.46.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Nf04VHCB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iAb2h/1+Bh5eTXL4zBMFJlEzGm4yibJLm4iOSikFf86z7/SW9Xhi/46FvxMIxSaIA+S2GgAGiYtwfZ1K40XT0ndOSYXsGGrtln7jthbHcFG7Xe6wb+fpf9b1/WepYdhOjyCxPceZ6aqxUD3Ug6J77b96IQkXSsn/2fzTShec9T0a7nQ43AVuKKTlx0wUpG8InzcJRt52lm5M7dZARpexlhv76KbTpsMS8nE/jTZ6XMCTD2jDAFU4/nm3RuT71H8RjAAKK8ua/1eI4e2HNkeBaZ5oNrn2R6kKg2/aPPn0OpK0056D3wB4RbaggI/axYXnz1oFcGz/Fu8s7sOOxZAtvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avWU4nmP4P2VqO6DPexPl6ymwfT0DRWSYxdCWpT+qdo=;
 b=mxMTXjSPhx+dUimADI6fh5WMg9Xep1kkYz8/9RuuMglyuJsdH+9QzsCS9HKurZmCNO3WoviVl/u+ZNHgQlQdwqDFUgdoIeDPQXZ5DR8Y3uE5xlTNG/LTdm/aFtAf4+rLoYSxwM3nvwRG5lWIU8VxMGdlCvI/qyLBvc4182j8ffWB7b/PjnEi47fGsawtCrqKeCmUvNa+FYNtY5fU8J+frN0Hn6NjZDVAphrk1Ox57sBXPx/x+HC0hzmne3RuT3bDVmnZXvePSGgl2kcEVsfuZIf7PHTNZup5FdJ0zob39ToT/ljkJm3iml/Bk5uudyGNfc/Is8mQ/Un4S+WSTFfXlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avWU4nmP4P2VqO6DPexPl6ymwfT0DRWSYxdCWpT+qdo=;
 b=Nf04VHCBT1tkh/HSLSfFwSwWRTrfCTfxT0Vst0/YOeZOKd0+Bx4gmdxw2IeIT1yZS480wVjz/XSMjY/bZie0gmgRNghUyIBChfBkkXYP98mjuZo6dr6XYXgIUCeDfXFikTylU50188SPNaDPcKgXke7r14L9fVceoFSv+GtP5LY=
Received: from PH7P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::9)
 by CY8PR12MB7706.namprd12.prod.outlook.com (2603:10b6:930:85::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 19:26:15 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:510:33a:cafe::7a) by PH7P222CA0010.outlook.office365.com
 (2603:10b6:510:33a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Mon,
 29 Sep 2025 19:26:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Mon, 29 Sep 2025 19:26:14 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 29 Sep
 2025 12:26:03 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 29 Sep
 2025 12:26:02 -0700
Received: from [172.31.8.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 29 Sep 2025 12:26:02 -0700
Message-ID: <8cb065f6-eee3-49f4-b657-1f4c74f1b324@amd.com>
Date: Mon, 29 Sep 2025 14:26:01 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] mailbox: check mailbox queue is full or not
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Peng Fan
	<peng.fan@oss.nxp.com>
CC: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20250925185043.3013388-1-tanmay.shah@amd.com>
 <20250926073735.GD8204@nxa18884-linux.ap.freescale.net>
 <e93f0ee7-687a-4f47-a847-90cc1ea87290@amd.com>
 <20250928075641.GA29690@nxa18884-linux.ap.freescale.net>
 <aNqbc5Q_tVStXkhI@p14s>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <aNqbc5Q_tVStXkhI@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|CY8PR12MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: 767e9faa-efe4-4432-4ba2-08ddff8e0e1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDFWV1VyQ0ROcFl5d3o4eE0wODNTY3piZEZJQUFvOEhkMVNTbGJIdTduRUtL?=
 =?utf-8?B?MGJKNkh5UUFWcGkvN2tFRTUyRGNmQzAvQlA0V0NML0J5VEhEUFRqN1ljUllE?=
 =?utf-8?B?MmFQZmxIZmVvSkRrUmd5ai9yTjc4ZkVsdXF6RnUybXJFZXJmV01JSlJPMUdN?=
 =?utf-8?B?eGZNM3hoZ2JlV3lVRnBMTjFER2NmMDhGOHpqWGNhV3hBOFJQa2E5NlVFZ0lp?=
 =?utf-8?B?anp1dE5OVU1iNmdMV3NGa1R5RDU4MFhYWEFNKzg0MENLalR3dzJEby8zSGw3?=
 =?utf-8?B?dE9OT3grckVRVjAzYXIxZC9aSEUrUElNTElOdGxTWkNyOU1rTW9IK0tXdkRG?=
 =?utf-8?B?NzBCSWZLM08vaHRlNDRrNzhLa0dDODdiTkxORWN6QWlWSnhBNkJ0Z1BMSnBI?=
 =?utf-8?B?WVpWbDVuY05ydWQwbUhJWTFneEU4QUtYVEtiTUpCMnJwK1ZaWVRoZVlIMjll?=
 =?utf-8?B?ZEU4UnFJQW9saUV2b0lPbUpNWFVUMUZDaC9tODgydC9wZXhJeXZ2TFR1ekc1?=
 =?utf-8?B?Q2d2bGw4cVFuK3ZDZ0dqdmFzYkh0d3JkZTdmRXlOWUdnazM0RnBDK00vQ3Z1?=
 =?utf-8?B?bWRYUjRYVmpzbmVqUXhrK3RoS2p1QWt1VHQ2VTllOE9VbTZoNjNXKytDaStS?=
 =?utf-8?B?cFpzN1lLSW1OaHNHREZueVQ1ZmlGZTdrL3BPUk0wUUM1STRYZ2tDZytnOUhI?=
 =?utf-8?B?QWFWQXhlUUdpSVJPcGxjVXIwaXdvZTV0TEF2V1M0dHU0aXdUeTVmbmFYTUVZ?=
 =?utf-8?B?TFNKdUJZUXozYzU1Tm85S0VjYVM1cEpWMFpLUHU2a2NTUWRJbXMvaWx6alZn?=
 =?utf-8?B?dzRmUXNrODRlOWt3azFnaHlGKzR4bkkwOENFNUxQTk8vOXhrUCt3b211WEJB?=
 =?utf-8?B?eVMwaTBrNkJGVFI3d1l3dG1NenA5UFJWUWdqNzY1d0UxOGttcFhINlFNeXZw?=
 =?utf-8?B?UWtDNHNGOEkxV2FibHA3eGMzU1dwckhOVG8zWENmRy9MQmUxMjJFdUFBeXJv?=
 =?utf-8?B?ZGswSVpLS3VBcGpRc2RBN01tcHNMV21VM1BNaktjb2JqUG9NM0NZU2p3TjBI?=
 =?utf-8?B?TlNVVnhvUUUrQjlEYzJpMDFRdmlnZjQxS1ZmVEhVSExkWWFLZllGcGNOcUhX?=
 =?utf-8?B?NFVSazZjdnFRUnFyMXpRdW52aHhQWFVKZnZFVVlwYjJoUmNpYlRlRm5nVVRr?=
 =?utf-8?B?a25ETFpTZ2xwSHVMWVh2ZTIya08vQ0tGVHhKUnY5VUd4S2h4a2lkdmY1cy9T?=
 =?utf-8?B?UDRDMFltNENuaGkyb2ZKQnZZcGxlM1JpWjJXeUdKQmVNVTQ3Y3J5b0tRakdM?=
 =?utf-8?B?THlaM3hzUHpFaWxZVU9hSVd6blBSdGYwcXdBY0JJb1NNZUNUQXhKblZVUGxS?=
 =?utf-8?B?eXhSRXNDdnhoaWFVUnppSDJ1Vmo4S1JIMmtFb3ZGbGJUaEZrTGpjMVVFeFZx?=
 =?utf-8?B?VmNJeUpJWjZiazI4RVMrYzY4TVlhYjlYVmlZWXEzWnJtZ0NaeVpoK05tM2V6?=
 =?utf-8?B?TGZnM0J3TGpBdlpjaUVCVko5TXE4c0Yrd1UwSUxMMmNDalZ6dlJlZXFaSVhI?=
 =?utf-8?B?N0pqS0JGckpKTTk5V2VMbGNpMGxuYko1bWZwaDZZYzI3Z01qenRxMkR5cEVt?=
 =?utf-8?B?ZHhYblhvaFVmOVA2U2pzd1p0VGFVUm9helRIL3Q3OHZYTEkxY1NVVmgvWkVt?=
 =?utf-8?B?cjdXS1BmdHZyN2ZZOHZFYXNrdkFRR0ZHVDA3VGIzQXo2S0wwZVJmcHhyUWd5?=
 =?utf-8?B?TWd4ZW8yc1pyaWxXRnRyc2x4RkJrSzRyYWVxR2dLdmJDQ0tmd1c4N0poUllN?=
 =?utf-8?B?R3pqOE5QNEU2QURUbjFsU1I0QzFmTEtoTUtMSVRnZ1RKdFVkWklrMklkUUl4?=
 =?utf-8?B?eUtNTjZGdE9CejZZOUNTUXNsbDlraVdCV01HVkpzUm8rQ2E0YXl4TElQNFJv?=
 =?utf-8?B?WWl5eDFDbVZaOXlHOVA5TWFJOVIvR2c4MkNOakZTbS9ldlRkYUxVVVEvMHF0?=
 =?utf-8?B?ZTJ3WFJZWG96Q21LYUNKbHZTWU5mTU1yUWx5TXdLcHdCOFBwMjRqdC94VjRE?=
 =?utf-8?Q?1YN/XO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 19:26:14.2611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 767e9faa-efe4-4432-4ba2-08ddff8e0e1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7706



On 9/29/25 9:45 AM, Mathieu Poirier wrote:
> On Sun, Sep 28, 2025 at 03:56:41PM +0800, Peng Fan wrote:
>> Hi,
>>
>> On Fri, Sep 26, 2025 at 10:40:09AM -0500, Tanmay Shah wrote:
>>>>> ---
>>>>> drivers/mailbox/mailbox.c               | 24 ++++++++++++++++++++++++
>>>>> drivers/remoteproc/xlnx_r5_remoteproc.c |  4 ++++
>>>>> include/linux/mailbox_client.h          |  1 +
>>>>
>>>> The mailbox and remoteproc should be separated.
>>>>
>>>
>>> Mailbox framework is introducing new API. I wanted the use case to be in the
>>> same patch-set, otherwise we might see unused API warning.
>>
>> I mean two patches in one patchset.
>>
> 
> Agreed
>   

Okay.

>>>
>>> Hence, both in the same patch makes more sense. If maintainers prefer, I will
>>> separate them.
>>>
>>>>> 3 files changed, 29 insertions(+)
>>>>>
>>>>> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
>>>>> index 5cd8ae222073..7afdb2c9006d 100644
>>>>> --- a/drivers/mailbox/mailbox.c
>>>>> +++ b/drivers/mailbox/mailbox.c
>>>>> @@ -217,6 +217,30 @@ bool mbox_client_peek_data(struct mbox_chan *chan)
>>>>> }
>>>>> EXPORT_SYMBOL_GPL(mbox_client_peek_data);
>>>>>
>>>>> +/**
>>>>> + * mbox_queue_full - check if mailbox queue is full or not
>>>>> + * @chan: Mailbox channel assigned to this client.
>>>>> + *
>>>>> + * Clients can choose not to send new msg if mbox queue is full.
>>>>> + *
>>>>> + * Return: true if queue is full else false. < 0 for error
>>>>> + */
>>>>> +int mbox_queue_full(struct mbox_chan *chan)
>>>>> +{
>>>>> +	unsigned long flags;
>>>>> +	int res;
>>>>> +
>>>>> +	if (!chan)
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	spin_lock_irqsave(&chan->lock, flags);
>>>>
>>>> Use scoped_guard.
>>>
>>> Other APIs use spin_lock_irqsave. Probably scoped_guard should be introduced
>>> in a different patch for all APIs in the mailbox.
>>
>> Your code base seems not up to date.
>>
> 
> Agreed
> 

Okay. I was referring to different branch when I referred other API in 
the mailbox framework.

Sure, I will use scoped_guard.

>>>
>>>>
>>>>> +	res = (chan->msg_count == (MBOX_TX_QUEUE_LEN - 1));
> 
> Please have a look at this condition again - the implementation of
> addr_to_rbuf() [1] is checking for space differently.
> 
> [1]. https://elixir.bootlin.com/linux/v6.17/source/drivers/mailbox/mailbox.c#L32
> 
>>>>> +	spin_unlock_irqrestore(&chan->lock, flags);
>>>>> +
>>>>> +	return res;
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(mbox_queue_full);
>>>>
>>>> add_to_rbuf is able to return ENOBUFS when call mbox_send_message.
>>>> Does checking mbox_send_message return value works for you?
>>>>
>>>
>>> That is the problem. mbox_send_message uses add_to_rbuf and fails. But during
>>> failure, it prints warning message:
>>>
>>> dev_err(chan->mbox->dev, "Try increasing MBOX_TX_QUEUE_LEN\n");
>>>
>>> In some cases there are lot of such messages on terminal. Functionally
>>> nothing is wrong and everything is working but user keeps getting false
>>> positive warning about increasing mbox tx queue length. That is why we need
>>> API to check if mbox queue length is full or not before doing
>>> mbox_send_message. Not all clients need to use it, but some cane make use of
>>> it.
>>
>> I think check whether mbox_send_message returns -ENOBUFS or not should
>> work for you. If the "Try increasing MBOX_TX_QUEUE_LEN" message
>> bothers you, it could be update to dev_dbg per my understanding.
>>
> 
> This new API is trying to avoid calling mbox_send_message(), no checking if it
> succeeded or not.  Moving dev_err() nto dev_dbg() is also the wrong approach.
> 

Correct.

>> Regards,
>> Peng
>>
>>>
>>>
>>>>> +
>>>>> /**
>>>>>    * mbox_send_message -	For client to submit a message to be
>>>>>    *				sent to the remote.
>>>>
>>>> Regards
>>>> Peng
>>>

