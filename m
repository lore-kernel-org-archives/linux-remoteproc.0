Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013028.outbound.protection.outlook.com [40.107.159.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD49840DFC3;
	Tue, 14 Apr 2026 15:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776180563; cv=fail; b=UiHJVZqdEVeWT0sOdyGWC+LnZehqwLPZRjo5pFOYUpBkmYTNxXNX8PApixH3/MZ7AuBfmirMSgdByaGCNvrwZlXprZmQ8gn9urrF96ZdB+THTVNeEnAtL9JzSYuCh8k8pyKQhJP0dVx9u9MZu+COi+u4UytXl5xFRVMKHm03Ht8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776180563; c=relaxed/simple;
	bh=giOc6TOb73N4EDrVY2MlusCWl3yrIKTVkvuFk2HBrAQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N9f6TSBPjerdaZ+2/A5w2t/sudq4O9XmiukXgK4JTWy6O7lx/MD7pB2iolsuy3PZ78pIJG3qvR1sC6/km+1l43Uo9LQQrY/StmWuHgRLMMKLnXYfYjBaVOTDYVOnQtPjuEaRs6Nj8lAUa9vqNl5JhpHNOlJpXHRJyfpBXpHkrrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=fuupeLPA; arc=fail smtp.client-ip=40.107.159.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="fuupeLPA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ud+VnPAZCUnIvxuE8M0xG8kS5+jv1Ory3zyTcXCl8S+otAQ9L7JYkkgKSC4J6/AzpPSW5XVeWXcWriwAurETisAhqcOhJTm/cki6olP1H9gQpxAA7biybxTF1EU+MwxnPJPA7DZlJ6zPffI5QvBZQxFhPdcJQG0kQu6Gtpg7QD7l2rT6fuM8HXmxQTrE+tayeuuRNlsaKbTheAVgc3EmwRnhZakuTkQVF+MTYBbP1JjAXW2ZypMdNGqhpjJrjS9I3Atfe0dk1uuklBIFgtBRwXdUQeBPCzMGZcjGejll9H5vvrs+U7ziW0dj7iEMfSZfspvxXC413y+9zTOXbBT3Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Rv2hBr+cq9z5FsQM48NbdcxB8xr/I6jecP4znGx7DQ=;
 b=lj6kWZ+nbFV3OVcQ3DWGRFGHtgasUpZNOc5IUqkyDq4KimKCUxsESAXxoLKtQpBnTzHjqQXnZSrLPqBHLyCpoN+BcOmMfUBze23qU9nF0U8Ic3cCFfKpu/n6ywEoNEZnhVNRFnpTBFvjnyMXi6txRCHWtXBqbtVfS+W7NaZcpR5RwDk9np/v7fz0ZDZPs5bKRtMSPoUUvf+q2zchFlW2yNkQWy6OzxuYfDGMyn0wuXW1rMJg3qpDr1mMMrwUvDRyuvRS00df4YIV6f0eN8KY1JOUoJClk/FZcW/rpznzH6+ZOxvh1Nc3SqJkmfUMYBhwEgCQt0D0rqqifzBpxbcoqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Rv2hBr+cq9z5FsQM48NbdcxB8xr/I6jecP4znGx7DQ=;
 b=fuupeLPAHMLx4IMN0Fyr0LDI/LsYnyHdz5LBWJDbBNG3x09ch79wT7DHrp/QyilaE5FZ9wt6WT389BNNTn57T7e2yZzJfkOcYQqhRJmJHxO4AWKPnS5r8WHjLWz43pDF6LEi4w2s2pmRndjVZPGzMeV1SDk0/jT+orx4wFd1OKd5lrgsZxWlSd8wFAuMwg/tLezwnGKugrRpuzx4qeAwjdZbNMWqo8NSJm1DZ/Rx0yq9a0H21ZqGtXnKcD9R2u1I75zDiBu+82MwrnAttEcws4AWi1BwpKDCqIvF0Pxsurna6XDSY1Z1gq7mhtR2lBVv+k/FOs0tCaf/neo+d3ZqFQ==
Received: from DB8PR04CA0016.eurprd04.prod.outlook.com (2603:10a6:10:110::26)
 by PA2PR10MB8577.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:425::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 15:29:16 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:110:cafe::a4) by DB8PR04CA0016.outlook.office365.com
 (2603:10a6:10:110::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 15:29:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 15:29:15 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 14 Apr
 2026 17:32:24 +0200
Received: from localhost (10.252.12.46) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 14 Apr
 2026 17:29:15 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>,
	"Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
	<devicetree@vger.kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v22 0/7] Introduction of a remoteproc tee to load signed firmware
