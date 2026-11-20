Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180889;
	b=jiZwCy3vnZtWZKUxbagVrqki1zTEW1mDZYm9VYRrCFHpreYIhGDR9EiB/s1nBfG/pjhB
	 exp3IZFAg5rI4xX/Ux+ZAPbojsZpOoSjeR5ubAKfRgmnBPwqaSSJHsx7Vcav/NeUFE6pQ
	 2lJpGkg2ioet7xsyl8iLY6AXSRA+kodQIA3mwn9UVq/Y0Tj622A0ExEcsfFYFwPtXoi9M
	 M0lUZNQzsG1NwNFcD39K/TXIyc54BII2266FYKYCas1HDJ4k6jq3xGmTsKN5VkM/dWLQp
	 61GmlMscV1sVkFAEUdhlKrSxLDETZ4Nv9kVenF2H14GtCj6yLpJJogWjQqRaLSb8CAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vrg7+etryRTWAuLxtBfLDW2Eg3be2tf/bw8+JoHgpTs=;
	b=mtLeBiZK3sslH4A6xKxngD5EOgig+rNpXNiiRIUWPW750eMpscmjFKp3FDOHl8NuRTSe
	 tFAPQ8BOhzHgl6eOrVg+fsOrMTvhKMTp47ioMvtiW0Sh1Bxw2CVPpdldZR2S8Anqkod7k
	 ilF/S0nh2vT5YCB5HaWM3e/utxq/vRAWLeY6UTmXEQFJuqyRDAjB23+M4Ftd6rDkQKH3x
	 rFdlnVxapocLLiD8a9/TeKpgnnXU9X09GQ+rV/DsARNDU7UzOVH0O/UScdZ60pvw2fvoF
	 +v/NvV/NUgpIIHd/8YIDAleKIs+C6VNdKOMh5QKXXfRzlanQOTGb7Da+rQJ8sfYIr1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TtJ4+czb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RKlrX18+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D424606A336
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 13:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D424606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TtJ4+czb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RKlrX18+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjokJ1462867
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 13:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vrg7+etryRTWAuLxtBfLDW
	2Eg3be2tf/bw8+JoHgpTs=; b=TtJ4+czbDjFczLGUkDuR7/B7HmxNuQO8lMsgTY
	X52BX3jltbAXLFtTGxbsFDny+yddZrZTHmGmA1XZF9arxQHPryp2MvyFOw6lopNG
	pb2sGBdti/xflgsmPgy2GwsB7w8mZOJIVoGLYRd1Tepw/evn3rbTSH+2jzB6Q/Vn
	5hjLNvQU4CcnxV29PSBIlcTCsNZg4QsTJfTS5/YU5FhHHMyf5+QorM7ubg6O3bln
	2oK1RieByqPx7ogJAHvGs2EquSvQC2e1M5XHCLXix/Hy0U36WtslV0dJ/DrBYiyO
	Ts8GvBCOoafm7XWyOAKvM/qoyYuhEbbf3jMOKLqnfwYt6ZSQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guahpa2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 13:21:28 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38355b03cb8so831557eec.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 05:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795180886; x=1795785686; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vrg7+etryRTWAuLxtBfLDW2Eg3be2tf/bw8+JoHgpTs=;
        b=RKlrX18+rNjiiWT9IdWmduLkoNlnN/t/vllb3OHVBvUw7olWOXMv7jyfHniuzGA/q/
         yRKgwG3PEi57Z74VZgD068978FWRF8K3Y9zTUiizYtDT/+8R7E8WDVIOa2hwOpMvk0nG
         PdmeyXvmVrvF39XQIvdJm4j1/J4RXlLDsWPJZsb00dlV+oeOQ1ypmM+o4vqzAJ9IVAOT
         XuG5olZbpvel/6c4/hidXZOD+tFfoOXkXYCvHRTombXfPolKKbuNEQSllaY7pmzw9vbH
         O1ou9RdDazrphrMOmbhJwpWRZqQaALxENYnIqus19mbYGsuW2jl/Co1sYL2gIfbcogfg
         YyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180886; x=1795785686;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vrg7+etryRTWAuLxtBfLDW2Eg3be2tf/bw8+JoHgpTs=;
        b=L/Jr7n3sIrCNSHjozJ4nrVvaIfqWqWVBNJQDuyzVvhTaoP2i2ecfcczOifiJJIHFPK
         kSSffk+deiJkyUpALHa9jP4kdb6Zsjfs88cG2r2kzOmVpRRF3aAeloDDQyLJnbxP1el0
         CYI2aXT7BrGUFhxCqRfS6dj3YRiv/CjxgdMfd67mGOxJTz/VM0QMb30gDEKHBjtrj1Wr
         Ak26RnOwwSkBJM7EYhay7pC8IrsAqwFXKJL16/hTIr/cXqf3TyW1OTarm1N7UlPmw3Qm
         1kb/JiuewIUBDtf6P0X/t8j66qzGXe/fZTkNNRSyThSKIi6pHZEiKIvxlQxyotOM/08V
         3s8A==
