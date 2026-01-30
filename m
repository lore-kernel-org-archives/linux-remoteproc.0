Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013051.outbound.protection.outlook.com [40.93.196.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4841315E8B;
	Fri, 30 Jan 2026 18:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769796806; cv=fail; b=pmT/JDXL3tjU+d1xBpdHtQIJ5laOqjZvadKQAehkp6psNLI+f0QLXBu3HCLifFs+UTPMhghnMP4HwqGlf6wMiij4pRoCYAc/fc0zIHjpDyv35uObNJWFF3KI8JkS7hXeXOt6DYvgsyLO0tXBr8zQ5DaKptkz5nBCDXsix1I2tDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769796806; c=relaxed/simple;
	bh=1Mt4bXrqsTRQ/dV1ZFYCDh086uBrxmbK7PataP9gfYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rmN3bPl+XRGwvQwlAKCgBYVLGTqHra32uCFPuY6WzV0/+pbIAlZELlaMvEuNh5aqVaVws9v9xBDuq5vLtmp0PqWF6iuGpPI6x1J57rVLerfs/tIMwZ7Au6GBHDzyvKQhsOvCQMj+3w88IK301T0UYgPqnB3Ole5jdZgxKhiUl4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zVskSfND; arc=fail smtp.client-ip=40.93.196.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zVskSfND"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8rCzwd1ORy6IIsYb9QH2OzrTgfnhYfcWvUUzUYw7wTSWsusNX5w953pfyz8pWOmeGtzsFtQ8lrpcIB++VrKzhEItqNr2iqSpstze0ehKi14Pg6tgw93f0cvuRu0FkyGhOcqWWjCe7MCG/sQMIwI6WHOLRuNWPN4zeXlEBo4ptXtX/yTusEntZCwWZAfItX8jhVqoX9iEHuOvJeV4Xjqf3J66c98I+FSWfiDycyttt2JLgDb3Wn+nl+2ljApibd/0aE7rYZZdsoTXNGo0mI1RXYKLT+7U3yVRpJNTgR3I2uGt7tV65zT/UKEJkWFslWcGEtWFJWZK+GvHjgAai9xUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xXLE7s8htrwKIF28eybGvCjwCWjq2eN/nNt8N1kiqQ=;
 b=lrVTHsWkKGInCTWdbJfqu8eBRFpzpH04hbv6LKoiPt0u5EWD4YjLkzbGzH0+xDPLye/mrGzPRIOtOhbD78OfFZ0s7to69hjpFpRrQYcvwhCBoRNMXhoP7Dken8c2hr8V36O0vOrdLlznaETd6o4RHZANGslj1ZM/Yb5ZErqigTeyRr05ipM569jGgaX8QuUpo5XVnOJ4+Xfe/yeAPYoKUKwujg1qbH+1lin8cVp+Ss7f5olatealebEGRPd9qGXIGmEx2/qL59Hz1X/4OEaCrRCWjLK2e7+AC7FTYwChNImXAUkkEHfD5HR5qDmMBeL5fzAaMMsec0lvRxIzbckwug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xXLE7s8htrwKIF28eybGvCjwCWjq2eN/nNt8N1kiqQ=;
 b=zVskSfND78hJJglH6CfcbD4JG29U65cAJ4gpTfu8WngzYa/6pU/S6jveKaQiQVXO1l7AdkkNNOfV0IkRaacaL0YqqC2qKWWU/9XsB3qfvkfacXmCmCdLGTJLMUmN5O6nNXQet3qalSzTLnn2heIqwJHeWBtpDARMlvoh1VCEM+o=
Received: from MN2PR22CA0012.namprd22.prod.outlook.com (2603:10b6:208:238::17)
 by MW3PR12MB4475.namprd12.prod.outlook.com (2603:10b6:303:55::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 18:13:19 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:238:cafe::7a) by MN2PR22CA0012.outlook.office365.com
 (2603:10b6:208:238::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Fri,
 30 Jan 2026 18:13:16 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 18:13:18 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 30 Jan
 2026 12:13:17 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 Jan
 2026 12:13:14 -0600
Received: from [10.254.48.177] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 30 Jan 2026 10:13:13 -0800
Message-ID: <75024300-f576-4f06-83a7-6f0c424e6fc7@amd.com>
Date: Fri, 30 Jan 2026 12:13:13 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v3 1/2] mailbox: check mailbox queue is full or not
To: Jassi Brar <jassisinghbrar@gmail.com>, Tanmay Shah <tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20251217212728.1540043-1-tanmay.shah@amd.com>
 <20251217212728.1540043-2-tanmay.shah@amd.com>
 <CABb+yY0b+UOqLgmVz+T-e_zxYJ=sLcMA3um6q8EVOQpnB=L3Hw@mail.gmail.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <CABb+yY0b+UOqLgmVz+T-e_zxYJ=sLcMA3um6q8EVOQpnB=L3Hw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: tanmays@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|MW3PR12MB4475:EE_
X-MS-Office365-Filtering-Correlation-Id: f98441ce-dcb4-44df-871b-08de602b3ea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmpVRkxwWVdjV3ppMEcvY21OaUYzQWhwUHRHWXFzR05ueUlKNjhmYmFRcXBj?=
 =?utf-8?B?LzhQcllRbmY0bmJFZzNCYWVZQUxScTRoZFNTVmJtZDVJSU1HT2ZPb1I0K2F3?=
 =?utf-8?B?cklPRUMxMGk4dlFPM3JjM2VjQ28yQW96K0o0b2o0SmtCTjRnRnRqeWEvQkR3?=
 =?utf-8?B?bFhTMVNKaUJGN20wWmFnTE1mN2xIMHJpNEg4S3lLYTRrcm45R0J0MEZ4aUdP?=
 =?utf-8?B?Ujc1UXFNTDY3MW5CQXFsV3FHTE5YSVorWkJXcVVBenNNaDErTkNoT01CTFZj?=
 =?utf-8?B?Uk8vTVY1eEM0TjhZS0RTY2hkWU01OFFRdmx6WDZFcmtSaEpubmZlWWNZRHE0?=
 =?utf-8?B?aFU1bnRoRys1a0xPa2tReklNdjVoU3ZZTFdya0QxdHRzUk51SlNURmliTVRC?=
 =?utf-8?B?L1pmSzJRSnNCc3k3MnovVG04UnRFSFd2ZURUa0lmL1YzT1c2TXZ3RUJvZWxL?=
 =?utf-8?B?TnkvaG5jYXgvVmhSUU1HZmpna1g2TFFldWJPOEsxY3JNRG52cm1LZFpRMXZq?=
 =?utf-8?B?TGxuTThUUXY2eXJvY3pMTDhDblZCTEkzMXVZb2VUUmoxQytZY2dMRmdURElx?=
 =?utf-8?B?bmVmT1ZhNnBUSS8wY0hTaVNUOWZPTkFYVjh0WjZmNjZsR0lTOGtHMXErZWFN?=
 =?utf-8?B?V0g3QXdnRVdMZW56YlZMcDZxcm43czMwMjlrY25LbGpRUHQ2c09KWjdWdmdP?=
 =?utf-8?B?VlI1SnlKck9mcnQwWXFlbjZrUnIrSHZpNnYxZXVuYjdnS3NLUVdUanY3UGlZ?=
 =?utf-8?B?NGxjVzN5WXcrbWVpYmF4azE4aGxINTdEMmdpTTVDNWI4U1pGTjVna3oxT2lI?=
 =?utf-8?B?NEx2aUg1cE9aQ3AyZ1J3OGkvWWJxUFpGWU10djJOS1FXM1RCeHR2c2kxRkZj?=
 =?utf-8?B?c3dOcldjQm50N3hkRGNDUWFVQWxNUHRGR0tTc0M2UUdDKytRMFJ3Vnp2QkNW?=
 =?utf-8?B?UlR2dGJXUTRuWHErcDMvV3hNWW0wUTFhRGJMSUJEZ3kwZVluTFFjajRKQjhx?=
 =?utf-8?B?QTFld2VwRzczbGZqVHhQTVJKT2JpVCt1bUE3S0dCVzZzSkNrckUrQVB1R3o1?=
 =?utf-8?B?RW1zUlBKR3JvcmZKUVEzRW9xeFV3TXpFNEFYSFlXSEtqaHJETkVQTXc0Z2E4?=
 =?utf-8?B?eGVNNnc4Z085Y2JabTFZeW9xdmp1Q1FLUGRVTGgyb1UxaEZZRm9leFlibTF6?=
 =?utf-8?B?dDVTQXluY3c5YUdPNFNaY3YvYk9HT3I4K09jL3U0b3RRandRajlnTkhYOUxI?=
 =?utf-8?B?SXNMUVlqdEVKaGNnUVBVOEM4YWZSMUNPNUg5QiszUW1iakhaOWo3TlZMVzRr?=
 =?utf-8?B?WHZ2RWVVUlk3YlROQ0RoSWpZSzg5U0dQbHB2bjMrMUtydkg3dVhXTXh3Vmhw?=
 =?utf-8?B?alZYZU5EL0JzTjFNcDlhVTB1UjM2RVVTdnQ5bVhScXUxckVYc1ZGTlQxQ0pO?=
 =?utf-8?B?ZnNTbkNNY1ZkZ0ZWWlNDYlU0UUtnWEJjbjZKS3VvTWNiMmtkUUVUL1JwdG45?=
 =?utf-8?B?clZybFVUL0FMaldrWlNzNHFIOXB4ZXFWcnV3ZjBXd0d5RmpPYUQwYzBjdk95?=
 =?utf-8?B?S28zcHhNNkk0QldvbEtOSFRjejErUzlhQ2xYRll3dGpuNjNuZE1ZRk5McG03?=
 =?utf-8?B?QjJ0eTVSSUNtV1Z6ejY1a2kweXFkcmxBMDVuRk9ZMW1TQllLek5iZHg3SW92?=
 =?utf-8?B?L2M2MTA2L1hNamhVSXFVUFpTdlR1VDdJd2RSK1JUWXQwS3E4dW5qMnBMcnFr?=
 =?utf-8?B?anZnTm83MVdncUozSkJ1UTNSUC9SZ25Od1hIalF5MjNhRm9yNHdFdzVlQmpt?=
 =?utf-8?B?aVpMcGE3TU9MaVZRQ29JSXErK3lXWW9Pa2FKYWdkVTRDdmZiSHRLUnJycTBm?=
 =?utf-8?B?bUtaaUUwK0h2QlJDS3NLRkk3UEVWb3l0ZXgwUW1qdnRyMkM0MGh4akZtR2to?=
 =?utf-8?B?UXppUHJidmVtb3V1aCtpR1ZEYlltaGdoNldNaVNxUFUvVGhTNkwwUExoQXg2?=
 =?utf-8?B?L3pmejlTVGhMaXRGekxvbk1qY242eE9sdUhjcG9HOTZjQlhRKytzUjlSeWZK?=
 =?utf-8?B?VExPSDF6TDBXbFhQUjNITkZKSS8wTExFbzV4bVhjTWh4VEV0bTJhQ2prL2F1?=
 =?utf-8?B?K2tOckxLeFpuaGxBQ0lwdlRjeTY3UFdZWUpQaU4wWUNzLzZBcDdUbjB2b2RD?=
 =?utf-8?B?M3BMMDBXSklSV085eUlla3R0aTBxWSsrZ3hVcFAydTRiM3JmNFROZllGVGZr?=
 =?utf-8?B?dS9SZFZaWHhoM1ZNd2tZNUpPeUdBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	S9VoXg0zitquvxQzsNUFFOPOtTeT8PSX7m7jcgN4TVYD6z7PP4GNqCta9ps4I7ZGh17LGP05x8tozv2xM3NxGuBV7s0t6JJ+lpskpzFemT69TslxEVmdrK2Y1G4RSqRwb2OKhMhdxOFET0WtMc6SGrBKrEd9xY6jsv9ljaX+NmiNM0cVEzgP+KLLj5jcqbvg0SvgNLC2ImwzwYGMk2xQC1Tj2I0lGuYiX39Y7ok6N4nWWcZK7xSw7X7SBrCjNe9bIDJvqskE4n/toVZLw27LEnkuWIwl2j0ZO1rWUgE2cIbHlqBVzzjCrkl8J3rJZNkeS8ID8gED/T7t7ihCVV/8NwrOXfmZc6HMa2tHFyOs/Xc9vIEvDHqqFC8Pr31trnRglYCCRQVtAscFovxbOMImj1XPGpOdBfe0PzbFnE04Q8tCpAOl8esiSJj2LN8+zV4L
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:13:18.3783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f98441ce-dcb4-44df-871b-08de602b3ea6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4475

Hi Jassi,

Thank You for reviews.

I agree to all your comments, and I will address them in the next
revision. I am returning from the leave now hence delay in the response.

Tanmay

On 1/18/2026 1:53 PM, Jassi Brar wrote:
> On Wed, Dec 17, 2025 at 3:27 PM Tanmay Shah <tanmay.shah@amd.com> wrote:
>>
>> Sometimes clients need to know if mailbox queue is full or not before
>> posting new message via mailbox. If mailbox queue is full clients can
>> choose not to post new message. This doesn't mean current queue length
>> should be increased, but clients may want to wait till previous Tx is
>> done. Introduce variable per channel to track available msg slots.
>> Clients can check this variable and decide not to send new message if
>> it is 0. This will help avoid false positive warning from mailbox
>> framework "Try increasing MBOX_TX_QUEUE_LEN".
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>  drivers/mailbox/mailbox.c      | 3 +++
>>  include/linux/mailbox_client.h | 2 ++
>>  2 files changed, 5 insertions(+)
>>
>> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
>> index 2acc6ec229a4..b7ae5c173143 100644
>> --- a/drivers/mailbox/mailbox.c
>> +++ b/drivers/mailbox/mailbox.c
>> @@ -36,6 +36,7 @@ static int add_to_rbuf(struct mbox_chan *chan, void *mssg)
>>         idx = chan->msg_free;
>>         chan->msg_data[idx] = mssg;
>>         chan->msg_count++;
>> +       chan->cl->msg_slot_ro = (MBOX_TX_QUEUE_LEN - chan->msg_count);
>>
> msg_count is protected by a lock and limited within MBOX_TX_QUEUE_LEN,
> so how about simply   chan->cl->msg_slot_ro--;
> 
>>         if (idx == MBOX_TX_QUEUE_LEN - 1)
>>                 chan->msg_free = 0;
>> @@ -71,6 +72,7 @@ static void msg_submit(struct mbox_chan *chan)
>>                 if (!err) {
>>                         chan->active_req = data;
>>                         chan->msg_count--;
>> +                       chan->cl->msg_slot_ro = (MBOX_TX_QUEUE_LEN - chan->msg_count);
>>
> Similarly   chan->cl->msg_slot_ro++  ?
> 
>>                 }
>>         }
>>
>> @@ -321,6 +323,7 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
>>                 chan->msg_count = 0;
>>                 chan->active_req = NULL;
>>                 chan->cl = cl;
>> +               chan->cl->msg_slot_ro = MBOX_TX_QUEUE_LEN;
>>                 init_completion(&chan->tx_complete);
>>
>>                 if (chan->txdone_method == TXDONE_BY_POLL && cl->knows_txdone)
>> diff --git a/include/linux/mailbox_client.h b/include/linux/mailbox_client.h
>> index c6eea9afb943..a073fb0c03d1 100644
>> --- a/include/linux/mailbox_client.h
>> +++ b/include/linux/mailbox_client.h
>> @@ -17,6 +17,7 @@ struct mbox_chan;
>>   * @dev:               The client device
>>   * @tx_block:          If the mbox_send_message should block until data is
>>   *                     transmitted.
>> + * @msg_slot_ro:       msg slots remaining for this client's channel.
>>   * @tx_tout:           Max block period in ms before TX is assumed failure
>>   * @knows_txdone:      If the client could run the TX state machine. Usually
>>   *                     if the client receives some ACK packet for transmission.
>> @@ -29,6 +30,7 @@ struct mbox_chan;
>>  struct mbox_client {
>>         struct device *dev;
>>         bool tx_block;
>> +       unsigned int msg_slot_ro;
>>
> maybe call it 'tx_slots_available_ro' ?
> 
> Thanks

