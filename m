Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011002.outbound.protection.outlook.com [40.93.194.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8BC1A3029;
	Mon, 23 Feb 2026 16:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771862822; cv=fail; b=NHSeDyu3EnotM/XFOyUAoG+wg3i2bQ7+OyEuTpbXsO+O7LHy5looXNHSN4Wa5KB+YWwRt9L+cCiwaAURuk2MSskl2hnlnQh6RAy0VHoMfB4ceSe4aqsXo1dgLLu5mEGqrG9nMkTtSHBPoNbje6hZQXOFa/JRaUU9/n0rwZ21tM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771862822; c=relaxed/simple;
	bh=S3vIj1iQ/XmEM6IRIdct5wgj7pHMtK8swPjiL4WDkKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y1E3zKqeZqn3JOaS+eGkLKoTDKH2cTdbnP3S5Crz6LhFj2y6Zg9M5IQOQRePO36718thvLLSlAMiR/XzQktgtrLLFLHNFKg1xmffZ8PZPMY0VIYJv1JCfpPxzSLB6g0olu/fLFdriHY7bsOJe1OeBPRFnUmJn12bBFoHQv994as=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CKodaj9w; arc=fail smtp.client-ip=40.93.194.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CKodaj9w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RRyruYpe9avcZs38l8Mjd+ZHeoGCLjsEyDBuU0h8vrT0Js/oQy0NMWJaHU1VGn42fYIQv5boeuxlknJV6BmL55atLhsKDv9KM8g6Nb5gB0fJsHbM2Hk3Kavh7fi8IAS68SaBOwM9PC3iqjBsqh8uPyPKRO90KA2hQrSFtHe1jQW17wUqKiZ6amfLQ+5ML7djjL2/5BA7Kd8POhE8J0ocxyt/hi78Jqzwk8Rbp3iuftkfON/guQgulFQizIMz8bjB+6oGaMMwhoXq4gIONxon6pkOWmK3TQYmPeAIQMA2qFpUhS5w0YbxApzp9yD9DeMOsVOweFRRflN+xu723cx0nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZmj5ht5Sl1lrxEiWgxsiH9XhwMD9s/g499z/TZT2FY=;
 b=acnEgUd0hy+GXu35xYieptNWK2J6gG2IShfRqsgJteYwT9zBId133QQ/VuTLj1g6cZCE3HGMtU6kg4WLe8nVR75ucUFHy2zRyU5RU/2/s90VHrxuR8jxbyoytYdv/C1F29tTYB9AofCcXZfq5ixxqOtBhsYNydEvgRCoaVLwJfpKRzezQTgXTX4ao9qBkmAfe81whe3/SIX1DRhwcklYeTw4YlyNvceXxJAhFz/hsQd9C5IoB7QciUyVxtiOcFhqpnXWoD8ntr7I2/kEVrfdSE1EK7Njtlgj4ylC4BkD1keHTAHkA0/svTWpoZYoric9e0ktCVRoQT4yCbkMKwnxgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZmj5ht5Sl1lrxEiWgxsiH9XhwMD9s/g499z/TZT2FY=;
 b=CKodaj9wgGODGWDby/Iv/S2Nxl+tovXxugfXOD+HpUtTGL+iVIOGCSswhxzVw0jV4y0M8JndJUsnHqbo12zOPXecih3IL++0JogX88dYpJlnYxllW8BHiIKXy013Dt3ZYdCUb9W/Ntnn+Xeteb641oYV+1i43duxUfhQ2xuF5R8=
Received: from BN9PR03CA0625.namprd03.prod.outlook.com (2603:10b6:408:106::30)
 by SA1PR12MB7128.namprd12.prod.outlook.com (2603:10b6:806:29c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 16:06:46 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:106:cafe::9b) by BN9PR03CA0625.outlook.office365.com
 (2603:10b6:408:106::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 16:06:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 16:06:46 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Feb
 2026 10:06:46 -0600
Received: from [10.31.200.39] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 23 Feb 2026 10:06:45 -0600
Message-ID: <0ee57297-cf34-414f-9f5c-acc3f9b99a92@amd.com>
Date: Mon, 23 Feb 2026 10:06:45 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] mailbox: add API to query available TX queue slots
To: Bjorn Andersson <andersson@kernel.org>, <jassisinghbrar@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<tanmay.shah@amd.com>, <mathieu.poirier@linaro.org>
References: <20260209234430.512492-1-jassisinghbrar@gmail.com>
 <jo4kugxook5b6fl7ifh3nuznehotkyqwnrgwq3olank7cvzhmj@hj5ibm3bbsln>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <jo4kugxook5b6fl7ifh3nuznehotkyqwnrgwq3olank7cvzhmj@hj5ibm3bbsln>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|SA1PR12MB7128:EE_
X-MS-Office365-Filtering-Correlation-Id: 234ef0c3-b9f1-4859-0f6a-08de72f58b71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWR3UVNEMW90NXlZQlpGaTVJeHV4dFE5U0pxcWp2NmFXelNYV0lDK3pZQjgr?=
 =?utf-8?B?eWVEK1hDWWt6emxrQkRqUjJ5Nkszalg3RHZBejVsUzdSR2MwMGcxS2Q0a1BK?=
 =?utf-8?B?MEVRUHpJcnQ4TUo5U1hSTTJoNnNyL3BLYWV3SnBPOHZDM1JqZVk1cmtZTHBZ?=
 =?utf-8?B?MnphdUVzdlVyOEZYVjVjQXo4RUJvYlN0cmozcXUxLzFOMDlPRUprbEFQdjVt?=
 =?utf-8?B?ZS9Vc3NPN0h3aVRrRFRQdEJRVG80NDl1c08yU09UMGEzVWZTUm5kWkIwWXRK?=
 =?utf-8?B?YkNOWmllcklveTVCT21UUGd6eVYzaXkyZjM4Sy9DZWpwZkJXV2c3RGgyakJQ?=
 =?utf-8?B?UjNteVhtUUVaTTBRV2l3TVl2MlRJUGFPU1hjWFArZW5GS2M5eUc5Tm5uSEI3?=
 =?utf-8?B?Nnp2ZjF0TDR1cEVoTDV0VTRvSTZnZUxYNlNIWVhJa2J3T01OY0ZlQmE2ZHVZ?=
 =?utf-8?B?bjE5Tkh1WE45NUUxeTlqSVdrK2w3U0k5c3BkOVhienVKcXQyWjVtSm9USjl2?=
 =?utf-8?B?cGE4dE9UOWxETkJxN1NKRmRlRmJYcVEya204dytBMWNHa3JVV2orT0p1THhj?=
 =?utf-8?B?UUdiaUNKckx4T3NEaTROdTlhckRnbjBzdzA4a0pIM1RCaGptT3JmNFI1THpl?=
 =?utf-8?B?RklhTXNnS1c5YTkzUnBKelZuRDFkVWc4eVBGeVM3NDFVbzZQQzR4WnZCa1Bu?=
 =?utf-8?B?NHRJbUJVdlBsalpPWExpZlVrYXJDdks1dUd1amNsaHVKU2JNTUk0N0RlZ0tQ?=
 =?utf-8?B?OTNFUUJhcWdSVTdOd2s5QlB6Q2FLQzhxQUlxSEFvSnMyK1oyUWFKQnMzMFFQ?=
 =?utf-8?B?aTJLS1Z6YTdlOXR5VnRiVTBQM3hxZytJalprL3ZSOUpwSDR4K0p6NEhyOTFl?=
 =?utf-8?B?RmRkK01XRStmd0YzendlR2RDMXQzZVpBdWpaMHVmK2pMMzRGWDIzMTdxcHBn?=
 =?utf-8?B?cFVGZkQvWUxXZmErT201R3BoUjRPQXByZEhmWStPWGprUGVQQXpxTWUrOUo2?=
 =?utf-8?B?dnhPSDhpQmZjMHprejZ0TE1YOTJSUjFMZW1BMUdscitvWFB3Y3RCQ01ZTXky?=
 =?utf-8?B?Tm0yNGEzOUY4NnlBVEF6YVJSNnZvS0Nqb0ZTb0VjRW83R3RyZUhucGlJSnZG?=
 =?utf-8?B?VXB2eWNvK2l2MmtsWnFEOEFXMVpUNHMrdkUrM2dlY1lROFZBTUVZNTFVZ3Bk?=
 =?utf-8?B?RWFGZFllZmpRMk0rV0NtaUdDNVpDYUd4eFVPMGw2OTU4YUVNRTR5TUYrUW44?=
 =?utf-8?B?MjEyT2NoRGFBWjdhL0Z3ZXkvV2pwendEanpobmY0YW9TT3lITjFWNzJ3ZmlH?=
 =?utf-8?B?aHp5NHdoc1k1T1NvTnF4aFVXcWVLTTJpdXdWbnVxc2tleWt0cndZUlFRcW1x?=
 =?utf-8?B?Z3FJd2dwYTBaMTdPWlBuYVoySFNrU1FGMlo1QkhPMkZyRktLTVcvSEljZFpP?=
 =?utf-8?B?aHVRUkU3VjFFSGIydDg5UlpvYUpUblpiaVVrbXlaRTJRUEhycnlLUEYra1Ft?=
 =?utf-8?B?SXNQUVhXVzBxT2w4U3NNeTlML3FrQmZCTGJQdHNrR3laRS9TRmFRWnZRNGd0?=
 =?utf-8?B?dVFWeWVqUUk3b0hta3Vkemx0eUZlQ2gvc09kWmdyazllWXlXMjRZcm9odVdv?=
 =?utf-8?B?M3dDUjhhcGN5aXFuTGF1T29ua1BIdGdidFBycFBoUjlNWHF1RGRSNWN3MGNM?=
 =?utf-8?B?U09ESG9QclpuWSs3a3p0TTlyU3hMMmpTaVVyYzVWNzdYUFYycU40emlHakgz?=
 =?utf-8?B?UHlUZlhFekJ1TytPMXhka1BrSnlTWFhBNURCUEdyVFZmRG5xQkVYanpXSENU?=
 =?utf-8?B?YU1zc3gvODYzMnkxeXpmNlFDSUFocHJNNElBVGdrbFZBWkwwUjZwbENjQVlS?=
 =?utf-8?B?SXMxUUE4VGpsazdHb3BYbGJmVTR0TTlkTVNrQlRaMlNwY1RrK2NCTG1YTVlk?=
 =?utf-8?B?S29qNjFrRmhZbzA2MG1zblMrZ2gxYWEwWjJJc2txMmpablg1QmtkekVvejVL?=
 =?utf-8?B?TWVjR2s2L2NyMWs2WEZTY1BEQkNpSENKUGJvSk1RL1FmOS81RlFlRTcvWlFo?=
 =?utf-8?B?RWkvK2p4Q28vL1hJNGQxSmlnc1J3VHBYVXRRZmtNd3MwUzE0a0lVRVdkaVYx?=
 =?utf-8?B?Rlhqaml2V1lvN2p3cmNEVkE1RDRKdE1mOUhzOEJnTEFSRENQejZIMzJmM25B?=
 =?utf-8?B?SGpjYkw5aUJKc2owT1V2MWZ4WWhhNkZ2QzR1OUlkL1NEb0ZaWkNvSEl2VUM0?=
 =?utf-8?B?RWxlMGR2c00yaTdCQ2MvWkpxMFZnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+B2MNdROlSzc9diOUeW9SPbuEB/jSJTmiMN7ReycgAaDlugYyeY3rrSUGpnK4lTbo1jhSEClewgTJaSf2j1xG7mBUjtnkQ4iXBLxZgTcuhhsU6ISXsvjHb39CD28u5pVX0OB5kseTF8jKrU3+Latp5lE2IesNvRvh3rW/wLNCUAYBwXcPr8unrH7UFYB9iaCkyONI4+R/4DD5pJ5EEMvm7BOeG4jG8RYP3rvhnTvNm9/tF/WrorgvDvjvyWhjyk0rCTwQx8qzSwnj5lRLIpttrC/yalSMSY7sPMylAlpMSIKnwjJ5BRJ6s9KsG2OyLIsPJA2A1Jvt6Q7W/UJrn/pfgIorKpt0VPZopBr+fAwVhIl1WHxDMINdw8jllhgXb05KhbdPvqtPuhrJrkQB/pelRYTmaDVyOkEVOLN8GvgU10vcHDA8C9vEEmHyn65CeHh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 16:06:46.4751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 234ef0c3-b9f1-4859-0f6a-08de72f58b71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7128



On 2/23/2026 9:29 AM, Bjorn Andersson wrote:
> On Mon, Feb 09, 2026 at 05:44:30PM -0600, jassisinghbrar@gmail.com wrote:
>> From: Jassi Brar <jassisinghbrar@gmail.com>
>>
>> Clients sometimes need to know whether the mailbox TX queue has room
>> before posting a new message.
> 
> This is rather vague, could you be more specific?
> 
>> Rather than exposing internal queue state
>> through a struct field, provide a proper accessor function that returns
>> the number of available slots for a given channel.
>>
>> This lets clients choose to back off when the queue is full instead of
>> hitting the -ENOBUFS error path and the misleading "Try increasing
>> MBOX_TX_QUEUE_LEN" warning.
>>
> 
> In the event that we're using the mailbox framework as a doorbell, I
> presume that the queue is full of duplicate rings already - so backing
> off it perfectly fine.
> 
> But in the case where the client actually uses the interface to convey
> data, what is the expected way for the client to know when to make
> another attempt?
> 

Hi Bjorn,

Thanks for the reviews.
As per my understanding client would have to poll this API and make sure
queue is not full to send the new data.

Polling can happen at regular interval. I think mbox tx client data
structure can set interval time at which rate the next
mbox_send_message() will be called if queue has data. Client can poll
this API at the same interval. minimum time is I think 1ms.

I will let Jassi add more to this understanding.

Thanks,
Tanmay

> Regards,
> Bjorn
> 
>> Signed-off-by: Jassi Brar <jassisinghbrar@gmail.com>
>> ---
>>  drivers/mailbox/mailbox.c      | 23 +++++++++++++++++++++++
>>  include/linux/mailbox_client.h |  1 +
>>  2 files changed, 24 insertions(+)
>>
>> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
>> index 2acc6ec229a4..22eb8f3213be 100644
>> --- a/drivers/mailbox/mailbox.c
>> +++ b/drivers/mailbox/mailbox.c
>> @@ -218,6 +218,29 @@ bool mbox_client_peek_data(struct mbox_chan *chan)
>>  }
>>  EXPORT_SYMBOL_GPL(mbox_client_peek_data);
>>  
>> +/**
>> + * mbox_chan_tx_slots_available - Query the number of available TX queue slots.
>> + * @chan: Mailbox channel to query.
>> + *
>> + * Clients may call this to check how many messages can be queued via
>> + * mbox_send_message() before the channel's TX queue is full. This helps
>> + * clients avoid the -ENOBUFS error without needing to increase
>> + * MBOX_TX_QUEUE_LEN.
>> + * This can be called from atomic context.
>> + *
>> + * Return: Number of available slots in the channel's TX queue.
>> + */
>> +unsigned int mbox_chan_tx_slots_available(struct mbox_chan *chan)
>> +{
>> +	unsigned int ret;
>> +
>> +	guard(spinlock_irqsave)(&chan->lock);
>> +	ret = MBOX_TX_QUEUE_LEN - chan->msg_count;
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(mbox_chan_tx_slots_available);
>> +
>>  /**
>>   * mbox_send_message -	For client to submit a message to be
>>   *				sent to the remote.
>> diff --git a/include/linux/mailbox_client.h b/include/linux/mailbox_client.h
>> index c6eea9afb943..e5997120f45c 100644
>> --- a/include/linux/mailbox_client.h
>> +++ b/include/linux/mailbox_client.h
>> @@ -45,6 +45,7 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg);
>>  int mbox_flush(struct mbox_chan *chan, unsigned long timeout);
>>  void mbox_client_txdone(struct mbox_chan *chan, int r); /* atomic */
>>  bool mbox_client_peek_data(struct mbox_chan *chan); /* atomic */
>> +unsigned int mbox_chan_tx_slots_available(struct mbox_chan *chan); /* atomic */
>>  void mbox_free_channel(struct mbox_chan *chan); /* may sleep */
>>  
>>  #endif /* __MAILBOX_CLIENT_H */
>> -- 
>> 2.43.0
>>

