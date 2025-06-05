Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBAD25D547
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Jun 2025 13:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749130999; cv=none; b=FBd4dnWVhq6sKpsXSwpnmd0tKH3sORPOPJWs6rE1w21Wa2ex4b7r1UdKMFpJKbqjjtESIhK+GDdYOw6fh2JZDtd3MXqJdARyR3oJ9CZZ8gc/xdvTH8mV/hlUlPd7qQlMZHHRN0XCyoG7RdPFFoNENaGeo75xvnR+/RRtDtH6nOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749130999; c=relaxed/simple;
	bh=ah/lhWzPd3F4x1p9T5vxQvIqsGcJdDNhQG2J7Kb+OHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Unc1krycpaH3XSlPbrt4MZiIJ1Pbudn55J8QqbE3xHAKZnpol83qgMJ50WGeFCr0MbiwTNy1+B7colLzYkg2NWMrTeVDQd29fzeLUR7B6D7j3QBFkD7Fo3P5qIVKAqRreig6Hwi6A1AVWX5BDpOPdTp7kTmiojy49k6PHcHxaD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lsP/yj0M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lsP/yj0M"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555BFXXt023713
	for <linux-remoteproc@vger.kernel.org>; Thu, 5 Jun 2025 13:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uA1ezJb5O6oxjcWW0nT9EUP50nDItWbzBteKzRW6CE4=; b=lsP/yj0MX3g97cK+
	P9CbRXRZryyaJb+RWHkKdwO5bRrvy2YoVH+vb4NgAulUkzcj8AAaR8bX1sbS9Tka
	cUZiThKOCUSEWYRaQDkqlCe6ZvIzzKyIXHW4CkjNM/zqxLZI6xxo9mEDOVNk3jIP
	krKWzHcahYUJ3kToHmVlXEcydFMOndVgj2PJ85x9Q/PTOzs5YNhc0wjF+MS40dmi
	+63tkC2vuwHEKAgbS5/vRwo85c3+lJPtHY53Up9Wo+uDKBv7yhzuPtDtoS4HkoUS
	AzeI/ldkRSNSsBXj3tCUuIlDwyvuLPZqqo6gRvkNvTNZwRe8inqYhHieRHokEuvb
	wNNECQ==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472mn03qe2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 05 Jun 2025 13:43:16 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-60212c73868so717185eaf.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Jun 2025 06:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130995; x=1749735795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uA1ezJb5O6oxjcWW0nT9EUP50nDItWbzBteKzRW6CE4=;
        b=dlDTGpnOw8BEdlVo5x15C7mIXNmrrE1c2xmsouAQ/jG+suBfXQ0SAmu+t2U2aL7NQ7
         ixMRGuureLb18wxFPRwiJ2axGIVs+Ii5CPLULr2hOq9xQ3IFRdGEsNthtUWecGDVccN0
         OEgrCkE8CXMjv+U825dh6oV2STGfS5PLOB5onSW0iqS9Vkh9tuhsDGoHsuZYQcAEg4rB
         sOGzh2dHLfebV76fFnEswy2KISwFhTurEglUZjDB9IJfTm06yDsiKmENk5SH75B/K2GS
         0S3dLgNwHLuVEiT14rYqiibM130Doh8xjP6I2MejWyAyqtlQfai7GHdRT1CEdP7Rh+y8
         qW+g==
X-Forwarded-Encrypted: i=1; AJvYcCWAkJvS69BPKxUHYC/Z7TvE9DESErb1mvdPc7/+cHNj18hSNUVou9HubINuk9/ze2CUVG2j+t9g/PB26khVf8bd@vger.kernel.org
X-Gm-Message-State: AOJu0YxpPem80/xLq3+9uk2cUQMSUS07EWxKX+bOzaHz0WwJ+KrBqBY0
	4WEfYD8NYDNxCE5YJr3/3TFNDgXgKTJQ4Qe0En8SJvfqBbOB/BYUXr+bxwTrQxRabSpT8a2JdeV
	+BP55jXXD0lC75OkbYxCquLyf/aFW6eOTfBISlBPQn26UteGiyVHQeGzRFfD99cwMiU+scrVw
