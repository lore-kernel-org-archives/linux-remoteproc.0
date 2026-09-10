Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A984A4983
	for <linux-remoteproc@vger.kernel.org>; Thu, 10 Sep 2026 15:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052826; cv=none; b=ckyZRSGHHFum8Iz1Y0TMgGHmZeRXfICpV+ezuVlEiz3EhheO5gieR0yS08T6R3MQ3i20RAnCD0g1xNiHj2ThR8a+0N8WPtT5nCNFygEMdmdAHmT0xScCSf/ocmyNNqqL+b6zdV6jVXtlXl7TzP2JH19sOr52dOSnuXRtRTL9UoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052826; c=relaxed/simple;
	bh=7s56hedfMt6xo4EtMYvPtFK+eE/DojvFLwBrjurDfgg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fw0NJIOGnGT/jvK7fgYA2r0ZP1j3xSREUjr9uONtMQiBTNvQ7dtgqN8G4DiJHWSkXg/Vx6MnjCsfQFsyP1cok9bgjVo2XcPw5EMsPMeNbbqAFmAM6zgSwuviB81geDX7iopoO/xUwKJf2GeG7mKE0k49j2wRc52y0VyxaY0Ezqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oOPVuXpz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HxjBvlM9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oOPVuXpz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HxjBvlM9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF4I1J1275107
	for <linux-remoteproc@vger.kernel.org>; Thu, 10 Sep 2026 15:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=s87bDm459gzFOj55oDZI3A7T6XGhO6ay/8B
	4TZ7cexo=; b=oOPVuXpzV1mOZi/o4eiInvoL/TLHpIiFFXLW8ANoiJHIfMn4PM0
	vNmYnphgurjB9AGFjiZ2x8tJDUxJfvZlnv4GRGK5Hqvckxh3+kZoBpLdakWPXh0v
	tOzJNHwPwrkAkkCaQih/qekHj2MGC1tCEyb+huXs4nmc2czUhqcxsWkBs+TkL0j9
	fWT5hoGwFc9+cVAouPX9YH2nnVe1mI2nsjcWSVJUTn4WnhwAuB8Z3sMzYk8haNFp
	c7KjG78e6juZR63WifRLhzQlLxMfo/6HScdDMGi1woAu46qM84kx5RTopnkpwiZI
	sFi9UfNLMsm14bbMgZkwjEmK9kGI5K/c7hQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwkw8jt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 10 Sep 2026 15:06:59 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b2d1eb484aso10844786b6e.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Sep 2026 08:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052819; x=1789657619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s87bDm459gzFOj55oDZI3A7T6XGhO6ay/8B4TZ7cexo=;
        b=HxjBvlM9Ai6IJBN9xXFB4xzt3zkQDS0QZuzsqkERL1Of25U87uZ/NjeLJioXPUpSC9
         256B30C+B9WPekiIOiPIvZNhT4oDlSaY8bmO60morGvlKq6kscJ5MGVyt+M8HTB2/PYj
         8zibqlDGZSnq7STN51t47iWBrqNr2VSi7QNjMhLaUHeGnOj2AmX+5H9dEC/ULpq2ULNf
         0qiCq81EOTCw90ug97wMkMA8E0Ucn2GkfoRM2+HFNAIZSiLitnFd4xVhiD3052Plrkqy
         mn9O8TmT5UGz6vqaF36axBGYd4eoZ+atXivbpGXGaZRF965jCRjKhD16+VdgFnMJGN2Q
         MrbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052819; x=1789657619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s87bDm459gzFOj55oDZI3A7T6XGhO6ay/8B4TZ7cexo=;
        b=HNLoXIf8ssX8jv1ZZQxNszkFcUK4in6x+K79cmLoTXktclHfjEUZA51T+RfOg4ta8E
         D9RCGwj7FgF9cbIZdT8BzVeuVEmLJ/WIgpHFJ/YEGLr25XWR/wFH/i9wipBHHsMP6mQL
         2DDKPHHN1DoEpLvCufuAEr0hCFu181FkGtcovElWe5nxT/haVDSCgFBpPhUarilzKwng
         Ofs6exhyDFQlvSxeGDgl/CwXVebAnOXQ0B5MLudCc2keaTaLXXhzUEm7dgZ0FpNW8mtb
         NqjBfMw+RPRZeMyEs46qWKd5RAHe/8siN3GYcRLQ/lfLf/KZ0VxMjDwiNw1r5xBFYqs3
         4aeA==
X-Forwarded-Encrypted: i=1; AKwUvByqwaZ6Gd3PNjPhfjoufMLJpXfjslz6j86LIpejhGvC6B5nQ1pGOZ/+lOzIebmyB3m4JD9i+U143DCwE14n4aqC@vger.kernel.org
X-Gm-Message-State: AFuF++n3aq9HNEHy7wR5ySrYh1dkrv+70lNGKRIkxpJhvZwE9uUNuQeJ
	yfInLvOLw9AIvHO10/awACYw3HwBEObcxLzmqvRZKIm+ftuxreGmtMUmm8+XW3RZ6ZYcHPz9hPr
	qN9EjbvQTNGOHuMZuYvaFLtK6HLj8IxevRViPKaMLcx9M0AOKOjeESllB3Z9hgDAONjFyPVcB
