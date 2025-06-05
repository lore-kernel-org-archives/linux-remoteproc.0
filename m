Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E2423FC5F
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Jun 2025 13:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749131001; cv=none; b=RjJQUDxWaBNTfjVDwR8WuwzpvgDr/103duRCLNNkNaZu+lY6dbyqC/ujVMBlkewTKTHhoPeByLMj5/HkWNOVTdenV9xgl1iXU9KkuisliqOJ9IPLPdhujX39HpuHq+9SM1K+Jd8LPWURyOYkCEphS5LLTl73Ht0peJJQ2c0+iSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749131001; c=relaxed/simple;
	bh=4LG9aen+UKEmXElW3km0tU+Gv6VrtGDS/2bhhYgau/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VyOmHRAAKRTnPvDHqXqDuh/UdqOSj/rFkJUtAT9vSxRY1u8UY9l3BdXg6rsMNxwu+FeSiGG+lIkwUGQXc8XDeh65V8t6d+slNgUq30hUQJtY4Ul/1gcNNZ8lME76z4lnDgCA9HugJDGnFcSFuqiaPkQCrX8PCUqvy1PPf3y8aZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L1wbxHOW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L1wbxHOW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5557SE41006669
	for <linux-remoteproc@vger.kernel.org>; Thu, 5 Jun 2025 13:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EcVfgrO/ZjVFn++fwRV+p0fV27JSng2FzXTeHDTEDz4=; b=L1wbxHOWeQ0yxPfj
	l2QfZ6Qrw5hivc4zXPDGHaqWT/n0J2vfd4i5DumDok40cH3fSQW5+SNE7+EOdpTm
	NExqpXjeWQ2im7zZcfYTEQCtg+gKXRElLosEk7y/u/nWyEGJQeIW5kMVI3R/2ATL
	R9q/BrHNfDkX0q3y19zwTNXTocGCITPILoNkSJUMeIYJ1aDCGd8FReTfZOHfamTU
	1AOQTl0ZIwIXDC9I/lCJX6gkeGr/lISrzqwLGy4w1pjRU9Y8qbgE5WpGBky5tzse
	m0DeVvgxjukXnSdj5sLM1fmoVCuxJqDcg1NgoXfG2BRiV1Q418MJLrlWPkV0cRFC
	mpvwHw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t1f54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 05 Jun 2025 13:43:17 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-607dceb1c53so771352eaf.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Jun 2025 06:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130996; x=1749735796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcVfgrO/ZjVFn++fwRV+p0fV27JSng2FzXTeHDTEDz4=;
        b=b51hTAWTefzpfcQECpLFTeH7oGZWv2xDqQin1SpUYjHawtOCWm8o0C4wgE9tX5ivA/
         p8SjJiOiW3eLwuel6iISTKPCjCOihKdhizNcL5hNj7i8EOyOpfvy0TCZNpVDfdUqGQ0K
         qY1xCGWdC0qIv6uGvLFYRGsKHKURpfQu9ZCU5PFu7UNq8ewdvZmePecVlV82rXgHUU6h
         Dn7TZPVZLMZZWd1BjDVeXgImL2hnfhKWUmKRsAzoUrCW5r+hl91z2OjZiNPu2bj6shIF
         xUu+L1Vm6SHNN1yGrUCeWtZeJEqDTbaHIVsg1SNfBFtR8gRuJF0erGAfQj4qIzyvSCqF
         zPmA==
X-Forwarded-Encrypted: i=1; AJvYcCWiNLnedtyZXB8VbT4grfOVJCM3TGRDGocaY5xJsoxNqTE2p0FT4E+V07SUwuUajJhZN8ASHKGyb5SCWOtNj6h2@vger.kernel.org
X-Gm-Message-State: AOJu0YxwMuGyEn7QKxODjnJETEIGw1t5JsS473BD4VMDPSK3sXsMmFWU
	PAVkm+nQudh6bWxdsPMahibSad2o+ug7QeHJmcIMJjO38/mcSbCoTK5np2B6r7AhVGaHJ7ebGUO
	KM/e08bUfAUm9KBZkuxTTdMhtVXqguzx0Yj9Nchin3bN4gViKkZipe+DAznmjMg5/vX8wrNxC
X-Gm-Gg: ASbGnctn46p6Y8chw4eZcAzP1UjqVjJs+NxwgQ3Qmt1pv3ddXfed4nGGjJbZDjaRp+6
	0eQgrvOm2BfWNfxPAsd9gMpMYWT5dh1N7d9dpax803RHNqubn1tuTxxAlu1Ld2vgYCi8ThBREXP
	OoHIax8lB4363bQmTKofmmiIyPgtarCWj/c8618uOw4VD6XrG96rkut95+SDuWKcFdbI6JhwwcF
	pdJWg0wxgCanF7zySE8+rHuKwP/HrgFKFw6o9Pm7UmSJbZKIVlEayDaoAx8Bj56Zk+OanQ3o3dO
	XqXV6guxx4hDdnPaqLCyC4HEGvDprrUKNz+7Ol9vmpQcwtu9VfazDpyVfiMrb7RyMk2H+lFq2Qt
	b+P1Dke22wGakWMehSgFGpA==
