Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794A1224220
	for <linux-remoteproc@vger.kernel.org>; Sun, 30 Nov 2025 12:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764506180; cv=none; b=a1Cs3s5LGJjE1yBJkICwZDdAHlm0xZKyCTLPHvoYCWpmH/47fQY3woj/BIj7euUIi6eaIv/gL9CS732yXNiF8HGiHzTRT7Gs/xJfsnRk5Q+RxjD3E4qNOVXFwP4WpkKlgaXm2kZ2PjhyyqVAd6dkg1sZIWIzTXt24QNFcx8IQPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764506180; c=relaxed/simple;
	bh=O8qqd34rZzKAlT8emxlMGg0aXIBHepVV/wOrOHz5bV8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pyLOrW/Fu0LcZYjUxq/+WHmKCXYFIPoKFMQGKz3qnOE8Hhwq9s1pE8YKYizsjlEtzOP/Q2eURikZE/6afyA+FKHVa2HsSMfKQXQIcgfLnkkP4I7PcTW0j2zoLks94sBi/vkbZSJwvM/pZXWaAML4+vUMeALFn2zo0sg47kbJUYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RMw0BOPG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ivlUVbcv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RMw0BOPG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ivlUVbcv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AU8h4ED1049931
	for <linux-remoteproc@vger.kernel.org>; Sun, 30 Nov 2025 12:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=khDYn2iDAtsrUOzEA+11Sj
	iFVdLA2q+h0420fjCDJjM=; b=RMw0BOPGhi5SF8Hgv5nYITpLNbk8W9uMtjCXhU
	eOaPuU7Uvp8FvkUrEDiAdVuD8KS/xh+XUMjJZ534i/4I/BTMoQD08QxmbDZn+6KH
	1hDdfm6vWMooTzha4Zn80izXs6+5+57I4WfLkHR5MgBqZu0CqihECgS4CX4bQ+Cw
	aa1IJXl8+H8h3TRtqycKTk14TG1ZRYiviYdyvlH+83ZwyVcAYh4hFNZhiQal+kpc
	hbOV+aKN5uCRnea7BZT3B5930I7gu8A04QyURPiqmrfnyVNZtqCILL+ivjgh1qlY
	IBzBWiS3a1p/f1lSUbQdGbYtF+OosVq4+hEZB0GP6n7TnISw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqskf2410-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 30 Nov 2025 12:36:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2e235d4d2so61960685a.3
        for <linux-remoteproc@vger.kernel.org>; Sun, 30 Nov 2025 04:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764506177; x=1765110977; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=khDYn2iDAtsrUOzEA+11SjiFVdLA2q+h0420fjCDJjM=;
        b=ivlUVbcv4P68C0OViBrV2wdLorsjzj+copjWRG+g55CZd8k5HMZMlSqoGORUlDy8aR
         JmYtfdkJASCyT9jBbD+h33Ikx5QwZBTMkzEACc/k+GdIPT53bpmrG7KV9WR3/VUTWNsa
         1PEgBFT/fMnzeDxLNPFT1UtbVRtxMbIIhhYXgr6yNZgFzqf8gp77vwh5CTDwg4nkQ87R
         o5w9BkDRo6MYW2SABc8Mtrtgc8QS3xQAC6gt8F88Zp2KhxwDwo0GquvOF7+1w+Lr+OwC
         NOuDUR2NfQfUPKEq5BX6YxybQ1foNiLr9nbi7+VyHyZhyZ6Fu4yQVqL8g6aBAL7x25ru
         yHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764506177; x=1765110977;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khDYn2iDAtsrUOzEA+11SjiFVdLA2q+h0420fjCDJjM=;
        b=GDfEkCQ0BNwCRaqZMPMwuvv4cGQqtAT0pYvaWX4fjgfp/m6Mad9HEOSU4zP0qO7k67
         /ItC3LwdvXCU4cdz+xijUknis2Jc5ypP22uGhryDEwbIqA9zfnonAzXxKxiezsOf8IFD
         WHbHdzUycFCn9nwz4yE/xd9W9+juFghyAc/VaYp8iWQ5mNPWmWDGf4ur6en8ODHWo8ah
         gC7s9W3fiBLNyu9/073zqiWjI2mYm8H2XNbEMAFesjzAPpSkPuLLTxLsQL3/1R+dyR+p
         0vRDNWPel8qOYv7Yq1CLlhiJEWkwFQwHu0hBnfWMjkpzDxEvbnwDRv/SxIXyM6MpTHmK
         9sgg==