X-Gm-Gg: AYBFou3J5+4gpzqk/QLjei/p9uis/3Dpl5QAAvWb9JxHrPDNvfBeEETvusb+67jH2ex
	Eqe8u3D+kP6ZjvLgrrcpssFXuG0+HgxpXb0ZBpqK/2S9V9nPYwLcoLGiV9BpcE2c5I+mNnM1sNR
	s3+2uObjRMKbvM1X/AXFa5awBD405WxMjdTG3FeTd0KUErE2WKqGWmosjha/ZSpSp+gOKWL8Hf6
	cAoPDcuDinmFRRApPNrUA7YVfvh70VgJhhV+rtEbKXdxQwaB06hI/B+RE+opLelsUyUWlkDX4fF
	SxvaDR9hn2L+hSbBsI/KkwRWrieIGxEdBbFRNutPAwF9yCEyUMLA4cy1QHTqgcKTTgWwF69XVJ5
	tPJ3LQ5i4uoTbqXWCnbg8Wq9vssg=
X-Received: by 2002:a05:6808:138c:b0:4b9:e65b:8c38 with SMTP id 5614622812f47-4b9e65b9bb3mr22963812b6e.38.1789052818911;
        Thu, 10 Sep 2026 08:06:58 -0700 (PDT)
X-Received: by 2002:a05:6808:138c:b0:4b9:e65b:8c38 with SMTP id 5614622812f47-4b9e65b9bb3mr22963757b6e.38.1789052818390;
        Thu, 10 Sep 2026 08:06:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b97167bd69sm19340773b6e.13.2026.09.10.08.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:06:58 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 0/2] remoteproc: Hawi CDSP support with per-PD proxy performance states
Date: Thu, 10 Sep 2026 20:36:36 +0530
Message-ID: <20260910150638.3270162-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EZNd0/mC c=1 sm=1 tr=0 ts=6aa2c793 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=d7F-YeoA3MF6pYcQ2v4A:9 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MiBTYWx0ZWRfX69sL7iyA9dxj
 0A60S9Zp1kpqVNvSl814DdI9xlhhMvYGsbxcHxO/kfzH6VBtJ79cviix2tpxw4oqfnIc6rfPXba
 sgWB+covB5TCow27yK5uz/N/oTPHvvg=
X-Proofpoint-ORIG-GUID: ItbGrVNqAe_DDKil8ConWziWhlM7xbsa
X-Proofpoint-GUID: ItbGrVNqAe_DDKil8ConWziWhlM7xbsa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MiBTYWx0ZWRfX+rZOldGYHNMF
 uerr3saJjM2ARYqasxP9RGtJxBz0fXtVb/oE2ullzEDkRNuLkbIFgfX343oXn4/sXuPV0snO48H
 A/Mrk3rvKAj2a7fF5YF9/xRDczZqw0z/pC/mjfebvDDntUQ131eaWcGwaHukQqb/dTzsENhDxxM
 QBdNubAENfQSKTYoRX3VmS5ykRx9rU0+yshhfEOvtXDNXxexY1bIKoAlgE74v+YQqc28rj4hgde
 VJ1UgfxgEzOaTWvUCIx+z/lwxt1PnzPKhxLC7KpC1jAS6SjusucI/dsepNHH5KiCHjfdZ3ofRrL
 k+Dkuok1PnErX2k+4mmTa4/9k9uq35vlxhTlkensJjYx+WpGw10FzqaAE30rrCoSSZ4NXO/SlUo
 x+NR3s1RLmPdb2QuyAMFyV+JXOp2okLDySDwvuRq6brX3QpKIkNTFMv6TAS4Ht+5xsRbfAJvsRY
 CoLGWfTsbLEA9bLuVKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100182

qcom,hawi-cdsp-pas was initially grouped as a fallback to
qcom,sm8550-cdsp-pas on the assumption of hardware-level compatibility.
Bringup revealed that the NSP proxy power domain on Hawi requires a
specific RPMH performance level that the sm8550 driver data does not
provide, breaking the compatibility contract the fallback string implies.
Maili CDSP shares the same NSP power domain topology as Hawi and must
fall back to qcom,hawi-cdsp-pas rather than qcom,sm8550-cdsp-pas to
inherit the correct cx/mxc/nsp power-domain constraint.

Remove qcom,hawi-cdsp-pas from the sm8550-cdsp-pas fallback items block,
add it to the standalone compatible enum, and extend the existing
cx/mxc/nsp power-domain constraint to cover it explicitly. Move
qcom,maili-cdsp-pas from the sm8550-cdsp-pas fallback to a new
hawi-cdsp-pas fallback items block; it is covered by the hawi
cx/mxc/nsp constraint implicitly via the contains check.

---
Changes in v4:
 - Dropped 1/3 patches from the series as that seems unnecessary.
 - Added maili cdsp pas as fallback to hawi cdsp pas.
 - Added Tested-by tag.
 - Link to v3: https://lore.kernel.org/lkml/20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com/

Changes in v3:
 - Converted warn into failure in 1/3 as per review.
 - Added R-b tag.
 - Link to v2:
   https://lore.kernel.org/lkml/20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com/

Changes in v2:
  - Propagating the err dev_pm_genpd_set_performance_state() as a
    separate commit.
  - Added a binding correction for hawi as it  should be
    standalone one instead of falling back to sm8550.
  - Add num_proxy_pd_performance_states count field with a
    WARN_ON in
    probe to catch mismatch between the array size and the actual
proxy
    PD count at boot time, returning -EINVAL if they diverge.
  - [v1]
    https://lore.kernel.org/lkml/20260828181311.4038346-3-mukesh.ojha@oss.qualcomm.com/

Mukesh Ojha (2):
  dt-bindings: remoteproc: qcom,sm8550-pas: make qcom,hawi-cdsp-pas
    standalone
  remoteproc: qcom_q6v5_pas: add per-PD proxy performance states for
    Hawi CDSP

 .../bindings/remoteproc/qcom,sm8550-pas.yaml  |  8 +++-
 drivers/remoteproc/qcom_q6v5_pas.c            | 48 ++++++++++++++++++-
 2 files changed, 53 insertions(+), 3 deletions(-)

-- 
2.55.0

