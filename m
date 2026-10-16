Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010041.outbound.protection.outlook.com [52.101.56.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE1438A72C;
	Fri, 16 Oct 2026 14:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162500; cv=fail; b=XctEh/cxgNk5qUld5AZrosDVvn2+BXlSHGfheRpZkXsJ3+nigcFx07SsIx2e2UAaggy79FH7wYkTBaQdpc3W8ZRoS0dqZKxTTM7qyR/Jg44kxnUFl/iejge2ogqKl85NBpMC7KCy85w+ZVj4PnguaTX65WQAW1eN8sT2klVuUUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162500; c=relaxed/simple;
	bh=G+bPIv5R2L1shNDAeY1Vs+mC6hBpxU1LyfzFJRKsvYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ngOmtTsj9WG130OowBSe7jCLtJ9X/EcKJ+kAfQJg7JXwjPdQ8v62OX5UV86ynez0o1vMwo4+XSCwTue0P5/xWEtZhpH1NMXpD35J//vIIZT7RAxWDgXzZCsqLakEQNjSh2JH1gYZ7N64I8wF+a+aDajgSWONsSWbp2g+jJdhef4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SzxrV0OC; arc=fail smtp.client-ip=52.101.56.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SzxrV0OC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4aQZZLN6ip4wJcA4MiCYcLKBmpgn/DGj6DJvSnendM3I/vJIGz35l5zEFpJstl+OvooyeFebGdzQ4deGOJsZim55h/u6McPV4m5sjI4VmdxXv8fpJCoAEUBcqIOe+ITlrolNAhn4Bo9I2ot1oEaL1MINGrcJql8Kiadby64KQr5ZrQZD0G5G6HIv+IAq8clj2azzSclt+UcRZp6Xr83Ib8ytgiO6h/kGB1N24iE8c0GrkrxfV7v7gBOG8pP8gl5Qz3MDT0DQr0xCfwYFaDsnTiRfbAl327+gLPJRVmCgVbY3udY+C0Pfnas7PIxBegekkphO15WerJEhb/449mkBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6LSxNlWAru9Xau3l1LiOwRsA+K0x1DXr0VLtPzrlLM=;
 b=RVDC70XJ7+Na8faTrPbOf8XD423JiB9zWdWe0YLkk7Y2WhF4Nbs/dceWPDvhN1eKs+mmOMKNepP8KUpaaPT1fu/OhHB060iBbqJDPQJRgqL8sVPTmrY4K47W9TCysNabXk1yomFUsak2D/+C956qJZ8yHJ1XyAXgyT0/120n46QripCggl3u0wcRmxxCeF4uRzUQXDt/eGu6yAx3VkcbvU1SDRmW5zbLqsjwAiN8vMIUv7Y7H9Z5s9QxIBzcqnXw0I/s74FQarLxCvzFYTpdB4lguMfYCK6MTNmJKRW2kw0pik01maDCeIiNi/lXUYKEdev2fgXlZJ6Hrtdj39yT2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6LSxNlWAru9Xau3l1LiOwRsA+K0x1DXr0VLtPzrlLM=;
 b=SzxrV0OCjVvBlYT5xVwYmVB4oYCxOGRrcor/REsMdJ4LjfKKfU1hmsemvHtV9PX5l4UN5D0ejENVb6V3TgAwm6os4eQltvjwCkVNTEk/f8kalBdyMqovDH4Z12orM6KZ+ZkDV9qw3iQ7b8sCyZ4EYudwPVJkLuIb0NOedRd2+7M=
Received: from SJ0PR05CA0204.namprd05.prod.outlook.com (2603:10b6:a03:330::29)
 by IA0PR12MB8326.namprd12.prod.outlook.com (2603:10b6:208:40d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Fri, 16 Oct
 2026 14:54:52 +0000
Received: from PH7PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:a03:330:cafe::4c) by SJ0PR05CA0204.outlook.office365.com
 (2603:10b6:a03:330::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Fri, 16
 Oct 2026 14:54:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH7PEPF0000000A.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 14:54:51 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 16 Oct
 2026 09:54:44 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 16 Oct
 2026 09:54:44 -0500
Received: from [192.168.1.205] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 16 Oct 2026 09:54:43 -0500
Message-ID: <0ad96f34-97d6-4998-9cf3-4b09ab6c94a2@amd.com>
Date: Fri, 16 Oct 2026 09:54:37 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH 4/6] mailbox: Add AMD PL Mailbox soft IP controller
To: Krzysztof Kozlowski <krzk@kernel.org>, Ben Levinsky <ben.levinsky@amd.com>
CC: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<tanmay.shah@amd.com>
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
 <20261014213426.2957480-5-ben.levinsky@amd.com>
 <20261015-aromatic-ibex-of-opposition-dafb43@quoll>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <20261015-aromatic-ibex-of-opposition-dafb43@quoll>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PEPF0000000A:EE_|IA0PR12MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d52b61d-e491-4559-fbeb-08df2b956e8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|23010399003|36860700016|13003099007|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	nHqkaEh4r10zH7E2VwrvGzg5mUexWzTGottt+mDiXfzMvBknOgA7EZIJnCgHUK6xT5PezXKbVP8b6VW7jU2k6P2Gb4hmR7yJw/Q4pReKH3RLPxhbmQbNY66aCYhjvb7gjbcpaZ2DaufhyVpFOC5bq/QMv0vWWDvbomV6KErvbT77YZjgqsP0ZyOdaWMDhcDYb+sLe6MmiNTNAGros/OQaHTP7JLieQvQt4d+kCWWV+KXC8awwQFLXEk6WdXqS6FbHnLDwy15Z6Ef3BxAvQXAa2EnGjekVuhH4wDcFBNMwVFv8dm+Ftcl3ZdvAElTtJJ54c99JWoHX2eS8RO1jnwqpBPRhscD4JAtHvAl0c0DHQlNNLJcJ/deYgqLK/5kul1MScKm5LMlYbx3Nqediapvi7plk/PX8+SgsALTTbnY8Jl9j6YYDQhcrRKRts1gb376DlQ2zocWDW1yuSW0pL8+hmLuewuHYwmA7y4xF+KXUWeFjr41cl0a49BIUdkMBsdJVhaOtzl8h6ebUR2z7sIBLjOKS4kS7YZIAKjOfu2UaLioIvrRAL0cqCZdXp2/F5VLatqVCbuvBalmvx1vWiHbCBGmxlk8g0/AdNjZVR9psfCoK3jE2Ntdpr2DmwWofPW0z6zrbNaVPNqSFW709Bapsg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(23010399003)(36860700016)(13003099007)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RwxIVHxTf7XIdBwFQ0YVRrCwdXc1SmJYsY8vpzF4L/a6OOCOIN/Bw2kh96r+oNzH6mHFB3Q3t5wDzdLvaBuW4iulhaArNaR1xgAlSZevWwa6FEpC2IqSRNEFoK89w50K54J6YsFWmhnCvgMtW33InrTZiOFscEs7E09rz3wan7L+uGqzH1YcyeCNhLMQOVfjGcpleILk4q99g7Yo3MLE0tKrGmPoDqk9mN55hURsgOC33DzXT1OBqZ7V5THkrjCXmFYa659zqtF7MlB4NRpB0B7EgVJRgzMhF2EsQnQSkOeGjzRdjLNq5nWarcIcyCp07xWFc8I06daYWaxsYfI5jsOCaSlmpOis0fvjuLj2s/iwVo0taKK/ATJYuC8t3QXcpWLh+rOocQ0JxxiWTKZDTPqP3SqqNxlnw8PDQ55dLgZ/wEsD4cYhN/H0s2tA7sH7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 14:54:51.3821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d52b61d-e491-4559-fbeb-08df2b956e8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8326



On 10/15/2026 4:48 AM, Krzysztof Kozlowski wrote:
> On Wed, Oct 14, 2026 at 02:34:24PM -0700, Ben Levinsky wrote:
>> Add a mailbox-framework controller for the AMD programmable-logic
>> Mailbox soft IP. Expose separate transmit and receive FIFO channels.
>>
>> Enable the interface clock only while a channel is started, before any
>> register access, and disable it last when the channel shuts down. Keep
>> provider probe free of register accesses and leave the IRQ disabled until
>> a client starts the receive channel. Initialize each FIFO when its channel
>> starts, use receive-threshold interrupts for incoming words, and poll the
>> send-threshold status for transmit completion. Stop that polling from
>> accessing registers once the transmit channel begins to shut down.
>>
>> Carry mailbox payloads in struct zynqmp_ipi_message, limited to the FIFO
>> depth given by the device tree. The FIFO transfers 32-bit words and the
>> hardware conveys neither a byte count nor the FIFO occupancy, so a
>> transmit length that is not a multiple of four is zero-padded to a whole
>> word.
>>
>> On a receive-threshold interrupt, read up to one FIFO depth of words and
>> deliver them as one message, then acknowledge the interrupt. The event
>> latches only when the FIFO goes from empty to nonempty, so a word that
>> arrives between the drain and the acknowledge, or words left by the
>> bounded drain, raise no new event. If the FIFO is nonempty after the
>> acknowledge, toggle the threshold to latch a new event for them.
>>
>> Assisted-by: LLM sparse
>> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>> ---
>>  MAINTAINERS                      |   7 +
>>  drivers/mailbox/Kconfig          |  10 +
>>  drivers/mailbox/Makefile         |   1 +
>>  drivers/mailbox/amd-pl-mailbox.c | 369 +++++++++++++++++++++++++++++++
>>  4 files changed, 387 insertions(+)
>>  create mode 100644 drivers/mailbox/amd-pl-mailbox.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index f53047aa8d3c..4e28e0c311c0 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1287,6 +1287,13 @@ S:	Supported
>>  T:	git https://gitlab.freedesktop.org/agd5f/linux.git
>>  F:	drivers/gpu/drm/amd/pm/
>>  
>> +AMD PROGRAMMABLE LOGIC MAILBOX DRIVER
>> +M:	Ben Levinsky <ben.levinsky@amd.com>
>> +L:	linux-kernel@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl-mbox-2.1.yaml
>> +F:	drivers/mailbox/amd-pl-mailbox.c
>> +
>>  AMD PSTATE DRIVER
>>  M:	Huang Rui <ray.huang@amd.com>
>>  M:	Mario Limonciello <mario.limonciello@amd.com>
>> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
>> index ab869769e278..3c3f262c903c 100644
>> --- a/drivers/mailbox/Kconfig
>> +++ b/drivers/mailbox/Kconfig
>> @@ -8,6 +8,16 @@ menuconfig MAILBOX
>>  
>>  if MAILBOX
>>  
>> +config AMD_PL_MAILBOX
>> +	tristate "AMD PL Mailbox soft IP controller"
> 
> Missing depends on Zynq/Xilinx.
> 
>> +	depends on HAS_IOMEM
>> +	depends on OF
>> +	help
>> +	  Mailbox controller for the AMD Programmable Logic Mailbox soft IP.
>> +	  The controller exposes transmit and receive FIFO channels to mailbox
>> +	  clients. It supports interrupt-driven receive notification and
>> +	  polling-based transmit completion through the common mailbox framework.
> 
> ...
> 
>> +	mb->controller.dev = dev;
>> +	mb->controller.ops = &amd_pl_mbox_ops;
>> +	mb->controller.chans = mb->chans;
>> +	mb->controller.num_chans = AMD_PL_MBOX_NUM_CHANS;
>> +	mb->controller.txdone_poll = true;
>> +	mb->controller.txpoll_period = 1;
>> +	mb->controller.of_xlate = amd_pl_mbox_xlate;
>> +
>> +	ret = devm_request_irq(dev, mb->irq, amd_pl_mbox_irq,
>> +			       IRQF_NO_AUTOEN,
>> +			       dev_name(dev), mb);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return devm_mbox_controller_register(dev, &mb->controller);
>> +}
>> +
>> +static const struct of_device_id amd_pl_mbox_of_match[] = {
>> +	{ .compatible = "amd,zynqmp-pl-mbox-2.1" },
>> +	{ .compatible = "amd,versal-pl-mbox-2.1" },
>> +	{ .compatible = "amd,versal-net-pl-mbox-2.1" },
>> +	{ .compatible = "amd,versal2-pl-mbox-2.1" },
> 
> So all of them are compatible? Then why do you need all this?
> 

Hi Krzysztof,

This block will be used on 4 SoC - zynqmp, versal, versal-net & versal2.
IIRC we should list each SoC where the device/hw block is available.
That is why we listed all 4 of them. I am not sure if the compatible
property in the YAML is presenting this correctly, but here I think it
is good. Please suggest if there is a better way.

Thank You.

> Best regards,
> Krzysztof