X-Gm-Message-State: AOJu0YzC8tN2e7LHr+F/XT8snemlMpkc38OUhWiWhTMtuGwB6rUCBxdi
	Js8tuYu32Z2RTmF32TPIRD6tReZyP4d9UVaHGgvTTsFMmfdf1cO9RhbCgd3pHw32DkKN3RQIy76
	PbaqpnnahniPB6DdKwZV9nooakqB4utsEtEPZSvUkC1GLbYYX7OPeVTyiL5FwjM0YSxO7pemo
X-Gm-Gg: ASbGnctQeD4TW1N3ooYZ4j60o6G2AI0yRyGOhVqGThLZjo1BPBfxGcTJU1Qlca3C0SS
	ha8AD7U/NrefqtuaI9385v9KYOWrA6buVxUIdwzFSF20mMzvs9Huojh7Pkr3v0YCqZZB/vXNx3m
	5FcO/0ziJUsDcVkYurS02hVF6Pwfe0OlbsNCsQX/W5e3HwJijF7TNE5hPkSJypn0oGp4aRyNbW+
	i0h99eCY5kV6DEkwQExhfxdeseKP1a9pJOb5K9JZP3kutQ9P8ECqqUEemi84fX6bIQks42cey5S
	7Waz4Io82UcMQsXZirGUPtLe53VCbptjbHtHXdmYxv1Iu6uTnTSwOkeZsz9qUHzY29WRjDKItJt
	G6MXQamLLzUJ4z0Qt6EZ7WPl5XehaCwvbJw==
X-Received: by 2002:a05:620a:4411:b0:8b2:6251:64f9 with SMTP id af79cd13be357-8b33d4a74f3mr4231817785a.58.1764506176672;
        Sun, 30 Nov 2025 04:36:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeWK0WiHjAtwF/qYOyew/roqAG0tsI6NrdqTKzALGVqVXop4gZMar8qFcPH6xWCPkSaoNwMg==
X-Received: by 2002:a05:620a:4411:b0:8b2:6251:64f9 with SMTP id af79cd13be357-8b33d4a74f3mr4231814785a.58.1764506176170;
        Sun, 30 Nov 2025 04:36:16 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c6c12sm920506666b.29.2025.11.30.04.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 04:36:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/4] ASoC / rpmsg / remoteproc / soc: qcom: Constify buffer
 passed to send functions
Date: Sun, 30 Nov 2025 13:36:07 +0100
Message-Id: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADc6LGkC/x3MMQqAMAxA0atIZgNNRRGvIg7VpprBKo2IIL27x
 fEN/7+gnIQVhuqFxLeoHLGA6gqWzcWVUXwxWGNbosZgOnddUTl6XI6oFzq21DkKs+8DlOxMHOT
 5l+OU8wcxCDy5YgAAAA==
