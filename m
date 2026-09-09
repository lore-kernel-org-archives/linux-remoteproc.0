Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E970530DF0
	for <linux-remoteproc@vger.kernel.org>; Wed,  9 Sep 2026 10:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788951074; cv=none; b=A6BrXY37KFmbTDeQYuWgTaTd+9v1/QanUDLZ9nz6z1YXifZqyWd1hIOrKTTDD5bAJzEYzVrbMrG5h6g2oqsfCjv6p3fPBzXvtCCZlAO10BI0aXuLcO/p8aLuEYiUVFcIH3vN3vAG4Ue7LH2qbeKv0luLMVlaJjaRrLypBAl+oKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788951074; c=relaxed/simple;
	bh=2uL+BEbJFI0aZgxBFxpVYgInsl6ywz9PoGcVsUCsRUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pOii7O8rfeDK8d/MHJCqCY8Qjv1VOacWtYadII6IgTh5OZVV/Mo0C3KSWmltIUsVnIgEUZqRBcfDUhci/XGcm0ZySEDpIPN310gWogNh/F9Vbm4AU/pLXhTsBiV+P1WNTAe8RxDq8fj1fi/TUjuc6dV/AfSU/5fFaAytKX6fXjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B3YIB9F2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJqFJ9W6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B3YIB9F2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cJqFJ9W6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689ASKLi2517645
	for <linux-remoteproc@vger.kernel.org>; Wed, 9 Sep 2026 10:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fkauJ7thgLh
	tosPxn69++tv1mpgFbiKGw88ZWJVXATk=; b=B3YIB9F2cwfqdb0DywFGJt3kkqm
	BSUMZAlr53vtV2g9tG8FcGSVW9SdMPbpMcwcvB0tun6fKvHDOzsSCkpxM7Mfsw/s
	Q1cqEmrM0lxfIaFilfIFRiQj2rNaK5XnozToCf+S5SAI1VuEjCk+bCidVPNUa4gZ
	tCUsUmojBiOGjtLv16wZeBS+I6CkZreJavg7WSAF1qJdRL2FQYOF6wYDv2KTcV77
	kFo2nW86cdYZ8pUW1+75lIY83RWg05s14CWEXvV7IpCUZKTMCEJx6Dk8toEz7K7m
	Vf4wDFI2IODKN1MtD47cA1aOZaKoE/D8DIy2Vqv/a2Ti4nLbqD4S4SVtIcw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqha3myg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 09 Sep 2026 10:51:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc132709c76so7848294a12.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 09 Sep 2026 03:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788951071; x=1789555871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkauJ7thgLhtosPxn69++tv1mpgFbiKGw88ZWJVXATk=;
        b=cJqFJ9W6wCuCDvnKD+PhwwHvLjgjV5Gjk/qCkBK+rA995tobUkovs2hEdZYCdmBYWJ
         BwV7euwQJ4L7LPCp8JsAzdQ66A4Lsnrm9uNi4K8eneMZxN4XtBMQ3fMqi2LuXBObD6h6
         SI9utvlGdLTzSqX84gCO3976Bw0sYup0Yjzg+vtg8hMA+IRRB7kfIB6e4bXoF8q8CSsG
         xWkRKbrTYXqL6eaUjKBiDdlJjzB+UEY77afyjzmwanNak4EyrlUuGD30SziKVLpUJw0y
         KG5GquAlXPq13UYphFhtzBFNqV0erN09JLkyqpKmv+6b9rS1Sbo18jXfrqtBYpuOZmNz
         r6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788951071; x=1789555871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fkauJ7thgLhtosPxn69++tv1mpgFbiKGw88ZWJVXATk=;
        b=hDQft98e3CHsufTvdvDff61jtbVZvcFamB7ZMGweaXlM5NzdDgivNbJ1GMok8wpv5T
         17LQ4mEWRZ73GvnLk9CYul1l0zPLNn46IFNt3eEQvmOS/KIDiyLH8urCj5aF9FqvmOMs
         XFQkqRyx/ik04ju/wNA2OGKesLHXB0GkAPalPmJwZY9mQ1ocZH9Yq/imf5+Dwtg6Nllb
         cFY+n7mvrAzb38jG2iP7FeehrpjMLNOb/XqHORVO1QH3vkJDf2hCB8XjrK0gPOVt2An8
         YqzoYPK3hEDlkTDhF0o8YeUL6PxUqRqkVvbQzgCZCff+gI4NcsdW2tMiUQl+74U4RyuW
         80PQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVz1VJL16bsL4iIuCV9PmxbmPoQs9eiUcp9YTNhJJjGjddH4eef63dLktchPghlcCZEfkv0MCnoAYaPgE7Hl4a@vger.kernel.org
