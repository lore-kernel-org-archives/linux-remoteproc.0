Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA11F2E40E
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Jun 2025 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749131009; cv=none; b=S3p8O0ufr+si9N/4HtOiGCSxkg71SnqYilsqIAz2+JfhIyXWg3v3x4FoZLPfrbM2/xU2+cvma9bHwrmP+9VNRftPfRgNfEvng/sp61HJP9Tpgbt984FBBwu05ScQk2J5tcwl7soIta8JQ7QvbJHPXrdg6LBLBYhRP6KEuuX4XBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749131009; c=relaxed/simple;
	bh=3Q0QXaolxWY5w9SU15ztjaahCT1/EvDyEuICk9gmC10=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HeK13wXRe+3szkcXlunlmg9EKXirIxgfc5rY4fVf1WJBhBtymKtv2b/F5xPFnUW72s/z9NCxVjeiMI5QU587gg47PLAMUQUhEAdKFFsyZhiRhzxZqEryoMfFWCiiJPALIkFfzea1iyAFp5jSi0BDD40eRpX8RJ38IP6kL5N+ejo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ayWA3a9I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ayWA3a9I"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5558NOvA006645
	for <linux-remoteproc@vger.kernel.org>; Thu, 5 Jun 2025 13:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aVk8k7cpJXs9jx1Q8NkhQx
	ynOKi9vcuv9OFvsSclvyw=; b=ayWA3a9IjQVbHPcI8oG0g8V6j6+vwVu/qm0CJ6
	EkJrWAtLx9+vfak6UFwmn5I6ZogT7r3OGTGAYMklmxc6Ev15JRpd/WX82gfZ9l/E
	O+ecVtdCCqUWLbcFTzfACQ/N7VH+l1AqAafLnfZ8o/2zFCOQyc8W9UT1w+xT7iHp
	iF+F1AGQEgHNr0b7bHsTQJ94QwEzhRjnnLvkJcxZkfbd+6VzC9j+WTKQ0n3gGNNm
	asoe2rq23xsh6XFoMSvKxQpnbqAX3pXkdkTUyq4VfsBQgheSjGolUugZW7KiXRwX
	ETvqeuZARy0U8LtOGyrGuP6dk9RNdtkVE25nkx4R9WO1ZvnA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t1f5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 05 Jun 2025 13:43:25 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-87e8668f1ffso767514241.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Jun 2025 06:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749131004; x=1749735804;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVk8k7cpJXs9jx1Q8NkhQxynOKi9vcuv9OFvsSclvyw=;
        b=NTOH4XjRlKDBdre00wgTPQV960XRUzvj+EfFEpg066aDJIbFsbh/7ifKDoOWeVVBcp
         OXllTrZF5p7HvOYc936+MRLhwyVCBjYQ/EIvbT3qgaoLOjC959Tf2Dj1P50ewkXZSsq6
         IZPvFt0lH4c+Sn5k9KTlwQGaRkV7CrbRzDU+T8iwsqhRSzfzPBP8AQy9i17eT9JmOWDj
         TLHL4VHAibpa2YqEU8b2WNPajoHChVd21I7znfI2TK50zJT/ZUuwT7DeGrZSEjPodHqP
         sjPkIQJU0QPmPc158BVgklYp0gpveDlUVfeExrpUPHfKukL4NkSd8sexCJc6PVKg5d/t
         M0FQ==
X-Forwarded-Encrypted: i=1; AJvYcCULS3A30jhgfprQsEXsU1rGpDhxAbODbvkbt4944TZgz3stJRTpERTGUcT+v8BuIhpgd+Fac3jnIXzNS+mT7U25@vger.kernel.org
X-Gm-Message-State: AOJu0YxU70/48m0PHQumKq0rZkG59wMWL+WARCiQrYwdK56ZiKHKOfV3
	ICC7+JVsUArI/kRn5lwBARKwNTlUQqX7cYS8Zap2upsFa92woW4b7cHKX1gBJZSGKLaqxqeSzaB
	O4YCt/Lhjgv1Abrqg7dl+dq54xI2bkw7UZY3+YI51E5g688Q/ymTYoNTX2xKW/DWfK6HMLS+vcO
	C6pBX8kLM=
X-Gm-Gg: ASbGncv5TMtFTZFOtQFKiO/wgHSjrZRSGYYE9TylYdnFcty+twetUYiSB+JdRdtGatf
	u7qgbRg4aRE+BzxDFSLoQAqty+rZVEdJjuN4PJ1IaCtTmvHE+XIPBhCM6p9uSqPDyLX4cNN5mcv
	K/wk03OpjYsTBJ6NMoZ8MaFSc8KuWhyyVhL6nLiqrNih3gJGL3+P2LswpikhY57y6YAFU2Qm9Ou
	C5u0jGYO7EdbxQfHR7gvW+LIQTugTUYfv9mnzRc2jz5w0Bgr04qNHdphcTClhEOyUSM5yzCWhCx
	oaXPdkjHfmzP+z7uhJV94Onws4sMuhSTd3zInIjZOJJKXvj7sxPBGa7/QeMy9YDc4BJie4eC2Bw
	EdPzBv7Gy8PA=
