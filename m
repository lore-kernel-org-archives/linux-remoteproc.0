Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011011.outbound.protection.outlook.com [40.107.130.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0928E3ACEE2;
	Tue, 19 May 2026 06:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779173952; cv=fail; b=MQCPJEewetojjNV751DHhbQjX+Bky/E+tdlPp4ll2DdeFGjPR+5Qmq5X11mol4raH0/qtSHiYmHjuVEgFTJTkqPxwbsCf8AtMxNt+L7l4LbLgKVZPm6s2wiXJiWje6EKN+ePMTd8TzJeVGO4vYK744W5DMPPjqTV8NkdlasoyuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779173952; c=relaxed/simple;
	bh=wgaFgCxkjHbPe4a1c8Wpcxwc8XxMF9vZ6SHBS9CcdtU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=Khyt1ySJOic36wQYlkjLFlP80ZpQrL/E07lgihUZ3gXSsOIqsLLUQtU6u6mMccr19RTmGaVyCMVlsMR8/b2MiViiMK6Y24SChx51tAcHfUamUatr1HCMaE28X6YgyoBTcAbSNTmh1HRhQtjDiq8ohJkBeoqaz4+5XdS/AP1Dvmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=P4jr3sTe; arc=fail smtp.client-ip=40.107.130.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="P4jr3sTe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EbKrQF72LLdJVbtFORlewv/B+cvfl7GpA4sD9NB4mpV0mhex5zx90TSQ5nh+yIfOsbfcjCCGN5pxdST2pCoCLhWy60QEcEhu7hiogI7YeBProKRZw+DyDZt0AnQYjGjhkU8ERls7TA9ns7Ihxw4U7WRJ/vD0836LU3W34rlFSSgoCYHntxgY+U86i1PWsTtQm6HWClYZHOpMpVDqwceAPuCkjH8uAAyfJz8vnPts3YjpZYJnl2JyBngZV4kW8FZzmTw/WmjGKLk0FPKNpA1RJoGLceSPUsR1nnSgXHTmQPJVqXVOsoyDFu6E/D/by8A+IlagTNbleNBUobDTTTJ0tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/rEmcqmDnc+sCo/O4DfYeF2YVGumi1M8d3Wu4vOy20=;
 b=Q3j+P1vtt6fgG5MiL2wXQKsmoUah1jmjGJKYgDAOz0MxHalahPIvpXZ7eGoA4iPyDnFPfPxkYX4gfBfNp2cX8d8oH3iSfSXn55e0vo6gC1IYYUJuCQkJw1n7ewsU6qVqta/l7JZNylWGh3WukIFf1eUJEObTz/IREOMIPsI2AMcSOBsO9wI0v5aMavA7EgHqo71vY4VZ7IbnuWxD7M7iWV3NtciPqIAtyBAWrH7v6VSZ+x6bVFUUAdkXSagCc3fmfeYVhfYxfIlvmLSFj/LMXw4a1kV8vYRBELc0hqCvHSYtJnfJg7o6UGhJVcgV404bOYQKj/GTMFl0H1K3GR3QJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/rEmcqmDnc+sCo/O4DfYeF2YVGumi1M8d3Wu4vOy20=;
 b=P4jr3sTemrjzf9NrkEhCw6f9PMuqZ+m86jbnn/qfkZjHgqDYJf68tm1rFqMaR7CxYgdKjrk4J/00KoV4YnHtQc4Q6It0ommSFPReepkdRnGm9FNDW+tDCCAQ4RgNUKCmzwHn0nyg2AbTtAdE3h/bWcAUlRgYjWRJ+/EqDHQQxFVLtgpueKNjV73Iy5dO9IrWIxE5rJaefpAg7K1je3BA1s1kiBDATGOFq93T2pNbjKpwxKdy9ev6W03Z3rHBMbmGNKARe8UMw+iEcnbWFhAkP5zrRh+gK2lFK+NwRcQeiquL3knhgdM1BEanMVdD4J1eYClYF51Jnn+oj20q79C2aA==
Received: from CWLP265CA0540.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18d::15)
 by AMBPR10MB9730.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:76a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Tue, 19 May
 2026 06:59:00 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:400:18d:cafe::9c) by CWLP265CA0540.outlook.office365.com
 (2603:10a6:400:18d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 06:59:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 06:59:00 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 09:02:52 +0200
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 08:58:59 +0200
Message-ID: <c57479c8-6d86-4c64-bbee-629d51890a38@foss.st.com>
Date: Tue, 19 May 2026 08:58:57 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH v22 0/7] Introduction of a remoteproc tee to
 load signed firmware
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor+dt@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Bjorn Andersson <andersson@kernel.org>
References: <20260414152904.1679724-1-arnaud.pouliquen@foss.st.com>
 <617b40df-6e51-44d0-9803-60b2e47217ff@foss.st.com>
