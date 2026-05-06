Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011039.outbound.protection.outlook.com [40.107.130.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674B1370D68;
	Wed,  6 May 2026 07:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778052120; cv=fail; b=GJJ5i/SRy3ld1p+UshuBQDLoPkksIEiDT8WHkOPOfCRGguWXgGbsf7D2NpwGZ51Bhd4uEgkNKxWvaDgU4980XzYAB/A58NfRWhsj/95bLxVD0JG+jV3PwUjQBXIXdDHfwAmtG4j97EvlHcqCrGqNCxgaDiR40o93DHQpf8lyQ3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778052120; c=relaxed/simple;
	bh=rvFy1OUy7ja9H5eL5Mbb6OaV1R0sJSfwHQiIjEnrhAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T3V2PZ5JlAZ3TPaOmTJBedaHBc0RsIXFiKQgde3mLcVhcBJTsPyhLf1tgif4geHUQtnJMMqamq6juMAKP9FwveVmCUNiuhZcnXEVKC3TP2qtc0GEgyvmoO1jOCWNXMQcXjhvXBT6q9k3kKsPwfmxs4QdW4YACwadktKxc4QG230=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=LX9rJoMt; arc=fail smtp.client-ip=40.107.130.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="LX9rJoMt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Br2tgw6LTJFtvq/QVwBCfdUOVH9GcHKmmnMBsQaaTiqGxTLXYT+20dLxEWLKYYnSnlNxHmgHFbrOsnX2otRqo89otPBiVPnti2pLiP/YAKsxmRKl7ZeQlI4wCNLEdeUwVjhnZmBxlcmha4YcYoNqRZTxSe0yxvTZ1llDDURCqwvddSolX8gj6k1VnhmcBEYMynYVvcVSxs1IMBKOgZP04YSlogRNjzbRK/mwN3FHKNZjvvgmykDByHFBHCe59as9xGhu1Ubs1r7ii15aPH//1Rg/Sh+O5NySQHJLKldak31TWqqMXYfWh6EedE8wUu32h16ZPAbw4Qor+7OakyFKBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZwft+AsINXg1IUeonWXJmzw912+qyNo0VTvDBtvk5E=;
 b=f8GdXYdWYR9TsfrsBgoAuzWakpFLoxG7gccJuPHhMVYUw/sxUMnjjMAldSfXiiFRbmdxAVQxNO1e5Fwn/0qOmQMRHXc13ciOcRQDVEUteiBAS+ZFGy9Fe/y0lDnzQRdmt3EXaXAnc80FN+ZV7u9vW85ndU6YH37K5L5gFoVzELE/rYND7jJ0JVms5c/3SNTkN3T5LGBmYgCQFwXmgGji/qL/Xo4FyXtl/fJwB1vStltuVon0rLSRKWvB56mX4S8ty3ACvncgl5VmhO2mpuYM4ujALwQs1Knu69+sIoqcUgSpnE0dxNfLbYZx+2l5yvcSa+kJYR0v67RO2MC1vY0Qkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZwft+AsINXg1IUeonWXJmzw912+qyNo0VTvDBtvk5E=;
 b=LX9rJoMtH292bi/68CXYs+o36itPwOzRKEqupRKGhUCa70u3+kmunqu1yj3xogxbzoyCrbhRhyxctRiMW/Mkk7XYv5Si1lxT2mvHiYNZ8vMxi0KUztK6ukNMYgJI+76KCJCOReK9g7PKh8csqEbCGrDJ0adVTEPj6FHUPwSGCZbbUVVTWgeyyaiXEAHKZ22uPx5BSVywLA6xTHF7fMg9B3D+ctHKyuRyLd8V3LHWmuyJq83V2UcOg0PdeDj60kh0VdgDxhKTtvNbkWpG3EN2mFKS/25Ou9qFGyBWEAa251VPqec2PMNV/IfkSNfYVEfqCiEqytwGj3oRbVC4HRIKmA==
Received: from DUZPR01CA0272.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::12) by GV1PR10MB6291.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:91::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 07:21:52 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::1b) by DUZPR01CA0272.outlook.office365.com
 (2603:10a6:10:4b9::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 07:21:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 07:21:51 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 6 May
 2026 09:24:27 +0200
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 6 May
 2026 09:20:49 +0200
Message-ID: <617b40df-6e51-44d0-9803-60b2e47217ff@foss.st.com>
Date: Wed, 6 May 2026 09:20:48 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 0/7] Introduction of a remoteproc tee to load signed
 firmware
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>,
	"Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
	<devicetree@vger.kernel.org>
