Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012027.outbound.protection.outlook.com [52.101.43.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B54E2FC02A;
	Wed, 15 Oct 2025 15:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760542031; cv=fail; b=ThnoMWbM9MAvsnKWj1X/HxRwv0Ft8CHBm3IgZvLPhhz48QtlvDM/L6/tL0I8442sLVXeHUCYEwdNMM8vRMvNoH0+oIvzm/a9oK5Tu/YcSl4IGkAJS7yUZOdwfFMDiSOEwLhJwr8HFWqbst4qgocBcqBTNnSi0RQPKb+lMtgYZKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760542031; c=relaxed/simple;
	bh=zecaIccjbK4JdQerGXq6zNDSHFyt7PEkfGDQ9DrzKqk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=an1GSJPvXP+qXPnC6NctBav20zxzaH9vHSgNbIVanDr7TVVDSkPgFt++psgRnMaFoAhhUBn+XQSqvbqvp+aY6Z73SHSjH865TzRHTYA8hWvx3FNcwvkhlH/OgbiUFh6gN9UdpVgnClcFheGUerKqrveIsJ6HlrttOiclEiAYjNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Twvigzer; arc=fail smtp.client-ip=52.101.43.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Twvigzer"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8M3i8GFqwE2L2acGQE4a4tzP0oK/4hzdK7kbYHIeyRDRrFtGyrQrqGugybE2L5jmx/EjmgStCZMA0v4mBn5xfeQMtVbosiXlKYVQCBWcBnF4TdwuwRGod0wiPfR3S+8GpkwRFOfEroCgf1MO7GyKnC536TTTc2YyL7at373wwrIqM/3+f91ePYtsnwiKjGQxZ9vhhx9+maQCbCUFcWoBrFIECcFaNWljuS9Wf+L9FO0ENUKZTyOKXcW11k1irtcTsLUL5rnucDv+VEMf+snJOtebAo957pjGHpZGNeEboUBOp0RcnczJWITdOFN8MiG9NCcuJeB+PK+rdrUz1w0QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nKq2bP/bnT3AYB7jTynSbiYezgM0D3ik+z0eN07jDo=;
 b=PTnHCOS9BhrTpwq5F1OYPPLKxhuBzifEVSWOHVnp2LclREFtctuN1yTISceTpiSvdm3voumWKa802fLbbX9iJkuF4i4mc/RJrKJwknBpD89hxeYXzSUoF95q+d0r9em5q1p5fbiknPxLjmSvZq7aLY8H5WYgt+PEiGHxo5rv9zx/bqF2dGlm1lcXkuCLmoeZgqUVmXGT3zbXcUD7UIp/bfBNLe5jrzDh1HcT3NY65pV4F8ZJfJMutahtr5Z1bb2FnhvjFxzHBeKAa3gX0F5hhKRN42wFwCoaY6K1mEVbOltrjSvDy/bIOEnQ4T/RyP6DMISUNe2nF0DCMHD4WMIeuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nKq2bP/bnT3AYB7jTynSbiYezgM0D3ik+z0eN07jDo=;
 b=TwvigzerubUNtcQQxYoveklkT52lM6qF0lxnQ79Fa85riynCaFQIs0pBSfwbejrZUULbsKvoVeijD8Z8JBFZswf1viRie7znVIsl0f8/iUr4VqPyuEsr9YQhOVRMCmpGzCm+mu0aqLCGRCbyi6Wr4v4e3at5gOCaGEBWUIBaQCI=
Received: from BN0PR04CA0069.namprd04.prod.outlook.com (2603:10b6:408:ea::14)
 by MW4PR12MB6899.namprd12.prod.outlook.com (2603:10b6:303:208::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 15:26:59 +0000
Received: from BL6PEPF0001AB4E.namprd04.prod.outlook.com
 (2603:10b6:408:ea:cafe::34) by BN0PR04CA0069.outlook.office365.com
 (2603:10b6:408:ea::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.12 via Frontend Transport; Wed,
 15 Oct 2025 15:26:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB4E.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Wed, 15 Oct 2025 15:26:58 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Oct
 2025 08:26:58 -0700
Received: from [172.31.8.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 15 Oct 2025 08:26:58 -0700
Message-ID: <33edad1d-08b9-4fe4-8525-a1f50a898e2f@amd.com>
Date: Wed, 15 Oct 2025 10:26:57 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v2 1/2] mailbox: check mailbox queue is full or not
From: Tanmay Shah <tanmay.shah@amd.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20251007151828.1527105-1-tanmay.shah@amd.com>
 <20251007151828.1527105-2-tanmay.shah@amd.com>
 <CABb+yY0m_Whm1F7d2ub+vhn0eTb47UC9g=JvpLnWh-2E1oo52A@mail.gmail.com>
 <aa1ff206-d505-433b-9715-56d866a5f675@amd.com>
Content-Language: en-US
In-Reply-To: <aa1ff206-d505-433b-9715-56d866a5f675@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4E:EE_|MW4PR12MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a98b7b5-c762-4654-b294-08de0bff4848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGRiejBnblpiZmpyQnhheEdtWktYMXZ2bzZDNlEzcVE2anRnOTl3Z1E0OTkx?=
 =?utf-8?B?N0lQYkJpR0xjQVpNOVQxVStOLytHRmxkWkVmcFpCWnRqT1gxU2JGcWtmb2l3?=
 =?utf-8?B?MTVRcFJ1MGdVbEMvYThrNlYwTGwwMU0rRm9scVBKTFEvRWcrcWc0RUZISm0y?=
 =?utf-8?B?NkplSlk1a2J1cWt0azVJR1Fpd29xSlJQK29tbTc3WmJqN2NIb1d2UWt4bTdz?=
 =?utf-8?B?amZuaitGOGR2N0xzdVlJMVpkeDZRbzJBbFB3cTY1clhrOFczNkQwZmZadk54?=
 =?utf-8?B?dmtab3k1aWxLeGhGUzBCbDFtMHUyRGV0dWZIWG1sRnczem1RdndlbVJnR2JP?=
 =?utf-8?B?NmxtbzZOckpLTnZlNmhzaHBSQVdiZUt6SkZqOGdOaDgySzhFcVZENWs0Tzcz?=
 =?utf-8?B?QlFxK0s4dEJhWUdDU0s4NmVOWm9YYU9VRWExVTlEMEpmWW1UWU1xVHJUL0Zr?=
 =?utf-8?B?WlpCSDI3S2kzckVKMy96cnRrc1hzdEYzaUdEdk5qbTR3aHVudUhyWGZWRkln?=
 =?utf-8?B?eDZRMkc3RHR0c2hLUnFLTGM3R0ZIRks3a05LWkUvT3JteEZJL24yamIya2Ro?=
 =?utf-8?B?S20wa1pxQmtzaHU0WDFkMDFJVEtSdUJQNmRnLy9HN1YwVmkxK2dCMWdGaEJq?=
 =?utf-8?B?dEV6VUZxQ0c4UEUxenc5ejBOMlovTXhNN1YxL0d6SWVVQXVjRjNjRzZUSnpl?=
 =?utf-8?B?QnlDL2VWektMNUdIM2p3bmRsTFVCRENlVnJHOStNdU1aWUF2VnhVSFRZazdJ?=
 =?utf-8?B?d0lEL0VLdFBmeTVtMXJpVUxBS2s2ek1OMWZEVVVMc0FsWm9lZlExN0dwSWdr?=
 =?utf-8?B?RkZCelFqKzBRNHBzdlNwWUg4VEI3L2NDOTNDOTlTdnllUno4UkdreUIrWGdi?=
 =?utf-8?B?MTFzcmVvb0VZY3pHOGdWQkR5eUJKTzFGZ0pTOFlKUi9KVUg4OUUvWkN3cXVS?=
 =?utf-8?B?RCt6TE11NFA4RDRlZ2RlSWxkbVFYekhaTlJpUHlPZDJBdjIxUU9pWEdkQmhp?=
 =?utf-8?B?TFB3NnFYeldUNlBMSWhaUnptTTFuL2dGT3V3M0FwbUswRmE1ZFVqWllrMkVF?=
 =?utf-8?B?eFJEZUlEM3pqSGp6Y1lMaU85ci9ieUNGelRhQnJ6VlpCMytCeGt4Y0tpODNs?=
 =?utf-8?B?SWp4Snl4b3pZVjJrVm1wRGVIRC9jZUNhM25nWlNvT0cyanUzYlNLdmpDRC90?=
 =?utf-8?B?Z2dyK0tBUDkwcFY2Zm5WREJ1cnVZQjZ1dTBMeDFSY1k1UXUwUmNqMUNWWlRG?=
 =?utf-8?B?dzV2TjM4TEtrQnZhUzg5TTdreFN6a1ZHTytXQUk5dkJQZ01hSUtQZXdFdGFZ?=
 =?utf-8?B?ZG5FU0VFVkxSYlE2UEl4M1RoMERGOGd5Nnp6cmJ2YzJkK1BNVkE3eVpXdnl1?=
 =?utf-8?B?Yi9YcDF0QlQ5czVHNlhZR1N2cTNlNis4eDhDVmdqc1ZmN0RCVjZEUzFwSmth?=
 =?utf-8?B?dEplalBoWVJIaERJbU80a1Y4a3VhRVdLSkppYmdORko0QmxXVFFVRTJacXFw?=
 =?utf-8?B?K09NSW56dE0vVEttZWNETzJJNVpxaGRFY0JZSktXMFUvQlRZVUlsanRTZWow?=
 =?utf-8?B?Sjl5OGVTOUlxWnNlWnVwOE9zWnlNZXg2M21uT3hITWZGUGpXSHFiOW51c3JX?=
 =?utf-8?B?OE5OSkFXK1ZPNDdVM3BmRWcxeXZWM1NXVENuMlhzM3k3aTRQVURtR2lISDZh?=
 =?utf-8?B?aisrN0FGY2JUTkY3MlBFZEl4OEFjMkx6Sm9QMVRlU3dDejVGdGxUNTF3Y2RZ?=
 =?utf-8?B?d2M5VER2VXdFSnA5ZWVXTDFyUm5vd2dxckRQRXB0NlBRNTAwQS9XazNYb2Y0?=
 =?utf-8?B?SHE3NWlWbUlUUnFTQy9GalBtaWRzd0ZoVUxsZlpIeGlyRWdTdkVJMkJQV2xY?=
 =?utf-8?B?bzZpZnNoUlp1aGQwNk81VzUxZG51bzdISmFCcGlDaXlkU21xeE9vU2RtbGl0?=
 =?utf-8?B?NlhSdC82azhydzhBUHd6dXFZZWtWWTJSMlZTTEFZQlM1OS9GVGdnU1RaK1N3?=
 =?utf-8?B?NEhPdmQ1a1pqeHNPZDVsRnBZZ1dpbS9ybGN1Qm5IZllyaGRsUjZVTUZWSml2?=
 =?utf-8?B?VjFoeE5WN2JmWUZoTTdXblBLdCtDcHIyYWptYmFsZ25PYlJlYjk4bFcydGt3?=
 =?utf-8?Q?74PnkyNNjooHJTvaFO7Fs07Tj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 15:26:58.9987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a98b7b5-c762-4654-b294-08de0bff4848
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6899



On 10/8/25 11:49 AM, Tanmay Shah wrote:
> 
> 
> On 10/7/25 2:58 PM, Jassi Brar wrote:
>> On Tue, Oct 7, 2025 at 10:19 AM Tanmay Shah <tanmay.shah@amd.com> wrote:
>>>
>>> Sometimes clients need to know if mailbox queue is full or not before
>>> posting new message via mailbox. If mailbox queue is full clients can
>>> choose not to post new message. This doesn't mean current queue length
>>> should be increased, but clients may want to wait till previous Tx is
>>> done. Introduce variable per channel to track available msg slots.
>>> Clients can check this variable and decide not to send new message if
>>> it is 0. This  can help avoid false positive warning from mailbox
>>> framework "Try increasing MBOX_TX_QUEUE_LEN".
>>>
>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>> ---
>>>
>>> v2:
>>>    - Separate patch for remoteproc subsystem.
>>>    - Change design and introduce msg_slot_ro field for each channel
>>>      instead of API. Clients can use this variable directly.
>>>    - Remove mbox_queue_full API
>>>
>>>   drivers/mailbox/mailbox.c          | 3 +++
>>>   include/linux/mailbox_controller.h | 2 ++
>>>   2 files changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
>>> index 5cd8ae222073..c2e187aa5d22 100644
>>> --- a/drivers/mailbox/mailbox.c
>>> +++ b/drivers/mailbox/mailbox.c
>>> @@ -35,6 +35,7 @@ static int add_to_rbuf(struct mbox_chan *chan, void 
>>> *mssg)
>>>          idx = chan->msg_free;
>>>          chan->msg_data[idx] = mssg;
>>>          chan->msg_count++;
>>> +       chan->msg_slot_ro = (MBOX_TX_QUEUE_LEN - chan->msg_count);
>>>
>>>          if (idx == MBOX_TX_QUEUE_LEN - 1)
>>>                  chan->msg_free = 0;
>>> @@ -70,6 +71,7 @@ static void msg_submit(struct mbox_chan *chan)
>>>                  if (!err) {
>>>                          chan->active_req = data;
>>>                          chan->msg_count--;
>>> +                       chan->msg_slot_ro = (MBOX_TX_QUEUE_LEN - 
>>> chan->msg_count);
>>>
>> No, I had suggested adding this info in client structure.
>> There is no point in carrying msg_count and msg_slot_ro in mbox_chan.
>> The client needs this info but can/should not access the chan internals.
>>
> 
> Hi Jassi,
> 
> If I move msg_slot_ro to mbox_client that means, each channel needs its 
> own client structure. But it is possible to map single client to 
> multiple channels.
> 
> How about if I rename msg_slot_ro to msg_slot_tx_ro -> that says this 
> field should be used only for "tx" channel.
> 
> Or is it must to map unique client data structure to each channel? If 
> so, can I update mbox_client structure documentation ?
> 

Hi Jassi,

I looked into this further. Looks like it's not possible to introduce 
msg_slot_ro in the client data structure as of today. Because multiple 
drivers are sharing same client for "tx" and "rx" both channels. 
[references: 1, 2, 3]

so, msg_slot_ro won't be calculated correctly I believe.

I can change architecture for xlnx driver i.e. assign separate clients 
for each channel, but still it won't work for other platforms. Please 
let me know how to proceed further.

Can we provide API that does (MBOX_TX_QUEUE_LEN - chan->msg_count) == 0?

I am not sure if I should attempt to change the architecture of other 
platform's drivers.


References:

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/remoteproc/imx_rproc.c?h=for-next#n768

[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/remoteproc/xlnx_r5_remoteproc.c?h=for-next#n280

[3] 
https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/remoteproc/st_remoteproc.c?h=for-next#n386

Thank you.


> Thanks,
> Tanmay.
> 
>> thanks
>> jassi
> 

