Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012071.outbound.protection.outlook.com [52.101.43.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603472E7635;
	Mon, 30 Mar 2026 18:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896192; cv=fail; b=aakGv0tNllwKcwAOYmqPpIfx0e1KBy/Ao2vYIWWMVP9h3qL+Ha0bRyxiV/8ofIEktsfvSaSolLnUaEmG5e2JYRjeTzzypSCBzuS4jLN+LJ5A2+/qC4Qg3Y36ACPThHEiEN75aZUlR9qLWQCUe1K7TncSHpLLD/2UzUH5Ov5FT60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896192; c=relaxed/simple;
	bh=2MgJPIwQciWvMWQZK0MbAUKDimfxgaBTVInecHLYPTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ruslq1UCNjiyPfE3veYXe6lMVAQtn6WZVdGeStnxVGDbzRSSzhQMsNQzgC5npsi0IDzxlFSJysW/jdP5D/D7LIR8mfNZQpdn7/gjZmypO/xdlZK8T+wKE7TTs7Lk2YLgtWXAMXuOdgKrT5CI7Hgr7CxzvxbhAj8gvtbLQQx1+W8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CpEOurM8; arc=fail smtp.client-ip=52.101.43.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CpEOurM8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArSHvT16AOjcuOINQOpLkizSXi3C4k1lSXPH9hIAtzQY1rjdxXwCg8YTr30ggPavbWftCyo47rCUyYlSZXRrsGkHGcDdoKwTTphFbpVHu5p9dnF9gB/bouvg9YRAYVmEMT4jWZKvpdQ/UoT3vqN9n1JIrGtVtCjF7ecVVR8AvVKEL4PjVMvU3SzCPgyEn3ttukZ71rFTP4SwMqg5ql7Q4/SxY3SGsisTioWhjHjfXRaeg+H0Y9n2dmC/yFdxAvGY08tx5OazHjNI5ag3q50aL9kWkQWyUk2CZAUTlLMyqBIZugxWqarS6CTw/kNJ0cE4owIe+mHF+SbTUgGSZHIX5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JtG3qiHfVLD9x21Uj/yg6J/FHLF+RDhEKwjuxASX9c=;
 b=Bs8bs+HoMzjah6Go9g++F8JwYA9JSLcKWf71IUK15lP/JVUaIgep7Y7MjpERoePiNE6l4GLF+BattHw8dk91boE3Lzx7BC2wcTa/AC987rVEi7DwmfAkPr5ntndZ1rCyasRVcQCadHtTVZREqbKqse9pBJsWyJvc/9oTvcXhHAjdgG3bpxmq/EfAZZXvrtAq2lyZBkeFnjHelzaViqOFJ2QiGo1JSUxEHzF2TZjH+bFzMtAxO3CZbKSSfdFJyM1EBIJmpzlR+6msPI7wDrzeCNmUbtcUBs7cmAUSoovtR/iKVEdlik3fuBBUsxrN046W8FGxKcEn8Q2ktqOI7mPfcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JtG3qiHfVLD9x21Uj/yg6J/FHLF+RDhEKwjuxASX9c=;
 b=CpEOurM8u74568A3l8V+UjL9hMmWdpJDCCaC40iPF/+mWsNoib5rMS27lckv03BQAAcoL9rAhMATATagC+J0jEaQDEwwtxll5NVqKsvZ3fW7jmJRb/dLBaF3GMgR3YCyvxl6hpujyhQtV4XuvzpQnsNabaAyzeM7PxUYOjxAH3c=
Received: from BYAPR05CA0037.namprd05.prod.outlook.com (2603:10b6:a03:74::14)
 by DS0PR12MB9324.namprd12.prod.outlook.com (2603:10b6:8:1b6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 18:43:05 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com (2603:10b6:a03:74::4)
 by BYAPR05CA0037.outlook.office365.com (2603:10b6:a03:74::14) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28
 via Frontend Transport; Mon, 30 Mar 2026 18:43:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 18:43:04 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 13:43:04 -0500
Received: from [10.31.206.142] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 30 Mar 2026 13:43:03 -0500
Message-ID: <3f557b06-ea34-4f96-b1ec-75bab7c0d828@amd.com>
Date: Mon, 30 Mar 2026 13:43:03 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] remoteproc: xlnx: reset virtio status during attach
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Tanmay Shah
	<tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260317201251.3920841-1-tanmay.shah@amd.com>
 <acbhbnBgJCP7WETC@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <acbhbnBgJCP7WETC@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|DS0PR12MB9324:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cd69157-6d70-410e-adb6-08de8e8c2dda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	V1oOVu3sqp4TN/BprC1cZBy4Onqx4vBjKDj49WAHD3uWY/qTF4KH4+CC8tgygLGzm8Uwv1t+9Bx9d4Sa9zuFoTLXEKnCwoUzQdSnaSJdmVTW70ALHf3+axjrlJEyBimUtiNTl2BbA8iu0SYnY/6kK8zVKtM8R7qWRMBHcxtpUDkwMyGVNX/LNRU3mQWynWXQC7c0wYY7gE/ra6GgBEoQyKsQTFLaswdcTM27oxwSlyX/MmXTG5aXW9D0Ap3tTWZSl0m9I+dROVBUYS/DbNfrgFzUlq7PcvdN+qc1cgljCm28cwMxhTVriq2FHCGEtwSMg0z3HYHkGSGKTMjZ7WAiHof2lkN3BpbWskck8fQK/NWIY8ELNDq5HLN4GsUnBOvIxqfemLxKTXU9rw6m/W/Y/ldEMAOc62e/sak8MGTVZ0GAmZmfaCSTA/KqfwjR34HUBaIfqtDBhcn1RlZz8ShNoi5x8GRfVq7m1A4vNpCnYxdeu5DWkqSHz5CbFmtcpNXQVrzQTZ/UQ8zFq+YKiGm2opRYJrUcUJkoQKWa4umJqP6U45UAcugCHcQRYu0UcpolOGPLoZTBZS37L2RKOnWzjtAkGw5i1jKKshi2Arm//XXd9JhiX0us13OuvaIYWnbOQ2D7E8wEnGeHeYavecQKAyGovmNrJouWu8U6pOrwuZnnob60FIMr7OuHBGkVEm9BmJi1a9rcBhklWQ8oZRxerX6ooY+6iZVEsIwKe0TU7eIQ8tvsMHgRYHr7l4CqQAIM5WKJi0FrA90JUYI+h8sKLA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vrNk3yTElidkN7GqcqwOfCmyLPXeWaWfVOAt9QocTwiNbbH+Eg++oSwYETPwlzdMa5o/ElVXfYTDR46Xqqzokq15PNalgWv79SOf6UTVAQF7SL4sYyYcWQmEfvcHmaChNwuhdU7Te7M/XO1X7jWs8PMooWSzguTP6lOs74MKReNYZlJ2SRIXiyZTt/vQe+6x/ICAn1mN0nqPQYQ9+q472x1Fs9cmQzmPZD2SKFxcvU05FSEIq+zZ9l0iW+jz2ZGQYoxyXZas/uyqA4KRX2gzYApuPE2UKl0Bm+P7EXrYZsoctVMddRgSRpn+ai6XCo/vhCAIb/lTKl1VEEttluv/4GUuIYj9sKMoInoGTpYONspuS8lEr7OQRJ14Rp0+iqoU4JPRi+FiXeOR8cBI1jfMYXcCsg2CmopICAWE/WO+PdO3zZqVASs0us9lp4ubqDhk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 18:43:04.7713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd69157-6d70-410e-adb6-08de8e8c2dda
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9324

Hello,

Thanks for the reviews. Please find my comments below:

On 3/27/2026 2:58 PM, Mathieu Poirier wrote:
> On Tue, Mar 17, 2026 at 01:12:51PM -0700, Tanmay Shah wrote:
>> On AMD-Xilinx platforms cortex-A and cortex-R can be configured as
>> separate subsystems. In this case, both cores can boot independent of
>> each other. If Linux went through uncontrolled reboot during active
>> rpmsg communication, then during next boot it can find rpmsg virtio
>> status not in the reset state. In such case it is important to reset the
>> virtio status during attach callback and wait for sometime for the
>> remote to handle virtio driver reset.
> 
> I understand the user case, but won't that situation happen regardless of
> whether cores operate sync or split mode?
> 

I want to make it clear that this is not same as Cortex-R cluster
configured as lockstep vs split mode.

This is different configuration between Cortex-A cores and Cortex-R
cores. It is a firmware driver configuration of how it treats cortex-A
and Cortex-R subsystems.

In the firmware driver, we can configure Cortex-A cluster as owner of
Cortex-R cluster, and in that case, if Cortex-A reboots, the firmware
will also reboot cortex-R cores. This policy makes Cortex-A as owner of
Cortex-R cores. In this configuraton this patch is not needed, because
if Cortex-A reboots then platform management firmware will also reboot
Cortex-R cores as well and vdev status flag will be always 0.

In another configuration in the firmware driver, Cortex-R cores can be
independent of Cortex-A cores. This means, Cortex-A is not the owner of
the Cortex-R cores. Both are independent subsystem. Only in this
configuration, this patch applies because it is possible that Cortex-A
reboots while Cortex-R doesn't and Cortex-R still runs as it is.

So only in the second type of configuration, this patch is needed when
COrtex-A running linux reboots and when driver probes and tries to
attach it can find that vdev flag is not reset. In the first
configuartion if linux reboots, then It's guranteed that vdev status
flag will always be in the reset state.

If you prefer I can extend the commit message with all above details or
put as comment in the attach() callback. Let me know which do you prefer.

>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 46 +++++++++++++++++++++++++
>>  1 file changed, 46 insertions(+)
>>
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> index 50a9974f3202..f08806f13800 100644
>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> @@ -5,6 +5,7 @@
>>   */
>>  
>>  #include <dt-bindings/power/xlnx-zynqmp-power.h>
>> +#include <linux/delay.h>
>>  #include <linux/dma-mapping.h>
>>  #include <linux/firmware/xlnx-zynqmp.h>
>>  #include <linux/kernel.h>
>> @@ -29,6 +30,8 @@
>>  #define RSC_TBL_XLNX_MAGIC	((uint32_t)'x' << 24 | (uint32_t)'a' << 16 | \
>>  				 (uint32_t)'m' << 8 | (uint32_t)'p')
>>  
>> +#define RPROC_ATTACH_TIMEOUT_US (100 * 1000)
>> +
> 
> There are some time constant already defined, please use them.

