Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D39D22540B
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Jun 2025 02:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749610721; cv=none; b=L+p0XPU7N2ywsoKrBlsbkHXsoczgrT9/Yj54FYd0npOVC5Vo1fr0tZCbw7RcFRyT8sD5F1xV3kye848gulShu8xiulH3b/YHPFiCQHzjpfDtFpVT9fPMahFLjIFiMr9OkXLWpJrlDEBG/q34Qk6EIHPfOJkCqRHVCbW/F02HvQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749610721; c=relaxed/simple;
	bh=CAZ/SIZXGULw26SKxotaF4nRCv62GltcOelZ3heoC6w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=It5fEPkJ9pm3OBPwUik7s5jeFRIA3++o+y7weAucka68L49uT27vl2dYS9xBjDp4r/7v3mLtj/eNnveXr/FUFDRJH0GhNzJF2Tp8heL9kTyfSW0dLgrI4aA6neFcJUvuGDzfa/redJg7rjEuO6+JwkzudsnxPmRiXmHXIOvCwsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bXx9v6tP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bXx9v6tP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPrgV030910
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Jun 2025 02:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PnvbGOLWjgVd2ibog5YycE
	QyE3LZR9r4haxSXY7ibqM=; b=bXx9v6tPlZxdLY9glWmE7kcis92aVz7dD86rBe
	zsKEKr2hKonY3rV/EuSsOlpip7gBmy5fLX2XKpE+Fd/twECK/7+7ZlHy1n9hWrAm
	euxruVB2zGhaq2DQmChIlzkRFwAcWe5Pa7bFGt5jotlamHb8XvxSKXRQ5YctWNgp
	TyeEraKAK9xHNsgo1vlVDRb6WljKw5Su4ZgoG2HbrRurH03keKZSFW9P7r+V0lNg
	1mGkKUXsBmW6TMG54ASe1q/5r/8IxqIlCdGbHD1AobtEjMyLlPvuRx/OJs8fVfLY
	umUDKGWp739oduQv4MM9rp8L873EfFiqlkk4oPBBabk9iSbQ==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2te473-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Jun 2025 02:58:38 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6049acdc5c5so4774804eaf.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Jun 2025 19:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749610718; x=1750215518;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnvbGOLWjgVd2ibog5YycEQyE3LZR9r4haxSXY7ibqM=;
        b=g+2I0CuVPgZVkORWx9yg7Ic3hn42Qbtep2Da3iS5RiCPDx0DVW/X50SnzAsqibqDdo
         jcljCVbynQcbPXW8ZcPae/4hkvhHARGb2kN9wKvt1KJ98l9qJx3QHSYRQg4seU3YFPIF
         3mXg9HtLqy5vD4zrO0C+uLcd5rgKxMJ3xcqvupPBSs5OuIEZnjaeIxwgHr5gote/b66q
         9pm8TE17KSvWOzfeVzincpU8njo9/Kmo0JdTK6ydoPzCeWLRcUJ/SR7tXKsiB5kQu/zy
         7GJ3A+kyitMCviwfUEVsblbdcDTLL9DDMWxu7/Cig+4fJ4t7JwyqeqdMfVxfwxWH62UK
         SIpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkb1UK/C5Llh4bc7S2lgbucOU8jT2DmERwRsAWhB1QheCpChpSZ6U7ry5cDW5ZPCcTiPwP03ULUuymWDxIeuSl@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc3Qu4uWuMlxEhIvGkWq3M5MQde+Q+IpJ55G/9QEKPbO6BcGrg
	gV9GqoYsAEKnRf/zAx0mGON7ZvWNa5K7VhcaiNLsXPyyLM8lRk9mcf2k3BixXGAfPM1iJe+0TPc
	PyOpPw3dsM+u1Pbnl+qnvnNnG431HQMCXnoWLSPrDOvDRtzMKS52GN/KhmDl1rPorQV3kA5dX
X-Gm-Gg: ASbGncsVFJxq6fMYnQaG4hbZe0byyilYumcIZiSiAMVuA8mq6xwrBAipaiIW42p5Ugy
	GGIiVx20Y4MfDOkLeyFmFOcflOx29ppLwIV8wnQzYErl6oIZ0ncrv3yjOCM6+iQf90ey3G6V2ey
	Fcjs9D2zX/QkiDcDAo3Yy7GuQ6HcN0pvNV/AvyCHD3sz3rCcgUs8oLrAZOEc6UzUlKbtcGwbWvb
	0LuGXvLubDQw8O1v0g1Iq+HbxT4Owr3NZ8R+XyNjcmVPVsbD2GVL0MabFQISeeR8qtEVbRXS6JG
	ka+Ekb9kTkOx6KrslOyHgw+VMMLzlJy6IltuTo/4zsKvncfpskjokK2fri5UoJlh0N3+eDEM9RD
	IYXz6SdguNgt39lh9TNDGNg==
X-Received: by 2002:a05:6870:d38d:b0:2e9:a15f:6c3b with SMTP id 586e51a60fabf-2ea96c4f2cfmr1052587fac.10.1749610718046;
        Tue, 10 Jun 2025 19:58:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOYMDwQ9+qWoO9sZAHQjuHpCm3eIJ+fGXAaOH2eDXzRmpmRSfdlsETZJ1wyfXaLwgJC/19HQ==