Date: Tue, 14 Apr 2026 17:28:55 +0200
Message-ID: <20260414152904.1679724-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E2:EE_|PA2PR10MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e39fe9f-9cd7-4d86-6ed2-08de9a3a969d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|30052699003|376014|7416014|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+sexLr0348SR898SlzKRzwNZWhMJ4+lU4TL14M1ukPj9pnMB55l7CQvLiJqQ/yZgBptrMvPDh5VXPf1HILhdpoOHRct+PCNpTcclEHx7D+yyj+wkchn324UW7jNh5D6QMdBimOm1lbo7jhonWiXNkk2ctU6m/1Sz4fV+bO/fimoY3AyLPrFvEtj+e2ECRkpwzJ7VB9mKYAH+9JhPOfpeLx3c49qMPax1dFN1ujwjjNMd2tf7pXouWvGEDdDtNpGES8dGp/LdOOt+aAjgUqIntN2AIUq/zbIyGEf48DJvMNbXrT3TnachFcVz2B2oWS3zoICLdgEKOdATaM4Q7a6kakkSG6mOoQKIkLIc0u+hj+m4oLbqINcruOCMkkgMJC80k0AvpIKPtMJuMZhreVZUQw4im+Yc/PDBzsV7/6mtAYpTLSPZBLjyaQsLyyMe6JDDUQ6EbuAAHleqOrvIBcHHX0qZZb3AG+jI82DIYQycWvJGXtFDq12VYtpSsGWaa0NhiYnE5c1r+752gx31k6rQtTNk1Q8eSfup2sjErbFsMY5aHufkFNgbE51yQ4v+46wCXB8qYLCEsgpcNplyZ+qcAaJw29hm443JpBMR1SRfWcqnVrtibOztCDU1AD/Y/W/bbgH3zaKuK7oGQZQNT44JS3UF7tDmEM62Hz3AEWpobLrbdpud7QAVI4qu/y4azMbtSeiv4Fd6WdeQDb31mgF/xO5CM6rQCh7gvgF17gcbEAc=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(30052699003)(376014)(7416014)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/u9j1UbjCxwLX6108yMfeGaHBMcIxkQmGTENIRWujESQENLfdqTDPyGgQSvtbCOSpUeBU+l4Qe6QAcrgGilZYk0BjvdPxe+vpTvaQl8CjvFFWFpxIVQQ62db3k2FY6Rork73xtKzZp4r1xPBrxxFk3cLM97Y60xIOHhDRSjy2P6YrdUgQrxDgwfokhi0RhEZRVTgoHyUdnKq853bhb+cmmACamIMOkZmaA/Xp5VmGU/SAttN20OPYdX8Fpfr7ILyvsDZM0m6EPxzw6SBJQ0qu3P1UdLdqtIPSn5sQzOHowIfw9h3+hO5FindZlAyCiOQsEqzYanfVDCCEi9X8YUZ9V7S9OixzjiOwBCnHXTx79KhRP7eA3Aj/UnFf4En33QIFq4JbdGOzLkaIDILmh7mKvc9X4eatK+USvELXI0e8YHlcn1JOHK/KZH5nYo5S2IJ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 15:29:15.7640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e39fe9f-9cd7-4d86-6ed2-08de9a3a969d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8577

Main updates from version V21[1]:
--------------------------------
This version removes the st,stm32mp1-m4-tee compatibility string,
which no longer seems to be accepted by the Devicetree maintainers.
As a consequence, the stm32-rproc-tee driver, introduced to simplify
the code, is removed. The STM32 integration reuses the existing
stm32_rproc driver implemented in V19.

