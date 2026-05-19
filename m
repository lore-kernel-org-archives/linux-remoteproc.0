Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F025E3D3CFB
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175474; cv=none; b=Z0E+rch4FRVYgN6kOja356MjlpET64CJth04AUaN9JJ0AyUxsSd/x/y5BvMjri7ulxQa0CE5ZYet+Y9rvEoMBmXBDJ41qRw27u0gCYOi1TQtFC0eFG8BjSKzt4o7CmNVOj+RJw9n0i9G5a8rCU+ZWN9m1iZET87xwig9/Ixq0rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175474; c=relaxed/simple;
	bh=zUZR7DaV9Z1gqckkghR4I+LB/NET6dfTlAYiLQbReIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hGpbp1TmAAgKcBm1VVD/2pQIIiyWOtV9rvSo1h3xsNOl3VFH/xmyb2MXcwcUUet8lGciKvgPv73+KhOFlnmvuElKfsTDPFuhAGV7PNt7NUaWpzmivRpqE1gTqLG0vf7H4JezUUsCcNTOXc+IT4ug8RJDjjfVx0/HkHJNp4T4Dww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PIVqtZic; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WIm8oqoW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PIVqtZic";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WIm8oqoW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J1RYDX1146406
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KgZbprcQ0e6itNT2rwaK3othW4Yy4NP2EPKOBD18VBc=; b=PIVqtZicrFvCthW5
	l4kC8+sj00JQbPYOP5F0O7E09q5yr9gJ3id5qVUMv/Mf8RKB1UL2yDdSQnUAsPak
	Zy29MOJdNUiki+k5PrvfgMIOB/W2VMNGpmRd43TF39lPM76tU51bI6IeT9vF3aLt
	qvuNgDiNKICYAbAvDkc3LaFRkx/l3wABAY18daV/DofIqmRq+SBxj45D0SfKdjGV
	WWxGdQOQAT5PE00h4grycHSeJas1zFla04NmPTlqxwmxan06m39OAtcI6KwLdkXS
	mosv8U2CFwG1JCgXLmaqfJlzh2QoP+DJsGyAeurUSb/GQNt4yCobOiFij9bMeWrW
	16qCHg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8e7eh6x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:24:31 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1353bfdbf99so3566310c88.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 00:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175471; x=1779780271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KgZbprcQ0e6itNT2rwaK3othW4Yy4NP2EPKOBD18VBc=;
        b=WIm8oqoWoVEZu3R1BSlOKsyinIgN24CBlAJKOnnbr+DB5/y+mOHFzT1+ye9HfiIXtV
         ceS5+2x7yAsn8qvQcpVuihGAwTqSA6VtrOsCa6Hh901UFUzuYM7owTUrUnyNPYuCvb8V
         gakhB+czWwfqW6g8FGsGyd2UWdNEOW3leqRKPBsRi8El5qvSn8RcI+BMQF8Cm1p9O4oN
         8Rx8tXLdbHeMbj9ZRdazF1Fv/UIk9VHbKoRdlC62IWP78EB2OvxpCl5GJtEroBuSHhav
         xjMWmpu4CFMEDOz3/cArZHMPG1hGfEcBAWjsM6kNH38uzMYxGZflJV9KLL3Z2UUB2ryU
         wnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175471; x=1779780271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KgZbprcQ0e6itNT2rwaK3othW4Yy4NP2EPKOBD18VBc=;
        b=L07wzHyU2SQGIB3SmCJ1gxbrp8yyNARspAiRU55dJYTimwzeKNf3AdLgw4/nIGlGok
         hq0MPUb6oXB9f3PUT+4mYUWGKNJZEtzdTO9aCMmicohlIji4frOGNMEqD1PFR4ScQKZ4
         uZ1QRKTtkcTfliniBJzwuCRweSJmVu8ogwLZNYsvx/R6ofQMeqv5zrDoVuhzVlclVpt0
         7cdEamtWlucTah1wlwJCtLNrrsGc0IfWHOGrDc//S+PZUTZjnCNB3QTjxcHWF8Hzyfvx
         0mwGtYAn9KTgz/tzmTVrPntM7XPC+HGmyZh+IuTQFUkrDKAuirbiSROSUCWAYV2L5AVF
         C1EA==
X-Forwarded-Encrypted: i=1; AFNElJ+00tr71M9Gsw7niHGZG/EmbjCrEiIan0dTBkhmEUN+v17tE96ff6wGzgVDVA0Np8KTDJM1+bT1wKL6RawILD4x@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6TaIjA82cCywZIog0cTd7lZLRfTZYHYM7GXRb3C+9lPDO1iIR
	NsHItPT4knpFifDoNeghbS1rcEip1XslcSOx7M9sFC8gacxHcUy2aQ+1PNmJfPjs59vC4cgnEmd
	WS0vq6j40qvwbZnC2BdMcTsj+Eql+YAqGdWr8PDGbYi5o5mBpo3V77mjNcMRT5RBkNz5s3QQ1
