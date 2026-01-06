Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1759327BE4
	for <linux-remoteproc@vger.kernel.org>; Tue,  6 Jan 2026 10:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767696863; cv=none; b=OBKrPqUSbYwVK0SxFIqZPJgmbr7nIpJUaVSKXSOLdftX2YZrwRYgYhhnPyUEShOnqZaIRUYdIh8hjXcmMNP/Rhj+jvhUnKJh0B8T9RoP5upJ/NFAq8Oe4gfhE8C3xHKMlJiB7Ego+tlhTlPQSTyh2RRAkWbY253+wYPoq7XwFVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767696863; c=relaxed/simple;
	bh=XIro8WjTgN2pc3GAXZcAdEVNHU6nIfrqjubHsp3Vkes=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ETGFoozMO+pc1t64DDKMyFb7pU7dkR2rF3dCA78PV0GO1Rcyrdf7vNqgtDMWJNNlEIdieS21DGGdgHaYuYHqxMMKz4i1DSL7spHIXqabAftYebDa2tCtchhLNsL/Y+7N22Qvp2zFKt5IX8Lqy2QSVD9h+OmdT6GQ3OtHMfhtK1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHxN3s1k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgjEsRfS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHxN3s1k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fgjEsRfS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6069WKWB4090856
	for <linux-remoteproc@vger.kernel.org>; Tue, 6 Jan 2026 10:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hMQ+mZX9c2O47rQg3eTyflrNGC26BNQZOwS
	mJqlRC64=; b=cHxN3s1kOl0wOQEBqJPb3C0q8m61IZftubOSkB7sK+16nI2gvWN
	Iklfm9ke7SsH5qVVWbb0JJEal/Iuf8nGmZB4LCujJDtH5sQIU47q/uDvuSQQtXDj
	OAO64x/qvjeqxKeFh1Z57Y3IXDNKLd9q+DzNIfi1QlICZsj+umoq3ljHcoYCJ7Ma
	pLNRBAvr9gay0BJXjWF1Gx093EzOcG1GdVMvcStOXt2ojLcipH6pHsQSKy1OdhgK
	q6fOsaMUhErlONKknXd6JCZj/oASAwvEP9L9jaFuAmkPYSc9lyL8PZs0bGCJKSzd
	XBO2qmAcCAgMMYrpWJO10IPHWO5W0UOQ1hg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgyun873m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 06 Jan 2026 10:54:20 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7fc82eff4adso805289b3a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Jan 2026 02:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767696860; x=1768301660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hMQ+mZX9c2O47rQg3eTyflrNGC26BNQZOwSmJqlRC64=;
        b=fgjEsRfSORinS53e1VvGz+CIL2NGtwKKW0q/jh0Hg23YP4Ueiq6nQhdOKkYVN/CkNn
         XJMkAgZ+uBJAfBeqOjC+bVu45luYhekQ8XrGgdqlZ/SpYHv93xKU2e6p5vcUmHG7NFNt
         6HU5Jg4+VoOToMIFcslawRKqIFRYUp5EH2PpHbjEYaHR1KVGOMxSdMmLXcpkjjyepMJs
         yJ20CdBoyNlr/C+uTlqmaOpHaB1nXO/yVkJeTfH/sQq+yD/slQDVEtlMLj/5ojWXOEuD
         Ga32O6nZPOaTgQS+OGHerT44GTfq9mFCZF5NJJgLg33zS4+9mipt+a2r35z98yIDkz1V
         74/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767696860; x=1768301660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMQ+mZX9c2O47rQg3eTyflrNGC26BNQZOwSmJqlRC64=;
        b=WYWpU0gyokkvfx+eFUPg6WjG3VVaUctfVOduPF0Y3GWGYXohi8L3J9BWBE9A3a3FRb
         uSpMgyxEI4uxNR1EjTlsoUAZoX2rfdu7v9WSFmAJNZQzxYy+Iz5eeXs8va/06+d9CSLX
         orrYkrj3wR7xesQdXrMy5piggiXK9d/HAnf05InMS76tQ5nRw9FQtTLyNLYTe6ZD6oHV
         GK4xJm/mIrtJ/7FEyHBwRQmox5uONsBQd9P4VTLosQeD+UPJptYgN7Oc6/YgGvk0naln
         OIiVWwWDIyfdFxpiVYFLbjH7H6fHEkoFR/OECxk1+TGZTvSKg1TTdXH5rL9QJRF1g0bz
         NKpg==
