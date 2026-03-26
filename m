Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCA61A6802
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Mar 2026 04:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499612; cv=none; b=kp3DiDbhtfoUWz4sQZiPkOiQB3eMU7InvXVwiQSwVbqiEcrN68f4SshH3UvQ5w1UMwLueEKjha/NBq6/T8BsZNlEX46GzYvjC7OK5fZjpF9okWPnx9EWYSknLVT46Io/2bY9i4Xj7kKfpiGqdkzaqL0DwUNsaFbMlsklyxT4xCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499612; c=relaxed/simple;
	bh=9godXLTgZ93xDiup1AAXvr4yCJUVryT+oPn3hsPULVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZLiOZL/G1MKcf7U89Ung2hll8omf/imIqpnsfvXXt+qbuOZjxU4dFVHohyzKq8QDrB7Vqt2ImSt5MpV0t6msb+1GJD055h2H/qay+ozNL4yEnIuBA2EXy5VWiO6sHdnL7tqi7bUmZS1KNmUUIcomym+zdb36nRZu0s41COdO924=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cioFQFg4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LKNNFz9L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cioFQFg4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LKNNFz9L"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q3a0I94015126
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Mar 2026 04:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Zm4NDBy1tKbgQwT749j1IGZcL3hX51NhEY0
	ZW3KtYEo=; b=cioFQFg4oXJLoC/Kh2mzp+q+2YgXhKiAsKBCnGrgZLqeI5gu8lP
	vmjsI066qyZc6PKYt6mCKipCOenyoKdWasPrWWxjYNuHPR6gSj6DbwGS6iInHpH6
	lP5r0KBL/nluWeym0ffqwCJASAvRs1YXXIhL1HJ0l08KbPd61LYHxY4HVSpjgKTQ
	1qLpBwrmUM/v4DfQBeptHISds69DBi4twW9U7retnxaYlU2UUrOlrdPIVNRi5QwN
	po+XYtNBZ3CLMDuKwNw3hb+O9KC4PVxMWS3S+ITk91kAWdKJ9FHBqZ0txat7TLgL
	Mn62SWuUtm5RwQSl/JnrfvIN4BJm0ajLsYA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4w1q84sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Mar 2026 04:33:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b04911610fso7302835ad.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Mar 2026 21:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774499608; x=1775104408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zm4NDBy1tKbgQwT749j1IGZcL3hX51NhEY0ZW3KtYEo=;
        b=LKNNFz9LbK0Ur7OEnUmMS2PWwuj/H3vzesD04PD5s2UEr3Gdz46YPw5M/q2kcSVl2a
         IyjGQdluFX2yBtDK7p7hZdYFaspLzVLvhsSX5BssUV2KeJ3zVhHvmjoVjG7Kr4/1vPM3
         1PNww6zJEA5AQIaTu+ehTksxZw7mBWva7f0QJo8HNmpqOdgU3Ph5ItdMwumMgQcHADDG
         lcWphi/NLC35r0HkNKFEgI9gyOunvadXYP4I+ZhwbzYwj2j1VmvfY+ATTn4lAJstWmZc
         uRP6aWIECfNWiW6K4qNg46xfFEZtNFl6grBOAZvG25lVTf6Jrv7lSNVP5ciqIR6q8QV2
         YblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774499608; x=1775104408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zm4NDBy1tKbgQwT749j1IGZcL3hX51NhEY0ZW3KtYEo=;
        b=f2tEy8EIpsFj5f2AvnqggdWxmEy5n/dk9A4ofOdoqQ574+hgja0ufRi+zzFFUw6i1H
         w6gV81gZMZvfHNoM9T20nxml6l7vnGXfV6F/rKAQ1s/aEIiu7z5a7CGDmQjnEhbnF5Qk
         Lfiw7KzzXwDEGtrlRqI9FQ2/vox7htJvx7aVt+2d1ykrZXpbOWywpputwGlfXUZMX/23
         Iqi2v9Ll+CRFb6IFTRM5yaqFxtkRUMwpUsY3RWGmsm/mr68kxi51rqTSdQisVXEPlLkj
         8DOMQyVrBEbcb1qgcX/tAH09/1eE8ISp7Dc1tku1kg626n9P9Z5hEWR4ny6Bpm7q1XBg
         0a0w==
X-Forwarded-Encrypted: i=1; AJvYcCWsJZBlzsvjHyrrI16pxlXH6+hSV8BzZ3Y9peWKjUuchpNqpowBakuUVl+KvoVraU64MH54Z0BQm0CEOQlezEsM@vger.kernel.org
X-Gm-Message-State: AOJu0YyrCD7Gy96BaZxi0TTZZJx1IawfuGbVjZe9lHkijCBVzoiCAMkm
	uspa1LFt8Gb6Q2nXBL1utcRaS08UahfFDXl1cXOzMgKdZzy0PnH/oExNt7ZZnE9BkeM37f7iKBX
	FtJmjii07UwazxBA49NQYGZ9XGeRp4+jmrQNWws8ai37h1OiWv7cRnI/62FCmk8Pmoy2IGirR
