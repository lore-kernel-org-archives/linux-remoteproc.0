Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246CC4483BE
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2026 12:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031886; cv=none; b=Uw/aCQDNLFlAvqXQqCOFVH4/Am5wNY0jtwy7yokDlrclwkgQZkBwGTBJK/gGPXPVLsekh/AZmxwH/b3jy7AyY//MaFaOz/KnG4j0X5QgMVinCd6UTuvi9eTkpEJxwY2vjJz76j3JuCN1/rjdEMLjyqUDSa/SZPCzD35xo3NEEOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031886; c=relaxed/simple;
	bh=Sn39nASDOcdWm18LnDCxP8IPtZOVGBBqWB9HUJARVzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WRcWqR/CCUjJkLF+/Yx0ByO85c6ipkc2JHqN+ec9DVX6TifnRJuWFwqVXLvwimXZZqnTqwK7sl8EJPBn4aQNkNUxTbpZhZJ5+rNQ8vwZEsMQ2L4ybhsKycvPD0mAIdnajdAXM7uClvfjtrnQC8HkRxxnjQnX4HltELDS1YkshVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nozmJ6Ev; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dHVYUAzX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nozmJ6Ev";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dHVYUAzX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBNsN7403461
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2026 12:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8+NO4UWz4w4jtTkeYxujP9Ux7n5NsoAtX1Qkh4gu9Lk=; b=nozmJ6Ev5vj77I6j
	av1Oq0ujJbt0K1rYntjh+tJEeth0fYEpiBmuMU1oVmAhy7vUWc2+OKD42ejSa9ZV
	KjlHaNjIUidYTw4P9JWxVvf2TQ+u6zlbO9XJkf4FYZd5gwayViEz4NZgnPXn1c7i
	A3Wvbdvp86bQuynnfkXZAewsBL7MA4Rt/Wvg/yciIN7no6lt+ZDumt35+fMu/Zxl
	LJZSVCyOEKc2qoIfyOgjzk/kXeGr02wz9cMlimdqlkCRNKkq3Clbf9QWmfqktma1
	XHiU2A+/NOC5u7RZG07ZX5QEuqiEYaH9TDmRi5W4Ko5mn6zhdarScwEvsbmjIp/a
	w1liXg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdeu4hjt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2026 12:24:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8e934385db1so76187726d6.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2026 05:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784031857; x=1784636657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8+NO4UWz4w4jtTkeYxujP9Ux7n5NsoAtX1Qkh4gu9Lk=;
        b=dHVYUAzXoxm16sgx/ZZZ63YjWoIVvrnSvg2ED2isZj1L/T5UdRQNgpHruR4+v+M/np
         6h0fIo9/VW50HVA8NlOph18drjG1eV6rklCr5QRNAwvtC4zVdjCPX4IdSP2wtc/+ZcW1
         AEK/H6D/5JlYHNkuK6YUnhQMStjXZUu8mCUbSj93V3ZUBEPYRQT/KX39Rz2XDHM2/JB9
         pszVBrkSZz1HPdnYmQy3p8Tbjxr0zizeNI0kVODj0d/5JkDja41N6v9+8IxtwJaGGlte
         JS5U/TECdfVal1i+fdFkR3SGZJwl40LolKQ805eHTuxIhEkbevKlW1EUhe3XUm/okCpd
         hNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031857; x=1784636657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+NO4UWz4w4jtTkeYxujP9Ux7n5NsoAtX1Qkh4gu9Lk=;
        b=m4f6nB93miEO7yPLHc/obHhIJpUbrkOkbu66DR9BHQQiyF/ni5xqGhP+hs4nXQAxsE
         Xk9boMEGojlAb98uFlLMzqSlSFWxXzXHUBotrmRvUfqiVXA468wLocG35vYg+GIJvCF1
         GiJMXummHyRKx1jlikiM18hYPs9RjFPPY1zTzGNl0bAeKK9ikW9PCWBzrMMbaKLfk4aP
         w/mTLqjnwHGtIXsgg3FTQ9+nFy3Nt9r1WOI6Vg4j/IZeYcCMPO8LhPnpUqTeaYF63HB7
         kbhbk+Teg3WHVV1TCYgcPC8NtRkUMzs1EG3ot8C++LrIfheICw9kQFAXEzqJjJSE3NbD
         YKLA==
