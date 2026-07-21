Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A243BB128
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 08:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622223; cv=none; b=j+3+4n/nXZnW0eOnbpnebLGbFon0gUXQ4b/mNodMpnVMsqb7pv6q3ynp3lkm/h0zGuHUuxnwcqqaBE4l85nduBmOX+kDqw87TxAQ6ALnIusUHcBPH9J5I5axI5DhDhXQnTSTybhbKXdUi7m7+WLyxg1zZZvZE9U3SVatqWg5k4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622223; c=relaxed/simple;
	bh=IdacYcGD3xtUJHQO5lneJTXXBYWWe40tyiy07TVghxE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pPQBA+dJRq9m1UVt+H0ctr6iqCGotZu+VHi8u7VaHqCdQUXfCBxFzmtSKyxsjuAlpBX2aVCbccOUoM3m+jyOsiMfVfmbI9GpkBJ8fKAsjfHBtuo6R78Li/DuM32s0yDGSyQ/pHuxxbpEoEYpdCgDml4dymMlIRiMnLpg++NR+E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJ1J/Raw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZOsUpsd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJ1J/Raw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZOsUpsd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L4Ssdh527405
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 08:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NJWAl4QaR8sWRyabhnWLw+
	xVs+hhrOsgojMdV2OvA2s=; b=IJ1J/RawMb1OUGmAifQzgWzMOFaOO6703/KUd8
	aeRTomGZEUmvfmFHgaK84xxZCUIP+CNJKXhoL7OO/NF2StlQZLY2iV0X/sDPdQNt
	0j4YwRrcL8Hmq/IBWPSIS2y69T6xs/8XX7so9jgRs4g0/QTLyJnnp3bYgfXm1VUH
	m3vqBePFvWCwTFEkB2NoGpwWyDfRLnxe01s7CtATPu4Rz4V3eVdJp/KSoRrh8Enw
	HwxG5e/0SMI0TJhvwCxFij3kTOzGMKhCbu0RLQSJQ6JGT2jdsKnkRCWNvMU7HmQ/
	lYDo3PHC4vCnN52LK0dqkckQAx6x9wCTqzMBPJlajFhohMdg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se0vew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 08:23:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c01ff996dso85744391cf.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 01:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784622220; x=1785227020; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NJWAl4QaR8sWRyabhnWLw+xVs+hhrOsgojMdV2OvA2s=;
        b=cZOsUpsd3mde9CHByEiAZFMPH8Uzu2XQdwtpwz1MtKZwPGKxkEuxBbYAY2fiFSe/Qm
         IlXYUAx2jt0oX5u+akycxfAlhxeCt0tw6MyaowPbzQIRPJw81pWabfQie1LTOL3A7H9D
         V8OCGDxlMGlkQwSbUEmYaHJQxIFWKgB8/7TAjU0k/Q/2h0b4i5K01Jmkki6gA2huInzB
         2e/obS/0xjFBCnQLQsqIPV247w3p4Pc8SY2DqmKGPTDU6TOmOU5nZ3Xrjzvu8X36v9GJ
         76mXMWA2YL8w8hbqD35S6lBqJfbcCqpm3KXtU9WEYKkgHY7PPip8/7kny3ka6X0loXSs
         MsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622220; x=1785227020;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NJWAl4QaR8sWRyabhnWLw+xVs+hhrOsgojMdV2OvA2s=;
        b=f5QLLP4AGSvpDhkk1f+S3yrh9v7BOoGSY96pit+S6ajtsQwfpifuLt3gxLWtT8Snzi
         XiTHgFxpQ9M93Xb3dG/OF4jW4Uo4CO+R/kwsZ8Yr14IZx08cUPkr9YoWKErpMRRwKvdi
         mde298x7M0K5j1daDxwuQ/fSO7GobDSDHKmqPVOHZKNd47w96HIVB89ztu/yvix57aYE
         nWorbWKd4lmtGYyjPVWNKWDwIyEfE3Ny6zOvd3togEZZaqHVPjh9cQVFj2xBGIx04tFF
         2ysa/CIHyrZFBZjbHEnqf/YOCcm6RqN5tug/yn8kh3wQtKMCN+1B1B6XR+sM8aOhYdmj
         YLvw==
