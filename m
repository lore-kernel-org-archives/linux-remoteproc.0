Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88FF324B0C
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 09:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766481265; cv=none; b=iHIEz7AEY/JqDiCPqmRW6y2pSkx/5FUM89EuC/NL/v4k9TGTO49Xg3f8E2J01zZnxIxwRXhejUNebprWi4fsRKcmlqjedkOmgBji67OkBYqhaZEkPedtsvYP+pYgYgCBRmcztVaqBbqYEAQzRrQ1d2IEv9gGpZWnE5Byf9ceqC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766481265; c=relaxed/simple;
	bh=Y6jOHq4W1u2qm06T2h+sJqsZsHdgNBpFta4hr0KK6gE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ermH0UNXCIyYi24P8HoMMl6MXbdNNhwLLGGcCTryIitkhkOqr9vufJmoUW4kjP8gPAbJbtcnCVWJLEKesvMM3W7StOAAEcdJm8vASeo41mTxWLUwLAh40MRrT6YO/ys43E9lGugiErxcS/5KpXk8/6CncQm8VVZKSQpq9bkFq4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nP60/UFt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IYRNutQB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nP60/UFt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IYRNutQB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN6uMFA1630677
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 09:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ei7mDZ2q3MlVYEacUwJ85Fk1uHEmR1bOQjZfe39rkRc=; b=nP60/UFtkw9yRrNk
	Y9ECioRL3azvpMJWndtSn6ger9EGibzWQAT7sZQO7/m1Y5+qLhG2ExK+Fdu3kHmM
	pTlPL3wJMhujnCEKnbGgZohrQWrmnCvT8iq3VpF0JTA3e69acKcUof/xda9t06Qc
	eDG691XNSwXlS5dUNYAHNM017HRAjQ/xTpXs4oIo6cOjj3c/s/Azp+jeW3ObPzJP
	Gi3VO2euPU4ed3rBoMyIS4UPt9ii7E87Io0hKkU5etwXe+6LzMDMsL6GKz9YYwEe
	AmzHaR2QA+2G6xxQkT4k5IvU9y8hKREK05EJC6ZyNzzGjfhyfBwuvsNRmD7haWFI
	L+42Ag==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7ck8j3vp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 09:14:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso4746866a12.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 01:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766481260; x=1767086060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ei7mDZ2q3MlVYEacUwJ85Fk1uHEmR1bOQjZfe39rkRc=;
        b=IYRNutQBw240YKCnevtiorS6TPMlnjGhn5P50IZAeqQwintyDBiWcBC2LQUE3lsyjd
         Flpoif4y737bzQKj0gCrGy/56l2B7Yq4Vul311KIkXsEOp49B8X/OZaKH650U7jraEuW
         4OnYqy7o5SrZyJOfQipo1m2x2Qo4dCG9kH0SR3jhEVuv9dPSKSxXnOUBKKEV4wcvVcL0
         h5xbUSDwTQmWcebQup9u78mZ5FSODa3utkWd5Y0VmtmNORtN05pwj05VabcKobfbUqQB
         cllocYkPHfgZDCQ9wKe25Ok+Ev9yZZ2Zcd0b+NuusOhmfvwg/eVP5nszO9vPDHETtXt8
         cNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766481260; x=1767086060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ei7mDZ2q3MlVYEacUwJ85Fk1uHEmR1bOQjZfe39rkRc=;
        b=sl2upWSSVSIwONnB4+c4bVS6D3iWLOolZvE0eTpuiPZNRX9hYx3NnKjPs4XSkzpgom
         /+TXa7ESbPhaNT3wVW+zcbWRjtrpSHs2Bn+IaE/t5wjZ+Hb518rEbSb/spFe86uZ6Ffv
         qisoK4Vzy4XHi5KpnRyP0TkcIZ9lmQa/uyaRO8CguZQa5Dh/YCQKUg6tCe93ekF4E0qe
         upPkOU7FUtZylSuMQAHydJ/iqY5C8J6cr28oNl0iM8Fc90Zu9H1e9k++9+oqAmcs3eKu
         +utGcHTXJ0qwpmmHCDX2QLUAwfibpUTSv5iqRlLKvjaq74u+QfNNG1wtqLb0bPtNRVHi
         STiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcYH0vZ9IXwGZtDvuLV5F8EaZgS9Y4VmZ5HZnL7QWauPra7vMFth1vDAcZ0Ldv3QmLo4/kbP7Y9JLNdmvFQ2TW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8FLsFLw+kZua0mL5StISNgRw6Hvhp5D1ru2itjlyLZGLxuA2l
	A7DWVShKFbY4MuNMkZ4rOtDakWMGQbKIS4mZ50N3/9PZDbRLAGKwezO7ovl4dKeDuOzlvRi9Feu
	PRd1hamgpIC9Qn6g0DxmiryZVGXsrRQJxOhQyPwNJGJCi3/p8tc6+I4x1dpmRCkf5RwC13EvFqd
	yXGbdB114=