X-Received: by 2002:a05:6820:1e0e:b0:60b:ecbc:dc50 with SMTP id 006d021491bc7-60f0c7ca167mr5018552eaf.3.1749130996181;
        Thu, 05 Jun 2025 06:43:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiiD9ljtJHB+ylVXFa9d85uIWbOmYp4glyZzk87k6EP3VaYO5FO8iTw08AMLXnnbkDXIS4mw==
X-Received: by 2002:a05:6820:1e0e:b0:60b:ecbc:dc50 with SMTP id 006d021491bc7-60f0c7ca167mr5018490eaf.3.1749130995829;
        Thu, 05 Jun 2025 06:43:15 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60c1eb719f8sm2691359eaf.28.2025.06.05.06.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 06:43:15 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 05 Jun 2025 08:43:02 -0500
Subject: [PATCH 3/3] soc: qcom: mdt_loader: Actually use the e_phoff
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-mdt-loader-validation-and-fixes-v1-3-29e22e7a82f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2254;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=4LG9aen+UKEmXElW3km0tU+Gv6VrtGDS/2bhhYgau/w=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBoQZ7w13CxlnKFE71dbh50VU7TRshQ8GfmTkbWM
 5ghTkTTwfeJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaEGe8BUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWWlRAAiiZ+YPVc+u6389ZQF+/SQaMdPA44r7qRphoqmeL
 Kr1J8fvRPkMhJAFXLAGAdn0Lw1maOO8M5lXHMdEzD9DFxsukVx1Quq91S4Nh2f4M6uEkF+IOuyb
 ktzh8xnX8gMPayxP13Jp/mhuvb4/3EVAQyIa2hgTmnSXBfn3wtDOYm3NZ5scdNW4IHNowil18tp
 LhcvRuM3lex4kfrJQf7dNvJVhgRrxyV976tHW3FVBlmDIyqYjzYLO54GDUNwbLsnDAtd+zA/fc2
 2piYgJdcnjl6/mKiirTlOewOyVJdxWjDluQlePD6eKdg6CRNT6ax3MQHJf8smaJkx5CeTOvORWZ
 swowr8PTnyWU86uummkAtKjOGdPW0rb9MFOejYwJ4D8wWaBFPJqaUkeA4zWK4jFP84N71UW15LM
 E4Rk6+SqvY/LrUL0LYpkk0eDsYckxEYz4t1rw5Qa0RWIADvn1uUqa1VmaT2LNkf97fZDfikSk0H
 7hmZ1Km9Yr3QvUp4PdUxCd0eHNfo6KAfHQ/CmaXLerqNimO2/+XFbehH/+9+XaUb39HLaawHieu
 eKFYkGEGBTtSFVAp6gFUFy490GtIIKRdZay0gaSg0FnI3rPuL9ac/wwgyJZvvTUiAzcsR2hQ7Eg
 T5QBNWOZOkUNGfxKvpc/0ymUID3iE2JFO/lm8sZ9245I=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: neR-rBgljky86s0olkhHfDgCTYIdYild
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=68419ef5 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=f2cNVZAXkzJHwsNSZUYA:9
 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: neR-rBgljky86s0olkhHfDgCTYIdYild
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDExNyBTYWx0ZWRfX6vA4zTnVZvP+
 iev8Hb/nrl1w6jVgonFJE9TcxC87dc216x4N4sCIuJgIC7fB1+IS8li6Opc4YLg0nz+JuWqoxYF
 ga4iDT1wf5d+pc8bbYMTnltl4PhO2Rl+uELktTlv/HuwORyTF3c9ixgEgEsWLMYGBq7uakOrhdj
 i8jdLnBjZsl100UnzQ2zvEb2A9owF8JdlgXDxtnHWpZglli7Pivts8PEaqm01am8VofaPf6eKBo
 1WLPQ/pOZnj0iowq7Pns1uq/v9xJ1K8gDx2orbb1rGB5nalTZruSZyUGrpmS0RxyEfQYsishISp
 H9t06DZF9ty/sxUgqKMPpelkIR0iUuKBXfTSDZ/YfN14yWxAxVCEo2JV54iESYW1chcyOrxlZbF
 O5wnCAZVR/KkXvATMzteuzOsWKYBZaknnFudeNDZQ3bOAGXBYpYok/+UP7FIc5lms+PvR137
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050117

Rather than relying/assuming that the tools generating the firmware
places the program headers immediately following the ELF header, use
e_phoff as intended to find the program headers.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index dd3875dd7ef68d1f135efd8efdf5634f27aadd5e..01fea4c510717197a67a529cfa467c6a9a3ab55d 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -111,7 +111,7 @@ ssize_t qcom_mdt_get_size(const struct firmware *fw)
 		return -EINVAL;
 
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
@@ -166,7 +166,7 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
 		return ERR_PTR(-EINVAL);
 
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	if (ehdr->e_phnum < 2)
 		return ERR_PTR(-EINVAL);
@@ -249,7 +249,7 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 		return -EINVAL;
 
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
@@ -304,7 +304,7 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_na
 	int i;
 
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		/*
@@ -349,7 +349,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 
 	is_split = qcom_mdt_bins_are_split(fw, fw_name);
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];

-- 
2.49.0