X-Forwarded-Encrypted: i=1; AL+hErEWX3dBrJbukSiu8Wedk5eWZZ3zpJnmTsLYdDxF3hSUscAWUaXOkWs/5Qp+6HUdsNK2g3Y5PvFdBL3qy7GwXgXf@vger.kernel.org
X-Gm-Message-State: APuU4Z/DliSoWtkkz8t3DJox8mlc2qpJC+d3Pr74O74oIKyWzBgPbNOl
	fhp6uQaRmhsZvzd3Fu1YVfxVebvW+8TnyNF2b3/zJJbLN4VUW3SrMXQ0+cnA+wPGJlWw+DUksuC
	/dXwG3js/6jW/yxo4G94M3ZdW8c9C/DznWVwD6Cs2O4nBeEbUGjw/XYS9TDtE/S3B+WlgFxZo
X-Gm-Gg: AYBFou388xD96Nf7dF8epGQBQl0nepleOEfhTxuouDi+3/4hDYCTM0FWOTdAIUflu2Q
	0x1+Q7F1DIVHwDn/Nn18MCh+52SYA1d9bFoxvtD3Zc4wg1eaC+JDCMfCSUbIHvLH9uQkFG2OpBx
	/UOLKTQiErG7JyCfyPfg3I3X5rzuBLRLK3n6gLLtmfdF2aM57An+aFgdCHD1sGZVUDR56jsxDSs
	V9CqmutH0lFTkJR/JKmlsam5jIjvFb02NwBt0SWU39eq9qpXZ/WX3nFzVsy19Knk/U2GY+3naQD
	AFmY+dbRbGeoeIg6MK0Up1t8s6CGuO07QiHJvhqxnudI9NjbP4VBRsE48uZL1H3BsrfdkAXXfxP
	GtTkuhBk+GHTwI7APSNN7LTbhtQXmk7nj3XGwdijQwi9qBTlImgEVslAj7r2A3zic
X-Received: by 2002:a05:7022:170c:b0:1ae:59d6:91cd with SMTP id a92af1059eb24-1b5568f522fmr2443702c88.38.1795180886348;
        Fri, 20 Nov 2026 05:21:26 -0800 (PST)
X-Received: by 2002:a05:7022:170c:b0:1ae:59d6:91cd with SMTP id a92af1059eb24-1b5568f522fmr2443662c88.38.1795180885600;
        Fri, 20 Nov 2026 05:21:25 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm6929628c88.10.2026.11.20.05.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:21:24 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v7 0/5] arm64: dts: qcom: Add EL2 overlays for Shikra and
 SM8750
Date: Fri, 20 Nov 2026 18:50:48 +0530
Message-Id: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADBJAGsC/3XOzWrDMAzA8VcpPs9F8rd32nuUHRRHWczaZou7s
 FHy7nN72BJoLoK/QD90FYXHzEU8765i5CmXPJxr+KedSD2d31jmtrZQoBxEDLL0+X0kyUclmUJ
 0UQebdBL14GPkLn/fscNr7T6XyzD+3O0Jb9uHzIQSJfimAa8aIo0vQyn7zy86puF02tchbtqkF
 oKGlaAkyA6CUg1bIuYNQf8JCGBXgq6Cw9B5bbSLNm0I5l9AMCvBVCF69oCx5abrNgS7EFCvBFu
 FQIm80S1HvyW4pRBXgqsCcERC4+or8YEwz/MvT529xvUBAAA=