The devicetree is now structured as follows:

    firmware {
        tee_rproc: optee-rproc {
            compatible = "80a4c275-0a47-4905-8285-1486a9771a08";
        };
    };

    m4: m4@10000000 {
      compatible = "st,stm32mp1-m4";
      reg = <0x10000000 0x40000>,
            <0x30000000 0x40000>,
            <0x38000000 0x10000>;

      mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
      mbox-names = "vq0", "vq1", "shutdown", "detach";

      memory-region = <&vdev0vring0>, <&m_ipc_shm>, <&mcuram2>,
                      <&vdev0vring1>, <&vdev0buffer>, <&retram>;

      interrupt-parent = <&exti>;
      interrupts = <68 1>;

      st,rproc-tee = <&tee_rproc 0>;

      status = "okay";
    };

As a consequence, this version:
- reintroduce v19 commits for stm32_rproc.c driver , adding the support
  of the st,rproc-tee binding.
- drops the dedicated remoteproc-tee.yaml and st,stm32-rproc-tee.yaml
  bindings from the series.
- extends st,stm32-rproc.yaml with st,rproc-tee to describe the link to
  the TEE remoteproc backend.
- removes the dedicated stm32_rproc_tee.c driver and reuses stm32_rproc.c
  for both native and TEE-controlled cases.
- keeps remoteproc_tee.c aligned with the phandle-based lookup introduced
  in v21 and uses a device_link between the STM32 remoteproc instance and
  the TEE backend device.

More details are available in each patch commit message.

Main updates from version V20[3]:
--------------------------------
To address Rob’s concern on v20concerning resource declaration under the
tee node, the device tree is now structured as follows,replacing the
child-parent hierarchy with a phandle:

    firmware {
        tee_rproc: optee-rproc {
            compatible = "80a4c275-0a47-4905-8285-1486a9771a08";
        };
    };

    m4: m4@0 {
      compatible = "st,stm32mp1-m4-tee";
      reg = <0 0>;

      mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
      mbox-names = "vq0", "vq1", "shutdown";

      memory-region = <&vdev0vring0>, <&m_ipc_shm>, <&mcuram2>,
                      <&vdev0vring1>, <&vdev0buffer>, <&retram>;

      interrupt-parent = <&exti>;
      interrupts = <68 1>;

      rproc-tee-phandle = <&tee_rproc 0>;
      st,auto-boot;
      wakeup-source;

      status = "okay";
    };

As a consequence, this version:
- Updates the device tree and bindings to:
  - Change the compatible property from
    "rproc-service-80a4c275-0a47-4905-8285-1486a9771a08" to
    "80a4c275-0a47-4905-8285-1486a9771a08".
  - Use the rproc-tee-phandle to avoid the parent-child hierarchy.
- Updates stm32_rproc_tee.c and remoteproc_tee.c to adapt to the new bindings.
- Updates remoteproc_tee.c to compute the device tree compatible string from
  the TEE UUID.

Main updates from version V19[4]:
--------------------------------
The devicetree is now structured as follows:

	firmware {
		optee {
			compatible = "linaro,optee-tz";
			method = "smc";
			#address-cells = <1>;
			#size-cells = <0>;
			rproc-service@0 {
				compatible = "rproc-service-80a4c275-0a47-4905-8285-1486a9771a08";
				reg = <0>;
				#address-cells = <1>;
				#size-cells = <0>;
				status = "okay";
				m4: m4@0 {
					compatible = "st,stm32mp15-m4-tee";
					reg = <0>;
					mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
					mbox-names = "vq0", "vq1", "shutdown";
					memory-region = <&vdev0vring0>,	<&m_ipc_shm>, <&mcuram2>,
							<&vdev0vring1>, <&vdev0buffer>, <&retram>;
					interrupt-parent = <&exti>;
					interrupts = <68 1>;
					status = "okay";
				};
			};
		};
	};

As a consequence, this version:

