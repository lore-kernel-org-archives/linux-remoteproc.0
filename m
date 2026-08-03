Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEF936EAA4
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Aug 2026 10:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753988; cv=none; b=Ya6k/vgDxEui5Fnkgg1PWAi5JXFPfYvb4H9O3v9t8g0FU/dvOC4HZ/7/KwyuBaOdvKBs/kO7vkQhEvecM0vuGqphl6kGXihAcB7wpgGUX0SOOlj3uyBZzFUIug0qPtflY4uNanSQMJVqurIIulJrgKNwc1hMqDx8EPLLB4muOjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753988; c=relaxed/simple;
	bh=BD1HWuRr1N0w1TGuLYUCJRH3Czqul1pwUwN9qI3ORiw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FV2yRKPlWjN23plGdIEsDJMZRwNEopqU7ZYvkEevfx/l0DqR/brfC57oSFBxiqVg/mGmp98bB6M3+Uj1uhEsps5mGlqPSV3EQI+rmHVa0s9mdW4kcCgHbTOsx/XYAtFWp5J1Qwf3FSlIEW5QrpfAVbWHMWXHWMjLX88LlW2Vz60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HkRb/YzF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADcKu+ye; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HkRb/YzF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADcKu+ye"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736F44M005963
	for <linux-remoteproc@vger.kernel.org>; Mon, 3 Aug 2026 10:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/lhsWmGHBsd0jYl/DiV/YP
	otANEc8T5/IByKjrGNTPE=; b=HkRb/YzFpIAPflnRmr3/yDPZgkUCxzVkUGADlA
	TRTYYkDTL8Hsq6ytv7Nwvv6QSX0fUTxZKHtHKp5ouLybTgQaEPAOKD+6SMJgAINP
	JW1h8qi0glQBWspfBEYnPJFioP1p5pEtrgGbxkDrTRWVKZ7Q04EcsqWWnFRXvXn2
	i0D87xKtC42PiUTW2X2IEl/xk2gjxaYP2hGny0urnND4jvI+T8GHPFP1Fu3D09WS
	eftY2zRmDyqI19TfMiAcLSUKYzGYf3uj24D3EgaSM5QQDgPals1oTryF+hF2E78V
	UtujAdprM0ap7ZGOU3vE2yhkH65nRAdtsi5WSW1qbRsdEbHA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnj7940d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 10:46:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa4e4684bso89106785ad.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 03:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785753985; x=1786358785; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/lhsWmGHBsd0jYl/DiV/YPotANEc8T5/IByKjrGNTPE=;
        b=ADcKu+yeAAsesO36AGBYi1MIXR9/8VsADR9E64L2MFvI8ERX/D5YlkaEUpx5uP9xpf
         ElIa/xNMJ5j1EnInidSixOLa9hfIVPSflbKR9s0tp0BB0bncWpA96KShUPaiP+Boh5yR
         e1ZgRozGjvpHazPmLkGMnc+JLFmC7E+lzSZSePBQDeJsdrm7/sr/6CED8HDyndBRK2I9
         LrljfZDHOwIbO4EN0H7qDuyC1kftqVqvIa0IoUqbbEYlGHTxJkWDbBOglaDnQc1lNThP
         UkxOfBdd/0aRdQ0Nzt38BkLGbB5iBfm6fDoZUqgSCjwQwHwfs6N/LNKaNoMWZ2sX1yAP
         bPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753985; x=1786358785;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/lhsWmGHBsd0jYl/DiV/YPotANEc8T5/IByKjrGNTPE=;
        b=RFWEByfAzJJeg4/EcTKxsDCjehLAUuFBGun3B9ql9NI2G/G6Zap6xI0n94eZXRDTqH
         VI68j0qlQTDYJEYKq9R8l8NsflTYQ+Lbiij7sCmvKSnCYGGpA/RMdF9fA3inTdT8z1fF
         yKu75xw468XBP+pGz8gA/agaoxo8blt0cfJ8PoeLB8vDpaZpNAW4j1Ifgjhy1fivWStR
         DymL45iciwCgFiektWUsYyNAMEgvDWme++ham8NHZzORINRzmUAhFrDl95vzq6tKnRjy
         1jRL5VJ8O40wdW2XXVzqEUcSeewA9cUcQD56fzodI8NtpBGOo5xWp/vSna3Dr0QGqghZ
         87VA==
