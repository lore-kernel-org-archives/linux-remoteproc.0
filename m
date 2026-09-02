Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBE44A499A
	for <linux-remoteproc@vger.kernel.org>; Wed,  2 Sep 2026 20:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788381826; cv=none; b=PW9bcX77IkoufQkEKkwxwt3XlSjzK72QV9FM/pJ/YBCFpavzt9fxgEqB0LQDE4Gyz5Sgv+Xaq9+zyaIOne1HicLc8R2hOtcZjfOwYAj+Sc8j7xRQeMDlRwHIz8Qkklr+kj8ZMPrC3cfswr68hR3pqJGiZk5rKy8YGR9EbqjU8Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788381826; c=relaxed/simple;
	bh=SqSuCAqAoJo4m3BRAa24mfP8LToosIg7AMbpyd/Rz14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xk/OTdglb36qy/Ln+8B8QRagSz0pj86OUcW5Tx9oS08ZWN2CAdZfV1Kixa93y6B2+zFFCibo5COJ9OnEMvBLcq07bssrb/kkeZtK7JFMbRsDBwK7Xxe672udTC184xtGhlZnu9wy9DxhPOGAnrk0lQb7vEW7tUgiBPtWDPWeJdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EUkHkLXO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kl8RasA0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUkHkLXO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kl8RasA0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KH2FS1898881
	for <linux-remoteproc@vger.kernel.org>; Wed, 2 Sep 2026 20:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Kv1BbOIDcZVOW+7BugINSZ9l/isrxt1DEye
	ye6JanL8=; b=EUkHkLXOo1yk7R89qUaWd8S0PZm96m+wqEmRQ3aqsmwKlIDgsXK
	LebB/v5XnoXpN20FvDgh0gnUiwrpVw5nOCtSmGOgc/ZQnWC+S6mzkm7Gov5CpEgJ
	zvCmvUVlO+39doOYpDxsn+ftE6wDqkBOfsVJLSmodNxi9NtwFfujSvTmvR3L5QNK
	Q0Sbwo4+i/OhoGXw4ZzTLbi7AoErDAhFqObefzpwT9gGAm3Mn+5RXwEwZelD93zb
	XwWDI+GqcIiqOSXi3+/qKJPD8gOSpHZtAfRfeaCHEqJ/y5cMSrkP2qDP3N7E6aqO
	aerU7iNitZpXPOlK8dMawsZFJLdHEIU1S9Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemb01yn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2026 20:43:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6fed0652bso18271735ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2026 13:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788381823; x=1788986623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kv1BbOIDcZVOW+7BugINSZ9l/isrxt1DEyeye6JanL8=;
        b=kl8RasA0BZTTGt0A9Rqw4jOIk0yjU8ZdzfxfbRKwYFeaRk/0y4CqejqxZvA5xXOShO
         z3GhE0nJnFAN2T1mzleVpko+fVi8G9I2WDA/ADpM5qRplVSsbQHti7DcE1eYhxIB4Y1h
         82SA+LC6Fu24bmcs2CHHrEZYrh+9h59UsPfyqmQZbINXc6psCLbmbC3d9zN5trNAATCJ
         5/8khheHW9qjFpHq9vvqAxHPag7j1RVmduw0ZhB2J965HKQgFjOs5OQVyEsdRIOtzWcB
         SgHq8uuvxMkcMa0DUN5jX5TOThgcuqoKG+MMOY/qEmuNRDFCEs66eJ/LReJHBUTaPi0o
         6IYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788381823; x=1788986623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kv1BbOIDcZVOW+7BugINSZ9l/isrxt1DEyeye6JanL8=;
        b=oBJSNhvLwwldq8iWsZY6836vWwO1athMpXy3SO4yXtp09ZoVzxDaQ1FkdSESzmeMhw
         cU47M5uC4Y/1RAdvVcqAqteHk/yWm4X/63RBkJo1UFcyAldDh0Yk/Nsro3DJRs4JEEBs
         JuxeLdBoMwY8UcGNbjoCc7eO7Hygsmho0O0I5SvFODQjBN5IJeTA2ocGv/2j9qARoJSn
         BJ58z+mb8Ujx/19xgIQBg0Usr4fyfAYWbQKrhhyhUfBHlkrB1H6LSUrzfUItkX5JMoea
         yTNU95eCR0Pc0CsMohwLhtL3rM/ZxdyBMvaxyChgxaDbwxOCgNud0/78SaJ12FeLy8Uk
         wveg==
X-Forwarded-Encrypted: i=1; AKwUvBzvrf3AQfY6W3kuabyi8hZ1we/991ThaC70EkqbYePJDye8w+6lxdMW3Wx3XavEZR//czmFHQQHM42sZw09iHmW@vger.kernel.org
X-Gm-Message-State: AFuF++mYzg7GcLivWuHmktKRBTt3FD0nbCs84Hc5Zt4GVXrfabvcxwh0
	+Df5ArnDDmlJVGfEhm+Z7nfXl3pKg3573hYlg6bmwGPdRIPUFyCqGY9frurecNlW8mYKFyeM47h
	wVqUmnIPaLvW4lyoARZ6BlaiPWisvd2vraDjkGCNgurmc2MPqeivNNJvtR4gMF2ceJ1MnAd+K
