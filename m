Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FA647DF81
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 19:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777576422; cv=none; b=mk6VJ9fxpTkDcwu7kjedMc33O6BMSv01JrmLdp890dce/p64nSnDB25cRuG97jPrs1ljoxZMb8jJIlZtWAmExL+dPKlSajsuiJwqmwmzVIRqd6odJ/Z8yZp7tm0VrdwcfTtAfSyTSu36Px6M9abpDdGSTnj+PGheC/iaUGjflkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777576422; c=relaxed/simple;
	bh=kD4ecpTGjwK5qwh6hLibYlIp0vrFZGM+vF3SHumvgwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oy7IJnVYqurULRcslo/snkC7nHAsU2RKSDSQ0WGRbPUNhWenU3bVWoH5yymiGmBAgj3In/SC2zRCtXM3JqYDBdUAzOf0ZLkg3IrHx5i9HkCKbN5Ff0WGw/sBGYJ0U2syncJ6bMfrfk+/U3YMZL/Q2e0Z1rW/G83xsC8Wd+KMKnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftkVCqNF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hg07vx8n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ftkVCqNF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hg07vx8n"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UI9qVV1988518
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 19:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WgDI7C5Mlq8
	cSRlS+CF3UfzqdurX3EaCG/jh2n5zBAg=; b=ftkVCqNFaNbIgeXSamlxbbLwYnY
	syxYaVCSFZIzQQhV5VEO6b3/HKCs1HW1cm7GrG9UwF7C/bX5mSuxDXYxuTrNn1LC
	PPBl94sc9Y2wJA7fLyfMNcsKGNjVhNOUkQ2fNi2CyfCWRw7nL39VTMO+b2I0RSVf
	MEwNuiWPyjQdOxqeA6ncM//19bhmbCNctAx1EUtFckhYCIOoqOW0rLrjAeDC4ee3
	N3oI+tyNHwri4g4vibxuOKZyN+H/fuYmVI+mLDZIZ5BKQ8g6xP3Ssr043pSHuu8l
	6UCdLm2BOO204ITSXknJVYTHpTq32XiRcb3c8giUNVBOCQZLMpC2J9RrCjQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvc458aue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 19:13:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7993b17335so539246a12.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 12:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777576419; x=1778181219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgDI7C5Mlq8cSRlS+CF3UfzqdurX3EaCG/jh2n5zBAg=;
        b=Hg07vx8nDPFmZOTFzA0Ki+AUggQqGYxZV+J5kg56FOyHW63T3o8J/WxBb5/K21ex1a
         xh3jbFmATYp2amh5AHjf5hTP/kWr/MIfoHy6jGt6k1QHf0GwV3XzgZPGx2oYvqUVSC06
         yivI8NsQhymaAbFskmhPf1Isxe72Nqny8aBlCwqqjxJW5HyfyA9e4ccyCsl9T+VoCMvL
         U7cUVlnVZcsBLjsSL83qAt0lVbfKxWJcThDNIs+Wepxozja3FUH0+cUu8YbCCnuyK5IJ
         8mJuOG6n+7OU9di0fndjs7h4qSibwweSsQ5TzfRvzRQfwUpEW9A7dGxSzvhSTqd/X4Z0
         gr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777576419; x=1778181219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WgDI7C5Mlq8cSRlS+CF3UfzqdurX3EaCG/jh2n5zBAg=;
        b=IhpXPvxxIIMUVw5IK2k78vIcUiPI5RE+iOJ5SwgIFXNRQ9dVHGM/L56uInN5WHkGiQ
         f6nKWJsyB+97gJZDQkUYZeVPgrbllGn+Xjj7aPwKjirZX7AF2MRfJ7xL4PzdQGaIpmag
         hkhCfetcmFI4PpaZI//kvl2zhs2aiMEJOcBglX0AgQ2/sp9xhIncHzRjM9RF4qgs2LEF
         y095N7WgdMaI/WVYpuMfZ6vNgTOByttBkGCoPtUyReJYFSabXbSYDvhqAIMV8hEbFLZA
         XjY57l15bN3lGlo1gbFrlvjhd0LW8lbxyjdPohGd/f5gLY7YI3Qt5iMPvDwuzfMaZH0O
         kkAg==
