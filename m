Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011065.outbound.protection.outlook.com [52.101.62.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E76257834;
	Tue, 30 Sep 2025 16:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759251181; cv=fail; b=KXgggDyQ31ivyht2ikmVQ5CFcvOUu8Uh8PvJrm0uBnDOlDP9bZzNR3W87V46ZFUPNR7ABsJlAtyEMOtg8gwL8J5CzOZivvu/Qa1h9snkFtoLvMAA+krgZjuwBaJRJ/+zrvV0nDGKF7j/Xl45hvLO4O8OedrZmTzc6DuFdgAy4L0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759251181; c=relaxed/simple;
	bh=l+FyipTBw1NI8enH7kQVu8DYovtW4WN7HFJZUpy2vKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Kz6We42k068JsggTkJ5F/wuooGhdvXVurdJQ8L4V/JEqjk1nI8RC1WoUDmQ2jAYMCltbaJ5wv1aEqYQCPMlwThCDIjVfHOPTZHdnqg8ONFalxFNzqSZu0Te4oF50Q20jRZsCJpA06Tav+VQLKegkFChNhdCbXY0MUyfgAameRhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WjTiXJmY; arc=fail smtp.client-ip=52.101.62.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WjTiXJmY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMkLlXhe787A8AuQs5VHQ6R/EY3dIT8lZl70XFU4dc86rXERJaNGYthaQQCf0cX2uvX0jRiyqdG+yRYyQJe0iG/SAhaqYqidMNB8HW2iLUZSXixn1TkprdNYCfCrvgTxDCpnPfiL+BWIeeAm6untHowdVR/NpfOtLfBlhM2YCeJUHO2eGbjsDvUx1rc8enQV/jzvvzYQVYm6ysV6lamtf6yn/k9ip5Bv7nh/25LkJzRxgPtig9PT5ydx1Qjare2KHXyLT1AUvSKsEg+01erj/N4ZeYZJsrefeP7lWR1qZbOc9Dh/G9FJxGj1gWxU9oo4HTuQGQbh9D7Q+aBicaUWeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62uWCLEx12dgHyxCw2QG0GnxEQ3Wi4Vj+Yr3rqYtaa0=;
 b=cpq1h/M4zwJhxWOOJy88PWqrdUnn0wIE91fbZUYGRNuV47hS+bymsUOaJduqozJX+Ds6qMv84YZkVSzNwCx+Oo2XaBHPmmGc0AA4F54Aw9LnK+Mm/kNbtjRY61JdWNLLjyZpu+QsVTrrTe2m44S8N6WiPcnR1T6XqKJjlEIsYxUOT2T+iKvbzZOLO5sB6kB9IVs4RkIbfKKQTXFpAG6/y7Jz5hwJ2SQAUV/7KGc1NQh+3bl/xRjpEgFpGhnJqbCmg9goiP0pmd3kW/DGM4WyLQ042gwWqF24wsR5/gjzwA4ZvKiVImQPJC3aiQlTr9KSccO0dBaJoshsBXlhl6md2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62uWCLEx12dgHyxCw2QG0GnxEQ3Wi4Vj+Yr3rqYtaa0=;
 b=WjTiXJmYE0CXPP0D1z6/g12OQFyydzryw/MEvNgFcdt0PAgUsaRxKuGie0iWN/mCqzKKSR0VVIdivunBFNJiZvg8yfRGY5VUPpLH0szgL5xieoHnUhcFZePXDaWBOZXPb7wnjJdX6NHZscDKMNijeWAnvsckaKRE6UxB4v7GWy4=
Received: from BY3PR04CA0008.namprd04.prod.outlook.com (2603:10b6:a03:217::13)
 by IA0PR12MB8895.namprd12.prod.outlook.com (2603:10b6:208:491::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 16:52:57 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::1c) by BY3PR04CA0008.outlook.office365.com
 (2603:10b6:a03:217::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Tue,
 30 Sep 2025 16:52:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 16:52:57 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 30 Sep
 2025 09:52:56 -0700
Received: from [172.31.8.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 30 Sep 2025 09:52:56 -0700
Message-ID: <3ecf0bb8-a1f1-498f-8b7d-39483a67cbfc@amd.com>
Date: Tue, 30 Sep 2025 11:52:50 -0500
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
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <CABb+yY0MzJWOGtS=ocphpUVcJ-gb6_ENCjSmJQiWfRiOhxrpCg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|IA0PR12MB8895:EE_
X-MS-Office365-Filtering-Correlation-Id: 612b67c2-acc7-4ecd-b099-08de0041cebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bW9UNytqUnd0QkppejJjM3VsVFZhcGtMekE1YW9ObW9Cb0QzUUEvS2FjWTN6?=
 =?utf-8?B?OGx5U3liM0tOR0VVU1V1WFI1d3ZpdCtISENhd1AvVDU1SVlxcmU1anNOUjQ1?=
 =?utf-8?B?NVAzOStBMXBPclNpMFNKUmZjNnZsS0RBaS9kbUhjUGRNblE0cjdRZEdBN0I5?=
 =?utf-8?B?N3JEVFViOXdjWTRWa3lOMzRzcUZoSXJVdi96cjZHQVNmd09HelpKekJ3Qmlp?=
 =?utf-8?B?R3V0R0xjT3cvOFpLVG1SYmN2QzNGU2pMSGo0b25XNVB0SkI1Qi9qUmVRZTlk?=
 =?utf-8?B?MC9FOFAyYU45Q0J4UzdYbG05MlZpRFZBbzRWeXhwWXZpN1U3QWVVWmtBTXJY?=
 =?utf-8?B?akx4eVhLdUxkM1hRanA3RVdVNDVZZ09VY1Y1Nk43VnhpYVhzajB0M2x2RkxS?=
 =?utf-8?B?RVhZd1lZS1pwMG14MFJmUXg4cmN3VzJVRlBRd2dRTTFJS0c4bnNaVlBZQTdi?=
 =?utf-8?B?S3FmbUlua3drTVNvYnVySW1BbjhvVlNwSHhXUW5LcmNBSE5mZUJYRW9GMGFp?=
 =?utf-8?B?K3R5TzM0VmZZUVJCdThBTzh5NnF4WHdjamRKN1ZQbHlFRVBiR09XRHhxNTFv?=
 =?utf-8?B?RWN1bVhmRVRqYUpPQmF6WHJsWEpzV0pTTURVZ2NoUDgyYTFkRGpzT1J3bW5G?=
 =?utf-8?B?MlRoSnZKTEJ0aDF1M0tGWjhSUEZNMnl4Q0VoV2VqcDVEbjFpY0JkQU5lNkpF?=
 =?utf-8?B?Szg2eXNtbjk1WE02SGIvd3F4ZXhaS3UxMFc0Z1RpMDQvaGt4S1kzTnNac0Qw?=
 =?utf-8?B?MWFTbm5qNkpJUlIwbWxuSXU3OTU3VmwwMVI1ZVdsL0d4T1R6NGowSkgzYlNp?=
 =?utf-8?B?ckN6YkJaSWVkR3ZHY1hWcUtUSVNycldrNytzQnF5RjlSR3JHcnYwa3luSzgr?=
 =?utf-8?B?MGR1dkxiZ0xyeGpEQ3VGYXpKQ1NPNjFSY04zTFkvMTJxT2xab251R2NRK05p?=
 =?utf-8?B?QTZZY2FxSm9wWno3d09tSnhHVncxSDd0MEhkQ3NaRExydnkyemdsczhkQzI5?=
 =?utf-8?B?QjliTUo4S2lSeU05T3RZTHN0dURxUnRQYmxMYXduUjFxVHNPVXRjcG1OYmVV?=
 =?utf-8?B?MDhCYytaVHI5blVvSTBRWG44bitudE9BN3JVSlZhaVlHdndEaXBjQnBwdmto?=
 =?utf-8?B?WUlzV1VlT0U2YkxzMmxiUWgySkNNVDBVKzNveWJyQy9ZemkwQ1oyci9tb2JS?=
 =?utf-8?B?eVE0d0tFRHJmaDgyMitFOHVXWmowZmNDM1Fua2RNMWFkaFljdVBxcFF4WGdD?=
 =?utf-8?B?T0JpbFNlaG0xNCtBVUQ2c3BoQld6N2RaV1Y3TjBDYlNYb1NHZ0tXd3YzWWth?=
 =?utf-8?B?eEZwSy9jNXVVdVhtVDR6aUtXVU9RU1lpNHZGazNIUjJxU3RlMjVaM2RENlRk?=
 =?utf-8?B?alJ0d2RkMDNDSmpCRXJTSWs5QWlmajdrWS9aQUhaS0hqUTk1blJDb1dLYlFm?=
 =?utf-8?B?TTRoc1N1RmtaNklGNHlwNEhKc2FtbEZMSG14QVZyK3NsVTV2NG44aWZXTXFs?=
 =?utf-8?B?dGQxd1BOLzZPRGJrYlN5bGNqbXhzV3RTYUErcVRqSnlyNDM4UkFyek05RVNN?=
 =?utf-8?B?WjhIR0srMGtmd2FTdTZncU04UzNOZTJKOFo5Vm1aSDVBRWFyWElDUHRsbDAr?=
 =?utf-8?B?VEdFeXhBdHJOSVhCVzI0blk0Skd3Ym5nbE42Y0lsTTZhZEZBMitlRW1Hd1pm?=
 =?utf-8?B?OXRPVC9TU29qQ1hjbWR3OFh5eHFKTm1WL1RPM2hEbytnNGU5bThUYmtHRDgy?=
 =?utf-8?B?dFBENjViTHk0YTQyV2MrbmdRSXlqVVpOSTVJTEtWaXhQUHdsUXF2V3NyWDg3?=
 =?utf-8?B?V1dJbVRLOWJTeU12ODRzZW5MMGttbnBORFN3UlFLdDZuVlNuSWZlSTJLb3JH?=
 =?utf-8?B?L0dTbG1pT1ZQL3k3emVFY1pYZmFKZTZISnNZVzBZVFpzcGNaRVlaUUVZWUFx?=
 =?utf-8?B?dVovSGZYZWxuZk9acXR3RWRvQkMrQkp3MUdCbmVScnc3cXdyakZCM2NsUFVm?=
 =?utf-8?B?RTR4NXFtWmFPRkhMRG1NSXpZV0dKTlhpWFZWNFpGakdwdDZ3dmlSSDVOLzYx?=
 =?utf-8?B?THJzTWwwTWlCN2pjaS9FZ1NuQ3ZacUF5SFBXemZ2L2o4Sm95emNpS0R0NkJO?=
 =?utf-8?Q?p/hY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 16:52:57.3342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 612b67c2-acc7-4ecd-b099-08de0041cebe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8895

Hi Jassi,

Please find my comments below.

On 9/30/25 9:11 AM, Jassi Brar wrote:
> On Thu, Sep 25, 2025 at 1:51 PM Tanmay Shah <tanmay.shah@amd.com> wrote:
>>
>> Sometimes clients need to know if mailbox queue is full or not before
>> posting new message via mailbox. If mailbox queue is full clients can
>> choose not to post new message. This doesn't mean current queue length
>> should be increased, but clients may want to wait till previous Tx is
>> done. This API can help avoid false positive warning from mailbox
>> framework "Try increasing MBOX_TX_QUEUE_LEN".
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>   drivers/mailbox/mailbox.c               | 24 ++++++++++++++++++++++++
>>   drivers/remoteproc/xlnx_r5_remoteproc.c |  4 ++++
>>   include/linux/mailbox_client.h          |  1 +
>>   3 files changed, 29 insertions(+)
>>
>> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
>> index 5cd8ae222073..7afdb2c9006d 100644
>> --- a/drivers/mailbox/mailbox.c
>> +++ b/drivers/mailbox/mailbox.c
>> @@ -217,6 +217,30 @@ bool mbox_client_peek_data(struct mbox_chan *chan)
>>   }
>>   EXPORT_SYMBOL_GPL(mbox_client_peek_data);
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
>> +       unsigned long flags;
>> +       int res;
>> +
>> +       if (!chan)
>> +               return -EINVAL;
>> +
>> +       spin_lock_irqsave(&chan->lock, flags);
>> +       res = (chan->msg_count == (MBOX_TX_QUEUE_LEN - 1));
>>
> 1) If we really need this, it should be
>          res = (chan->msg_count == MBOX_TX_QUEUE_LEN);
> 

Ack here.

> 2) I am thinking instead, introduce a
>         struct mbox_client.msg_slots_ro;
>    Which is a read-only field for the client, denoting how many message
> slots are currently available.
>    The mailbox api will always adjust it when msg_count changes...
>        chan->cl->msg_slots_ro = MBOX_TX_QUEUE_LEN - chan->msg_count;
> 

It's not possible to make msg_slots_ro true Read-Only. Nothing prevents 
clients to write to that variable as far as I know. Also, we have 
msg_free variable that can be used to implement similar concept as 
msg_slots_ro. But that also has same problem, not possible to implement 
it in true read-only fashion.

I can instead implement API msg_queue_empty() and return msg_free 
variable via that API.


> -jassi