X-Gm-Gg: AY/fxX6LwRxzUHnA39Ud6ZgQiPYTv/lkildfnN0bsJy4dlbU/NCiL8UUENWj8d3IdGY
	WXEpn1skX9SsczobaOiaSTATM9+LjDWIui8CpTuwnreT7fcwkqdADEbg5+Da92JkF0W0HA1mas/
	UKWmIwrOvSrxLoWtxQ5z77FOr+mbR3oWN7EYgGnjH9u+RdnAsf5JRr/PBj5mKEGE0UmJNU4CYoB
	QjjTueEvR3+TZ5JQA4gtx1fijpdjx8igJIpsTneuXcbMORXMwDCsdci1Elsws/rW9qdOjz69fPA
	a2tQekwo91kvBQ4Mc0BOW+y1oHKDcE4sSe8x4bj/1p24nB4QK9hzV+LLS76MOUqUCtSQEfNo/hm
	NWhp21jUDKebE4PIdffdD83/58IEhS84bMjDehwjGt1poZGS5s8cheD3Wqoji
X-Received: by 2002:a05:7022:6886:b0:11d:fc64:9562 with SMTP id a92af1059eb24-121721aabfemr15308106c88.1.1766481260241;
        Tue, 23 Dec 2025 01:14:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEig7H4Sj/NNpGtkeBj3J0vNaMeTY8cvFUplTk03xO27LlR4uZBaFqyfuST076f3uY+IqdPxw==
X-Received: by 2002:a05:7022:6886:b0:11d:fc64:9562 with SMTP id a92af1059eb24-121721aabfemr15308053c88.1.1766481259627;
        Tue, 23 Dec 2025 01:14:19 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254cd77sm56931833c88.14.2025.12.23.01.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:14:19 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 01:13:48 -0800
Subject: [PATCH v3 2/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali CDSP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-knp-remoteproc-v3-2-5b09885c55a5@oss.qualcomm.com>
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
In-Reply-To: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766481257; l=1361;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Y6jOHq4W1u2qm06T2h+sJqsZsHdgNBpFta4hr0KK6gE=;
 b=L7fombA41fBJTWgLYam9k58LNXz3ZFDMLBftWxE+qd8jNjAZcwtGvPbnYJbs/yhdn1BvU2wj5
 nQvU0KE9rNmBz3mz607okeyIRhgg0SNCWNZ69qn/en5yG+3Qe6nErNu
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: lCdGR3tl1YeirpLPXgK2ggX9AgaAWrn6
X-Proofpoint-GUID: lCdGR3tl1YeirpLPXgK2ggX9AgaAWrn6
X-Authority-Analysis: v=2.4 cv=asi/yCZV c=1 sm=1 tr=0 ts=694a5d6d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JO5o7z23AXsBd-kSPjkA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NCBTYWx0ZWRfX0CjbFal9BQuG
 nT7RyvVrPNEOfhb2lbbXhH1QWPvui6KAHQQLXtaTlbGdP1hMpNJABWGQ0nWTOIgw+Kmn80dITFx
 kz2ZvcZZQUjHiR931RRK8D9prJbGUr1k9t8OuFHWWzLe37QhhYjbAv8j1ceC0GQ+vBFsUBDRZiO
 mrD1JMPHXTWz+qZzeAtdfthqzgACXV4Ba0ivIc2rIrJ2iFO8v/Bz1eVuBH1Lei7pTQn8JAHgQz/
 vUAVgK440TTxBXkz7Y8cANk82kub5fylZJDRAIJhg5I9ukRyinbv8/6gtCehmdMn32yfjavNeYL
 hd5RHnQtyvPOgXX/ydv/K/ADK1Ns6b0zPIrtuhuSTYLrrmzhA6MsucGnFKvz2O+N+nxZStp6IAk
 Fzk4TWjKSAEomJpYu70YJSP/eng8345SNJlUJ2JA/3uqGmYL+KBv5HPHoigWpA4x8VPu+JBynGD
 W1XITpW5uadqsrnta0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230074

Add remote processor PAS loader for Kaanapali CDSP processor, compatible
with earlier SM8550 with minor difference: one more sixth "shutdown-ack"
interrupt. It is not compatible with SM8650 because one memory region
"global_sync_mem" is not managed by kernel on Kaanapali so it is removed
in the remoteproc cdsp node.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 31dffd02125a..3b66bd106737 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -35,6 +35,10 @@ properties:
       - items:
           - const: qcom,sm8750-cdsp-pas
           - const: qcom,sm8650-cdsp-pas
+      - items:
+          - enum:
+              - qcom,kaanapali-cdsp-pas
+          - const: qcom,sm8550-cdsp-pas
 
   reg:
     maxItems: 1
@@ -98,6 +102,7 @@ allOf:
           contains:
             enum:
               - qcom,kaanapali-adsp-pas
+              - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
     then:
       properties:

-- 
2.25.1

