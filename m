Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010064.outbound.protection.outlook.com [52.101.201.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2832940DFBD;
	Thu,  9 Apr 2026 09:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775728015; cv=fail; b=FPneAX4et4XDpC6qRBlj6S6JXIb7DI487TuKKpcqHSLh3WfEnG/c6cJVmOULQX72wDSKT6eoKHWwXwmIelgc21G6FlxL06iEgsFCwvd4nG1GqQfs+O6B5ER3SE1aDTAsMScpIRzikrZVeZbEHX1x8BLm5jI+7PV4LjsCERVm9UI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775728015; c=relaxed/simple;
	bh=hEjaFvLrEpD4VGkeozevBr5rveAT0EuTBF4RVGAlc3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=crwxS7YKO5OUKZVPZSSvm49NlmZAQ734jVnoQyQZ/HYeOf8OKEVDBusMwUZ34PJNmyyxHR78Op3vMlc7zS74nv87QdXBgiJzG1zv9Bqd24Cjkd+8981/XTP8giJr+Xpab5UQnzKOcNIGxdkZNoYWMmOUg7SjKl8GIpQhiFNQrAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Z/hxdAMM; arc=fail smtp.client-ip=52.101.201.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Z/hxdAMM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4YkOEyWtTGK8Xo5A6JY0HbmfqnRQqeat4Iv/fKR6hdQfQPPL453qPWAQKjRDGhRFJhm8kP5XLs9gzXrn4qT5jfsEiIxGfZzd7+AIIEiA0wRv1D7149ziFfYUQUivhpNif0oW+Z8MuFdPhpJyRRtMMPT2nFIFcAm+deTc/YVhMtzgOyBd7N+708zmZYBmw8qIDGOSxmA+ww2JXJx9tLbxj8qXcJdu6LRkyeuuBgrL/6M3g7NzDrHP9Omym4d/kPqArMJGOlkmSF8R8kLOpGFe5+G0NarP9adXnhA07vI0IbfjKvH5aSJ2KGta/NzbyfKdN45U3l2hcAjlMH88m/pRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7l9/EAy2qxglM3FAMRsj3AVvjR8HahU0Zh5bhJJH0bk=;
 b=ZmTa0W3qVtk07YT9SV4JT7iv9BS4PTl5jUC54kyBjZSxp56teCQa5VgGG+02zMB3E13MfXUGje1nLMCrhG5CozmJsL9hTYTWcSrJ/LBqavr2BMppmcDqvwmHfWFfsjyu8fRr1z5e3cjwsuWgLq7ETXYHwl7CJZwJWh2NYVTh/3lALLdD7+KtvYz0qRLpq6VpaKxUKv4RhMWqoxbC9UF2TILjkHCj//Zg8NL86RetaKh0txQ7E1hkW7cIbR0tZo0LcjqoKomQbdEiP1r6BjN4sdDZq5qrVYana6CHjjJ2KiptepMFo9beQjMnlxcO9tYA9CSolxMaz8MzuqRXy1B6zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7l9/EAy2qxglM3FAMRsj3AVvjR8HahU0Zh5bhJJH0bk=;
 b=Z/hxdAMMmJKfsQVpReKwxYB1qrU2EmcaWBOQ+ibN/6mJ+PoBPDqtZLUNAHDphkV3wap1DqqOxkUyEMxauqKWab+C9YUHFBUUJrD3rL4oTD04KKhW5nv/RGAxhisAe9KsT/2RvctEQU5KXO32uXfYvLWZvPW/RJI/mQdnXGYGhug=
Received: from SJ0PR13CA0203.namprd13.prod.outlook.com (2603:10b6:a03:2c3::28)
 by MW4PR10MB6607.namprd10.prod.outlook.com (2603:10b6:303:226::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Thu, 9 Apr
 2026 09:46:50 +0000
Received: from SJ1PEPF000023D0.namprd02.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::78) by SJ0PR13CA0203.outlook.office365.com
 (2603:10b6:a03:2c3::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 09:46:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023D0.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 09:46:50 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 04:46:48 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 04:46:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 04:46:48 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6399khl13560263;
	Thu, 9 Apr 2026 04:46:44 -0500
Message-ID: <6a4aecff-f662-4620-8572-3309ea6a81e2@ti.com>
Date: Thu, 9 Apr 2026 15:16:42 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
To: Rob Herring <robh@kernel.org>, "Markus Schneider-Pargmann (TI)"
	<msp@baylibre.com>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, Nishanth
 Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Vishal Mahaveer
	<vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, Dhruva Gole
	<d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, Kendall Willis
	<k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
 <CAL_JsqJq=3z7SQX_26MGGRcmysnGHVke8aTwyDCesvOuQjEN+g@mail.gmail.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <CAL_JsqJq=3z7SQX_26MGGRcmysnGHVke8aTwyDCesvOuQjEN+g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D0:EE_|MW4PR10MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b7e7186-5544-4494-1ef5-08de961cec5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	xu2DmDrgDuX0iLJk0Xara/X+rnbRrtI2wH/twfB/0qw8X1FaYOls/fR1MrmalkxsoHbjoy5IxdnbS6rJ1ib65yYkq/ie39Lf+Ca89uaXg4Lbi62nAU9GqFWNytOhCnpiQ1/nD4Sikn5EaLVxgL//i85DKJQM5jrcYDjN3aQ8F1dRyjqdUjxVMNhxNV6fEovXcxfyggA6DVCBoeePRpweNWelntRMuRSCRRK9B/xTqB8EiNXLLaRmbjgbXzdUkLM/C5BD+jcy4RFTLIX/uy5o3/o3Zh3hCw9mFOqZOcyCoRZesBpf9A1vB46xVz2UeJa3aZWhY/7LL93qVqjbXP2Yow/deXUxRSXYxjR3E6BgQmVZEUYKTjTFuGMvqs6q0oHOstBD92QDUOyQoQ3BCc5UbDOtBQxbq6PBwpVscN83l1J/I1oLv4hbq6koUVPtxZ5MzkSR6PDW/VSWLWZlnz5ZeMx6PfuN32dIdYnQLJVFvID7AQjGoowTaDt6grWb+jXuOEP/daki1hdlWQGow60rBuiQtdH0eOdRiiTHKWJay5hmY/9tSnl8km1WycOlRwNeFlAzd4Gi+F87MVhD5kdAnWhQz3YtDTq5iioTbexMo0t1I0y+NmuQGPDBf/C7iwjlCHoNHYrg/JyeB5r3yrQGq5p69McdncrKnQiugpyG069ChUH8xYXqs8upClLOuwn10oPY7eHZ2UramLnBcAaAF9DOZ4X3/gxqeaYu1OlZ/to=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	e93GMAIGeLeEp7oInMX8OOy19UCtAerA1HWqDW6/1rQJnOKcy2sEidI6IJnfHiD8t+DC5l/vb0Fn43NTibpGRFLIKhhgv2Ggjg3blLlst8Ld2gw1OQ3VTp5Dxv+4LuEiGnpXtkJOV9Jq4Vj6OHyUQ2cY3SV62UMEQANHCRG0QioEfT5BtpkOBeXWUWKeFZoceAX3BjPfu6DcW632X5ZZUQ6JW7GvCKYUBf+xXsnK+EdreE8OB2FDTESrKF/wNJ5P4bsAEMh4EL2NyUGL378qLwsCTcJkfKlPn5QHNRUWhKqrzxZSKhdLtcu1V/QNgxxt23bl1SO4yfzWie/4kkGKLOb93T7L9lTjwRHAEt1U29iUsFiiCtj6RTQYx0IX6E+ztUsHnhJcvgtCunIMkjpESZSHzTVvr1piI4uOAHv4KFSH34sJcwEvww3QVRZAOdgs
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 09:46:50.0684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7e7186-5544-4494-1ef5-08de961cec5f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6607

Hi Markus

On 08/04/26 20:33, Rob Herring wrote:
> On Wed, Mar 18, 2026 at 10:14 AM Markus Schneider-Pargmann (TI)
> <msp@baylibre.com> wrote:
>>
>> Hi,
>>
>> Split the firmware memory region in more specific parts so it is better
>> described where which information is stored. Specifically the LPM metadata
>> region is important as bootloader software like U-Boot has to know where
>> that data is to be able to read that data and resume from RAM.
>>
>> IO+DDR is a deep sleep state in which a few pins are set to be sensitive
>> for wakeup while the DDR is kept in self refresh. Everything else is
>> powered off.
>>
>> The changes in this series were suggested as part of the IO+DDR u-boot series:
>>   https://lore.kernel.org/r/814c211f-a9eb-4311-bb84-165b1a69755f@ti.com
>>
>> There are currently no real users of the memory-region that is split in
>> this series. The size of the memory-region in total stays the same.
>> The new layout is derived from the software running on the r5f
>> processor:
>>   https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd#L172
>>   https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/source/drivers/device_manager/sciclient.h#L459
>>
>> Additionally the two important devicetree nodes for resuming from IO+DDR
>> have the bootph-pre-ram flag added as this data needs to be read before
>> the RAM is in use.
>>
>> Best
>> Markus
>>
>> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
>> ---
>> Changes in v3:
>> - Squash the enforcement of the memory-region-names requirement in the
>>   patch adding the memory-region-names, as suggested.
>> - Link to v2: https://lore.kernel.org/r/20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com
>>
>> Changes in v2:
>> - Make memory-region-names required if memory-region is present
>> - Fixup memory-region and memory-region-names conditions. Require either
>>   2 or 6 regions for memory-region and memory-region-names
>> - Reword and restructure the binding documentation for memory-region and
>>   memory-region-names
>> - Add memory-region-names to all uses of memory-region
>> - Link to v1: https://lore.kernel.org/r/20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com
>>
>> ---
>> Markus Schneider-Pargmann (TI) (7):
>>       dt-bindings: remoteproc: k3-r5f: Split up memory regions
>>       dt-bindings: remoteproc: k3-r5f: Add memory-region-names
>>       arm64: dts: ti: k3: Use memory-region-names for r5f
>>       arm64: dts: ti: k3-am62a7-sk: Split r5f memory region
>>       arm64: dts: ti: k3-am62p5-sk: Split r5f memory region
>>       arm64: dts: ti: k3-am62a7-sk: Add r5f nodes to pre-ram bootphase
>>       arm64: dts: ti: k3-am62p5-sk: Add r5f nodes to pre-ram bootphase
> 
> TI folks, Please make sure these dts patches are picked up for 7.1.
> There's now a crap load of warnings in next with the binding change:
> 
>      58 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a
> required property

[...]

> If they aren't applied, making  'memory-region-names' required needs
> to be dropped from the binding.
>

This breaks DT backward compatibility. Why is memory-region-names now a
required item and cannot be assumed as "dma" and "firmware" as default?
Is that intentional (should have at least had a Fixes tag then if the
original definition was wrong)?


-- 
Regards
Vignesh
https://ti.com/opensource
