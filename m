Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA6875817;
	Tue, 21 May 2024 12:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294544; cv=none; b=ZJReBQjNP27PGkrBSYCa4eBa8Xtd0GFUqytyTMh+xVTHqscDhzRWI/7VazEdS7rILV3oZm/TBOaKQ6Iasyd8Ni+4EsXCW2HuNiOcmU0s7PesaOEVOuj2kjE8jWFVEcglreErGOiUlnmdH6omurB70cioGuXp3ahX94nw+HQ+vXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294544; c=relaxed/simple;
	bh=w5ZVhkNqsWSHnsReZdJv8Md0glaGrOXZLkGJT0DkAn4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mjyzZ1v3Cy/sya297h1tAsBwzjTTn14QH/Jr+hx0PMpMz0gT0mRkAr5d7K56n1zUbiUj3a/ssKdlIS0ga3m/bbd1ST8ELQzDZc1IuafRYLu0b/XhFzp8UhqLFGE9o4Iv+VoV2PwFqy77yFCrHtdc98vItZPS96luWiZYW3+4qrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=wxGpb03d; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="wxGpb03d"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LBS5OH003116;
	Tue, 21 May 2024 14:28:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=selector1; bh=r1c6L8J
	oj9/3Y2Gzu38mfrsCUic2tjpvOTpujp6f5UU=; b=wxGpb03dXAJrqEuwwv/rI4F
	xfiqpM6MQ2AEavq+IrBVkEB2YaGzJrS8DhJ0sUUvMMRXANv9mk9G88PwLh34/G41
	oVRb54gx1YrvhrgLGtZk8CrZrT30H+F3H5vjAkQCARbOcK32IV3pANrcpQ0A6pbb
	museSCqP2pmXU/vbrXKGSfD5i23xTZ7DhC3M3q7Uq791Cv2akJ1N7eJRTLdJbHGQ
	G5wVVLlJv2/cro3DruEsNwcioLezIO5QcQLMBPYgffelnxMkVysf6K4xxba5Bjfp
	LTUtTbWEtzbIAIgd4Ut/p4geKaNj/sUafvxxO81G3vPiPvhhJAnn8hKekCvM6kA=
	=
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y6n6hkqv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 14:28:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2326940044;
	Tue, 21 May 2024 14:28:34 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E3A372171C2;
	Tue, 21 May 2024 14:27:45 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 14:27:45 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 14:27:45 +0200
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
Subject: [RESEND PATCH v5 0/7] Introduction of a remoteproc tee to load signed firmware
Date: Tue, 21 May 2024 14:24:51 +0200
Message-ID: <20240521122458.3517054-1-arnaud.pouliquen@foss.st.com>
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
 definitions=2024-05-21_08,2024-05-21_01,2024-05-17_01

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

