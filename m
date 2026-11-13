Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572665;
	b=DgjF4DortnaPjJ3ZXMRyD/KkCGEtdEgKLhhgofInn1xUQa+n18TRS4Hkyc3YUkDkRYED
	 Qpy7mGYGiiSoHv+tdg85Ml/k14TDPmZXaNAJXfOLEYK2GdnaYkMcvPTtztdPFK3q59qqQ
	 tb42cF4j4l+3HlT7zBJJZ/obYCvNBc/IBqa8fcb/X9kRDID5X58tDxW84RX24pqmU8mGM
	 /2yq6niZBK5BKPEkBf3FFpQNajs937oIcfynz/yt1luticeP5H68uSi1muH+iw7d53wwk
	 dM5Ryz3BalfUcOL0uuMSkwPmJHzUNJdsj68y8YFAXy/mJGzLtISoJ2OXx+0OSROgQUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572665;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1I5Fpk9OxKRpuP/kBPSyuFL2Dpl8V/mFpHvK/1KMpxM=;
	b=EnSKx9Fg0E6hSba4M8wgqsWODoDt4tOKAVPOvRF3hm2o7OJDuKyY16pIp7Di+Kl4uGpI
	 gso3s+V9MOtvmVKa4ndQlypLJ7fqOqc56bR/pDKhBCCYv2V1IEUWJS4tudV6Dc5YfEKgR
	 LeVClTQANtIVhB9pJBNx+V7cUDDITYHj/sB8VbTQ3X/B/fPXgDDiz9VPE6cOO54Yf2hDM
	 Ve4qyo7wwG36KD1/LbFmcXaSscDMU2euxxwl5/I8gQc1UhvuBTuxl4+1Cq1IGPY7LmyAW
	 BfGUCRbWCj2ELY/354IXx8r77XwTAzAAHbsYIGPL5/i2Na1JAvP4iYUVWTgVm0jcS8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OauCjCfQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T68PIrv9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9320060A263D
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 12:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9320060A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OauCjCfQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T68PIrv9
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJch42139211
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 12:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1I5Fpk9OxKRpuP/kBPSyuF
	L2Dpl8V/mFpHvK/1KMpxM=; b=OauCjCfQOozEM3K2Exonmvr3kZRLjOm0YoBNZq
	hxY+6PeQPkkaSy2WiF6Zx7MR/CCoz+o7VWJcuCXinnzDncz8EgJTd3WGiALX5Ebv
	5cb4Jkp2ki59qMi19qzDCs3iidv10CLpbYIDoG6BOx6gA8ZJ8x3ri4Wh3GPi0Dxq
	bkwh4UwwJ9f8lNK6cVQMc64IUnkuaMQKBWEYnvb6nAS503foatQgt67FLDkrpV7U
	bPq+tbTruAiDhaOQKH9uHdZpyFJUK9itzowJdzZiNWPq8aZLuOvX3obi/WjLD2on
	osS82S7pFTuNrsqsx1Y6T9lWBddqOPFIFMuo+z5c6+GJaVsQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r96x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 12:24:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a08903566dso1243437b3a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 04:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794572662; x=1795177462; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1I5Fpk9OxKRpuP/kBPSyuFL2Dpl8V/mFpHvK/1KMpxM=;
        b=T68PIrv9vBcKLXW/e4IlShurs08biqGVfu8AP4+VFrVQE5dsL0bnviIqDARVu4+Rtf
         6jqyMOs3ybG4+1nJY2OGaV2Q/HI4RVHoM7+hcnM36Ome0UwVT3C/WPBz9Qzj3S/KziAx
         pOGMRehsvdlA8RnKKjBK9RDDl/sZ+PQnBeRQmtO5repbH5dUSoSBYBD9XLBR1xGowNSY
         CmwWXDuKrRkezC9PHRQheY5dLUygtXBPVPTU1YM2XI13Ovp8II2tWdmerPG6vhiQHDZK
         Xvn2L6+AhnkgdaBHF5fjb+F5hGeIqYFKVZ6Gf2yLvM93pgCObP/Jro4ab+oUAhgRyeqZ
         m38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572662; x=1795177462;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1I5Fpk9OxKRpuP/kBPSyuFL2Dpl8V/mFpHvK/1KMpxM=;
        b=Msi6mmHk0TBhWxC5m7n0M3DQk0kgYj2egRhzH+H562rTJhT48P88QLBp4q1KwugbL8
         XSSDk9nl2M2euMRU9hyAFJDSR4Ncb1odf7jzIZR6mJi4iyS7e5/EIqYkjmzbdvY+jnSb
         wxc8MjyJM3vdwdA42lJlSbBoWrnzBZ45LRHIbM1vLQIEJ6SLyXhURKWzhnj8oeJ0gdpU
         zWTieoKGqNmg8oj4LNPKvEtorup5LdL/ZEdttWQtvvkEDVLSk1ORGcVZYHdCwcdbn8pA
         hOzn2x9PagFusdoGm0G0SV5B/DPuA2+5wIkyk5LuD0R/LLQlTbybq+HzPEaBwnIxBTFv
         ivFQ==
X-Forwarded-Encrypted: i=1; AL+hErH2ZAvMnq9MCW7IlWLPt99//RQxLq/bQOm0ekwg+5Tf5rhuYTrgqRq+3M2ae2Pj7Mnw+jb0aKNgYZTAlkGiXtpB@vger.kernel.org
X-Gm-Message-State: APuU4Z82MIymIinzi0FU3RFs/XQXTs21C0mtLdOeG/J9Z24HWzXcR5Z7
	vcwhMi642psEEeNXBH1atEDEYbkFgp09S0oFjKCIA100cOmzX4D36gW/OTl4iYO8+I8KoT+Hf7T
	TcTV2+4C1+YyNPryM1qdaHLTFdfIA6fD0RDHoAbj1Btt5xIezJINKcLhL65UZB2a7l0Jfhm8e
