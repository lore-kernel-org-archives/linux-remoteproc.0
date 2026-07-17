Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011030.outbound.protection.outlook.com [40.93.194.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24CF3D8128;
	Fri, 17 Jul 2026 13:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294029; cv=fail; b=eo6Gim2h/K5cDXJi9wQfrRZ1iDWdMOseCgt9sAevH7+yKhCQKDO9jSNDlVRmmZBImKfnRKNGzsIuy8inOavxpSejSrGu6/bnH1mQKC4tbTFj96/FknyPtGiDUKuBoUC9UPaRKm46CcrF6irOl+bDcKPkDQG3MBhxPTsBp2xhH4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294029; c=relaxed/simple;
	bh=E/2Be5vKfhaGkFKP+TL5DvpefAqGg8xFtnVKMQlwCNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=K7Oe5VEo8QhPZ9wFRiqU7RdpWcbJbyfHHhbNJBSGlClK7mTbpdGceBJSF1PXOtbLIOu6stCBNUFMapGKKWvs1/AGg/pU9Qls1gDbuykXZK/2RXr5+rYkZGqXGuIwfieK/U7PDKQz9Yry9AxjHUaj/PJzyE0r3GpN5sYVBEmNhK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IgEspzGF; arc=fail smtp.client-ip=40.93.194.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IgEspzGF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEnb3Lo4sLb5eCtJKwc2WDaW4MYWJ8DWOXH8bSvYMgKl9twEFfy6DJdWCWtA85aASndPVpqFpmZFXp4qBCxLPqXKpb+PH4yc28mmbSTI3UArMVy0uRDOz4HFNGX9I7mj8B4ZuDkawPNJoLBafkEDFcTVupUffjU8C5LkGGzqXX3qVFdyxOjzh9QoSNhSNANUYu44cshcYRIAuwfZsYGomreq/k6OcMbH6HQ03K/bSaB6BZMfqfI54Qnr/iyPe3QaTFKH0p4Uy7IO2mWCCnygsAp7yzI74vYSLnel5jtvmfr01SbYSn66AdVErt+bFiB0ECy2bkfjFq5JG9qoQS7THw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wK5wgv9/yMaKV0JxT2Yg8n9xzhWZ7SefE96ZQfcNXWE=;
 b=Q0uRZKFP4WOojKSyACq/gGsv8NSw8GHfCPJNZK/JCwqkS+dNDaY+vkIP4lEVYcXPXh7fE1S28joXMsPxtwdpedqDhJs0RXyCYgH1b0Vlua8ptfMSHQo9aXWpaXa1raI3bCjjSCcV8Xnj4rVagUMyuuyjMIDUA9CXE2/pMhNYqdkBlzjpCEFpiLorRgAYaj9uJUZZTB9T7fmuWdaD5GaONPKk09Ic4qpUcvGIbTtzWfQlyZkevBR6+MyYPT2v99xF31a9CSeNKhtuyJ2LfHV3mC502hkDXbPt+P7Z/UO49azdfQGQBnktLXWSQaEDtuUWOheWQG9OUzpJabICboOzWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=seu.edu.cn smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wK5wgv9/yMaKV0JxT2Yg8n9xzhWZ7SefE96ZQfcNXWE=;
 b=IgEspzGFY5sTWl+IOG6YC6gYY/f6pfZbIHu8zUHyTJz1wnJGiWclW0Ba3poxNPxZgCGCPklsmcuscfhNB67lE0b2q5rZRU5QKSTvQcObYV2ofm1cSOccnPmySArhngdaFLy22L7yj/Q8ayzu3QJI8TEL/j9mp1ZNGgmdFKFawRk=
Received: from BN9P222CA0016.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::21)
 by SA1PR12MB7221.namprd12.prod.outlook.com (2603:10b6:806:2bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 13:13:42 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:10c:cafe::a5) by BN9P222CA0016.outlook.office365.com
 (2603:10b6:408:10c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 13:13:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 13:13:42 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 17 Jul
 2026 08:13:42 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 17 Jul
 2026 08:13:41 -0500
Received: from [172.31.134.241] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 17 Jul 2026 08:13:41 -0500
Message-ID: <fab76b4d-aecc-42d1-be68-00a375defb5c@amd.com>
Date: Fri, 17 Jul 2026 08:13:36 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [RFC PATCH v2] remoteproc: xlnx: initialize mailbox work before
 requesting channels
To: Runyu Xiao <runyu.xiao@seu.edu.cn>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Tanmay Shah <tanmay.shah@amd.com>, Jianhao Xu <jianhao.xu@seu.edu.cn>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260619074835.2069212-1-runyu.xiao@seu.edu.cn>
 <20260717023108.4191518-1-runyu.xiao@seu.edu.cn>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <20260717023108.4191518-1-runyu.xiao@seu.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|SA1PR12MB7221:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f8b8d55-0698-4a8b-8d38-08dee405397e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|18002099003|22082099003|10067099003|5023799004|56012099006|4143699003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	xf955a3K3MTcHdcf6cSQRFxGP7LNrZdJI6xVKeX85s0fDEJA/vBnN0NMBpgx5tfW46CUDFwi4nzlBGasO7GlVLXr4USfl4i5f/WuTC5UtJvKAG2YNO6mR0t0D7BwQhMmAM9rkuAB3TME+OWv+nSzJ/KeMqXbJR8BnyUE3V6OYW8PdHo8jzi6YSOLM1B7Z8kzZWrEV/nubBIYYloCSRl16hkuoCN+u/32omA0pSWOx9BoZmMOx6HkVB8A6XckqqDwsK3UD9NroFUTVScHqYFFhyUUvdmeJbaeTu5Nj5oycMzIsBzMJiX2EI8lyKtlkrkaPWq9R64aMNL3qB9K9dXc+DbDRrDGQjtdDYY4njMcZDV7fIoBAai0zkzi/kK7N7jcXmUMozsU+3i33BD7Ra/IHwRSwjj98frxJzRTl3KL189ODOVed1GOCqddLlztH2MX3ADqYp7yRJnTEr1+GPE69BjWdi2Qrr2A2CY4vVWbTGjzQU/2VK5AWiWruWnKjq3Ci6bIR4fzejl98/24VoZwrpbyw3H7p0zHvsLBa8lsZU7tD5XnACeufm/SCei9hVH3F1QAQ1v4xkqkNZjKhLE/gYqE/lPm1L/3/tPRFyswHZzYADuUlrRQXiyy+NnEB2Q3Z3ggRSa6c0KHVg8OAl8e74AVeqGkJZl/k2iBTtgYwZuG58gbPCiEBym22vooai64vXRiT1VCvORoSawskuOVmQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(18002099003)(22082099003)(10067099003)(5023799004)(56012099006)(4143699003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SPS4DMFd2C2v6VAymzeDsCZPglwK7JsN2Ci/ToeyQJU/B/VnS43jqthaobAzogIRI49WhXQLodeSqdD+D2ERzx6Q6CdAPEbcCHEQnDNtBqs6tecHIhnnZy8ZFtIeCHe/HFM5ejqPOyzhL3glpYy6YfMzkrtP0oDJrhIZrcBdER8TvzzsbCXToh6fjgLyPsvx8Lw9u15Ajw1Mdki7bfqSd8ITIm1I0bF26T2XwdmdhYUPHhs18myddvM563DPOdSTK3GmKmQPDAshsSNa6EnEa2kMndP1uf8F+0CKRA89eX8CFh5Do7FhxUQUDXl4bBCg++hmRiqJsgAQ8E6qmK+lstl0uPlE/XdwbO+YwwPtdLM2kfoWn3xqvAf/WA4wM/wU6dtLkbesjtqVjP9662YqT6fNKEUb1GU7cgktGZZVgnin+RqgvVnxVAShK0IZUk+B
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 13:13:42.3333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8b8d55-0698-4a8b-8d38-08dee405397e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7221

Reviewed-by: Tanmay Shah <tanmay.shah@amd.com>

On 7/16/2026 9:31 PM, Runyu Xiao wrote:
> zynqmp_r5_setup_mbox() installs zynqmp_r5_mb_rx_cb() as the mailbox RX
> callback before requesting the mailbox channels, but initializes
> ipi->mbox_work only after both channels have been requested. Once the RX
> channel is active, a notification delivered before the late INIT_WORK()
> would make the callback queue an uninitialized work item.
> 
> Initialize the work item before requesting channels. Also drain the work
> before freeing thmailbox state, after the channels have been released so
> no new callbacks can queue it.
> 
> This issue was found by our static analysis tool and then confirmed by
> manual review of the mailbox setup sequence. The callback is published
> before the channel requests complete, so the work item should be ready
> before the mailbox provider can invoke it.
> 
> A QEMU PoC modeled a mailbox notification delivered after the RX callback
> became reachable but before the delayed INIT_WORK(). DEBUG_OBJECTS reported
> queueing an uninitialized work item from the zynqmp_r5_setup_mbox() path.
> 
> This is sent as an RFC because the practical trigger depends on the ZynqMP
> IPI mailbox provider and firmware delivery timing. If the provider cannot
> invoke the RX callback until after setup returns, this is a defensive
> lifecycle cleanup rather than a reachable race on current systems.
> 
> Fixes: 5dfb28c257b7 ("remoteproc: xilinx: Add mailbox channels for rpmsg")
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> ---
> Changes in v2:
> - Follow Tanmay's suggestion and keep zynqmp_r5_setup_mbox() taking the
>   child device pointer. Do not move the r5_core assignment in this patch.
> - Only move INIT_WORK() before channel requests and drain the work in
>   zynqmp_r5_free_mbox().
> 
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 3349d1877751..e36918b8d234 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -279,6 +279,8 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
>  	if (!ipi)
>  		return NULL;
>  
> +	INIT_WORK(&ipi->mbox_work, handle_event_notified);
> +
>  	mbox_cl = &ipi->mbox_cl;
>  	mbox_cl->rx_callback = zynqmp_r5_mb_rx_cb;
>  	mbox_cl->tx_block = false;
> @@ -305,8 +307,6 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
>  		return NULL;
>  	}
>  
> -	INIT_WORK(&ipi->mbox_work, handle_event_notified);
> -
>  	return ipi;
>  }
>  
> @@ -325,6 +325,8 @@ static void zynqmp_r5_free_mbox(struct mbox_info *ipi)
>  		ipi->rx_chan = NULL;
>  	}
>  
> +	cancel_work_sync(&ipi->mbox_work);
> +
>  	kfree(ipi);
>  }
>  