X-Gm-Gg: ATEYQzx6ON79RfFgSU5EK5sIMlPqXWLJEzzl1e2Y8HQshOkW3mo/q4hm79OvquT024y
	d/InTTMrKKOej9oKmAvemJMpQLgQ/pRZy5OkqArS7IEnQCQ/EKcrFhJ2L1BZ3yJV4pyBWHYpEyO
	LYOTZdUzmKaFkr8U9NGBw1lYmCXZN8jV5ikp5PreeTM0vAooW/ANq7W7eV3wMRWI8/e9UMu5cax
	YdLjVG300A0MLE1jNgtfud+WRjbMaXJldKDiydZsof/wcAeeOx+5wJ4NTAS42an7tWKUPaSS4VJ
	2bv4EyECahGOS1TWYBQ9CDVuIhV56GqAJmO34LWHm7o5/cSsEuzpNOJKl37iXHgRHDNP1vByX14
	tOlYdELdlw42TaG/b+7QXZDip7oiHKrqYj9Q+n9b5dw5PxvrtPFj3BQsdcTLc90uF8Z78rECxQ0
	JeRRr1IJ0y7OJyDcQ4bWa26Es5W6kfBbOLHoerS5c5F4GdKRWDpss=
X-Received: by 2002:a17:903:37cd:b0:2ae:a95e:fe58 with SMTP id d9443c01a7336-2b0b098b3e9mr62330945ad.8.1774499608399;
        Wed, 25 Mar 2026 21:33:28 -0700 (PDT)
X-Received: by 2002:a17:903:37cd:b0:2ae:a95e:fe58 with SMTP id d9443c01a7336-2b0b098b3e9mr62330635ad.8.1774499607898;
        Wed, 25 Mar 2026 21:33:27 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7b233fsm15163715ad.32.2026.03.25.21.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:33:27 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v11 0/6] Add new driver for WCSS secure PIL loading
Date: Thu, 26 Mar 2026 10:03:14 +0530
Message-Id: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nD2vXEYXUyov8-y2QUp4djJaidjGDj6r
X-Authority-Analysis: v=2.4 cv=HvV72kTS c=1 sm=1 tr=0 ts=69c4b719 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8
 a=RJCUFTRzgs7Fj7gX-CAA:9 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzMiBTYWx0ZWRfXzARYCzIuAiWh
 p5TChUbA5nZZplOiQrS6QlEsDM390welAs4YshyHlY7ycv0zQsW+NVxle9fzFm/1kVEJ1d7LAFk
 XD3ZfHDZOoBxKHkCpBoy2bY3KhYAOm4a78Uc9eGwgLg1lSAT99zOgi062kOg0s+6wF+Qjk+Rcej
 gZpD46p64Ro28mvMneDVNUEFA6moAH/pYXvKvrDZQRF4qOUWxUYQ8HpEC0qg9QN8+N3fhE89eTb
 futyFhwQ6tT3VqE1eLjtwS7uGi5X197Sk1Tf12ygdf9zr0vr4/+lNQUSrHs/O2f4zQFb6AurhJz
 zPxjAknWyW4PGLc96Fr2y0GOonXEQqIPx6IABvsWtRYKpQ/bb3av0wPahX2OFtaloCwHM5KTyxA
 vICwSno0EOKnF8DXwHJHLtxV2Ta0XswRM5X2vn2oPoazBTHQEOicX4BQW0iHwFd7QUm/WW3iPK9
 +0TW1Rumj8XEoKASArA==
X-Proofpoint-GUID: nD2vXEYXUyov8-y2QUp4djJaidjGDj6r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260032

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

Changes in v11:
	- Add R-b tags
	- Rebase the first patch ("firmware: qcom_scm: ipq5332: add support to pass metadata size") to top of tree
	- No change in other patches
	- Link to v10: https://lore.kernel.org/linux-arm-msm/20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com/

Changes in v10:
	- Add R-b tags
	- Remove unused fields from 'struct wcss_sec'
	- Remove glink and ssr subdev if wcss_sec_probe() fails
	- Link to v9: https://lore.kernel.org/linux-arm-msm/20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com/

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
 drivers/firmware/qcom/qcom_scm.c              |  14 +-
 drivers/firmware/qcom/qcom_scm.h              |   1 +
 drivers/remoteproc/Kconfig                    |  19 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_q6v5_wcss_sec.c       | 325 ++++++++++++++++++
 include/linux/remoteproc.h                    |   2 +
 10 files changed, 723 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
 create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c


base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
-- 
2.34.1

