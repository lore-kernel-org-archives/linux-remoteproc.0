Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72D347140C
	for <linux-remoteproc@vger.kernel.org>; Fri,  9 Oct 2026 07:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531347; cv=none; b=hGP7unzRAkjyx+xIsEYKm953F0km7kE9470ndUH6BiGH3U7HcNG/6cSpi0OTdExwwk0SGfrpQwc5ai3XyjoA4ZYb493QFHdlDMxGwPKdQmSDsvcOoByGhzVsTwoZ9pR1W9xQ+xLAQoOumkzyMgC6ufR6ihrYzlAn52/NeLoHu8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531347; c=relaxed/simple;
	bh=A8Q0G9RYTiBHUt9HkBBuffrTETErXzLM1/xZEC/1Hac=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Txjd9g25LDZ5cnVEX4iRgm+EmJwf0nG4K1m45JY3AhMUa12aaRJDs8Ek4+/BeZNEVyGvrOWujavmPYnGIZQFwGxv12M4PGMerXLFZo5QaG5Ryn80RC/BggHKl+LoY4HB08jo+R+s7hFT6aTi3EtDRwSB27bODiN1Kry2uT3BFAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhbeYWBH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bY4CyXSl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhbeYWBH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bY4CyXSl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HL3M4178487
	for <linux-remoteproc@vger.kernel.org>; Fri, 9 Oct 2026 07:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PRGTcjOJL8YJLa7aIAW0+Z
	7YGILGnThcUoLje4G0jxQ=; b=WhbeYWBHMQHa1tVqyE7f5on24w88W/FIAcCnRA
	X6EUffna+XwZrcb13aOPCHRtnWFmgdNnc+y/Jyvv+AKq3531lgWjl5W1QlmV/XF/
	BoiJmNpszEqZualoeFYJnfzc1sXPPdwdDT9W/KZisP0YkgdDAPm0ExsjKTf4HfSJ
	9fcssUKC8SD5GZfEiRevNkJBX0cdK2InKiSlt83hVEPEeLbjOyM59glJYUg0cXDr
	jbWo0lxuXhZWOlC681xV76I6jSkl1SF1Kc5JRcU6w2I3C7hOZeWfYqsvnrmVInQ/
	N8uvW12mD9s6tkbu3EgkuHXRIrE25CUOXbpU6wh/h9UUYgBg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxrtgp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 09 Oct 2026 07:35:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35156644c96so3190532eec.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Oct 2026 00:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791531345; x=1792136145; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PRGTcjOJL8YJLa7aIAW0+Z7YGILGnThcUoLje4G0jxQ=;
        b=bY4CyXSlfvNjoKDC6Jpi97flTB/nV6TcVY//oYtMeEZCasRZYXiy19dfkz9GSXZycq
         iw2KP0iYGmcMpDGpb5X6fyX2TsuQezC4DktMqhxF/goVH6id8p02lrspbSkAGqf54JQU
         pWxoa4ugxJP1ITeuMh3/Z5rLyfeO99mNz82VwqdRG3d0NUnvwiS8jRYJHQid5xrtv5BP
         8tduIzaXVUtLldm8kQdT6wEnMgZ9B/ijfc43ppyd9W83dm66nwwdxuBUuVbplEHKVBCm
         rR9H0DshInMtu+pWMkVh/00lPm0nBWGxtnAtSX9izn1od5jOBJBvebAr743/02SGG1dE
         W4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531345; x=1792136145;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PRGTcjOJL8YJLa7aIAW0+Z7YGILGnThcUoLje4G0jxQ=;
        b=eymthBJMKBwcHf8lRsqo8/pJlOmYqWYOp9P3B8D5EGAVLEqP2HM2inkU17UAKV8s+a
         nZAyLH4gh/AyiTFyxyvRJmkR4NTDrIUy3mQugSInWSdp3iO+mcv1EU6xGN7nwOxPskag
         rE3ur1cGxAeVgMTaTdA6DT57+m9Augz0hOpn0tWYkzlQ1V5VWUa2FTV9CBJZwiT0FLkO
         RTpSsxiG9793xRbQLdnRuTFV16/tOP8ZNRTqOPNOZ+4GaOFSP/I4VVhxpLJCk5JpeidP
         euKz5BZkFaUe0iTGsWPGSF0PYnbEH1TiRbwJTh0xd5sCFHT4Zqn3Up9HNnzdw8Q6ddq3
         rtKw==
X-Forwarded-Encrypted: i=1; AKwUvByDSWZUalUa5vPS2OPagkQJtYcouOrf2wDZkzQeS1sA+JyM+V94F5Bv5p18bEEjxAfOF/2euORWWGwykWDcTemj@vger.kernel.org
X-Gm-Message-State: AFq9FYJKbPp5DEACEBc1svuZ9jgyMh3FVMWbD0VhoxAdYfWoNcKLVaDZ
	Nms56VpB7RBcNzxS6V0dOklkEG1OpyH96IU2IQCXfIv/1JoermsWQV5p+iMh6+Sfg6flyd1Nk0E
	Oih/z5JQFXRc7u9+l0sw7arlZpyqapTODcm87tZ+vUfrPaSvmfHNsE+3Vvbt7VMDPkhilXHe2