X-Forwarded-Encrypted: i=1; AHgh+RqWRmg/vy+uoBwKDq+ofnmax1BtbtmLueuPqRdEBXISyqD7tD/IhVLfO9rujUHsYFOzV+kUv/Xy82SwqYM47mht@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3nDhKY5vxfOAcy6/IUxb/hcHFOoWthytgIVzS4FDoCUHiOfFS
	ELFs/b/ln5Re7jh6y8tQ193XNIR1+SVvJfVixSoh/j07FCrDzN+XRHWhSVTkzLwI2xwbMFUgx/3
	SXeIsgQsrMivxodISJkv1GtXAbulS7PA5sjFcDL5keokW+BVVRbqPsYpH65L6WslsHQ0+2H2C
X-Gm-Gg: AfdE7clxB/g57RlSKD2WtpRDfhDIv1ZGZyg0Bb3EByaIyvuWYXVY2TZSaewGjQYT5Ry
	BFy/y4Nh2EGcWYkOZUEhWtaTEG2FBxfDVK9692ZYMQLFKwHTw2xnnkK0WyAa7NdMePcLLnVugM0
	vTmBHyBSmC9mdfwA6fqti8Kw50fsZeD5bERSFjL65FVQMkgoQ6Spp4zs5c+rXav59EBhFPgqmpI
	itbeTw8jA9qqvK+iitpLQ6oLQ78qftEUoGM+nmnmUsushxEu13S8yPEsOrUIIoMZoGQdLqJyQgX
	xDBe4scBEdR2rB0k4APD/K+/H776jtTj7TtkM56eETulqCx94DnwVix2gQmOIal5cCLVdU3YBvJ
	xXpwEEE0h
X-Received: by 2002:ac8:5ac6:0:b0:51c:1811:6eaf with SMTP id d75a77b69052e-5213eb7b77cmr170419401cf.65.1784622220142;
        Tue, 21 Jul 2026 01:23:40 -0700 (PDT)
X-Received: by 2002:ac8:5ac6:0:b0:51c:1811:6eaf with SMTP id d75a77b69052e-5213eb7b77cmr170419181cf.65.1784622219627;
        Tue, 21 Jul 2026 01:23:39 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7ea1sm38202194f8f.24.2026.07.21.01.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:23:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/2] remoteproc: qcom: pas: Add support for CDSP on
 Eliza SoC
Date: Tue, 21 Jul 2026 11:23:28 +0300
Message-Id: <20260721-remoteproc-eliza-cdsp-v2-0-f3345405e4da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIAsX2oC/3WNQQ6CMBREr0K69pO2iA2uvIdh0ZaP1ADFfiAq4
 e4WjEs3k7xkZt7CCINDYudkYQFnR873EeQhYbbR/Q3BVZGZ5PLElcggYOdHHIK3gK17a7AVDcC
 V4sJoaYr8xOJ2CFi75/57Lb9Mk7mjHbezrdE4Gn147eJZbL2f4/jHMQvgkEk0Sota2ry4eKL0M
 enW+q5LY7ByXdcP+u3JmtMAAAA=
