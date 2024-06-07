Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1A113C69B;
	Fri,  7 Jun 2024 09:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717754363; cv=none; b=cnmNhYPF9gikNwJtxLYHaJgfZJByRD87Y5NElgKHHH1p67O36XWQLmL6MPfAauT4lETLIeJuq3DmYD8BjHNyNYTMGzpKTjQvRPDJlu8he6kuSTXDnSAogyIgOvIkF5vpR9veTJECDgugoeyMx5Vn1rVBu0VSaIIKwn6VAO728PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717754363; c=relaxed/simple;
	bh=xzhpGqQlNRFrOfTXkeddU4gZLytnj1t2Acd7LONh7w8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kKcD/hYoA1HkWN8OU43MGAh0QCgi/MNjTXZcS76WyXHRZNOd7RSiFI3IyW/Dv/9HHN/myG50+8k8TMXwg2xgqJbaSMYO9AHukkMddDWyjQ0Nqq+GAqqDLEVxgOp/4WXHo8Xr0xLnrOfzfP2tvpQenxY9HdntihGoRcbwC/3Vfs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=jFlAfDAU; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="jFlAfDAU"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45792avx010983;
	Fri, 7 Jun 2024 11:35:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=FD717BMLYpy8Xa7UyDGXqP
	dvjHhDg1P08LvrXSeUecs=; b=jFlAfDAUDOzmLqttO3S9PK2tXMMvvMBFSp+hiU
	YNxSyfWq1NNAgu3zzJdKUVjQ3MeKTBh7e56bmgbh8khUX9MW+Mih/Hwi23pcFmcA
	bwpSvuUJOHCL2/mnNTpdEPdro0pFHCVvUxAMUquVCMwMGOc6m6lz7YKfl4Yi9gkd
	KlR4cDM+n8Y/kHkpUJXDWsqOkX/+8tnvJgeI33xxFvkr1HxIwH8CKsojqwfnv1qY
	nIU3NND+rVuoKkl/Ui/CoiLZ12WKwXPgJ2vttQfxVsxYQH6C61V85Q0UCe2ULOqU
	j/IjLoAPuuAl5djDPcV/30vqx3RpdTD/L4c0s+Xx2F19xPMA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ykbv549t5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 11:35:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7B51A40044;
	Fri,  7 Jun 2024 11:34:54 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 80A08214525;
	Fri,  7 Jun 2024 11:34:05 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 11:34:05 +0200
Received: from localhost (10.252.5.235) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 11:34:05 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v6 0/5] Introduction of a remoteproc tee to load signed firmware
Date: Fri, 7 Jun 2024 11:33:21 +0200
Message-ID: <20240607093326.369090-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_04,2024-06-06_02,2024-05-17_01

Main updates from the previous version [1][2]:
------------------------------------------

1) Rework resource table management
  - Rework tee_rproc_parse_fw to temporary map the resource table address
    to create a cached_table (similar to what is done in
    rproc_elf_load_rsc_table()).
  - Rename tee_rproc_get_loaded_rsc_table to tee_rproc_find_loaded_rsc_table
  - Introduce rproc_pa_to_va() allowing to translate the resource table
    physical address to virtual address based on remoteproc carveouts.

2) Merge the 2 "st,stm32-rproc.yaml" bindings patch in one
   As the st,rproc-id" is linked to the introduction of the
   "st,stm32mp1-m4-tee" compatible, merge following patches to address
   Krzysztof concern.
   - [PATCH v5 2/7] dt-bindings: remoteproc: Add compatibility for TEE support
   - [PATCH v5 3/7] dt-bindings: remoteproc: Add processor identifier property

More details on updates are listed in commits messages.

[1] https://lore.kernel.org/lkml/Zlil4YSjHxb0FRgf@p14s/T/
[2] https://lore.kernel.org/lkml/20240521122458.3517054-1-arnaud.pouliquen@foss.st.com/

base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0

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

No sysfs impact.the user only needs to provide the signed firmware image
instead of the ELF image.


For more information about the implementation, a presentation is available here
(note that the format of the signed image has evolved between the presentation
and the integration in OP-TEE).

https://resources.linaro.org/en/resource/6c5bGvZwUAjX56fvxthxds

Arnaud Pouliquen (5):
  remoteproc: core: Introduce rproc_pa_to_va helper
  remoteproc: Add TEE support
  dt-bindings: remoteproc: Add compatibility for TEE support
  remoteproc: stm32: Create sub-functions to request shutdown and
    release
  remoteproc: stm32: Add support of an OP-TEE TA to load the firmware

 .../bindings/remoteproc/st,stm32-rproc.yaml   |  58 ++-
 drivers/remoteproc/Kconfig                    |  10 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/remoteproc_core.c          |  74 ++-
 drivers/remoteproc/stm32_rproc.c              | 147 ++++--
 drivers/remoteproc/tee_remoteproc.c           | 451 ++++++++++++++++++
 include/linux/remoteproc.h                    |   7 +
 include/linux/tee_remoteproc.h                |  99 ++++
 8 files changed, 801 insertions(+), 46 deletions(-)
 create mode 100644 drivers/remoteproc/tee_remoteproc.c
 create mode 100644 include/linux/tee_remoteproc.h


base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
-- 
2.25.1