X-Forwarded-Encrypted: i=1; AHgh+RoYkhjjG3ZzjXDPXqwNYq5JDaQBxnHmbpXpL7RiQE96RymXLZ6lRO6ejlB53DM5fTOxNu/TIEsuW1R7VsxQ9LS1@vger.kernel.org
X-Gm-Message-State: AOJu0YxMXny3bhey3p3fhjFDIKiHAWhglsP34TSPNPPtgp2dcgD3/aZm
	gfGIY3XGgU74BeXObsGurH6YoHnVDAOhg3ogU6rlKKv+8eH2ZKM3ei8jiqg7ZcsMtPT3fKhHxOI
	SgcBCr3qFt27deoBz6MU/OD7cygAbPn/qFNJbZBoOZwUgC2dlKyLbosFyWXyWfy6itd5KwmHZ
X-Gm-Gg: AfdE7cnff5nZBLOAcSgFkQ9Nan3gzuTbbkhipXuHDReNsPCn5tikIIN6bWffM36tRg1
	LaLKktroxEm0bgMMtLoeeY9uXIwEmP5lLZcvBRlLlLpVO9ZJ723vufMbK2uuMj92wNBaUw70b+H
	Xl3bo1ieJJOLwkeOGBCbesGIt/pAwVL8QTirE6yynZ6qsLXsqPSfju4vBAjWUgsMNgyK67LQ9nw
	NlokGvN33yVluqhsx7FUoQdt+fIjQSdZVWh0GjfSQTyJSRNKjckMAPzQxdV8He1G6Od5lGD0GXZ
	1U5KtzSPP2z4WHvYH1G7TScX6psCwc+wkX1qzst4AWhsnMmFUKVa2XYz5QA8Iek5N3RT5JD68l5
	eWDh2O3XqtNqR6Zw=
X-Received: by 2002:a05:622a:22a4:b0:51c:241f:a6ef with SMTP id d75a77b69052e-51e3c33bda6mr32276451cf.70.1784031857464;
        Tue, 14 Jul 2026 05:24:17 -0700 (PDT)
X-Received: by 2002:a05:622a:22a4:b0:51c:241f:a6ef with SMTP id d75a77b69052e-51e3c33bda6mr32276041cf.70.1784031856856;
        Tue, 14 Jul 2026 05:24:16 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f951asm77031845e9.14.2026.07.14.05.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:24:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:24:02 +0300
