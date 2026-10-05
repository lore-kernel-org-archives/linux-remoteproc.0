Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39CB47DD43
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Oct 2026 11:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198917; cv=none; b=aErt5SjzbnpXJnx7Y40Zah1pBtSRUQoHwI452FXVq/Lx6e7WieZwUabuFz6YuHK8CP6VB2xLlh7Vy9DD0gIRPk3VFtw4um0XZSZSkVTpn0zMiX24u0pqmI3XzS368GYiUhVYDUSOGHekYaP9+rVMhJ3ZC8X9jBTxsm3gEJTcmkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198917; c=relaxed/simple;
	bh=o9HmFfsKECmR8H/NLKI6REvTO0a97pfHpUwnTR1A68c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pcPZETv/xN7sFsio47nGkmdkWefVzkC4JlJ09+LzFUxmPslLMEVBdMw2FoI4QZUf1j81+jxC/9+L0+qkgWonOlwHvYXW2C/+KS5gpnB09B/2TboU7eVQSzjWYngFPkfQzNStLA7LDw0/HZJk7bSZDcyorrMDLUZqAwKx0qNeYg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0IuG+xF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZCYl35p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0IuG+xF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VZCYl35p"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695AoOFt1541645
	for <linux-remoteproc@vger.kernel.org>; Mon, 5 Oct 2026 11:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=w1NsLwgyjqSIi6Sol8iEAZ
	MZwr2gELkPoARLMdo/k6g=; b=b0IuG+xFQ3I1H2Wxbk73zRa1bdQDlBph8MSHqU
	Hob4ixLDtQ3CblioMe0xLfx1mCaeaovmVAV0S/qYTV0n0RPvrU+D52wk4z/RFQzk
	7jq6pNJTOCIOemJKtQAIOHVL6cqS0HxW5bXarYPQcuzWQ4ib8iW0TAV6JcHdY4dF
	M5Ij/HAnn+iwGsJDFS1STqcsSncezv+wow/P+fxJTwE5rtO17W7bYE/WUGUjcStx
	HBZTCgp8TQrnJ04ybaS0CoK4ijWjQJfpYJ5We/qnVdOe5BcTkV3mcVlR3jhJov3I
	K2WUYkeNJIwxtFmAanJhipwDFp9S851kA4nWMoqZrzhZUUsw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xhs1tjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 05 Oct 2026 11:15:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8884a02ee85so1790905b3a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Oct 2026 04:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791198913; x=1791803713; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w1NsLwgyjqSIi6Sol8iEAZMZwr2gELkPoARLMdo/k6g=;
        b=VZCYl35pmxvUuO1K6YQ0RxhT88O3zKwYYij5D8WMz4kUUaSbOYxdWWtceBP9LbNF8d
         5Httb6GU0oQmuDUYI7FpLCIJpVxNsFCgjJR1E3HU+vZgbeWuBiZukbCWZJ6iNM5bnZOq
         0r7jXJwEQ3qxQOAefN7sqLP3KjgK4co1L8YhjZyBRzT2zOFrMwVd+cDUC+/Bw3xr5dmS
         kHe/w7SzeZnk9cqHTOXoLbakKLSm7Qp+RGxgSUckwWSo0qp+Yfmm2Ut/nOa6kvESB347
         Hi9mlzjz4/3etUiTVy25bP9qylKh8ulxU53TQ9iwbp9G8RKN32x5e8kIrPpTmSkXahbS
         NAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198913; x=1791803713;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w1NsLwgyjqSIi6Sol8iEAZMZwr2gELkPoARLMdo/k6g=;
        b=iQsYZtdNaCHc/EtJbPgKr9CdsusZieYcqVRH/BtXNgmhyfcjpHBSEA6m0thWcrZGau
         e1iSnPN5kdZXhcJeajofXsmfP3RU5YpvBuinI5GMMYQfOf2IH52ff+Q/fXNlnSFME2Rr
         3jCu2D5UV2fI+jhU7904C+7thohjf5a7odrnuXqwfJ8MPCLuyz8MjphML/xXpCNl50V6
         6Lvyri0kb7tE8zrpPRDjwJuj5djVYZnzesd9tjk+eZaaDTbZ0NvyszPqP8wGIRZXccX2
         5vP2v1OIAW9TZ4oa1AsHPcS7M7wY0VaVipkruoBMpdswVkvPzF/8ubg4+HIAMLY/7YGk
         c6dA==
