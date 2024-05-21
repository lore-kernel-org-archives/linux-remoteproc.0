Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9374854662;
	Tue, 21 May 2024 08:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716279062; cv=none; b=nladd5BltMVG9uMhRbuyc5IonsbKK803EF6WgaLUw4hu3JinQcDeijm/JU2oOfowrEYhF9uU4jyyV4OOnnuYI2pAtRAgNxhgHwF3+wtj9TVaqyII1Q04dHSHObs4Ko7ENFhhNnLMDxM+zWCoPbOy1ikgtr3h/tX7DUh6flRqFXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716279062; c=relaxed/simple;
	bh=w5ZVhkNqsWSHnsReZdJv8Md0glaGrOXZLkGJT0DkAn4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hCP4t74siHzNtm7loZHdSP5l+RoRCO+Mv6FMcxyYps3uuyJRXmzJR68R4LPlAWHcHka58FnhDPoK8TuNX5Tvpz+3LjgNNlxw9Bnu64q79pYSk/Q3VAUKot04xR2xxc/vqW/vASj7gRITnP5W0LaPjyBNatGFt8Sa47C7tgu0AX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=y/TNH7bR; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="y/TNH7bR"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44L2MO6X006477;
	Tue, 21 May 2024 10:10:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=selector1; bh=r1c6L8J
	oj9/3Y2Gzu38mfrsCUic2tjpvOTpujp6f5UU=; b=y/TNH7bRcULTZ5P/Q49ekDI
	atywE7gYA8zEBIJpXMnwl663tTqvGJotmwTF+6dgHk3o8QCO1yQNIJQ8cyhuMSDl
	/yuIL9mIghEFDdWdSQdtYseRUGs7vW46qsV/d0gS6OGL2pLtdVcPDmV3Odf/Gm4r
	eygIVVovjYm4sQgAMj9roscAv4kXF/eZErkzsgoLSskzVzvGAF/n4QET+5ozF8w4
	PaFnEgOtD7VCcFKhphWDPQ+tvC59dnbQQoAuULpZkwliIqY9yLcsr025jdqmNw/G
	IJFBklPom/6WcOd0OFO2lzBCXFY1sC1hePi39T5guxX1wsfWQeWFV5fafPH3yZg=
	=
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y6n6hjf4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 10:10:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F3A4040047;
	Tue, 21 May 2024 10:10:31 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 027AE21194A;
	Tue, 21 May 2024 10:10:11 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 10:10:10 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 10:10:10 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v5 0/7] Introduction of a remoteproc tee to load signed firmware
Date: Tue, 21 May 2024 10:09:54 +0200
Message-ID: <20240521081001.2989417-1-arnaud.pouliquen@foss.st.com>
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
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_04,2024-05-21_01,2024-05-17_01

Main updates from the previous version [1]:
------------------------------------------

1) use proc->table_ptr as unique reference to point to the resource table
 --> update remoteproc_core.c to implement management of the resource table
     base on rproc->rproc->tee_interface new field:
     - on start get the resource table address from TEE remoteproc instead
       of finding it in firmware (ops choice to confirm)
     - on stop unmap the resource table before updating the
       proc->table_ptr pointer.

2) retrieve the TEE rproc Identifier from the device tree instead of
   hardcoding it
 -->  Add a new "st,proc-id" property in device tree.

More details on updates are listed in commits messages

[1] https://lore.kernel.org/linux-arm-kernel/20240115135249.296822-1-arnaud.pouliquen@foss.st.com/T/#m9ebb2e8f6d5e90f055827e4f227ce0877bc6d761

base-commit: c8d8f841e95bcc07ac8c5621fc171a24f1fd5cdb

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

Arnaud Pouliquen (7):
  remoteproc: Add TEE support
  dt-bindings: remoteproc: Add compatibility for TEE support
  dt-bindings: remoteproc: Add processor identifier property
  remoteproc: core introduce rproc_set_rsc_table_on_start function
  remoteproc: core: support of the tee interface
  remoteproc: stm32: Create sub-functions to request shutdown and
    release
  remoteproc: stm32: Add support of an OP-TEE TA to load the firmware

 .../bindings/remoteproc/st,stm32-rproc.yaml   |  58 ++-
 drivers/remoteproc/Kconfig                    |  10 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/remoteproc_core.c          | 135 +++---
 drivers/remoteproc/stm32_rproc.c              | 149 ++++--
 drivers/remoteproc/tee_remoteproc.c           | 429 ++++++++++++++++++
 include/linux/remoteproc.h                    |   4 +
 include/linux/tee_remoteproc.h                |  99 ++++
 8 files changed, 784 insertions(+), 101 deletions(-)
 create mode 100644 drivers/remoteproc/tee_remoteproc.c
 create mode 100644 include/linux/tee_remoteproc.h

-- 
2.25.1

