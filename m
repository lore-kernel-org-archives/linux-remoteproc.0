Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2BB3655D9
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 11:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784633740; cv=none; b=tN504yBqQDJFk5dGVjmfAtso040O3ESTtwO4jAVflQwLrbtPDdAeA0e8p9TJcnf2hZMoJKbE3Lll3kDZ8h+plHZKVg9Rd7MFt/M7XzNxiSE4xFTwRx3uFOciD6L3FVTYm8CTQh/s/SlgF+gO0qyvrHwhP8ltHno3tl8VooXUSNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784633740; c=relaxed/simple;
	bh=kYCw7kFj1Ar/UWyK7td5eGwp0BpfpVW8O/ifsQNLcUc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YCM97mI3+dgF4Oz9r21BfKCSOyiogYGUvUOacMr9kpSymBZ/5R60ohxDX0+5Nli46oEVm+IOkIPuLXavRZ7V6dJxWBsa+YlGX7EUdxaPUmWcZ0fWAapuHOvgpuvMIaFbWMS86J2N1VIPkT2WVyWpe048msxBCeWxM3fHnqdck3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7BW3Hp6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i9VKRJPF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7BW3Hp6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i9VKRJPF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARMC7945800
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 11:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jRsxccGB4f3YCeySZ5zozK
	e+JJroaGspCDGGcBVYVdw=; b=N7BW3Hp66FiZCskxbZ//r3v8tyOKNznm0aYQ/R
	VbFb4X/Po0ayXjZtaE6x+a/8K2y1rxn8PIVcIRh/SruSM3mQw6wPuyrvlj6GYTPn
	8CCUoFA9eLGfG/yXMqdfRm6ksKqRhL/Jo79BnmF/sAhUpNwEHyur5NaUXO+QdpZ7
	/fEXLeQ3qiZUaAw64mRxxR1odL0EHvQCA2ijwe8NAkayF1oG2oRWVvC+9MZM8iYd
	XYnutqcHXJj6mMNTmjLFZIIyoCVSfe2EEkb4lQv+ph3DIrka6C0FNKRu1/SI6D5P
	jsbqZBEBDhRLfG8bVi5r7KngYeebygJapO+DsB+0+MEkh7hw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1es21hw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 11:35:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-522de3c645dso81878071cf.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 04:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784633738; x=1785238538; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jRsxccGB4f3YCeySZ5zozKe+JJroaGspCDGGcBVYVdw=;
        b=i9VKRJPFyWrLWNIoR7h52bNDDxgwq6T3xO6pwQjT6UUAYqHL+lFeOtdZglmMKQwLIh
         0AnUKW/WEtWI3LmGk0UWa2BLUARSd3cFDe2KSjo/LhTazPTyggtvgjxXcIzteS9+7X+P
         NlSMJBshjlan4wIPstjGc9wEdwWw5NrH3CnW8EqIYXhHYEYJvOG36VVrhYztbB78HkCl
         UOK4YxsxanahYkcR+yd5yGXparUq/V0nPUl4yI9ouPJ4Usj5fTEGd2FfvIu3Qu1EOcUB
         5ARD5qOfhX326RSj6zDQN+gIqU4R4DXioTMrOhWcmbV2niNHK9NE0SrTdM0r1Qk/1oET
         WFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784633738; x=1785238538;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jRsxccGB4f3YCeySZ5zozKe+JJroaGspCDGGcBVYVdw=;
        b=IQsG9upP7RL1WU0ljfRO2lDuNLxLbbGAE1HwhlM8Z2HN6zkg2Yu4RO+HnuiCE72H5/
         SDHx5Tldf0FMqhPHvJgB8w6HcvIMLyUTNeVcjLsqWMFG9UOfHAvuBDTGim6A/lURgLQh
         6d4s3+Pp7p5cfH4qy/gwmEIMzRy4HcSvv0QVZFMFs1u7JkLtVjjdkyU2uOQ9cPrhJlFj
         VTvcwAYoFhI5aQlByE9I0GRfxRr9UkFmZ55256nnWiG385FfGmYyEh5UTo+q6EjTRS+6
         xwmKtxNWtyJI+WLXCagh2TCiL7qzg5N7ToadtPiTLn+PZGuOqP5E1FpYAT0uncWLITQj
         HUTg==