X-Forwarded-Encrypted: i=1; AHgh+RqRX9aEVJkieJbtiYufyHItfXpPsT5Y4RTRoRdUHFQokH9trJWkZ2VA0pMUvvKRmcxfR4nS8WcwzfMdIuL188fx@vger.kernel.org
X-Gm-Message-State: AOJu0YwYSH60d1rrWkuHqA+/6JUo5U7yONEPHVy6rgfSaLYk5sYoQU+o
	hI9SVAuMM3/385s/DprSiBQcp7YMvtMutxRDw9Muon/kSaWjYQGa0fSahrkPyJxcJQNzcLnl7kF
	KcJ/yLNsaw5RKSljW24B04LWbLiPuaxyVN37wq5bIG2I3Hou51yrru49jZg96WRrL26/Bn/4X
X-Gm-Gg: AR+sD11kI4QQ3uVtzYF2ty6Bjacm8ZSoLjIJUaBMxZa/GDYxlgcgkshS7pWHqGHkUD/
	GuizhrFdhhMgnuwRZ2krL1Nd5mXVj9NA0OrEMDBjlMnPkdw0Lb+Ye1FDsPb3oJ2bu8V+H+/I4I0
	tRHVyppciN0gcHS59Hwxl6j0V6KHGMk+T7tvKc2Gl/JPwniAR8tJJKEekxgrLv80szy+Lf0BWqT
	fTiAsXLt3d5HehidFrTfgvQsIMcihhmOXOKV7gBJMXbPA3GbgdooBs02xrLkMbNk+LGGu/pCMoz
	42sKTc7AlW1qpZkW5h19mq63+V6ezeyN1jGV2hyz7Hay4BR83OUkmQB09qj1MNF2gsZQTTkNkYR
	ED4mkhPT2hNZ74UEl95Y/559N/WODs2kB/iuzJ2pT+iNaTcshVKtjapkV/LCw7uE5XOuKAnDYw5
	ksVvdTCgmFUWxP2Y0RaeROaeSZR+XcAA==
X-Received: by 2002:a05:6a21:510:b0:3c3:724d:ae7a with SMTP id adf61e73a8af0-3c92a518b52mr10054316637.9.1785753984578;
        Mon, 03 Aug 2026 03:46:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:510:b0:3c3:724d:ae7a with SMTP id adf61e73a8af0-3c92a518b52mr10054283637.9.1785753984133;
        Mon, 03 Aug 2026 03:46:24 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm29993730c88.13.2026.08.03.03.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:46:23 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v14 0/9] Add new driver for WCSS secure PIL loading
Date: Mon, 03 Aug 2026 16:16:06 +0530
Message-Id: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG9xcGoC/y2OzQqDMBCEX0X23EhW0xY89T2Kh7iuNVCNJlEs4
 rs3/lwWZtj5Zlbw7Ax7KJIVHM/GG9tHgeqWALW6/7AwdTQgk9lDPlEKNzhLglSjaknYqDtB/B0
 cN2Y5QO/y1I7HKfLCaUKlPQuyXWdCkfS8BHEic4Q90BofrPsdQ2bMj8jVmV+d0RZSKJSIVFGtc
 35Z79Nx0t+dm8YD5bZtfwQ6tvrVAAAA