X-Change-ID: 20260918-shikra-el2-ea8969385c3c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795180879; l=6584;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Gn8GKKFb8CdZcuwQevOhAFcs7R26w3NdGhQp1McDMxE=;
 b=dM/3SNWgml9wXdyMfpjZaIYwYw+5Jn97cywblwWml6pxznFZDV1ap2gXzSuQdk1LrL0GaCWHY
 X7Njj+B1nqkAi/9gA58PgKIMXzWVZ8Cu4YYQVmAcwc0h7CmEMshRFzh
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX8QMalMDioMve
 pE5gFOoDVepI2ikg52ec3M49mcaxELsAe0Eue0982f5DkubeeAK0JxfyhIL/WhOxhsyfwAQZdgC
 CuiLEMMwXc1ZdLlsLIxchiYwaPiUtorXSZ/FNl3sKAbkzDrLqweJBky9kx5Gi7j2MRfbvachixM
 N1OoyNvhH7q2b10r2xPRmVf2O5SJW8UvMxrgvh5NERM+2FZXMHaUXwx8nD8Tv2pAAWy12cRhLHA
 BhOz0yKa9L1LZ9NTBWuE75opSdhMuIrFX5A3qr687Mt1YZlpeUfO2+IVmKNUynP1XelJkZcCF1p
 STmcg+jXHec1T5uikk9TfvRilfdqRQMvhNYknsA/iT+pMH2Ho+hUvXHv3+4GW3zLdgRD+jvlNz3
 I2uirZR0I/pbX4BS7w3D00+E5qaAc4xOJFCOiDMw1bBNzsProtsCZ2PxK4vBAX2ALcA82N/oAoR
 jdQ8nkD91N5JwPmkUWw==
X-Proofpoint-ORIG-GUID: WXmDUbN4Y1jxgn9qED9YoYXM7C7gdyCN
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b004958 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7yht7nwCIrXBMJmmVpIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: WXmDUbN4Y1jxgn9qED9YoYXM7C7gdyCN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX9o6CcTExM/gD
 pQOx1EFZ/AUKpLAwPt18rlGXF2wUUbvQGdAIn0H3TGcM21X/CMOeoOwJLpBi5uca3tppZEIm7de
 za4a2KEY7hJMhXem2/KaN4OT3kg7GGg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200053

Shikra EVK variants boot Linux under the Gunyah hypervisor (EL2) by
default, with Linux running at EL1. Booting Linux directly at EL2
requires the remote processor firmware IOMMU streams to be described
in the DeviceTree used by Linux.

Add a Shikra EL2-specific DT overlay and wire it up in the Makefile to
generate -el2.dtb artifacts for the Shikra EVK variants alongside the
regular DTBs.

Add a similar EL2 overlay for SM8750 MTP, which also boots Linux under
Gunyah by default.

The series also moves the Qualcomm PAS remoteproc iommus constraint to
the SoC-specific bindings and relaxes the item limit to accommodate the
remoteproc SMMU mappings required for Shikra and SM8750 EL2 boot.