X-Change-ID: 20251130-rpmsg-send-const-ae216a1fbd8f
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2077;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=O8qqd34rZzKAlT8emxlMGg0aXIBHepVV/wOrOHz5bV8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpLDo6DD/JawmdtkgkOBaTkDXZexZA72yvwkmRX
 2xb902gWAqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSw6OgAKCRDBN2bmhouD
 16BfD/oDmj4P63MBv+3h6ohF7ryGULYXhCUqF9p+69+7wePAdkGFR0SJ+SLk6Vy15z2rlQeSYXS
 Fq0PWTPhtAA3F1Ltma1AbOQtUE9D9Ovkh1yhinbcXfEmEo5kRDloS0j9684M6ig49Sd8AcrU/8B
 082KRFV04slBSkbB0LADnS0NIVUtOTXI1enIqRB/fb1b/XClxr9xdMFY89a9vLJbp01nB9eZuaO
 eIRfeXxCK6HAHForIN0cpb8NvBA+D7ygWojSeB3S0I+FLMujOQ71pZjD9p9cIxZVsTBsGq4SB5o
 28sOHp4Z9VhM9ocdhOfEfje2u4h8Y3xRN7AQEBMTzdbXwCtthtVc0YE35DHNNPP1gWWl6Rkp8MJ
 8SlHUxvsxP5Img8IkUhJMbbkjtJye/7IHhPhsMRaZ5ANNJvp6jtcCelghY/Lyaip5VzXutDKsoD
 srWqfPLvBae3f1g0ArGiIsAx87MkgflTDPvSQ0HxR5Pt+HNtrV0dBpEX+5Yn/tafiqWMANaoeB0
 I5pPYvOdRsjAm/a0B2w0erknqUgmJHl6V3PETd8TiLyHb8LORu5YNLjcfF0q7cm1RcnzmOIVllq
 cEMypHzNVe5FEFQqxGUVv/RJ4FuNFpaYmBCwwH+1SehdWQZZwn4woBF+Yz7b2SjkCHpUmJ7BGaS
 pz9b+fLWw9Cti1Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=X7Nf6WTe c=1 sm=1 tr=0 ts=692c3a42 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=a5V6tGfecjnVh1JciPEA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: KRzDk0NlqAyDmy4MzKH3841uSh3oTrI5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDEwOCBTYWx0ZWRfX90O3P0EsYaE5
 Xgvz9F40rKltAus7cVw20HTVaCBW8C+B/DMQjvYuvUKS9Hbet0Ol1Q5bwHMbltNVGXh92gZGfuG
 3Ul4x8EdKTYUYeKGGfh3HPezyN/lNFACLITh9ffz/QNcIqDdW+YgAhH+SjdIArkE75fpgXkOv9t
 HaMYv/S1V48qZTBZSR3nPlYnQXPguldWXQ100DXuP8STmFqF7WXMMqTcAHcI7wXg6kjHCNqTs9n
 KGW38YFOinh04KPq0RgMUuxf1wm0DQ/4o2DZNG5vKe6rj8kd2v9aUKdGQWLBfYKeA/wCA/qXad3
 cWjEcr4aC3q7dAELNFmMU87/IKwq0ga3f2kF/YJkIJxxcpy1aGcQNdS9KcQ9M4oFlsO+nMFfMKy
 VAsIomHuxA2B2CS9AEZTwgzuXmfMdQ==
X-Proofpoint-ORIG-GUID: KRzDk0NlqAyDmy4MzKH3841uSh3oTrI5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511300108

Dependencies / merging
======================
Entire patchset is one logical chain, all further patches depend on
previous ones, thus everything should be taken via same tree or shared
between trees with tags.  Probably everything should go via ASoC with
necessary acks.

Also, first patch or two patches could be taken now for this merge
window...

Description
===========
The remoteproc and rpmsg send-like functions should not modify data
being sent, so buffer should be marked as pointer to const.  This is not
only self-documenting code but actually increases the actual safety and
clearly documents who is the owner of passed buffer.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      remoteproc: mtp_scp_ipi: Constify buffer passed to scp_ipi_send()
      remoteproc: mtp_scp: Constify buffer passed to scp_send_ipi()
      rpmsg: Constify buffer passed to send API
      ASoC: qcom:: Constify GPR packet being send over GPR interface

 drivers/remoteproc/mtk_scp.c       |  2 +-
 drivers/remoteproc/mtk_scp_ipi.c   |  2 +-
 drivers/rpmsg/mtk_rpmsg.c          |  4 ++--
 drivers/rpmsg/qcom_glink_native.c  | 13 ++++++++-----
 drivers/rpmsg/qcom_smd.c           | 10 ++++++----
 drivers/rpmsg/rpmsg_core.c         |  8 ++++----
 drivers/rpmsg/rpmsg_internal.h     |  8 ++++----
 drivers/rpmsg/virtio_rpmsg_bus.c   | 24 +++++++++++++-----------
 drivers/soc/qcom/apr.c             |  8 ++++----
 include/linux/remoteproc/mtk_scp.h |  2 +-
 include/linux/rpmsg.h              | 17 +++++++++--------
 include/linux/rpmsg/mtk_rpmsg.h    |  2 +-
 include/linux/soc/qcom/apr.h       |  4 ++--
 sound/soc/qcom/qdsp6/audioreach.c  |  6 +++---
 sound/soc/qcom/qdsp6/audioreach.h  |  4 ++--
 sound/soc/qcom/qdsp6/q6apm.c       |  3 ++-
 sound/soc/qcom/qdsp6/q6apm.h       |  2 +-
 17 files changed, 64 insertions(+), 55 deletions(-)
---
base-commit: 7a9e871ce4c7c8a7d75eaef8407083a0525de2dd
change-id: 20251130-rpmsg-send-const-ae216a1fbd8f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