X-Change-ID: 20260710-rproc-c4f4d0c1f45c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: seY9j1O13emK4XH7NokeKuZggBgZY3XK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX38Lxu+R8b+g7
 nX01iavJnvGJBnXgkcEr515gXg7OlF161dNKmZsB0ZWosBeNGmVGon6RANwaZBZbsRPK5nmOYkM
 EoTMJB5zdSOAdHEXdLKz9uK+vCXzSOQZziNwLy+plAXTjIgF1XCF9Luv1R8iqVUCHIME92ltaT0
 10Y4oL+FX0AiKqG7CiB+lkzBO7sjNoCqZwtrDVdAs0NC2YSvf3E4Km6u/uHAmH9yqIqjQ/lWrGl
 Y+P1mko3hhZnaYpZtn5LxAHDF0YeHpxPQJXdnM/zX9lkkVeISXVsg/lPTUPZRiypa+xCJjPydFM
 aMsyNb7XedBdWitKVw/37RdxbMqmNpTn6a15mS5m5biNApSwFP8zSHATh/gwRnb9iETFMY1atgF
 3AeH4Lqmqpd8afGSUA+/rUjmYIA2GneV8DBJmm+nHvtlyg2xkoNUnGPWNW/UFod86YVBoQx7ibl
 xZ877MqCrZVuUcsM3qQ==
X-Proofpoint-GUID: seY9j1O13emK4XH7NokeKuZggBgZY3XK
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a707181 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=EUspDBNiAAAA:8
 a=UqCG9HQmAAAA:8 a=KKAkSRfTAAAA:8 a=PzjQg10roJYlNLfUGYoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX6emM/9DdFyF1
 ilOW9uWgdd/lr/eQTvXC2f6Cd8hgbbTdY8VaatU+PX/ADdwzbmisVhq4Zw6yeanz9f0J7o8W6HB
 udQImUjfutvDUsTVYQT//WWn5jAvW/A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030096

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

Changes in v14:
	- Fix dt-bindings-error
	- Drop 'driver' from mbox description
	- Remove Tested-by from dt-bindings patch
	- Address applicable AI review feedback
		Use %pe for PTR_ERR
		Use the generic PAS context/API consistently
		Handle wcss_sec_start() failures
		Use proper PAS stop sequence in wcss_sec_stop()
		Disable 'q6v5_wcss' in dtsi and enable in board specific dts
	- Update constraints for qcom,smem-states in qcom,ipq5018-wcss-sec-pil.yaml
	- Link to v13: https://lore.kernel.org/r/20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com

Changes in v13:
	- Rebase to ToT (First patch alone had conflicts)
	- Add 'Tested-by: Vignesh'
	- Link to v12: https://lore.kernel.org/linux-arm-msm/20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com/

Changes in v12:
	- No code change
	- Rebase to ToT
	- Change quicinc mail ids to oss.qualcomm.com mail ids
	- Link to v11: https://lore.kernel.org/linux-arm-msm/20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com/

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

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org
base-commit: next-20260710
-- 
2.34.1

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
George Moussalem (1):
      arm64: dts: qcom: ipq5018: add nodes to bring up q6

Manikanta Mylavarapu (4):
      firmware: qcom_scm: ipq5332: add support to pass metadata size
      dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
      arm64: dts: qcom: ipq5332: add nodes to bring up q6
      arm64: dts: qcom: ipq9574: add nodes to bring up q6

Varadarajan Narayanan (3):
      arm64: dts: qcom: ipq5018: Enable q6v5_wcss
      arm64: dts: qcom: ipq5332: Enable q6v5_wcss
      arm64: dts: qcom: ipq9574: Enable q6v5_wcss

Vignesh Viswanathan (1):
      remoteproc: qcom: add hexagon based WCSS secure PIL driver

 .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml      | 178 +++++++++++
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts     |   4 +
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |  66 ++++
 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi   |   4 +
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |  64 ++++
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi   |   4 +
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  62 +++-
 drivers/firmware/qcom/qcom_scm.c                   |  16 +-
 drivers/firmware/qcom/qcom_scm.h                   |   1 +
 drivers/remoteproc/Kconfig                         |  20 ++
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/qcom_q6v5_wcss_sec.c            | 337 +++++++++++++++++++++
 include/linux/remoteproc.h                         |   2 +
 13 files changed, 754 insertions(+), 5 deletions(-)
---
base-commit: 9dba66b6217aacb924d997de3866e7e4c0dcf952
change-id: 20260710-rproc-c4f4d0c1f45c

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

