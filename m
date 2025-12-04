Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012025.outbound.protection.outlook.com [40.107.209.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8951E304BDE
	for <linux-remoteproc@vger.kernel.org>; Thu,  4 Dec 2025 16:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764866733; cv=fail; b=VVEvFml9mxqsEzp3URxtG4CBgYOBz6aYYKj9T/PNMfc275w2RU+PUj354wio8RRHap5aTgKiaDnJNJaF1tkOQpkJ+je1Ffjx+aQzfbun/4czpxIRcvAxEKUQOl4du+hogAJe4SsAvNaX27t5HtPUibJvbleTvTLrW9454u5n7Nw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764866733; c=relaxed/simple;
	bh=z4nbDbQK/4oCtnYLDlh3sKn1UTLtsbBJ8E4wXb5zc9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Tiripan64mrWb3Yb4XNbBZ3gIin8YrdbqY0AdflqpWI+hnQf4INHcfHWrD/C8OAP+4vdbkQUOLOt517y3cR0NuvRqaJwzP0z26MVDkFXDLnq3nXp4tjqi2juY3BcVkMQIxX1G4HyOGiTXfOxUaqxDzpUCab1XolS1Wfq9pBOAN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=V0nWy7m1; arc=fail smtp.client-ip=40.107.209.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="V0nWy7m1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWan2fUV9yVqrIlF6e07XfP7H/uw6cKJQiEo2cCDIndGfS9jvK9jQAFqszDd0u+EY9Wil4YUIStr1ca/wPt+k+ol3xt47s6nw68X8t7qPZ8Sx2i11QVNTdmKV9L+ml+WxMKTY6PDkjNSVG2gHBEe39PLv99VB2twaH0nIQeis5QAliibKVxtlZkOFwr5Xb0sJN8KrhPTk0c7DivyxRjIBYLLpmSdz085cwKWjBczstI7sB3AfLIhXFEL9rignz+7pGTBFZl2iddpNwyKeFCNxaDQixQnWf/JyJ8VWUjfnHoYw73Hbfyng/IdrU4zAZLYTzitfPtZpXChpw28TFCRFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hacQvOSuqqa4kecGK2mf8mJc9BUO7jfDdTeu0hsxAOY=;
 b=qJhiWulG98dI6gDwQoZZHoofN4iz3WNvJhZDPwf2nrD+q/2yj/dBtal54010G7KP6zpyANDn0OnvPI9GzFuGZsMxC46bfdo3gh+rKWG6YuGmyHgpGUvqLmWOTU7l8PrZjzvuptyUuw2Qv50nwn2tiy1yFxm9C93X7wR16NOj9IHmJSy9pTZofG3Y0RHMnzpjSp3qwZ7fQqB8FsiCvkuIzX8nk8E1yvQQQSlDNPyOOjIqNE0rw66PPNMm95wHr5Z4ISRjE/b+MiIAhAQg3pSlAh1tBIiGPYUSt53VSOx58L2xwOg2OF3ecQ/RQ8A4e4VwiEYfBMIWIgXRbtiquX5vFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=mailbox.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hacQvOSuqqa4kecGK2mf8mJc9BUO7jfDdTeu0hsxAOY=;
 b=V0nWy7m1jiIUhlgwl3EmkOdLjvkc2A+9kil8XeyEZ+zJOpKpXKZsGoEpYzp2Iy2o5p+0Qp670iln9to3wnmOUBCwcf3sJdknDtk3veAOTjoxUsWU9tzBBJfrzQydRPj1L/rITNn0Y5B8e27Ipw3K4RTnBv1kbhlAam4mmQk1eRw=
Received: from MW4PR04CA0276.namprd04.prod.outlook.com (2603:10b6:303:89::11)
 by SA1PR12MB8697.namprd12.prod.outlook.com (2603:10b6:806:385::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 16:45:25 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:303:89:cafe::8) by MW4PR04CA0276.outlook.office365.com
 (2603:10b6:303:89::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Thu,
 4 Dec 2025 16:45:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Thu, 4 Dec 2025 16:45:22 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 4 Dec
 2025 10:45:15 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 4 Dec
 2025 08:45:14 -0800
Received: from [172.31.132.204] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 4 Dec 2025 08:45:14 -0800
Message-ID: <b8951794-f720-49a9-9b21-1971a364c956@amd.com>
Date: Thu, 4 Dec 2025 10:45:14 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [v3 PATCH] remoteproc: xlnx: Use high-prio workqueue instead of
 system wq
To: Stefan Roese <stefan.roese@mailbox.org>,
	<linux-remoteproc@vger.kernel.org>
CC: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20251204104009.129483-1-stefan.roese@mailbox.org>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <20251204104009.129483-1-stefan.roese@mailbox.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|SA1PR12MB8697:EE_
X-MS-Office365-Filtering-Correlation-Id: 1de215c4-d8e1-4292-d78d-08de335484a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGhCTGVsb2d5S2xLcGNSUThIS0NoNmZCWWd2UFJZUXJ2RWxoZTdkbUpHYndu?=
 =?utf-8?B?SkFtY3hUcGhGZmhMZ1hEWHBUeGlISmlxd2xOUjRVcGJOYjRxWG0vTDlaUGxB?=
 =?utf-8?B?UmtvRkQ4Z3JvQ3Jadlk2YnBmQm9GWUo5YzU4VFlmTkxmbi9jbXFGdVVmRzZW?=
 =?utf-8?B?M3FKTzNrYXlHVlNCUGZBVkxsTlZNSTYweXE0RncxOHdEcFMrd0JSejNrU3pO?=
 =?utf-8?B?dWdERThCWWpUdm5KYUhISmVmdzkrb2c5Y0t1QmxwVktMSTZjc1E5WFg1UjhI?=
 =?utf-8?B?RE41WktFQ2I3ZHc4cGNteDhNTkM4dHZxamdKUzB1UFBuV3VlZ3hRaUpBMFZQ?=
 =?utf-8?B?Z0pjbFF0bms1ZStxanJsd1ljWmFMYSsxK0JXRU1WMlh2QXNGckVmVkF1NDZl?=
 =?utf-8?B?djl0NjJ6d3Y0eDl2cGQrSjJBa2JXUWlBTUdmWkhEMU1FZkd3SCs5ZFZobFlY?=
 =?utf-8?B?dzJGTTlxOU1iZ2RKRG1maDAwQmU5SUoxR0N3WVZqWTZOYjczT3pBVXB6RGZ1?=
 =?utf-8?B?bENySUVlWjBZVUdUMUJqaExacHNyY2Jja0JyRGdyaVk4bEJHcUl1NTdXMlhj?=
 =?utf-8?B?Y1doRHVZT2FyVVFuNFZvTXlscDNKb1pnRFp6NTJldlhINE1YcHR5cDhtL24r?=
 =?utf-8?B?R1BsMnA4Rjd2V25XbzZYS25PQ21yaTZJd1gwVjByRkNzb0ZuUG5NYUR3c1dw?=
 =?utf-8?B?UVFHYXFuYmF5Q1Q5ekJiNy9wbFc5c2Z6b1YwN0k0a0xJWmpEVUtmcVF0Ylh0?=
 =?utf-8?B?OERia1FyTWJQNFhZM0JHcVROVnBJZW1EVjY2L2ZnNmdxK3d5djZLa24zWGd1?=
 =?utf-8?B?RSt3Z1huTnlBTHdoQmZ6S1VBWUt3TkEzQzd5N2JaVUtidXA1MkN4VEdnRE5s?=
 =?utf-8?B?OGo5RWF5WFJPWm5NWjNMRGE3c2ZlT2VtV3RLY1JkYlJvZE5IbktIajhTY1lH?=
 =?utf-8?B?NzdpdytDaERHZnpKK2VmRGtkcUhPZkNiZjhXdXlRbnUvT002RVlybDFiNXcy?=
 =?utf-8?B?WDdISThDTTFNVElOVU1tSENxYURvbWRQUWdiMUpyZ3ArZ3hpSXFVODdqY3Mx?=
 =?utf-8?B?Y0FQRWZxYXZLTFZkWTVUZ0x3MThJY2ZOcnNBTGsxb0RjQ2NJckNrb0pBdkxz?=
 =?utf-8?B?MFlRaFFMb1lqckVRRjhES2IyRTlxMFlyT3pRbjBmcXhuQ2JsVjZQT3pNeXpB?=
 =?utf-8?B?dFZFbzdhMGhaNWZnL3ZZc1Bpank4cXovSHQzcFZkK0hWTVVBZHhPSVNJTnA2?=
 =?utf-8?B?bmljT3NTLzBIOWU1cE9CWGk3Y3dhMVlwa2EydllQUmdGSnlvZHRXdGpHVWIz?=
 =?utf-8?B?NFhpa2NKQWlYUFNHTkxjclRmNWlsUldsY1MxVmwxbjlzR1AyYlZ1ck5GSU5R?=
 =?utf-8?B?NGVPUVZXQS9kQ0hyWkpJZ1FKVGcwTk4wWUEydjd5ZVVEWVQ4TE1JRkdTNzlQ?=
 =?utf-8?B?dEdoN0VTSkZxNWpQN0tuNkplQlBPUGZPbG9jQkhlNjU5Nmc2VDhYamtUOFRE?=
 =?utf-8?B?TGh5K1NROWFIdTI1VlJNR1lLWURHQ1VsUEdSdDQ5b3lSMVlVbFhqSmZqNlg2?=
 =?utf-8?B?alZmTFNrWitqdFQrTTE1SFhyajNXT0tBdGVuZFd2OTJRTGdSWGxUQVF5NzJo?=
 =?utf-8?B?akMrcjQzY1pkeCtibHNaeGd2dElicjIvVlRzOW1uUHphL1RQdDN5UUk3bDdz?=
 =?utf-8?B?c1FDVnIzTjFVQi9KUmN4VmhFWFdYRHZDUlgrQ1RIbldybmRpWmlFYWZJZU0y?=
 =?utf-8?B?UVZjM0I2UTl2UHBQSkNwdnlhWjcyR2lhV1ZySGVad2szbUtPejVCdjlvbzhM?=
 =?utf-8?B?bnN4S2E3MDZiZC81bGdmRkNXVUlzQTdudE9xWlZLUGs2U0xWekhEb0h2R1FL?=
 =?utf-8?B?RHJWMWczUFRibEdGdWdWVU1sb1JRRXU4Zkt6TWxadmpDcHdSRGNOR3hNTmFH?=
 =?utf-8?B?d0hXN1M4ZVVrN09VNVdzS05RUXRaY2dpSHBUNHFZY3ZXT0cwMWtOZlZPRGF6?=
 =?utf-8?B?NlV5MVBKTDVOS3pySGFneHZ2S1I0TjVIZGtVU3o5WnFzNDZ1Yy80RndpWStR?=
 =?utf-8?B?MlUwQkI3dXl2K0EyYnBXZlY1MUNNL3pwdHkzTkVqdnpPR2FmUHAyaHlBTGdL?=
 =?utf-8?Q?8jEs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:45:22.7357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de215c4-d8e1-4292-d78d-08de335484a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8697

Hello,

Thank You for your patch. Please find my comments below.

On 12/4/25 4:40 AM, Stefan Roese wrote:
> Testing on our ZynqMP platform has shown, that some R5 messages might
> get dropped under high CPU load. This patch creates a new high-prio

Here, I would like to understand what it means by "R5 messages might get 
dropped"

Even under high CPU load, the messages from R5 are stored in the 
virtqueues. If Linux doesn't read it, then it is not really lost/dropped.

Could you please explain your use case in detail and how the testing is 
conducted?

Thanks,
Tanmay

> workqueue which is now used instead of the default system workqueue.
> With this change we don't experience these message drops any more.
> 
> Signed-off-by: Stefan Roese <stefan.roese@mailbox.org>
> Cc: Tanmay Shah <tanmay.shah@amd.com>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
> v3:
> - Call cancel_work_sync() before freeing ipi (suggested by Zhongqiu Han)
> 
> v2:
> - Also call destroy_workqueue() in zynqmp_r5_cluster_exit() (suggested by Zhongqiu Han)
> - Correct call seq to avoid UAF (suggested by Zhongqiu Han)
> 
>   drivers/remoteproc/xlnx_r5_remoteproc.c | 23 ++++++++++++++++++++++-
>   1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index feca6de68da28..308328b0b489f 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -16,6 +16,7 @@
>   #include <linux/of_reserved_mem.h>
>   #include <linux/platform_device.h>
>   #include <linux/remoteproc.h>
> +#include <linux/workqueue.h>
>   
>   #include "remoteproc_internal.h"
>   
> @@ -116,6 +117,7 @@ struct zynqmp_r5_cluster {
>   	enum  zynqmp_r5_cluster_mode mode;
>   	int core_count;
>   	struct zynqmp_r5_core **r5_cores;
> +	struct workqueue_struct *workqueue;
>   };
>   
>   /**
> @@ -174,10 +176,18 @@ static void handle_event_notified(struct work_struct *work)
>   static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>   {
>   	struct zynqmp_ipi_message *ipi_msg, *buf_msg;
> +	struct zynqmp_r5_cluster *cluster;
>   	struct mbox_info *ipi;
> +	struct device *dev;
>   	size_t len;
>   
>   	ipi = container_of(cl, struct mbox_info, mbox_cl);
> +	dev = ipi->r5_core->dev;
> +	cluster = dev_get_drvdata(dev->parent);
> +	if (!cluster) {
> +		dev_err(dev->parent, "Invalid driver data\n");
> +		return;
> +	}
>   
>   	/* copy data from ipi buffer to r5_core */
>   	ipi_msg = (struct zynqmp_ipi_message *)msg;
> @@ -195,7 +205,7 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>   	if (mbox_send_message(ipi->rx_chan, NULL) < 0)
>   		dev_err(cl->dev, "ack failed to mbox rx_chan\n");
>   
> -	schedule_work(&ipi->mbox_work);
> +	queue_work(cluster->workqueue, &ipi->mbox_work);
>   }
>   
>   /**
> @@ -1154,6 +1164,7 @@ static void zynqmp_r5_cluster_exit(void *data)
>   
>   	for (i = 0; i < cluster->core_count; i++) {
>   		r5_core = cluster->r5_cores[i];
> +		cancel_work_sync(&r5_core->ipi->mbox_work);
>   		zynqmp_r5_free_mbox(r5_core->ipi);
>   		of_reserved_mem_device_release(r5_core->dev);
>   		put_device(r5_core->dev);
> @@ -1162,6 +1173,7 @@ static void zynqmp_r5_cluster_exit(void *data)
>   	}
>   
>   	kfree(cluster->r5_cores);
> +	destroy_workqueue(cluster->workqueue);
>   	kfree(cluster);
>   	platform_set_drvdata(pdev, NULL);
>   }
> @@ -1194,11 +1206,20 @@ static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	cluster->workqueue = alloc_workqueue(dev_name(dev),
> +					     WQ_UNBOUND | WQ_HIGHPRI, 0);
> +	if (!cluster->workqueue) {
> +		dev_err_probe(dev, -ENOMEM, "cannot create workqueue\n");
> +		kfree(cluster);
> +		return -ENOMEM;
> +	}
> +
>   	/* wire in so each core can be cleaned up at driver remove */
>   	platform_set_drvdata(pdev, cluster);
>   
>   	ret = zynqmp_r5_cluster_init(cluster);
>   	if (ret) {
> +		destroy_workqueue(cluster->workqueue);
>   		kfree(cluster);
>   		platform_set_drvdata(pdev, NULL);
>   		dev_err_probe(dev, ret, "Invalid r5f subsystem device tree\n");