References: <20260414152904.1679724-1-arnaud.pouliquen@foss.st.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20260414152904.1679724-1-arnaud.pouliquen@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8D:EE_|GV1PR10MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: 285a4a96-5212-4460-4a0a-08deab4024e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|30052699003|36860700016|18002099003|22082099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	cc3xLUxc6W9q39hagzCbRApCa2Zp2Bwde0tULN0Rzw06y1lfTu8SBY5k8K5FlcDZeB+o+dv+OD/M8HTIMruiY3QvUMt6k3+8Sg6gFOenDDTyNXcz49yQ9IsOGxn/h7+6FLiRy6EHsY68qfWM3+aa3ZsoFxdzVrpVYhl6APekLFqueG2EHGgi/48M8HRYq5M16YG0ZpjlyuQ2HmjOvzr7Fm6/CS+INsBL+z19v3R9F6nqJRge4lOEMICcRR5GlRLiv4227jJDe3CnhPfsfpqb0DdsRBJOAcxqeaCdrJ5mMlVdvhV4RvuE5+MxH98wV0pkac5ogKO0LQbR338jVXe+HQJKuHVUm/poskv2LYJThuUBjIithkFbrMYdRfEBwBfcH5lccklEWvmRJHFoUz/EBAezVch652yeogXuZa/ffw4a+if5HjnbQ8Bh9GUoX5ZwYTRKDEt1BpRXMmq4nPLTBCsrc2phLT6dwJDnF7tCfLPHcF63N+X5mRo9Dws1ii+euXf/0MDGbAat9fBvqErX5vqKC1vbBncvNrogG7Iety4j/O8T21KMJHR/0w8Mstp8jyfhQ9C0v+bERJEjcuxqcMhgKc+jRoFq1fVCS2K1iiFqWXjRodZg8V6cj8zPOmkgewjyLcgCQll71DsFZIurLw9cfcwM0qcyMzNZ/U8s7ODvp71iCbFHa/zqX5awpMXZ
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(30052699003)(36860700016)(18002099003)(22082099003)(56012099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Lh17XcS17sih1uJoHCMGTUjWRtDlZ192EEyGHLGYr6eSPU+qhOipZd0jhSSn91SCck1EvJHAAD0bb9Ls3WbTDRp5dGxhgRR7X7/dtjjIc0GRoocmjfG3ojG05Fk/n0K8i9cIZyhtuoxeSiglJ6wdYa9Rz/1P6GH2pxSoBmet6DGJvJNo1d769RlCbe6iGmmvDYcRwA6ICgOtpCv6Wehci/rO1zxJdavcBjcbnhD4/u7shwCOmsu8Y/AH7VP/CNCnIMaTSLfwOfYTKgIs8JCOor2GnJHbBXV0YGyD2hdZ8HdGVOx5qyhtQo+oJ8grcTcKomOWnoNEgkxt7rzzoJPCRPJKhU7YC1wrtOpsptT4CM8Vm69DI+cxOtf2wvE1SgUofpeLt6cIfs++3DmEF00Ip8vAialoA4C58cHqIoeWXFSehVKm0zutaxWw2rE/dhJL
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 07:21:51.7479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 285a4a96-5212-4460-4a0a-08deab4024e9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6291

Hello,

Just a gentle reminder: as a first step, I would appreciate it if we 
could at least finalize the discussion on the bindings based on phandles.

Thanks,
Arnaud

On 4/14/26 17:28, Arnaud Pouliquen wrote:
> Main updates from version V21[1]:
> --------------------------------
> This version removes the st,stm32mp1-m4-tee compatibility string,
> which no longer seems to be accepted by the Devicetree maintainers.
> As a consequence, the stm32-rproc-tee driver, introduced to simplify
> the code, is removed. The STM32 integration reuses the existing
> stm32_rproc driver implemented in V19.
> 
> The devicetree is now structured as follows:
> 
>      firmware {
>          tee_rproc: optee-rproc {
>              compatible = "80a4c275-0a47-4905-8285-1486a9771a08";
>          };
>      };
> 
>      m4: m4@10000000 {
>        compatible = "st,stm32mp1-m4";
>        reg = <0x10000000 0x40000>,
>              <0x30000000 0x40000>,
>              <0x38000000 0x10000>;
> 
>        mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
>        mbox-names = "vq0", "vq1", "shutdown", "detach";
> 
>        memory-region = <&vdev0vring0>, <&m_ipc_shm>, <&mcuram2>,
>                        <&vdev0vring1>, <&vdev0buffer>, <&retram>;
> 
>        interrupt-parent = <&exti>;
>        interrupts = <68 1>;
> 
>        st,rproc-tee = <&tee_rproc 0>;
> 
>        status = "okay";
>      };
> 
> As a consequence, this version:
> - reintroduce v19 commits for stm32_rproc.c driver , adding the support
>    of the st,rproc-tee binding.
> - drops the dedicated remoteproc-tee.yaml and st,stm32-rproc-tee.yaml
>    bindings from the series.
> - extends st,stm32-rproc.yaml with st,rproc-tee to describe the link to
>    the TEE remoteproc backend.
> - removes the dedicated stm32_rproc_tee.c driver and reuses stm32_rproc.c
>    for both native and TEE-controlled cases.
> - keeps remoteproc_tee.c aligned with the phandle-based lookup introduced
>    in v21 and uses a device_link between the STM32 remoteproc instance and
>    the TEE backend device.
> 
> More details are available in each patch commit message.
> 
> Main updates from version V20[3]:
> --------------------------------
> To address Rob’s concern on v20concerning resource declaration under the
> tee node, the device tree is now structured as follows,replacing the
> child-parent hierarchy with a phandle:
> 
>      firmware {
>          tee_rproc: optee-rproc {
>              compatible = "80a4c275-0a47-4905-8285-1486a9771a08";
>          };
>      };
> 
>      m4: m4@0 {
>        compatible = "st,stm32mp1-m4-tee";
>        reg = <0 0>;
> 
>        mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
>        mbox-names = "vq0", "vq1", "shutdown";
> 
>        memory-region = <&vdev0vring0>, <&m_ipc_shm>, <&mcuram2>,
>                        <&vdev0vring1>, <&vdev0buffer>, <&retram>;
> 
>        interrupt-parent = <&exti>;
>        interrupts = <68 1>;
> 
>        rproc-tee-phandle = <&tee_rproc 0>;
>        st,auto-boot;
>        wakeup-source;
> 
>        status = "okay";
>      };
> 
> As a consequence, this version:
> - Updates the device tree and bindings to:
>    - Change the compatible property from
>      "rproc-service-80a4c275-0a47-4905-8285-1486a9771a08" to
>      "80a4c275-0a47-4905-8285-1486a9771a08".
>    - Use the rproc-tee-phandle to avoid the parent-child hierarchy.
> - Updates stm32_rproc_tee.c and remoteproc_tee.c to adapt to the new bindings.
> - Updates remoteproc_tee.c to compute the device tree compatible string from
>    the TEE UUID.
> 
> Main updates from version V19[4]:
> --------------------------------
> The devicetree is now structured as follows:
> 
> 	firmware {
> 		optee {
> 			compatible = "linaro,optee-tz";
> 			method = "smc";
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 			rproc-service@0 {
> 				compatible = "rproc-service-80a4c275-0a47-4905-8285-1486a9771a08";
> 				reg = <0>;
> 				#address-cells = <1>;
> 				#size-cells = <0>;
> 				status = "okay";
> 				m4: m4@0 {
> 					compatible = "st,stm32mp15-m4-tee";
> 					reg = <0>;
> 					mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
> 					mbox-names = "vq0", "vq1", "shutdown";
> 					memory-region = <&vdev0vring0>,	<&m_ipc_shm>, <&mcuram2>,
> 							<&vdev0vring1>, <&vdev0buffer>, <&retram>;
> 					interrupt-parent = <&exti>;
> 					interrupts = <68 1>;
> 					status = "okay";
> 				};
> 			};
> 		};
> 	};
> 
> As a consequence, this version:
> 
> - Introduces a new stm32_rproc_tee.c remoteproc driver.
> 
>    Instead of further complicating the existing stm32_rproc.c driver, a
>    dedicated TEE-based driver is added. Both drivers are intended to also
>    support the STM32MP2x Cortex-M33 remote processor in a next step.
> 
> - Reworks the bindings:
>    - Drop the st,stm32-rproc.yaml updates that were introduced in previous
>      revisions.
>    - Add remoteproc-tee.yaml for the
>      "rproc-service-80a4c275-0a47-4905-8285-1486a9771a08" compatible.
>    - Add st,stm32-rproc-tee.yaml for the "st,stm32mp15-m4-tee" compatible.
> 
> - Reworks the probing sequence:
> 
>    The m4@0 device is now probed by the remoteproc-tee driver, which itself
>    is instantiated by the TEE (OP-TEE) bus.
> 
> More details are available in each patch commit message.
> 
> [1] https://lore.kernel.org/linux-remoteproc/20260317180329.1207625-1-arnaud.pouliquen@foss.st.com/
> [2] https://lore.kernel.org/linux-remoteproc/20251217153917.3998544-1-arnaud.pouliquen@foss.st.com/
> [3] https://lore.kernel.org/linux-devicetree/20250625094028.758016-1-arnaud.pouliquen@foss.st.com/
> 
> 
> Tested-on:
> ---------
> commit 591cd656a1bf ("Linux 7.0-rc7")
> 
> Description of the feature:
> --------------------------
> This series proposes the implementation of a remoteproc tee driver to
> communicate with a TEE trusted application responsible for authenticating
> and loading the remoteproc firmware image in an Arm secure context.
> 
> 1) Principle:
> 
> The remoteproc tee driver provides services to communicate with the OP-TEE
> trusted application running on the Trusted Execution Context (TEE).
> The trusted application in TEE manages the remote processor lifecycle:
> 
> - authenticating and loading firmware images,
> - isolating and securing the remote processor memories,
> - supporting multi-firmware (e.g., TF-M + Zephyr on a Cortex-M33),
> - managing the start and stop of the firmware by the TEE.
> 
> 2) Format of the signed image:
> 
> Refer to:
> https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/src/remoteproc_core.c#L18-L57
> 
> 3) OP-TEE trusted application API:
> 
> Refer to:
> https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/include/ta_remoteproc.h
> 
> 4) OP-TEE signature script
> 
> Refer to:
> https://github.com/OP-TEE/optee_os/blob/master/scripts/sign_rproc_fw.py
> 
> Example of usage:
> sign_rproc_fw.py --in <fw1.elf> --in <fw2.elf> --out <signed_fw.sign> --key ${OP-TEE_PATH}/keys/default.pem
> 
> 
> 5) Impact on User space Application
> 
> No sysfs impact. The user only needs to provide the signed firmware image
> instead of the ELF image.
> 
> 
> For more information about the implementation, a presentation is available here
> (note that the format of the signed image has evolved between the presentation
> and the integration in OP-TEE).
> 
> https://resources.linaro.org/en/resource/6c5bGvZwUAjX56fvxthxds
> 
> Arnaud Pouliquen (7):
>    dt-bindings: firmware: Add TEE remoteproc service binding
>    dt-bindings: remoteproc: st,stm32-rproc: add st,rproc-tee
>    remoteproc: core: Introduce rproc_pa_to_va helper
>    remoteproc: Introduce optional release_fw operation
>    remoteproc: Add TEE support
>    remoteproc: stm32: Create sub-functions to request shutdown and
>      release
>    remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
> 
>   .../bindings/remoteproc/remoteproc-tee.yaml   |  36 +
>   .../bindings/remoteproc/st,stm32-rproc.yaml   |  55 +-
>   drivers/remoteproc/Kconfig                    |  10 +
>   drivers/remoteproc/Makefile                   |   1 +
>   drivers/remoteproc/remoteproc_core.c          |  56 ++
>   drivers/remoteproc/remoteproc_internal.h      |   6 +
>   drivers/remoteproc/remoteproc_tee.c           | 789 ++++++++++++++++++
>   drivers/remoteproc/stm32_rproc.c              | 249 ++++--
>   include/linux/remoteproc.h                    |   6 +
>   include/linux/remoteproc_tee.h                |  98 +++
>   10 files changed, 1220 insertions(+), 86 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/remoteproc/remoteproc-tee.yaml
>   create mode 100644 drivers/remoteproc/remoteproc_tee.c
>   create mode 100644 include/linux/remoteproc_tee.h
> 
> 
> base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2