X-Forwarded-Encrypted: i=1; AFNElJ+2j93UdtXhGurnKU7SSivvZAG03AJKYWqAmoEjnlVOi/2ptgD3K5kMHgZQsaE2AmMQotd3v8F8bCNyMcpwC2bD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3/HIzX5wBaZ4Rkj/RHaHbjDLaFVsglPgw/U1lvCJ0Ih+FOynR
	icmWiOw2WW4bcpKur/KmeEZKjEnQOsDqnTqvKBzyh8GeZAbtMjTXDLdltOq8Q4nmbpsbNAosOy7
	ZsQVEJhIFBwc1KD4OXx0mvobRKGv0x6/kGXVNi+Am7u9XFVAHG3S2Dez0VTDgUA2+dNxfkjpj
X-Gm-Gg: AeBDiev/XYYy8y2Yxzohs4sI2WsbR0Liswm5kSUnAWKW/Jmu8SJX1gfonHrnw1ikoAX
	27dcab56wg8r4qq76VPx6Mtt1BOzsyEGEIq3jmZkNf8+cT806EsiRgPvGcxSx2DcT2QXrEvzQkL
	1u7wPjzqqUHBNi6bay3wGsmtsSulpcXZf5nhXFfNUMJai1Rt2pkpvQXC/DzfoaPk78Cu111AHye
	GBvmotujigqNMHurS65GssdgJ7QQ5KYzwrd0CP0XrUkpGX6KFAJl2qeVJP/E4HhuNrheBmcgo6+
	NKe6buveqTcV5sTUolUg+5kz7P+q/JonFYTmH5fX2Q5M7ZaBbSqhoy8l8ca4kSSZlNHksgOMY/H
	VR3tmUxqvbzxpzVPBA2nVFuEPkOBY0ODRsQnzhDZcCsDXoIBG4PT/MwumUuc=
X-Received: by 2002:a05:6a00:2e1a:b0:82f:2319:7d4a with SMTP id d2e1a72fcca58-834fdcdeac5mr5459229b3a.31.1777576418750;
        Thu, 30 Apr 2026 12:13:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e1a:b0:82f:2319:7d4a with SMTP id d2e1a72fcca58-834fdcdeac5mr5459192b3a.31.1777576418185;
        Thu, 30 Apr 2026 12:13:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b485eesm373640b3a.48.2026.04.30.12.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 12:13:37 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 5/6] remoteproc: qcom: pas: Drop unused dtb_mem_region field
Date: Fri,  1 May 2026 00:42:52 +0530
Message-ID: <20260430191253.4052025-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE5OSBTYWx0ZWRfX+lIdb77ZhfE0
 os61ZbWY4zbTUj3DebBxgx8e9aNYBT+m5IlLrQpjV1GHOBHU+dOnz2OcluBZEIVSFWbnMbByghD
 hNMiq2w76XeQdWg//ujn/7VSE1O9XWTIjOh/ZY8oms52v8wlZuhNXJUYr27S+QF0ev63RgkRTgM
 973hQ2u8kNI22/e/rYllyJ3DgATW246IM86vYF/FU/QbLNkBc0OAj82oHhaxsG45KbFNK8YeLNT
 SwxYUadL1GiDrK70QgopqW/BtC/8V3n8bgR+1IUmr3wrtgvUIMvcAMpjk/ULd3H+RznBdXIVNm8
 P1TnURKYDrqnds24pUmdupxgzWEiLso0C8hsUTD+TrbQIMvhFL2JGyjG9rSerbqRfnlSavo6FRr
 xPYG4503x7SKCxC7122vJRSHqS97zpIDGzP9BJMNaPqJF7uuvMw5OfRHSKkF3Nvrk/gEBrmJbOy
 HOUtTIBhgq2U9bY6+fQ==
X-Authority-Analysis: v=2.4 cv=DP+/JSNb c=1 sm=1 tr=0 ts=69f3a9e3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Lqr_36QtIFBVL_bOULEA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: HrcsnXCYfUQgeQWN2e5XHgtVi39ZV2aY
X-Proofpoint-GUID: HrcsnXCYfUQgeQWN2e5XHgtVi39ZV2aY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300199

dtb_mem_region is no longer referenced after the ioremap was moved
to respective places where mapping is required. Remove it from
struct qcom_pas.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 6f9fe38fb1c4..5be3070fd52b 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -100,8 +100,9 @@ struct qcom_pas {
 	phys_addr_t mem_reloc;
 	phys_addr_t dtb_mem_reloc;
 	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
+
 	void __iomem *mem_region;
-	void __iomem *dtb_mem_region;
+
 	size_t mem_size;
 	size_t dtb_mem_size;
 	size_t region_assign_size[MAX_ASSIGN_COUNT];
-- 
2.53.0

