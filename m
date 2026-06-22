Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011035.outbound.protection.outlook.com [40.93.194.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D15817C211;
	Mon, 22 Jun 2026 18:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782151228; cv=fail; b=GtE+tlK/z4KgaMRu7SQBb/+s48HgbMYrjETpUhHe4a1Sa2EJaREaW4SRJkh6um/0xvhqw4F/4v6uT4q8mSdr9GM/5gz5cO5cY9912hnnY0F2N0q0A2i069yQNO0JQlVsp/aV+O/9xXFEKs3j3pnmJGrbrAYg2ARnLUqI0IXm0eU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782151228; c=relaxed/simple;
	bh=ri2oWQS76p5sCHe9+v10FKVLCI3eJtRkj7BM72gdC9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pEcJF3ZshJ+ZvNaw7s3cKPrEd/6IR9SfszeUZdxubb9cVbzsST+Zjm/ULgqD5DWKIWEeibHbiwc0AFq4YJL4aTNKT7quBO8ehiLkbIxBNI0VrlTrt9Zd1/B5Ui0J20s4R/75mUM/QSNUWcZJ1ka4qQ79AJdw5J+2HkyBq0mV3NY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Zpw0TSD8; arc=fail smtp.client-ip=40.93.194.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Zpw0TSD8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntQZWVyFXkN9KGvyM8FEIoNFIWyIYkV6xz928WeWyntewutG89ZpR+/+WtIusj+W03RgzQbPD7DfcU0Dm2RAIr/J69eOxMPPYAW8cZYF1bCrQPCC9YG9aEgw5bvp3JjPWtJmP3D1c3jcWoN/Nbu9AYqx7TDJhPOtB+uet1GPk1l7iij424Ka3VgrQWImdq94gmrKNwdmC8z4gJdCvboxU9IE6gH4ARDV42RebxXYtV+6IxsyIqmqDzudNuaXEO71hsEgyXuJma16JTrQXI343JMLSWbJDK+ue5WIqavBP0e2vDshkHj4u65tDtT9z6Jag+6h6HLuv241sKyy47rLXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTz8Psqh/n9WJCAX4eML6onJTs3rTIRdQ/PiJLunKXo=;
 b=hfilOUb4qnX53dzDEoRLUjv8AuWF7Osz5vXcZwOlX2uSZOoiK/wMDO3nrW7Zj/V1A9xC5rO5K6eZyjtvhlRRislXOnW/lJmIcnzxHnybncXph3C4rMfIqiBJdzkb92Ud6fwpKin6USTMN84iM5RqiEN44xjLzCSZ6tDZ9ekeVVvvGrNJn5X8k1C/LZ41a0UdPPrLXA//UkrABLUpn1K+zK8ZDszOtst9VK70qIFSvD1IUoJ+xWOiCcYRZ/VCT+HI/Ib2Bam1aoXWdpJ/XYNFf263jWqKGCyaQlJoy6ox5Kv+GJ1UFH17+6WTHGuK5BWCNH4552+RguCkkb/AvnadQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=seu.edu.cn smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTz8Psqh/n9WJCAX4eML6onJTs3rTIRdQ/PiJLunKXo=;
 b=Zpw0TSD8L4dbBCRYSjM2q3//OYISSQp3ezsP7JmNRXJPMWWsZofied8ijWEsc5jboqugnpEDY8uxrSzGdNi7MMMm6eNvtx9/kpXZZPcaf1Uyg4Y2S4E8kxmFCv2jLIfS8dS8XZGOu4BNybFjVgix5rJhb3kfFCXHCA3bT217nMY=
Received: from BY3PR03CA0010.namprd03.prod.outlook.com (2603:10b6:a03:39a::15)
 by SJ2PR12MB9162.namprd12.prod.outlook.com (2603:10b6:a03:555::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 18:00:16 +0000
Received: from CO1PEPF00012E82.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::19) by BY3PR03CA0010.outlook.office365.com
 (2603:10b6:a03:39a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Mon,
 22 Jun 2026 18:00:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E82.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 18:00:16 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 13:00:15 -0500
Received: from [172.31.11.23] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 22 Jun 2026 13:00:15 -0500
Message-ID: <2d6971cb-f934-49d0-b903-772ab43d95ef@amd.com>
Date: Mon, 22 Jun 2026 13:00:15 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [RFC PATCH] remoteproc: xlnx: initialize mailbox work before
 requesting channels
To: Runyu Xiao <runyu.xiao@seu.edu.cn>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Tanmay Shah <tanmay.shah@amd.com>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260619074835.2069212-1-runyu.xiao@seu.edu.cn>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <20260619074835.2069212-1-runyu.xiao@seu.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E82:EE_|SJ2PR12MB9162:EE_
X-MS-Office365-Filtering-Correlation-Id: 9991dbd8-31d3-44d6-f10e-08ded0881d7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|6133799003|11063799006|5023799004|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	TvBp5dVFUCGRme34UcK0z8wTTVAv+IB2uhy3R8FV/ZvvG+Y40guwI4+NEhNLd9pyCkvUg+PZ6bXNi4S7O5rKck0oBBor05BTO1KRjHC2JYgHJ2iRn6AX85cEHZLrgINO7R+cUCYKgkFJ6wDO36GU37JWtBlmLR4OxDBTe7TU+j/O4bi8yYkrsitArCPoEsPnouFlunjxRNxTcBL5E8lhTURrminYzLe11IDdPrfg4QtUKOu7VJyJb5b0b1aOHC9gqJXmn3AEGjkFNl70+ZfDTNzpLYHrbZdtR4Klrej1k3jwGMW1hqXKSViZaf2/mGcdXfB77Z2xZxFHjigT5P4UTJH78Tpix6YCnudgzTFOAiSDnv/+uLjusUEbjcGk9WmIL75Bv9lmVkf8wWfumgB59yA0lrMEvta2LhDwY5NeJtBZh78gR9B8S87PwNQ3yhFpwsuLWI2ZP7tHmpsFTfiyJ05OObiNYKmXnRA0AkXgDqF1Y1vXPyyukPTBjKd9uA2KW25HXFLmNsBBUlOVblRQ3aLuz8/2GF+0J0wZzO6Yp5chiBsp6AyUS7Hn1KuCr+vDUDMwXne0+tHckfBiTsS+yuRmK/QZSAGDkh+6UF6pFtCtDM2WaL+EQj2XvAB0aUNrkuAmAsJyC4p9SH0K8zp6UYA3Wx4PBQlspsvov0tiP732xvncXJyo8RT+Z3yZCu3zrMR1Z8AzHMMMtezS1y7bDQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(6133799003)(11063799006)(5023799004)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aT9/4PdNM6GshofkvKCynOQk3l3YfJajagmt+a8CIZkd48NymXIuR+bXmyPoh4K6R03IMnR2WZ7Pf1uYfso1+3EHfvjDfxgtTJdZCnbtbt/213Tn5lu324IFEpOZQqOh4k8CofqHABXp7TSAqRdXuukkHEa8BaBsEt5Lwq2XjsLPmLGlFRbWjybpnRjAvVBAHAkLWs/6ydlx5kswYH7vvNMLXRfPyWD7HQeukaWS+yR0+htA5OQLRuGP2jPbODYcG4/9Qad1EQ1ayZji0DqVw8sHxuy0vB+MKWFZfEpy6ahhNTMupGcjO7qEMKQoZOmghoYB4g3IGyknuXVOT/F4LpD96X2hnfu9kEzmaVdYBYXdTaLw3z+XTRKESjBYA7RzaSqaiSeW9gkJqOp03eC4E31Keyj7e/DL91o5bps2aIwMhTJyKrzYYRJZWQfm63ZP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 18:00:16.1255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9991dbd8-31d3-44d6-f10e-08ded0881d7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E82.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9162

Hello,

Thank you for your patch. Please find my comments below:

On 6/19/2026 2:48 AM, Runyu Xiao wrote:
> zynqmp_r5_setup_mbox() installs zynqmp_r5_mb_rx_cb() as the mailbox RX
> callback before requesting the mailbox channels, but initializes
> ipi->mbox_work only after both channels have been requested. Once the RX
> channel is active, a notification delivered before the late INIT_WORK()
> would make the callback queue an uninitialized work item.
> 
> Initialize the work item and its owning R5 core pointer before requesting
> channels. Also drain the work before freeing the mailbox state, after the
> channels have been released so no new callbacks can queue it.
> 
> This issue was found by our static analysis tool and then confirmed by
> manual review of the mailbox setup sequence. The callback is published
> before the channel requests complete, so the work item and the state used
> by the work handler should be ready before the mailbox provider can invoke
> it.
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
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 0b7b173d0d26..1477fc542afb 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -260,8 +260,9 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>   * Function to setup mailboxes related properties
>   * return : NULL if failed else pointer to mbox_info
>   */
> -static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
> +static struct mbox_info *zynqmp_r5_setup_mbox(struct zynqmp_r5_core *r5_core)

Why this is needed in this patch?

I have another patch that I will post which moves mabilbox setup
operation to rproc::ops::prepare(). I think the interface should be
changed in that patch.

>  {
> +	struct device *cdev = r5_core->dev;
>  	struct mbox_client *mbox_cl;
>  	struct mbox_info *ipi;
>  
> @@ -269,6 +270,9 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
>  	if (!ipi)
>  		return NULL;
>  
> +	ipi->r5_core = r5_core;
> +	INIT_WORK(&ipi->mbox_work, handle_event_notified);
> +

I agree with this part. IMO This patch can simply move INIT_WORK before
requesting channels and cancel_work() in the zynqmp_r5_free_mbox().

Thank You,
Tanmay


>  	mbox_cl = &ipi->mbox_cl;
>  	mbox_cl->rx_callback = zynqmp_r5_mb_rx_cb;
>  	mbox_cl->tx_block = false;
> @@ -295,8 +299,6 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
>  		return NULL;
>  	}
>  
> -	INIT_WORK(&ipi->mbox_work, handle_event_notified);
> -
>  	return ipi;
>  }
>  
> @@ -315,6 +317,8 @@ static void zynqmp_r5_free_mbox(struct mbox_info *ipi)
>  		ipi->rx_chan = NULL;
>  	}
>  
> +	cancel_work_sync(&ipi->mbox_work);
> +
>  	kfree(ipi);
>  }
>  
> @@ -1388,10 +1392,9 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
>  		 * If mailbox nodes are disabled using "status" property then
>  		 * setting up mailbox channels will fail.
>  		 */
> -		ipi = zynqmp_r5_setup_mbox(&child_pdev->dev);
> +		ipi = zynqmp_r5_setup_mbox(r5_cores[i]);
>  		if (ipi) {
>  			r5_cores[i]->ipi = ipi;
> -			ipi->r5_core = r5_cores[i];
>  		}
>  
>  		/*