X-Gm-Gg: ASbGncvBZEHgSt8bp6zxhDPyDl88xwHkzNNIsntKu3/PMUb46f+2hAdHu7jb2ReweKH
	D8QHqDJVWcqOUTqHRyAfcGruZN3RW2KRAlVo2VP85SJ3IO592L13c5iNYcA3gQ5rAxZEKdIVw4e
	9MgQAm7mCqdOQEFACB1gZDa+gFn/fmb85+1cmMYyyDT6Lo8zr0SxSGQPRyxhOdY5NBFhqJGQj/v
	1Y3yl86Usus/1GWqJPOeCV+lv1EuhjYIKG7BBVDSC5mmWKKXxGH/bp6haeaqqG9WOxSiTQWRGCK
	tchMbSY1mIQGon3EmGugUCkPyaG4Zjb9+6GduUnnzs5oGnSHhhugHWnY/odarYDXu75w1MGj5uQ
	rBB5NcPypfhc=
X-Received: by 2002:a05:6820:1a4b:b0:60f:16d3:df3 with SMTP id 006d021491bc7-60f16d30e9cmr2688585eaf.1.1749130995218;
        Thu, 05 Jun 2025 06:43:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEturGnep5hT4yRWVQtDibkZa+fM7EuTbrFdkm034fDMEJK89puu1r7Ay4+am4powKAWqTZkw==
X-Received: by 2002:a05:6820:1a4b:b0:60f:16d3:df3 with SMTP id 006d021491bc7-60f16d30e9cmr2688561eaf.1.1749130994887;
        Thu, 05 Jun 2025 06:43:14 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60c1eb719f8sm2691359eaf.28.2025.06.05.06.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 06:43:14 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 05 Jun 2025 08:43:01 -0500
Subject: [PATCH 2/3] soc: qcom: mdt_loader: Rename mdt_phdr_valid()
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-mdt-loader-validation-and-fixes-v1-2-29e22e7a82f4@oss.qualcomm.com>
References: <20250605-mdt-loader-validation-and-fixes-v1-0-29e22e7a82f4@oss.qualcomm.com>
In-Reply-To: <20250605-mdt-loader-validation-and-fixes-v1-0-29e22e7a82f4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2112;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=ah/lhWzPd3F4x1p9T5vxQvIqsGcJdDNhQG2J7Kb+OHE=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBoQZ7wXUj7o6UHoQ2l61kxh16BQCsmUUAqCTemp
 pNvsfa/6gmJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaEGe8BUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVAUBAArbl+Hamg8b3CeUtjZZ+Gal6gvxcLCuz1cu7yEX8
 JW5xDvy8D+CJ0tcApo/zFOeEWkVW2dktRdqSHXTLbm1cB4BPgKdqK1VpabzntNV+H7zA0POIR4q
 myuILdhhpNBJqz9F78fIuAdWvPFSaLFi7FnaEjJvaw3vj4kpnCnDko8VYIiLK8ReD37KwrV15Uc
 OcbUGMZs4xQAxKQieHdtppJ5KMF2FG4UFsVqSkzPL6jaFODrx3ob3XFJlxdK9WguZzjbUb9LKxx
 hepIsc2fKYtssbIeCuGzYrotyOemh8sinx+HUc7dX3cPuUaoBpOArJY3+67f22T3SMvQz1LtvpC
 ISVPbAOApnCqnpFtBVg71VCdaX8Y4fmA2ArZFkQbczF4h9WRDMkRNxpCzxHYqsDKgOE8PnV0eLL
 o1Y9ciNuZIguk2tlJxOLQaufDm3y/L8a1XgEH7TlJaTyNEri3RCTjGWWiaLBrxJQIKX9yXyUiYN
 pSyPK3zwdzAkdKVXCCB03gWi2MKbwMc+p8/lyoccMvzYrWz+MrYmez/aWlJjRR9reWbPXm84zCC
 vkDZmeQvxso3pE3LPAJIrNKoIaAf7BcZQ/Ig14rDmrhSSUWP7c/0LboVKp1eeQVzewvu823Gk/H
 fLEeNQ4PxrRljwxGniTzeR1Kb3j5WbPxlA5R2n8ZrfC0=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: tP8NbgrYslZiwtP17xmNk9hWxltKjhV3
