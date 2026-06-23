Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E50C370D7B
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 10:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209143; cv=none; b=Y+6aVyQmWNbsHaZuR8RMl8wmGveJZNsMOBvGXt5qnKyuTG8CXK2HPtQ80cV4wzz2+r0LyZaUVJo3X87gVs+S4YyPHNDDNHa6G79gKahqnEXeofp3hsWuyO9gch4zcNJGInMMH5YvUtavQS2uDM5goE8IyZRJsq/3yIyLt++gorM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209143; c=relaxed/simple;
	bh=rojkdL9HdJ8xwqHtrA8vSCQ/5DQ4D7fL/dKa23jycp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ant6zmPAy/Vpo6L+aJwExLhFylT88i4MyI2biR6MoOex4izg83nPTtrIHDLk1JrgvuqzfGz8ZMXIP2rY0PevH7JYqV06KghGfhai5qj1rO7AB2poKXuBcEY55Ohf0Wa+GgELntKinM5+LTjhx9TgqGozMON3+F1ydLWsv1LVq8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=acDN/84t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DxVFnMFV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="acDN/84t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DxVFnMFV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N8UxTd3244009
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 10:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lxdruZplTQcy47X9eQcAz6WzLI22oSqo7+jwO6S1zpI=; b=acDN/84tyMJDKCqf
	NpkvDkIu4Y1yiJDtNiflg21n5w1puD/MKVS8MhcUJdEP3/ewnH3IJtP9bl0LPkxy
	tNMOslvezK81/K4MFDVCfs7wp2bsTHEjQhSOdZ2cBTE0/8OVyf9qupYe5jSsp0vQ
	4lUJwOh81CPpuZxW40vvoruA2rcOIgSFjuEPZ3CkQ62GoPZqIu/cIFNZ7cN2MCgH
	ODMzenMiSA2GA8Fsolhxy9hm091D2KdBNciS1ZSedK7INsqypLESzSjM6aS4QJY0
	WsW8W+ck4es9vOn2QVpb8jSXX3Nm5+QjfbZBkIENwIi2YkGnvdV8wyMsZDRyuhl9
	id6PMA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppyge6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 10:05:41 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137fc6f8e9fso6043175c88.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 03:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782209141; x=1782813941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxdruZplTQcy47X9eQcAz6WzLI22oSqo7+jwO6S1zpI=;
        b=DxVFnMFVl6JMR732LVQ/Yl7MFg7GtcIbs3rsh+PgrjxBkxKRi9eMK04U/CTjLC9URz
         GQKdE8nWOVBDg6D37SUzu4I2SSSfDCW9i0AHeMjxpLh+lJryJ1C7x7eSVokBCN0dlh+l
         HpFQihpq6UpKyLhgol71PUHHKtFkPiL54HctRbB49nUaKQVKRgxDxE2OwtGAE/x37euL
         Kql4bSiPkPfO/s/cgblHoTrnbwLDyrDCQAsxtbDGh/irxlkiZRB0ckyFmUWQaqkWNioU
         6OEA7fachtF1POgi6mtlaXKQIAGu4q3gH+8r+h+QwL+Pu1QLD9mA/0trnGA9p4i5azcv
         MRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209141; x=1782813941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lxdruZplTQcy47X9eQcAz6WzLI22oSqo7+jwO6S1zpI=;
        b=aBL/Yltib/QVSyhcuZ3MR3eoebd8SF1EvjEob9IN993Bhkq2fpsRdiL8gfy2PsgfNz
         ANSbGNODMA0LOvTd1lSV955L2BlZg+jIXHrvTlfDjpN4QpF9yRJ01+TH4xAa64anj2Rp
         cvpOzUoGYBOIzCJcDXIvwSiXa2jy6F4q3hrsvHqjE6dWKHKb0KBG7wBCGE1XbtLHzZLz
         5T8w2oW77/SZa0Dmo0+EL4ksowxKagEtHtQDnSqJQ1rkn/ufgGjGStQqimFS6+izcskE
         RkVBcY0dBDscH+x8uUIVUYqTMc43f7XtBJXGTsL593JGsFnvgcnQD3fOYEpdEekH5EDv
         7RvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Ykrq+5bwT7g8Go+rejnVqKix83/FdvchtJz4GTgp7U6vl/0ayfR/LKR6vZmG2kSKKhk1ZuIf59H+HhBzVuBo8@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr17W/wR7/r21z1bhz1Bdv1F2+RKNy6EGno62fc3rAbWDUe0V1
	4K7WR14gVcJuy6MRrnnRZ1kK95uOLzdOLFUVryCyWjwoetzbyrDc44s8ebtXus2PdsiOMu0ro22
	sWBDJBW4+qR9hrf79EVrBRbb0dyurjS0SX2+QZ+sz03t/met2lCWWNQWZrDJvw/nSNPFkg7ea