X-Forwarded-Encrypted: i=1; AHgh+RrkcfjbOe++ms9cl+QLHtPobC8ASYZOj306crHN6+964S44yjAiRK5VvRSXcnE+Mso+4ddZEb++Bkr22CdJQF6R@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8KV96g3+Nm1paxG2pjh1FrutgrezStIzs+ltbT41NbpMQz09y
	Bw9D1EVM+N+ulPnsh4d+J4cOmmacSbyL91/Ku7T+R38CROYooJ0Ut+782hUYAq6onrkgSJ1hcvd
	ah5KdJSQy/dO0dtpuci6nzrZFSaQhwxKjlrky0EaRdDjgfrg3CQco1AILGmfnSjsP0tjPLAun
X-Gm-Gg: AfdE7cloI7B/WWTsF3gC1cqh/R+V8Vi1Ba37RMHZxHgMu+CTB37wILPutdAo3vmtFYH
	hnp8GyFkT6DFKFHPqRHWpCm/2xZjodzm/1k+SXJYL2zEzAh4vQwLz+q4KdOcrVLbTmMLyHGUXEu
	fk7RQY8ZdavoA1P9X/viIU6Vwd0ET8vdQO82lIc2oKc45899ZjKyYcpz8MFj8tjuhsG3KMpcGbq
	NgXcuKb8O9Um0IvMJAtm/8tJkZjhmH96T37Jq293OUAoFUo0ExKjH4v12DOpgf6DL0A6B8tqxr8
	9k6Qh/r/hg+refOZQxSAKOVOLP3FlaUy/aeCmG/csTp0bVhU6arVg0lAfJS5H0xRqzoQx4hSgwe
	Ft+zymtKK
X-Received: by 2002:ac8:5844:0:b0:51c:100f:f91e with SMTP id d75a77b69052e-5213cdcd5b0mr165068381cf.72.1784633737972;
        Tue, 21 Jul 2026 04:35:37 -0700 (PDT)
X-Received: by 2002:ac8:5844:0:b0:51c:100f:f91e with SMTP id d75a77b69052e-5213cdcd5b0mr165068031cf.72.1784633737360;
        Tue, 21 Jul 2026 04:35:37 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653bfed7sm69798075e9.11.2026.07.21.04.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 04:35:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] dt-bindings: remoteproc: qcom,milos-pas: Fix ADSP
 bindings
Date: Tue, 21 Jul 2026 14:35:06 +0300
Message-Id: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-0-3a0b03af2ec7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGpZX2oC/yWNywrCQAwAf6XkbGA3Bxf8FfGwj7RGdFs3rYil/
 96ox4FhZgXlJqxw6lZo/BKVsRr4Qwf5GuvAKMUYyNHRBfJYZsVnHh/Id/lE7OWNseiESWqROmA
 KwVM0O5EDq0yNzfkdzpc/65JunOdvFrZtB7XDLuKDAAAA