X-Proofpoint-GUID: tP8NbgrYslZiwtP17xmNk9hWxltKjhV3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDExNyBTYWx0ZWRfX/p0vJzVm5Y5r
 BP+DNNU4vjsX0O58maShhYyW9qnQkP06+EDXtJxE+nofPyvUi+lem+kEYdCoH0OmdN0UgQFBL1r
 dLwYtGuj4nuthL/8Q05/69SQTTbu6m/K4MEZSriFMFtC7aqnVKD+LH1dRQkkOQpUgz0GXeKNsY+
 k8vUi74Nob7RZhtfMN0owv+HWgxhhzQaDVgQYtaXiRMlUe+M3WuxMSa32/R7UyGNLqtCWcQXyYQ
 NWu8NsIkBQ975A/aK6Y+lQeFGCv2DutRuEOrIop3C84N3QhIsfca29dDfIxXDfly42iZC3lLhEX
 WCRGLSyVUNah1jJ8OnXNsZDpewoKfJ8tLduSmhGSfPxx6aJYxK3c9lSs3e46cL9zDc9xnnfAGRm
 ehL0K09hprrhHyhRp37UFD6ZYsHfYIkmLAo05VKktCtti1bUTPfCgrjEfdMUXFLCJLiUZt5H
X-Authority-Analysis: v=2.4 cv=Y8/4sgeN c=1 sm=1 tr=0 ts=68419ef4 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=f2cNVZAXkzJHwsNSZUYA:9
 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050117

The function checks if a program header refers to a PT_LOAD segment,
that isn't a hash segment (which should be PT_LOAD in the first place),
andwith non-zero size. That's not the definition of "valid", but rather
if it's "loadable".

Rename the function to reflect what it does.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 1da22b23d19d28678ec78cccdf8c328b50d3ffda..dd3875dd7ef68d1f135efd8efdf5634f27aadd5e 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -43,7 +43,7 @@ static bool mdt_header_valid(const struct firmware *fw)
 	return true;
 }
 
-static bool mdt_phdr_valid(const struct elf32_phdr *phdr)
+static bool mdt_phdr_loadable(const struct elf32_phdr *phdr)
 {
 	if (phdr->p_type != PT_LOAD)
 		return false;
@@ -116,7 +116,7 @@ ssize_t qcom_mdt_get_size(const struct firmware *fw)
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
 
-		if (!mdt_phdr_valid(phdr))
+		if (!mdt_phdr_loadable(phdr))
 			continue;
 
 		if (phdr->p_paddr < min_addr)
@@ -254,7 +254,7 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
 
-		if (!mdt_phdr_valid(phdr))
+		if (!mdt_phdr_loadable(phdr))
 			continue;
 
 		if (phdr->p_flags & QCOM_MDT_RELOCATABLE)
@@ -354,7 +354,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
 
-		if (!mdt_phdr_valid(phdr))
+		if (!mdt_phdr_loadable(phdr))
 			continue;
 
 		if (phdr->p_flags & QCOM_MDT_RELOCATABLE)
@@ -381,7 +381,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
 
-		if (!mdt_phdr_valid(phdr))
+		if (!mdt_phdr_loadable(phdr))
 			continue;
 
 		offset = phdr->p_paddr - mem_reloc;

-- 
2.49.0