X-Forwarded-Encrypted: i=1; AKwUvBwUgbaP2zjKNLIF8sxNlamEs5mKWcUa32qHPA7R+DP7YEvXAeh93ZO21yR5sskyHHfxY9hxQ+s4xQ1FG8HFAdUR@vger.kernel.org
X-Gm-Message-State: AFuF++mElB2goRrkeYuxWGD+xASSsUqRAGWZDFL+TojYx6ByhtncKvuK
	Lks8awOWAUIPSn2NCzg+O9pCwUHAtYY13fKiDe/i35b1xYo9/hAQItN+m18TPkc/hHx7ZMcvCRU
	8j9lNBwJPz81zCuCnVZjzMJmlah1ILVOXX3cYgUahxfPH/JbyEuRgdeYH5y6y0FasW1dV1Joj
X-Gm-Gg: AYBFou359/uYD5jkSRfF1N4ydx/7STngUVll8fRafp1DIFoySE1GKJFxhh0yPRiD7mP
	9KyimrkBY7kAY7Tk1ja5la/yyiwM23bH8Kldmy6+xOeW/L6Tc73H0U6qnGFZiUa2INoJhfpcDHN
	x7oHdmjG1PmLmGYUoqeChXkoetvaF2Ut3Jd4SA+C5yPRFXuS/lh9qdckA0QWeFWg4QVgYBMJ7oe
	sm+GvGRIRUAFAO88qQZhkiuFJjegCLPwunzQn5/Pahd/2l5Ct4Yza7W0IKkQJBbbSLYPbTblp5s
	ItL7a/RX377YQFyaPFSNEJaIOAkCyFAfOXHt6EUQZFh5ohAdrz4mVReR/aiIAlXKFmD7WcxclfI
	Nv1fsk7W0LY4qyA==
X-Received: by 2002:a05:6a00:3690:b0:851:b03a:fcb with SMTP id d2e1a72fcca58-88af54f7436mr10139709b3a.14.1791198912797;
        Mon, 05 Oct 2026 04:15:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:3690:b0:851:b03a:fcb with SMTP id d2e1a72fcca58-88af54f7436mr10139667b3a.14.1791198912337;
        Mon, 05 Oct 2026 04:15:12 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c59e3afsm3249852b3a.33.2026.10.05.04.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:15:11 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: shikra: Add EL2 overlay for EVK
 variants
Date: Mon, 05 Oct 2026 16:44:44 +0530
Message-Id: <20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKSGw2oC/23MQQ6CMBCF4auQrh3STgMUV97DuGjrII1AtdVGQ
 7i7hZUmbib5J3nfzCIFR5Hti5kFSi46P+WQu4LZXk8XAnfOzZBjzVuhIPbuGjTQgEBatXUrVWW
 lZXlwC9S514YdT7l7Fx8+vDc7ifX7l0kCBPDGGN6g0VqKg4+xvD/1YP04lvmwVUv4JUj+IyBw6
 LhCNFRpTfRHWJblA8P2Xz3tAAAA