X-Gm-Message-State: AFuF++lms4PuliUqaaqzoD961wl5LcpWPTLHozLyEDir6gM9+R8BrQnZ
	+2kQxv1tQBWT+jTOg/eBHSQoAurSQGq8IAtq6Voa+Cxzk4l3WHGmNWrrg1yENcOsQxXHX8EP6kE
	i/2Py0oevBQ4OpPIwS0U/GLwhaVaH59R/yLJ88m7PT6CeTD7T1Wbq/0Qsrnok9YKzGLPFYdsv
X-Gm-Gg: AYBFou3JydW2vzW8j0FI1XY42DIoSrQglE5Uvk7ljDK9czPnNk6uQIshDwoONiBfW/O
	pFkPBueO5IYaWJ+AhXQPVEDmrtFl081Z//Omj6l26NGwmtjnb8YbtmjPCUU3wRCbUJSHzqtcgnT
	5VfbBIn8oBidbkqguxw7+ZTgq7Xx9MtUtIfGAZLBSK0Y4S3Xp5UkNSUVXrR8mldJ/N6e1JOVFj3
	3kwn7VSHV7aoY6mKqBX8pOUcgDnW2ZdQpXydi4OWb9JEnJiNDbHgBLcgw+8m3DRex9LUZfTdDyQ
	IU2E/TEnudDPQ7QWEgsg5Q+0sH/RWpcDjVV5WVWPL8ph46If+P/ORYNyCWfSjIpup0LdFYzzddi
	jvjiKx8sFkBq45EbIUnPtz7JJGho=
X-Received: by 2002:a05:6a21:329a:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3dacbef08d3mr484691637.17.1788951070780;
        Wed, 09 Sep 2026 03:51:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:329a:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3dacbef08d3mr484629637.17.1788951070277;
        Wed, 09 Sep 2026 03:51:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434bb7d71fsm12084678c88.15.2026.09.09.03.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:51:09 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 1/3] remoteproc: qcom_q6v5_pas: propagate dev_pm_genpd_set_performance_state() errors
Date: Wed,  9 Sep 2026 16:20:47 +0530
Message-ID: <20260909105049.1317985-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
References: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyMCBTYWx0ZWRfX3lmBqLShszux
 /wBNXBaTtV9kk0SM+HgVhOq86OeyhvXPutaiNTpci1FXmsEyOy03mRac2kD+30utNCZfTYlPWwp
 reyU+DZomw7Eghn+V/ObaWuVALh6dOOPhzQ6/qYbQZLjpm7DSQjCwPHffDvcgf4+fk1R6vAiYFP
 F7WFJ02gSlenEoYSCR6C2aZNrbUBQDfUlv5sx8g1KZ/qRli1E9Clm35pSzvB6qi+r4ko/lagTT2
 n1cJJIqnRhtPCw75iyxDhke2QHV6jYlXLK0GWlXWqyTMA3HmMAFhb3v4R5Tl72poKT/EEnAU3jg
 OJZrBROYMk4CMwU0MHhjbSW2oHPlEafneUCsh2foHJ+rTHt59oFBRTFe/A8lQzjTgXF4sd7FJd2
 /4sEU9z/7bfYii474mKP83bw85D4gMHvK3Gl0iz6P1gNqD9DUuphfCnTDIYo6tbG0COlJVTi6iY
 maDdwOoAUcHqFs9jwxg==
X-Authority-Analysis: v=2.4 cv=Z5Xc2nRA c=1 sm=1 tr=0 ts=6aa13a1f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=l42t8P_hCmqpnny7Gc0A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: euMhoqlq0EXbQCC9qkn_uyVTah2yJPvO
X-Proofpoint-ORIG-GUID: euMhoqlq0EXbQCC9qkn_uyVTah2yJPvO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyMCBTYWx0ZWRfXwhm6g0weDM7V
 LiBY1zp0szTLze0ble7GdE4pE6HQIJlkJg2nlfawIz6BsVIxA82ZGaaI5JxFD5Sx5WyIV1FAZwk
 T81Cl6AK5Ymus17tydWGwIWmHVMYc98=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090120

The proxy power domain enable path discards the return value of
dev_pm_genpd_set_performance_state(), masking failures silently.
When the call fails the performance state is not applied, yet
firmware load proceeds without any indication of the problem.

Capture the return value and bail out on failure, unwinding any
previously voted proxy PDs via the existing unroll path. A proxy
performance state failure indicates that the requested OPP is not
supported by the underlying power domain; continuing would leave
the remoteproc running with an unconfigured voltage/frequency
vote, so treat it as fatal.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a005546c265d..c163e66347f8 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -167,7 +167,13 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
 	int i;
 
 	for (i = 0; i < pd_count; i++) {
-		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
+		ret = dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
+		if (ret) {
+			dev_err(pas->dev,
+				"failed to set proxy PD %d state %u: %d\n",
+				i, INT_MAX, ret);
+			goto unroll_pd_votes;
+		}
 		ret = pm_runtime_get_sync(pds[i]);
 		if (ret < 0) {
 			pm_runtime_put_noidle(pds[i]);
-- 
2.55.0