X-Forwarded-Encrypted: i=1; AJvYcCWnAAWm1DaLi6kZulFGYfKibxX3L3iq5a/rXkijwLevk+jPDL0E8spDIbWr5KRQpesWTLTW3EC7zuVtt9MVekhS@vger.kernel.org
X-Gm-Message-State: AOJu0Ywom6UVObARMNauWQWhtguAaEgBErhOY5rGyhYvLSuPqi3RRdH2
	jWtGYxo862kYkPbVmqcnQh1oGcTEN3PvaePeEZ3lbQVRid1ptsbddECdu1YGeI08I8yPikyCC5T
	c4RR/BeqYD9lPppQ6ueutKlgPIprlE8rnZEg2tCw0+L5LnA5zuwRzktxAsMOteb0Uajxmr8MM
X-Gm-Gg: AY/fxX5ilHBL958BWh8G2QoBKi87qjrICwEIMDQ3Gdw2+wSJKOD+3Bi7DaKyzvzeikm
	j4rBJu9y6IMUbig5x/bJmj9+IloUQaMlEBAiBV1AW80Rs/2G9pUo4fRCNUPQm1eDtOaQzfBuK47
	02l9nChyx9l5i7LXctMFN8qQdeeSK/rM6q6F+7eAIpkUhNYc6hiengHStOw1liQSzLZ9K86mC8t
	E78nzddMqxGVMENBraXTdMvPXFL6CYX/U1+MiRQLTBpBy0deI7fxgafITAGwn0JdGL2tONv8c7r
	uyP8WGsG5sUR3/wzQOziWE0B244JTPov+P3AKU6mffTxyVLK1fVvtKczbkwSLXp4yLvzRWSwAZd
	WCgwabvaSGraa4S192pFTzqjR7rvZ9x4ZT0FOj4ZbJbnbJ2ooWgiUlCUN0udQQhF4Rf+Kl8utJX
	dDEOIwoq2v+6zO7vNYauAZb8NBea/Nid2GdchvwHo=
X-Received: by 2002:a05:6a00:400c:b0:7e8:3fcb:bc46 with SMTP id d2e1a72fcca58-81944ea24famr2326804b3a.27.1767696859596;
        Tue, 06 Jan 2026 02:54:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8LbqWhLWBjrqxtrYCiPh0IY/UdFZmI0mTogA2PeZoSLUp3f8a6ZHKaFlhh7e3dP6B8DH21A==
X-Received: by 2002:a05:6a00:400c:b0:7e8:3fcb:bc46 with SMTP id d2e1a72fcca58-81944ea24famr2326769b3a.27.1767696859028;
        Tue, 06 Jan 2026 02:54:19 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b98sm1855121b3a.20.2026.01.06.02.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 02:54:18 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v9 0/6] Add new driver for WCSS secure PIL loading
Date: Tue,  6 Jan 2026 16:24:06 +0530
Message-Id: <20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5MiBTYWx0ZWRfX6KU7e0QPyb4i
 UmSfatFpElCUhniaSan26LwBYZnzxLYLkjhii3LkyAC2swP43YpAVdN2n0j+NAHxFHb1c2gWCDR
 ++30HsJG7ReN4wFfjIV7p+ckfg+/UkGiZv0f8PFjO92oZYUBoFsXD8AHItpTMxNer0ZA0r8oE7w
 DuVDRjk0csbCY5RdUKq7rL2II3zltWeK0pYRAWuyjrPPA7w9PnJVOTq28j9sf0sLXZ0jawrpwd7
 ae9DInNpfVp/ATKcESZovmevkmYt1H84jEK4DmSH2Kif1zvBvyFDEydsrvCt4ehV8MXxKoW4m5t
 5Cs87oBEYGUpzvvylCyd5x86yFS1hp3GK09k9zz75br8No4/m9nvXZEq1/AWG0sADmzf+kMLHFu
 3fA5utoajly9N4oJ/wOYb82W2NwkJ4/3uaAc42hWzcfwdUq91BkhyCaD0qIhWNuKi7Eaa0KGkzT
 45DH0wEJUKMitnv7olg==
