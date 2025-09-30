Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010020.outbound.protection.outlook.com [52.101.201.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D73F1E868;
	Tue, 30 Sep 2025 17:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759255107; cv=fail; b=QMdaGeNUZpUGJFVXdvWaLow8f/Av/btc5bELLsmdYdNSHFclwwD5xEtNiWmptqrXk6LpYLzHUR2qhNl3xbduw/DTZ5hL+/e6BrH60L+jA2mllJjvSxChOVgG2/+L8NrF7BfA+mpdVklIcB21/hOPvTgDtXrUoP+eCGoVohaA83I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759255107; c=relaxed/simple;
	bh=qvLlERlNz7QpxXFzvffLrLf1q1AsFUf8Zwwa4tp2YMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OCrfuFP9s5VIw4nE3kOsevy4Mao7qYRcRTz8jjt6ltfCgbUOy2uUpKwXdDzdaZ9CfV5KcGyQ+1KYwnN+YcI+dLLO9SRhEoFPVpYjmsvEy3SZhOCe2nbTB5dbXmXt0/2DjUxHe1xCRd16moeiJlg3JaEFa4Kh57QvFomfJPU5les=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WnWbCq6C; arc=fail smtp.client-ip=52.101.201.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WnWbCq6C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfs8xA+AXQYwIylgI6v25x+HcQkYvflxHuExdYo/1Jnc7+7xUXF7nAn+z7AshuJis9BZx7VjhUPRX4MsSXnFDjbfDwZtnVXpUlMlzYoyOewwV/piyZ3G5kOpJ323CRjHkijOcENrDYnkaUGwZ2VHcQyLxgt/eFSe4Gujv6K2P38aOfDXohazqdDj9V66cILNrm/92nXQjR0z/fmp1Js+bY9flZe23PnWI/m54nJ2GWXihkVvw7Auf0s2zLHQpFDGCLUkKbmdZa+DzCmHuZST17rVrs6hGbv09+VRGzcYNPHLBkVzXT98Nn2P6Pmr4xIhNkpldkvyFf+VnfcfNOmDkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zh5ulcBL5TQFFOUMPQBKpbdPFQs+n+IrzitG78cDXRs=;
 b=ZInYOKSSrZnOKLR4/dLWdLZ+GrbqTcM23b9xDWTpoiEYPdhB0aoO3wEfxjEfbX/tYI8gvBR+r25MJYlZz2tpQgqkmQxHrxxhZMUv96sc1iMOrWwwiHXLcwzWkImQhm+pkdfouBwhlE3+cqhTeyrEYGiEMA7/D6l0pioGXHrQiLrkEuvXwTdHJnxE8G5rD13v7drkGyVA2MrFS1F7D7Eso3FTIJ0qAT2DnZGFCMfQPa7i0TpRZ1i99QrL56t4oVCgSpy3z3XHMVCuI7IBw5YmPkxUPNy2qxaPHCaefyxIYysuxfxA7NgbdCnTqzY4lEhJJvVponE/Sei/86ABWnCApg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zh5ulcBL5TQFFOUMPQBKpbdPFQs+n+IrzitG78cDXRs=;
 b=WnWbCq6CPn+SbTbn+axk1GSyK6OfZbS2qNKbR93/LiP6MgKHuHsBC7Y6yrgN1nNqtaCEZ70dJLk2nQE3yAkXO9foIkM+OiV7PjCsP2UyZQDPfxxt9qseHPV700tmvxifrlf0gA2KvbjQ19hlL+ju4MrH4iWcIjiCa1l7HBQ4m2s=
Received: from BYAPR21CA0012.namprd21.prod.outlook.com (2603:10b6:a03:114::22)
 by SA1PR12MB8888.namprd12.prod.outlook.com (2603:10b6:806:38a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 17:58:23 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::6f) by BYAPR21CA0012.outlook.office365.com
 (2603:10b6:a03:114::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.4 via Frontend Transport; Tue,
 30 Sep 2025 17:58:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 17:58:22 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 30 Sep
 2025 10:58:22 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 30 Sep
 2025 10:58:22 -0700
Received: from [172.31.8.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 30 Sep 2025 10:58:22 -0700
Message-ID: <9934e6d0-8f38-4a8e-ae0f-fb86b24cd44c@amd.com>
Date: Tue, 30 Sep 2025 12:58:21 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] mailbox: check mailbox queue is full or not
To: Jassi Brar <jassisinghbrar@gmail.com>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20250925185043.3013388-1-tanmay.shah@amd.com>
 <CABb+yY0MzJWOGtS=ocphpUVcJ-gb6_ENCjSmJQiWfRiOhxrpCg@mail.gmail.com>
 <3ecf0bb8-a1f1-498f-8b7d-39483a67cbfc@amd.com>
 <CABb+yY388YaM=wLMy1aaDT0E1yN=7Ge2taMWMyEhWvyqDV=3Dg@mail.gmail.com>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <CABb+yY388YaM=wLMy1aaDT0E1yN=7Ge2taMWMyEhWvyqDV=3Dg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|SA1PR12MB8888:EE_
X-MS-Office365-Filtering-Correlation-Id: 729d12ae-feb4-4a1a-bb4e-08de004af298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXRQd3hUekx1Ty9DOEJzU1ZuUmYrb1lzYmkwbnBESGx5Um5TRU8vSG1Ia3o1?=
 =?utf-8?B?VzdOMTZmdVNXNWNkNmJRb1lSZDRiL25hem9ibVBZaEQ1Yms1VlY2LzlvUFVU?=
 =?utf-8?B?Y1B1VkkvQjdtWmtZekZDcmNpRjVyLzh2OGNialU3T084bjZzemlDdW8zV29l?=
 =?utf-8?B?aWQvQXZtdlFBNnVFWllWcFYwQnBYd0RuaDJaeFh2SFZyQWRHbVQrbHNHWGMw?=
 =?utf-8?B?Yy9EUkpnNkY3R1RYZmh3bDJkc2dRVzdzMzFTck1MZjE2enkxVUFWQkYvUkkr?=
 =?utf-8?B?L0FPSlc0bWQyS0pQbzQwYXZGcVJya2NFNnhHYjlOaldnVXVCcXV6WWZKb2tJ?=
 =?utf-8?B?MlRWakVJckl3Rmx3cng0M2VuaGNIMDFlWWRMZ0lGTUx5WWpYRVZNS2JET0lQ?=
 =?utf-8?B?Z1dtNTNqT3ZEMWlIZ3RtSHRSRUdveFNoTUIyb0U3dHY2MkxxWThkQnZwcVI2?=
 =?utf-8?B?NHFVNUF0dUlJdnBFMjV3L1p5ZDNxZ3pCYklCSGh1TWplWnRJRmNLVmtRTE10?=
 =?utf-8?B?VXZzRnVHenpvQzNxUVhOY1lwWFNicDI4WUJpVzJaUkRSaUYwcGJwL2QxTXdI?=
 =?utf-8?B?ekkrVStYbUdDYUM0ZWVTajFpNzZTWVlQOEJNUjA5QTd3b0VCdllXTXc0WXc2?=
 =?utf-8?B?ZmFvOUJ1cVFlMUdWS203VStnMHBmMUVxL0t3dXBBcTkrQ25uMmM3ZFF5Wmd2?=
 =?utf-8?B?UkpNb1c0alNWY2JSMkR1b2E4bytBMVJONUFvWHNxdVJBUll2MUkvc1FqMUdU?=
 =?utf-8?B?WGUyTy9sbElBNjVWbU5peWdXQXFOZmQzZ2F6dnl4NGFyMC96eExVcWxicndn?=
 =?utf-8?B?WmFSMXdPVkVQNm5pbTZwUWZMSnoyN1ZxYmtiQzVjS1E4WVJPdXhoVzc3WG96?=
 =?utf-8?B?dUVDVzJVTDk5NG9DdVU1TzI4eGxkclRaWVREU0l1dkl2bDN6bkIwM05NN3NE?=
 =?utf-8?B?UFJybVltd0ZuWmhPSkp3RUR4dlZWcE5sN2FrSVcrb2trcXZqM1pvZlBuMVpJ?=
 =?utf-8?B?c2ZISWQzdUQ1SHloUi92MHFVMDlCaVF0YnFPOGQyVzNoUytnM01CTVlaTHlR?=
 =?utf-8?B?SzhxcWI5cTNSV0dJOFpwWGFFZCswOFdVNmJjMnlBRG8yZ3VhaVdCb01ZcVgr?=
 =?utf-8?B?MC9NbXBsQVNMdFE3QTZzWkwyMHUyT28xRUhtUmdkckp1S25raXVOZEdSQnlr?=
 =?utf-8?B?WTdRZFBVSlF1YXVqd0p3bGl0WUFLOVE2UHZZTGxFR0Ntcmh5YzliclRQRDBQ?=
 =?utf-8?B?S1BYcE02QzE1Y2JUd05zRTh4ZncrNjRkencxOS9zZnJKNURRMEFvYU8wUFNB?=
 =?utf-8?B?WG44VDRWYUU4aHJBak9tTVgyWklUeTFNU0tUaGE0UE1GaHExYXV1QVdROTgy?=
 =?utf-8?B?QStsdVhGVEtnek1FN1dtSWY4UVMvMFQrODNReGNKT0FIdUE1Y0ExZEo1RGpN?=
 =?utf-8?B?MDBjZDFCblhCOSsxUnB2bUhCc2luNDZYNmw5VTBYQkJhTUpFMFlnNkdQLzlL?=
 =?utf-8?B?dDBEU0lKc0E3aUQwbWl6dzB6ZW1BYUNSeDZ3eTJGMzAxUVorVTAvUDg2ZVNG?=
 =?utf-8?B?RE9TYS96NkcrNm1vd3BZWi9FdWpBaGpqU0VHQ3U5TTVMUkZBcXVuQm9tOWJF?=
 =?utf-8?B?S25QRmh1QTBMZkRqRzRYZEJzSTlONGtNbkViTEpXUEFLeE1MN0daeGxqZXMw?=
 =?utf-8?B?VXc5aWVxRWNpWlVrWUNzUmNROWZPQTlhM0tVOXhOSEkyZGI3MENMUTc5ZmY0?=
 =?utf-8?B?TkU1REt2dTVJU29ZdmlzZmFNN0VkbG9RaE9KQlY5UGlYeVZmTXQyZURqeWNG?=
 =?utf-8?B?TDJES1ZVSW5ZOHBTd1J0S3dMcytZOHFCMXZDd2hpYzVUUTRzbnMrUGtaa3dD?=
 =?utf-8?B?VGNaMmRGYm13anVWVWVPdllVS0ZZcnNQbThyRndGK01qK0hEN2xlZWxrL0Fm?=
 =?utf-8?B?VVRiR2cvMUxaMW80WFhTWFJReGQ3Nk1ON3Fib081ZWNyR3ptcjdhR3c4R0hq?=
 =?utf-8?B?c3Zza2ZreFcxVTNJNFdZQzNLcVBhMjkwM1hCR0trbEZWZ2lNQnY2UldtNXBR?=
 =?utf-8?B?MkhYRkRicVdHZ3BmaU5hM3JmNCtrQXBadHg0UStmVGNMNkZNRzFrM21PWWhq?=
 =?utf-8?Q?clS4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 17:58:22.9495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 729d12ae-feb4-4a1a-bb4e-08de004af298
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8888



On 9/30/25 12:33 PM, Jassi Brar wrote:
> On Tue, Sep 30, 2025 at 11:52 AM Tanmay Shah <tanmay.shah@amd.com> wrote:
>>
>> Hi Jassi,
>>
>> Please find my comments below.
>>
>> On 9/30/25 9:11 AM, Jassi Brar wrote:
>>> On Thu, Sep 25, 2025 at 1:51 PM Tanmay Shah <tanmay.shah@amd.com> wrote:
>>>>
>>>> Sometimes clients need to know if mailbox queue is full or not before
>>>> posting new message via mailbox. If mailbox queue is full clients can
>>>> choose not to post new message. This doesn't mean current queue length
>>>> should be increased, but clients may want to wait till previous Tx is
>>>> done. This API can help avoid false positive warning from mailbox
>>>> framework "Try increasing MBOX_TX_QUEUE_LEN".
>>>>
>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>> ---
>>>>    drivers/mailbox/mailbox.c               | 24 ++++++++++++++++++++++++
>>>>    drivers/remoteproc/xlnx_r5_remoteproc.c |  4 ++++
>>>>    include/linux/mailbox_client.h          |  1 +
>>>>    3 files changed, 29 insertions(+)
>>>>
>>>> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
>>>> index 5cd8ae222073..7afdb2c9006d 100644
>>>> --- a/drivers/mailbox/mailbox.c
>>>> +++ b/drivers/mailbox/mailbox.c
>>>> @@ -217,6 +217,30 @@ bool mbox_client_peek_data(struct mbox_chan *chan)
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(mbox_client_peek_data);
>>>>
>>>> +/**
>>>> + * mbox_queue_full - check if mailbox queue is full or not
>>>> + * @chan: Mailbox channel assigned to this client.
>>>> + *
>>>> + * Clients can choose not to send new msg if mbox queue is full.
>>>> + *
>>>> + * Return: true if queue is full else false. < 0 for error
>>>> + */
>>>> +int mbox_queue_full(struct mbox_chan *chan)
>>>> +{
>>>> +       unsigned long flags;
>>>> +       int res;
>>>> +
>>>> +       if (!chan)
>>>> +               return -EINVAL;
>>>> +
>>>> +       spin_lock_irqsave(&chan->lock, flags);
>>>> +       res = (chan->msg_count == (MBOX_TX_QUEUE_LEN - 1));
>>>>
>>> 1) If we really need this, it should be
>>>           res = (chan->msg_count == MBOX_TX_QUEUE_LEN);
>>>
>>
>> Ack here.
>>
>>> 2) I am thinking instead, introduce a
>>>          struct mbox_client.msg_slots_ro;
>>>     Which is a read-only field for the client, denoting how many message
>>> slots are currently available.
>>>     The mailbox api will always adjust it when msg_count changes...
>>>         chan->cl->msg_slots_ro = MBOX_TX_QUEUE_LEN - chan->msg_count;
>>>
>>
>> It's not possible to make msg_slots_ro true Read-Only. Nothing prevents
>> clients to write to that variable as far as I know.
>>
> Correct, nothing prevents a client from changing 'msg_slots_ro', just
> like nothing
> prevents it from setting tx_done or rx_callback to 0xdeadbabe.
> The '_ro' suffix is to tell the client developer to not mess with it.
> I am slightly more inclined towards this approach because it avoids
> adding another
> convenience api and is more immediately available without needing a spinlock.

To avoid spinlock, msg_slots_ro should be atomic right?

> 

Then in the remoteproc driver, before using mbox_send_message, I can 
simply check (chan->cl->msg_slots_ro == 0) then don't use mbox_send_message.


> -jassi

