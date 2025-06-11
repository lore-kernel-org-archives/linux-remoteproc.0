Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1013226188
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Jun 2025 02:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749610724; cv=none; b=od43hrmS62mCyDieNoWFvM+VmJfut2MHYG1LQu5b9Gsq9SnOMdkdWSif2fijZcLjnS6kYfbCaRz1IppskMRX4xoA57cHottsHGo/xTbWgeFQebWA7o7yXfhvCug7IdDwRtgADtSrgCIVH328uyO3P7hpxgEEnagEkCjSABWpiDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749610724; c=relaxed/simple;
	bh=4U855dwdIaDRs3THDO+BKF/8/926zEfYRJi0F4N9KoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZfNh0f3/GUJaSFnLLpD+oIMiD1dLwbGk2JRASL0z+PXZvGIQvbN3KTfKMxoRC5zFohWr/I4kaoU9nhKI+P+4zH4GsPCiF8EPHfCmFf2O3Jv0Eh1yBtNqrVx8xwhczcZe1Ou6OQkVOB3lvpZwsZtsT8/8WFDh0XWvPRKu7XJvc3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJwxVALp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJwxVALp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPpes030860
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Jun 2025 02:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EfRQ7jMFsaHVSush77168FUGD1OlX8kIPHZjPyesHFA=; b=QJwxVALpj/k0xdcj
	AX/XlWaE73HleB+6Ec7PqMH7xV2+F3p1GXe8ZrlVOPyOfDSt4wFrTutg2QZR458C
	Ugqifx6xayshNUAvh6fypssudnKTJSQuBB7NSbYQQu6PhvVLLtODmj5NyUM0qpGJ
	wBv5WfENn19XGk+44mdZs6nMSyVgp67j+5o9NRSobQ+WoA8UT/oboG3QXRZYS6Ie
	5oVIClY2Y8uFT/JXhOBsRVE07dvSJfPuT8WiPbp3ycCefNhP4AU3e0UNgD18gSua
	NSGSan5iX4AWlz9uZjGI+m/T20m/sb5aEabGNTe3cXrY7zgevkB2EW3BjiIsT/+r
	A8YtpA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2te47b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Jun 2025 02:58:41 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-2e9b472cfd1so6009313fac.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Jun 2025 19:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749610721; x=1750215521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EfRQ7jMFsaHVSush77168FUGD1OlX8kIPHZjPyesHFA=;
        b=aZt27vVOrMxpe4rpVoD3vZXOxIpmGIaL9CeipRlIDLZKpQkoRkp0fnUjogUALFRz45
         cSeA+k9W+2yS9Keapir1cDMQuNxkqCzZun1kneK16yMfFa5pYUt8olf6qlWCHO/OViQu
         J4RPWtgdG/v8WFX8/T2qZeP+ESyOTgJLc1Vy6nLEZhulEGPjefRG1s6t12M/CWjtyHpY
         TegmFquDXL3egYXUV6nhSF+84PrxWKVw0Cmf9r/n3QrKyNX9xFPgM8m+YX1WfZxn/Su+
         9MDDSRNqyLcpIPkRWjI4HUtbnpJePSr/08J5BB7zGCaDSL6VNrkL/DYaLy6ZEZG1VliW
         mlFg==
X-Forwarded-Encrypted: i=1; AJvYcCV0fcj4VlB9dH60L0srAuvNG0fwKV5Hj7j9mdmij7mnWZdhh/Vvaz6dj7mSM95FFpA1ErvkA8hE3a6OoM/DkyVi@vger.kernel.org
X-Gm-Message-State: AOJu0YyJGCUTVX0pYSsP7k5tZgRP0whO/xPIc+kQYOkISBtaS/Y6ckuJ
	UHf/luwZeyFl2WpnsYB2YamHHRWQjogqQMtUxVBVGdhtNzfsCKh+h5nnhiz+OHSLaMWMLmplSxs
	n3i03tNidaPzc8jHMOuysCM4189QeY+4gcoyxFuKDeApG0qDdxh51veNY/pjN2E//6B9zI7Cz
X-Gm-Gg: ASbGncuL6Qws5PdqzvbiM5RF02wsvde3zscxSsCOirRPg9m9PijZchIPpHioCM9uMaE
	uy4Fe1iQpMCaveSKdQhyvtuOIYVEHPLy9swxQJZjzodEljd/UKXoUQqi52zwScmFW0Eod1boNTQ
	jJqjDd15Aq2/+tW+pqmGY1VREbgyEd8bS9KnNx0gakaGqAsl5wSsZAa4RTVwnPpLzlNQ3lkU2D/
	E1kR9eNiUBHOO+q9TqJ8MfeXqJFeDXMkm1zMSGPXyi/ifMN4wg6EeGwWa7eA2Rdd6An3dhRol+N
	gYTTNPE2OFbfgTBNupcaC8wW0Qm7Xu2Gb/lIQK8EYAhqftQSQZ9hljFQHLNwYr6zRb8U38F4K+q
	x4qZtt446WC8bXAi0qWjQEQ==
X-Received: by 2002:a05:6870:889a:b0:2d5:ba2d:80ed with SMTP id 586e51a60fabf-2ea96d59e8cmr998573fac.25.1749610720874;
        Tue, 10 Jun 2025 19:58:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4LXIopvC651Fqau1Q+cTSxk2H6unb6c4wixhPbQ0obvdKGm0mKSE2Y52RYW81q9xfifCs5A==
