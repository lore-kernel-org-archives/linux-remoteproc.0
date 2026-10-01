Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010040.outbound.protection.outlook.com [52.101.85.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606073BFE2B;
	Thu,  1 Oct 2026 17:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790875103; cv=fail; b=gFkUwlgTlje5lnVWUU2aAAD8FS29z/exrTs23H62Fm5uFdCx4TYp1msYAq+S63rsqOatZNZvQ5/G4KjWWYPbeYnIVyox0Fg0ZjPWYJLyRiMRCwab/YnSSs2VGDUfRQWwLzlvJkmspdazM8B95fffj+gU7X7Znem+FxErV1ijYto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790875103; c=relaxed/simple;
	bh=+jnCyQstL+C49n/6mdpTbpGTACest+WQXGzZcdnnk5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Mzuv90i70+DtDxWR+3we2k8hO4szwJtUfg6lS8wXZFKaQdJ9ou6OrM/o/fpvTe2r86p7has8TN0zA72zHbhfFVhswagJwPqoQyiZTcM8ZiMe4g6N9ipZyVOu0njWaLm7o30TQFCxl+AgA8zWBQ7VR/NX4DwutqhSgDvJ5MucnBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VcuujY0q; arc=fail smtp.client-ip=52.101.85.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VcuujY0q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZFAMm+8JCr20H6xBvfm/fTIKKGhiDRvGkRFVMB1VHuWYVCFJGFnsA8LXTcWCBZd4UhrpDyAw5bknnWb7xEpYVA60iw0e6Y8skurQFbIPwQP080/PTXoeiIKu9irncr4eHbNtdTDHNtIY1KUaaBWAAzCpKtAJqGSX6fI2LmgjYKvbS8HJb3CMXAUjtQZhXSskXoPCNd0Lvz8Gl+sS408o9NneBDT0h2rdBXz8h8uXqByxMeq80Bob2VXd2ox6fHEBP1OhlZTXKZKy1NzATK8GEG1rkVNwKntG1nyrOCGBBc/KArcmiUGCWbUsc8I0MD89y4HuhreQwzeRfZhhesJAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKAOmYL8tbLEktpaLH2R8FwrpYWAyx8gghnO3MitqBI=;
 b=gLiMu5+2dS95a40GOaggEm21q1oWQsX1DN7D4EGvyNTDKiNroS2B+ErcdDdukoU2Tbznes/pSwQ+YgnhMO75a4oGrJt+gpZfEY8bE/CiPfVvUIOJsmTMXhMxQIARqCCy0bRrbPLgZnv/XHp+ckp5F3mbR1Cmww1rJt92tGkNmVGQMuPzeyRCDgmMGQyC5n3LMWbTjkeolnlMuYpC+EGKjZ14cq1STaVP0/sy5yWqZycFvhwHTht3zG8JEH9m78fSE3i3EPhSo6Hl0Dq327pSRWpJbVtyVYwf5DLMgeJIgLK6w8lEn6+t7qKYJh/vz8vza86TdmFvAyWv8nPbZrWswQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKAOmYL8tbLEktpaLH2R8FwrpYWAyx8gghnO3MitqBI=;
 b=VcuujY0q2lASQGRY33waPlv7950+ibNxKFxtQ1VKbjVRywyrsGDoBpfnPVreHXO92BeNrUPdmfgEwl56JAikATfcyQOUj/jpwkTIPjWqfeJDpuEZrwBZu012bwGPabgBWI3eAXlgoqTafT8TGoqGpn4EetviWOxuiA1lRpq9jSY=
Received: from SJ0PR13CA0082.namprd13.prod.outlook.com (2603:10b6:a03:2c4::27)
 by PH7PR12MB6666.namprd12.prod.outlook.com (2603:10b6:510:1a8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 17:18:18 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::12) by SJ0PR13CA0082.outlook.office365.com
 (2603:10b6:a03:2c4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 17:18:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 17:18:16 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 12:18:11 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 12:18:11 -0500
Received: from [192.168.1.205] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 1 Oct 2026 12:18:10 -0500
Message-ID: <6e13a1ca-adc6-4c26-a9fe-63f4b046cabc@amd.com>
Date: Thu, 1 Oct 2026 12:18:10 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] remoteproc: remoteproc_virtio: reset vdev before removing
 it
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Francesco Valla
	<francesco@valla.it>
CC: Tanmay Shah <tanmay.shah@amd.com>, <andersson@kernel.org>,
	<ohad@wizery.com>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260924205901.2505186-2-tanmay.shah@amd.com>
 <arjZvftSMlG3OMHP@bywater> <ar6PTLS194v3YJPU@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <ar6PTLS194v3YJPU@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|PH7PR12MB6666:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e621900-4200-4ca4-8311-08df1fdffb6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|260925021311599003|260925022911599003|260925021911599003|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZQBsZbVT6WsHFE9UNp/V9JGLTvlqtUtQ1Yyef/sca2o/YPmEPUEeY8G/kS/FJllurNpSDYRZoyJzn14dAfWvmNqR+PjHGJXxO+qqvu+cNiaJMikMpCFRQhqgitJ6N+qJ6jslCOopQgSyIkcAKbIEpKOBC24KPuC4XCmNOrVcnGZVsOr5wh8OyghA9e8mszHPHotz60y2UUohp90yYZEm3yw+kxZRTUa3F7eEKNqPHqYFW6gtNcEskUzZFge7QyZIvNBkUINikSEp8Z5LBqwh3K7k6jiYbTA3u34TO2f1bANjEiXCvDz85i4IHwuAqwaH6g6k7PpOb3qnUaSNpacg8Dw1tCiSzeKB/3YQTXTsEly7SWTp8OmnyzwC/M+OF1QgYGRbSIor2iz41fQHA/ak4aAIMYvbAs9kQtds2XAcem/nTPZH08Aw/0hUx8G6Hnuk5X8vEOi+IvOBoIKbcsaFsV8Lh0HO/3yyBO62rOU8DJCSx1oeu8TnOIaZtqUDYG0i5BOiU6M1oi61PiW86XYy9Kh+5NRjSupI0S+LImHARwWK+Wf9HYoEEEUSQElNvSlVfaSqwtXzCNEn/bDndjQ7xmJUJYbjpYeQfQnscZn8IYb9blwOJR42EAhmrtrk/udrZrlylPLaMkKUMjSHeFmUQ/mdtCrYevQzzZmq+mXhJdhcl8uA1BQdxVdM5NDXZ6nxW05ZEuRsELyErRv5l6YOTA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HNAURV3qmhIJ3P4akbNkIUL9SXr25udpVeIX+GLs1xq5DqDBa5wXP+lJGjcnV4eDjRW3CdUdRebW5UcTGvvUSgPo015EbRXNCjLDywL242I09eU9VWNDqN8h0JsrM7+Akon22YAbbFQADbbkYqG2q+1ZOFShaBPaW2eMQkyvBw+MDOq4tl+bsJ+2HsakX3up38j/X9eOOzEV7gZ05M4hRJ8n/9kAIOYM3M12plBg/Clhajse446gqmqEu54pbfprCkZ1va/dmZhOC1YdDzRA2Z/UcAB/fm6ByPERNu/XEdUav0vnrUFeMDVZhGdVOfgaynQ00bkTUcsCE5JvEbRd1urJ/K30kfhurZtLwUnksE+kHFFbN241gruUi9AJIy147XKhtkYv53GGp0bhFlrsbTY4a8tIV6Jy6UNeGVcGiZMhgZM9C8GRWSGz+cTpMIw+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 17:18:16.4863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e621900-4200-4ca4-8311-08df1fdffb6a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6666



On 10/1/2026 11:50 AM, Mathieu Poirier wrote:
> On Sun, Sep 27, 2026 at 10:55:59AM +0200, Francesco Valla wrote:
>> Hi Tanmay,
>>
>> On Thu, Sep 24, 2026 at 01:59:02PM -0700, Tanmay Shah wrote:
>>> The virtio device is removed when the remoteproc device is removed. The
>>> driver should issue reset on the virtio device so the remote can do
>>> corresponding cleanup.
>>>
>>
>> Shouldn't be the driver, and not the transport, the one that calls
>> virtio_reset_device()?
> 
> Function rproc_remove_virtio_dev() calls unregister_virtio_device(), which calls
> device_unregister(), which should end up calling virtio_bus.remove(), in this
> case virtio_dev_remove().  virtio_dev_remove() calls drv->remove().  If we take
> the RPMSG driver, rpmsg_remove() calls virtio_reset_device(), so explicitly
> resetting devices as part of rproc_remove_virtio_dev() is not needed.  
> 
> Tanmay, have you observed a scenario where the above isn't working?
>  

Nope. I didn't send the patch based on any practical scenario. This is
an old patch that I had used at the time to issue reset on shutdown. I
missed that the driver is already doing it. Probably my assessment was
incorrect at the time. I think we should remove this patch.

>>
>>> Fixes: 7a186941626d ("remoteproc: remove the single rpmsg vdev limitation")
>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>> ---
>>>  drivers/remoteproc/remoteproc_virtio.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
>>> index d5e9ff045a28..1cb0ee0ea656 100644
>>> --- a/drivers/remoteproc/remoteproc_virtio.c
>>> +++ b/drivers/remoteproc/remoteproc_virtio.c
>>> @@ -469,6 +469,8 @@ static int rproc_remove_virtio_dev(struct device *dev, void *data)
>>>  {
>>>  	struct virtio_device *vdev = dev_to_virtio(dev);
>>>  
>>> +	virtio_reset_device(vdev);
>>> +
>>>  	unregister_virtio_device(vdev);
>>>  	return 0;
>>>  }
>>>
>>> base-commit: 5f639b3018c0026a5341949724b4b921cf3a3d5d
>>> -- 
>>> 2.43.0
>>>

