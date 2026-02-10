Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010025.outbound.protection.outlook.com [52.101.46.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5153803F9;
	Tue, 10 Feb 2026 17:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743563; cv=fail; b=tgcr2v0HEBaiCnocLhsu1jfT09gjQyCAvWllC/Tbfrs4GrumcgQmY8sOfOnnwyOE7SaEkLs56fyVm5NHq6hLXMryg4IVd5F/q4/oH/odb0gWUjd+ExIr8StZTsQL1slhpeJRZiDb5CQwo9c70a+62pIsY+KUhCzm9AK1jh2dDoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743563; c=relaxed/simple;
	bh=Cg0fgzXBbLHICwDUeUilSu+NXYVFBIZooW3gHUCSywQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eMj5hSkQWaINcqn6QsurQ1lFTTL230+ZCKFUEdvjlsqQZNLnUZNhhbr0PmfgzUv2JHPBZSkKdhwbHyMy1Y+/nMndV4beyTqxRkjfcPe9ju4XR/WZol4h3jjFPF1DZTtGWaiy+bVlMZPD6YQpPi+PKRI0Bc7WdkdIK1U2LJ1HEVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uea9TMW0; arc=fail smtp.client-ip=52.101.46.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uea9TMW0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NfPS1BA83HmEigks67770Qv6xhTTbQirSUqJVALQw89sViW4qvD70yfg9AaHUo+bIj1UrjsHmUL+lpXS2KlRlc5UdUxXkLLo8+mttsxTvCa1xzPnlOVNmyy9TQknhcbR/DoHDkM+Lw334e9GgjFET8QOh5lI28Ak8OwY0gzFNCLQc85T5a5Qg1HllgkgCuH5S/xCbY4LZGlN/G5ehptO86YcYToJAS4RUnNypx/Fa37UkdzZlb8lT9L5bliByD9IbW03GdhWYlOsTXnu9+Qrje3bx4wCbJNmFcu0RJa/sOvCrkkAbe2phJXPVVZw1z9Ant38gxIkKzwWosSs8YanBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+4K01sOMaPRFIh3ncrZEe9k92N6AFeY3DjsYEDCt+o=;
 b=cF8i90ZccnLE4IBkGv5ISbp8mR1DdL00fv2H7ZpdV96vQjpIiYR24hhjgLUr6/N/YR64WLGf9NLvQQXt3RZyd6h4T2TNf929QLrgpZQjzhi6GBYlH+C4qMCvXo2KaXv22tbikKFxibcdGGVcXWXCqWAiENYpVPzO8EBFtb5ePcXhvw7WVoUIlrAztx3yJhgoFubis/cgP7Xi+FK5ihCPow6hftcLS9u2NUacr88E24cJIW3lOgE4SPOByTanuP2mFvzwzL72whKJvaBg/7z8D0AufJt61GFOlGNQYaVxQ8MNCLGS4LUuKklZ1GPKZjkoGwAE5Mj75KLn7ubIiKxb0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+4K01sOMaPRFIh3ncrZEe9k92N6AFeY3DjsYEDCt+o=;
 b=uea9TMW05iMVG2/8HCHUtPQrMU3dvHaK2zAiWzNfAM2me7gvkJxTCoFHcgLlw8aJQomkt7O54zxZxc3NcL6gdZ5v6ZKoB50qYEQPJ2b5gvl8gfxVpA1GCwABuLAQ2eMbJ9/Rh64has/U0dJ7DJmDf6MSpb9a7mL1YOjunMGsVsw=
Received: from MN0PR02CA0007.namprd02.prod.outlook.com (2603:10b6:208:530::15)
 by SA1PR12MB999085.namprd12.prod.outlook.com (2603:10b6:806:4a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 17:12:36 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:530:cafe::e8) by MN0PR02CA0007.outlook.office365.com
 (2603:10b6:208:530::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 17:12:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 17:12:36 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Feb
 2026 11:12:36 -0600
Received: from [10.23.192.78] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 10 Feb 2026 11:12:35 -0600
Message-ID: <101d3bb6-87a7-485b-a327-16dd1ce617d5@amd.com>
Date: Tue, 10 Feb 2026 11:12:35 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v4 2/3] remoteproc: xlnx: assign mbox client per mbox
 channel
To: Jassi Brar <jassisinghbrar@gmail.com>, Tanmay Shah <tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20260203225821.3293475-1-tanmay.shah@amd.com>
 <20260203225821.3293475-3-tanmay.shah@amd.com>
 <CABb+yY12vSxs=TA42ybkFUUhdbXyxkGoFMBfk01xm-Tb+g6q1Q@mail.gmail.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <CABb+yY12vSxs=TA42ybkFUUhdbXyxkGoFMBfk01xm-Tb+g6q1Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|SA1PR12MB999085:EE_
X-MS-Office365-Filtering-Correlation-Id: 0be1333d-ffdf-4e8f-5cb2-08de68c79695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djFWY3VEbFhQVHRWQTR2YmpSMm1lbkZYQmxDRVowWlhSbm1aUllrM3ZDVzNo?=
 =?utf-8?B?RU5Hd2czckhyWmtMc0xPMHJScG13b0toRWx5TmxWZnN2REdJSndDWC9JcStz?=
 =?utf-8?B?QVRQV2c1aEZoc0ZkbkVvUk93Ujg1OWpBRmhWeE5oM1ZmNHo3STZVYy84dEkz?=
 =?utf-8?B?eGRLb2lqUDFGZUVkTXZIQmhnNmVESm9DWThwc0Q0eGpLbmxlSWxONTdCb1lm?=
 =?utf-8?B?Y2JzZUliNEQycGZNVjdLTHl1aFFFclZjRy9JK1BlQkRMVEpsOEdVcXhIWWdE?=
 =?utf-8?B?a2tjN2ZWeU5yOWlsL1BUZk90dkI0WlhjVW9WSFFEa0ZBRGhHM2Ftdy81NlUv?=
 =?utf-8?B?ZzdpUFNnRThTWWRsVGZKcHNheUdJZ1Uvc25Pd2FVTVdocUFFY0huVFFGOVpq?=
 =?utf-8?B?eXZhM1V4MTFjNis4ckhuU0pLd0xseTI1dDhoTHJiaFQxa01IOTMwSDFBZ1JQ?=
 =?utf-8?B?OGNYZjFIelpka1dGTnkxVWt1bXl3Q05xM21nSjZIWUN2cW1zQWdMbFZ5OGFW?=
 =?utf-8?B?c0RSUWNNenNtZHJYckw0NmtHNm9Ianl6WDFQQ2RKakhEVERuRkM1VHVGZ2dN?=
 =?utf-8?B?UTJ6S0d2aWtmcGNqcUcwcDRGZ2M1MWsvZ1pBTlVqNXZ3V0pFSzlLMDF0eVVa?=
 =?utf-8?B?em40bFlIRjVTa1IxSXMwcktvZXVWTTFTRXFmNzcrV3BsVnZ2cGs1RitLbU4w?=
 =?utf-8?B?cVNkSUNDQzZzNDJDZzBwVGtXeDN4Mnl1UnBSOXZFS0d1T1VoTkJCcHMrNTly?=
 =?utf-8?B?dWpDaC9BZkZ0UnJzbjZCZ1VrT2QraDVvUE1WY1MvcDZIRGxrTXI2TlRzOFJE?=
 =?utf-8?B?Z1FHMHhDSTRhRW1GOG9KM2NaN0x2SjRDVVZ2NHdRZlZ6ZVlCUThpQUVxa0NI?=
 =?utf-8?B?Z1pZVXZkemt2b3U4WkJvcFc0MDV5S29Ldm8vV3g2eXcyalRnK25BVCtFeTdS?=
 =?utf-8?B?ZXk3V1JKU3NNajVvSDlhOFRYTmNkQVIxVkRPSGpCU3kvSDFSeG9LVEpIUXdU?=
 =?utf-8?B?UENzOHMzeXgzdWN0VHdMMVcrczd2R3VNZGFIWndzbDFUZFJvWXFKbDJOSUU2?=
 =?utf-8?B?aFE5ZnpiUHlZU2cwVmFPRUxxMllZRUJQWWFZR1dSQ0FhRk10ZVFoMktudWpF?=
 =?utf-8?B?VEFRYTVIM2JjK1NGaC9NWGJnTndvZjdtK1h4b3VzRDNFRVdyaEtWOXlPWFll?=
 =?utf-8?B?RU9KbWNVR3pCemhhSEIvT0tCbHJud0tXZ3VvaFNTNjdmNS8ra3lReEV0eVFH?=
 =?utf-8?B?YzNyZDV0SkhvYjRxNkRqUUJaNlpzeUs2S0pXRDhTN0M0MHcvQVlnRWNBZUcz?=
 =?utf-8?B?NE1UcTNzVUVhcHlOK1JGc1h3VmhnVVVvN05XVUJ2ZFo0OXhJRjR4YTBwa3JZ?=
 =?utf-8?B?UUtCL09qS2FMUVJzbjdJalhVTWQ2UHhHUlJtUXlPTEhvVS9SUXVqRVViaTlE?=
 =?utf-8?B?U3lQeFp2aFdmMXE1TjJDeEFsVVgyRVRRenlhVW9qVFlkQnAzdGhrUTQ4by9S?=
 =?utf-8?B?ZnRnSXIzREFLbnRlUnJJVmp2aHcwVVlVMG9wNWlNK3hHMm02aVNsMnBCQ2VQ?=
 =?utf-8?B?ZkxROGQvQ3RJbVVYalBqUkU2c1B5dEJhTUdBMFd4TDQyNW9MaVcrRnd6blJm?=
 =?utf-8?B?TjhUSjM1NG5OV2EwU2VoYTBjOER2RHlueWJLa2xJTEt2QkVabW9UbzZ1QWRr?=
 =?utf-8?B?SWNGenVuRWhaUHFvOEs5QVIxWUxoSDFaQkluSUwzb25OTUNLTE5XQ0xTRzB6?=
 =?utf-8?B?Q0dZOVFaNmJSRXJvbWlCNlAwcEozNG1SZGlBeFhJUUE3QUl4dlJNSkw0bVBr?=
 =?utf-8?B?MXViYlhjRHZrNFlRa2ZSaTg3RVRxVHV3dW8rUE9qelR1aFZKTk5pSGlUZHRn?=
 =?utf-8?B?TDRYZ09VaFZnbVNGcXpxemtERG1sNHUwN0VRYTZ6c01vMG9qdm9qeWQ0V2l1?=
 =?utf-8?B?aytSa2dDKzByaGI1YWdZTzNpaWIvbEkzcTdmS2xkMmphMmxmV2RIM2hQTDRO?=
 =?utf-8?B?aGN0RW1vSDRQVmthM2VCRDdyRnI5UWJONEdUNWN0N2dIWkxncVc4aTlwRVd2?=
 =?utf-8?B?NzFUL1hGaEc3MzB3RXpTZHBZd2lJekZleG5tM0VoK25ScVBIVFBOZmZBR0lm?=
 =?utf-8?B?R0lOU2F1ei9lVHg3cW5rVUFqZ3k5d3hUVkorV21hTSs3cEpNUlhVUUJyL3dN?=
 =?utf-8?B?ejRjQXpQV3NEb3FVa3B4UzlLSk1XL08ycmZmbEpOMmhLTFRlQ2hwc2lrdXF4?=
 =?utf-8?B?OHZXdTJBR0pxV1JtSENCYURscXNnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3S/HmEm68YDLxm8rKVM+zJEk5DYR31/nMps5kS6msnOdAKP26t4osai+tXOCWu32kelmRokriZG/nGw3SZiYgOlivlczr/WO88ZsA3Kr9N978MHSq3n+EQDiUfyCi9oM/PQhcZC6/SICcLfEsKaenAdyXy5odSSq2hspOOrJ5qTEaMMILnDFHiLmksAixzbNYnPq+mDnN1gGk0xg2vw02WDQHryXf3irhZZaYIwXqqvVyeKrffpKCYUbjF10hKnLAMlNYe3HnFokBOxGaSflcdrIuQcYqj91UIlJp3BX38Rlde44UwHm2OwtonyydisinErXC+C5FqBpgNkwnOj7XzNwt35BxDvenCpLMziH7VTMuaeFJZ1UvsnE+hl69JEiU7bsRJyiGPpYzn336G70RcE+0RnzvXp/I8Bh1xEmcpxMR8EBx8tLc66U3npMJI9t
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:12:36.6900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be1333d-ffdf-4e8f-5cb2-08de68c79695
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999085



On 2/9/2026 5:27 PM, Jassi Brar wrote:
> On Tue, Feb 3, 2026 at 4:59 PM Tanmay Shah <tanmay.shah@amd.com> wrote:
>>
>> Sharing mbox client data structure between "tx" and "rx" channels
>> can lead to data corruption. Instead each channel should have its own
>> mbox client data structure.
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>
>> changes in v4:
>>   - separate remoteproc driver patch in to two patches
>>
>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 19 ++++++++++++++-----
>>  1 file changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> index bd619a6c42aa..109831c5815c 100644
>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> @@ -74,7 +74,8 @@ struct zynqmp_sram_bank {
>>   * @tx_mc_buf: to copy data to mailbox tx channel
>>   * @r5_core: this mailbox's corresponding r5_core pointer
>>   * @mbox_work: schedule work after receiving data from mailbox
>> - * @mbox_cl: mailbox client
>> + * @mbox_tx_cl: tx channel mailbox client
>> + * @mbox_rx_cl: rx channel mailbox client
>>   * @tx_chan: mailbox tx channel
>>   * @rx_chan: mailbox rx channel
>>   */
>> @@ -83,7 +84,8 @@ struct mbox_info {
>>         unsigned char tx_mc_buf[MBOX_CLIENT_BUF_MAX];
>>         struct zynqmp_r5_core *r5_core;
>>         struct work_struct mbox_work;
>> -       struct mbox_client mbox_cl;
>> +       struct mbox_client mbox_tx_cl;
>> +       struct mbox_client mbox_rx_cl;
>>         struct mbox_chan *tx_chan;
>>         struct mbox_chan *rx_chan;
>>  };
>> @@ -230,7 +232,7 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>>         struct mbox_info *ipi;
>>         size_t len;
>>
>> -       ipi = container_of(cl, struct mbox_info, mbox_cl);
>> +       ipi = container_of(cl, struct mbox_info, mbox_rx_cl);
>>
>>         /* copy data from ipi buffer to r5_core */
>>         ipi_msg = (struct zynqmp_ipi_message *)msg;
>> @@ -269,8 +271,8 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
>>         if (!ipi)
>>                 return NULL;
>>
>> -       mbox_cl = &ipi->mbox_cl;
>> -       mbox_cl->rx_callback = zynqmp_r5_mb_rx_cb;
>> +       mbox_cl = &ipi->mbox_tx_cl;
>> +       mbox_cl->rx_callback = NULL;
>>         mbox_cl->tx_block = false;
>>         mbox_cl->knows_txdone = false;
>>         mbox_cl->tx_done = NULL;
>> @@ -285,6 +287,13 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
>>                 return NULL;
>>         }
>>
>> +       mbox_cl = &ipi->mbox_rx_cl;
>> +       mbox_cl->rx_callback = zynqmp_r5_mb_rx_cb;
>> +       mbox_cl->tx_block = false;
>> +       mbox_cl->knows_txdone = false;
>> +       mbox_cl->tx_done = NULL;
>> +       mbox_cl->dev = cdev;
>> +
> hmm... this looks bad. Sorry.
> I think all we need is to export
>   unsigned int mbox_chan_tx_slots_available(struct mbox_chan *chan) {
> return MBOX_TX_QUEUE_LEN - chan->msg_count}
> from mailbox.c, of course with protection of the channel lock.
> That should work for you, right?
> 

Hi Jassi,

Yes. Similar design was proposed in v1 [1]. That patch had some other
problems, but the design was similar.

I see your new patch, that should work for me. I will test the patch and
provide tested-by tag.

Thanks,
Tanmay

[1]
https://lore.kernel.org/all/20250925185043.3013388-1-tanmay.shah@amd.com/#t

> Regards,
> Jassi