X-Change-ID: 20260713-remoteproc-eliza-cdsp-07701ba2b956
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1068;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=IdacYcGD3xtUJHQO5lneJTXXBYWWe40tyiy07TVghxE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqXyyC56fkeEERXrJX5IrjaA7s7BA6GulO9JJnk
 oC3bY2Fp/aJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal8sggAKCRAbX0TJAJUV
 VoMjD/9xQA4efZsRe3m+kaw2LmrFt/WLaN8kPP4S96PFpgy1XWmFup3QdV+cg3tudRf3awc15bv
 S02ioXDfIp3Fr3sNhzkP1fMKrPrKCvMI9mfAccN+GymQ5Llsbp5wzPauPKeSAhawlQ6oKGivkFs
 fMMeupK6QyvhilaZcLdTVTYCzCctOtPS/yVAjDEWueRmbewQw7NxfcYsfhKwwls1gkyH3POm9F9
 PpLbX41E3ryKdAff4YjFRq3+JPemuSti70jl8JAEwa5XnkKAdnbeMI9LnvfLoDXLX06NF7WDm2J
 JyESpU3Nbmu9dU4Ntl22fYCKWPQg7KQ+zxERbvcFO6VnR0nkQqQTAEbUdMMM673qRJRp3vcKyoS
 nNL+c4tB1EY4GRmEnUlkdSvueRygSkejZMc7UAEnvny5pQcH990CO9k9P8r3nLkNkbrFzQf6Rp5
 Yah7OBlsHXJk/5KbOuOuhxatoaqGoMP2bvBriIE+P7c5xCMUMCddCVvPhuFDtAJ8C+21q+HdLRu
 4bveG12t3AuXDBOGwDBZcCjUYtLEDwVZZFnOJh/4+jNP4E3fd8XThfx2uhZHpNtm4T6mrP6I1md
 B3ce4fF4hZq7KQN+AHJcwaedOPFGvRqnFlZO40rzmjnuqJYNrGdiItMhHvnpunS9l12brl/Ot6R
 IlvOBR7kc2fQtXA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: mfyQIC5qCeQS0vGIsbgalaDH_lrkanpd
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f2c8c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=UevxoewetnaWWcJ7pQIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfXxWoINRZFTuQt
 aAvyr8XcLZqIi/Ev8z8+M/zn7+Y+kEGj81wbFnAPoi+sP+3n8OJAvvnJne7zwldnmWzfIATaxWV
 Uy1gmpNrr/1nMapcpoGNsR8KUOlWHLY=
X-Proofpoint-GUID: mfyQIC5qCeQS0vGIsbgalaDH_lrkanpd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfX8WYMu4fb/E6T
 ZhQ/H4XKS8OtQxeEiuwGi4MAQjtYN3LVyusHSWlcPhuvwO/9rnOEcUD7Sck6EZel8QxVnQxXUKt
 RtPmyxostSreFO2FYYOByN4f7Oktb5IpUqI8Xk89r8fFwKGkHiTOq2NV6SkeIFEV2clAw6bQqbg
 5KnpC8kv/Ff9cHbJOPwyelJ2BwT0cxSepcPrj8Kf3UzTuki9FPypGj9SPxZMjd9GRv6ySVm5job
 ifnmEwEhGrcqRMjXD78QQKCLmECUI/j8XsU6yM0TQLw6Lxh+IiBlSQkYJD/F08mXh1kfHYs1LDX
 ZLhjrqVKLWuJYHpn4ajLqdl17mxlKjc0eyxUAB5vLkAYFHAxSYZzvQbeGz32xBshDoZrnPnDqIP
 Qd4eB1hMy0zs6gqyApROmL9Nk4iKNAxpREJhheT2HIj4UcENGGUNZ0OQ8SrwMPsLQQMCf61jgR7
 3I/50htMgyjY0LB7PEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210087

First, document the compatible and add the DSM memory region
and the NSP power domain, both needed on Eliza.

Then, add the driver data and tie it to the compatible.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260720.
- Picked Konrad's R-b tag for the driver patch.
- Added maxItems constrain for devices with only 2 memory-regions,
  as per sashiko's suggestion.
- Link to v1: https://patch.msgid.link/20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com

---
Abel Vesa (2):
      dt-bindings: remoteproc: qcom,milos-pas: Add Eliza CDSP compatible
      remoteproc: qcom: pas: Add Eliza CDSP support

 .../bindings/remoteproc/qcom,milos-pas.yaml        | 42 +++++++++++++++++++++-
 drivers/remoteproc/qcom_q6v5_pas.c                 | 26 ++++++++++++++
 2 files changed, 67 insertions(+), 1 deletion(-)
---
base-commit: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
change-id: 20260713-remoteproc-eliza-cdsp-07701ba2b956

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