X-Received: by 2002:a05:6870:889a:b0:2d5:ba2d:80ed with SMTP id 586e51a60fabf-2ea96d59e8cmr998563fac.25.1749610720560;
        Tue, 10 Jun 2025 19:58:40 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ea85fa2cbasm478059fac.8.2025.06.10.19.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 19:58:40 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 21:58:30 -0500
Subject: [PATCH v2 3/3] soc: qcom: mdt_loader: Actually use the e_phoff
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-mdt-loader-validation-and-fixes-v2-3-f7073e9ab899@oss.qualcomm.com>
References: <20250610-mdt-loader-validation-and-fixes-v2-0-f7073e9ab899@oss.qualcomm.com>
In-Reply-To: <20250610-mdt-loader-validation-and-fixes-v2-0-f7073e9ab899@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2321;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=4U855dwdIaDRs3THDO+BKF/8/926zEfYRJi0F4N9KoY=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBoSPDc9yC0BngA/zq7XYJEQefoq4inas4po2LHv
 RFT7u85wb2JAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaEjw3BUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUpqw//dLfBpAc2XzLA1OvZY+odkbdvrrKy6Xi5RyCyTdo
 4xfxDjlbCPFJky/naVrN3EmZrfASgiptFVrmfyDaYW1xLm8E9U9FC4vPJ4yvjPF6qGDGZkLEebi
 7Ksr3FjR1uQvk0AHYEEYB2lMfW/bf7s3GgGbTDnKM4ceLA41nrhOl5Iva5hrEtau2p1ocgPf19D
 iG/Tp3+S1PSSptmEDps54cLi8yaPojY9mQJ8wmCkXd2xfuUR2aDLf2HgRYfTwf9ERbytdoLgCpA
 mUFZVfiqQrA2cqAn/tBalTjMEDXqm6x5ByJKehzKVA47AMBt15IQvq4z4IoO0EP3f9gwaHf3/yz
 upQqdiufiXWfUex3H6LE0FcCgc98qVXIcfQMSU1sxQ80Jmf4xLmwX+uWWtlE7wg+Mj6+mSXfKiN
 w8cTPvBijwkBYwiKRL/EyoH6WM49nS2tpObLoskUxa3ukFGxlKESHHmszy6h8CrS1piPp3MhL/9
 n283Gr961n98yddCzFxns/o88uCON5TZAlS24WReY+6EsxYrGOWriXVWWwUwV44Ri9ZGyMSSXt4
 B8SfxMDAajJ8+4XEVK8GLS3uL7Jyoo8udf4cYQ05Ohqd3fPxYUG0HYNGEqD693YWwrjExH+jw+l
 UptHuy+Z2iDb4i0iv8E7cPqJHJ2Ga+4i4EBlj1R3VGNs=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: wf5A_a_V3OdbuD7hVq_WcUhEFJzUY52R
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=6848f0e1 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KKqZDcqvNeJUIbkoXhUA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-ORIG-GUID: wf5A_a_V3OdbuD7hVq_WcUhEFJzUY52R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDAyNSBTYWx0ZWRfX/Y6OlSPkNlag
 ybf7+1c+ve4ZEnBdT0HphhqOC5nJIhDK8EdQeuN+yOizoAZwwMKYwKc4t3qsd0rNk4Rx/M8YKzB
 S+9k21sVevsajam7ubOPOn/ZNscrxUV+1RyU64zksXM3y8TW23i1lXnwxOF6Xdsrb9MR6F56Us6
 G6xHMPjvwkioS5YQroNGccE61HJOcfPXzPD0ikDvKLLr+QuP4CthKijWmhoXvj4/EI66xXa9P/F
 HAMpdgg7zC14iXa4BVVPNhQZFLvmsm6mUfl76JFA05Q1RZcEl+G3v737r/j6CXmY5UfP0Q8fMsS
 3K9hnTVcuzTTkuUP0byR1ZAyRStMVqFTrlNHdRHBsYyoR7F/7fhLUIjZM7iMQvwHlD9CegXLAFv
 RncPuyCqqI3wcvLa1NrQaZgfIMAb/nD+mtetoqqDJit86/cevRgWm+9zAO2fcj7ZaS22lM7H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_01,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110025

Rather than relying/assuming that the tools generating the firmware
places the program headers immediately following the ELF header, use
e_phoff as intended to find the program headers.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 52f0c8bb7c5ee9f043009a274f147128f0778151..1b4ebae458f3e0e37ce40afeaea2e0fa3568c8dd 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -117,7 +117,7 @@ ssize_t qcom_mdt_get_size(const struct firmware *fw)
 		return -EINVAL;
 
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
@@ -172,7 +172,7 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
 		return ERR_PTR(-EINVAL);
 
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	if (ehdr->e_phnum < 2)
 		return ERR_PTR(-EINVAL);
@@ -255,7 +255,7 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 		return -EINVAL;
 
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
@@ -310,7 +310,7 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_na
 	int i;
 
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		/*
@@ -355,7 +355,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 
 	is_split = qcom_mdt_bins_are_split(fw, fw_name);
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];

-- 
2.49.0