X-Received: by 2002:a05:6102:3a0b:b0:4e5:a309:85e8 with SMTP id ada2fe7eead31-4e746d558efmr6110923137.7.1749131004388;
        Thu, 05 Jun 2025 06:43:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVYdfhpp4FJ7SmLqPejCmqbxXj2opSUrnqug518ARGUG/eIE28eAmWYKD/8Tdocm8sfAG6kA==
X-Received: by 2002:a05:6820:1987:b0:603:f903:c85a with SMTP id 006d021491bc7-60f0c73392emr3549900eaf.4.1749130993365;
        Thu, 05 Jun 2025 06:43:13 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60c1eb719f8sm2691359eaf.28.2025.06.05.06.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 06:43:12 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH 0/3] (no cover subject)
Date: Thu, 05 Jun 2025 08:42:59 -0500
Message-Id: <20250605-mdt-loader-validation-and-fixes-v1-0-29e22e7a82f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOSeQWgC/x2M0QqDMAwAf0XybKDW1bH9ivgQTeoCro5WRBD/f
 cHH47g7oUhWKfCuTsiya9E1GTR1BdOH0iyobAze+eA698Avb7isxJJxp0WZNiuQEmPUQwqGqfX
 dM4axeUWwyy/LLWzSD9f1B9BRFkdxAAAA
X-Change-ID: 20250604-mdt-loader-validation-and-fixes-5c3267f5b19f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=609;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=3Q0QXaolxWY5w9SU15ztjaahCT1/EvDyEuICk9gmC10=;
 b=owEBggJ9/ZANAwAIAQsfOT8Nma3FAcsmYgBoQZ7wzuSNIDoxicO+eNJkk389eTziZ8KRF85s7
 6OX4lm7xhCJAkgEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaEGe8BUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVb5g/3XMzQN93Xb26ritBVMFl/NWhaWaDwsj1E21MPfrC
 yPS7y7dR/q/qmdY5PQkuGtBLuPwsR5iBqDWY+OTupBuvfaBhUTwiP1cmae8wWpDyJK42VXH+tNU
 nYO467XQnRtrccGV3tZEWKGjkdbag2rIycxrgo/jmiAzFVKhYD7Laf3WCtzxXd4IFImImxpoxJH
 IPWnOCogvs9L2bm6wkBZ86r+12bnXMXEfsVoaQvCbg89ZwEhbbDcgDSxY3evv5YHw7Q4fP14zaX
 Tt8KVGPi4dsgJLgpBIKLZHbZdmSnUDo/HEZ1tZIJ4qdhbM1WIvhifS/TxWgyLeixTXt2YaZ9jxe
 2n5DduGlUyQXfjAQynecszk8bM5R/ZLKuFwS6fHUTutyewTjmUzuW4RPZ+5vQzHOZPmGYiTjnQp
 9U7wonMZA0MivwxESLvptyHZcAMerE4arcYDp27z3MHftPMTC7PBDU8O7zIJoFEIdoqJ63U2uWO
 k3x2WAqJ1fXdddf8w4L/Hodc5O6U7tvIDEseEjhOCrkVGYGMrTtSLjAtkbeX4iRxyOXHQ7deI7X
 IW2WG8EbkQauEn3SN5D9kzpt7FW+g8Vtx0oQL/02ZW5sFBLrf0wxNIBs8qP7ycuvKN7z5u6jenr
 nLUiT2LUk4rWW+tZk/CZKe76IhBS+KROFkiFiULge/w==
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: tx97kDVXnUvKczfoJTPF0B_LnquLOI_p
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=68419efd cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Eo5HmAVCleSnqplLZ4EA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: tx97kDVXnUvKczfoJTPF0B_LnquLOI_p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDExNyBTYWx0ZWRfX+h79rB38vMxZ
 ynIrU9q0D1kG6NY5VgXXnFF+mLVJeIqjuseuiTci3mdWl3WqfFSG9y9kPY5XyFKlKxOKCqb8Kup
 qMuQfViVUpn/2DUTYGf5ISrmWikMsNfzKB2aJ3frc2hN5Pb7hey48f2ts0miHTT6OPxUvawEwK6
 lc7ZpIqzeXAcc6F+XbC9u3e3qAZRk9h2bJnTUksvOFvCh5YeqVINWe0Xjvt82rQVASQqGEpVqKh
 U+uQ0hL+g3nuD1vYebQy/RDbZywH1P/c+nlH3zDYTHWWTHMCqXem3uAQtIZeyGDMkMy2rOA9DS5
 0Io049prlA481ehiBiKlUxuJqGAO2KZRRRtxj3WJzQRO/dOE0e14maMrMWDQa29/BnxR0KUEfsj
 s7DILvrJX+Gu1rs+WlACva/1AGPtbGE2vjydZV2lOnbWcOqhHc/xlpzIVuo/bLV3MA//C1AQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=856 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050117

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Bjorn Andersson (3):
      soc: qcom: mdt_loader: Ensure we don't read past the ELF header
      soc: qcom: mdt_loader: Rename mdt_phdr_valid()
      soc: qcom: mdt_loader: Actually use the e_phoff

 drivers/soc/qcom/mdt_loader.c | 57 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 47 insertions(+), 10 deletions(-)
---
base-commit: a0bea9e39035edc56a994630e6048c8a191a99d8
change-id: 20250604-mdt-loader-validation-and-fixes-5c3267f5b19f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