X-Authority-Analysis: v=2.4 cv=YqIChoYX c=1 sm=1 tr=0 ts=695ce9dc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=EUspDBNiAAAA:8
 a=UqCG9HQmAAAA:8 a=gjiOCNvPbvlRQkj2kwMA:9 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-GUID: Pbdj9l38fMYZhP8nurnYexqW4hMORjjW
X-Proofpoint-ORIG-GUID: Pbdj9l38fMYZhP8nurnYexqW4hMORjjW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060092

As discussed in [4] posting this series after dropping IPQ5424 support
to remove dependency on Sricharan's tmel-qmp mailbox driver series v4 [1].

Imported from 20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com.

Imported from f20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com
I've resumed Gokul's work as the last submission dates back April 2025.

- Secure PIL is signed, firmware images which only TrustZone (TZ)
  can authenticate and load. Linux kernel will send a request to TZ to
  authenticate and load the PIL images.

- When secure PIL support was added to the existing wcss PIL driver
  earlier in [2], Bjorn suggested not to overload the existing WCSS
  rproc driver, instead post a new driver for PAS based IPQ WCSS driver.
  This series adds a new secure PIL driver for the same.

- Also adds changes to scm to pass metadata size as required for IPQ5332,
  reposted from [3].

[1]
https://patchwork.kernel.org/project/linux-arm-msm/cover/20250327181750.3733881-1-quic_srichara@quicinc.com/

[2]
https://patchwork.kernel.org/project/linux-arm-msm/patch/1611984013-10201-3-git-send-email-gokulsri@codeaurora.org/

[3]
https://patchwork.kernel.org/project/linux-arm-msm/patch/20240820055618.267554-6-quic_gokulsri@quicinc.com/

[4]
https://lore.kernel.org/linux-arm-msm/aUN7Aer%2FGG1d5Om9@hu-varada-blr.qualcomm.com/

Changes in v9:
	- Add R-b from Konrad for dts patches
	- Renamed qcom,wcss-sec-pil.yaml -> qcom,ipq5018-wcss-sec-pil.yaml
	- Restore clocks & clock-names in above yaml
	- Fix DCO on two patches
	- Link to v8: https://lore.kernel.org/linux-arm-msm/20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com/

Changes in v8:
	- Dropped Krzysztof's 'Reviewed-by' as the bindings file has changed significantly
		* IPQ5018 support added in v6
		* IPQ5424 support dropped in v8
		* Updated to use IPQ9574 as example
	- dt-bindings-check and dtbs-check passed
	- Dropped IPQ5424 support from drivers/remoteproc/qcom_q6v5_wcss_sec.c
	- Updated copyrights of drivers/remoteproc/qcom_q6v5_wcss_sec.c
	- Change 'qcom,smem-state-names' order to resolve dt-bindings-check error in ipq5018.dtsi
	- Dropped changes to ipq5424.dtsi
	- Link to v7: https://lore.kernel.org/linux-arm-msm/20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com/

Changes in v7:
	- correctly sorted QCOM_SCM_PIL_PAS_INIT_IMAGE_V2 by command ID
	- correctly sorted smp2p-wcss nodes in dtsi files
	- Link to v6: https://lore.kernel.org/r/20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com

