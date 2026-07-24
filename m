Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D4A3D9549
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917771; cv=none; b=gWEUSFKDzQAAlLJARWYfWae2PTFPm8OCxP8wRUso3SrBMCGRS5645LSkfbtzXT0a4aOmOsMOx9biD0nOAJ2L6saX33b3aM4CAgV0CE6HnhwbRgBUDkSPA1rm0Pkw9wIpUOH/J20c7OIXFrw56FslZ7NMpQRCoX2snB1/O9bzS8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917771; c=relaxed/simple;
	bh=Rd08ZYH+g7lm0KkA458fZcsV5EcdJIBQIovcvHvcM20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OD1ysveGeb5Zd7VPtbKWZZOxXYekEZgQy6okn7xryXicxcB5dUcf73npMKaYlv8VdQat5QK49mOERhaHXyWf7CqoTr0mLcjwH1DgKdp1UwGfISXAc68muPxX12sxhjWenIs2jpodE69SpB9hecwmXhwgiiWEMK84YySRLVdEXJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H6/g7qHn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1h8wtVm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H6/g7qHn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1h8wtVm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGquih3155659
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Fa5SBdOmTAH
	7sHy3pw/Dk2Y3Rqwllq27Y/6IQIjOoqg=; b=H6/g7qHnTzKsMDWWrH+TbVECPoM
	C05ZqF+Y7DKu8pvuHwHLXJDlkT5j/WRqtQIBvLwsAhy7CJ0KQUjMZCjvvW8vLzeA
	uK+gbHVJ3KopYSGRs+KasFKhZK6xSjZkyfY123LvNnudfVDacEavanjO/qKVPIXh
	ZzlU27Cgqhkc9yPt2ybmeVdHGsH65CxQHGWi0yku77UStshovgRJDqskhY7cK3qK
	BHjI3ayFDQZT53KSQEtUBD7x/7AzeM3JVgAUbISd0yItB90AqUm2nhVUrOM3C9KB
	jOjL5k0ZaJNBsRLk3+O86vY8IUFnoLyK1cf4A5yITDTJ6TDpjSBd0+uYNcg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cgh7m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:29:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cacf17c7e0so9944285ad.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 11:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784917769; x=1785522569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fa5SBdOmTAH7sHy3pw/Dk2Y3Rqwllq27Y/6IQIjOoqg=;
        b=E1h8wtVmuUE1XnUThh9dIYiQxia9rKP6afe5fdIqCy2jcQYsCPWD2dzXDJwLhEDLFg
         2/AcgyFJKv52vFIzkcw5dhj6BIsJtRGeHVflnO6RMqoMEDwQE9lp5v+eJlfvNxnsdTau
         lvXkFqURlbno5Yvq9t53fgmJpwdM6DSC8rDAiQ1YGkJj3qXBR4ezdTa5BLIG9c484qw7
         TOuQQchQ6V98fntDHDKC4A4qIaXCthgxo7yvteraEkLfXWfjSNrcXYuIyDnX8vwDfdmE
         rXjcNJn+AwgVYE5Dw5DWbwMRN8gd6+IusntPTMW3xWsYzK7PPcCDDDr4ijyZvJDsZQXi
         8b2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784917769; x=1785522569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fa5SBdOmTAH7sHy3pw/Dk2Y3Rqwllq27Y/6IQIjOoqg=;
        b=hLT+Xz+2Zk+p0H/OAtV3LjhFyoNFV8aOMDyWqWHu3VJ7icxFOmrL8BFPaH/6tYQRkP
         MkM8IsKbyXBBMQbKkvtW9Bq1/Nw4cYoAXEQ2GdEVibnVBWTIbjD4vTGDTVMndPfle0SI
         TSynGu9OdVhxHWjbWA4eSen+fSoQwf7Jb+scjY9aM8pp62kp1xPrwoWL0UAhbex3/f7F
         Ql9JBAnUplGxpTUBtGvlDpt3W+D8gk0nw7dhYP1cZHD45sQpyKnAMFOPTdSroxXgOa+z
         AapG1vIUfG6wviAXje7OydLJayqhQX04ixwzU6kTjC6kVCkN6ZKFzU2k7uuUXNZgiw9Q
         cBwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpIyS2Wp9z4V4sHIjx3W2w2iCPwKRKZ9HbrFEQx6U+itkxJC3I5CyZex2hbYn9Pff1xdBiIMbkrREeF6nxSaGIl@vger.kernel.org