X-Gm-Gg: AfdE7cnHx72iCC0FCbRxHoJk+zCJwt5uGDSRwb+9+QGWD2a0CjqPjJtFHYfPeer9gpa
	MqD0zNeMXrPAnQstjzjnv6RgU91cKpND4MnR059AA8MB04uTSL+JhpOF2hGFmvIeelBxpJ01JdM
	WctGfkYeP5DqQrtOZIdAEc551BFN3suW8IvIefQn0DGV3x4r03qTBb4QbvgLKvF4iQ6mnQqO0de
	HPVDTK6EaxdIDdPWCybUXSj8Y4eXXKwIryyLujPGbe3qS+Lxre+iRnTt691X3agj2pbp6T7Eine
	0VCzVh6M9LT3fjiLEwEBy/kH+Mv/7AUrb7VINuCtuF4kC5dOnjZwhJESn2Qq968P5p6bN76gYDi
	W8/ZHfpkDLsoyilP90K86MebvrxnjwDqaZhgP/136Ug6M68XeeO6cm6TDyMn6eA==
X-Received: by 2002:a05:7022:609a:b0:138:51c:c5aa with SMTP id a92af1059eb24-139a367c994mr10792789c88.27.1782209140788;
        Tue, 23 Jun 2026 03:05:40 -0700 (PDT)
X-Received: by 2002:a05:7022:609a:b0:138:51c:c5aa with SMTP id a92af1059eb24-139a367c994mr10792750c88.27.1782209140242;
        Tue, 23 Jun 2026 03:05:40 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add5824csm11607495c88.10.2026.06.23.03.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:05:39 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 03:05:20 -0700
Subject: [PATCH v7 4/6] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Hawi and Maili SoC
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-knp-soccp-v7-4-1ec7bb5c9fec@oss.qualcomm.com>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
In-Reply-To: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782209135; l=1142;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=kVZW6MLZNlpei8K/F51SeFGWZUnYzxZeJH1Eb6nEyLY=;
 b=sJ+4ktaC4M6PlBcC3E/phsN9o/m79MIoi+upWAuG9RN/Bb5FHEfy0ywOUjLumMZTSIgMFVjtU
 jpwAFJqhHgfD0UweuaLuQcEwAJ21mNeDp5hNuTajXd20fcOcXOh6uHa
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfX/v8Ba034v1UI
 0YNGlzpOBqkO/Xm5FR3d2LpbSvM+JFrrlj7GFdkactl0w3Y6SA0iIoWeUEapLA9oXXl+qWNRQdE
 pmXZJttiKn+zN1a+82By2ElCxrllC129dlmSE64DwwMdVI7cYDgPFK31TWD/+ql0CKkCurZ9WnH
 8cfeVcDUeXb1S1tqjUnHx0xJ1i8TMq3iNoG5W/BSzwug7NPgtXZ0U8UhXMULYfZh8T0aBj5WU2+
 0+kv9Sf0/QubWlDCNNmRf9UcQGWh1tgKhKZgPu564u7hPud+5SGzTnomZ9zcjoIbBcdGdBS8Xx7
 CuoVuLv+ziAEJEZgyNniMtR7UfbjFJIO4/854r7RcSffzYvT+X6NItNqgIqVUUsy0Ksc6FnUBZ+
 QVdUusSjUUbmhmHeh+9ML8649UarMquC4hyivl6+knyeS3FXvfsLJkjL6MWT7cMBzbFgHdcqo+5
 hNUBkNLVmk/t30LKDkw==
X-Proofpoint-GUID: nkKDeswone_YIMktMjQ9fqmVPdnhoc_7
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a5a75 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hVlIsfzSNREJ4Nl6LHYA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfXzufNlK0S2cuZ
 PaI5fr2cctycM3qiZHzCJS8gVVXafSq8SRVT0INipNK9vCROO3ZWAfgl/4ueORaFNQ48+rltecN
 sJF/VkKyiiV6rZ+iPs+2hTUATqWR/VE=
X-Proofpoint-ORIG-GUID: nkKDeswone_YIMktMjQ9fqmVPdnhoc_7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230081

From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Document SoCCP remote processor used on Qualcomm Hawi and Maili SoC which
is fully compatible with Kaanapali.

Co-developed-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
index ce18460a949f..8fd6913e414d 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
@@ -21,6 +21,8 @@ properties:
       - items:
           - enum:
               - qcom,glymur-soccp-pas
+              - qcom,hawi-soccp-pas
+              - qcom,maili-soccp-pas
           - const: qcom,kaanapali-soccp-pas
       - enum:
           - qcom,kaanapali-soccp-pas

-- 
2.34.1