- Introduces a new stm32_rproc_tee.c remoteproc driver.

  Instead of further complicating the existing stm32_rproc.c driver, a
  dedicated TEE-based driver is added. Both drivers are intended to also
  support the STM32MP2x Cortex-M33 remote processor in a next step.

- Reworks the bindings:
  - Drop the st,stm32-rproc.yaml updates that were introduced in previous
    revisions.
  - Add remoteproc-tee.yaml for the
    "rproc-service-80a4c275-0a47-4905-8285-1486a9771a08" compatible.
  - Add st,stm32-rproc-tee.yaml for the "st,stm32mp15-m4-tee" compatible.

- Reworks the probing sequence:

  The m4@0 device is now probed by the remoteproc-tee driver, which itself
  is instantiated by the TEE (OP-TEE) bus.

More details are available in each patch commit message.

[1] https://lore.kernel.org/linux-remoteproc/20260317180329.1207625-1-arnaud.pouliquen@foss.st.com/
[2] https://lore.kernel.org/linux-remoteproc/20251217153917.3998544-1-arnaud.pouliquen@foss.st.com/
[3] https://lore.kernel.org/linux-devicetree/20250625094028.758016-1-arnaud.pouliquen@foss.st.com/


Tested-on:
---------
commit 591cd656a1bf ("Linux 7.0-rc7")

Description of the feature:
--------------------------
This series proposes the implementation of a remoteproc tee driver to
communicate with a TEE trusted application responsible for authenticating
and loading the remoteproc firmware image in an Arm secure context.

1) Principle:

The remoteproc tee driver provides services to communicate with the OP-TEE
trusted application running on the Trusted Execution Context (TEE).
The trusted application in TEE manages the remote processor lifecycle:

- authenticating and loading firmware images,
- isolating and securing the remote processor memories,
- supporting multi-firmware (e.g., TF-M + Zephyr on a Cortex-M33),
- managing the start and stop of the firmware by the TEE.

2) Format of the signed image:

Refer to:
https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/src/remoteproc_core.c#L18-L57

3) OP-TEE trusted application API:

Refer to:
https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/include/ta_remoteproc.h

4) OP-TEE signature script

Refer to:
https://github.com/OP-TEE/optee_os/blob/master/scripts/sign_rproc_fw.py

Example of usage:
sign_rproc_fw.py --in <fw1.elf> --in <fw2.elf> --out <signed_fw.sign> --key ${OP-TEE_PATH}/keys/default.pem


5) Impact on User space Application

No sysfs impact. The user only needs to provide the signed firmware image
instead of the ELF image.


For more information about the implementation, a presentation is available here
(note that the format of the signed image has evolved between the presentation
and the integration in OP-TEE).

https://resources.linaro.org/en/resource/6c5bGvZwUAjX56fvxthxds

Arnaud Pouliquen (7):
  dt-bindings: firmware: Add TEE remoteproc service binding
  dt-bindings: remoteproc: st,stm32-rproc: add st,rproc-tee
  remoteproc: core: Introduce rproc_pa_to_va helper
  remoteproc: Introduce optional release_fw operation
  remoteproc: Add TEE support
  remoteproc: stm32: Create sub-functions to request shutdown and
    release
  remoteproc: stm32: Add support of an OP-TEE TA to load the firmware

 .../bindings/remoteproc/remoteproc-tee.yaml   |  36 +
 .../bindings/remoteproc/st,stm32-rproc.yaml   |  55 +-
 drivers/remoteproc/Kconfig                    |  10 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/remoteproc_core.c          |  56 ++
 drivers/remoteproc/remoteproc_internal.h      |   6 +
 drivers/remoteproc/remoteproc_tee.c           | 789 ++++++++++++++++++
 drivers/remoteproc/stm32_rproc.c              | 249 ++++--
 include/linux/remoteproc.h                    |   6 +
 include/linux/remoteproc_tee.h                |  98 +++
 10 files changed, 1220 insertions(+), 86 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/remoteproc-tee.yaml
 create mode 100644 drivers/remoteproc/remoteproc_tee.c
 create mode 100644 include/linux/remoteproc_tee.h


base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2
-- 
2.43.0