Content-Language: en-US
In-Reply-To: <617b40df-6e51-44d0-9803-60b2e47217ff@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C714:EE_|AMBPR10MB9730:EE_
X-MS-Office365-Filtering-Correlation-Id: ca116125-2b7b-4e56-7739-08deb5741ac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|1800799024|30052699003|13003099007|4143699003|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FiGfjU1CRQhweiBvd60ZqCBhRxu+8GorTIcobK/Bz6zd/l4CyhsLBFnYPleeoySdtySd4w2VeNYaaZi9gHlJNr6L4286AhdNvvc7t8E8EMffpWke0l4/2NXiMjVwWyrlkNfF4AoUCIZDKubNMzOaJvOFtKVT7MvRqCDKTDfI/68xBPHykl5nhAeK/2a1w+Ipl7E4kBvS7Np+B6FLVsOlkJevTRdyVt4xPoLR9XnCAICMp5zUaUIbLB0tkompI0cU7IFgIMv0f7a1va6TwUbcqfIIm0pmQ4fgi4XkxKqEKYDviali8Z4AvhfcNmVE5ETCt+iAvGY/ijMRk2rFzO3WDCXcLpGXnX7sXwm/FFFnq2QUQwsWugOC6RWkUbxVI5+04SB3lQ2i+tlQLy3JN1FkQpT6RENuwFXoXtupIsBHBnO/25xL7A5nu+AbPlL8Fskpcd1NsyCatMw8LC1ulFAjE1lTFY4mUb9N1JFiMBZnHT0gidC4q7/KAdXfzHEMzixF0ZJooJmf+ZOvqE/5sM8TBNd79aXA96pP9Gjgx25mthQt+AG+BlBn5YA0qW7D9lJJrBftUaIkjN9rw1mQqO3dCJlQMpPxAFmKfos6R4QGi+a73uWZCTcRZ+AN3V2LUxxZM86tAkINyoGWIcDZq83pV7CtuscmD0qdms4uZ9CFDrYrS/ypViz9RvP4NyByFna6
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(1800799024)(30052699003)(13003099007)(4143699003)(11063799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w8oX8jNkMzevsUjZOofVFJBA7UB6gRNhQgBXqU133SdnM5nx9hfQbPMt9T0IBd5AYLXAHH4Yih2VHOl8b3GzKgqJ2DgZzthSsw4q2xRHe52aqiyykQahWaCtcoCav4Wkzo6OraErYVt0JwAAugwWunhN5ji6AIqpcD7+REMvmFFHZCiQHaeIu9U6mLGxgiuq9LSf0b+h5wDDXxdLlXlcbxOCK+DPngg4xe8+mI5MfeVm25l5xkYO0n27WTzwz/eTKy6QMRxUgll6vDQc0TjCnWjoSwlSzfRj8lJ1C4vvbOC8+nXdH289xxKxpcMT4hZGe0W67MUQ4cT0fPm5VDbsyX9ZG4819WL9tjwOhmJpeZawJaiI3R1oB1JNiR2QMsba5xVrEtOUvGoSmIXhrn7oczoc5YyZYjSbj1VJoILB2NYu+5oBazOxwAF+4PPfHaM/
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 06:59:00.2647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca116125-2b7b-4e56-7739-08deb5741ac9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR10MB9730

Hello Krzysztof, Rob, and Sumit,

This series is still awaiting your review of the bindings.

Please let me know if you are waiting for anything from my side before 
reviewing it.

Thank you in advance,
Arnaud


On 5/6/26 09:20, Arnaud POULIQUEN wrote:
> Hello,
> 
> Just a gentle reminder: as a first step, I would appreciate it if we 
> could at least finalize the discussion on the bindings based on phandles.
> 
> Thanks,
> Arnaud
> 
> On 4/14/26 17:28, Arnaud Pouliquen wrote:
>> Main updates from version V21[1]:
>> --------------------------------
>> This version removes the st,stm32mp1-m4-tee compatibility string,
>> which no longer seems to be accepted by the Devicetree maintainers.
>> As a consequence, the stm32-rproc-tee driver, introduced to simplify
>> the code, is removed. The STM32 integration reuses the existing
>> stm32_rproc driver implemented in V19.
>>
>> The devicetree is now structured as follows:
>>
>>      firmware {
>>          tee_rproc: optee-rproc {
>>              compatible = "80a4c275-0a47-4905-8285-1486a9771a08";
>>          };
>>      };
>>
>>      m4: m4@10000000 {
>>        compatible = "st,stm32mp1-m4";
>>        reg = <0x10000000 0x40000>,
>>              <0x30000000 0x40000>,
>>              <0x38000000 0x10000>;
>>
>>        mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
>>        mbox-names = "vq0", "vq1", "shutdown", "detach";
>>
>>        memory-region = <&vdev0vring0>, <&m_ipc_shm>, <&mcuram2>,
>>                        <&vdev0vring1>, <&vdev0buffer>, <&retram>;
>>
>>        interrupt-parent = <&exti>;
>>        interrupts = <68 1>;
>>
>>        st,rproc-tee = <&tee_rproc 0>;
>>
>>        status = "okay";
>>      };
>>
>> As a consequence, this version:
>> - reintroduce v19 commits for stm32_rproc.c driver , adding the support
>>    of the st,rproc-tee binding.
>> - drops the dedicated remoteproc-tee.yaml and st,stm32-rproc-tee.yaml
>>    bindings from the series.
>> - extends st,stm32-rproc.yaml with st,rproc-tee to describe the link to
>>    the TEE remoteproc backend.
>> - removes the dedicated stm32_rproc_tee.c driver and reuses stm32_rproc.c
>>    for both native and TEE-controlled cases.
>> - keeps remoteproc_tee.c aligned with the phandle-based lookup introduced
>>    in v21 and uses a device_link between the STM32 remoteproc instance 
>> and
>>    the TEE backend device.
>>
>> More details are available in each patch commit message.
>>
>> Main updates from version V20[3]:
>> --------------------------------
>> To address Rob’s concern on v20concerning resource declaration under the
>> tee node, the device tree is now structured as follows,replacing the
>> child-parent hierarchy with a phandle:
>>
>>      firmware {
>>          tee_rproc: optee-rproc {
>>              compatible = "80a4c275-0a47-4905-8285-1486a9771a08";
>>          };
>>      };
>>
>>      m4: m4@0 {
>>        compatible = "st,stm32mp1-m4-tee";
>>        reg = <0 0>;
>>
>>        mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
>>        mbox-names = "vq0", "vq1", "shutdown";
>>
>>        memory-region = <&vdev0vring0>, <&m_ipc_shm>, <&mcuram2>,
>>                        <&vdev0vring1>, <&vdev0buffer>, <&retram>;
>>
>>        interrupt-parent = <&exti>;
>>        interrupts = <68 1>;
>>
>>        rproc-tee-phandle = <&tee_rproc 0>;
>>        st,auto-boot;
>>        wakeup-source;
>>
>>        status = "okay";
>>      };
>>
>> As a consequence, this version:
>> - Updates the device tree and bindings to:
>>    - Change the compatible property from
>>      "rproc-service-80a4c275-0a47-4905-8285-1486a9771a08" to
>>      "80a4c275-0a47-4905-8285-1486a9771a08".
>>    - Use the rproc-tee-phandle to avoid the parent-child hierarchy.
>> - Updates stm32_rproc_tee.c and remoteproc_tee.c to adapt to the new 
>> bindings.
>> - Updates remoteproc_tee.c to compute the device tree compatible 
>> string from
>>    the TEE UUID.
>>
>> Main updates from version V19[4]:
>> --------------------------------
>> The devicetree is now structured as follows:
>>
>>     firmware {
>>         optee {
>>             compatible = "linaro,optee-tz";
>>             method = "smc";
>>             #address-cells = <1>;
>>             #size-cells = <0>;
>>             rproc-service@0 {
>>                 compatible = "rproc- 
>> service-80a4c275-0a47-4905-8285-1486a9771a08";
>>                 reg = <0>;
>>                 #address-cells = <1>;
>>                 #size-cells = <0>;
>>                 status = "okay";
>>                 m4: m4@0 {
>>                     compatible = "st,stm32mp15-m4-tee";
>>                     reg = <0>;
>>                     mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
>>                     mbox-names = "vq0", "vq1", "shutdown";
>>                     memory-region = <&vdev0vring0>,    <&m_ipc_shm>, 
>> <&mcuram2>,
>>                             <&vdev0vring1>, <&vdev0buffer>, <&retram>;
>>                     interrupt-parent = <&exti>;
>>                     interrupts = <68 1>;
>>                     status = "okay";
>>                 };
>>             };
>>         };
>>     };
>>
>> As a consequence, this version:
>>
>> - Introduces a new stm32_rproc_tee.c remoteproc driver.
>>
>>    Instead of further complicating the existing stm32_rproc.c driver, a
>>    dedicated TEE-based driver is added. Both drivers are intended to also
>>    support the STM32MP2x Cortex-M33 remote processor in a next step.
>>
>> - Reworks the bindings:
>>    - Drop the st,stm32-rproc.yaml updates that were introduced in 
>> previous
>>      revisions.
>>    - Add remoteproc-tee.yaml for the
>>      "rproc-service-80a4c275-0a47-4905-8285-1486a9771a08" compatible.
>>    - Add st,stm32-rproc-tee.yaml for the "st,stm32mp15-m4-tee" 
>> compatible.
>>
>> - Reworks the probing sequence:
>>
>>    The m4@0 device is now probed by the remoteproc-tee driver, which 
>> itself
>>    is instantiated by the TEE (OP-TEE) bus.
>>
>> More details are available in each patch commit message.
>>
>> [1] https://lore.kernel.org/linux-remoteproc/20260317180329.1207625-1- 
>> arnaud.pouliquen@foss.st.com/
>> [2] https://lore.kernel.org/linux-remoteproc/20251217153917.3998544-1- 
>> arnaud.pouliquen@foss.st.com/
>> [3] https://lore.kernel.org/linux-devicetree/20250625094028.758016-1- 
>> arnaud.pouliquen@foss.st.com/
>>
>>
>> Tested-on:
>> ---------
>> commit 591cd656a1bf ("Linux 7.0-rc7")
>>
>> Description of the feature:
>> --------------------------
>> This series proposes the implementation of a remoteproc tee driver to
>> communicate with a TEE trusted application responsible for authenticating
>> and loading the remoteproc firmware image in an Arm secure context.
>>
>> 1) Principle:
>>
>> The remoteproc tee driver provides services to communicate with the 
>> OP-TEE
>> trusted application running on the Trusted Execution Context (TEE).
>> The trusted application in TEE manages the remote processor lifecycle:
>>
>> - authenticating and loading firmware images,
>> - isolating and securing the remote processor memories,
>> - supporting multi-firmware (e.g., TF-M + Zephyr on a Cortex-M33),
>> - managing the start and stop of the firmware by the TEE.
>>
>> 2) Format of the signed image:
>>
>> Refer to:
>> https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/src/ 
>> remoteproc_core.c#L18-L57
>>
>> 3) OP-TEE trusted application API:
>>
>> Refer to:
>> https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/include/ 
>> ta_remoteproc.h
>>
>> 4) OP-TEE signature script
>>
>> Refer to:
>> https://github.com/OP-TEE/optee_os/blob/master/scripts/sign_rproc_fw.py
>>
>> Example of usage:
>> sign_rproc_fw.py --in <fw1.elf> --in <fw2.elf> --out <signed_fw.sign> 
>> --key ${OP-TEE_PATH}/keys/default.pem
>>
>>
>> 5) Impact on User space Application
>>
>> No sysfs impact. The user only needs to provide the signed firmware image
>> instead of the ELF image.
>>
>>
>> For more information about the implementation, a presentation is 
>> available here
>> (note that the format of the signed image has evolved between the 
>> presentation
>> and the integration in OP-TEE).
>>
>> https://resources.linaro.org/en/resource/6c5bGvZwUAjX56fvxthxds
>>
>> Arnaud Pouliquen (7):
>>    dt-bindings: firmware: Add TEE remoteproc service binding
>>    dt-bindings: remoteproc: st,stm32-rproc: add st,rproc-tee
>>    remoteproc: core: Introduce rproc_pa_to_va helper
>>    remoteproc: Introduce optional release_fw operation
>>    remoteproc: Add TEE support
>>    remoteproc: stm32: Create sub-functions to request shutdown and
>>      release
>>    remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
>>
>>   .../bindings/remoteproc/remoteproc-tee.yaml   |  36 +
>>   .../bindings/remoteproc/st,stm32-rproc.yaml   |  55 +-
>>   drivers/remoteproc/Kconfig                    |  10 +
>>   drivers/remoteproc/Makefile                   |   1 +
>>   drivers/remoteproc/remoteproc_core.c          |  56 ++
>>   drivers/remoteproc/remoteproc_internal.h      |   6 +
>>   drivers/remoteproc/remoteproc_tee.c           | 789 ++++++++++++++++++
>>   drivers/remoteproc/stm32_rproc.c              | 249 ++++--
>>   include/linux/remoteproc.h                    |   6 +
>>   include/linux/remoteproc_tee.h                |  98 +++
>>   10 files changed, 1220 insertions(+), 86 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/remoteproc/ 
>> remoteproc-tee.yaml
>>   create mode 100644 drivers/remoteproc/remoteproc_tee.c
>>   create mode 100644 include/linux/remoteproc_tee.h
>>
>>
>> base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2
> 
> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