X-Gm-Message-State: AOJu0YzCnRWrDo6m3zQfdHMB72I+lqEu4mDC+jaalk+9Kk5dBsBnA1ZF
	sDNlPBTSDyVBavbFZ+srKrnS5U7XXYlPcSmB7ybSkCy2vmgngBr1vJMCovVrUmKckgx9tNZue6J
	iI++VmsjuB4D3x6nv7LJEv9pRASQqTog02hwG7ZhT+U3l6QUKbKFYdtHqe0J8N7AXnl6fs/pf
X-Gm-Gg: AR+sD12W4MvZILAFBaWgejtTQK5vwdovPhyRHJMTw5DCyJmfQRfB1QqRmBRoEuyBjmi
	zndMhTZaKaGpcqKXkkj9BUKT0afbkwomADNSlrvNEhz7V0/vsGxPnwKwSqGAedCR1w8eso0es8h
	h/oAKfTQZ3U5LZR8GNWHqgCAzAFHQXLM2YBDgn7ATwFzodRezAnJ0LPNoEsjd90koZpVSFHCDW9
	CUbpyipW0jLbn/C7Sa50DAIfQmj8I0KSVYCN67cjI8WjEEzSD4FlbEL59AiwxQ5orAiFb6Ps2Z9
	Vxdd/cDQxWZhXmOUsO8P6mBo/QAOL+A2CAUXn0VqbtOYf5SjMtw9vfgIx9jo3I4MqMQzsUmFS9e
	jhz6HRHD4YPFx2+XKIyHEX5OZcXQ=
X-Received: by 2002:a17:902:f642:b0:2c9:c517:d078 with SMTP id d9443c01a7336-2cfa6c7884bmr95900475ad.36.1784917769480;
        Fri, 24 Jul 2026 11:29:29 -0700 (PDT)
X-Received: by 2002:a17:902:f642:b0:2c9:c517:d078 with SMTP id d9443c01a7336-2cfa6c7884bmr95900235ad.36.1784917769035;
        Fri, 24 Jul 2026 11:29:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5c53f3sm1341510eec.30.2026.07.24.11.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:29:28 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 5/6] remoteproc: qcom: pas: Drop unused dtb_mem_region field
Date: Fri, 24 Jul 2026 23:58:57 +0530
Message-ID: <20260724182858.1868271-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724182858.1868271-1-mukesh.ojha@oss.qualcomm.com>
References: <20260724182858.1868271-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JOMLdcKb c=1 sm=1 tr=0 ts=6a63af0a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Lqr_36QtIFBVL_bOULEA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: nNIPHVZpNAl3fVhrfHm4KI-Q2SCNyRwi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE2NiBTYWx0ZWRfXz6/xAf2wvK5F
 QodnGhUi+pr1cXpCOZnTLj2Czx87A43n8bqfYwruUcxL9i5wZj6RUvK5lNqfqgqE/LMLmv/j7h2
 QRiIFRYHZvE/yaVIcCH/oieSW9ra04M=
X-Proofpoint-GUID: nNIPHVZpNAl3fVhrfHm4KI-Q2SCNyRwi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE2NiBTYWx0ZWRfXyM9dKCuxN7G7
 BGErLFsSmtNMSMJKKyolGG3VJl7XcpStwTiz/AaW/TaIMNcTPl4AJhewrIx+e0T6/PowOF8jmKH
 JzNb8KG5L2JGZkOxj9uff3D4rhNjH8VSBZ/RxUEr+FuR3qBUPnJjHymL3OE7As6ZJZBif9V9Y6/
 6wzL75nB9lIss3dCbgLN4V6WKrk7nGTsueBfItcWc05Dtl5Gjrk1ySmlycrveisqMGFbRTaPfaU
 dgZfjlZluJ37kW56Gv2a7iOP2JTa/m/T0mxuGmn5YleWzzga4l8kLD7pCnnV7T8S1P8vDSbc+4B
 TEmZbZbqiFqyU87X/nZezcTJQZCoK2EghlDl/A1wW0XGXLIucgF/+6g/YLv7aWkeRvJHkcNok2C
 ioFWiL9olvYfn6kvbFJkZqcFjhAKPo55pJrOokte1VJ9oWZip95GCnvnFhgW7xI2GKCFD6tVwtT
 BXzUEAomudpNVWjOaQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240166

dtb_mem_region is no longer referenced after the ioremap was moved
to respective places where mapping is required. Remove it from
struct qcom_pas.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 5cd34086ccac..0391e30f42ba 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -101,8 +101,9 @@ struct qcom_pas {
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