X-Gm-Gg: AYBFou1CNzdMkAIFwhZLnD+xqMBF7993CTcQFW6Fn8fK2JogBiHIZchxKtXqrWXFoFz
	twxenkgCOpOeRKd6twKXsKGN/1Ey/8elVA5mjf00TOtIhvX6oQpZwE0/ZoVDyMuGHFKO+VesG8D
	vn81wltKYR0aTjc7GA8Q0XrqOB7VtDzzGTsHsDRP+WJkPzAcK/RetV8GV8WlGO5BeyRbdzrNvi5
	0BO70XUhnSVVbwAL6Rvk4YgJzk5ePhVcPgX32v9KtmpntKNrf5jOZEgnwi/KISAxxq2VrgpCyGR
	spMivQKgjCGBcl2R0snO/RPT4YNCtPb0rwGjLj2EcBwssNHaf56fq7qSgWYGfCpCpCoIxEL+252
	ahqPzPtVVCgfFiF6h1XpPL9SEQSw=
X-Received: by 2002:a17:903:8c5:b0:2da:eec1:758e with SMTP id d9443c01a7336-2daeec1830fmr94688315ad.22.1788381823167;
        Wed, 02 Sep 2026 13:43:43 -0700 (PDT)
X-Received: by 2002:a17:903:8c5:b0:2da:eec1:758e with SMTP id d9443c01a7336-2daeec1830fmr94687725ad.22.1788381822695;
        Wed, 02 Sep 2026 13:43:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255d39d21sm613338eec.16.2026.09.02.13.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:43:42 -0700 (PDT)
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
Subject: [PATCH v2 0/3] remoteproc: Hawi CDSP support with per-PD proxy performance states
Date: Thu,  3 Sep 2026 02:13:31 +0530
Message-ID: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3BBmbZqMv5CxRFBUCg6-pufd7XyKyTkJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE4MyBTYWx0ZWRfXx0fJkWI3qx4r
 RCwbZbN3H4/u4+uzRRh3/OEfrJn1RPoVwbO94KAEMNKnBKBO969ZC8TqWeyNjNUE0lZnpnSsVsW
 yHgmbu/7YiIZbw7v+UARekn/KFuSAR6BFr+ywbFFNNVIn0P6DAn/XRQeYBcThdYaNc4rt1A+H3K
 WpYGLImnWDoDU8pR9u96v5PWq6ZHV9frkVgR01yA+SjW3glcKHelJMASivJqEZvlcqYIQjl4E/r
 +lezLghKNLW4wc6S2j6tsfGS2dECRo6TPDGdv4eRHF+NOG70fR3paOAovLtqtOeYXewHiI+dM8w
 um9H2hI0V9r90eBuyNf0u6zbgoZD70lvQ7v30Gaa/oFYkhEw0Ts7kWr/xAAhsDE5tV/0kmfdOnF
 75X7uDMPZoLOeICv8dqdrZzTjyER425BTm+CRPtRp6yxDyzqlQARO3/KCPkX1xh3tMPDHGApH3n
 cNai4iBJEv2tY/WiAfw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE4MyBTYWx0ZWRfX3PaT+eIA8Vxk
 tXRssznTLBax79xdSf7qlRXZ/VtAnrzR0XGb28YoHWZfYGMGazFOGLX8PktX3dOE41yPcOK/asc
 fn82GysuMVTe9r7eNeT6FZpVbq+bcuw=
X-Authority-Analysis: v=2.4 cv=EuPiaycA c=1 sm=1 tr=0 ts=6a988a80 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=BoqisLAphY285m0AAnYA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 3BBmbZqMv5CxRFBUCg6-pufd7XyKyTkJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020183

qcom,hawi-cdsp-pas was initially grouped as a fallback to
qcom,sm8550-cdsp-pas on the hardware-level compatibility. Bringup revealed
that the NSP proxy power domain on Hawi requires a specific RPMH
performance level below what sm8550 already supports, breaking the
compatibility contract the fallback string implies.  Remove
qcom,hawi-cdsp-pas from the sm8550-cdsp-pas fallback items block, add it to
the standalone compatible enum, and extend the existing cx/mxc/nsp
power-domain constraint to cover it explicitly.

The fix is two-part: first, propagate the dev_pm_genpd_set_performance_state()
return value so the failure becomes visible instead of silently proceeding
with firmware load.  Second, introduce a per-PD performance state table
in qcom_pas_data so platforms can declare explicit RPMH levels for each
proxy domain.  Platforms that omit the table retain the existing INT_MAX
behaviour.  Hawi CDSP declares CX/MXC at TURBO and NSP at NOM, matching
the hardware requirement.

The binding and DTS are updated in tandem: qcom,hawi-cdsp-pas is made a
standalone compatible (dropped from the sm8550-cdsp-pas fallback group)
because the proxy PD behaviour diverges from sm8550, breaking the
compatibility contract the fallback string implies.

---
Changes in v2:
  - Propagating the err dev_pm_genpd_set_performance_state() as a
    separate commit.
  - Added a binding correction for hawi as it  should be
    standalone one instead of falling back to sm8550.
  - Add num_proxy_pd_performance_states count field with a WARN_ON in
    probe to catch mismatch between the array size and the actual proxy
    PD count at boot time, returning -EINVAL if they diverge.
  - [v1] https://lore.kernel.org/lkml/20260828181311.4038346-3-mukesh.ojha@oss.qualcomm.com/

Mukesh Ojha (3):
  remoteproc: qcom_q6v5_pas: propagate
    dev_pm_genpd_set_performance_state() errors
  dt-bindings: remoteproc: qcom,sm8550-pas: make qcom,hawi-cdsp-pas
    standalone
  remoteproc: qcom_q6v5_pas: add per-PD proxy performance states for
    Hawi CDSP

 .../bindings/remoteproc/qcom,sm8550-pas.yaml  |  3 +-
 drivers/remoteproc/qcom_q6v5_pas.c            | 52 ++++++++++++++++++-
 2 files changed, 53 insertions(+), 2 deletions(-)

-- 
2.55.0