X-Change-ID: 20260721-dts-qcom-eliza-fix-adsp-binding-b7712a026b20
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=kYCw7kFj1Ar/UWyK7td5eGwp0BpfpVW8O/ifsQNLcUc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqX1mDYQA/o7XE1WO+jkEelvdyN6iq2SAcYDbdv
 wqKD3XVU2WJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal9ZgwAKCRAbX0TJAJUV
 ViBeD/9gWRo24vvE5d0ryfEjYZ0UdIFgccFzkJ8azz6JX3vheOQUMc1VK14IcbLaRJ/rB+tG/2c
 QzLdLMqY2TGUYAFfAU5dcWqAxn7swa4n6u/spLitDauWqIuIKeYAjupKwhzfDYtWHTkHxlcE1OZ
 DnzfoybLE+pC7HUqut8n6THb/z12fZnY85xXMxD6HzhxrJAJNYHsjp2OIB3HsvobvQyUsoIOrxo
 gEzh3tIl6yRiNcgLNGqT5iHK8DAyBzw8Pfq5GpFaNMaheax6YOF28HconTJmG2f7CNTNQfNIF1H
 yesxQIRmFGHtkvInkhH9DeYUHifRzaJUEM3pN03LQ52HC5UV+uDNfG1Hf52vmBaTKKxshqXDJYw
 megzIvlkt7l5Ex9hfZvYuFwNEBPLsHXmpVHjDS0ShcU+e9mIndvJM47IrwjSHVpI+X5gWkdpYLG
 h+w89QjIPuiuoKtgxREYnhW/Tvdg7zbk+tBrKYfXyHMSS6JxVfWwqgGYUD/N4QU4GJ9RnUXpny+
 IvNaFbvYmVOCa/xb54xF0Ibli71kj4H0dd5OhkfmsSv4trG4oL3bsefRs3x73rEgyKv+MYtd3/I
 LCcFR3ueLJsoVCWrflNRnTCv4+xPdwf3iOaGCxmhbLguR3fgIiOgQzNE8OXIVNbl8n73ty6kjYr
 RoW2tVbzcXWdltA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=SPZykuvH c=1 sm=1 tr=0 ts=6a5f598b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mTG7cVE9mWrA2Tac5S4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: xrkyXi6KPgx0Tf7YwZ-GB-rCC4P3qrKz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEyMiBTYWx0ZWRfXz3bW72tllDfG
 CWMX8f64O2Xso23u1z8M6GdhmVsTNFYQopAbZIEhEnyL7RuWYDqRr78/bByw8X1N1yukvKGkO3j
 N20PjE3Y/bMWJ1lNCYxB6EOQfjreyv8e19Wtip3CUzsFsjO1V/VBJb/tsdVAHxnhQKt+QUPDlHi
 LiX+5JyF/ziWzou54bYRzZzSkWu/64uCI2y8oE3VMyPMcBBtgXRA49gcs8WH/IE/iEIgzIisnl1
 YYUHMqV7Ao1eTrzAeuiqYSBcbnlDJ9/gUESAnkDjy/cnY3S/1W8eH1JWwuq+rUoHJLg3TWUmscp
 hYuJFjfYjCIv6RvunJ08btuWWRrV9rk6GHuTV68aV4cSFolLLlRggpch7csQZsscmwomhKx+FkV
 xXSnyejvsj6/gwUwAGHAAEyxFdSAscIoanO+5ZILPZeaiPE45I5485eDz1AUGgrGZeIiF8x4eeB
 s2mgUnoN7yKKNhCs1zQ==
X-Proofpoint-ORIG-GUID: xrkyXi6KPgx0Tf7YwZ-GB-rCC4P3qrKz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEyMiBTYWx0ZWRfXxnq5eafNKFoX
 0iMa9I3/3+dJl5guARJUoQmbr+Ljn0uBXwikr7FOQeWMkrxtmBFvCAwejjyVa5XQUoxWVBSqqel
 XtZPJC7TWLLET33Ay+2h0WjaaEM48PE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210122

It has been pointed out [1] that, since the ADSP found on Eliza is
compatible with the ones from SM8750 class, they should be documented
in the SM8550 schema.

So move the compatible from Milos schema to the SM8550 one and then add
the fallback compatible to the node in the Eliza SoC DTSI.

This will also now be in line with the SM8550 driver match data which is
tied to the Eliza ADSP compatible in the driver.

[1] https://lore.kernel.org/all/20260721-benevolent-wonderful-kakapo-ca8c2c@quoll/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      dt-bindings: remoteproc: qcom,milos-pas: Move Eliza ADSP to SM8550 schema
      arm64: dts: qcom: eliza: Add fallback compatible for ADSP remoteproc

 Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml  | 3 ---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 3 +++
 arch/arm64/boot/dts/qcom/eliza.dtsi                               | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
change-id: 20260721-dts-qcom-eliza-fix-adsp-binding-b7712a026b20

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