X-Gm-Gg: AYBFou0gU0ocArYm/vl81VPQh1Xq9ZpcZrcPM/WrOkfCC8oU52veI3cypH6FR25kuBn
	nLElWFJdKvAemJp+GdSzXiOVktX35jVtSDuNHp9bvNWBMeVzqV1NftUdjzmXHFRDd9rZScJGYZ1
	FimgGkNDXe4fJKC3JMPMhgo88edUHbWiuCQcreRWfD4NWwzPUO7Lfd5kZqDh4N1zHVJYoMARrbJ
	GfeKkvXcdnIZP6gwPgUIgZkbiwkN6YgBroPsuuwR+6ZM27TmKdHxrGajI94fJTHBC3I6/BqKUqm
	2oriEIsrKh62PsIIX/HYT/zhxviTIvXZjplv6cNm65MrapjHPtf/3vHcJFTPfetbXP7kiugrpEN
	GP0hrWOiu0MlGQniXnJpsTi2E1FW3Pvgkt2Qy
X-Received: by 2002:a05:7301:488e:b0:351:7ec4:8e41 with SMTP id 5a478bee46e88-3537e011139mr1776475eec.10.1791531345161;
        Fri, 09 Oct 2026 00:35:45 -0700 (PDT)
X-Received: by 2002:a05:7301:488e:b0:351:7ec4:8e41 with SMTP id 5a478bee46e88-3537e011139mr1776435eec.10.1791531344419;
        Fri, 09 Oct 2026 00:35:44 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca7133asm5658974eec.14.2026.10.09.00.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:35:44 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: [PATCH 0/2] Add binding and driver for Nord SoCCP
Date: Fri, 09 Oct 2026 13:05:38 +0530
Message-Id: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEqZyGoC/x3MMQqAMAxA0atIZgttFVGvIiKxiZqlSioiiHe3O
 L7h/wcSq3CCvnhA+ZIke8xwZQFhw7iyEcoGb33jrG1N2kM4JlK5WCc6Z4kkcTVIrnKItceuhhw
 fyovc/3gY3/cDjZ/QhmgAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=E+1YNqdl c=1 sm=1 tr=0 ts=6ac89952 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=UK07lOcsehyZGIaRmRAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: SFpeq4uETqk5ERW4SH7Ku3jFgUs9wtcr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMCBTYWx0ZWRfX7W3KeayuESrL
 BqQGic1Vy81l7S+SoAa+KbKy9o0dZLlN7cJj0ZtC8M8kY6BFafwxrStNJrwEgcdNFarL8WD9Lbz
 RyR/Y8gbL/39Bib5w6VPkr0fOHNG6y/Zb0uanhLS8TWDu/Z1LpNW0YgQXSh+EeivYSq6vS60/8k
 zfWN80+Gc/eLJOgbhTmw6I2x65KR/OUbbqoW8+/BWBFAgKTskTwUZmI2let3VSjXUuzOBm7fD8L
 TvAJ1eHa/o0DvJx/IbHSmyGqadOILTtV/4Z4YrbVfsRdi+UJqrjyaX0OxACYuWfwb1K5DP8o7G3
 nEZbrFb/oAt4XPS2WWLgwpmj2OEo+G/1SnvmPW+Lyr+FzZi/LKxTa/KY2mIUdZUSJBHaV6Lb35F
 npKEGMpzbFNfzuZJGdt5rBWIIsIK5+qI27O7LD4FHbryvMn2VAEnLRMBAWhRrNmcaT1pudFjx1J
 Th2ImcM/khsVXsZcPWg==
X-Proofpoint-ORIG-GUID: SFpeq4uETqk5ERW4SH7Ku3jFgUs9wtcr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMCBTYWx0ZWRfX59OElYCgwThr
 YMAVBW29PpABIJjyiSek2R7z/aUCtN/8CGgcDGiyycmkFuziLCM1x3vOeAL4/eGRF/oqZLnuOm/
 1KkYKPiXsQh+bZJjfTTXCYxkiLHE3I0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090030

This series adds System on Chip Control Processor (SOCCP) remoteproc
support for the Nord platform. SOCCP is a dedicated control processor
that handles hardware fencing for display and other use cases on
Nord-based devices, sharing interrupts, SMP2P states, power domains,
and clock with Kaanapali SoCCP. However, its firmware ships without
a separate SoCCP devicetree image. It therefore takes a single
firmware-name and memory-region, and cannot use the Kaanapali 
compatible as fallback.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
Anurag Pateriya (2):
      dt-bindings: remoteproc: qcom,kaanapali-soccp-pas: Add Nord SoCCP
      remoteproc: qcom_q6v5_pas: Add remoteproc support for SOCCP on Nord

 .../remoteproc/qcom,kaanapali-soccp-pas.yaml         | 20 ++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                   | 15 +++++++++++++++
 2 files changed, 35 insertions(+)
---
base-commit: 0312234a60912d65819167631115e39c7e8f9621
change-id: 20261008-soccp_driver_dtbinding-ad131aa42a94

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

