Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227591C68F;
	Tue, 30 Sep 2025 18:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759257495; cv=fail; b=B6/LO0pXUPWqYi9AZUaa+BtLHcrOOajyL0a0qq2mgNtQ7wrErT7XfwqY+KfmgA4JHjm+HoUJWB0zBfUthErqfPYEjHfyma0PnTqsCgEXlrTJxWgIFV4e+AwJtmMbySsH+Za/qSMXxANccA6YBT5GGXwTEOjtiZdsv/84sehRGZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759257495; c=relaxed/simple;
	bh=M/8Mmwlmp8DEO2s3hUB8Lp7y+7+u8ZRvbPQBRo6hfGs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=YMleF73EjXNJsEre5byP9QJFsMfrfDJpJHua/p5duNGZb+UfUhVeXEVRY1VmHFJTmYpSRkJZwGm34GnK+Y3azre/l5fbUJsup4qfVNpfdkYogtFTc2zB4h3QL3+CC6OOGmVDpEIHsKZo8+weWXhOfT9V+hvSty+wfUMswrfU8dE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=x6kylR6v; arc=fail smtp.client-ip=40.93.194.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="x6kylR6v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecn1Kx88xdeUxHspAKklLxUueEQETk406CFBMdgMqPibsncq81E9z6vA2RdqZttvqfPX/EmI3gNiVbpevK4xw7tArpSJBhk4+LOi7x1YdpuZtAbIsOFklcBe5FHw0bSWDHru2qcZoEt3eVuO6RgvAfl+VqgETKjvoUFt4jpN9pCMeASxl7Ot0kA3bcI58dCCVD3UgU3bOWtd839naOaTGKkx3PVX2OMrb4GxRYNZqw0LBA5/mHmiX33IEC18EI11kCcuIphItmJkecg07Zr+TBDNATd9o5VXz/mId1gt0zajD6nD85giVDqA2g843CySoPpssa1ieNabHbDDTlFZ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edPkev7517vAwnDZqQErF6ilyZEkF07MXGWMvLzgF74=;
 b=DkKBm3NFJJbzutgThDVV28vDPcp0Nd+u6U1grp5BYuLk7FvgD4bAesf7roEwdHbQHoF1Hmqcv7NdGr7ZlOdwuR1CZDQlzn/wdSQDwWo4PXyI8nnYSSZIdOXEZLp+rxU+QH8nawspA3BJ4esq9YJn4jGvABw4mI+RR3L5rJP2VzTaFvniouNlpD6DI1nSd6x3EygJTGLG12T/p5rWKgwU30vt5NJHLyT1a1omZhew0GMYsRYwo41griYWVyzSy11SjY4LBU5joEZZluJTd4L3aqbg4B0U//u3L6IuN0Z3sNAtBO7h6a4hNdCJhN1lNB91JDnAQwuLEQ7loEnJkEPb8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edPkev7517vAwnDZqQErF6ilyZEkF07MXGWMvLzgF74=;
 b=x6kylR6vI+ttO9b3Pj1Z/tlTOJOXxPrjIe5HrI5m+9PkyFlQGVoZ6QDRnVji2iMZdKdsF9k42ZPxbIoDWE4pPGJSVvP4Ma579DdBjyUJ4e58TnhXt0BncxR5p0YLELmLjddCPTs3JeTrmVIlyXqolN+QxN5LgirnFMVQcu+F7+E=