X-Received: by 2002:a05:6870:d38d:b0:2e9:a15f:6c3b with SMTP id 586e51a60fabf-2ea96c4f2cfmr1052580fac.10.1749610717755;
        Tue, 10 Jun 2025 19:58:37 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ea85fa2cbasm478059fac.8.2025.06.10.19.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 19:58:37 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v2 0/3] soc: qcom: mdt_loader: Validation and cleanup fixes
Date: Tue, 10 Jun 2025 21:58:27 -0500
Message-Id: <20250610-mdt-loader-validation-and-fixes-v2-0-f7073e9ab899@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANPwSGgC/4WNQQ6CMBBFr0K6dkgZKYgr72FYjHQqTYBii42Gc
 HcriWs3k7z/89+sIrC3HMQ5W4XnaIN1UwI8ZKLrabozWJ1YoEQlK1nCqBcYHGn2EGmwmpa0AJo
 0GPviAKo7YlUbdSsaI5Jl9rwXSXJtE/c2LM6/94ex+KY/t/rrjgVIwIYRuaYTmvLiQsgfTxo6N
 455OqLdtu0DDAXoCtUAAAA=
X-Change-ID: 20250604-mdt-loader-validation-and-fixes-5c3267f5b19f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=684;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=CAZ/SIZXGULw26SKxotaF4nRCv62GltcOelZ3heoC6w=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBoSPDceVmktbeGo5Ss9Evwmm1BekycHe1ROSgLC
 GrysKoq1f2JAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaEjw3BUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcX3KhAA2hs1VdO/LFQzQLgsU3BG2hssf1iW48bhD0XhM74
 IU6pit9HUYEyrJhBT03PnZ3rxy7BomH9Y06pQ9s47EyHojwnho5oRRD6MjH3sse/Jp7ZL75ibFA
 lnOot35mzN+uQBaahtcZGP3vGslKuXeTHXfC3p5qr2phduPdcCZPUOu98Vewwdr/x9dLl9TordW
 2OrJtV6PQ1t0CF6vqvu5dS7PUplOpXecrTuA6IdeQJaE//Yz9GmAkydb4ffTqhFJOIlvWbSZJX1
 bbR5gRxM8S7r//057iUYJvXLUh+ZDvW+kWi3HIaI3e9S+y4X8eW8XqUXT8d+ybE6Q7HVy+fPE9O
 UxkOjefBvt1rTI13KrsZqocXKyCZQmUQjrC7JkNemrH6F5tNplv7RhjP+Iz4qLyjATOaVVThNIK
 vJYJNurNvvayYQf1NqOiWJHYrbraKDahVw1aSiqGtWr6Awz2CCl7hDdwwkhnA2GS0b9lNSfKAo8
 FopzqFannBwB48Hpf1GskAbCKO8JuNi13RStomgJu1mkN3jaWbcX4KLe/WFBrJftMM4NMBkS+Q+
 tPu39VGwBNK1J9uWJly/V7OBCqCVLRjxs23SA3Vsj4DMVyAiD7Knu5M8ApyKEbM36MWdi3qTL9Z
 dvQrgqdEXWHUa+DcEb+GF/mLULonX5NypihJvV0yeOs4=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: ZsYTbQEBtABSUazF19ExJ8ejQMsfMxfY
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=6848f0de cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=OVvt1KTugGfhVnbKlbwA:9
 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: ZsYTbQEBtABSUazF19ExJ8ejQMsfMxfY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDAyNSBTYWx0ZWRfX96AiFwhJljtt
 6YXf79lVCdkhGBKR/1lvmt84xiEA3fNS3sza/7662CU08IagKaSCzOcpLYPME/8k+83inVg9G5W
 LTv6kdgQmspzsVcWNbpSdELc52hZ9FS4R+KEbNbl8++wz9NhLKLFfzdhg8+qIP0kWlsDFsillFc
 vnrkJ+mzSau1kn+r8/uEmD/ZdElCLa5ZBH6vORrEVR2SHdsGoV+dXc21mre4uXd7he2jLARMV9e
 MQMYPzNfviFLs61yA7QQC/5bImW05PKwY2s3fvxMG/ZaYqzp/8VKwwgZu1YV7W0nXZgJCMM3Fwz
 oTgobZELA18U7o6p869ex5CV38brWaXOtkEc0cc+vteMYIQA59EDM0WuEvG9YN6NKqDiM31x61x
 CFX144ysikkm4HeczNatvDrmGAjhdwBrRKrjZpjioJrp5nSMu2NUhYl6vzFAaFamnDmlMbwI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_01,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110025

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Changes in v2:
- Validate e_phentsize and and e_shentsize as well

---
Bjorn Andersson (3):
      soc: qcom: mdt_loader: Ensure we don't read past the ELF header
      soc: qcom: mdt_loader: Rename mdt_phdr_valid()
      soc: qcom: mdt_loader: Actually use the e_phoff

 drivers/soc/qcom/mdt_loader.c | 63 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 53 insertions(+), 10 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250604-mdt-loader-validation-and-fixes-5c3267f5b19f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