Ack.

> 
>>  /*
>>   * settings for RPU cluster mode which
>>   * reflects possible values of xlnx,cluster-mode dt-property
>> @@ -865,6 +868,49 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>>  
>>  static int zynqmp_r5_attach(struct rproc *rproc)
>>  {
>> +	struct device *dev = &rproc->dev;
>> +	bool wait_for_remote = false;
>> +	struct fw_rsc_vdev *rsc;
>> +	struct fw_rsc_hdr *hdr;
>> +	int i, offset, avail;
>> +
>> +	if (!rproc->table_ptr)
>> +		goto attach_success;
>> +
>> +	for (i = 0; i < rproc->table_ptr->num; i++) {
>> +		offset = rproc->table_ptr->offset[i];
>> +		hdr = (void *)rproc->table_ptr + offset;
>> +		avail = rproc->table_sz - offset - sizeof(*hdr);
>> +		rsc = (void *)hdr + sizeof(*hdr);
>> +
>> +		/* make sure table isn't truncated */
>> +		if (avail < 0) {
>> +			dev_err(dev, "rsc table is truncated\n");
>> +			return -EINVAL;
>> +		}
>> +
>> +		if (hdr->type != RSC_VDEV)
>> +			continue;
>> +
>> +		/*
>> +		 * reset vdev status, in case previous run didn't leave it in
>> +		 * a clean state.
>> +		 */
>> +		if (rsc->status) {
>> +			rsc->status = 0;
>> +			wait_for_remote = true;
>> +			break;
>> +		}
>> +	}
>> +
>> +	/* kick remote to notify about attach */
>> +	rproc->ops->kick(rproc, 0);
>> +
>> +	/* wait for sometime until remote is ready */
>> +	if (wait_for_remote)
>> +		usleep_range(100, RPROC_ATTACH_TIMEOUT_US);
> 
> Instead of waiting, would it be possible to return -EPROBE_DEFER and let the
> driver core retry mechanic do it's work?
> 

It is not possible to do -EPROBE_DEFER, because attach() callback is not
called only during driver probe.

It is also called during following command sequence:

attach() -> detach() -> attach()

During second attach() callback, we can't do -EPROBE_DEFER, as it's not
driver probe anymore. So I think will have to keep the usleep_range().

> Thanks,
> Mathieu
> 
>> +
>> +attach_success:
>>  	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
>>  
>>  	return 0;
>>
>> base-commit: d4ef36fbd57e610d4c334123ce706a2a71187cae
>> -- 
>> 2.34.1
>>