Received: from MW4PR03CA0338.namprd03.prod.outlook.com (2603:10b6:303:dc::13)
 by MW6PR12MB8707.namprd12.prod.outlook.com (2603:10b6:303:241::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 18:38:09 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:303:dc:cafe::a0) by MW4PR03CA0338.outlook.office365.com
 (2603:10b6:303:dc::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Tue,
 30 Sep 2025 18:38:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002326.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 18:38:08 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 30 Sep
 2025 11:38:08 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 30 Sep
 2025 13:38:07 -0500
Received: from [172.31.8.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 30 Sep 2025 11:38:07 -0700
Message-ID: <67b30fb5-8fd9-4fd5-b002-aec199b7e88a@amd.com>
Date: Tue, 30 Sep 2025 13:38:01 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] mailbox: check mailbox queue is full or not
From: Tanmay Shah <tanmay.shah@amd.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20250925185043.3013388-1-tanmay.shah@amd.com>
 <CABb+yY0MzJWOGtS=ocphpUVcJ-gb6_ENCjSmJQiWfRiOhxrpCg@mail.gmail.com>
 <3ecf0bb8-a1f1-498f-8b7d-39483a67cbfc@amd.com>
 <CABb+yY388YaM=wLMy1aaDT0E1yN=7Ge2taMWMyEhWvyqDV=3Dg@mail.gmail.com>
 <9934e6d0-8f38-4a8e-ae0f-fb86b24cd44c@amd.com>
Content-Language: en-US
In-Reply-To: <9934e6d0-8f38-4a8e-ae0f-fb86b24cd44c@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|MW6PR12MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8488e6-6860-4dd3-82c4-08de005080a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?emc3MzBJTlU4Qy9YYmE2OE9NSGV2YTN3bmsyUktNOUpCdFZqbzA1VDdBd2N1?=
 =?utf-8?B?aGZrbEhtMWNwd0tMbkVJQUtkTEFTZnRoQzIvZENTVlBZTW1aNHg4SU95MUZX?=
 =?utf-8?B?bGhvQzJIeThIaUVVRm5oSVkzMmttbGQ4T2d2Ri9mMnowTnU4VGMwNVpXY2RW?=
 =?utf-8?B?V3R6T3ZZMVJSWXQwazJUZklVQ1JPOGRTUFhnWk1zMncyRDVnc1RvVGZzVUVz?=
 =?utf-8?B?L2ZYbXVtQUpmYWZQbExmOExHK1NHUytzdkJwdERobHhmQ0JzY2szYm14Q2tY?=
 =?utf-8?B?ZlZuaEwwVjVXY1k4bVp3b2N6NWtwRXU2MUIvek9DdEFDQzFqM1l3dmVpQzI5?=
 =?utf-8?B?WE01WnpwYkVFdGJ5aERiSzBzMEw0VWJWZXZjbi84OTQ3b21nWFNOb3FYUDc2?=
 =?utf-8?B?L1AwaGh3aUJJMTlPd3hFcExQc2cyeFNkZlJrT0ZBaU51eTVScjk3RlJXMTJq?=
 =?utf-8?B?VStXL2lCay9peVkzUzdNT3NzdzhBYVZyKzk2cmVTV0E0S2FobytodC9UM2Ev?=
 =?utf-8?B?WWdYdzhyY0xrOGRHMzZjQU5CVXJ2a3lQRWRpdEJRb1VXd0V0MENkc1J0enV0?=
 =?utf-8?B?L2J0UlRINk5WMlF1Q0xNSmpzVVlLWkQvTTlIdnZvSTBFYjRLNWo5ZVVndm9S?=
 =?utf-8?B?ZVBMbCtNV3h5VkRKUWFmNXI4R0FKZ2lCYzd3YWhjWkFjeDhObEFXb1ZjNnE1?=
 =?utf-8?B?clZ3QWlLNkNZTm1lbTBwSE0raHJTVUM1OWRSbjNiN2NEbkROTjl1K1ZPaXhh?=
 =?utf-8?B?WnJMUTJRM0l0b3RlK3dFbVdrUTR6cmt2MFVtNjJlVGxiZks5dUpqcU1XWEk2?=
 =?utf-8?B?aGFPQzM4MG5IdHpBTTNoZ0dTM2cyMkg1ditIL3o0RlpXLy9EeVNSOXJ3UldS?=
 =?utf-8?B?MmdQT2JSQjNVK0RaVnI2S2QvaStBZ2d4UDdTSGhBT0ErbVRxK1h0ODdhR2Vl?=
 =?utf-8?B?aWg2Q0VWMDZNR1g4WENxa2lLUStkdW1QTWgyNUpzK280aHlYU1luWWRBZzZ2?=
 =?utf-8?B?T2F2dkpTbzZQdjQrSkhSaTUyTnU0Qys5OXhsQnhPL0lMU1RhZnQ5VkpBSHFJ?=
 =?utf-8?B?a3ZCOUJRZWhDUlRqcVlyWHVXR095dE1GS1gwMnRxUit5eXhoeloyQ3NkWmIr?=
 =?utf-8?B?N2VHczFmdC9zbkFMR2VYd1RQOHhFWHhCZXMzcFNRVURMajlBdmZBNmxSRlQv?=
 =?utf-8?B?TWVIZDNEajJxeU9CRjVvTWd4em1QZHFQYmtnZmQ0NXVZSHhETXI5cWdjZ1Fv?=
 =?utf-8?B?WVJzbmxOWnF2S3E1N0k1ajFlMk1tUFRDUW1lMWJtSnJUV2FNZE0wWThUTHJ1?=
 =?utf-8?B?Y3pMRnRrK1hBUVZPRlpEK3dKTVRPRkY3bzQ1TUNvMEZkTTM2UTBjN2RoVTNX?=
 =?utf-8?B?SFZBM05OcEIzZlJnWGpaU3Nod0tUQnUvZmtJd21qN2tQaGl6RGNBZEFsa1pi?=
 =?utf-8?B?WUYyYTFLNWpocUUwUXhBclNYWkU4WU5oWHgvNE5hMGppTUpYRGRzbSt0L2pi?=
 =?utf-8?B?ZjBoNytZa2pJUFJuazFQeDB0bUVPcFM3Y0x6UVFhZlV3QmJJOG84RGtoNVFN?=
 =?utf-8?B?ejVMempmY1NVYTJjNG1KVDlkYmp5NGdCcytxZU10VkFjTWN2Qm5VNHNFSmVp?=
 =?utf-8?B?NHpjVlN1NmVJSUJtYXFlREZKQ2dWYStLNmhtRGVWV0NXQ2lKMkg5V056K01o?=
 =?utf-8?B?YnJKb2RXNTFTYTlZbUdLRnk4QWc0b0dwVW9vVjRhcmxXRk5wbG5BM0lrWXlU?=
 =?utf-8?B?U0JHSVpEWFIxUlVTUzhTMUpDd01GblR5bjZxQ3V3ek5zaEJ2V051TFZrYVpy?=
 =?utf-8?B?cnVBQ3Z0M2dYdkkwYjFMNjNBVDBqdjZTZlM5ckoxOHBSSW9BQThHcHFzSEY0?=
 =?utf-8?B?YnZudmJTNkptUWk1N3BPcE5vckFjbGVCWmF1SEZIN091T0o3dlpmOW5MRC9H?=
 =?utf-8?B?MWZYNytMSmR3Rm0zMGRuRTRLR2Z5M00za1B3VE5Ga0NpUmk3U21sMzIvZDFG?=
 =?utf-8?B?d3JYVVBHbFpqK3dGK1V1NHl1U1BjUlZzZCtOcWt1Q0JNYmJ1dWMzTGdKeGtB?=
 =?utf-8?B?WDVIczJQWXJZazBEb1k0eHJFQ0hoZ2JPaEk2c2d2anNmNHdCSFZkZEVWQlRV?=
 =?utf-8?Q?z9Kw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 18:38:08.7575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8488e6-6860-4dd3-82c4-08de005080a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8707



On 9/30/25 12:58 PM, Tanmay Shah wrote:
> 
> 
> On 9/30/25 12:33 PM, Jassi Brar wrote:
>> On Tue, Sep 30, 2025 at 11:52 AM Tanmay Shah <tanmay.shah@amd.com> wrote:
>>>
>>> Hi Jassi,
>>>
>>> Please find my comments below.
>>>
>>> On 9/30/25 9:11 AM, Jassi Brar wrote:
>>>> On Thu, Sep 25, 2025 at 1:51 PM Tanmay Shah <tanmay.shah@amd.com> 
>>>> wrote:
>>>>>
>>>>> Sometimes clients need to know if mailbox queue is full or not before
>>>>> posting new message via mailbox. If mailbox queue is full clients can
>>>>> choose not to post new message. This doesn't mean current queue length
>>>>> should be increased, but clients may want to wait till previous Tx is
>>>>> done. This API can help avoid false positive warning from mailbox
>>>>> framework "Try increasing MBOX_TX_QUEUE_LEN".
>>>>>
>>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>>> ---
>>>>>    drivers/mailbox/mailbox.c               | 24 +++++++++++++++++++ 
>>>>> +++++
>>>>>    drivers/remoteproc/xlnx_r5_remoteproc.c |  4 ++++
>>>>>    include/linux/mailbox_client.h          |  1 +
>>>>>    3 files changed, 29 insertions(+)
>>>>>
>>>>> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
>>>>> index 5cd8ae222073..7afdb2c9006d 100644
>>>>> --- a/drivers/mailbox/mailbox.c
>>>>> +++ b/drivers/mailbox/mailbox.c
>>>>> @@ -217,6 +217,30 @@ bool mbox_client_peek_data(struct mbox_chan 
>>>>> *chan)
>>>>>    }
>>>>>    EXPORT_SYMBOL_GPL(mbox_client_peek_data);
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
>>>>> +       unsigned long flags;
>>>>> +       int res;
>>>>> +
>>>>> +       if (!chan)
>>>>> +               return -EINVAL;
>>>>> +
>>>>> +       spin_lock_irqsave(&chan->lock, flags);
>>>>> +       res = (chan->msg_count == (MBOX_TX_QUEUE_LEN - 1));
>>>>>
>>>> 1) If we really need this, it should be
>>>>           res = (chan->msg_count == MBOX_TX_QUEUE_LEN);
>>>>
>>>
>>> Ack here.
>>>
>>>> 2) I am thinking instead, introduce a
>>>>          struct mbox_client.msg_slots_ro;
>>>>     Which is a read-only field for the client, denoting how many 
>>>> message
>>>> slots are currently available.
>>>>     The mailbox api will always adjust it when msg_count changes...
>>>>         chan->cl->msg_slots_ro = MBOX_TX_QUEUE_LEN - chan->msg_count;
>>>>
>>>
>>> It's not possible to make msg_slots_ro true Read-Only. Nothing prevents
>>> clients to write to that variable as far as I know.
>>>
>> Correct, nothing prevents a client from changing 'msg_slots_ro', just
>> like nothing
>> prevents it from setting tx_done or rx_callback to 0xdeadbabe.
>> The '_ro' suffix is to tell the client developer to not mess with it.
>> I am slightly more inclined towards this approach because it avoids
>> adding another
>> convenience api and is more immediately available without needing a 
>> spinlock.
> 
> To avoid spinlock, msg_slots_ro should be atomic right?

I take it back, it doesn't have to be atomic. I will send a new revision 
with the design we discussed here.

> 
>>
> 
> Then in the remoteproc driver, before using mbox_send_message, I can 
> simply check (chan->cl->msg_slots_ro == 0) then don't use 
> mbox_send_message.
> 
> 
>> -jassi
> 
> 

