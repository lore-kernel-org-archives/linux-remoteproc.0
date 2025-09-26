Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013061.outbound.protection.outlook.com [40.93.196.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE57B215F7D;
	Fri, 26 Sep 2025 15:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758901225; cv=fail; b=awGiHKvoJRwIasACNsoMcmVpZ2B6VAuBnfKKJcAFWX6M5cjTymD4rUYHNFo+vVjnVNFjY0/k+eY69OsJIKWIqoDAJhSZak60+W5isqCnNTO7Zzci6csFkRS5OuccR4smq5+lcTLVuLb8PY1UkosAXydHMKJT3+B3VE97Egpa9Fk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758901225; c=relaxed/simple;
	bh=axlluGkzl9ympWkRVSLlDukkrX2jer17DhWxguVyOgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qYOoShFahtqfzXwF9EiFdrgJMCdjxJ8cLBJSkGeE9S/qu57LBPCea0A/JXsyrPIPm5EAcg1vR7ZKrR04ei3rbtOieVkI8XCCzcjXXXy6k39WXFHtQJQ30E5QMMbhERisuP5fGg4MqPcaRCQz3QBa5OnIgS6Ar/F1d9F4atlpboA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=THxOKElK; arc=fail smtp.client-ip=40.93.196.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="THxOKElK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZN3rVZjWGYlf/h0ZQNGNL7/YDqyoaLFAFkqZmMmtTmNHf7+3gu+rWSv69Ku7dwe1MOvu3zNxqvkK574v+m4uK/2u1HLgGvJ5PZxgvdVv5OAi4p8S/3Q3akl6d/W0eu3VBAUQoT4ozJO9K3ZQ86vdtmJ/j8RCAvsakFyc39+k8MQCRsoYiJBEEiEi6wkrxahobcUpG2kT0m1PxMnsb0rDdG+SilzqXO0owdk9SEj8i/jOb++8Uxvv0rgPhOvDd1rw+vw2Fr5Jp0S64vFsTWv9ViIxpGdSBgHOkMJ1usGKmtPbnsZsFOmbczI94A+TPQqWGU8SbmaWzAtVgmxR3GR1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ISpOY3zORb6YJvKGa72bTmNY+805q/wQsN7zUJh5i8=;
 b=oF27LiONmtFTn6EL4NEeqzg8Wm2ovLhenqiK1ZGhXKMDORU+tiNegAamFR7BGdlG3voLnu8tHnD0aJpOxz1Gcvqo5m+yTzoYBj6920KCMaEhF5bxS6NbX/Y6u7Z+jJNonC/ovsza0LQhKEYWKD5jRlLrSEimANXLV2GzV0j0/mIIARe3lr2f469FrKS7TWfVQ/68CZ6GdK44S3IizgsMqPuUzf+Bs558W7iCZTQ0YHINTPacZgI6DJTs/ytzzzGEpNEJ5/jsvHcQkzdKduLix6gHMzY7N0x67W4ZAn/DSTaaQraAdoUK/tFVaAybcprJ1VEsLyFdFZXbQagJqa0Uvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ISpOY3zORb6YJvKGa72bTmNY+805q/wQsN7zUJh5i8=;
 b=THxOKElKTVfEh0dddNNlbZ8DHtbYn7vr6WV9DEobQiWfKnlaJYiYUspBqJHSr2o6NpaRyGGaarZRGnd6j9jtKbOydYkpfIISgxP4Wu07aCLKTtzUWPZdVtjX37whc297IxmkAMwzHJ+SwdDkpLB008rvQwxf7q03qOeEYicYepE=
Received: from CH3P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::27)
 by IA4PR12MB9761.namprd12.prod.outlook.com (2603:10b6:208:550::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.13; Fri, 26 Sep
 2025 15:40:19 +0000
Received: from DS3PEPF000099D7.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::bc) by CH3P221CA0026.outlook.office365.com
 (2603:10b6:610:1e7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.14 via Frontend Transport; Fri,
 26 Sep 2025 15:40:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099D7.mail.protection.outlook.com (10.167.17.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Fri, 26 Sep 2025 15:40:19 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 26 Sep
 2025 08:40:11 -0700
Received: from [172.31.8.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 26 Sep 2025 08:40:10 -0700
Message-ID: <e93f0ee7-687a-4f47-a847-90cc1ea87290@amd.com>
Date: Fri, 26 Sep 2025 10:40:09 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] mailbox: check mailbox queue is full or not
To: Peng Fan <peng.fan@oss.nxp.com>
CC: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <linux-kernel@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>
References: <20250925185043.3013388-1-tanmay.shah@amd.com>
 <20250926073735.GD8204@nxa18884-linux.ap.freescale.net>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <20250926073735.GD8204@nxa18884-linux.ap.freescale.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D7:EE_|IA4PR12MB9761:EE_
X-MS-Office365-Filtering-Correlation-Id: dc87d304-f412-4241-adb8-08ddfd12ff4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWJjcE9xcEhJQ2xoREZ5TThOYjgyUCtheEp5Y0hSN29nUklhWkFhVDczaWV0?=
 =?utf-8?B?N0JSaW82MC83L1ozcEpVZGxKeTVqa1VqZ0RhaTMxc1p4MUsxVmp4VGNhL1JS?=
 =?utf-8?B?S2JrVDZJQlQ3UjlaYkxDOEdjR0hkNGVSN3J4Q1lOMHIzNFZTa2x2WVlaVzUz?=
 =?utf-8?B?TEc4Ty9TOWRlVi85RjBSVyt4WHRKallQdTUrVmdia1Rsaks3Y2ZEVHB2eXdI?=
 =?utf-8?B?ZEZFeFRwVk9TYnhRSUEzVGlIcnFnZjA4cjRzUWtzS2JaQlM0Yk5TeWhsWUJ6?=
 =?utf-8?B?V0RqSzNtclFPdjlTcUZkYzV2ck04MnlXWWVRRGZEeExyelpNY1pKcjI3d2xy?=
 =?utf-8?B?K0tiVFB6TDRPMTNraTBSaitnaWhpQ2NlR0dXRXY3QW5ITjFRZnFzRDduY3hv?=
 =?utf-8?B?c3U0cXZCWjkvOTNQRmgwUVpZQWJUVkRXd2syQWV6NHVHc2wxSW0rQmcxdVh4?=
 =?utf-8?B?L1JvNldyWnpkbDdWa3dKWUNTSUNJTDc2ZE1xaHZ5UUhMTmFGVFkxeC8vQks3?=
 =?utf-8?B?TEhMUWxnNHp2UnZSSlpxMGwvazJkZVB3V3V3TExycC8vVlQxOWZsSGt2OVFa?=
 =?utf-8?B?TUo4eFNzK3dFQVRoMWl4bWprMi92WXQ1dVFIVGUzdFd4alBzTEFJaXhqS21F?=
 =?utf-8?B?WEZoQTRRZXBIUGhEVVpsb08xYi83YWdRRDUyNG5lQzBkV2JwZkNmS0F3NlNK?=
 =?utf-8?B?LzFHRDdhM2wzMG0zN3dwSkxkRGRJWGk0cHNsVldZa2lIMjRBVlJDMS9kZ0lS?=
 =?utf-8?B?Qk9wMGFZSTlNalRiNEFwZWk2QTR1aVFaR2pDS2FENEliUE5qQWRoV28zZmlV?=
 =?utf-8?B?RFprN2FCQk1xd0doa24zM3JsMjdRaXlDa0dBaEZOVlpjdEQ1V1pEcEc5TG1E?=
 =?utf-8?B?aTZNUGFZNHI3blZtdGwzRkg0OVJrMnJZeStxRFUzYlExZWhYTDlwNmk1NTIy?=
 =?utf-8?B?QXJ0OVBOc3R0cW0yOGY4VzFuYjlCWkVyRTVrZWkrWlBvY1VYY1ppVzRqT3RR?=
 =?utf-8?B?UlJpODY3aVlvSmUvWmZtalU0cXVUVmF0QlgwazEyL1ExSW45cXlPK2ZqVWs3?=
 =?utf-8?B?L1Bxa29kVEFnUkhSem9tUVRCd0IrVEYrcmFJemk3VnFSbDR2d1BqdksvR2ls?=
 =?utf-8?B?dktPUVVGOU5xbCtwbDRDK1VuNkx6QkJWVldiK1NMOWtWRG9YS3hTR3h3S2s2?=
 =?utf-8?B?ZGNsR0V2U0RVVjd4RkYvSlNnd3FRWEliL2NrR2dOUTltOGpub3pOY3lpUXFn?=
 =?utf-8?B?UzRUZnVqaG84dk9VL1I2RDB0TFlvdldyNS9kdlFCcWVEcEhSSDdSSW42YWZz?=
 =?utf-8?B?eUFyaGJOeHovRUM2NVlrRkhhRWVXMTU4QjY2NU9uQVFXTHJ0QVo5cmhXQjhR?=
 =?utf-8?B?TURGSU00a1Y3YkhkbTJvNFc2SXBHVVhacFFkQjFKclVSVW8wQ2w1eWpkNG80?=
 =?utf-8?B?a2N6ekNqbUp1UE9NS2x5RjZFUEhHejNLQVZ3M1UvdkptMDd5YjBJWTVycjd3?=
 =?utf-8?B?d3BRdHNUNzJldHVqMm5nMk8rZGlnSXhKVFBMVWI0RDQxWEMrNkhjdE9pSFJH?=
 =?utf-8?B?UDE0bGVFZTArVWRVYkxaWDBodHpCTzJXdXAzWlkvSFFlZm1aR29PbU16TXRp?=
 =?utf-8?B?UTZyR2thajB5SGlvYnNodnlYSHJlNXZPSzZzYU02TUlYYkwybUZpMEtJM3lP?=
 =?utf-8?B?NGZRaTZNTUJZb1gxSXRHUG1TbnBvZkt3d3UzbkVHYVRVelJwdWFYU3hUczU0?=
 =?utf-8?B?amNnZ3RGM0JrdFpwREEyMktZZ25ybTdyTVFxZm1yb1pEQU00TDRvTGsrb0tU?=
 =?utf-8?B?MnJBeXZReG1TVlVuWXNuazBSTXZTLy9jUzJEVWFmU0MxYUYwSWdHMTB0c2wr?=
 =?utf-8?B?V2NDQ0llQkdkVmhsaTlPN3BNcVpqM3lYaFhTeGxQZzFTM3NrSTNMRGs0ZWdR?=
 =?utf-8?B?Z2tNeWlJVVAxaUVWQytqUm5RODJYelpCZHhONlZnZndJdDZ6MjhWTDFTd3NH?=
 =?utf-8?B?ZFVhcVp1ajBGT1lIKytVRUM5Yk5MSDVQS0YxL0ZGejFWTnFqZ3lhUHJBNURa?=
 =?utf-8?B?MnBrMEdCN2Zua1hwczVSYWp4VkFUVlFLb2xiR2xTSmlYN1dMSWhId3BiRDh2?=
 =?utf-8?Q?XXUg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 15:40:19.0323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc87d304-f412-4241-adb8-08ddfd12ff4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9761

Hi Peng,

Thanks for reviews. Please find my comments below.

On 9/26/25 2:37 AM, Peng Fan wrote:
> Hi Tanmay,
> 
> On Thu, Sep 25, 2025 at 11:50:44AM -0700, Tanmay Shah wrote:
>> Sometimes clients need to know if mailbox queue is full or not before
>> posting new message via mailbox. If mailbox queue is full clients can
>> choose not to post new message. This doesn't mean current queue length
>> should be increased, but clients may want to wait till previous Tx is
>> done. This API can help avoid false positive warning from mailbox
>> framework "Try increasing MBOX_TX_QUEUE_LEN".
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>> drivers/mailbox/mailbox.c               | 24 ++++++++++++++++++++++++
>> drivers/remoteproc/xlnx_r5_remoteproc.c |  4 ++++
>> include/linux/mailbox_client.h          |  1 +
> 
> The mailbox and remoteproc should be separated.
> 

Mailbox framework is introducing new API. I wanted the use case to be in 
the same patch-set, otherwise we might see unused API warning.

Hence, both in the same patch makes more sense. If maintainers prefer, I 
will separate them.

>> 3 files changed, 29 insertions(+)
>>
>> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
>> index 5cd8ae222073..7afdb2c9006d 100644
>> --- a/drivers/mailbox/mailbox.c
>> +++ b/drivers/mailbox/mailbox.c
>> @@ -217,6 +217,30 @@ bool mbox_client_peek_data(struct mbox_chan *chan)
>> }
>> EXPORT_SYMBOL_GPL(mbox_client_peek_data);
>>
>> +/**
>> + * mbox_queue_full - check if mailbox queue is full or not
>> + * @chan: Mailbox channel assigned to this client.
>> + *
>> + * Clients can choose not to send new msg if mbox queue is full.
>> + *
>> + * Return: true if queue is full else false. < 0 for error
>> + */
>> +int mbox_queue_full(struct mbox_chan *chan)
>> +{
>> +	unsigned long flags;
>> +	int res;
>> +
>> +	if (!chan)
>> +		return -EINVAL;
>> +
>> +	spin_lock_irqsave(&chan->lock, flags);
> 
> Use scoped_guard.

Other APIs use spin_lock_irqsave. Probably scoped_guard should be 
introduced in a different patch for all APIs in the mailbox.

> 
>> +	res = (chan->msg_count == (MBOX_TX_QUEUE_LEN - 1));
>> +	spin_unlock_irqrestore(&chan->lock, flags);
>> +
>> +	return res;
>> +}
>> +EXPORT_SYMBOL_GPL(mbox_queue_full);
> 
> add_to_rbuf is able to return ENOBUFS when call mbox_send_message.
> Does checking mbox_send_message return value works for you?
> 

That is the problem. mbox_send_message uses add_to_rbuf and fails. But 
during failure, it prints warning message:

dev_err(chan->mbox->dev, "Try increasing MBOX_TX_QUEUE_LEN\n");

In some cases there are lot of such messages on terminal. Functionally 
nothing is wrong and everything is working but user keeps getting false 
positive warning about increasing mbox tx queue length. That is why we 
need API to check if mbox queue length is full or not before doing 
mbox_send_message. Not all clients need to use it, but some cane make 
use of it.


>> +
>> /**
>>   * mbox_send_message -	For client to submit a message to be
>>   *				sent to the remote.
> 
> Regards
> Peng