X-Gm-Gg: Acq92OHLnFR1bVZGf2eEK60yABRelmSLQ6iikPxbzlON3l8rO4AvV9GDGxjVUVFqK+d
	Qi8HYlAGDIH9go7hscbFcNEAZLTA076DulUuQHyJYQZh6Fp+k4HPr47ThsBHlsMfHHx+m0Bg6dj
	/aiTpM0CRfpb6JQAsue6D14ihCDpGNuXKnDD8GRjGZDu12CbidFR7+Oi+xONvqd1TmJHupuJN0N
	KrF9WnkZyjEc3jS2w1Gw6ILxvDnl7V2aXoK6UsEavteg0l9fkT7CvfF/geJvXk20JALO3itgKTG
	LOn9Zi/ksV1SkbUARKFa1rraEnMLeyF8YgIOTwwfQkrAcqjRfvhslDpEDVraf2eFBtpFYTEiRkv
	RQmDDKBXvhf9EurgWC/9eab/8oqTYBudQQR/sSxl6P2gZWJzMpO+OVpaiKVh8vG8BPYXLIM2M
X-Received: by 2002:a05:7022:40d:b0:12d:de3e:cc02 with SMTP id a92af1059eb24-13504a53ff1mr8182732c88.41.1779175470722;
        Tue, 19 May 2026 00:24:30 -0700 (PDT)
X-Received: by 2002:a05:7022:40d:b0:12d:de3e:cc02 with SMTP id a92af1059eb24-13504a53ff1mr8182706c88.41.1779175470216;
        Tue, 19 May 2026 00:24:30 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm23337779c88.7.2026.05.19.00.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:24:29 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 19 May 2026 00:24:22 -0700
Subject: [PATCH v6 4/6] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Hawi SoC
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-knp-soccp-v6-4-cf5d0e194b5f@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
In-Reply-To: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779175464; l=967;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Z9lh+zI7bk0b+Sujah/Bvi+pWI96/tEBHS7dOgWjLWE=;
 b=q2LKoAAiPBX7FjVBywQROb2+56qKeN7S5lgvFQg41VeThz/67DPW9oOPB0J1UWkdIfNCjPk62
 AskkSQXXmi+DMaTkY5wp9b8LU+zNVkaI+p6bmyVlS/nkYNsIIhA5u3w
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=Rt316imK c=1 sm=1 tr=0 ts=6a0c102f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hXvcgRDSK2Dw3lFIK20A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: bqFD5xi80cAOIR9TPJJt0OOLZzyzly6n
X-Proofpoint-GUID: bqFD5xi80cAOIR9TPJJt0OOLZzyzly6n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MSBTYWx0ZWRfX8BYiuqdwMNbR
 TB7HdEXGbmIIsggtDa2ghRtCMCsDrVrWVC1bhw62o031izwrOelL4ESh5S5Cb+1qoNaIyaLhtoJ
 BNYsGtuy2RSXgPTxCgE5LMiopjWi0QFDmJv9mdnvKAAVMyHYUDSKsrD4KUuGAbjx2+yLXPikNJv
 4gCt9dRqW1E9RsciPngsHFoT5F8PmY4PvUH4jj6Qk5nLS7HdvbPxrvp7O/JypQG4kddvHyt8MfZ
 96R+br93lju8AQahJshhHga1RfDX95usKuMTj0+WmMFD+bco7fNfKLYY4x1yV2EcmlBYI26UVJt
 DD5Pd9IghOMREOR5ATNtFDxQfXK4EC4MZaeXvaT6LbVj1gQV/Iii//tiSHzW+3x9NjYwmTWeJ/Y
 BXTRuZzKCM1xYsBffROQtpRaxpl+/6k4aj1NGwE+UuG3Uvbz/aahXH0J4CBBfIUC87U7B1zME/T
 CrhCl9nzSiYFonHLiRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190071

From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Document SoCCP remote processor used on Hawi SoC which is fully
compatible with Kaanapali.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
index ce18460a949f..d3b525ff2f5f 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
@@ -21,6 +21,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-soccp-pas
+              - qcom,hawi-soccp-pas
           - const: qcom,kaanapali-soccp-pas
       - enum:
           - qcom,kaanapali-soccp-pas

-- 
2.34.1