Komal Bajaj (5):
  dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
  dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints
  dt-bindings: remoteproc: qcom,sm8550-pas: Allow 6 iommus for SM8750 ADSP
  arm64: dts: qcom: shikra: Add EL2 overlay for EVK variants
  arm64: dts: qcom: sm8750: Add EL2 overlay for MTP

 .../bindings/remoteproc/qcom,adsp.yaml        |  6 ++++
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,milos-pas.yaml   |  6 ++++
 .../bindings/remoteproc/qcom,nord-pas.yaml    |  6 ++++
 .../bindings/remoteproc/qcom,pas-common.yaml  |  3 --
 .../bindings/remoteproc/qcom,qcs404-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml |  6 ++++
 .../bindings/remoteproc/qcom,sc7180-pas.yaml  |  6 ++++
 .../remoteproc/qcom,sc8280xp-pas.yaml         |  6 ++++
 .../bindings/remoteproc/qcom,sdx55-pas.yaml   |  6 ++++
 .../bindings/remoteproc/qcom,shikra-pas.yaml  | 28 ++++++++++++++++
 .../bindings/remoteproc/qcom,sm6115-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,sm6375-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 30 +++++++++++++++++
 arch/arm64/boot/dts/qcom/Makefile             | 15 +++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso      | 33 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750-el2.dtso      | 30 +++++++++++++++++
 20 files changed, 220 insertions(+), 3 deletions(-)

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v7:
- Shikra: drop the q6apmdai node from EL2 overlay (sashiko)
- Shikra, SM8750: fix the subject and commit message of the EL2 overlay (sashiko)
- Link to v6: https://lore.kernel.org/r/20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com

Changes in v6:
- Define iommus with a description in the top-level properties of every
  binding referencing qcom,pas-common.yaml instead of in conditional
  blocks, making patch 1 a no functional change move (Krzysztof, Mukesh)
- Reword the commit messages
- Shikra: allow up to three iommus entries at the top level, require
  three for LPAICP, allow one for CDSP and disallow iommus for MPSS
- Shikra: drop the per-item iommus descriptions
- Add SM8750 EL2 overlay and the corresponding binding change
- Link to v5: https://lore.kernel.org/r/20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com

Changes in v5:
- Declare iommus property once in top-level properties of qcom,sa8775p-pas.yaml instead of repeating it in every allOf branch (Krzysztof, sashiko)
- Add Glymur ADSP/CDSP compatibles to iommus conditional in qcom,sm8550-pas.yaml
- Add sc7280 ADSP/CDSP compatibles to iommus conditional in qcom,sc7180-pas.yaml
- Add a description for each iommus entry
- Shikra: list three entries for LPAICP and drop the iommus property for qcom,shikra-mpss-pas (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com

Changes in v4:
- Add a patch to move the iommus constraint from qcom,pas-common.yaml to SoC-specific PAS bindings (Mukesh)
- Add iommus constraints for all Shikra PAS compatibles instead of only relaxing the limit for LPAICP
- Add WiFi firmware iommus to Shikra EL2 overlay
- Link to v3: https://lore.kernel.org/r/20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com

Changes in v3:
- Drop qcom,pas-common reference and add per-compatible iommus limits for Shikra (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com

Changes in v2:
- Relax the Qualcomm PAS remoteproc `iommus` item limit, needed for Shikra EL2 remoteproc SMMU mappings.
- Link to v1: https://lore.kernel.org/r/20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com

---
Komal Bajaj (5):
      dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
      dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints
      dt-bindings: remoteproc: qcom,sm8550-pas: Allow 6 iommus for SM8750 ADSP
      arm64: dts: qcom: shikra: Add EL2 overlay for EVK variants
      arm64: dts: qcom: sm8750: Add EL2 overlay for MTP

 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |  6 ++++
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,milos-pas.yaml        |  6 ++++
 .../bindings/remoteproc/qcom,nord-pas.yaml         |  6 ++++
 .../bindings/remoteproc/qcom,pas-common.yaml       |  3 --
 .../bindings/remoteproc/qcom,qcs404-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |  6 ++++
 .../bindings/remoteproc/qcom,sc7180-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sc8280xp-pas.yaml     |  6 ++++
 .../bindings/remoteproc/qcom,sdx55-pas.yaml        |  6 ++++
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 28 ++++++++++++++++++
 .../bindings/remoteproc/qcom,sm6115-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm6375-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 30 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/Makefile                  | 15 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 33 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750-el2.dtso           | 30 ++++++++++++++++++++
 20 files changed, 220 insertions(+), 3 deletions(-)
---
base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
change-id: 20260918-shikra-el2-ea8969385c3c

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