X-Gm-Gg: AYBFou10UdhARe0I4jVhuoYSuEDH1D3dsNe6Sq1ZLCP1O0UQRmarDOrwxXAVXgod7PF
	TZb2XwcestsSgq/GlKFP+Am+CG/Tp6cwrEWJvT0dI9yJuKTDWyFZO89h01+BgJKv8Nv91uEHkxc
	sL3Pxm19WlyN2Zn2l0JNHSV6KaTj5wyUO1J1d/cmWn/LvwT0JyngB+oB+m5xnGXs48mOgAh0BOs
	l0rxXcJBg56oHRTr00/NDzhlvET/xS8GSGhom6xVxFKhMxM68su4tq4L32dgEoBVzD84L0BYjJ9
	uF+6iiKPYeq+AQVQ+YL55wX1OtY5NtPgWT+HTx+AZInSs00WhQybT22zq5rH9nDtKcfEubWVeAG
	t1+M1kaBLGLKWTCueJrbmtRWjBqCI5RVbDF3osXueCenziqsLLwj26hXlwZGrHGDUIcJzecUrRO
	qOznYn7XWHCQ==
X-Received: by 2002:a05:6a20:6f93:b0:3da:3401:c13b with SMTP id adf61e73a8af0-3f7a8dd87a3mr1537426637.7.1794572662461;
        Fri, 13 Nov 2026 04:24:22 -0800 (PST)
X-Received: by 2002:a05:6a20:6f93:b0:3da:3401:c13b with SMTP id adf61e73a8af0-3f7a8dd87a3mr1537401637.7.1794572661989;
        Fri, 13 Nov 2026 04:24:21 -0800 (PST)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1870ce8sm1098025a12.9.2026.11.13.04.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:24:21 -0800 (PST)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: [PATCH RFC 0/2] Add binding and fix SoCCP carveout for booting
 Nord devices at EL2
Date: Fri, 13 Nov 2026 17:54:11 +0530
Message-Id: <20261113-nord_embedded_el2-v1-0-48f717e97066@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAGsB92oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mj3bz8opT41Nyk1JSUVCAjx0jXwNw41cg02dzIwjJVCaivoCg1LbM
 CbGa0UpCbs1JsbS0Ac0uM2mgAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX6xu0d59X0WLD
 1Tp5rMwP3whdg5jjhVUdrrHbbuS3DokxdrKPUumjuUOCiAR7m1SFObU1fnHHIy8Y/BJsLMOQIEg
 6KMt0rmQhARKvNAKkPsk8pIN7vY8T4E4I1RUsuLFm2zXxH5sUsky8oxBoszekU0GxGsALoK7J4g
 UI2jkyOJBATiX7dyvNtdCP5tTIiz9HE0uzMJ9ndiUuW5LDEdQNwWrPTmSx/HhvX56xCtEjphMQO
 ixVnWoQnMeYH9FD3S1vujfGMjP7csYPxkNN2jDZqcFljo7lzIwMRpty8pR0J+x8YvEm8BqIubit
 222fUYT9RqtfdzQdlQLAZAXrjY2zKBl6KrIpcrjxkjfZjH3y8zwmyIWudVUl13s5xiaT0eiS8Nc
 R/pMM5JCt7XoB/higdgwLdVhKOG8TXTkm4Cj5NHAbju4rkNFqzTrgyrXedtzs5rHjkTzzVGnnRl
 kdu2ohM6S+vjKnFUmGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX11yt/xCQ/LxY
 He7gfpJdTn6vcKlf+GfGyvBpHp2KQOPT4ayMIHD2qHRKbXCh2hX8Z6IC057iIu8aVsAdwRJFqSc
 rlkcJPjvvwqZhpX1rBRAjzG4PPXMnIE=
X-Proofpoint-ORIG-GUID: UWW8fQequCvm78xmly1zkxB75euM1Wbr
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af70177 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F7kJTSH_YnVbI9ikjjQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: UWW8fQequCvm78xmly1zkxB75euM1Wbr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130048

Nord embedded based boards currently boot Linux under a hypervisor 
that manages the IOMMU streams of the remote processor firmware. 
This series fixes the SoCCP binding to allow two iommus entries and 
maps the SoCCP carveout privileged-only to avoid a stage-1 permission 
fault on first instruction fetch.

Dependencies:

[PATCH v2 0/2] Add binding and driver for Nord SoCCP

https://lore.kernel.org/all/20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com/

[PATCH v4 0/3] arm64: dts: qcom: nord: Enable SoCCP remoteproc support

https://lore.kernel.org/all/20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com/

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
Anurag Pateriya (1):
      dt-bindings: remoteproc: qcom,kaanapali-soccp-pas: Allow 2 IOMMUs for Nord

Bibek Kumar Patro (1):
      remoteproc: qcom_q6v5_pas: map SOCCP carveout privileged-only

 .../remoteproc/qcom,kaanapali-soccp-pas.yaml        | 21 ++++++++++++++++++++-
 drivers/remoteproc/qcom_q6v5_pas.c                  | 16 +++++++++++++++-
 2 files changed, 35 insertions(+), 2 deletions(-)
---
base-commit: cb70f5c1654381390efba76b2feba8be2331b83f
change-id: 20261112-nord_embedded_el2-073e25c7289e

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