Changes in v6:
	- added patch to fix IPC register offset for ipq5424
	- changed phandle description for mboxes property in dt-bindings
	- updated bindings to define the right clocks per SoC based on
	  compatible. Ran make dt_binding_check for validation of all
	  SoCs
	- use of more descriptive match data property (use_tmelcom) and
	  added a condition in wcss_start to not error out if tmelcom
	  isn't used
	- mitigated potential off-by-one
	- adopted use of of_reserved_mem_region_to_resource to acquire
	  memory-region resource
	- added driver support for ipq5018 SoC
	- corrected size of reg properties as per Konrad's comments
	- added patch to bring up Q6 in ipq5018 dtsi
	- Link to v5: https://lore.kernel.org/r/20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com

Changes in v5:
	- retained all the patches as in v3 and addressed comments in
	  v3.
	- reverted changes to dt-bindings done in v4 and retained as in
	  v3 and fixed firmware format from .mdt to .mbn and retained
	  reviewed-by.
	- dropped 2 patches in v4 that adds support for q6 dtb loading.
	  Will post them as a new series.

	Following tests were done:
	- checkpatch
	- dt_binding_check and dtbs_check
	- Link to v4: https://lore.kernel.org/r/20250327181750.3733881-1-quic_srichara@quicinc.com

Changes in v4:
        - changed q6 firmware image format from .mdt to .mbn
        - corrected arrangement of variable assignemnts as per comments
          in qcom_scm.c
        - added scm call to get board machid
        - added support for q6 dtb loading with support for additional
          reserved memory for q6 dtb in .mbn format
        - updated dt-bindings to include new dts entry qcom,q6-dtb-info
          and additional item in memory-region for q6 dtb region.
        - removed unnecessary dependency for QCOM_Q6V5_WCSS_SEC in
          Kconfig
        - removed unwanted header files in qcom_q6v5_wcss_sec.c
        - removed repeated dtb parsing during runtime in qcom_q6v5_wcss_sec.c
        - added required check for using tmelcom, if available. Enabled
          fallback to scm based authentication, if tmelcom is unavailable.
        - added necessary padding for 8digt hex address in dts
	- Link to v3: https://lore.kernel.org/r/20250107101320.2078139-1-quic_gokulsri@quicinc.com

	Following tests were done:
	- checkpatch
	- kernel-doc
	- dt_binding_check and dtbs_check

Changes in v3:
        - fixed copyright years and markings based on Jeff's comments.
        - replaced devm_ioremap_wc() with ioremap_wc() in
          wcss_sec_copy_segment().
        - replaced rproc_alloc() and rproc_add() with their devres
          counterparts.
        - added mailbox call to tmelcom for secure image authentication
          as required for IPQ5424. Added ipq5424 APCS comatible required.
        - added changes to scm call to pass metadata size as required for
          IPQ5332.
	- Link to v2: https://lore.kernel.org/r/20240829134021.1452711-1-quic_gokulsri@quicinc.com

Changes in v2:
        - Removed dependency of this series to q6 clock removal series
          as recommended by Krzysztof
	- Link to v1: https://lore.kernel.org/r/20240820085517.435566-1-quic_gokulsri@quicinc.com

George Moussalem (1):
  arm64: dts: qcom: ipq5018: add nodes to bring up q6

Manikanta Mylavarapu (4):
  firmware: qcom_scm: ipq5332: add support to pass metadata size
  dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
  arm64: dts: qcom: ipq5332: add nodes to bring up q6
  arm64: dts: qcom: ipq9574: add nodes to bring up q6

Vignesh Viswanathan (1):
  remoteproc: qcom: add hexagon based WCSS secure PIL driver

 .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml | 178 ++++++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi         |  64 ++++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi         |  64 +++-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  60 +++-
 drivers/firmware/qcom/qcom_scm.c              |  17 +-
 drivers/firmware/qcom/qcom_scm.h              |   1 +
 drivers/remoteproc/Kconfig                    |  19 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_q6v5_wcss_sec.c       | 328 ++++++++++++++++++
 include/linux/remoteproc.h                    |   2 +
 10 files changed, 728 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
 create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c


base-commit: 3609fa95fb0f2c1b099e69e56634edb8fc03f87c
-- 
2.34.1