X-Change-ID: 20260918-shikra-el2-ea8969385c3c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791198906; l=2084;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=o9HmFfsKECmR8H/NLKI6REvTO0a97pfHpUwnTR1A68c=;
 b=T/us69DYwnNZNHkBsx3fsjcd8xMT8gTuKZhbye2p1W76I50YTGte5KeP8BK2Uu8giOci7OMpp
 mlY+FPwZsubALhB0tKaqtVLZK0wlnTtP0ZgsaaYUBOI1DCGHJEvCt4M
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: ZtEzBnkHVSiSCxBtG-q_oVOZFaxObNxo
X-Proofpoint-GUID: ZtEzBnkHVSiSCxBtG-q_oVOZFaxObNxo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0MyBTYWx0ZWRfX1Ucwa42dh/Q+
 kM+OMkyHW+iDvzeyaNvZIOKkhVWvYJmteCuMbSVEyFdOExwykac1XzqQ5f8w4t3pG5NdKM+AB85
 xrINZIRrQIqR4pX904GmQSjFiUInASI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0MyBTYWx0ZWRfX/XiS6eLNMPwf
 i3vRL78Tl8q+0S3ovwEj2Wj+73k5n795Bpj2mCk1VBVGJAJDHdi7vQk4aArEuJFx+RyyLfXSWfJ
 fU3RLwYd5UBP5IkZ0cuBmB3djOcLNxMmZfDVqK9LtgMVJvisw80IAvZmBVZVIgHFuNfF81umjVU
 zFw0neUfQMaynb8fGS4Cndmpn9ygPoXTC1/IyegswHZbrPM2HQVTPjTlFe9vuyYAeo2/LpBIRVd
 AnaGDZPRsDWUZGniSa2MgI9WkwtiRvDu2bCmaBs8dB0SzoLHrFaZyKPum77v1jli7ce9dKHtfFA
 Eg3JjX595vihgsb7rKplSLDAnhgNlCs+d2CtCHvGrQZMo8YE0EvMozt4LLVjZQMNm98iQ6feE4l
 hVnYXRwfeprzRHeKxGhYBXLyxAl6ji/JO0Ksb4+p8EbxO20g+Dr+TntroRxHUCf2wcXMKtCk9eD
 K7emUZf2ebPeiWpnj/A==
X-Authority-Analysis: v=2.4 cv=Q6tHcI2a c=1 sm=1 tr=0 ts=6ac386c2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c34ISMXoqBeJqo_8tdQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050043

All existing Shikra EVK board variants boot Linux under a hypervisor,
which means Linux typically runs at EL1. For EL2 boot without the
hypervisor, remote processor firmware IOMMU streams must be described in
the DeviceTree consumed by Linux.

Add a Shikra EL2-specific DT overlay and wire it up in the Makefile to
produce -el2.dtb artifacts for the Shikra EVK variants alongside the
regular dtbs.

This series also relaxes the Qualcomm PAS remoteproc `iommus` item limit,
needed for Shikra EL2 remoteproc SMMU mappings.

Komal Bajaj (2):
  dt-bindings: remoteproc: qcom,shikra-pas: Allow 3 IOMMUs for LPAICP
  arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings

 .../bindings/remoteproc/qcom,pas-common.yaml       |  3 ++-
 arch/arm64/boot/dts/qcom/Makefile                  | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 23 +++++++++++++++++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v3:
- Drop qcom,pas-common reference and add per-compatible iommus limits for Shikra (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com

Changes in v2:
- Relax the Qualcomm PAS remoteproc `iommus` item limit, needed for Shikra EL2 remoteproc SMMU mappings.
- Link to v1: https://lore.kernel.org/r/20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com

---
Komal Bajaj (2):
      dt-bindings: remoteproc: qcom,shikra-pas: Allow 3 IOMMUs for LPAICP
      arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings

 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 15 ++++++++++++--
 arch/arm64/boot/dts/qcom/Makefile                  | 11 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 23 ++++++++++++++++++++++
 3 files changed, 47 insertions(+), 2 deletions(-)
---
base-commit: f0406245cb9855e6318335a8a223551354291a46
change-id: 20260918-shikra-el2-ea8969385c3c

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