Subject: [PATCH 2/2] remoteproc: qcom: pas: Add Eliza CDSP support
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-remoteproc-eliza-cdsp-v1-2-32eb7a1f2c59@oss.qualcomm.com>
References: <20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com>
In-Reply-To: <20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1733;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Sn39nASDOcdWm18LnDCxP8IPtZOVGBBqWB9HUJARVzQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqVipoYq1P6o3aQNAnpMdgHCQ7V+8ecxfIkoeDA
 /7Pk1M5hHSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCalYqaAAKCRAbX0TJAJUV
 Vvm+EACGcF0d44c+WyqiJLE7Zw3TAj/WFCxjg04TRKwznwyLomnBhcq+2Q41KBGzs+afiH+Cf2y
 MFroc0GFNvYFA+ojzawX556jI7TSBlQVKasb9CgsxsQ8jj5sh5vcX7G18zzUWW/UjP5CytS2qtH
 rcShZpJhHqQbCHaJSgcafsG8JfpBkVnK2FdiSu+anyQez9xo4J7AFkPyFxrtOnTeGLfF03mZziR
 pXGJ/0inkPlZb1eQixJ0qmflir1P74k61NupGtAkHF+AVbJlwmtSQFjvpNLBF7lFfZXRYUo7rsu
 9LvDCHT7z/5o49Ns33F8QuUM60sh5UvJ7hWgsPuYyJ2QOGMTo+ABUcbjowY54bC6eyZAlOxUFJB
 cNnvzQl7O7s/dvV7XmMipyMlINgT/9h78O1pnTH4Ex5WQVPtKg7IoRgMZU3QrhgM8XeoyUVX10f
 Y/G1PA8vN4N5sjJ2s0bvm1HfArY9rRN4XZe4oBVixiuj4BmpESuSss7iXWnRgYC+vV0X4guulQj
 llvqm5JgA2ToSjAFOmiLaC2fxdLsw8tdcXYKlKrMhm+yimsfAtLnYR6iUfl8rKU3kh1kwtEyK+c
 6/BrxmHHAw5Ze+XeJSIDYX605rKbpgfWnNEIxFLkNJ4gYbfd/uEAoaejHGUAL+elVN0ju++uztV
 WnwK7i6Mz5jiOWQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: bNX6G7ivaHHhha6oiJ95K3TUah9eZ4M3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEyOSBTYWx0ZWRfX0hP6QgDztDP2
 gxsZS2kM7mC2O3a7cIjwtlTGUJKT/ExPx5k4Xnb0xk5j52hYzNtXtz4mNZq/J/t9t/J9aqvi4eZ
 QPbVEAzP22pfdWCShL0MG6hxDGPhtgrbcJbpqo4klBSFRB17nPEmrS18A//mUORE5Y0U7wFFoPj
 YJ74gO+ZBfQ5s2u4zrMih8ZKcDW6cUQKit1nTEXQQ5eTNaJPyFXvW/hL2HObA6gZINaF5k7Li8P
 Zx73cg3dtV54pbzW8uJG4JfLnPOXJAt3qq3B/g3kxXkt4wCRFg1Qz3beA+/sz3SqyTJiL9CTjjR
 eX4Bi6TtZQ2501MnNM6FjQcT46mgZubGEKAgiiaqftclj9WtAe+yIhGSWiDqszgCCrPb+DqQ6PO
 PqhTx/OpBBQ89i5+0zVM07rTEjv4JfOIf11EkAT1D7PO0M7swZ2I/QcA9MzcaoxU3CNtZAuraWw
 DWkbpVFR+fsM7R5Xx0Q==
X-Proofpoint-GUID: bNX6G7ivaHHhha6oiJ95K3TUah9eZ4M3
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a562a72 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=yW1A7ns81NOMPIjzjlIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEyOSBTYWx0ZWRfX5/6FTBheGOgb
 803wdVvdPF7UL60dUZYF0o6HwjapPI5JxcsVWSZNuywYrNQkE6ZlRlMWSt8+N53VZBjCwva6r+x
 xHBjJn3pFU5SxO8q6RzYWONmi3De4BU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140129

Add dedicated driver data for the Eliza CDSP remote processor. It looks
almost the same as for Milos, except Eliza needs region assign.
Tie the new driver data to the Eliza specific compatible.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 25599d728208..c8313c61da94 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1687,8 +1687,34 @@ static const struct qcom_pas_data glymur_soccp_resource = {
 	.needs_tzmem = true,
 };
 
+static const struct qcom_pas_data eliza_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mbn",
+	.dtb_firmware_name = "cdsp_dtb.mbn",
+	.pas_id = 18,
+	.dtb_pas_id = 0x25,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
+	.region_assign_idx = 2,
+	.region_assign_count = 1,
+	.region_assign_shared = true,
+	.region_assign_vmid = QCOM_SCM_VMID_CDSP,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
+	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
 	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },

-- 
2.54.0

